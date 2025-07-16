Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A8BC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 17:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wscSEYkzCjiCD1rWTQtpVxiv5OUP/ktmu0maV3XJjck=; b=oj1kb7gONspLM2
	MX1AwNjeZb31zXOx25wDyfCUSp1ZDzuXnb26s4JxHE11jfszsBHq96eqlUSpbBFoElnrQ68xTx/Fc
	CtqOwnXPtLLJOeKej+0fQLiOR9vmSzfZJvwuUcds0iiq+umbcx08I7nyhPQ0cDHCdmoi7+ol1u4st
	uVXt1/LX9KRJk7ePUO8is+iFwf2r0NWxllxIOtxwAdro9gKeYi6YlpHYPUGpdImTSOHZXfjpJw4fN
	k6ATxhJEB/jYzI805QLYnIEYJC7rUVmjdwkuJDy+LNYg4j5BXoIY+jE5w8/Hq5HBJPA7VYor2Pp0k
	0U0RW8R3Vs7RPh0zn/1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc6Kc-00000008Kwc-0jqp;
	Wed, 16 Jul 2025 17:54:14 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc6I8-00000008KdE-3Jin;
	Wed, 16 Jul 2025 17:51:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1752688289; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BzjyxfR2sL5YooFys1hSLwFgV5Sm9FoG0FemtBkXEAKG6I2OnnjyJfGstSzfW3ilq+as3aZXDL9k44vQxPoV14m2DIn9kGr5Jq1eL7eOA9JeBhKnUicozSkdGuCopXHDKdxa1F3R4RVbOQVAVuq1CRwjjETGHEAF+ZrI6uZsUyI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752688289; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wscSEYkzCjiCD1rWTQtpVxiv5OUP/ktmu0maV3XJjck=; 
	b=e6akjULcjCqIES6Ari+sLBGklJ9vm2//Jno+j8er5Jr0x3Pd50LgG1OX1u8VjV67y0Z2Hy5iYUdDu3TZWWVwrybpNt0KGKftml6QDpd4X4f8z+xZs3DMwB9e4PVKbTzP2XWGo8yoGdC1lQblCVrICjOgA1U+KkQG/IdYR+PMwWg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752688289;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=wscSEYkzCjiCD1rWTQtpVxiv5OUP/ktmu0maV3XJjck=;
	b=HhNaNUbBnBFb8CuLSWUr+Vi1iuYcEv0KggRs39ilCf1KeXdIf88cnY6P9OA89O2p
	vu2jmeLf2GMjLjA1TkQEGDOcYmWa0LnwdWWgHueiTOStCV0xsngN4dqtsKCN6GPG5lz
	fMPkE3vJbNPXGSs6enLjmgkkDRDMDGj17yG6GRwg=
Received: by mx.zohomail.com with SMTPS id 1752688286814730.6421951900096;
	Wed, 16 Jul 2025 10:51:26 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v3 0/4] MT8196 CPUFreq Support
Date: Wed, 16 Jul 2025 19:51:21 +0200
Message-Id: <20250716-mt8196-cpufreq-v3-0-d440fb810d7e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJnmd2gC/3XOQQ6CMBAF0KuQrq1pC5TKynsYF20ZpAlQbAvBE
 O5uBRdG4/JP5r+ZBXlwBjwqkwU5mIw3to8hPSRIN7K/ATZVzIgRlpOCUtwFQU8c62GsHdyx4NW
 JU2ApIQrF0uCgNvMGXq57jmtjdMM+REp6wNp2nQll0sMc8Nvm6FVojA/WPbaHJro1/t2eKCYYq
 CIyVZnUnJ61bVuprJPHeGDjJvZJZD8Ei4TWIodCiDzXxTexrusTUdO5+CQBAAA=
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
X-CRM114-CacheID: sfid-20250716_105140_890079_5B424AEF 
X-CRM114-Status: GOOD (  12.40  )
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
Changes in v3:
- bindings: changed title as per angelo's suggestions
- bindings: dropped the fdvfs magic register range
- bindings: dropped redundant description for #performance-domain-cells
- driver: made fdvfs frequency divisor a `#define` instead of part of
  the variant struct
- driver: dropped fdvfs magic check
- driver: reworked performance domain resource offset
- Link to v2: https://lore.kernel.org/r/20250714-mt8196-cpufreq-v2-0-cc85e78855c7@collabora.com

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

 .../cpufreq/mediatek,mt8196-cpufreq-hw.yaml        |  82 +++++++++++++
 drivers/cpufreq/mediatek-cpufreq-hw.c              | 134 +++++++++++++++++----
 2 files changed, 192 insertions(+), 24 deletions(-)
---
base-commit: 4d088c49d1e49e0149aa66908c3e8722af68ed07
change-id: 20250711-mt8196-cpufreq-86d961e2300b

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


