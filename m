Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF89C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 16:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t0chg3P4XqvgAZUIms8Yq5sWYUihi9BDdnPNYfdKkT4=; b=RldM/k8+DTdDkJ
	E5FPr3StsrXyBTxK9+Drj6LYD/TCNSDS7HiFW8iBFB1yHBnka9YkEt/uhzt4bUje9CBjaor3be5P9
	b+xRqbp+ttQr5WpMb256AWnjmBf8QZBL7LipH22Ff2VfkmgruPQg3lVrBvtlfckgoJw54mwdXCmJB
	mSvjzV3LwTlH9uHqBbPZvuNcstvXiMj180SeEvwmWtz7xYSCoIr7QQg7zoQ4TOwh2J4MdEd8/zqj9
	wz+cWh8M25V6JrazLjvfe1228oFJN/4uwWtm5/usUepYvBdCxWWSOMMGd0nyDs9rUfy5HWkHl9woc
	+exrrNadMvGzvznwL6eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGFt-0000000FE7X-35qm;
	Fri, 11 Jul 2025 16:05:45 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFCD-0000000F5Vt-0H9g;
	Fri, 11 Jul 2025 14:57:54 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1752245865; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BKXSQmTRtZE4n/PLG40EzPKN3e2ZCFPV2jt/BgYTlrlobqCUMqYt9hdAOlPNsgpGjPGSrG8izWIOy4L1yb4k7MGlLsYD5keiHPQUIdWp1xDXHTKpjiEJFciYqBjqh7yU5G/YKhfVbMBG5yA2ceRzXJlIJSyW2ZYG944CCpbbCw8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752245865; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=t0chg3P4XqvgAZUIms8Yq5sWYUihi9BDdnPNYfdKkT4=; 
	b=OBlXM7syQnZanUMLqHGxwSEkqXDEB38Obj7ERRSuZ0idi08ZmGycssqqGQ/7wjXWmjUtH8QPNpUUQMSCstJbZD0KjeL4ztqc+9lgp060KH/hjS4SRFuBR95SULi/XmSqn64KyEyhoOpV8jrLk2hBvge7FRzkQSu4lh2hTAeeUYc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752245865;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=t0chg3P4XqvgAZUIms8Yq5sWYUihi9BDdnPNYfdKkT4=;
	b=Ejmyyd4r2PfMQXooQj/iEZ7wQ49PnjK4PrYSt8mit6FbtiEgEIUj16e+FcwdRN5E
	ukMbsM6eWIwnMgA7xGah1DRYgBMgoS4z/IYJu8tge1Sbqm1co/WvJG3ewqir8VfsutB
	G29v0IV6azuNyNKIer6rI3MBCjioGglFyK1weBWs=
Received: by mx.zohomail.com with SMTPS id 1752245863784678.2744682613209;
	Fri, 11 Jul 2025 07:57:43 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH 0/5] MT8196 CPUFreq Support
Date: Fri, 11 Jul 2025 16:57:32 +0200
Message-Id: <20250711-mt8196-cpufreq-v1-0-e1b0a3b4ac61@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFwmcWgC/zWMQQqDMBBFrxJm3YEkpal6leJC41hnkahJLIJ49
 w6VLt/nv3dApsSUoVEHJPpw5jkKmJsCP3XxTciDMFhtH/ppDIZSmdqhX7Yx0YqVG2pnyN617kG
 kJdHI+y/4ai+W2ybdco3Qd5nQzyFwaVSkveC/De15fgFkX5LDkQAAAA==
X-Change-ID: 20250711-mt8196-cpufreq-86d961e2300b
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Hector Yuan <hector.yuan@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_075753_171028_0A853BBA 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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
Nicolas Frattaroli (5):
      dt-bindings: mfd: syscon: Add mt8196 fdvfs syscons
      dt-bindings: cpufreq: mediatek-hw: add mt8196 cpufreq binding
      cpufreq: mediatek-hw: Refactor match data into struct
      cpufreq: mediatek-hw: Separate per-domain and per-instance data
      cpufreq: mediatek-hw: Add support for MT8196

 .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |  64 +++++++++-
 Documentation/devicetree/bindings/mfd/syscon.yaml  |   4 +
 drivers/cpufreq/mediatek-cpufreq-hw.c              | 140 +++++++++++++++++----
 3 files changed, 184 insertions(+), 24 deletions(-)
---
base-commit: 42f78243e0c6fe42f2710f98513a55c102347ff0
change-id: 20250711-mt8196-cpufreq-86d961e2300b

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


