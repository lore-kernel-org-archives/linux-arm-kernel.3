Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CD6C44506
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 14:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0G6ilPkMy+tyb9WZl7gdzOFKTmLXdAZ+ze/q2dbU/c=; b=qt+3yzqgS8AGR4Hz5OmmZByIbX
	ZiVi4XO3kuZDe5NOMm+demIiyNR69erRqgB2jREyju/fmXSQdl4091xxmDHY9hNzGZw4zS4jb7Ppo
	DOHA5voaNuHJ3A0PScvx3Pc4tkeZC1RvYCBm/Ty1+aSnePBziy+07KLLinu2fSC98ppgwAwtlmW5C
	un4JlI6694XJzuyUX+eu9AP1RH4uXP5oZvUHNQu5RWPTplmBjWIUJHa6c1Wl14JWLvxN1aPKOTmt8
	24pvyh/F7ytUAMXo4+CVDpdLPnxX0mx42qP62IFTmU0xoK5Ep9gpjg+7NTbsc53ZVT81LASZL7Jvy
	gECmXuSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiYFl-00000006asM-312U;
	Sat, 11 Jul 2026 14:00:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiYFZ-00000006akr-1xJo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 14:00:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A93666136D;
	Sat, 11 Jul 2026 14:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C6B1F00ACA;
	Sat, 11 Jul 2026 14:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783778411;
	bh=S0G6ilPkMy+tyb9WZl7gdzOFKTmLXdAZ+ze/q2dbU/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Fd/VIn4c1J8V59LUaGWkWv55Qq+DISlOq2SdFQdsrm7PRTb9acBvD4EFc+GdYonOm
	 Tk2dj34bkwLoCQOwvM8emvJaUVsaJKvXvuvCWGyqOxlZ+rMehkgbs1ywfmqH7QfVSj
	 5by4fAspZSknuhgFRGv8TUfZIgC8gEL6uLFALxGeBzouHY8i/w9aoinw0D6hlkupui
	 4lWEtZkFOSbhekyzSIXpLzmOma5pc9UkFc79hb0E/bXY6fBz1JKjVjS6McQKRulUeV
	 o2j7E5WQt1feEwXv6sVzRZMcCNyjijcCTRUuDlNYx8Wq8pb8wVOG07P5isDAUg+uFz
	 ZJCOLnmmRWUIQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 6ED87601EA; Sat, 11 Jul 2026 22:00:06 +0800 (CST)
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
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 4/7] drivers: staging: media: sunxi: cedrus: add H616 variant
Date: Sat, 11 Jul 2026 21:59:55 +0800
Message-ID: <20260711135959.3616919-5-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260711135959.3616919-1-wens@kernel.org>
References: <20260711135959.3616919-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
currently supported features of the H6, it also includes a VP9 decoder.
Support for VP9 will be added separately.

Add the compatible for the H616 variant, using the H6 variant data.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
Changes since v1:
- Updated commit message on VP9 decoder status
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index bbd186b8035b..ac0217976670 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -696,6 +696,10 @@ static const struct of_device_id cedrus_dt_match[] = {
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


