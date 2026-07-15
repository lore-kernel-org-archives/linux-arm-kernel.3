Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022BAC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 06:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjf+9zwLvFnbMj2uY67jnA57NYs5qvgfofKcphxJQbw=; b=Lt3z0xjnisOq3vRI2/cSMVBikh
	+eePgpumNzFTtvGbkrDCIyWw9oE+euKKcXW7gPx5exZpx1Kfl0xxkH7mymi1Ovv+O+HzZiqbj3R1E
	cYaxoYGShmAn7NtVLIsavyarkkcUgP7VmjKxppnE3dsrxFmpCq4sSJ5PWMbN5RezDD53B+OsRvQAu
	z8yyPNjThMnso7iG8Gp/J1YD8Wpr9TXEABgy8ddhJ95A6uG9dXDB8gCoiekF95s04dESNSazpVD1B
	KCvH+J+kUfhh0xicEejgNZ9CSy4An/w1d3pq0sqA4gcuRxEx806vrGkHn924xormkIs4xx2/+y2lo
	GmAHv14w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt0n-0000000DsNZ-1VRl;
	Wed, 15 Jul 2026 06:22:29 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt0e-0000000DsI3-22kn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 06:22:21 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c16794450aeso50453466b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 23:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784096538; x=1784701338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjf+9zwLvFnbMj2uY67jnA57NYs5qvgfofKcphxJQbw=;
        b=ghWHJ6LUWtBHSEuXmSYmTDmBodnkFueJJRDJ7zZy/aFFy0Pll4sVyScAcXuA8cOfBs
         w+aplUTw6BjicWsmArerHi/pHWjqeAyVmYfGj2QaACH8/avjbxGHizZ0mQKfkr/WHrJn
         uc4rcx2buInQjNmDw3IiEQ3eKBOVq6SuZQss0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096538; x=1784701338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kjf+9zwLvFnbMj2uY67jnA57NYs5qvgfofKcphxJQbw=;
        b=P2FEFZgJJDqk/hsujPXsj+hU6+sX2v6ZMsuX8yM1kyFcI3qCFyaSpCmHTqSK+INd/j
         ob/8LuuuerDBMisgjbowknD2NfFtWqoCDFT6bE18wmEn4Vli953dA7Ri/Rblx924X2MN
         2AfshQT4tFpOJgXenx3UrLb/gpI6NYIIiguJDzyTapd4sHc+C4hvBdfsAnbrEjHrC2fo
         yHm0Fw6NgBGpZE3I1JXl85pto8S2eFy7434zH+BjMHeShpOf6T99T9eXbjiHXI64yAsQ
         BSkI+gYV4aQ/9u7kvNoaWlpCsjBFnexSA8Qjffr4N6ZguQD4V1oeA086o6Lw67PRnpL6
         28yA==
X-Forwarded-Encrypted: i=1; AHgh+RrS+wxVafVp+1Fo90nvukZzd6+l08CU96wcCz/V4m9oao36amB/fwNpKAIvutNWCDjRkOVBM0OSyzqsOJuYepOT@lists.infradead.org
X-Gm-Message-State: AOJu0YyqeSwIQTnrs/MZOx95xkPaO5q3j0b8Ip7c4lzgu3s4/uQDkNbT
	onAXG7POsoCorrdWGhlg3jbmtCmlRdHCjz/N63Ghw5dp4p/JugZyro8hWPEdfQ8MqBQ=
X-Gm-Gg: AfdE7clFMtm8eNiO2nSfY5u1HDR4BH4BolaFU8cYAxrLJDaUuoC8hOwzngkEtlPAxDH
	WSyfIfylKoYeCoucB6ZCnxKYMzsa+nURVCONWf70bGdRHiW1Ql2oW7Vn4DQ4ou5UZJQaGs6JHqy
	5M/qLD9LgmZfCBs7KXpeSXu4djY/6Iva9lx3nAkgwQLavvs5LH41801SDn9qf5Alr5UaOyKEbCH
	z0kqKyHjdx7sTWSH2KMh+FmTKxWSuiFAVkNWFYORXovrdK6wiE9Y41ESyYXRcPw5/updlgmij/B
	UnfdVyHhr+POpeNqAd/k1zjpoJ1l2xtkODR+L/CXBzjl1Wve6UH7cCRjjevmTEWcYg5VWzI6X3T
	H6Y30kCoti1/vRNxJn6MpNZaMQnINDgMiZBiR4i+D0MzEYJo1I4ZpevvaXu3pbR2+p5akEuBfiu
	EQheeSs4g3vHhlLU4Sf37cVqafAE9WKFhW+KwoHwtGp8rvzDMgdtOhCG0Ga08GoC7OCNVwwKzCA
	yOUYkrQ6qMs9wJ2VGjivGc=
X-Received: by 2002:a17:907:7292:b0:c15:ee0d:9a32 with SMTP id a640c23a62f3a-c1661680353mr381793666b.21.1784096538053;
        Tue, 14 Jul 2026 23:22:18 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d0c3cf1esm1028820366b.44.2026.07.14.23.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:22:17 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH v7 03/16] arm64: dts: st: add power-domains to sdmmc1 on stm32mp251
Date: Wed, 15 Jul 2026 08:20:20 +0200
Message-ID: <20260715062201.3599458-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
References: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_232220_532954_EB606315 
X-CRM114-Status: GOOD (  10.29  )
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

(no changes since v5)

Changes in v5:
- Added in version 5. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 9c63fdb5a885..ae36d703532c 100644
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


