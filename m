Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3385CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 14:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7EPaE2bHAD0ecNNc0XMu907yYWecMKnydM+hyTx2ZA=; b=hTNYCDtf56hCVFAP/5bni0gYdY
	XFxzofIn5Ac0d13azlpw7ZVMYzA72vQ5rdUQyPXPVbZtGxPh2ANhD7ePqjKLbAVnfA2fZQEVFpOBU
	KcEUkW2o/Dm0o3fjHPugE4dFx4b4Vxgdf9M9e5nUfxl3Qpd72VF8xXD6x9vtciu5vSIhT9eFNbwjm
	xtUv5u64RHN3Lk4cxGHkS4urzUzdMevjwh/RkjBRHDN/zDqu0lj5Uof4dvHCRzXt1DWAl6+Rs1hJu
	RauqQhsiZQ155EZt5sBYI/Z1Kz9KJvBxhIzPkYaDJ9kQezQJbh7ff7bEeYsvdYP91nVHRWL6oK3Qc
	am/rRu7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYbi-0000000HAG0-3EAo;
	Thu, 14 Aug 2025 14:07:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXpc-0000000H1Nr-0xr3
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 Aug 2025 13:17:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=c7EPaE2bHAD0ecNNc0XMu907yYWecMKnydM+hyTx2ZA=; b=qglaXwKbGwumkC1DIqQ4caa3ih
	Oc6BIdd1ac36cl5X4B36b/DlqeekEkpsEoHxsQOZic6kg2ZZFlE4B/5JMY3ZfVNV9ia7/swwRSBmC
	E/pDXpZfwvm6DbiYKPIVhzva6F8hdWPDIvNGI/Pxnp3YRqy+eLjilcbrQh6ZKa5zbuAtHo0UJkcK8
	2zO9ufDxo2sMA7L7Z1yIf2apsaQ7IY8A7aX9vIt8nMcnEHJHGB7UzfHTzP5mXFevmnwN8zXcg+Ikz
	96DL9e8Vsk1wGPrP20IDykeKFJwpM+RlIvLWkZyq0Y/ACHP2jpUCGjdxyzXf1GNRcEVC/m0QRdMS+
	9AwVRIng==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXpY-0000000GODE-01MU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 13:17:22 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-244582738b5so7665555ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 06:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755177438; x=1755782238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7EPaE2bHAD0ecNNc0XMu907yYWecMKnydM+hyTx2ZA=;
        b=HPNbuc3gLriO2JjkM/M14lx+bhkBqHQEq9Xr4B4H0FGBs6M4iyb4If58g04QGUVl16
         8soTgJ5Tzt79cPXxBDDSa2L6fr2Rer5PTBiGFWZIG1xWoDWTS6+K/ljpfAF9qrJk+YPi
         fvH/sq7ISlnTqI2McFArLR0gtd5fuaoUfQ/KTtYKWhC45ETsJdHMNHWY2BTStaHAiQVb
         NU4hRIgTDuHzlRVNa5kRjsqdzHnHUz1qaZfWB7EqaZKyvwPbc0mYlSm0U7RAywYiPFuo
         7sFjLgn1+je7dHmBDA6WWxJjS4trJL+evuRRaFhxRFT7nGqH7eBSVrlukoKVjhdeBdbJ
         SqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755177438; x=1755782238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7EPaE2bHAD0ecNNc0XMu907yYWecMKnydM+hyTx2ZA=;
        b=hUnEJ3MdTTgYiS/JeumHWFNJGesXri+Ioi8sW0NYeUOpk02TFfdZ3dU/SCYDgU2VDt
         mhG8zSGyBmwfdJOzFOmeWe74xK0ACLeqHPr8j59Yc8lQxWZH5sAWNrkV0Ics7MEn5Hkn
         UJkvKqMazP/2caHka2AaAgqxiW5gZ49r16E1xrVz5icuzCds4a4H/mIOV0jlwY25gZqe
         iWy5AMvxeK6zXzAykOOzYr1curgQhKQBcwAGgUEby6fohEVMB/Xe6hJrYHnPbxXXKP/T
         PYjuTXywqSmudLYKMDlURds5s8ht6kPZQmrkWVLSahXeNHhmBO5AKqOWENucFtc24j6E
         M84g==
X-Forwarded-Encrypted: i=1; AJvYcCXPYmfVb3pdMbJNbeat9qCSkbVeB45W5yXhLdgJxhBu5lBxoaQU1e/XKjkKSXkoxBzJaAhQygLyMJ2ipBGvm8kZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyYwIQ6P/Ggm8SfZA6jhtTVDX/NcBiEoGZ725aI9tmYNaU6NT+E
	WFBsjKD1pL3S3Rq4kseOGSaQfUhlD1Rd5gGnTyMVOT9rPZJaJVPPz7Fm
X-Gm-Gg: ASbGncvWqRBtjBvS+iXI7mjaDuLLdr/yCWZ2jOkP4J1JXwLdRiW/NHx0rCGROPGTpS/
	bBlzramWMxoYQ6TuhV113nffvTEF61D6c8sHBVIdZV70PWgiehSfkMG6X/hIg1sxKsvVe2p4GYq
	Sl5eJEi/5BqwS0YygzeW+QTYVva9HZWy6cy5vlrrSSfiv+kV7OfWGkTDl55+y3OtCvZBzfW2n9x
	nOONrLBUYP4Xc0rOaa9k9TqzQMVlxbA5HiSlL9lyF1JEU0JvUqrW/t2cdelv06DHFW/RoXLKpxW
	z7pIdQYUy5BRGWoIn++4elSgrC+Qbrqv9q2AZ85Do6SSDXiHw+pzSe1oLPO9r/S8MKwFLYClTJC
	aAg477ZypQO5XZcFn7vB/VfzYnIUWnlbVB6dP+GamGxFtF7BNAxazqNkoJqi+ZatQRVJtIx+c6S
	gaYEa+yoF/NlE=
X-Google-Smtp-Source: AGHT+IHJTBWuxjynBe00sfTNegD+JzVwhghLenRNVmzvPfO9IQgdbzp+OP9LwO/SXZV/Xcl6IoJ+jQ==
X-Received: by 2002:a17:903:3c2f:b0:240:3e40:43b0 with SMTP id d9443c01a7336-244586c262fmr43696825ad.43.1755177437402;
        Thu, 14 Aug 2025 06:17:17 -0700 (PDT)
Received: from fred-System-Product-Name.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm335652995ad.63.2025.08.14.06.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 06:17:17 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] ARM: dts: aspeed: santabarbara: Enable MCTP for frontend NIC
Date: Thu, 14 Aug 2025 21:16:58 +0800
Message-ID: <20250814131706.1567067-3-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814131706.1567067-1-fredchen.openbmc@gmail.com>
References: <20250814131706.1567067-1-fredchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_141720_120471_CAB22DD7 
X-CRM114-Status: GOOD (  10.53  )
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

Add the mctp-controller property and MCTP node to enable frontend NIC
management via PLDM over MCTP.

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts  | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index 2f5712e9ba9f..ed30f3bf61a4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -1248,8 +1248,16 @@ temperature-sensor@49 {
 };
 
 &i2c11 {
+	multi-master;
+	mctp-controller;
 	status = "okay";
 
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		label = "mb_nic0_mctp";
+	};
+
 	// OCP NIC TEMP
 	temperature-sensor@1f {
 		compatible = "ti,tmp421";
-- 
2.49.0


