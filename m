Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625AFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 07:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJH7Z1Dp+e9H++GfH7ci+SP8WkC627YtXrDnkmjFkdo=; b=nSXbW4w2RTsuxs9fOy71J6daV5
	7wjAhocslQT93tXSqXz9GYoxFvERm+2i+I9FTeSr2cPXg6ULPVE6sxwbiU79eEwGg8nd33kNbN41a
	waFTjSE2+ibIrK7njvCjCDpl/LfQlvnkwFR/PFKVdkI6f3oGi9ffm/iYn6EJYZ5DZnFx+YUv4xNA7
	PT7bLlc77+SW8s9qoiWD1xpOQygBhQijJFYEQzBzoh6fan+MkEeOg//04oQbI5pMoS5oerAGcbeU0
	RFFyEpis/RNlMvKxT/ukHifVqaf/yvxhHOQXC2SpB/kU3IufM+HhElmMvGM7V55qCAAcR3IzlMdP7
	4mJ5eAoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjER-00000001Hq6-0r4a;
	Thu, 09 Jul 2026 07:31:39 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjEC-00000001HmI-2E8t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 07:31:37 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id C79BC138013D;
	Thu,  9 Jul 2026 03:31:23 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 09 Jul 2026 03:31:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1783582283;
	 x=1783589483; bh=wJH7Z1Dp+e9H++GfH7ci+SP8WkC627YtXrDnkmjFkdo=; b=
	EzOVpuKpg1a7PXCDcrJkdzq3ErWeuXXqbhBBSznUDbfl2L0qSGbkoKb+gCLAs+zX
	Rp3Uz6FO56S6ZIvJzVmEQaRT67CtPHVAzTxLW7V+ajY6Dh6TcDakq2U9Uhx2hA2j
	ZqMq5AKhCLwiaxhECjjXI4HH5EVizkbh5BveS5Ee7HD+P30mPHbzRPnekBjLADxz
	tI8N6YcEVYeHbMZ4BfvTSf9hIcDgCCYodUdyEgFzURwBIXIfre8yEN7fRqc8gy1y
	IMtkLEEqldKtSA2KFANss7XGkRvELLyQWT9agZPiXnfGjCvnaXKO1bzkhnKnZEOm
	MZ32rryKiQ2s7kIBn16uVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783582283; x=
	1783589483; bh=wJH7Z1Dp+e9H++GfH7ci+SP8WkC627YtXrDnkmjFkdo=; b=B
	SEzcjLpZ0Q9Dq5//Jsc1DLs+6RcTNNN3eiDVdYwrRQ0f4YuOhqPYobNAnCnnO4cl
	VkuKcU1XkpakuIBUsF/s5O5CxEqTSsczBeNMsAf1tR+gPaiGpoF5rwUVuJeHv23U
	gdFj4PK0M49SpZ09FVKHC/EamJ5OgH1Fwn8xhshTxXnTqr4YuuYVhD4AMvkDK/iX
	pZTWCbo1eEZuq1FewpUSwrlpGhOvc73pw3+OQhODhdsUCSg58uW2lsNq5J0rDoTY
	wGgs9gFxy+EMJ/88cr8kI/39VjD4K3Jyy8gVXIDYEmY4nyxwDZy1zvSyEew49ouE
	q4cM2Z467Kx/H2ZKd8Xeg==
X-ME-Sender: <xms:S05Palsqx2utDPb_sL7dLEa1Jw9j4122EHxK9Di6gbZUx6NHmvV_Jw>
    <xme:S05PajW-D8zRLCh97XdYA3tY4VAjrdKU8foBi-xdBkPpp4y0OT56I2EPXlBBBJjWe
    cUk9ZMnM8mc6xBKB3bIxpVqTgk8ptzSywjBTZb46OFvQKUMVxR9RtI>
