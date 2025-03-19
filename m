Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A32AC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 17:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hlvFZ7mJmXGztCrB9tJtvEfBnNtJllCq8zyvSsEbwU=; b=nl9Q9jSuWViJAxeoAEJiQHCsg1
	XnhbtF8my0rpF31+R0OOf0PCbJ/dHM4HVwB4MStXoWhNE4N87N5tfzNfaRlVavPVdQHgXwyE55CAt
	hTWgtgjnC5BASh2fqH88MqmYSPe3dk/d+IUF+wejdI2o/bUudzjNFhdEnZMTU9Fuje8JMz3bFH0Am
	5P5bdloSyQy/f6ivuLzYGdYv/GD/j2c5GNEnm9VcAjX5w1h0dxvGKV1NzWziTfPQyT59hQAie9j0o
	OfOUNnuE/aeBcQoe1Cz1ybTIabzH4kR4mXO5Lf0zK210r0yObSOAPloyT7Z+EidQyZBEEEFcYXkh3
	lkpx/uOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuwnr-00000009cnc-0hvh;
	Wed, 19 Mar 2025 17:02:03 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuwcJ-00000009auF-2cFa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 16:50:08 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-30185d00446so1543503a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 09:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742403007; x=1743007807; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hlvFZ7mJmXGztCrB9tJtvEfBnNtJllCq8zyvSsEbwU=;
        b=gD3KXDlE4SMfCB/HP9AVPheVG120SMnDizRjMgh22TokOvFof+F7HX98dBEwtNA5EL
         M6w67SnPxSALUKNM/I/B1wrc7J/ttoJizWrSiI8Kc3QJziuiFoC8QE+Z92LIdQr7jeFS
         g3fBfzjPLzSG8smua0JOVh/F7gXKP3SliPyFnxfZXoBoJcVvQO7xi4bCibofS5l9E2um
         BfDLNlDHNQaRq2u6Vf/qpEdDXJSgArcgCuX2suw013xZxWPopys7VZ+s80L05EPHdsW5
         D+U53GXZLVkzwaKOvC0oG45+idAqjX+QzseZWY+Upp0CdPC6MtihUbPUZP4yhCWCkgb5
         eJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742403007; x=1743007807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hlvFZ7mJmXGztCrB9tJtvEfBnNtJllCq8zyvSsEbwU=;
        b=GAX9TnSEnAi9TmhIG+XDzERjyWkHgNx/Qxwmy1A1FDoKrMAVRrNc5umaHMWVjzbspn
         KTLhVP1d0oBbwYNj/DdHKeNAPd1V6o37BFN9VckCJe7Zp5z/G+b/EL8s5Vz261cLDz21
         L3ns+ypPyROKS203FkQM9sdaKHfTP31GQ3+Ha1fvHq9hvL+enT/vv39PT9y3JGPmFzDX
         AsXoA204+8x+00s73ip81CloU3pbt5isHRwaLJM2VNjEYFvWFswb2fV1apm2bvhh2YS+
         vIORYqFLenZwlmP2fz3/RZRG93KL71Cgtokb3GbCQ5OC68hCmj7N7sH/aMPlFBAF6BuZ
         ss2g==
X-Forwarded-Encrypted: i=1; AJvYcCW9ilYRiuCgaJyTF+17rr56K0NDzAWgvSTIX8Btj2lBgWQ+xkD7Y602nnye92SRYWFqNdi6vrtlNnZHpBE/9lHL@lists.infradead.org
X-Gm-Message-State: AOJu0Yze1zdfDuD6W6EnZQmQCtQE3E5vGD6Kg/vcqOxGRPfjHqifsvYf
	joZYjRTJO8tJ7FctsLOc+JnvgdyY8edTeylOQOJZj2j4yTvxc8TD
X-Gm-Gg: ASbGnctCUigt4iHdRe6mLmNbeQZ7H3T5iARWY+IWTwh+iNW7QtgysjLFaT70f7hAuJu
	r3yar6I+3AFqKzITwe9ipeEilQ+H/pwmbN+bhQry5ETCWjbdgc9FrauEM0xIAcPwrR6yL5ipKV4
	ZEqex78wGVGT53xvbpd8b/3tFiHOGgQoekX5KIOLAtAtAjG0ZFUsVUz3PL1GYK4Oe/aDn3icyqs
	ZuONg4iW9IRDMYGbX6IoErhYm2nacf5xO4mKcMAubckRFPU3nXwUuVjFwIGDr52qevGncRKjaKf
	7WeWEsXS7JAdtgZDX1V65oJ8ruUOEpHXIGuW6Iy20QnNsZ4OOOCWLzm6uhRdlhBZUZDTl01flux
	MXFVJJ+n5FzrWMUVl3KH6cg==
X-Google-Smtp-Source: AGHT+IGtqikS9EAzHW75N6WWgahv90tvLMFLTPMgePX/nxiz4HcBVay/Xc5zfuHq3w1gvckMkZ6jTw==
X-Received: by 2002:a17:90a:d2cb:b0:2fa:42f3:e3e4 with SMTP id 98e67ed59e1d1-301d426aa83mr319281a91.3.1742403006734;
        Wed, 19 Mar 2025 09:50:06 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf576bc2sm1863641a91.5.2025.03.19.09.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 09:50:06 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 20 Mar 2025 00:47:27 +0800
Subject: [PATCH v4 6/8] ARM: dts: aspeed: catalina: Add second source HSC
 node support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-potin-catalina-dts-update-20250102-v4-6-7c34b8139014@gmail.com>
References: <20250320-potin-catalina-dts-update-20250102-v4-0-7c34b8139014@gmail.com>
In-Reply-To: <20250320-potin-catalina-dts-update-20250102-v4-0-7c34b8139014@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742402988; l=979;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=EmGOWWjDA0fpNSOealsYbgx+a6lgY/GG4Rr46Ji+D/c=;
 b=LM3piKFik6LqjhP+loPzjTwCLNJ3u41AW30F1XD5GbKl2D+juoRBF/cT2O2koL5Efx0o0WRzx
 TbVnsGq7dT1B/g1284v3Q1rAdRyBJNRqQsKv6JiychDpyuECfJWwylY
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_095007_665216_CCE971F7 
X-CRM114-Status: GOOD (  11.25  )
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

Add device tree nodes for the XDP710 Hot-Swap Controller (HSC) to support
the Power Distribution Board (PDB) with a second-source configuration.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index e11be815a6af..fb4b236d36c0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -622,6 +622,14 @@ i2c1mux0ch4: i2c@4 {
 			#size-cells = <0>;
 			reg = <0x4>;
 
+			power-monitor@13 {
+				compatible = "infineon,xdp710";
+				reg = <0x13>;
+			};
+			power-monitor@1c {
+				compatible = "infineon,xdp710";
+				reg = <0x1c>;
+			};
 			power-monitor@42 {
 				compatible = "lltc,ltc4287";
 				reg = <0x42>;

-- 
2.31.1


