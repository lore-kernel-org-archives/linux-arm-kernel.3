Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE9CC79F90
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 13:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8OmmJNn+r/Hwt1QPUnzFTymxge+nDosrd+T12lTVRk=; b=ki1lqtAzRdoq8wxLNBkz4bt8MR
	H1JLReHCEdM10EzdoWXnlsNziZIpPyfgneV7cjI+Dqs7N1G8pnT45GmDGXAc1Zk18sPQNq8vxcFlx
	roMg6H9kqp7VfCYjLkyzwVQoB92X2EqZp5Ys3A0AFnJMG5hFrBWsCJqL+5XNpHEuScaA7+mA1uZrE
	3iKf9jXNMz0qwU495ROLGumhy4XI+bBlmrtRwrBRiaYP8eEduAacbdrtzzi0ghvD1Dx5ouraP8dxg
	Wme/NFff/G/BR04+S+/TKzG9Yk0bdys9Hfhf8asW7l6r3wnREDne+0akOhhcGmpIUkFKhkxfBqd2I
	j3gykEFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckj7-0000000BTPS-2T6e;
	Mon, 05 Jan 2026 13:34:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckj3-0000000BTJ2-01oE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 13:34:26 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605A2kZK3541656
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Jan 2026 13:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u8OmmJNn+r/Hwt1QPUnzFTymxge+nDosrd+T12lTVRk=; b=i0LFytSmb8lkHp83
	dtwiy4k/HqZDJd/ezwdRDTgPfqIdxQoFFjiuYEMMWn6yHfuPpugBHmB7AgnOFrfy
	0mnTR+NQVJJRoIWNAa8eU+8jhFn6Tc5EHqfJA2qQueEyZ4IDHUl7rfaxVaFzcnLn
	7vsT3eF0QuDrcYPYCp7GOQYGTVkdQ/paqYtDxM+pdAZTbeEuoq+iWp3r2bMZZpeI
	0w7A30mPMK1AHLtlh847Ti4gbk6oqBvxlvUwlZhLHsC/XbskcjBcU6d4CTfcwX/u
	KhT+uZomlRkhhdgZ6c3hiyK2xenBKW5ll1Nc9YhVqKnrfBCd13tEL3viR2j+++3F
	jFq7hg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg57shmd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 13:34:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6855557aso51126441cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 05:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767620063; x=1768224863; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u8OmmJNn+r/Hwt1QPUnzFTymxge+nDosrd+T12lTVRk=;
        b=QmgE73uc60YGva6+MlQG6n1A0Es+cNVmVuPRQ6ck8M0ZO7DGEPWf/dLQMhS1I8FHQV
         57Dd9ksz9UGAbo7U53uV/D92zQuk8byDg9qAJ1DsrZhm71MAmKv4kfQcKKWVCBDtbzvF
         RP/4b+AT2U+Dv5yj9IytkJIeGLcj4qA8DZbw/vyizbS49NPJmvD9Gqc/NU/ybmdiEEZF
         wlGP1epgv5h8lp9uF03K2s1LwLs71tmZ6HAD9cF3EHbxlrwetNi6jInAaqzVHoIYA1hy
         J71QTDhPFFcmw6ZIKwipphFGCfT1bH+mn447p5ejxcd/xoehNBTrLQDGCNcw2Dj0oLCx
         nvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767620063; x=1768224863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u8OmmJNn+r/Hwt1QPUnzFTymxge+nDosrd+T12lTVRk=;
        b=O8CDme/lQVxP2Iunkl0R3mTR+M6/5eHzdeXPyK3LMxzRNnhGkQketx9EUynmBfMpAB
         u2HM955TymupUZhv/XglGr2oKhbsaOMgfRvdPr9mGA03/LjrRV968iyW/qlOO1GnuloM
         N9syHKTVWBnzFHXz9DhlIZIaTmPWHCrLn0vhpAYmKQmoqk26k+d0Zs6n4unx9nnicUFU
         ml2xxi6aJyOKgFwyghW3Wnj2afQ2xeGQOFWu5HkBjTsJ4z98dQ3l5u/Z0YBR4kFRYmp5
         pUhxIDXKyTJLGRNP5quS6M+4Tl+gjV+7YY9D6Gb/acmPwshtXsi4iVFNG+TKi5nC/prH
         YxNw==
