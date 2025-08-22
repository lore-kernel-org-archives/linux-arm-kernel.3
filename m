Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE409CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1oPHSZs3u7U8KvICqkGflwd8yraABLSs55oPMk26ew=; b=Pcewm4JIyCVniKuDoqmExK32rS
	oQrOQJhT6wLwYUQDH4vZsuycr8IammcYT3Ap6b1XzFl9/a8Y42hzjRFYeL7Lk/7Dt1YmoipqO1HDP
	X9eCbB1mnFYTCsFKJTCoryLA3ymj12QkhToxbjG0w/eVYUvEI4m/J62WDDrtOuNFTXxvEtoKIdllD
	Jv775RR0g2thmt26+aJJzDWOILXlAnwRQdrN0xDf/FfBBjjML+HoRMvMvP5kVUQCmqQ7S5ZgIZTpw
	r5Zpsbuzt0fdNHl0A9fB3uW3VxnVQenZdiAMnxghjNTcz1kqZq6c5JGL3qViVKb5y77e0+s8CxBoA
	DqvYd9HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkdv-00000004SIP-0Y3s;
	Sat, 23 Aug 2025 09:34:35 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRrl-00000002dOH-1pkL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:31:38 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-afcb7aecf92so33700866b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 06:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869496; x=1756474296; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x1oPHSZs3u7U8KvICqkGflwd8yraABLSs55oPMk26ew=;
        b=S3UdQIZK7EXZ/3I1WEugvsdfu7d47uoBKC2vZmfHyaxKon0Jve1ZokDOGo2zV5Vrra
         4PdR7HezWkuKrb0ZbriaZHlTGsDmhXArZiqTekFaWbfZg7rGyhn8nw24Bm3Rzq/TLLiB
         UP3SIDNC6RKVA6apQkW05e/Dj4mX7C3mvIYpO2MxVjWXi6TGPHSKoyT53D/SqkbeuDiL
         Crb/7cP1SbhISuPbpa3tYkdyT2kLX/rD/NXGUSxKI/eL4ZJZZlVZK3VfrUH13kQCZdX6
         v+65T03SrSoaLVOT4oKw1VT5UXNTQ38Om3M2e1AN/umv/qbKsvYl8W3m2lag/NAfkSeE
         to3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869496; x=1756474296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1oPHSZs3u7U8KvICqkGflwd8yraABLSs55oPMk26ew=;
        b=MZQj615F+PjTmwJG11LGr5XkZKWg4rjSnm7Nyd7EITL8mp1JFGWsSLSeY0PIGjk6ES
         xBVJwMZTmz+k67EPy5myykadMPg0s2rnM3SBZuSQn6DLRuimDhTAjK8tFd1zoBL2c+fI
         eN35xQg8a1KTdP8hCI2qe3DmCgaqUGRs4l7qUeULWay0i0ItgJUnOAa3PKUk6wQXqCJk
         tyI3aw51oKoejQkEvX1i7cUUFo30wRogcac0ZwtiuJoSfy1gfMmVpgA00MwgUmPDtK1j
         00dhbBAJihpqGwnny3VdaDBN117cj7KY5mQiLiP2zi0BmvKfU3Yv9eM9awZT565QFA5F
         ysjQ==
X-Gm-Message-State: AOJu0Yxio3EjLjYO8qcrHUYtCCFsH48xH6vMQvP9I3oZLyR1De+Nye9e
	RZ5RcFHNK5VAz3cvyauM2zjY3W1dKKqk937O2iXc/DkbGTlyNBKGWBdTyD4w/b9i1yc=
X-Gm-Gg: ASbGncvgnalG+zOFRgRlE8xijxdPwUZ0UFEqQvEMEfZ0cetJP7qOk38njMsurab/tX7
	nTAZgAkOYUSKHze6sPKpkgvVZ7uqvO/7VBjl3kiLBY6OPVGh6nDgBBq+dlrNbj1fDYxPhcI9cRo
	HJAEQRO4SCuN6hHMkAok7lbmfT83W5/xDo/SEsLxGU+AvNkp3Iy3STxpAi9r05dQNpa/b1rqVYr
	LoLQnxnkOE6+NuPTowtRb6R/MJD9VvyW2FYFuVDlxr+/mefAhvk+eBhHCdkotL5c3O1Fwbsc5wO
	jNkiCo+wX8hNVOvWCHpAAZ5uASV7khAeizuJ6lSi1Z48syifnByISgaMtJSyhPb146Fgv3Sw3yd
	fqfhKXALaqVJTid1MvjBbDQ1uFGumBLk3QteZtckQa9X4NJNQjg==
