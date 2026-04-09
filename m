Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA99F364BA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 21:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oe/MTWFayud1NY0YJxHA7yEna0urTSnBL7K+MSPYxmI=; b=uQIQKXAjsdT0WEPKX7/ETSKVUz
	n0f1Cz1wPTg0UXcCWUSnIjsK2sMAqpjXDfuIVpD2ledHTiYRn7/conBT+oHS97Y4/fj3r59KoG58s
	FNRNoYucfhsDQ/BlmIuUvpODvkFdENibK7dosflOA/oGuWMRoy5Vc/8yxRj6b7+AmF4hwOWo6Lnpl
	/HdqFm4s8ujZGLm19YeVvAammR8PVp3ZLX+QyUCOujy3SytxhA+DTGF5KtK/0DLzy/FzelhBu+sxX
	ramNyadcmYIdCac6Om/9jUSE9YrTjHTsZZin1TkYBC17aWTcX+jovQGy+kc2cP+5kRsfqwphmAkgg
	XUXjS0uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAwmW-0000000BE9p-2Zta;
	Thu, 09 Apr 2026 21:19:20 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAwmR-0000000BE6Z-3WLn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 21:19:16 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43cf73bbfbdso827425f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 14:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775769554; x=1776374354; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oe/MTWFayud1NY0YJxHA7yEna0urTSnBL7K+MSPYxmI=;
        b=FxTxJdEitnKTpbf4e5IKvwCtIOk/Rryxi//7bx0v5ocL/jmTUY39UrbzPYoOUxgMvz
         hGtVuzyQkz9IajR26/ztcNM9pE9a2pGDwehbSuOl+xxRvGP/1Ypf9jifT1fdkO8A146J
         uMfXoLZOtWz1goKdULVUiT+bjfWv9BDl90sugrXFcoo8fl2gO7XhDNotE2VPv01UWGCu
         vEBc6jAX5FHvJ1sGaPgWIoKbiIlB1Zeudf6EJKAsZWMvt0RWxQEtm7C0ssX4WTtLUME1
         xeVaB9UxmOVyY7f4qDNGjgMQ1rdt9V5hOZBthmdPSDyQN2Q3d1Uf44rrmsDFYJmp1Xf5
         q2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775769554; x=1776374354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Oe/MTWFayud1NY0YJxHA7yEna0urTSnBL7K+MSPYxmI=;
        b=ZAzoXD15zkyKLAylJusqKDuY+JRCjPepiO12JsDeFgqVHvse83xuK1EoTnqPCUB2H8
         isMPhfjRpjEMxumq+XatsFAFtIjS8rE4hzcm8Y5kHvKEV3lzX1YZIXza7b9rV/i/ONsh
         pshjBSdKh17hkfHeKOUy5UND0dawhpnXIvvnImvVRmH+1SELl62wwPrxWN2u35UjZS9w
         Kq1GueXPxSFDXBlijnS2VOrOmL7lP44yIbxXvOGKW/nYt02VFrCZqu04uMeFi+O4f2vy
         Nt3VK1Ddgk0nogJW9DEOaBEVOFsBuCs0tkIm4xaExPwkgqxXrwuBTte/klgbgLadKMRd
         VFMQ==
X-Gm-Message-State: AOJu0YxXtGHuO6T9GF4EPj8IubN4nxXyJTs4J9KiLt2Oj6ym3LTKz6lO
	CqTNao0ewDrjc4PkdBTexsuiXO/9n3IUgg2YcPm4y/+I3yeH5DnwUZbD
X-Gm-Gg: AeBDietVONLc7nkrPEMJAFr7fapDSanQzSmH7MuuLxYfrtH/sirBTS8Wj/D4PzvGwDh
	i/ThfSHgb8+DdnTODse7xHHne75CGCcyd+ojLjb9KZvk2geqgpE5padCI/2LKKrQuKkmUXnBeCX
	RM6ID4PFZG3UjmwYFqRbg9imq0IlBK+k1SdDAh5nOZCIRJGaZCzEUQhUHHwVqes2vSU7Tvvu5rH
	Fiq6zrZ8X9nnkPN5IoYQ4YoGYMzDU21yhd3mlrT9y7o4E6n4I6RgHEIAvDCQCWR2kacYnlLWtcS
	eNxYpXGdXN6Jl+o18+aG32PtUi0mnjge4YJ74lFqvzmnZN8w/3ouX02OYSH86hPTQ/JOcGooIdR
	j/lstkONgLGE6gSqpokdc/P+wxVJiaugR6LZcomDQI+8HqgDWXOh9UtGqfBQvEvP2oxpgck8aN8
	uCT0rbdJ/ncxnc53Uy45NZnontV0BO/S/OQ/ngEFWA+ahpVnq7bRDE3BsIOXQIJs+lj0H8VBsmu
	3uH7xWHCAxxVCFspQPU+ls=
X-Received: by 2002:a05:6000:24c2:b0:43b:8f30:39bb with SMTP id ffacd0b85a97d-43d642ab9a7mr780950f8f.24.1775769553762;
        Thu, 09 Apr 2026 14:19:13 -0700 (PDT)
Received: from [127.0.1.1] (93-140-227-38.adsl.net.t-com.hr. [93.140.227.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2a53sm1797536f8f.5.2026.04.09.14.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:19:13 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Thu, 09 Apr 2026 23:17:26 +0200
Subject: [PATCH 3/4] arm64: dts: marvell: pxa1908: Add PSCI function IDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260409-cprime-dt-fixes-v6-20-v1-3-8df6f88942c8@dujemihanovic.xyz>
References: <20260409-cprime-dt-fixes-v6-20-v1-0-8df6f88942c8@dujemihanovic.xyz>
In-Reply-To: <20260409-cprime-dt-fixes-v6-20-v1-0-8df6f88942c8@dujemihanovic.xyz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Karel Balej <balejk@matfyz.cz>, 
 David Wronek <david@mainlining.org>, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=855; i=duje@dujemihanovic.xyz;
 s=20260328; h=from:subject:message-id;
 bh=MMbB9YOuhqaE8RLCQwY45AbWteQXOQalzkmQpnFItKA=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGDJviJ/ecbjQ9/faCaqFghxca78cPM0b9DRBf8q00s0CA
 nvSG73tOkpZGMS4GGTFFFmYl8pd4ksNn+hQZJsEM4eVCWQIAxenAExE+g4jw+OfC2tVnzFktjBf
 MI2tb/QtNL51YcJZI5+trcutJsskyzIyrJJ6IDcpqujYk3sOs46dTNlgs2TxPH11aQnfvNa+Yx1
 HuQA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_141915_914036_244D3CCC 
X-CRM114-Status: GOOD (  12.34  )
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

Add function IDs for CPU_ON and CPU_OFF from vendor kernel source. This
is done for completeness and to allow PSCI to work on the occasion that
the DT is used with an ancient kernel.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
index 5778bfdb8567..91022b62a39b 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
@@ -55,8 +55,11 @@ pmu {
 	};
 
 	psci {
-		compatible = "arm,psci-0.2";
+		compatible = "arm,psci-0.2", "arm,psci";
 		method = "smc";
+
+		cpu_off = <0x85000001>;
+		cpu_on = <0x85000002>;
 	};
 
 	reserved-memory {

-- 
2.53.0


