Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD44C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 12:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/7dhBSgukk8ss4p9GXKM7Hns3H6z46vF+Aj0GzKdlA=; b=pvJtEDMHSi5tSlPvrzzr6L9AJH
	1w8qjXMD5eI4rElcfj33RzdkTDEYNFaBGcPNOy+7mYZleaWQ87c5OPfrktgc5uoB4sHl02vei8WNY
	YmgXrUAOijt+G9MUf0fHPssk9wdhVkoIX01eH07Wvese+K6VYGEYl3Ai9PB+e4rBVNM/a1P0N4f/P
	BWk+UEr8qKAWKd4oq0XKJqv2c1CGTZazjpgQWxgVKiGtLBJmlVkiMKN0Yzo9ECDTX3EeCgKaZEoi2
	GFcYyE1V9HHnLIVlwARkMS2MEIBnbKWtE3Fb2BSpmFQdaw+QUML31qTOVzLkFIFWOhIhP6+fp/WMh
	BCC7I2WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrac9-00000003tHt-36Cp;
	Wed, 05 Aug 2026 12:20:53 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrac7-00000003tFE-1syc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 12:20:52 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso4464105e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 05:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785932449; x=1786537249; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P/7dhBSgukk8ss4p9GXKM7Hns3H6z46vF+Aj0GzKdlA=;
        b=W6SsadACBN1B1gJvowXE1iH/YbKR1xbiWruFILgrEEx7I/lAovSTK2lYupO5wOcg9v
         dF4B+GjgYwccMWjAnP1KvexSYtCahjKq5St9la1CBH5ZsVuIuEMR5TsSuD8EyGRIaVoI
         K0aJEBt3H9AL/jAOm4QRyTeKOKrZTyWyPvZF8wOugMgEDdi3D3o97hwLJ2H4AkxrN8gX
         NWnVlpsDPuoc6YUYFgM37iUqrnqI0VeCivW1rBCk9wc0docgVIaVTge4Sq5Fsm0tfY0H
         9pMJ2XIWxiCBTBffUAZU+VKb+J66aHYskG5T46FFmzUl2m9FeUeB6K3+qyZ5zD/sNaUc
         gZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785932449; x=1786537249;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P/7dhBSgukk8ss4p9GXKM7Hns3H6z46vF+Aj0GzKdlA=;
        b=cnmsJX1PhPaL5uHKksAhwvAG4cplQhZhhQ175NBWJjE3KmMNSNBEXeNCoG98CYByTE
         IQ/Uwx83GvTJ4nmFbrDnVg0GpaYgZ9LgP7eH8Up9CbVxGXpSPQ8sLcfXU1kY8J7b7+SB
         ChKMg2IUQyGyamTFfCGv99tbgSKUAJNo0hzecRRmsH8EN5Eq6gVNs0Er4GLkY5ZAOpQC
         PNe7NUgc8qxxzEqSIOs/wq9lVHBV3vB5EOh6GfNBk8qfMUSrNn4ZduHAx2GhIlr4L5xq
         cSTRNZSU40wmeeZHiBNmI4M8S/6yLrvVE+i2tt+l0Zj9GggAPGdZ1z4C0xI81Y7E2DOB
         sbkg==
X-Forwarded-Encrypted: i=1; AHgh+RqEe2luJUHWU+/gYl2hfXgdU5D0DyIMwsN+0q4RnDSivL21jjgEhXVJSTWtmwb+V3szymdFbrk4e/i6HMmXbLjU@lists.infradead.org
X-Gm-Message-State: AOJu0YxVPshKxwgROeMh6pAhvBpqoqUIyR0Ee4ZSJHX+jd5lQwYDPFWG
	bdWobCFrj83136HLY0tTM/ZqPbqiU3W665+QqrV+Q9FebxpvjhNU8f9XCbvZsjvcsXY=
X-Gm-Gg: AR+sD13gpPfIK/pjH+8KOzAhtVLuAh7u2JHDw8Tyk4z9E+q234kZP5CdCuI5uA9tuVm
	MhMRXPobLgm7OlHg3Ek1YSgIVAtVgrMvvoAVwiuw9J0/rPeHoeNKGSn/bwr/mcOdAwz/IFHlppb
	EM3iksNGqM+7Y8Mt/9uKNZHnJx70HEu5tQBKtZXWyHrIPXD9Mt0YLpRnFoex15eZkUSUyDA32vW
	kHknTKlWtilB+WYJjf0M1iGAk2c5holhVV6X34QuX7A1XD6sNUH/2QZCiIdxPocOHvreQoZ27bY
	6R/3jQFAxTqgDglCoRJz4RDGtEG0awdHSC7CPHW9b2j6r3UAAdnHG00Ae7lORKzn3ydzwcMw7vg
	bIe0s+3kjXByO/Wg3tmAlCvuXhBJCjeKqBUV4HaNjAozOSoUTXykvvMJpxYhsayIZ73vuVw0eMV
	drEjN34G/+BqMxiumBrok+03Nrj/O5y9WxCVvNd7dWi4NtEfKgLQWJmNmbXGFes+0FhqXnRGcUV
	V+9V3MEz1veI9d0AIkoB2n2nh33Mm3BeJeHcCmHxsmM3R9C5lNAZM+WyjP2fWJVB7fEczxZp0ia
X-Received: by 2002:a7b:c7d6:0:b0:495:4b42:8677 with SMTP id 5b1f17b1804b1-4994e7d17c3mr61632935e9.18.1785932449558;
        Wed, 05 Aug 2026 05:20:49 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949f68f95sm196663515e9.0.2026.08.05.05.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:20:49 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	tan.siewert@9elements.com,
	linux-serial@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v5 6/6] ARM: dts: aspeed: g6: add aspeed,vuart-over-pci prop to vuart3 and 4
Date: Wed,  5 Aug 2026 14:19:53 +0200
Message-ID: <8d24d424b3504105394055de268e0a11515635a9.1785932211.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_052051_540568_47F048FE 
X-CRM114-Status: UNSURE (   9.85  )
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

The VUART 3 and 4 are VUART over PCI.
Set this flag to indicate this information.
Also set the syscon phandle.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 7c02633f2bd6..fbd7ab6332a1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -722,7 +722,9 @@ vuart3: serial@1e787800 {
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&syscon ASPEED_CLK_APB2>;
+				aspeed,scu-syscon = <&syscon>;
 				no-loopback-test;
+				aspeed,vuart-over-pci;
 				status = "disabled";
 			};
 
@@ -742,7 +744,9 @@ vuart4: serial@1e788800 {
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&syscon ASPEED_CLK_APB2>;
+				aspeed,scu-syscon = <&syscon>;
 				no-loopback-test;
+				aspeed,vuart-over-pci;
 				status = "disabled";
 			};
 
-- 
2.54.0


