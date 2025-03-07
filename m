Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78BFC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 10:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FalLckkLy2c4ipBkbA3HgidqaPtgkZG/OVl2zJ65m2Q=; b=IiFY8irX+Al8T79j7McY2HanE7
	Fyswzw/rWzjSbs/OEzcUmCKzil+glFOmNlT2FebLgrx1WLBO+vHdJqT2N5NWDtTPwm230z+rkIyGM
	2gl1svzNSQOF//udD9naKzt3byqZgWNC8yCtorni6wl55wQlw6sOayQVZUtF23xJzhCiSxfS1OnXx
	125+FGJjTrNKOK4SyMIV5yrnbnlEEiGXLJ9UnJci69Ol1Uw5x0IxN6vg5BnsgKD8V7FLr8AC/RA8c
	tTC3b45Le4AlxDKC+hM0o9/fgWHn5rl/jOPCD7i/79icK8xA0SAWEGABvJrVtarPqKMLcbzzG3T3H
	Jz6mLkSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqUpb-0000000DqEh-20Ox;
	Fri, 07 Mar 2025 10:21:27 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqUmU-0000000DpUo-3vvz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 10:18:16 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43bc63876f1so14103405e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 02:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741342693; x=1741947493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FalLckkLy2c4ipBkbA3HgidqaPtgkZG/OVl2zJ65m2Q=;
        b=mC3BAfZZZvm4aD2Q6xUfGOkI8yYRxR121i1q7eCp8iKMnH+sQt1CdrNZUgbENjCOpY
         4bdnrBVysWctlzQ0e+RVkxWcmK3DrUT8U2EXftnR/iqTUt727SuZexKclXMdim8ySQXq
         SmqxRadvEGCktAMsvf64eyI19G1VYWL5Sgc9O27/40v3CW/ckcQkZtgk4dgci6WW08Pb
         gIoIvIdfnWFk1BWhl91fzlyvJfVCqGzOfA7ws76Sc62mVw8a7nK1olsGabydVi9UnQo+
         TZ04rRqyuTAx1U5NIjG6H0sJ/b2bPF+Js48dnZemyWYBgRxokv3TgEs2MQI7+e+DNVnJ
         KDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741342693; x=1741947493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FalLckkLy2c4ipBkbA3HgidqaPtgkZG/OVl2zJ65m2Q=;
        b=NWSzpYv8iCais9uKMYvpU7YMG0zsrNt+Yecz2bXj73gYAuWGeImf/beWlHrC6FGjga
         Q+Pk6RVIvXxmclurKWiU7sJ4OuY5fhP97vEO7MK10qzY1dbiCZjBJjVLTlWXnGMCwud1
         pYwNTVeqlZw+W1dbUAO5o7+Z2sgl5WZEC6RW4VaKdMU9gckAPdBD8iZNP26c9UsqaQ9p
         wqGgfk8wtrRD8qo0Xui2UuZkO0AeqtM6ASxEESb08/7kW+dn8ALq9ZB6AlfkYmnhnOo6
         4XoohVRxUfCTnBGwUUt/KDH+U2BN9SdIBgiHigJP2J2VQ6kQ/7jiHFuDDswZqheaFffH
         8Juw==
X-Forwarded-Encrypted: i=1; AJvYcCXaISrqajViT2ochovwrJcB8C9VSjqIyUg5EhZYX8vUybevoNPdUuwpTmuGZ+www3UHfrOMAhgKw0gO0kKd4IIf@lists.infradead.org
X-Gm-Message-State: AOJu0YxwBGiIkOR+gTjVtJl+fVJ1soOURLs/wbXsBcjL7TLlnzNj+daI
	r1CeXYgcAtTScTiW9uj6mg9rkfFew9pY0Amic+zZdvBixVeE8exD
X-Gm-Gg: ASbGncsHuZTWXYEYgs0VhN9W16Q38exUemm/zHvG/zSLmKI0Jl0UlIiFklqrkACumY4
	3YPYOY0aEDHFLpzCtH8SSvDSWXzAMOFbr1ILEZ/eo4hh3JaPUh6AIiVkDilj29swvZaAV74nQNg
	+n/2Mly0+/B91SiKelPcHpuJ3EmVC3eyTqmFfAgWdhn2fK4noQGbDk2BWDu3+CMi8GYyJoy/mw5
	6oCeFg5jkID+BdofrMmoAe6BI12FR9/2kbXZGQzNol5sZe6ZpXjLL3IAkZ7WFWwaFDnoyySuZU3
	dhWL7xKoYjp934ShM0oadAi+r7eZ+zd3CiTFUscbE0aSeu1L36Wvzug4u2JIY7463HwVoacgCKu
	Wvf3cHgWfj60LRT+RKNYufYo=
X-Google-Smtp-Source: AGHT+IHI4qarjn6okL8fiFQY3ltBC2yY6DhIkGRizLqTlNjxjx9HKfSflu8OqxGOPt8PeQnTelbnew==
X-Received: by 2002:a05:6000:402a:b0:391:2dea:c9a5 with SMTP id ffacd0b85a97d-39132d6b61cmr1665637f8f.20.1741342693057;
        Fri, 07 Mar 2025 02:18:13 -0800 (PST)
Received: from ernest.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c103aa5sm4900262f8f.94.2025.03.07.02.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 02:18:12 -0800 (PST)
From: ernestvanhoecke@gmail.com
X-Google-Original-From: ernest.vanhoecke@toradex.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 1/2] ARM: dts: apalis/colibri-imx6: Enable STMPE811 TS
Date: Fri,  7 Mar 2025 11:17:48 +0100
Message-ID: <20250307101758.27943-2-ernest.vanhoecke@toradex.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250307101758.27943-1-ernest.vanhoecke@toradex.com>
References: <20250307101758.27943-1-ernest.vanhoecke@toradex.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_021814_977422_80C3BC4B 
X-CRM114-Status: GOOD (  11.49  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Enable the STMPE811 touchscreen in the SOM dtsi files. The STMPE811 is
part of the SOM. It's self contained within it, therefore, disabling it
is not the correct default behavior.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: Fixed the "From" field
v1: https://lore.kernel.org/all/20250227170556.589668-2-ernest.vanhoecke@toradex.com/
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi  | 1 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
index dffab5aa8b9c..23913f18586c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -664,7 +664,6 @@ stmpe_ts: stmpe_touchscreen {
 			st,settling = <3>;
 			/* 5 ms touch detect interrupt delay */
 			st,touch-det-delay = <5>;
-			status = "disabled";
 		};
 
 		stmpe_adc: stmpe_adc {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
index 9f33419c260b..9a9f9764dc65 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
@@ -588,7 +588,6 @@ stmpe_ts: stmpe_touchscreen {
 			st,settling = <3>;
 			/* 5 ms touch detect interrupt delay */
 			st,touch-det-delay = <5>;
-			status = "disabled";
 		};
 
 		stmpe_adc: stmpe_adc {
-- 
2.43.0


