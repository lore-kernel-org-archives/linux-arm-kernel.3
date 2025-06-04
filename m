Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75296C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 08:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jyqlZAcdTFyJYPhP3doh/0zsI0IchLs8FmT00VqXdQ4=; b=Ll3cmdpeC4k0dYFsj05JdF8Kg2
	Si6RLLS8cTmSCIUGyt75owqGQXvaShNPP10GcdL/3lUs0q38O0y5am4bj1u2IK0xe0lmfYsVBeLch
	csgO/dfhWIKhMwGbWTWlPgU3rhOCIToJd3+s8lF7mtDIxFngNpwk8WycFibmIdC7Z0oB7R10vcHe2
	9Xv+jAwApAwkq34lYaAW7IAEvGa1NlBTLfQNq8Z9ySe6F2jO91QShv7t7oeRIhjYM2fEnEEKrnf43
	wDZlrhxi5Nekek8Bp4DFgc6XglMgf0SvJfLQcshUpnSslkl8PNWA8QdUyTtR1f6sOOCzQ+PFwZhL1
	14NVD+wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMjIq-0000000Cruz-0w9r;
	Wed, 04 Jun 2025 08:16:52 +0000
Received: from mail-ed1-f43.google.com ([209.85.208.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMj0G-0000000CobW-2Lo6;
	Wed, 04 Jun 2025 07:57:42 +0000
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60410a9c6dcso2502321a12.1;
        Wed, 04 Jun 2025 00:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749023859; x=1749628659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jyqlZAcdTFyJYPhP3doh/0zsI0IchLs8FmT00VqXdQ4=;
        b=LMhbEZ1OuGxDt9Irvi+jPzGvs83yys6XtgyFUIQJ2riOM/42O8WOnIc8WPQSvO7w1A
         /8IbvWFHjK+S3SrY7UOXrFyRMuWOB2iacct8dt0TSSAnLEvXzkLl4HXKxtSPFTY5ba+S
         ALY/6Ge1y72XxBSRubVi794oZOI2BAwgmmXuJ7FsmCw3uUVjyYNrZRJGLGOEQNFJccTt
         7QfMb6loXsX/x9SbasfA/Tb1th/H6wjWJpdNunutLGSYLwi1XELf7g4rXzHcWW4Oc1FB
         sNPXcTY0vvh99fPH28lQh0c7LqdD9ZNguaQftqge75Gjp485XrU1jf8/L3DCAMk7AnJd
         2DKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUECr55inK+RBcJWgmUz1RYS+/cR49NceS7GIWWLpQq6H/W//8ZwTrrAlNC9VEe4CXJ3p6QaJwugfr7rJQTCMTn@lists.infradead.org, AJvYcCUzDougm9pK1v9G/WgdXSSlbswmGKgxhhZJmY5sGKXymEeLV2m2ZW1wHSUm9GCLm4LjmCaEg58bgQuJ0zngUKE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/QYnuGeLTeoCgeBWlJqS4XAcTxaARveanCNlwr29HVpCwV7v5
	nReWm+MRTC5n4sOVvVT3bltjThopgzTW2A8er1wUMCUXM15oPf+oGG1blZy+gEd7
X-Gm-Gg: ASbGncveRphW1xlA2kwzdPAvnHsq6/UhZpZc8nVn5wPfRvcZpWp1hT6KV9kqbE8ARdP
	Y9u6d5xt1r0Wsz/H3NcAkS8LCpr4HDgA+vki4gvBzeUznDWWQviDXJEVboBU0MdDQ4CJW9VATFK
	jgwQDb4Gxfm8mbao8s7g+ifEGqsweNqpimUlYEeEJWmBI1foQs/bHHt/PYrnQL0vgyxhQKtBeQ0
	rCwyQ1fJ3q91JKb6s8DM2Lmj6P/Tz4VOYVcwRaARRG8GxdvRl15dTNIWzqbiTTotXW/cjFO8WW7
	jRwcZeIF19ksUADAIiY5i/tRP7Qy7yyiSyCYsBamn5VykWcwvk3+OeCbkBz6jv0ffXxbo/Hph9C
	NWMe93bpbRg==
X-Google-Smtp-Source: AGHT+IGSL2u81m44PshHtM7hdBSEpD8DSsBTKjhSOsPhct3tLEmRi8Q1fHTg1PC7eFwd4tUCzQ2s1Q==
X-Received: by 2002:a05:6402:2690:b0:601:fa1b:cb2a with SMTP id 4fb4d7f45d1cf-606ea17e694mr1966918a12.26.1749023858889;
        Wed, 04 Jun 2025 00:57:38 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606fb36a160sm348569a12.45.2025.06.04.00.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 00:57:38 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 04 Jun 2025 09:57:22 +0200
Subject: [PATCH v6 09/10] arm64: dts: rockchip: add pd_npu label for RK3588
 power domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-6-10-rocket-v6-9-237ac75ddb5e@tomeuvizoso.net>
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
In-Reply-To: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_005740_614671_E86CBB49 
X-CRM114-Status: GOOD (  14.03  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The NPU of the RK3588 has an external supply. This supply also affects
the power domain of the NPU, not just the NPU device nodes themselves.
Since correctly modelled boards will want the power domain to be aware
of the regulator so that it doesn't always have to be on, add a label to
the NPU power domain node so board files can reference it.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index ea831bb6e2ccc64c811f885a4964da7617c255d7..a44dfb376fdf4c29e1bd307d9a7d1621e11d8c59 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -837,7 +837,7 @@ power: power-controller {
 			status = "okay";
 
 			/* These power domains are grouped by VD_NPU */
-			power-domain@RK3588_PD_NPU {
+			pd_npu: power-domain@RK3588_PD_NPU {
 				reg = <RK3588_PD_NPU>;
 				#power-domain-cells = <0>;
 				#address-cells = <1>;

-- 
2.49.0


