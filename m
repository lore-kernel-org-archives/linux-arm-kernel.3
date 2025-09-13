Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65BBCAC593
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 21:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3eQWTLa8qf+9saHeA5hbj7RQD5lII0deY9ii6lAlos=; b=CXjZrFBKbB54AcApcsfquec6+e
	9q9QMnl2hVL6vTPGvxOA16nAZ0gxpgh/C30lA+alV4HUsT4M2mm5vynrljeylcg5E57edTxGLyjeQ
	8h6LPFgE/q+euJjlIA3X+fUNxQVY8cVfROnF6LLvh3eKaKjKdB9qflhg0ojXQ1AhPeyJ30xjD4gIT
	xqG03gfGEY26ImSWxNz+dHjTHWfTP3+zCmG52ZoloKMyjoMmpZMt+B3XH/+3vgNm6iUCHeM+qFN63
	em2WjkFBR8Zn+UwhmJBAJuCMlLdHlb0BmOhf26Pzsa9OyWf1VlQ76Kr7OPBaJgKS0uGFJPvV6+tcr
	7BtV4KGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXgk-0000000GJXC-0fWv;
	Sat, 13 Sep 2025 21:21:42 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXgc-0000000GJPw-1kyq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 21:21:35 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3e8ef75b146so356443f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 14:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757798493; x=1758403293; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V3eQWTLa8qf+9saHeA5hbj7RQD5lII0deY9ii6lAlos=;
        b=AqnPK/IR3yb9DBtWuDefw6SAvcJqhAlKz69rqcyswKiRpCNsLa4X/GPv9gRrgxizsE
         4atlty+0JetyAFBHrW3lmxQN3feCWgjuGNfNVbgcvp4H+wUS/wqSoCBK+zah0n4EvrKT
         B9undoutg96e3G81Gv+Xtumv+Sval4+gerkSjiFmw9Sh2kYkl5y8jR4uSl+YpAutolcs
         gc0Pet3mryy954+NXCza9ZaU8231mR8DmQblMkzk+3Fm8zTzq9wMwD0Z8ejKfziUao7K
         pKSBiA45AVBmrSI971PLq9FMDGOMdy/qZEljmyMbafAfMkicXqjOcYyNP6+hx3DMeg0+
         RjOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757798493; x=1758403293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3eQWTLa8qf+9saHeA5hbj7RQD5lII0deY9ii6lAlos=;
        b=t9lZYuyJfpm+ohDQVAFGfBU/Tewfi8QD5vkL5eTTz2xYUaDIY673IJw+58K2Lp6QVy
         GZ4c6o4wv6yfxtwfOGCCDhl1SpeeikgXmHpwu5ZAz1EPfbQTVhjxmsn7ys1zQKh0pEaC
         LbJ0/uU02E6kVgD9PiAHVA0rUUb5EcN57OFXrjV6dBqxRwXoTcHk6vpqPrKjDSgEC1R8
         84krF4xwa7az2KF94dKUDkNbvm+9mY6GVh026YaZ8UZ6XiXYtEhoh7dmluofGc38GLo4
         Zl3kRKFGDxMdQroFQG+Gqo293ulhFvtH42+BFUZ50q1Q5Fn0G7jfKQD2b7DB5qnPhQ+G
         KSmg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ3OcEFZYawKNUq6YGGKVsIa+nXeVvqEtv6RP8X70oViyKWV5GUS9+Yw+fSBd4crPaL+FAFGYd4HgaG3eD7LSe@lists.infradead.org
X-Gm-Message-State: AOJu0YwiMTJXB91Mcqe2V2grU9Vh758QRjs3vmhHBdq4jcVoOj3j8aiU
	wszW8uODQMVOiL1MckfA6iAqtaOVcLlSRMzuPTHpWNUuICOyWGyP0/eu
