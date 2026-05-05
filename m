Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C45CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 13:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNPUWyZqyjMPgjuXNxihjO/YkYddOiR2agKG3NMh+d0=; b=IhfI6I1dPHj1BJydkj586CcPSS
	qxPpPr4cVLso1+/wdXk5ByhH3WeV2MrLd20YYlibooFKdj0TKRaPPIfcHZyISKnJcwBZJAJsAafM0
	NuAu4mw1nEJuyALT2VrdfvRCz3EvEbm5+AkdMsYh8GhRDtpDR57lkBowgLG1WbIe3KQx0H0hfhJzS
	us/cvGJvwo8P/Wig1f2ITaEn+pScItkJStpq6lx+uOUqFmgLCk/p3C+q+HqEXErk00d0ujPuCGdFl
	KIAWzHTpy9OKKRXy0Nchq+DDhbA7Mz7hxdM+y5rsGr7DCXH4XcY7ccsnZuesm5Gk6oI4Eg3MToBHZ
	egGBVGdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKG8O-0000000GNUG-371m;
	Tue, 05 May 2026 13:48:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKG8M-0000000GNS4-2ijd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 13:48:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D7E07446F5;
	Tue,  5 May 2026 13:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94034C2BCFB;
	Tue,  5 May 2026 13:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777988901;
	bh=xF1jTvN4NvmVxS1I/epYbue7pIXNESPdSRtLfleCD1w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ijx1lBqNPEMBLP0Ay/ZHh/p1+vm09mTq5rbpTTL9e2SRWmgOk+2cdAYU55l+2+gqM
	 x4KLqdokMk/QJS9+kE1wTYVOhNr9I5aGoBIQr7sV+HIfGCkKRh9Tiu++nD4BPtIm5+
	 WZXtCvLPinyKtuiUkmxEbmb314GQC9bz7FnacDyNkAorkQHPJeLN6VCIcKd5b8IS4K
	 CeQjNyyfQjV3aSm5B2s2r7c8fXQTIuxDS1gpUeHOYpX+iw3TAxLTAbAS0aVoxRMNSQ
	 BH4FZyY1dlC5dA3hTbmWjJ6/ij4SZKsJvCOqIWRP44mVoIsgJVvDUYyYXI01NBj5o0
	 N61zew6Me6/sw==
Received: by wens.tw (Postfix, from userid 1000)
	id 539755FFCE; Tue, 05 May 2026 21:48:19 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] drivers: staging: media: sunxi: cedrus: add H616 variant
Date: Tue,  5 May 2026 21:48:08 +0800
Message-ID: <20260505134812.408316-5-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505134812.408316-1-wens@kernel.org>
References: <20260505134812.408316-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_064822_707443_2C3922F0 
X-CRM114-Status: GOOD (  15.41  )
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

The Allwinner H616 SoC has a video engine hardware block like the one
found on previous generations such as the H6. In addition to the
currently supported features of the H6, it is also supposed to include
a VP9 decoder. However software support for this is currently missing
and still needs to be reverse engineered from the vendor BSP.

Add the compatible for the H616 variant, using the H6 variant data.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index ee0e286add67..2801b9a064bd 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -695,6 +695,10 @@ static const struct of_device_id cedrus_dt_match[] = {
 		.compatible = "allwinner,sun50i-h6-video-engine",
 		.data = &sun50i_h6_cedrus_variant,
 	},
+	{
+		.compatible = "allwinner,sun50i-h616-video-engine",
+		.data = &sun50i_h6_cedrus_variant,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, cedrus_dt_match);
-- 
2.47.3


