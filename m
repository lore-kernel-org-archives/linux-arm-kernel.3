Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831F3D58E47
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 04:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g9G7fxfmzVlIi5Fr50mSQN2bdN4kcLFoj1561/FSzpQ=; b=u+qbLeHlDJHeNSS0mM+Wa9m9C+
	BYQf5HPY0xpFBx7MSz1uL/FYa+87GZg5iLPdUTWM9H3czFAkydbuhU/NhXT/521hKqu887UeIZia8
	KAMHAaBgB3Jf60wRxmpbdYVBLvOPboy5LzWCtLEKVev7id5KUXXLNhHRIvg6WyqQGTL9BWrg8M9O8
	J/3bR1bNP6C5E1E3diBd4no5mNjuoddrE5YIddvaFoZnNSVrPYLuJu2jUIIceFeWmYLgJQzYh3gJH
	NPmay1/cy1QylRj53J0RbKl0vZ65pkM3rJYbD9FPp0v0XoWHnerqsZU350v2/hppbsDsfEw004ck3
	l7+vg97w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwuld-0000000CFXh-34pB;
	Mon, 02 Mar 2026 04:20:25 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwulb-0000000CFXD-0ZaO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 04:20:24 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3597c40a838so496593a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 20:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772425222; x=1773030022; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g9G7fxfmzVlIi5Fr50mSQN2bdN4kcLFoj1561/FSzpQ=;
        b=NbUpKGthNCIQN+7yk+mjpPcSrAYeS5tkHkAq58GS8F7ff/BQyYwzcsKbDwEA7b8KJN
         srvzHpG0L4V2TdaUQuIf/wymqGCFNduGGnztZ/fFxVCqQIBzrMNehJG8tTElAVKF63Ga
         /IGcD2MK1tMbJsFfBGaPcXkgbxgqMiJtUyqAjPusCV6HX/BEKK7rFvcv9HC+lYJsVipW
         DCkywXKo1bmoHeCTOaqHPvbmEMnwiBf2h8qg0TNN0mwshcHHRf0ONdd6Yfdhg2t6vd53
         3p8rK8XZXevkuF4ApWPSWRub3ubUpQIxqzQAHmpsPDkv5eXxBYsllO8G2ycVqc7g7euh
         bkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772425222; x=1773030022;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9G7fxfmzVlIi5Fr50mSQN2bdN4kcLFoj1561/FSzpQ=;
        b=MUoShhVKvx7HBeIJmdn9FvkvCDQG72U9jXLNppf6OhL7mIqHIhe+yzPJ065bnl9MBW
         wqUo7vgKx4ubBylN7Htx5vPmfKIKDHTyXQc90V3RO0tkTYPYpYw/WyoVFvLWstOoRzH3
         ulTu3pQspi/gZA+ZYz61HVBmfNW32vvLDcShhDGme2GMEO07V6RQq5F6IMhXytqyYLNC
         /RcD0QERoM2Pt8kejiqSCj/vailz22W4eJ/u/9xJj5EtFz+ONqNoRshA7wDWu/28rPsL
         OE62Xt2v3D+SND8vQJb6mDHmxWFFdtXc5UvSzvcBdBcF7gfgktOGounZwKuHR8emEDzU
         1I2g==
X-Forwarded-Encrypted: i=1; AJvYcCWTqfGM3bdskDy82AzOa2bRmaLv32J4eiYDLjpt68EM+UQG23ugTewJPd4yRU27UyCNUwI0vQwos0gYyXe1JkP+@lists.infradead.org
X-Gm-Message-State: AOJu0YyAy7edjMFc59CNww7qgiNfY7QxKfDW9jBJ4li894SdyJmm3JAl
	xX3Us1DP//S8vH1AJOfN25JlD25T1OZGrKauf05HycycybPPr4qasVUU
X-Gm-Gg: ATEYQzyw2vPqfEi8qRT/WN7vmVriVmXJjmY3he7OhuVGuLUeKhveJUNm7o5IHPSa1vH
	NtG0C32oFeVJDoq/AEbAwqgOH0iJcgJeLtI62p3iTQ+CkpJt3WjNLtbtzPyqx1fSEryYlRYQyja
	rFftpZY4urjYys/4lV8UEluoDY/s2x8roisOu93Virbx0CMCyAKp12pI8Hm4FXn1NySErglybW5
	unyAVCdjFBPhJhk3KhdstYC1Ea2XnS8oa/Vd3olJPbS5/Y80TXj5G+ea7VjPApoviJJy4HnoGUv
	+BHeequltOWqmjjsCiVIXgkJigDPAwaSDbny8YjqmNpWLCgHqIwsqp4dgLeeKNyP4qnw35VY3Kd
	ZCt1Cx3gOD8lz4u0r35BC2Bszra9Z+sepSFT4FIcMa7pVNF7f8dY8b9bCJSmRwkwoQSCraKZ37I
	HywBL5RTZmaJW9E0KO4V98i41hJgWSMA==
X-Received: by 2002:a17:90b:3d10:b0:359:9083:3661 with SMTP id 98e67ed59e1d1-3599083392fmr961910a91.15.1772425221617;
        Sun, 01 Mar 2026 20:20:21 -0800 (PST)
Received: from [127.0.1.1] ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3593ddd737fsm16355794a91.13.2026.03.01.20.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 20:20:21 -0800 (PST)
From: Colin Huang <u8813345@gmail.com>
Date: Mon, 02 Mar 2026 12:20:01 +0800
Subject: [PATCH] ARM: dts: aspeed: anacapa: Add eeprom device node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-add-new-eeprom-node-v1-1-2bcf87bc22e4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPEPpWkC/x3MOwqAMBBF0a3I1A7EKP62IhbBPHUKE0lABcneD
 ZanuPeliCCINBYvBVwSxbuMqixo2Y3bwGKzSSvdqlppNtayw83AGfzBzltw1xutTLc0/VBTLs+
 AVZ7/Os0pfVqL4pZlAAAA
X-Change-ID: 20260302-add-new-eeprom-node-78a20a7c4893
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772425219; l=1109;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=5gILMaGdI1v5nQ4lLFzK5CdL3aZ4jAwq3TDemRpn7yM=;
 b=Lu2BNkUYsAir1qaAPj6PiWZAitwbLnlXMKIMJchEYxY5pYd47YiouzudhsnMoLL/B+oVJfW5Q
 D+kdN8Sb79fDEG51sYs3sXbU8apew5tWFmTKD+DKi5JRdpkhfM5znsa
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_202023_185229_DC1C2C20 
X-CRM114-Status: GOOD (  10.37  )
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

eeprom address changed (0x50 to 0x51) in DCSCM rev D
To support previous rev (B/C) and rev D,
add eeprom device node for DCSCM rev D.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
DCSCM rev D changed the eeprom address from 0x50 t0 0x51
To support previous rev(B/C) and rev D.
add new eeprom node for devscm rev d.
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 2cb7bd128d24..680108b00664 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -586,6 +586,11 @@ eeprom@50 {
 		reg = <0x50>;
 	};
 
+	eeprom@51 {
+		compatible = "atmel,24c128";
+		reg = <0x51>;
+	};
+
 	// BSM FRU
 	eeprom@56 {
 		compatible = "atmel,24c64";

---
base-commit: 710dbb13377c80a6e39ef049a517665841e3221e
change-id: 20260302-add-new-eeprom-node-78a20a7c4893

Best regards,
-- 
Colin Huang <u8813345@gmail.com>


