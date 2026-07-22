Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2433DC4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 20:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivYBWU5cN/JEQ/dOoSRXx/VTuv2YZc+EvRKHLDz+SQA=; b=s+QLSVT7aTNxghNuTTAOmK3TPD
	LCikGLK4C2b6es2SWn2GnYG3mP3SD88uOBfAVjbklmMrB9feIKb4Pa5qqLlCNvOKJ5TX1mNZQdiVT
	36k7mY2uBOA6+q43yztEq/5KwAxnE0/f1moB8YBD4HBPeUGGnBSW/K/vMim7aDcWCy6KxM2j3bdET
	ciz/SAn1CcgxXcy0+wYRrnfnJe1SzHjnSAx4/C9K/QIhidcd9+dN+ek+6BV4nPmY0w04lq7g/J1bU
	bkpdQURsmwcQAWXEEhE86oqGUKOddAAGQ644/S6+VGcQJQsAN8evN3oQeZoBxV1j1h/StkFoUfmNa
	E3P4Z68A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdO2-0000000Ch3R-05YH;
	Wed, 22 Jul 2026 20:17:50 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdNp-0000000Cgwq-1rBp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 20:17:38 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-6689402c7bfso915496d50.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 13:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784751456; x=1785356256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ivYBWU5cN/JEQ/dOoSRXx/VTuv2YZc+EvRKHLDz+SQA=;
        b=BVcBOqR/Nkd3LdnETL31RB1FswcMkwmPXKmoyU3WXHFbn3XgRZnXucco4VZpbMjagd
         yI/R/IcBGxH7arCcUblaG/HMArjxqdZV1k4VJFtEGTDES1ueydQmN590FeQB54ojMimQ
         mmJq4vggVJmM6wMRtP3LW3a00Wje8sTbXB8Ydg9JERpFv7q/DDLi3xad3l5gQHWdaVUA
         cd8K8eFlj/gTyxuU61Zy77LWppTWAz/WpiI7VII856uLgPIBo7JmhcPDbZi4ym+omatO
         tDvCLVskOQb7ckXr3XD5oLLbMkCVFjl0K2FW8RMHLxO2PaTYhzdLCwhZbkW/kdSUCLvT
         jrgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784751456; x=1785356256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ivYBWU5cN/JEQ/dOoSRXx/VTuv2YZc+EvRKHLDz+SQA=;
        b=sALXxVgBj+zxMDh6hDp+9ZuQjje+smTh/7Sy3dKdl1DiUfOawMSIibfcho52KOpKxD
         M4ILxjD9qf56FcyXTqLxXjEJFekyIV3clo5LrDdNS/QeG6BnnrMfPHk/+xyWgOmI567G
         ndQA5jxcs51zwyFhJLA2lPg0xmeS1LoaMsNcnXVy/EVk5H0bb0iq8RKemRHiMf+BX7HR
         oKGNz+46hYkdvevSIi8OEA2+/Idrdik7KqigwBvPnd+Hl+vO4XsQEMSg9InMVW4QncQQ
         AO8ldf7T7aTIP11yVIESO2FO64Qq8joDMbxo4NzL9arAX56+MIoOJEWujIbORDQJygQg
         +c5Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro7r554ctvFekDI4qgKziJpc8wIL7OOOHdV5dkR18rUBtCwybc3JeDGntyoZNlX0VwheNQmz2bnYXYs7nCXdpvV@lists.infradead.org
X-Gm-Message-State: AOJu0YyO/XZQ/FFlmRpmNjNO/64saeA0ZnNlbDWT0l5cmUPLIQ55sEUo
	nDQfspBNQCexQqhD/bMvtXk0U8OqGLVJRw5jA1Fv0WKWQFAtIpCesDum
X-Gm-Gg: AR+sD10DyKMVDY/MW95lvJQAIh/+pul930VqJ0YMZz6L7OI3D4Zc2f1Mut7KLVF8Jss
	iA0bWIkf4U2vAEddorPvFeTMszUcyatpIDCx2W7lpXkjSmMfO8KMQFiwII7q23beGRpxProWxFa
	Gk7NrmNk4qrUeWnySdlNQUpfhBlClzF/DBf85yKcA5YivHCkRf53VxkEywYKvhM/xaMuUINfG8t
	O+6+pPh/KV9lqO27d7YR/Vbgp1oSz3HXq8T33u3iivk/hyn+BRo2Gzhr66Po8bGYDifW8OyGE1o
	xXhy94yNKvuFbo4aP3lCEPyO/ln2bohioXZwpnusermKKL6tattUMs3mYU8H1tQwHaea/dmq5x6
	D4tv4O3yKHGxOXO8mGTA0oBHT0wp2gy8oP6egvcNVZWWJN4n7/Ao9zrPXtQXED7waBHfFYEHm4N
	lcfTqAp/JaQvWyAN2oKdbmhHpJUUtEjudzO1zp
X-Received: by 2002:a53:b083:0:b0:668:9128:28dd with SMTP id 956f58d0204a3-668a4f87cbfmr21361d50.81.1784751456120;
        Wed, 22 Jul 2026 13:17:36 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6689056dfbasm1958866d50.9.2026.07.22.13.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:17:35 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+
Date: Wed, 22 Jul 2026 16:17:17 -0400
Message-ID: <20260722201717.2205609-4-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722201717.2205609-1-utilityemal77@gmail.com>
References: <20260722201717.2205609-1-utilityemal77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_131737_485630_1E11EBAC 
X-CRM114-Status: GOOD (  11.98  )
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

The X96Q Pro+ TV box has an IR receiver window on the front panel,
wired to the SoC CIR input on PL11.

Enable the CIR receiver in the RTC power domain and mux its RX
signal to PL11.

Tested on an X96 Pro+ with ir-keytable and nec keybindings with
the remote that it came with in the box.

Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index a96927fbdadd..1eaee20acaab 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -266,6 +266,12 @@ reg_dcdc3_323: dcdc3 {
 	};
 };
 
+&r_ir {
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_ir_rx_pin>;
+	status = "okay";
+};
+
 &r_pio {
 /*
  * Specifying the supply would create a circular dependency.
-- 
2.54.0