X-Forwarded-Encrypted: i=1; AJvYcCWrg/GsSM7VS4Z/VEFQlrVAcUVwcrxY4sC0e/wXOtiZKYnFTGoieJHAla40DpxD8cnze4c6PYw1L4T4ZGpqL/tC@lists.infradead.org
X-Gm-Message-State: AOJu0YyyYx5Gae0GOainxezY3+Jed8sxSxwF38xFM/OOhPeKHBs1yDU2
	fYaULI1XUcygVXohkrUrQDyjBwVT2zv6JsydEgw3y4CFlXkuK2F5FkRFZkaanylFYr8wmA01cC+
	aPqhpBzvzx0H2SUCv/+kBDfKJUTOY7X7NPwUV9w+PiwA8jaCcXGUa47c6k3TxvBuMbNgVg97X0+
	yyUA==
X-Gm-Gg: AY/fxX5Ha2+GyonKKf4pj7emRcWsObxApwfxr2tDGoCEb44Ta65Cxapuxn2JADF8v6K
	ciAvNC4LGtY6gIZBFspAXDDkJdAkhtspBVLwvTO9aNsPVtpx8oY9ucjfQ3ApT9/6QgPf6knEhh9
	oS7hBvCC24oipXm70HugA+10mYMUWDnqjcwxw7zhy3gcmhD0VC9dvIrPjpyzh1Goj3B+RkJL7gW
	X4YWlJfeMFNrx0tdrEkUDxkOS9AF+zr9S1p+S8rJ0EzzfsiZzUBKJxu7UolTKyouhwtVfCK6kHE
	IDzC6kHhMlTTxSFpdhdYPuU1Fl9yexUm9xi4PxNc+SHLFqaPIj0opBNfOilr9G6iDYRONJyW9pI
	hkAifrxYvOpKonr20kSmSWgJYSKHepC8SZQ==
X-Received: by 2002:a05:622a:244:b0:4ed:7fe3:7be7 with SMTP id d75a77b69052e-4ff46bfa6a5mr90855391cf.24.1767620063373;
        Mon, 05 Jan 2026 05:34:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH22+wbC/8ocAPNid4zwKCPLpHyZ3rp4TFMtIubPKSch4hbyut4GTVmx04qGX7V0XRikuXA6w==
X-Received: by 2002:a05:622a:244:b0:4ed:7fe3:7be7 with SMTP id d75a77b69052e-4ff46bfa6a5mr90854841cf.24.1767620062896;
        Mon, 05 Jan 2026 05:34:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d143f75sm147211015e9.5.2026.01.05.05.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:34:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 14:33:49 +0100
Subject: [PATCH 11/11] cpufreq: s5pv210: Simplify with scoped for each OF
 child loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-of-for-each-compatible-scoped-v1-11-24e99c177164@oss.qualcomm.com>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
