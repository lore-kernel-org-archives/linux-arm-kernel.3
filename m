Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB24CEF99DD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 20:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yx0VRNq5dduoSnuTw7h1g52ze2s67tKC08M37qr4o9c=; b=yn4H3mLLzx2afZ7L+CJS/oPFMr
	9Ati2bqTdUiQx4Hsz0N7e90ws9rVvht54a+v28XZFjg6WA3uMxSKp7L6PQe+wEyXLI0m+e5EWyXgg
	jy3xx5wvJZvhN/71tWZyWp4qXrG06tLym7gahEDvz0PTrAt1PDW02SfQ/EVR/wUmADwnt0dFeHotR
	fEFeoSEWDY8K7eDVOfk7xjCW4zqXpmBTBWVlmUgD7XRpt538T7WM1nEPZQAQZVhm6w0C63hcMTLjS
	BY40g0icWxnrBgRem1XdsBT0/uvcWK1fiOaX9fiOYxdk8+LDoIaCw8zQibv4vgdM78yKG8COug9fo
	o8DChs+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqzUd-00000003shi-1UlJ;
	Fri, 13 Feb 2026 20:10:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqzUZ-00000003shG-2M25;
	Fri, 13 Feb 2026 20:10:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E3E3943C51;
	Fri, 13 Feb 2026 20:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 250C5C116C6;
	Fri, 13 Feb 2026 20:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771013417;
	bh=pVof8kYi5TBM1veFEGpbU5buAtwo0G0WsbuQoPnTTdA=;
	h=From:Date:Subject:To:Cc:From;
	b=bSv/TQgTtYNg04mDsZBq5U9hEOQkr09Dkl2lmbH+XIdU+VIOtPTDbBHo81pZqskpy
	 WI5TD4GknYX1uNu5WPjeNkRcFxeF+7p9SOgKBWhRIO6CR/jWiO8L8mPgt8/e4+w5DA
	 IoaspK03KkoRcfvmfPnF8WlUz8sdQbcgQYZ0mC61YikCC2/W708qlXSPctWv8qP7qY
	 8SdySELTd+eBxAebjL0OdGvC0w67974T2giFn4Pm80Bx0zd2al8kvCTuuxyYCw3cGX
	 k/4uslX7qFOxFXzhjxZhe6pMdVeBtLGTsNAnry90RYvOExggXdrc1Z1LLJ+gUiwSy+
	 D5lopHupfApsg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 13 Feb 2026 15:10:06 -0500
Subject: [PATCH] media: rockchip: Disable VIDEO_ROCKCHIP_VDEC when compile
 testing for Hexagon
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-media-disable-rockchip-vdec-hexagon-v1-1-3f903398cc83@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNyw6CMBBG4Vchs3YSqArRVzEs2ukvHS+FtEpIC
 O9u1eW3OWeljKTIdK5WSpg16xgLml1FEmwcwOqLydSmrU2z5ye8WvaarXuA0yh3CTrx7CEcsNh
 hjAzXdnLozMnIkUppSrjq8rtc+r/z290gr2+atu0D3JQphYcAAAA=
X-Change-ID: 20260213-media-disable-rockchip-vdec-hexagon-eb67c47292c5
To: Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Brian Cain <bcain@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hexagon@vger.kernel.org, llvm@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1338; i=nathan@kernel.org;
 h=from:subject:message-id; bh=pVof8kYi5TBM1veFEGpbU5buAtwo0G0WsbuQoPnTTdA=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJn9rWrexu3C+xVWM38NO2R3ZN6a4ulBmfEX5/r+Vzr3Z
 u23iW+VOkpZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEoj0Y/odlaYq8zJlgdLyK
 9/WC7xdzCjNKBcU1DVPjpX9Ildiuf8zIcOv6vcv22SHzfnCzt7N+vl+58277upbbyUu2PQ3bfeR
 jJDsA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_121020_266523_F894A0A6 
X-CRM114-Status: UNSURE (   8.30  )
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

Building rkvdec-vdpu383-h264.c can take a few hours to finish building
with Clang 20.1.0 or newer when compile testing for Hexagon. While this
is further investigated and understood on the LLVM side [1], disable
CONFIG_VIDEO_ROCKCHIP_VDEC when compile testing for Hexagon.

Link: https://github.com/llvm/llvm-project/issues/178535 [1]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/media/platform/rockchip/rkvdec/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/Kconfig b/drivers/media/platform/rockchip/rkvdec/Kconfig
index 5f3bdd848a2c..d03689464206 100644
--- a/drivers/media/platform/rockchip/rkvdec/Kconfig
+++ b/drivers/media/platform/rockchip/rkvdec/Kconfig
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 config VIDEO_ROCKCHIP_VDEC
 	tristate "Rockchip Video Decoder driver"
-	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	# !HEXAGON: https://github.com/llvm/llvm-project/issues/178535
+	depends on ARCH_ROCKCHIP || (COMPILE_TEST && !HEXAGON)
 	depends on VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEOBUF2_DMA_CONTIG

---
base-commit: c824345288d11e269ce41b36c105715bc2286050
change-id: 20260213-media-disable-rockchip-vdec-hexagon-eb67c47292c5

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


