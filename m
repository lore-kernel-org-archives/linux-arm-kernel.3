Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301D4C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 13:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4soDR+0gZiqt37Lbe4DFFhbgclQyHpPTsvSalKhA+JQ=; b=ghsGqAS5Hy3sZMLY+3btxMFslc
	qsgGMSOcQiqcgryfIUfVctDqPriTVWmzmZF7JfoTuWwCxmxqLdC2D2xs02DdzNA0dGJmtiXyXDL6t
	88RKVySLuDV7X2g80KXf2vG9Uxa8eRdBcoT2GkQecSHgisjBecOzD1UjjfuY4gJ4An0gW95757QgY
	WqhVXarymLrWVZufUrkdV1VNc6mThr3QNYPIdjvVy49FaLA4RryTWFOuysARQ0LED1nsVivlmEsnS
	0GasWB9UmMfPYhVhf03v5M56Deu/ZOifH7AFmpCzpgqWDRLR7NzlMgjjToA0XAZFmP46+IruUdgbY
	ufqlNONQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZN1-00000006vn1-3FpF;
	Mon, 07 Sep 2026 13:26:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZMx-00000006vjN-2W9b
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Sep 2026 13:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4soDR+0gZiqt37Lbe4DFFhbgclQyHpPTsvSalKhA+JQ=; b=oRO8GFA/84mA+acR+R175RXSWt
	SOp3ZZxe6ImElTHICYCvd4PjIwYhotfCyQ4Rbvtj46byqwYdUoP+XvPKniAK62um999SOMDju8Gqc
	5fKbTNoxK+D497DDrnMS6UW5r7OH9AZVb9/z0u7875R4Rk5QNWIhsFxWDBQzZPUfk5JqGf7XZZ7Fw
	0CFb/gUW/whrocY28kBHIHsSlwLpVG2mEFO2Wku6T1tiswT6UnIfmrHWA6uFkXWbtS2Mx6ifd16yX
	dTKHgXM5H7dkpHIQIBgb0LelIU3cFy8jn4UD9mJHwatbSlTzPbRybnl6JeyxZkOrNQKwWfSHLstZr
	fGx7owdQ==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3ZMt-0000000GHBf-07Mj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 13:26:40 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c259e5c22ffso203405466b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 06:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1788787597; x=1789392397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4soDR+0gZiqt37Lbe4DFFhbgclQyHpPTsvSalKhA+JQ=;
        b=VaVYVjJZWUHWGBI+kd+p1jVOL/1shcegHU36nyJmDoaQNAKyK0BOasyO6dZH56hQV9
         gQzcr8omvSh8UvePQ0o4CNy2TNNqq518nNT0Wbp2T1ZSdL+x7pa/yKFgiKL0Eqggg/ti
         j4N531TMUwd9+PGQP1PNJaSoy9tT/9ExudOqyev6TOuhJyxUl87Vd1GxDs8FfDS+fj7t
         hf33iShmmQSMVhrXRuR6Eh9jfONdGSbHlAKDfNlR6VOFnMA7cLHbhbkeQFLGbAKzQcUb
         +9Nh3jzR/n2QNg2Zy5drHEYltWLhsqXs5QcoXWcFlNCujfWye2JoHMc0QzaM1bQFANYz
         0O+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787597; x=1789392397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4soDR+0gZiqt37Lbe4DFFhbgclQyHpPTsvSalKhA+JQ=;
        b=DAuTuLMi+f+nXA+WKis8ssvi4ZzU1iItZs5Ih+U1MUW3IWZq5PRBhbRhH9f14J0sW7
         5XQOG+KH3FC9FCgitgpLmxRiw/w3ZPVIHln8iivckrF3G6I6ua8q8I4hklDLMdP9+qVZ
         Qny8eACSIUBIHWfqECbMxZl9S42wOgVIA7GMnp9lE/PZri/I98C83+9wh6FUurJJfZ3P
         Uav1DsnowBCU/XjWKpDBXf1ugcwhlNzvtrYviPGabIIZ0lf8pd5deoro9kf5uB4qyr9v
         6NeweRMbu8nhJRNGRMBjPOEYlPemw6cKG7q6gMQg2BspQyIRXniNKlOFI75L5L3ZCq10
         3dVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHlBfeZS72IezztDheve1fiH01GMkjTMnJ9kvPfVeTj/NGhfbVUPadx1cfEqPoz/4BipPJt/EcD7yHB43o2+76@lists.infradead.org
