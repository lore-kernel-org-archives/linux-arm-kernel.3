Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F64CA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 18:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wY0ppPAZSs1jsS2/VNGUZBFu80zBzZfLXtPwdAUISaQ=; b=HKBErp+unWX2n7Dbk9VeaPNprL
	odSw/hHKlyD2hZRZMjw9nRrkcpyzW8CWzGzWGzlZXGvq7vtOq+VPcqvUbRluvWpwTSYmJErM4EGuA
	ZlbLkw3CD4bHCAi9iJQzHxqzLZKNgbg4Z+uC0pTs2Z5LtW2Q+6oGAnXHuNGBySLPgDT2yRa1brMwi
	25KCHmRD34FktTBWVXyw42LSH85v9eGYvazxD2AbtuUvUm8N54kewxtkPgwIZsmrxVk6v5uwyZ/R1
	2r3RyHtVGtluR45Pg+XWKUXB++FHUR0hmLuLtQfdMySi6jXFPxiMqtHn9B+C9K6ev2AWACavy8c8Z
	oVOY6YwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFyaZ-00000009JLR-22uF;
	Sun, 11 Oct 2026 18:48:03 +0000
Received: from mail.nozomi.space ([139.162.184.125])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFyaX-00000009JKf-0VXb;
	Sun, 11 Oct 2026 18:48:02 +0000
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791744479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wY0ppPAZSs1jsS2/VNGUZBFu80zBzZfLXtPwdAUISaQ=;
	b=dWwTa3BDqT16TIP6e83lNQFR79CtfGZmUceJZKR0SQWjIjG6rUKd+IYMERFIFB/4SSacoA
	zWLRzGo3DJf6c+Js1NB+5Cxr7/2+z2T+RJStqaUh4JpZF1cBokyF1V0kZiddPbmJtkStF9
	zPKTO0rxY8GxwMh14TVINAtq2a33BCI54yUY2uxOR5vZrNGWHqTTjFsR9ansP+B9P/+e2B
	+OkUQ365IsPqX+w3OibfpFbhbSmRPtU1tDJrHAEgqdodTKFz21i+muRRwIGZqi3KRqVcd3
	QtyJSf+JppH91Bay4YPnGQRAayW9WxS3WTuScEIhAkiVg9Jca6/oNGgYjL/uSA==
To: ulfh@kernel.org,
	angelogioacchino.delregno@collabora.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
Subject: [PATCH v2 0/4] pmdomain: mediatek: Enable the GPU timestamp counter on MT8188
Date: Sun, 11 Oct 2026 20:47:51 +0200
Message-ID: <20261011184755.2058017-1-michal@nozomi.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_114801_329279_87CB6F2B 
X-CRM114-Status: GOOD (  10.85  )
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

On MT8188 the GPU timestamp counter reads zero until a register in the
MFGCFG block feeds it the SoC system timer, and MFGCFG loses that
setting whenever the MFG1 power domain is turned off. As a result, the
SYSTEM_TIMESTAMP query and the timestamps written by GPU jobs are always
zero, which breaks timestamp queries in userspace drivers.

v1 restored the register from panfrost through a new mediatek,mfgcfg
phandle on the GPU node. As Krzysztof pointed out, the register is lost
by the power domain, so v2 restores it there instead: the power
controller lists MFGCFG in access-controllers and writes the register
every time MFG1 has been powered on.

Patch 4 converts mt8188.dtsi from the deprecated per-domain
mediatek,infracfg phandles to access-controllers. A devicetree with it
needs the driver changes of patches 2 and 3, because older kernels
expect exactly one access controller on MT8188 and fail to probe the
power controller otherwise. Older devicetrees keep working with the new
driver, without the timestamp.

MT8370 uses the MT8188 power controller and mt8188.dtsi, so it is
covered as well.

Tested on the Lenovo Chromebook Duet (MT8188): the timestamp counts at
13 MHz, also after suspend and resume.

Changes in v2:
- Restore the register from the MFG1 power domain instead of panfrost,
  and drop the GPU phandle (Krzysztof).
- Drop the panfrost patch, which makes the review comments about error
  propagation and MT8370 moot.

v1: https://lore.kernel.org/all/20261003200132.866240-1-michal@nozomi.space/

Michał Kopeć (4):
  dt-bindings: power: mediatek: Add the MT8188 access controllers
  pmdomain: mediatek: Restore a register after powering a domain on
  pmdomain: mediatek: mt8188: Enable the GPU timestamp counter
  arm64: dts: mediatek: mt8188: Use access-controllers in the power
    controller

 .../power/mediatek,power-controller.yaml      | 16 +++++++++++++-
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 22 +------------------
 drivers/pmdomain/mediatek/mt8188-pm-domains.h | 16 +++++++++++++-
 drivers/pmdomain/mediatek/mtk-pm-domains.c    | 19 ++++++++++++++++
 drivers/pmdomain/mediatek/mtk-pm-domains.h    | 15 +++++++++++++
 5 files changed, 65 insertions(+), 23 deletions(-)

-- 
2.56.0


