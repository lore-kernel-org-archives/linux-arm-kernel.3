Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AB0C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 00:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZ7Y6Bxon+oOUVGfq9tz5mANF1fTOnqA75LK51EcslE=; b=BsS09HQHTUqSsLNgxfvn8YAroy
	sfHYp97YFudHOXAL3YtpkxTF6DryuCaKsXTrU6Q9JSB5mWEEszAflMlr+5c+rmfDG2xzXsxtGQKUW
	deCjEOhd6OLLMiYP3uVKgSB1ZBrL8ZKDOn1XX8W75u8IQZLXN4LtOa1YpAqRaKfUpLaCaSbESDfCh
	Iz8p03MYw1mQYvX4M0SZSfkduNhx14pjLFqDCGsYUjg/3yjwKsKXQboiZ4IUda3ziJkt1xrodG/eS
	mLkShjhIWyyXNk/jtukzxU1LfqZgm4+2e1/XASxIfMwyJY4u6rhtEVyHlwnDk3ZZBNjvuBWNAymdm
	Dukpiwiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whcxy-00000000flq-3bBG;
	Thu, 09 Jul 2026 00:50:14 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whcxv-00000000fjZ-2xN9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 00:50:12 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2caced6038eso5228235ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 17:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783558211; x=1784163011; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZ7Y6Bxon+oOUVGfq9tz5mANF1fTOnqA75LK51EcslE=;
        b=BYM3J/BlAxc7rNE7VMTWo3w05ajfeFPUMA4A8UnGFn178qN5CRBQeueWwMkG1+aRAk
         GGBgd7LvgpkAqY97cvBQXjMr4AMpxj2cBw5Eset2BwIthtlIEkWiyxwmFggdvj7WHXcg
         X1xsGr3MjrNG1l3MaFKZt84vi6YmPwnbeTpigcPPmUXXxN9SVJ5RraJyQ+fd2RBMkWxu
         rXzWuU2ZEjkXPoazii8d+2pAFSya/QZKrgYRQrJtas8nbBLeujvd+29kjhrjkg8ssFIm
         OqxmtXoD/litxyBAD2zGN7MQLjU1BQ/fd8app53nCyDFte2g3Z3LJy8VxpKFnPzeWqTR
         An7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783558211; x=1784163011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HZ7Y6Bxon+oOUVGfq9tz5mANF1fTOnqA75LK51EcslE=;
        b=hqpTCL3yh6mE/L9iLD3Mr8pIF4UtqOQ9dcCMlgxwGzKXxqSIZC0K17oWp+Gvtm6WSj
         vPoNMFSlehjiElts4Rhk1WX5BmPlcsCq9iW4JFHmLTAYhOr+0pl/+Hs49TkjwGH+KGug
         GurxCIUnU/9zhsy9sdV8IUImWVp39NZcBwUZk1W2u6bP/9BJ1xrxUkXcp8V/UgWmmWb1
         ZatBHhsfSM9ccbWpif4+O+7/nXgMVTFYy1rjkpsje3Gjws7qJp/ygD8X/Rz2aEBSojuo
         W9tjGqk4rOi+5s8RDYUQgBpPzIlzIoklxL6PTGXnwlGgswCy0eMIvokY+nB3hvzBb4aO
         Ff1g==
X-Forwarded-Encrypted: i=1; AHgh+Rp8CJen7CfFKcNiwRCWG3IvvPdIJSIs007ch8l1aQhEWTQ91e9gC+PNgNwVk0P3E7sxuG6yvAjdOtEQx9y5LXxY@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6/nbAb9cm37Yz2AvQT/kiRw3YQbIsl/8zrXIMHa4z5BkyifKo
	TJiWroX+y5Y1azLoqnpPHh7fKvMUh4twHIAVoyBgG/W2OVKULVvoCC1i
X-Gm-Gg: AfdE7cnGJoiBNmk03Uy6uVxYzkfxK72OqoENGwI737kOeFNmF26EmeFj58tg12YUwUD
	Cg081KnDQ7Ff/MGyitWW8RCGWbcZDFflrl2iFWZ9MpvSpuq5qNRWsWUf6g4IRO0TG2t5NjzKZvR
	WQp4H0OaJXbTB3SgY0ygDGdNsOVyJXJfb0c6cEAbkeuwfgI5CmC1EE1o821dertBxf+lefc+okf
	u4vkRx83IJ9bMLeovnFOBpAjaz9I2e+mFYfd61sG4e7pVs8LNklz85GV+95wo44+/pRu1t2LG59
	pZ1taMWV37U1Ton8cd+2qD5LZw25B/sZYsdPA6POfoBnD0nCwb1yiBSbRuscaQGAKWxjDmMRHK8
	vaeeneh/Zj3QQs5G8ekIkcNvck4huU1BGu38WI4aD+616mxwug7fXm9BhRs3HCY1xBLL8T0sS6o
	23XFxURou90vmFNdmMqF2LfQQuwVUmgs5ABg/u4Ur2OJan6Qo1pf5cOsid1WlJNzYkP4IGsMEZ+
	v9BM5oPKfkOu+ZmsCtLVnvq3iKdSeCHsaw8x03CmTj3D1Kg2mpYgYQRUUL+9bd9Bw==
X-Received: by 2002:a17:903:240c:b0:2c7:c385:c5a7 with SMTP id d9443c01a7336-2cdebdb10c3mr5477215ad.26.1783558210748;
        Wed, 08 Jul 2026 17:50:10 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d59e51sm35604605ad.76.2026.07.08.17.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 17:50:10 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 2/3] ARM: dts: helios4: add vcc-supply to GPIO expander
Date: Wed,  8 Jul 2026 17:50:04 -0700
Message-ID: <20260709005005.1587852-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709005005.1587852-1-rosenp@gmail.com>
References: <20260709005005.1587852-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_175011_747953_27285E9B 
X-CRM114-Status: GOOD (  10.20  )
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

The pca953x driver requests a 'vcc' supply, producing:
  pca953x 0-0020: supply vcc not found, using dummy regulator

The PCA9655 (PCA9555-compatible) expander is powered by the same
always-on 3.3V rail as the other I2C devices on the bus.  Add
vcc-supply = <&reg_3p3v> to silence the warning.

Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 05540b8012c2..cf0432a0e71a 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -169,6 +169,7 @@ expander0: gpio-expander@20 {
 					gpio-controller;
 					#gpio-cells = <2>;
 					reg = <0x20>;
+					vcc-supply = <&reg_3p3v>;
 					pinctrl-names = "default";
 					pinctrl-0 = <&pca0_pins>;
 					interrupt-parent = <&gpio0>;
-- 
2.55.0


