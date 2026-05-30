Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831E4CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 13:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pwY4UPqEIISkAfS9Cp0aAOo5zFq6rHS+7VWOfypc9Vk=; b=O955bLWNi6+TIeZNYp4OIEyLSw
	a1Oq+fNk0dOVkxiTIk13te12XsvnPHiPK3CNmP9CSQK9FzGNIj92Enf/CFoPgTJIT78ARDOudf+71
	TuQIqj+L6O3znZPo2W951mlr9jcqLaf4wMmypSuon/Y7LUyxkFT2fvVJCEd9Czs+QzwJoI3UoAVqL
	sbFt2cMOSW9SYbXytt9G2eJ+eREnreBh/Pn17F06fc4Hb6ytfmZcvfQu5Pew3v6V8Rjiuj4tSlR2q
	cuQXyPGGL3kZP1Hmv6DGbTVyvTT8juV5Rh6ht09cGUUPW8HeGqDCD1FN+55Wg+PmVZySfbbv37rit
	AG3C2HEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKBb-00000008mH5-0oGG;
	Sat, 30 May 2026 13:57:11 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKBZ-00000008mGX-0ngd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 13:57:10 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so5148361f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 06:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780149427; x=1780754227; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pwY4UPqEIISkAfS9Cp0aAOo5zFq6rHS+7VWOfypc9Vk=;
        b=JsT9dy2QjMb1mnKK7stoDG3xacxRsDj4iqn/9cNiEbP8TtiT3r7abB7IFzD/Qq3c9C
         S5P05DO1+RSySrVSp7xll4JhjgJHafW33/mNPAMPoe49IAY/qjOFf2kj/7iFZUWhrZCw
         7Awa03GJMUaoITSWwstM+fEq0tOEKPDf26nHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780149427; x=1780754227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwY4UPqEIISkAfS9Cp0aAOo5zFq6rHS+7VWOfypc9Vk=;
        b=tJaIXB4Ec01u07sONchQBXe+3oOf83aEekBldiF+ye/8+TUNQvHRVmHCPLBsK05FVH
         Uso7/7MFomz3/+n7O8y0si7u/+umZxyyJeCE2M27NlWPJus1FnD2db3ouL6WjDLVX/JD
         D7i8x88wcipEWaztrxRdlj41ggFMr5qnHwgSaKHSrSiGvkeMC9/g0yEm02j2JNMsk2Pj
         PCYjqgnPKZ4Vs/trnodZ+bvGKHhWmOzzcWKpdrvVRqxQ4SZNY+WLxCTOOr8QMOxJzx6j
         sWZ0QR/3y+eV2ScrL5CVOkeggAY+xnT0h8JZb9XerlzZsFPgSy0NP6JmKO3UusCQjU47
         0eEQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8wsLqIcMKVS6LnPIiPPjZ5/nC9kutxU47BuhJOFn8JDrchyt5powaHjF1kPbpt63TY57Lu6eVxG9vg4oAdE7f@lists.infradead.org
X-Gm-Message-State: AOJu0YyXTtfF4VQVbrJ25VbfbZVVWMHaA6T+P/wP1oKqHmU4BobjeQU4
	Q9Dq9jcwBQcexGqGLUkTnr9aOALnAG4Yo4InId8RAS9ZuFSMDfNJAwP4lK5Df9lfxuw=
X-Gm-Gg: Acq92OELD9Oy9mClWF7tiTYsoyP9km3RuAO5X+dr5L4VHRoFsWdX14hwmk8w+DTMLzW
	056B5SRtOVB9Qf7frkXZh3VZ8l46j0qHBE/y//qn4qdcUJV7Yg/9NJknhXX4AQVLHYx2K6WsuQA
	HnpzSrbhpugu8BtuZFLnw2OPJ+rNitdFRtXmuBTNFNyIW1LzaZkh7RwrBf8fO5Uzzw/BXz+cHwA
	bsiyvUDwz/ys8xlmzr5JGe/vjRv320TeEY31XbB64+wh/p3kQHqrIr2JuajtLqG4W+tji6bD3eG
	NpOyGP0MPsoziuNlvS8Wz5T/jRGtpBH+uDFK85l02LcUHBYxlO/B0/Jlzjx3AWpK8i6NyMLcdi3
	QzE3nmM7pnEqx6aXhFksyvtz+N9RVqSJG5GpJai+UHpbOg0cdRb5dAlezmqr6zejrt8Xxd+iinU
	NcEuGJYz6ATfA9ZEM8EizdM8joxzeDoDyRlSPdPdGftlfklRtvP1eMwZ+LhNNofKuoWlzTWrKqw
	qsa+jC9q9F1ctnkRQ1u60+aF7WLveYaNzdhIETiXjPDRqK8CyxaiIzEqCZEJvva1Cw4y66Y4gmv
	tq6YdOfLPJ+xKd1zZyL3DfFPbdW/fRT5
X-Received: by 2002:adf:f902:0:b0:45e:a225:6dfe with SMTP id ffacd0b85a97d-45ef6b5b552mr5701275f8f.25.1780149427200;
        Sat, 30 May 2026 06:57:07 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-87-0-96-182.retail.telecomitalia.it. [87.0.96.182])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34b47eesm12101711f8f.9.2026.05.30.06.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 06:57:06 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 1/2] arm64: dts: st: add power-domains to sdmmc1 on stm32mp251
Date: Sat, 30 May 2026 15:56:54 +0200
Message-ID: <20260530135701.3961023-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_065709_270030_F90501CB 
X-CRM114-Status: UNSURE (   9.58  )
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

The sdmmc1 node was introduced early in the SoC bring-up before power
domains were systematically mapped. Add the missing power-domains
property to align it with the rest of the peripheral nodes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 673fbc5632e6..b3416c928c08 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1664,6 +1664,7 @@ sdmmc1: mmc@48220000 {
 				cap-mmc-highspeed;
 				max-frequency = <120000000>;
 				access-controllers = <&rifsc 76>;
+				power-domains = <&CLUSTER_PD>;
 				status = "disabled";
 			};
 
-- 
2.43.0

base-commit: f5e5d3509bffb95c6648eb9795f7f236852ae62d
branch: stm32mp251-sdmmc1-power-domains

