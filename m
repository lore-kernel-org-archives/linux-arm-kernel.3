Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FC0CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 17:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KkOOM0vdlCAI+wIK/wdqoZizl1s5oNfkaIbRaWdhzk=; b=q8EHbBOfueHrlZvnorZQ46x7Rs
	0Th+7jciHDDHHFiYPulnw7HRtDraEUJeU0/swvlH01KTptVq1DPFqecIGKB1j8BVcbRH7rs6dDs1e
	js8bV9/QJRoq9z6vagzd4wUbtrBYFRlJEV6/e7G1wmkipS0ZDd/wgs7+oJhNd+7SBYVXAy2HKP3So
	VKhjRYIviHwQEtPvLlNKUMq+pYUJxeIdRD9fsSr1L+8mI99U7RYgh5pCwbLl1DwWCISCoRrqmzKmT
	YZ1khHSVBm/QOvBRIJbpZplBBqKZ7fbtHDZ8Baa8qtuUHUqzrffhyMqDUZ9LYkiaCPEC3+fLD51sK
	b/4gXIFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uomg7-0000000EYnN-10bL;
	Wed, 20 Aug 2025 17:32:51 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokHa-0000000EAZe-2QTK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 14:59:23 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b471756592cso4457812a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 07:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755701962; x=1756306762; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0KkOOM0vdlCAI+wIK/wdqoZizl1s5oNfkaIbRaWdhzk=;
        b=ASkU/9idTSCvHbfUn9vQC/Z3sr2MKOOcsMbKtV5r565chopNBNUu1sHR+QC2rz15Iw
         jW7tETthBQv1BryJe61UW+QCwTBVHcEerduQ4nUvuaFZT6G1F7oxAgcn99slx7nSVKFK
         uyKfoO9O/4OUh9oJi1nLH4sQreKmhKbSMneIXAc6NgnbqUXRtvled+AMChWtfpRNfHhn
         9qWVSikTXyLe1oM0nvTYKZN0x7NQq1kmTJQC2pK2ENUcDoz26hkNifvD/MGs82zIvcNM
         GMGoYqXFFawaN3PdnOcAi986Rse2LB5kRpXAHPkRJVNWIMUhuBs8lWYCx2ghmraL90uV
         r89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755701962; x=1756306762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0KkOOM0vdlCAI+wIK/wdqoZizl1s5oNfkaIbRaWdhzk=;
        b=lCD7t3oUhpIUiyUeLlsP8mIvmcTiLhrNL35+FJmPKoJ+ULWaX/QSAJ6OmoPHzKLALQ
         XIcpAqEKiNnjR453VbNHXnEHHu6HirrU4Yr3Bc/1QXynkeLU19dVT/OSPIYWT8DQqwSg
         NPpL9eFnw4KGjBA1YZlj7XV2z5sGLTQryewSmLAbfZ4ngaly/RH7OZsqWsX2wWuKLIl2
         lt+xreuiEPZEfN7Sfh4HSXS+Heq5HYx1j/HcOr1tFZSnhcaTMuPZPnQNgWH0GVpploNl
         PcOVgOZnjfYxhWjTeSn6qL4jtXweQYcTLhn7t16N2ct4UFpVE4+1icSBUyWoNb3aY0D+
         XGuw==
X-Forwarded-Encrypted: i=1; AJvYcCUC86dc9n3lAFu8FF1w7Qq732UFk73HzLAk+29ka8+cz8+gF9EwbJ4KKSxdknMwZrAPqfXPNmYf2hIWGLqYqa7T@lists.infradead.org
X-Gm-Message-State: AOJu0YxkduKZ+8wan+LxLn1D9BEgQ9EyTMHiAy8RSmej1cXompoHIzfe
	Du/HtVR3sN37cmtBcpfvtrP4/jj+shSl3aXTbwOb0YPgciRSJl1FP0GA
X-Gm-Gg: ASbGnctlVoTCe15bhosaKac4wblTYbdwQgezhtEgQxP+taJ9hAeYKr5LvLysbDhXvwy
	BABPoaEM5/39d3tbNuGLoK8RKvW7YebrQIYH9MlTn0xfph9lY4/9j+h7XPbpF7HDsbFixYDCHZs
	dUmVbec5D0M3/0GKp31d3cLcred6tqjll64wJfH6LngKon5tBAFImE19QSpgFibvWQvlTfBLKXV
	6ZdbxzxScgUmnQ4+mbdCe10OOBvBc1JsThJsk6ndShiIpB2XV+KgLRo+uFhJM0z8QggaHQROaVt
	huSiZX/P7eaPjT4a1Sxg4PC6J6hN+eTvtTJlUz3CUwdSMx7MfvH1kFb/+v6T6E9DvuogtrCG0h1
	fsfXnHyNDNB/4WguABdvrwQdiLd5RQwmuYuyMgxCsAy3qIJA=