X-Gm-Gg: ASbGncsakVCaqbg/GBZENomBtUy32Ue9VbUb6yawSPeLLcr31K2SDhEGrnfQu91EF1j
	5fUk9nHdbC4rihHw8aWlg5fltuo5ZzPgJ7PHYKNLPU4/cpsVV3/CrLZfiTmQnxRyVNadsAvRJTL
	tzOoRmWUiKbugT133EEeYBUdW0VQT/iR0TRxcyxcBD5cL/FsDRy7AWdZgM9agv0QJ0PBlcMO9yk
	lXlKgCxrZ7Q5LfZEQRorLA2WNyQwEoUHgn5BANye9w31ddOUQcYMVaj2SIGD4jCP9RJD8AVSvHj
	1Mna8wSc9DQd9uUoiSMGBLhiyyIpV5xAarkRsm5rb/zOsLuVm7s9iZxuH02/JAI4Vx+NwcHez68
	c+CuCgTT/oIvWSw3Gz5mxZmV3He/8psoqGYepvLgiytlyU6VFYz4f
X-Google-Smtp-Source: AGHT+IHr8CiMYGUEeTiKYHRRsxQhLO6JbPn2EeOKGS5jqS2eJuGZcBJj8fDG+9B8XtOlMfD63jhKQA==
X-Received: by 2002:a05:6000:250f:b0:3da:936b:95cf with SMTP id ffacd0b85a97d-3e7657a93b4mr7806706f8f.28.1757798492558;
        Sat, 13 Sep 2025 14:21:32 -0700 (PDT)
Received: from Radijator.localdomain ([93.140.65.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd6absm11576842f8f.34.2025.09.13.14.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 14:21:31 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Sat, 13 Sep 2025 23:21:06 +0200
Subject: [PATCH RESEND 4/9] arm64: dts: marvell: pxa1908: Add PWMs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250913-pxa1908-dts-v1-4-8120cdc969b8@dujemihanovic.xyz>
References: <20250913-pxa1908-dts-v1-0-8120cdc969b8@dujemihanovic.xyz>
In-Reply-To: <20250913-pxa1908-dts-v1-0-8120cdc969b8@dujemihanovic.xyz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=6njTuJu0UcIU1bHrsjDWk5PZ/WvBeIzNhePT57xOd78=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBlHH/j/9Wlu0tA/HS04WXhf9ekl35iYE3dVPO9++9LNc
 NlCRpaKjlIWBjEuBlkxRZbc/47XeD+LbN2evcwAZg4rE8gQBi5OAZjIgxOMDEs7c44qKm/1nBH6
 4K9KyWyzKecW3JK8+My2/cC297a8Z18x/BXezh6Wsd3N7UmozX/JKU4zAhUM+Qoyj+vnp7ZzeUs
 sZAAA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_142134_472694_61C8D3C6 
X-CRM114-Status: UNSURE (   9.36  )
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

From: Duje Mihanović <duje@dujemihanovic.xyz>

The SoC has 4 onboard PWMs. Add a node for each of them.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
index cf2b9109688ce560eec8a1397251ead68d78a239..61498fd75d1dcaf0d068943c1ac14d3e5a7ca9ae 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
@@ -195,6 +195,38 @@ gpio@100 {
 				};
 			};
 
+			pwm0: pwm@1a000 {
+				compatible = "marvell,pxa250-pwm";
+				reg = <0x1a000 0x10>;
+				clocks = <&apbc PXA1908_CLK_PWM0>;
+				#pwm-cells = <1>;
+				status = "disabled";
+			};
+
+			pwm1: pwm@1a400 {
+				compatible = "marvell,pxa250-pwm";
+				reg = <0x1a400 0x10>;
+				clocks = <&apbc PXA1908_CLK_PWM1>;
+				#pwm-cells = <1>;
+				status = "disabled";
+			};
+
+			pwm2: pwm@1a800 {
+				compatible = "marvell,pxa250-pwm";
+				reg = <0x1a800 0x10>;
+				clocks = <&apbc PXA1908_CLK_PWM2>;
+				#pwm-cells = <1>;
+				status = "disabled";
+			};
+
+			pwm3: pwm@1ac00 {
+				compatible = "marvell,pxa250-pwm";
+				reg = <0x1ac00 0x10>;
+				clocks = <&apbc PXA1908_CLK_PWM3>;
+				#pwm-cells = <1>;
+				status = "disabled";
+			};
+
 			pmx: pinmux@1e000 {
 				compatible = "marvell,pxa1908-padconf", "pinconf-single";
 				reg = <0x1e000 0x330>;

-- 
2.51.0


