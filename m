Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EB3C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 12:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=; b=1b9ibuZuMkuV/Uso/YTGYL9WMn
	Q9Tmyv9eUCdLbHFt/51sQNCTELDdGZ+WuxZKRxTx/z3ZT1vEHJ4KQ/ahlCPfebKCR+2Xf7N06DtsT
	/63bZnR8yWFr0VqGV8SXBEVUUaMCRVo2FovAHE0nfFjeXPaB74Ts8Qp7Udztc2Vlux7vqePmtykAx
	6V6YLLLNaI8ER2C9AeAPQt9CEiVNBCFvInitZOQ2AlTwulOEBvLFiocLvue6XVnxoFBw6fujVIV0v
	sqwVvnRfnzeJ3M9YWPdN8gN2y5WwAaJ+HmCHC/I0FlTBcoU13A7daxMl2fd7+n2NAbWnhhYmaUPol
	1ls1kMjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ8Ki-00000002PUA-0qdf;
	Sat, 18 Jan 2025 12:53:48 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ88U-00000002NAh-0HKE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 12:41:11 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aab925654d9so524301566b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 04:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204068; x=1737808868; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=AHPQyudIEqz3jg8VqVFejM4x7qkmUeLPv6FYB9iGuCjRBB9/ejxguu6T3g2mg0yGVQ
         DmcZhjYdxRRz49WuwhKPxotXDz4fA888ihOjr1JnDMX7syUIUkC+lilBa+KgMyYmJ8gW
         tVF/2zUytPvRV8nxsuQ+wnc9ufVKeMUDjqN+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204068; x=1737808868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=V8M4rZfi4o2CZ0d7wnp36730q2U8Mi1OIL1VLhA5Du6Vr7sUwnBhBLOHZxK5aCiDLF
         ofi+ykMW4J2bb85v7/9q5FveOv6eCsTvaCeRJnA1yZS/Lo/2mZeBrFKNQuB8/ELPbwLS
         gqpw2KQ1lYRBNEaae+G7ZC697YuTLmwIsEnlgPb2eVXH1PBNGFI97rm8AMgbNVnKxl20
         TpfGFw80XaOPvUyLptA5YAH86Ccmx6R40lL7dbu5PoQ1w+sgRBxj3eY21GIz3T6ZyYy1
         +3Mz+p0Qm2zT79AoOg8IM+eP6d+uY5GgcDOsRErgcQy2lAZjnJDuHzVyjgwMgjn9xvn+
         vy6A==
X-Forwarded-Encrypted: i=1; AJvYcCXp1FbaldtYqYBL6cFc0h6GkH4D6mANHbU5NUpJzyNSxzGgL3hPDAHzjQFheheA5HT1Iu3hsU/czYjQzeTx3fh2@lists.infradead.org
X-Gm-Message-State: AOJu0Yy20h67F2VNG5QZOxCJskqacPZra7P9yd6B3XcItUKCsnctJPO7
	gp5iiSvk+w1FaF57thn5mC3EWdfruOff/iL0Pdzsl3Nq8+FQ2HR4T7v8Yq7fQvE=
X-Gm-Gg: ASbGnctjYiVkY1HfvWRXzW1fCxLd6zQSvEDmwOF7DY5nJwoTbXPsTTFHiNj7mEvJHQ7
	1YSbXQOodwEeL5Vr27IDIuj+cX5mSNbNvlEFvEMr9xCEO2nd5+6Zvn5QgCtRKKqdHRZhPKPaHQj
	8xhmhEWo279FVodCnsN+cRQYrDJ8BVPu/q0MIGPUi9icO3BmsNIYTr5xJLHNPuGNM9otPqLRUKc
	kX2LRtxDnfcPGjjpgEn8xV+8Pvd2qjwg9sJQmM9nRO4PS+hFb5eS8TtjISv//lybWrkNhTTHG+Z
	nGWgu1oT5Z9SO20E3IcJjiglTRtNhvFnN+6+w+v9thTneM2cRDsathLU800pOUpmQ9/gsXjIIwT
	w0uNvaj1LnTc3DXe4SZVFY1z7uMDkIHzIOYto
X-Google-Smtp-Source: AGHT+IEjVsxeqV3q0cuCfowb8sHunl1c2U0QJyl0v84iVeugrlhDgI71TwU/pUagXm7GAT1GfAlb1g==
X-Received: by 2002:a17:907:940b:b0:aac:619:7ed8 with SMTP id a640c23a62f3a-ab38b1e651bmr538826966b.7.1737204068521;
        Sat, 18 Jan 2025 04:41:08 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:08 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 09/23] arm64: dts: imx8mq: add anatop clocks
Date: Sat, 18 Jan 2025 13:39:52 +0100
Message-ID: <20250118124044.157308-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_044110_101295_9C374945 
X-CRM114-Status: UNSURE (   8.88  )
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

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index d51de8d899b2..1d1424a136f0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -817,6 +817,8 @@ anatop: clock-controller@30360000 {
 				reg = <0x30360000 0x10000>;
 				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
+				clocks = <&ckil>, <&osc_25m>, <&osc_27m>;
+				clock-names = "ckil", "osc_25m", "osc_27m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


