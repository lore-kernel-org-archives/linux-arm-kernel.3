Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A86CC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 15:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NnLAnFwCqMFlG/o/7EF1TFc96QCA+EgXe00U5MXSsXk=; b=RIqjMw5lPaVu7ysP2kJHcGJ0i8
	iXZTOhZbtAfNWNTCRps5oZ20FaSxXaefmApNaG3PLMwAp5LptPqW4nAZ0N9ryc8UhAwWkziWxMPpM
	LnqH7jvrrEwP6GJY445kAxee9FqgUiU+JxG51Qx7okjKcphFholIjAixStYEutvQcgZHgGBRaGWwS
	F8DXhzDFDxvglvoLz8m/uNw3ZLnh7v3kd3jL7yxoK+lrMMFLtIi/ZS0y2EurUhWmn9VkMpU6uCUXf
	7R+kx13Z17t8bj9MWFl81SSyUEB18dJd3iWEM+65T4c1qXwYIyt8jSHyH1Dey7i6Ji98NnhF0bTL/
	S0YlYdfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUMP-0000000HV89-0uho;
	Wed, 08 Jul 2026 15:38:53 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUMJ-0000000HUzg-177x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 15:38:48 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47dec32798aso860376f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 08:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1783525125; x=1784129925; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NnLAnFwCqMFlG/o/7EF1TFc96QCA+EgXe00U5MXSsXk=;
        b=IgZNImnwdomZa/RkV+NotmywIoPO3aKTCutkK0De6WpYrRBxH6l6Fw58auVL8p6KVC
         HvviTTRoL7oPnScwYGFRhuLF4U+sqetjZ71I7ruu3mFxflD3L2Ff2oJ8LfDF7qXZdcVZ
         WRuSVshAUhWooj6QfG8eguRDxMUMKwVhU05rZQepfI3oG3VlDGMW6Yv4jDWBKd76Y8A7
         8GSVU2d/Xk15yAA88Gmcdm7ggkPE9M2Y1V1kxypQ4lQx7qna6aAcaVze3Hwl+0sXApOu
         AIs912mltsVBov+qTccchLNGEDgreMRjjJsGCFKrL4CJJxh9FngujPZYOKGRnVPONQCx
         jCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525125; x=1784129925;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NnLAnFwCqMFlG/o/7EF1TFc96QCA+EgXe00U5MXSsXk=;
        b=p4zuN0f0qnPYGSEvgR4bHS2zIBwLlTFlDgOBGnh2E7QfKt2w396xHWDrz0cQmXNfvG
         mUVO3m5MRiT+gDctwcXtSICK8WijHA8k1HDJBzIyJNprtJgnXwu9gW5y9GamffJlrDDR
         UMzRM0UhHYQQM12ggFfKlG8ptUnk6YolOxqP09Rh8VCXPW9JXFT3gecl6HZg2kkNaick
         KrqYjQEq1Pb3UoUWR+P3CxN+rYtxrSDREunJS+ATroOphN/ZyJy4DCUNigKSc3Pm0qdL
         i4Dt413qO12CmOZ33FPTMSAYYEoSNNLQwahMfAsjv3Ui9sbY2fEheaUSXr4SagUgprLB
         BihA==
X-Forwarded-Encrypted: i=1; AHgh+Rqid2T/Dm3gc36l4ZOTv2od7Mmf4z1iJDgIaY7xsXb+0e/x6TF2Mt9+Ow4nD5d8zPrKGhc+IPanklqxta62MR2X@lists.infradead.org
X-Gm-Message-State: AOJu0YzowZbMdamK5alApgpARzVJiHoYFFjQSi4zm7dua1bl3PzQixnj
	LEFPY7mR6TUWjdAG/Sakk/WiPJLa9cacPs4sv9mmwJjLW7Azxl5b/ANZ7l8z+7gYw+k=
X-Gm-Gg: AfdE7cmE2CqBowjtO4AvtJET4zOPvupJKV6ST6i6C/Hdq/dtxls7ObEiH6FZBB48ii8
	j58/1riI8IDd4YcTkx0R2++rMhqC/Y1rwnEF0TZWQyxcVFCLq07BYFnU8XbN/CS05mjhoe+/b8x
	PNxH4f/esE8FZbQnpBhhaIfFzkpXENo40cgzrqCfer3t4fAKbRb8CqnjAEEwWXacZ20Fts0iGLZ
	vC4D/HpZDNlRJ6YQ51ZnAiRkaVfy13Vujo61XDKiWj92uBPCrZFPyfYtOMH+5ctMOvQ9JembflT
	CYaKt7bK7XD6p1AuoXQIUztjrcJURSCaw8X8j7ZkSTDrcXMD/q2mI6ppV70ssUXSbBhShKwgWIu
	4XizPvuY66vQ6PILFhtxz1y/GJfeU6zKYQJB+b/cO8cBtOVinuPY/SaJ63hINyO/+ZJ6F+6Cs6u
	/f5qrFyn9Cg0i8u/PuGRMBMx3m00xPRW7zCa9MQeaPOKihT87idEuO1o9E1p3549AjDe7DNNUWv
	r4FnPVyDoViQ5H+gQeD6C76odZoUk7XfuecTT4=
X-Received: by 2002:a05:6000:220c:b0:470:3edf:e28e with SMTP id ffacd0b85a97d-47df074e230mr4140001f8f.10.1783525125665;
        Wed, 08 Jul 2026 08:38:45 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm44254136f8f.15.2026.07.08.08.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:38:45 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	linux-serial@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v4 7/7] ARM: dts: aspeed: g6: add aspeed,vuart-over-pci prop to vuart3 and 4
Date: Wed,  8 Jul 2026 15:35:59 +0000
Message-ID: <39091b1d0c716da3502a691d0a0bdb7621693cf5.1783524645.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783524645.git.gregoire.layet@9elements.com>
References: <cover.1783524645.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_083847_330381_7D3D5E63 
X-CRM114-Status: GOOD (  10.04  )
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

The VUART 3 and 4 are VUART over PCI.
Set this flag to indicate this information.
Also set the syscon phandle.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 7c02633f2bd6..2b51749300f8 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -722,7 +722,9 @@ vuart3: serial@1e787800 {
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&syscon ASPEED_CLK_APB2>;
+				syscon = <&syscon>;
 				no-loopback-test;
+				aspeed,vuart-over-pci;
 				status = "disabled";
 			};
 
@@ -742,7 +744,9 @@ vuart4: serial@1e788800 {
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&syscon ASPEED_CLK_APB2>;
+				syscon = <&syscon>;
 				no-loopback-test;
+				aspeed,vuart-over-pci;
 				status = "disabled";
 			};
 
-- 
2.54.0