X-ME-Received: <xmr:S05PamWrn67P61EbGFwhmRQCg1dB_wwWOjc5WZ9Qmu6zFst7jylPZOQ24U3JB0L0VSakZiFB4352HCBy2US5Zg7IXB_JQQWe0yY>
X-ME-Proxy-Cause: dmFkZTGtcogUzsgGVSIfMmART6Z9XmtSrTIIEh/iBSqj8X1qDc34PC3kbgB7tR/vwLzKVf
    kqvFRO9dmgluv19XwE/AsIwQzOX8oXecvdVPJjjrZr3jnaou2iSke/y82ZyCP3L5qDkakt
    dur3RuUXkCTbrAhoF8QEq0O718G/XzfnJoqPLA6j2kxRHBxF4K/CgEK5IxmHjModRqpExw
    e0X9mprIbHqtSIkWvRcBteaL8/34ubH5hdAhAS2Eb0osfVj0njIZqL54O04DtPszZ5sHbx
    odRhuNJJ6vR5N7Wkl0UhPFlvdKhQKNlTg2ojEls9M+9ySrFL9ygZvOC7z41GE7FKjCrSgj
    e6VSFb/2X7FL9Wj4adPGSfComzXfQke3I5IwQfvuFAkho48fhR/kTPJeJO+zwfrFY58/pl
    4VHf1ecvk0dAcmHZTmMU6+dkbYpylhWQeZTCHIo3qOUEuAn7kWRLcaJkxghoVyBX6FOnFN
    GNqD5kGOn2EtqV7Ia7NrBsZK/x1IrLhFSsIq91LfqMzgrYPWDTu2op0HaOrsyxgE8UG57y
    8PqZQaHG8Ye3O803p1iEBHgUES80vYx9i2s1OnGHJL0BMgw/6KY5/HpjMCFtg2xp60kArv
    V1jcGw1IwfIbk1yhJYoBA51g+gK0pzvyrpcr9BuV5JPTu4m1XHjAjS1hRiKg
X-ME-Proxy: <xmx:S05PauSHt3Hkl8-RheZzvQDzqXjea4Eks_2Bu97yZvwvsYY9MnGy-g>
    <xmx:S05PalENtOl5GguwhXkqbcwMeGnC6PZy39jSuy4bQRdTd8llytdGzw>
    <xmx:S05PauS4dpjMw1sj30m2Kc9jnMVbVsszaOPtUHEkchkXiyY6WQ2kqg>
    <xmx:S05PavrQlgfckmBWYnKFJBPnOXy7_amItGWE0BVX-Sh6hUcCKfM-HQ>
    <xmx:S05Pahu9F5CsRHoqf_pmFIBusi34Q7YtlfKpz1BOFYlu2LuBJVMwhtAd>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Jul 2026 03:31:23 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 09 Jul 2026 09:30:50 +0200
Subject: [PATCH 04/11] dt-bindings: arm: apple: apple,pmgr: Add t6030 and
 t6031 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-apple-t603x-initial-devices-v1-4-55b305833123@jannau.net>
References: <20260709-apple-t603x-initial-devices-v1-0-55b305833123@jannau.net>
In-Reply-To: <20260709-apple-t603x-initial-devices-v1-0-55b305833123@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=900; i=j@jannau.net;
 h=from:subject:message-id; bh=WSOM0YrpA9KfMZMnIRKSb9LSlpwz23GMfezXspvNB/0=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhix/P9sG3esrH808V9aha71f/EPq1RtLYw8r9jC9uCEcW
 hixIepjx0QWBjEuBksxRZYk7ZcdDKtrFGNqH4TBzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNWKaxj+WYYv2ZHy+MfOz7+2Zh6Z9ER049989a0TtaUajdSCvkjGfmP4X9bk+Sh
 N9LDUtme/pyjOP+7FPLdpjuLUfyqqDFp/Z2RW8wEA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_003126_078517_701B44ED 
X-CRM114-Status: UNSURE (   7.82  )
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

The block on Apple M3 Pro, Max and Ultra SoCs is compatible with
"apple,t8103-pmgr". Add "apple,t6030-pmgr" and "apple,t6031-pmgr" as
per-SoC compatibles for M3 Pro and M3 Max and Ultra.
---
 Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
index c67b67ba065a..1d2001836eb4 100644
--- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
+++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
@@ -38,6 +38,8 @@ properties:
       - items:
           - enum:
               - apple,t6020-pmgr
+              - apple,t6030-pmgr
+              - apple,t6031-pmgr
               - apple,t8122-pmgr
           - const: apple,t8103-pmgr
           - const: syscon

-- 
2.54.0


