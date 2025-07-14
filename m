Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C53C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 15:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4enJ+FUcyrsek9i62JQgGkkGMLGdyoOHqn7yVutegJQ=; b=Vm8+YR70U49D+S
	FTQyQJVXQt9KjVrXS+FM6eul10D7RAokOii0Lbn+jHCI/wGw2XtF+PLAfSRPFMKLGbTKTR4vEiRN1
	NFUHN5FgXxHmAMgeSAttRbjNl1pK89KDEgtIVdG2C46vA6VbD0XKKaY04U8kF5b4ecTWXFNm/fKjK
	b+FrTY0QElUgZOfrsKHvt+0+zUfjicUPf3KQwJt4KYP6LTQ5XzHo5FeDURC7enk15ADbHUCOUV2nM
	Cq8DMEXEq8mEy5+LWzJFBdVi6m5ujlWqzTEGIhLqQl9RG9DfF5ixPa+lOkrEE10c0/p+Mbq65M/1V
	eo5zS5mAbJScBVLjJePQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKn4-00000002ZIz-3yvU;
	Mon, 14 Jul 2025 15:08:26 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJrI-00000002QHR-04SG;
	Mon, 14 Jul 2025 14:08:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1752502113; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=isFHrMBvNV2bj1Umer9yVPRNpy9byQsWJMwa1C+2rh98ZgJ+TOGyXF7chB4W7PyrBKSg52TOY3mOKm0ujaLe9Ctc7jL6VUifuuQa6K/oaZHB55ZY4YOTEBTY7+1VUCv+VGH8A8tuPX1SbZbJLNC6589xu64h6+CwcbeE2w0Z2Ik=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752502113; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4enJ+FUcyrsek9i62JQgGkkGMLGdyoOHqn7yVutegJQ=; 
	b=gWSdNNNe5QyHlQJy7ENFYoAeH8fVaBG9Ru3taDUGh3Tt+VaTG/OwA7HRCiGJWZKQvYwsrZnoqVwqd5Dsxk2jMdMka/pDmmRix3LhT766Zvph7x5GMFq5YxVJWGNwlw+ao2PMsaluFVgt2HaYzaKzC/RFp7wFh7ty0Hoq81pDvuA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752502113;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=4enJ+FUcyrsek9i62JQgGkkGMLGdyoOHqn7yVutegJQ=;
	b=HIOJx1ie34UXkUT/sJJDncuOWRfy8Jd+rEnzybLTRsOGiZfPIHJ25yBCdVMGu495
	kFnWcPxnkW8hgnqY6ES+1sEWMBS2agb9ECGQEbL07TME62CDPYBelSuEPqNYkN/846b
	6TSHllXEP3SrGjzDc4UHXegA/sMhTElfEeJZdsrM=
Received: by mx.zohomail.com with SMTPS id 1752502108974683.0687269745556;
	Mon, 14 Jul 2025 07:08:28 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v2 0/4] MT8196 CPUFreq Support
Date: Mon, 14 Jul 2025 16:08:13 +0200
Message-Id: <20250714-mt8196-cpufreq-v2-0-cc85e78855c7@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE0PdWgC/3WOQQ6CMBBFr0JmbU2nKAIr72FYtGWQJkCxLQRDu
 LsV4tLl/5n3/qzgyRnyUCYrOJqNN3aIQZwS0K0cnsRMHTMILq78hsj6kGORMT1OjaMXy7O6yJB
 EyrmCCI2OGrPswkd15Hg2RW84SlDSE9O2700ok4GWwH5u+AKt8cG69/7QjDvxb3tGxhmh4jJVF
 6kzvGvbdVJZJ89xAKpt2z6xL5So4QAAAA==
X-Change-ID: 20250711-mt8196-cpufreq-86d961e2300b
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_070844_135724_B98D0371 
X-CRM114-Status: GOOD (  11.87  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series adds the necessary bindings and driver changes to integrate
MT8196 CPUFreq into the existing mediatek-cpufreq-hw driver. This
necessitated two preparatory cleanup patches to the driver.

The CPU frequency was verified to actually be changing by comparing
sysbench cpu numbers between fdvfs being enabled and it not being
enabled.

Enablement in the DT will be done once the MT8196 DT lands, so don't be
surprised that no node uses these new compatibles so far.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Changes in v2:
- Split off mt8196-cpufreq-hw into a new binding.
- Made the fdvfs register regions part of the cpufreq "performance"
  node, instead of using syscons for this.
- Adjusted the driver to iomap those, and use the per-variant struct to
  add an offset for the domains index.
- Link to v1: https://lore.kernel.org/r/20250711-mt8196-cpufreq-v1-0-e1b0a3b4ac61@collabora.com

---
Nicolas Frattaroli (4):
      dt-bindings: cpufreq: Add mediatek,mt8196-cpufreq-hw binding
      cpufreq: mediatek-hw: Refactor match data into struct
      cpufreq: mediatek-hw: Separate per-domain and per-instance data
      cpufreq: mediatek-hw: Add support for MT8196

 .../cpufreq/mediatek,mt8196-cpufreq-hw.yaml        |  86 +++++++++++++
 drivers/cpufreq/mediatek-cpufreq-hw.c              | 139 +++++++++++++++++----
 2 files changed, 200 insertions(+), 25 deletions(-)
---
base-commit: 42f78243e0c6fe42f2710f98513a55c102347ff0
change-id: 20250711-mt8196-cpufreq-86d961e2300b

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