To: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1441;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9xYA0AmVAhViPtU3dAaeClRgRl0bvu0O3AlHrFxfqFE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW72/y4CuyYTjdCordJY87DDcZCQImkSMPz5au
 +HhLxRd3cWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVu9vwAKCRDBN2bmhouD
 13e0D/wKDkZR+oKRpnlwWONfu2Y2/SNHWR8KA7TqekRFYafhYbZkvcHqlge7N3lURLyM9PvTjwk
 zqjR+rondooIsMzxGjfU+iaQiN+jQpeqV/bWMs2T3BEY5zOlToLQpNrr1gOyMpu4MZvIEVU11/R
 ezB/P2yn3Ejt62QO08r4mKcEQSzjz/ncjSX+7y7kkqpx+02YnR4dlQmCZDlS1qPShxQYg2lqu0s
 hCxjDvW2sunRizv8gjInpk6FT9u/Mlg3FvmWKBfQmKDcYB09lYkvXRkUZzAGEuv0dhAZEuLZ9/H
 B22GVb/cxXtk6U6GPjEw7x+IrpIPbpq3Oo6Fe/xr+gAgDdbfYKkC0ltJ8W9NaJf/SOEzzNy5Wic
 YFVfKTzRWchTMRonhmvPXLoxwvQZ5kuEW1zj5aiIVRpgsADyNKpkFxV7nuFKs4mZlYxTuPtTWPy
 brKRg+KVLL3PyLr5ooNsLN7MZhpwVlV/QNogFw+fY3dphKjRo4qMbZqjW90dB7Rgu5BAF23NWq2
 o5Vg+Gsx8Yee//iPiZovGUYQZAF4+k3D2Yku7y8PmhNwvzovMT3WQ5L5MdQJjSsrAxZasbnJ+pi
 SWqICNkVItqpBHbl+hZ4mVYVIPNvroxc/QTm2/E79KJhE3397HEt5Y6oQeKvZFOFdesUKeV7mmf
 YPx3kGjETmm70cA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=UJ/Q3Sfy c=1 sm=1 tr=0 ts=695bbde0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8YWg2ve-cigzn2S1SOoA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExOCBTYWx0ZWRfX+huwGvx1fa9q
 vfQitL6sXArlqUQh8itgkWU2g+QIwv/qXkg73dZFLE+VvVuwZphq7ys8iIA7bZCQLhmhy4O++O0
 pCov39rZtW0fOZqioFdO7n0WljxP1nW778zUk8R9sti2cw9jVb3veT6VC2l2UFYpEZ3Ygg2yiPh
 TT5JubXuJoKptrJZTI60Q9wsLHFvunRSzSwCUyFBmseogxZXp4sTvd+ooerGE9x+x4Qjw6WIc38
 C67oIBooYW/Der0QuAeswhrxzrrr/7+RtV1A0QD+yDfTATc2Afwebgaq4Au9ZbCmWIZEk6PMgEs
 O94Gw/WXoDP4VtNH/o6pLYL4zU4vyXKMA0qJBtl59AhLIzwgJF5v0Vu2LodhbPVXN9TBfemHk2U
 L2LycMvbEZ7ctKJa7nrL3C8sUHNH2CQ9aWMm8Kflc3FCjTS1Vo2bybIoRNqsTDskNOFaR1NGU7T
 0pC6TCGK+tBUbE2ASFw==
X-Proofpoint-ORIG-GUID: VB3V5-tEgDJjoUbbKvPyPEPJde7LQkkA
X-Proofpoint-GUID: VB3V5-tEgDJjoUbbKvPyPEPJde7LQkkA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_053425_094495_E1C2E4FB 
X-CRM114-Status: GOOD (  17.55  )
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

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.  Note that there is another part of code using "np"
variable, so scoped loop should not shadow it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the first patch.
---
 drivers/cpufreq/s5pv210-cpufreq.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
index ba8a1c96427a..e64e84e1ee79 100644
--- a/drivers/cpufreq/s5pv210-cpufreq.c
+++ b/drivers/cpufreq/s5pv210-cpufreq.c
@@ -629,19 +629,17 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
 		goto err_clock;
 	}
 
-	for_each_compatible_node(np, NULL, "samsung,s5pv210-dmc") {
-		id = of_alias_get_id(np, "dmc");
+	for_each_compatible_node_scoped(dmc, NULL, "samsung,s5pv210-dmc") {
+		id = of_alias_get_id(dmc, "dmc");
 		if (id < 0 || id >= ARRAY_SIZE(dmc_base)) {
-			dev_err(dev, "failed to get alias of dmc node '%pOFn'\n", np);
-			of_node_put(np);
+			dev_err(dev, "failed to get alias of dmc node '%pOFn'\n", dmc);
 			result = id;
 			goto err_clk_base;
 		}
 
-		dmc_base[id] = of_iomap(np, 0);
+		dmc_base[id] = of_iomap(dmc, 0);
 		if (!dmc_base[id]) {
 			dev_err(dev, "failed to map dmc%d registers\n", id);
-			of_node_put(np);
 			result = -EFAULT;
 			goto err_dmc;
 		}

-- 
2.51.0


