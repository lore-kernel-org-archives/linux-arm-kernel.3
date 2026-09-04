Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52A7C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 09:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xN3oFt0Y2IcujH1DIfbY1diyGBQXYknSa0KCk1kgoTY=; b=1gqPBx8ONSysqCPBm9qVMtUdbC
	da0ZtRawc1mF4VYsDAtGcfyKB7LtiHbvF7v0F/o3xsSdpLkEpZOm5AJDzbYV0Z+FqPZfuHWf09x9L
	NGfyfK/MJvOcnmQH4tV9dsnHWzrdtQZ2NpyXLIq/qhR66YVYlx5vAN8jRQiSM9mxXWJSsDUMFXvau
	TefME7DZqtkgTFUs6y8BQivXTQjWRu/8yL9s3YhaJuEH0n6iIdH1rXZb27WZVVnFusKSr4ixAoSwK
	/XbmCiB+zAxZJA85tFklXUypgQSqk+oM9E25cvU0KoB86hqj7P8XQh6OdoOyRigAV7Kx9glr2LX2c
	6+zexPJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Pt3-00000001Tr8-0DHQ;
	Fri, 04 Sep 2026 09:07:05 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Psz-00000001TqL-3pZp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 09:07:03 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1788512814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xN3oFt0Y2IcujH1DIfbY1diyGBQXYknSa0KCk1kgoTY=;
	b=WHrPmDgKRLot/ajyWVqGI2TnujNsYmC+yXxif15HSpN61jqKi2Z0yiYpLsvGGwE01Y0jDO
	Q1XgKDWWv//DucrFXEe4+/a3041XWylvD94ceRA3pD/BTiDzsDqKGziS0Fgh1WFgS+vc3W
	EdjbjyOqKshI+jjBXlijkA2g+cgLsMI=
Date: Fri, 04 Sep 2026 11:06:52 +0200
Subject: [PATCH] tty: serial: samsung: Fix S5L on Apple A18 Pro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-apple-s5l-a18-pro-v1-1-4995312062ad@cyberchaos.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTtJWwtBr2JcDPgDYwg0HTUmh
 Ltbdfkt3tvIkBVG52qjjJearkuBP1TUT7KMYL0VU3ChcScXWVKawVbPLL7llFeuh9Ad4SUiCpU
 uZQz6/j0v17/t2d3RP74j2vcPuWaEuXUAAAA=
X-Change-ID: 20260904-apple-s5l-a18-pro-5f2b3e1a4e4a
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_020702_173570_BD1827C8 
X-CRM114-Status: UNSURE (   8.90  )
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

The UCON BIT(10) is set on boot on the S5L serials on Apple Silicon Macs
of all generations and old iPhones [1]. It's unknown what it does
exactly, but on the MacBook Neo (A18 Pro / T8140 SoC) clearing this bit
breaks the uart and leads to garbled data in both directions.
Add it to the APPLE_S5L_UCON_MASK to prevent it being cleared.

Link[1]: https://oftc.catirclogs.org/asahi-dev/2026-07-24#35537011
Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 include/linux/serial_s3c.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/serial_s3c.h b/include/linux/serial_s3c.h
index f54cb6e23f85..1732bc9240ff 100644
--- a/include/linux/serial_s3c.h
+++ b/include/linux/serial_s3c.h
@@ -247,10 +247,12 @@
 				 S5PV210_UFCON_RXTRIG4)
 
 #define APPLE_S5L_UCON_RXTO_ENA			9
+#define APPLE_S5L_UCON_UNK			10
 #define APPLE_S5L_UCON_RXTO_LEGACY_ENA		11
 #define APPLE_S5L_UCON_RXTHRESH_ENA		12
 #define APPLE_S5L_UCON_TXTHRESH_ENA		13
 #define APPLE_S5L_UCON_RXTO_ENA_MSK		BIT(APPLE_S5L_UCON_RXTO_ENA)
+#define APPLE_S5L_UCON_UNK_MSK			BIT(APPLE_S5L_UCON_UNK)
 #define APPLE_S5L_UCON_RXTO_LEGACY_ENA_MSK	BIT(APPLE_S5L_UCON_RXTO_LEGACY_ENA)
 #define APPLE_S5L_UCON_RXTHRESH_ENA_MSK		BIT(APPLE_S5L_UCON_RXTHRESH_ENA)
 #define APPLE_S5L_UCON_TXTHRESH_ENA_MSK		BIT(APPLE_S5L_UCON_TXTHRESH_ENA)
@@ -259,6 +261,7 @@
 					 S3C2410_UCON_RXIRQMODE | \
 					 S3C2410_UCON_RXFIFO_TOI)
 #define APPLE_S5L_UCON_MASK		(APPLE_S5L_UCON_RXTO_ENA_MSK | \
+					 APPLE_S5L_UCON_UNK_MSK | \
 					 APPLE_S5L_UCON_RXTO_LEGACY_ENA_MSK | \
 					 APPLE_S5L_UCON_RXTHRESH_ENA_MSK | \
 					 APPLE_S5L_UCON_TXTHRESH_ENA_MSK)

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260904-apple-s5l-a18-pro-5f2b3e1a4e4a

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>