X-Google-Smtp-Source: AGHT+IHXYambFF29Q0hwxvIFjh2f7tUM4xwJo63XfQ75yoaWfpIRIjajUj3MhVEp+rCx6yKdCppBHA==
X-Received: by 2002:a17:902:ec88:b0:240:1f19:d35c with SMTP id d9443c01a7336-245ef24ca4dmr40333355ad.39.1755701961611;
        Wed, 20 Aug 2025 07:59:21 -0700 (PDT)
Received: from [127.0.0.1] (aulavirtual.utp.edu.pe. [190.12.77.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e257809esm2606455a91.24.2025.08.20.07.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 07:59:21 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Wed, 20 Aug 2025 09:57:23 -0500
Subject: [PATCH v2 2/3] dt-bindings: clock: exynos990: Reorder IDs clocks
 and extend
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-2-v2-2-bd45e196d4c4@gmail.com>
References: <20250820-2-v2-0-bd45e196d4c4@gmail.com>
In-Reply-To: <20250820-2-v2-0-bd45e196d4c4@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755701949; l=15686;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=IZSjRet90Z7ssCuwoIO31SUnba8YT9zfKUtMi4mD8fU=;
 b=x6cUqoRJVYtcSDd3AOy/F15Vh44kENMLu2Vn8aNkxN0+P9p2d7Dmbld8rDq6D/wH0G8VPwtEw
 UH2lYdkuxfzAaYrRjfEZD6yqdVnFHfekm6I731z28g0xpPibclkYEwg
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qNvcL0Ehm3chrW9jFA2JaPVgubN5mHH//uriMxR/DlI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_075922_614549_C29A375B 
X-CRM114-Status: GOOD (  10.22  )
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

Reorganize CMU_TOP clock definitions
and add missing clock definitions for DPU and CMUREF.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 include/dt-bindings/clock/samsung,exynos990.h | 402 ++++++++++++++++++++++++++++++++--------------------------------
 1 file changed, 203 insertions(+), 199 deletions(-)

diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bindings/clock/samsung,exynos990.h
index 6b9df09d2822f1c8e5086a2fc0bda783ca224812..b384e271bf276a375f67659fc84e53350ea73c0e 100644
--- a/include/dt-bindings/clock/samsung,exynos990.h
+++ b/include/dt-bindings/clock/samsung,exynos990.h
@@ -9,205 +9,209 @@
 #define _DT_BINDINGS_CLOCK_EXYNOS_990_H
 
 /* CMU_TOP */
-#define CLK_FOUT_SHARED0_PLL		1
-#define CLK_FOUT_SHARED1_PLL		2
-#define CLK_FOUT_SHARED2_PLL		3
-#define CLK_FOUT_SHARED3_PLL		4
-#define CLK_FOUT_SHARED4_PLL		5
-#define CLK_FOUT_G3D_PLL		6
-#define CLK_FOUT_MMC_PLL		7
-#define CLK_MOUT_PLL_SHARED0		8
-#define CLK_MOUT_PLL_SHARED1		9
-#define CLK_MOUT_PLL_SHARED2		10
-#define CLK_MOUT_PLL_SHARED3		11
-#define CLK_MOUT_PLL_SHARED4		12
-#define CLK_MOUT_PLL_MMC		13
-#define CLK_MOUT_PLL_G3D		14
-#define CLK_MOUT_CMU_APM_BUS		15
-#define CLK_MOUT_CMU_AUD_CPU		16
-#define CLK_MOUT_CMU_BUS0_BUS		17
-#define CLK_MOUT_CMU_BUS1_BUS		18
-#define CLK_MOUT_CMU_BUS1_SSS		19
-#define CLK_MOUT_CMU_CIS_CLK0		20
-#define CLK_MOUT_CMU_CIS_CLK1		21
-#define CLK_MOUT_CMU_CIS_CLK2		22
-#define CLK_MOUT_CMU_CIS_CLK3		23
-#define CLK_MOUT_CMU_CIS_CLK4		24
-#define CLK_MOUT_CMU_CIS_CLK5		25
-#define CLK_MOUT_CMU_CMU_BOOST		26
-#define CLK_MOUT_CMU_CORE_BUS		27
-#define CLK_MOUT_CMU_CPUCL0_DBG_BUS	28
-#define CLK_MOUT_CMU_CPUCL0_SWITCH	29
-#define CLK_MOUT_CMU_CPUCL1_SWITCH	30
-#define CLK_MOUT_CMU_CPUCL2_BUSP	31
-#define CLK_MOUT_CMU_CPUCL2_SWITCH	32
-#define CLK_MOUT_CMU_CSIS_BUS		33
-#define CLK_MOUT_CMU_CSIS_OIS_MCU	34
-#define CLK_MOUT_CMU_DNC_BUS		35
-#define CLK_MOUT_CMU_DNC_BUSM		36
-#define CLK_MOUT_CMU_DNS_BUS		37
-#define CLK_MOUT_CMU_DPU		38
-#define CLK_MOUT_CMU_DPU_ALT		39
-#define CLK_MOUT_CMU_DSP_BUS		40
-#define CLK_MOUT_CMU_G2D_G2D		41
-#define CLK_MOUT_CMU_G2D_MSCL		42
-#define CLK_MOUT_CMU_HPM		43
-#define CLK_MOUT_CMU_HSI0_BUS		44
-#define CLK_MOUT_CMU_HSI0_DPGTC		45
-#define CLK_MOUT_CMU_HSI0_USB31DRD	46
-#define CLK_MOUT_CMU_HSI0_USBDP_DEBUG	47
-#define CLK_MOUT_CMU_HSI1_BUS		48
-#define CLK_MOUT_CMU_HSI1_MMC_CARD	49
-#define CLK_MOUT_CMU_HSI1_PCIE		50
-#define CLK_MOUT_CMU_HSI1_UFS_CARD	51
-#define CLK_MOUT_CMU_HSI1_UFS_EMBD	52
-#define CLK_MOUT_CMU_HSI2_BUS		53
-#define CLK_MOUT_CMU_HSI2_PCIE		54
-#define CLK_MOUT_CMU_IPP_BUS		55
-#define CLK_MOUT_CMU_ITP_BUS		56
-#define CLK_MOUT_CMU_MCSC_BUS		57
-#define CLK_MOUT_CMU_MCSC_GDC		58
-#define CLK_MOUT_CMU_CMU_BOOST_CPU	59
-#define CLK_MOUT_CMU_MFC0_MFC0		60
-#define CLK_MOUT_CMU_MFC0_WFD		61
-#define CLK_MOUT_CMU_MIF_BUSP		62
-#define CLK_MOUT_CMU_MIF_SWITCH		63
-#define CLK_MOUT_CMU_NPU_BUS		64
-#define CLK_MOUT_CMU_PERIC0_BUS		65
-#define CLK_MOUT_CMU_PERIC0_IP		66
-#define CLK_MOUT_CMU_PERIC1_BUS		67
-#define CLK_MOUT_CMU_PERIC1_IP		68
-#define CLK_MOUT_CMU_PERIS_BUS		69
-#define CLK_MOUT_CMU_SSP_BUS		70
-#define CLK_MOUT_CMU_TNR_BUS		71
-#define CLK_MOUT_CMU_VRA_BUS		72
-#define CLK_DOUT_CMU_APM_BUS		73
-#define CLK_DOUT_CMU_AUD_CPU		74
-#define CLK_DOUT_CMU_BUS0_BUS		75
-#define CLK_DOUT_CMU_BUS1_BUS		76
-#define CLK_DOUT_CMU_BUS1_SSS		77
-#define CLK_DOUT_CMU_CIS_CLK0		78
-#define CLK_DOUT_CMU_CIS_CLK1		79
-#define CLK_DOUT_CMU_CIS_CLK2		80
-#define CLK_DOUT_CMU_CIS_CLK3		81
-#define CLK_DOUT_CMU_CIS_CLK4		82
-#define CLK_DOUT_CMU_CIS_CLK5		83
-#define CLK_DOUT_CMU_CMU_BOOST		84
-#define CLK_DOUT_CMU_CORE_BUS		85
-#define CLK_DOUT_CMU_CPUCL0_DBG_BUS	86
-#define CLK_DOUT_CMU_CPUCL0_SWITCH	87
-#define CLK_DOUT_CMU_CPUCL1_SWITCH	88
-#define CLK_DOUT_CMU_CPUCL2_BUSP	89
-#define CLK_DOUT_CMU_CPUCL2_SWITCH	90
-#define CLK_DOUT_CMU_CSIS_BUS		91
-#define CLK_DOUT_CMU_CSIS_OIS_MCU	92
-#define CLK_DOUT_CMU_DNC_BUS		93
-#define CLK_DOUT_CMU_DNC_BUSM		94
-#define CLK_DOUT_CMU_DNS_BUS		95
-#define CLK_DOUT_CMU_DSP_BUS		96
-#define CLK_DOUT_CMU_G2D_G2D		97
-#define CLK_DOUT_CMU_G2D_MSCL		98
-#define CLK_DOUT_CMU_G3D_SWITCH		99
-#define CLK_DOUT_CMU_HPM		100
-#define CLK_DOUT_CMU_HSI0_BUS		101
-#define CLK_DOUT_CMU_HSI0_DPGTC		102
-#define CLK_DOUT_CMU_HSI0_USB31DRD	103
-#define CLK_DOUT_CMU_HSI0_USBDP_DEBUG	104
-#define CLK_DOUT_CMU_HSI1_BUS		105
-#define CLK_DOUT_CMU_HSI1_MMC_CARD	106
-#define CLK_DOUT_CMU_HSI1_PCIE		107
-#define CLK_DOUT_CMU_HSI1_UFS_CARD	108
-#define CLK_DOUT_CMU_HSI1_UFS_EMBD	109
-#define CLK_DOUT_CMU_HSI2_BUS		110
-#define CLK_DOUT_CMU_HSI2_PCIE		111
-#define CLK_DOUT_CMU_IPP_BUS		112
-#define CLK_DOUT_CMU_ITP_BUS		113
-#define CLK_DOUT_CMU_MCSC_BUS		114
-#define CLK_DOUT_CMU_MCSC_GDC		115
-#define CLK_DOUT_CMU_CMU_BOOST_CPU	116
-#define CLK_DOUT_CMU_MFC0_MFC0		117
-#define CLK_DOUT_CMU_MFC0_WFD		118
-#define CLK_DOUT_CMU_MIF_BUSP		119
-#define CLK_DOUT_CMU_NPU_BUS		120
-#define CLK_DOUT_CMU_OTP		121
-#define CLK_DOUT_CMU_PERIC0_BUS		122
-#define CLK_DOUT_CMU_PERIC0_IP		123
-#define CLK_DOUT_CMU_PERIC1_BUS		124
-#define CLK_DOUT_CMU_PERIC1_IP		125
-#define CLK_DOUT_CMU_PERIS_BUS		126
-#define CLK_DOUT_CMU_SSP_BUS		127
-#define CLK_DOUT_CMU_TNR_BUS		128
-#define CLK_DOUT_CMU_VRA_BUS		129
-#define CLK_DOUT_CMU_DPU		130
-#define CLK_DOUT_CMU_DPU_ALT		131
-#define CLK_DOUT_CMU_SHARED0_DIV2	132
-#define CLK_DOUT_CMU_SHARED0_DIV3	133
-#define CLK_DOUT_CMU_SHARED0_DIV4	134
-#define CLK_DOUT_CMU_SHARED1_DIV2	135
-#define CLK_DOUT_CMU_SHARED1_DIV3	136
-#define CLK_DOUT_CMU_SHARED1_DIV4	137
-#define CLK_DOUT_CMU_SHARED2_DIV2	138
-#define CLK_DOUT_CMU_SHARED4_DIV2	139
-#define CLK_DOUT_CMU_SHARED4_DIV3	140
-#define CLK_DOUT_CMU_SHARED4_DIV4	141
-#define CLK_GOUT_CMU_G3D_BUS		142
-#define CLK_GOUT_CMU_MIF_SWITCH		143
-#define CLK_GOUT_CMU_APM_BUS		144
-#define CLK_GOUT_CMU_AUD_CPU		145
-#define CLK_GOUT_CMU_BUS0_BUS		146
-#define CLK_GOUT_CMU_BUS1_BUS		147
-#define CLK_GOUT_CMU_BUS1_SSS		148
-#define CLK_GOUT_CMU_CIS_CLK0		149
-#define CLK_GOUT_CMU_CIS_CLK1		150
-#define CLK_GOUT_CMU_CIS_CLK2		151
-#define CLK_GOUT_CMU_CIS_CLK3		152
-#define CLK_GOUT_CMU_CIS_CLK4		153
-#define CLK_GOUT_CMU_CIS_CLK5		154
-#define CLK_GOUT_CMU_CORE_BUS		155
-#define CLK_GOUT_CMU_CPUCL0_DBG_BUS	156
-#define CLK_GOUT_CMU_CPUCL0_SWITCH	157
-#define CLK_GOUT_CMU_CPUCL1_SWITCH	158
-#define CLK_GOUT_CMU_CPUCL2_BUSP	159
-#define CLK_GOUT_CMU_CPUCL2_SWITCH	160
-#define CLK_GOUT_CMU_CSIS_BUS		161
-#define CLK_GOUT_CMU_CSIS_OIS_MCU	162
-#define CLK_GOUT_CMU_DNC_BUS		163
-#define CLK_GOUT_CMU_DNC_BUSM		164
-#define CLK_GOUT_CMU_DNS_BUS		165
-#define CLK_GOUT_CMU_DPU		166
-#define CLK_GOUT_CMU_DPU_BUS		167
-#define CLK_GOUT_CMU_DSP_BUS		168
-#define CLK_GOUT_CMU_G2D_G2D		169
-#define CLK_GOUT_CMU_G2D_MSCL		170
-#define CLK_GOUT_CMU_G3D_SWITCH		171
-#define CLK_GOUT_CMU_HPM		172
-#define CLK_GOUT_CMU_HSI0_BUS		173
-#define CLK_GOUT_CMU_HSI0_DPGTC		174
-#define CLK_GOUT_CMU_HSI0_USB31DRD	175
-#define CLK_GOUT_CMU_HSI0_USBDP_DEBUG	176
-#define CLK_GOUT_CMU_HSI1_BUS		177
-#define CLK_GOUT_CMU_HSI1_MMC_CARD	178
-#define CLK_GOUT_CMU_HSI1_PCIE		179
-#define CLK_GOUT_CMU_HSI1_UFS_CARD	180
-#define CLK_GOUT_CMU_HSI1_UFS_EMBD	181
-#define CLK_GOUT_CMU_HSI2_BUS		182
-#define CLK_GOUT_CMU_HSI2_PCIE		183
-#define CLK_GOUT_CMU_IPP_BUS		184
-#define CLK_GOUT_CMU_ITP_BUS		185
-#define CLK_GOUT_CMU_MCSC_BUS		186
-#define CLK_GOUT_CMU_MCSC_GDC		187
-#define CLK_GOUT_CMU_MFC0_MFC0		188
-#define CLK_GOUT_CMU_MFC0_WFD		189
-#define CLK_GOUT_CMU_MIF_BUSP		190
-#define CLK_GOUT_CMU_NPU_BUS		191
-#define CLK_GOUT_CMU_PERIC0_BUS		192
-#define CLK_GOUT_CMU_PERIC0_IP		193
-#define CLK_GOUT_CMU_PERIC1_BUS		194
-#define CLK_GOUT_CMU_PERIC1_IP		195
-#define CLK_GOUT_CMU_PERIS_BUS		196
-#define CLK_GOUT_CMU_SSP_BUS		197
-#define CLK_GOUT_CMU_TNR_BUS		198
-#define CLK_GOUT_CMU_VRA_BUS		199
+#define CLK_FOUT_G3D_PLL		1
+#define CLK_FOUT_MMC_PLL		2
+#define CLK_FOUT_SHARED0_PLL		3
+#define CLK_FOUT_SHARED1_PLL		4
+#define CLK_FOUT_SHARED2_PLL		5
+#define CLK_FOUT_SHARED3_PLL		6
+#define CLK_FOUT_SHARED4_PLL		7
+#define CLK_MOUT_PLL_G3D		8
+#define CLK_MOUT_PLL_MMC		9
+#define CLK_MOUT_PLL_SHARED0		10
+#define CLK_MOUT_PLL_SHARED1		11
+#define CLK_MOUT_PLL_SHARED2		12
+#define CLK_MOUT_PLL_SHARED3		13
+#define CLK_MOUT_PLL_SHARED4		14
+#define CLK_MOUT_CMU_DPU_BUS		15
+#define CLK_MOUT_CMU_APM_BUS		16
+#define CLK_MOUT_CMU_AUD_CPU		17
+#define CLK_MOUT_CMU_BUS0_BUS		18
+#define CLK_MOUT_CMU_BUS1_BUS		19
+#define CLK_MOUT_CMU_BUS1_SSS		20
+#define CLK_MOUT_CMU_CIS_CLK0		21
+#define CLK_MOUT_CMU_CIS_CLK1		22
+#define CLK_MOUT_CMU_CIS_CLK2		23
+#define CLK_MOUT_CMU_CIS_CLK3		24
+#define CLK_MOUT_CMU_CIS_CLK4		25
+#define CLK_MOUT_CMU_CIS_CLK5		26
+#define CLK_MOUT_CMU_CMU_BOOST		27
+#define CLK_MOUT_CMU_CORE_BUS		28
+#define CLK_MOUT_CMU_CPUCL0_DBG_BUS	29
+#define CLK_MOUT_CMU_CPUCL0_SWITCH	30
+#define CLK_MOUT_CMU_CPUCL1_SWITCH	31
+#define CLK_MOUT_CMU_CPUCL2_BUSP	32
+#define CLK_MOUT_CMU_CPUCL2_SWITCH	33
+#define CLK_MOUT_CMU_CSIS_BUS		34
+#define CLK_MOUT_CMU_CSIS_OIS_MCU	35
+#define CLK_MOUT_CMU_DNC_BUS		36
+#define CLK_MOUT_CMU_DNC_BUSM		37
+#define CLK_MOUT_CMU_DNS_BUS		38
+#define CLK_MOUT_CMU_DPU		39
+#define CLK_MOUT_CMU_DPU_ALT		40
+#define CLK_MOUT_CMU_DSP_BUS		41
+#define CLK_MOUT_CMU_G2D_G2D		42
+#define CLK_MOUT_CMU_G2D_MSCL		43
+#define CLK_MOUT_CMU_HPM		44
+#define CLK_MOUT_CMU_HSI0_BUS		45
+#define CLK_MOUT_CMU_HSI0_DPGTC		46
+#define CLK_MOUT_CMU_HSI0_USB31DRD	47
+#define CLK_MOUT_CMU_HSI0_USBDP_DEBUG	48
+#define CLK_MOUT_CMU_HSI1_BUS		49
+#define CLK_MOUT_CMU_HSI1_MMC_CARD	50
+#define CLK_MOUT_CMU_HSI1_PCIE		51
+#define CLK_MOUT_CMU_HSI1_UFS_CARD	52
+#define CLK_MOUT_CMU_HSI1_UFS_EMBD	53
+#define CLK_MOUT_CMU_HSI2_BUS		54
+#define CLK_MOUT_CMU_HSI2_PCIE		55
+#define CLK_MOUT_CMU_IPP_BUS		56
+#define CLK_MOUT_CMU_ITP_BUS		57
+#define CLK_MOUT_CMU_MCSC_BUS		58
+#define CLK_MOUT_CMU_MCSC_GDC		59
+#define CLK_MOUT_CMU_CMU_BOOST_CPU	60
+#define CLK_MOUT_CMU_MFC0_MFC0		61
+#define CLK_MOUT_CMU_MFC0_WFD		62
+#define CLK_MOUT_CMU_MIF_BUSP		63
+#define CLK_MOUT_CMU_MIF_SWITCH		64
+#define CLK_MOUT_CMU_NPU_BUS		65
+#define CLK_MOUT_CMU_PERIC0_BUS		66
+#define CLK_MOUT_CMU_PERIC0_IP		67
+#define CLK_MOUT_CMU_PERIC1_BUS		68
+#define CLK_MOUT_CMU_PERIC1_IP		69
+#define CLK_MOUT_CMU_PERIS_BUS		70
+#define CLK_MOUT_CMU_SSP_BUS		71
+#define CLK_MOUT_CMU_TNR_BUS		72
+#define CLK_MOUT_CMU_VRA_BUS		73
+#define CLK_MOUT_CMU_CMUREF		74
+#define CLK_MOUT_CMU_CLK_CMUREF		75
+#define CLK_DOUT_CMU_APM_BUS		76
+#define CLK_DOUT_CMU_AUD_CPU		77
+#define CLK_DOUT_CMU_BUS0_BUS		78
+#define CLK_DOUT_CMU_BUS1_BUS		79
+#define CLK_DOUT_CMU_BUS1_SSS		80
+#define CLK_DOUT_CMU_CIS_CLK0		81
+#define CLK_DOUT_CMU_CIS_CLK1		82
+#define CLK_DOUT_CMU_CIS_CLK2		83
+#define CLK_DOUT_CMU_CIS_CLK3		84
+#define CLK_DOUT_CMU_CIS_CLK4		85
+#define CLK_DOUT_CMU_CIS_CLK5		86
+#define CLK_DOUT_CMU_CMU_BOOST		87
+#define CLK_DOUT_CMU_CORE_BUS		88
+#define CLK_DOUT_CMU_CPUCL0_DBG_BUS	89
+#define CLK_DOUT_CMU_CPUCL0_SWITCH	90
+#define CLK_DOUT_CMU_CPUCL1_SWITCH	91
+#define CLK_DOUT_CMU_CPUCL2_BUSP	92
+#define CLK_DOUT_CMU_CPUCL2_SWITCH	93
+#define CLK_DOUT_CMU_CSIS_BUS		94
+#define CLK_DOUT_CMU_CSIS_OIS_MCU	95
+#define CLK_DOUT_CMU_DNC_BUS		96
+#define CLK_DOUT_CMU_DNC_BUSM		97
+#define CLK_DOUT_CMU_DNS_BUS		98
+#define CLK_DOUT_CMU_DSP_BUS		99
+#define CLK_DOUT_CMU_G2D_G2D		100
+#define CLK_DOUT_CMU_G2D_MSCL		101
+#define CLK_DOUT_CMU_G3D_SWITCH		102
+#define CLK_DOUT_CMU_HPM		103
+#define CLK_DOUT_CMU_HSI0_BUS		104
+#define CLK_DOUT_CMU_HSI0_DPGTC		105
+#define CLK_DOUT_CMU_HSI0_USB31DRD	106
+#define CLK_DOUT_CMU_HSI0_USBDP_DEBUG	107
+#define CLK_DOUT_CMU_HSI1_BUS		108
+#define CLK_DOUT_CMU_HSI1_MMC_CARD	109
+#define CLK_DOUT_CMU_HSI1_PCIE		110
+#define CLK_DOUT_CMU_HSI1_UFS_CARD	111
+#define CLK_DOUT_CMU_HSI1_UFS_EMBD	112
+#define CLK_DOUT_CMU_HSI2_BUS		113
+#define CLK_DOUT_CMU_HSI2_PCIE		114
+#define CLK_DOUT_CMU_IPP_BUS		115
+#define CLK_DOUT_CMU_ITP_BUS		116
+#define CLK_DOUT_CMU_MCSC_BUS		117
+#define CLK_DOUT_CMU_MCSC_GDC		118
+#define CLK_DOUT_CMU_CMU_BOOST_CPU	119
+#define CLK_DOUT_CMU_MFC0_MFC0		120
+#define CLK_DOUT_CMU_MFC0_WFD		121
+#define CLK_DOUT_CMU_MIF_BUSP		122
+#define CLK_DOUT_CMU_NPU_BUS		123
+#define CLK_DOUT_CMU_OTP		124
+#define CLK_DOUT_CMU_PERIC0_BUS		125
+#define CLK_DOUT_CMU_PERIC0_IP		126
+#define CLK_DOUT_CMU_PERIC1_BUS		127
+#define CLK_DOUT_CMU_PERIC1_IP		128
+#define CLK_DOUT_CMU_PERIS_BUS		129
+#define CLK_DOUT_CMU_SSP_BUS		130
+#define CLK_DOUT_CMU_TNR_BUS		131
+#define CLK_DOUT_CMU_VRA_BUS		132
+#define CLK_DOUT_CMU_DPU		133
+#define CLK_DOUT_CMU_DPU_ALT		134
+#define CLK_DOUT_CMU_CLK_CMUREF		135
+#define CLK_DOUT_CMU_SHARED0_DIV2	136
+#define CLK_DOUT_CMU_SHARED0_DIV3	137
+#define CLK_DOUT_CMU_SHARED0_DIV4	138
+#define CLK_DOUT_CMU_SHARED1_DIV2	139
+#define CLK_DOUT_CMU_SHARED1_DIV3	140
+#define CLK_DOUT_CMU_SHARED1_DIV4	141
+#define CLK_DOUT_CMU_SHARED2_DIV2	142
+#define CLK_DOUT_CMU_SHARED4_DIV2	145
+#define CLK_DOUT_CMU_SHARED4_DIV3	146
+#define CLK_DOUT_CMU_SHARED4_DIV4	147
+#define CLK_GOUT_CMU_G3D_BUS		148
+#define CLK_GOUT_CMU_MIF_SWITCH		149
+#define CLK_GOUT_CMU_APM_BUS		150
+#define CLK_GOUT_CMU_AUD_CPU		151
+#define CLK_GOUT_CMU_BUS0_BUS		152
+#define CLK_GOUT_CMU_BUS1_BUS		153
+#define CLK_GOUT_CMU_BUS1_SSS		154
+#define CLK_GOUT_CMU_CIS_CLK0		155
+#define CLK_GOUT_CMU_CIS_CLK1		156
+#define CLK_GOUT_CMU_CIS_CLK2		157
+#define CLK_GOUT_CMU_CIS_CLK3		158
+#define CLK_GOUT_CMU_CIS_CLK4		159
+#define CLK_GOUT_CMU_CIS_CLK5		160
+#define CLK_GOUT_CMU_CORE_BUS		161
+#define CLK_GOUT_CMU_CPUCL0_DBG_BUS	162
+#define CLK_GOUT_CMU_CPUCL0_SWITCH	163
+#define CLK_GOUT_CMU_CPUCL1_SWITCH	164
+#define CLK_GOUT_CMU_CPUCL2_BUSP	165
+#define CLK_GOUT_CMU_CPUCL2_SWITCH	166
+#define CLK_GOUT_CMU_CSIS_BUS		167
+#define CLK_GOUT_CMU_CSIS_OIS_MCU	168
+#define CLK_GOUT_CMU_DNC_BUS		169
+#define CLK_GOUT_CMU_DNC_BUSM		170
+#define CLK_GOUT_CMU_DNS_BUS		171
+#define CLK_GOUT_CMU_DPU		172
+#define CLK_GOUT_CMU_DPU_BUS		173
+#define CLK_GOUT_CMU_DSP_BUS		174
+#define CLK_GOUT_CMU_G2D_G2D		175
+#define CLK_GOUT_CMU_G2D_MSCL		176
+#define CLK_GOUT_CMU_G3D_SWITCH		177
+#define CLK_GOUT_CMU_HPM		178
+#define CLK_GOUT_CMU_HSI0_BUS		179
+#define CLK_GOUT_CMU_HSI0_DPGTC		180
+#define CLK_GOUT_CMU_HSI0_USB31DRD	181
+#define CLK_GOUT_CMU_HSI0_USBDP_DEBUG	182
+#define CLK_GOUT_CMU_HSI1_BUS		183
+#define CLK_GOUT_CMU_HSI1_MMC_CARD	184
+#define CLK_GOUT_CMU_HSI1_PCIE		185
+#define CLK_GOUT_CMU_HSI1_UFS_CARD	186
+#define CLK_GOUT_CMU_HSI1_UFS_EMBD	187
+#define CLK_GOUT_CMU_HSI2_BUS		188
+#define CLK_GOUT_CMU_HSI2_PCIE		189
+#define CLK_GOUT_CMU_IPP_BUS		190
+#define CLK_GOUT_CMU_ITP_BUS		191
+#define CLK_GOUT_CMU_MCSC_BUS		192
+#define CLK_GOUT_CMU_MCSC_GDC		193
+#define CLK_GOUT_CMU_MFC0_MFC0		194
+#define CLK_GOUT_CMU_MFC0_WFD		195
+#define CLK_GOUT_CMU_MIF_BUSP		196
+#define CLK_GOUT_CMU_NPU_BUS		197
+#define CLK_GOUT_CMU_PERIC0_BUS		198
+#define CLK_GOUT_CMU_PERIC0_IP		199
+#define CLK_GOUT_CMU_PERIC1_BUS		200
+#define CLK_GOUT_CMU_PERIC1_IP		201
+#define CLK_GOUT_CMU_PERIS_BUS		202
+#define CLK_GOUT_CMU_SSP_BUS		203
+#define CLK_GOUT_CMU_TNR_BUS		204
+#define CLK_GOUT_CMU_VRA_BUS		205
 
 /* CMU_HSI0 */
 #define CLK_MOUT_HSI0_BUS_USER				1

-- 
2.49.0