X-Gm-Message-State: AFuF++ltobHp9dhnquyPJS4buiG92Iid0jGYGZ9HTZFvpwe8wDNpQfyl
	IcJs6Mv3bMQ82Eh9TA5W4R3c977CJ1n7V6TTJvf7mfXl+IMB4s0LZAozvro0DwYI7E0=
X-Gm-Gg: AYBFou3xFi7dJFkDnAXFEH3DINeh11ZApPEsPpkUCS5ru87ngYI86nbij2WT5KHHmBl
	U1YpxLpYgvYRihE+k3T39H12P0LtTHuC1gzbbMj7yLaxA3pXjTZUa/xz4cGUpW+SEewIO64Weel
	5C2EKFAo93GBOuL4mStiINSCb4bejXZAmGQlJ6lzu3Qgk+bZz2QGGexKERDzLiPNDEAM2vUpe/M
	HzH711fxZUqpSCZGZ9tCH0MIH9alVjDgOGnvjxyQzvE93Jbfy0eqrhqAMVBiBxvuFcorCYGyGM2
	xmTaz++GnaKpxfS63Lonc/0mUBWwI2UULgfdVnEE3FWERtsOtGzJBnS8zoMLxYXiIDrrXWHsf7H
	ujR1QkEd4Zq/Z+PtY0Wk6cTgM19c7z1CKeOx2dEQhLJHIkgso1nzVstfPXRAc+AIo+tvBk8O/hg
	b0rDuQfVwXTCqnFWI/E8n1fMCyPcMe1EegUZr/xncz9PEIb78FuKc7cr1iHjmdBMDqh4ZoRCu3r
	OxyeSX3lCypxPyqg3dk1d96Ej7EKBP7qBWGJMh1c9BI9Xq/CHYUOwV5/sQNlOUQ8Sf7QekrdORw
	c4qGMZt9994M7BSeEx1R32KFrJu5TCEU5ehXJw==
X-Received: by 2002:a17:907:3f8b:b0:c28:e01d:1d10 with SMTP id a640c23a62f3a-c28e01d2ae8mr393259566b.49.1788787597442;
        Mon, 07 Sep 2026 06:26:37 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-94-253-164-142.zg.cable.xnet.hr. [94.253.164.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2622a7c677sm366362766b.9.2026.09.07.06.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:26:36 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: ulfh@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	adrian.hunter@intel.com,
	aubin.constans@microchip.com,
	ehristev@kernel.org,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 5/6] arm64: dts: microchip: ev23x71a: enable QSPI
Date: Mon,  7 Sep 2026 15:25:33 +0200
Message-ID: <20260907132617.1198548-6-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907132617.1198548-1-robert.marko@sartura.hr>
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_142639_362483_E3A737B7 
X-CRM114-Status: UNSURE (   9.79  )
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

Enable the QSPI controller and describe the onboard SPI NOR flash.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>

 .../arm64/boot/dts/microchip/lan9696-ev23x71a.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
index 4012ea7d07bb..985ca31e74e7 100644
--- a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
+++ b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
@@ -463,6 +463,21 @@ phy27: phy@27 {
 	};
 };
 
+&qspi0 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <100000000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <4>;
+		m25p,fast-read;
+	};
+};
+
 &serdes {
 	status = "okay";
 };
-- 
2.55.0