X-Google-Smtp-Source: AGHT+IHGf4gD2l54dPuZnRQTNE5elyH8zGFJB2EjqQyxv9TE0M0n+7dSm4Zf9PSmnmp/pw/J1tGJgw==
X-Received: by 2002:a17:907:728c:b0:ae3:63fd:c3b4 with SMTP id a640c23a62f3a-afe2904d606mr159430166b.5.1755869496058;
        Fri, 22 Aug 2025 06:31:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdf24bc40dsm554863066b.109.2025.08.22.06.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:31:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Aug 2025 15:31:18 +0200
Subject: [PATCH 09/10] arm64: dts: imx8qxp: Add default GIC address cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-b4-dts-interrupt-address-cells-imx-v1-9-f1b479da9340@linaro.org>
References: <20250822-b4-dts-interrupt-address-cells-imx-v1-0-f1b479da9340@linaro.org>
In-Reply-To: <20250822-b4-dts-interrupt-address-cells-imx-v1-0-f1b479da9340@linaro.org>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1428;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=7H+O5W6Cx7TFYYHg0yIa4CMl+T5Jth/7El/WrcKoQQs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHEneKEpVbA628wFgsw9V2z3aggP1pLeaWTvt
 DKf8bFCN6CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxJwAKCRDBN2bmhouD
 12XrD/91UKSwZcFLucZM7856sWnxIKl00ZUOGNPinv9qCyfjYCiszDUpqIuPvf636lvjnr6iTLD
 swRjLqBQvVrHKb9eZNHvNuvojmT/yHRRkUUe2o0kvr6dEJ6Z7ytdDpUFtvka5zIqi8kMk5Qq6Xg
 sz2uyWs71KBSPGwNGy6umMAMuIm3HzHRifN6mClsn0V0F8mVsfDyiSy8UejVpYvcw7i+fpRoX3f
 +MeM8Zv/QUoOnWGJXssrjOAPyN9l43eEvBXv1JaChihfwuao3gwjyMxuc2+KbtgBHEGDH9iLwLX
 sqq+cKMcqXWIDkMM5g+UW5TiYrV4KYhjWsw4GsX/ptj7fXwpkxdQNbzxbf7KaBaUmknrJcvvOlz
 jDAHL58ZqIebI0iTcO+wqMG9WFl/lNtFTALjDqSh5HhjrYqmy2RdRoy/X4xE4aAQwJYPB09Pzsp
 DiYd1b6O27dht2Z5CFA87Wanr/crWfUlAYKueeYQOc9cP+hSZJis8nS4EZzGf1t5qM7XfVBZHRj
 6ipvyaq/k8qC1SpD2AcDZdsc/86cgIcDno2ylCkHxr3pfUj2vuTz/qv+jBWHSW1RBXy2ttilZOc
 9R862LdCsnKXsa11wUa1rs5qgiOEot++kWuFs2iIrk80gMk1GeAHv6yL4ERreH4cmAMbMdBoyS7
 jrSf2RWVT3tJsPA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_063137_484268_BB036ECB 
X-CRM114-Status: GOOD (  11.36  )
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

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  imx8-ss-hsio.dtsi:71.3-74.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map:
    Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 9e46e16a8dc06448c6eb1796a3ffe70acb09374a..95edab058276bcfc87b9bd85426b999d1ab32360 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -159,6 +159,7 @@ gic: interrupt-controller@51a00000 {
 		compatible = "arm,gic-v3";
 		reg = <0x0 0x51a00000 0 0x10000>, /* GIC Dist */
 		      <0x0 0x51b00000 0 0xc0000>; /* GICR (RD_base + SGI_base) */
+		#address-cells = <0>;
 		#interrupt-cells = <3>;
 		interrupt-controller;
 		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.48.1


