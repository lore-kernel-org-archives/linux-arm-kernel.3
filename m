Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C7FC47BD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 09:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5WPI40gVqR0fdkwizIfzBG4ci5WY3UJA42a8INrrfw=; b=uwGknRBCqe34XiRAHDo9sGUtPe
	NxDlD87seaxnlz2TYe1dRqlhM+Rueitat9YsVciTLv87gdvm+1xI6SLu/J/Qz5D97t4SBSD2H5/9X
	XEuV2I0Hyja3Cmq5fmHSyvVztXr8bEiZ/5GisgF38YzmM8BMKEqBJSSiU9u2J6gBfWwwgFPYiRu/7
	ciGn29itBDd/xR6wOrJHVAcUmIe77o3LOLtL9R7nfbkJtniACK5UYkUEPVxtTVTC4HRex/hr/2JP0
	4WLQZ02ngR1A7z4mEd/ZD/EWAwCHNEHOTNouPhzCxu+usMjlPJSwyrImBzRuOac36mgJpkUm+r7kC
	sB2A1Xjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3Av-0000000CgB0-22h3;
	Tue, 06 Jan 2026 09:16:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3AO-0000000Cfwi-3XPS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 09:16:15 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QYK4529153
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Jan 2026 09:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A5WPI40gVqR0fdkwizIfzBG4ci5WY3UJA42a8INrrfw=; b=TBigHb7HA0b+swLJ
	OxUCdr7MQEGhSL/eiW+KHB2Gwxt6Z7XFfaMKxdRs4m6fILI39Pe2EfmyxUj8SvzC
	mn0JWowm85b3wmMiYsEL/A73S5/npoav2ydHWAjDAUuLwF95xgEnRv32uu9K6HH1
	dYxhcMXcY/IH66LJV48tVrAtvQXecbSxEBM6GfOOWnF680HECm6ugyEeKbzo0k8u
	KKH9L5bTETMgZg9gQZQyF8kiftS7ktBPqiw/3Ckdz3994DuSscuvX15EAd0QMb+1
	gy1DnIBANUZdVQFMWsRje80AeGASDTNcB2IznoRH8/FbwP/m9+KRoqPaxc+oQBP+
	mfH31Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bggqu2j2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 09:15:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee16731ceaso16825001cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 01:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690951; x=1768295751; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5WPI40gVqR0fdkwizIfzBG4ci5WY3UJA42a8INrrfw=;
        b=im0fsc0QFE6Ufk5Gi/OWxEfLlXuEvd7jgoy2O8f4txTXz3rTpxrlZk7FOZb8uG/Wax
         59CHTNEEzW/9/NPBfA4OZJ5JNTO02617KKJfxWttinaWZq4pVUroYX48/RgJlVkDACG/
         +kSBwdGk6XImIak6sykTiOYuV6CzYPQkTXnC8rmnGap934tUYiWgdnd3SXOmuidGyyKr
         x8cFouZTu8C1d/UaiMYm750wm9bdsjaktedwzz/8JNySjWWc+ypuB04IpARWwjYDlQZU
         7X+eq4DQ57naI75Tvsrl0E1LPe/xYCrYuMtcXr3rD8vVgrU7mPQz79A/8HxhCQF/kvDp
         NvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690951; x=1768295751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A5WPI40gVqR0fdkwizIfzBG4ci5WY3UJA42a8INrrfw=;
        b=E4l0t3ma9yqQxgjmoZLe0h9S1pLV93hN5HZmh1lJdvXmbseEtX/Dsa/LApIfVz4GrC
         WOf5DnmHGT0lWPcbb6NGmsj2vDQtBWLkCd3aqOZOZwblrYieNdz2LW+Ei5fCVyIGT8CU
         tbuTnb1ZP/4GqWIQIz75gcmQm1NK0pXxT2YbQoqnvivDSwkc6q0MNo8GO/a5O6HZTpeg
         tMGjC0XxvMfipwrBNPvIGnuAn3EAQtI9PO+4F0iF8N4nOIVjWSfc9u1mETjEXmqGbi37
         ShcNhro8fZ8T0cGY++O6tEtmKtpGbSS3wX1b5ctvlZuGlzYisUlwP0nZefKU7U0bfIwW
         Vd+g==
X-Forwarded-Encrypted: i=1; AJvYcCVLjZ5SoTjcvh6YZYlPL0N/8aNQENHZud2jp2FgqMemIadtYk1vFgB9ObeoRLWsnoy3vBwV2SNdQWxmuLfSX8dj@lists.infradead.org
X-Gm-Message-State: AOJu0YwIUprkbe/gxomIDPLfNszp5kE9XdJA4J40CbKA4m7d4RqFHWZw
	6l/knXptCDKJAlZlhtOHdSPXtATAmjD59HfFOCIQLlD9qRddtK6Icgd1A4prnOGiJSUdVWaA+Cd
	fekAYErn5ITFB7IVilAmYPHW73wp10TJEESgoeHnEOdBcNrMdgzoLAC+SFnXfbfRjfgGsH9FtrK
	oJoQ==
X-Gm-Gg: AY/fxX7nyhbUWPePlsVWCV8kEip6SQqANcdcJjb/du3rkDepqZNnuMvD8MwKWs+3vta
	7p/Wj9UR4M3/ALrVY8N9OhScmHcjKF73PXy8poPh7mmLNM4fvjXpkYe4njTwcnaXuTMdCH7IRaE
	5VTK45YNUoOuggKBSMkcqMM/LEMReCNlycbRWcenCLUQu6+hzrsbjO6Ucx4J3zk4CWa6vEZoODd
	MzlEArFEg/ZZ6SPycxigLIKKLboyl4lnX9yoQc9oOGbx6LveD122kQYnh1DKoyeifdWF8rzyF9u
	PQstTuuaZwbT2YF4EgcEErBeIwlbb5T85zr9nu97WjpQtOv/Ct2hofUAzmnI5+CkNIgT9xWZ5/K
	9lmACIE1lAhz0rKKsf5BgQVCD04EUi7GaFQ==
X-Received: by 2002:a05:622a:19a9:b0:4f1:ccdd:ffde with SMTP id d75a77b69052e-4ffa76d781emr30075631cf.21.1767690950795;
        Tue, 06 Jan 2026 01:15:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IED0yXdejrInhQWfg8U8+hux1ngnPj2hziLJwfqueQbki/e7O1IcaCCccjXHoHtCmrGoHBH/Q==
X-Received: by 2002:a05:622a:19a9:b0:4f1:ccdd:ffde with SMTP id d75a77b69052e-4ffa76d781emr30075331cf.21.1767690950323;
        Tue, 06 Jan 2026 01:15:50 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:20 +0100
Subject: [PATCH v2 10/11] cpufreq: s5pv210: Simplify with scoped for each
 OF child loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-of-for-each-compatible-scoped-v2-10-05eb948d91f2@oss.qualcomm.com>
References: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
In-Reply-To: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1489;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RWbJ5gkWN0OLPo1CmXSTtNWlFLnR+bKkf7s5Nqxc6fE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKp+sqAl0I7tpPvQ0QoODdWoHdFuCs4P/o2c
 XwCiIfJHRWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSqQAKCRDBN2bmhouD
 19ItD/oCirgHS49BrQVuTANSy+USONC7WjMfttsLhr/qpAi+dABPoAbX7tiDE9BWLrCMNJWtXhr
 WUgR6AnMlgzm9F2/gkTT27iFuoZZEyMvLZO3NX2xVTVIomZOyv7t1GnS5lzdSDOXL32kzcCfLM7
 K0xRYFbcUCLfqU85D+h0b+hio3mdH5KlqTMMNmHS8mUiJ+GiJOllMUYGWnLoHvFU9XtsWZ/5yCw
 PI/k7qaWs0RYtNNNBV4TfwZo0lBw8EHhjjcxVCW53Xs2rlMDqnSVvMKsooBHf1y/LuVkkHeQEPv
 ihnLx2yuDDaESOfUHTIgMN6aSbfGYityfEi/Lcj9yDg/m4rZfmoJbDh/qOH6vPIXa2Nl7HOSENi
 TCylIT/IZ9uCFy56zMxiu9aJe0m9B5B/a3TW0WOCIIb1sKCjLEKkch2r4IElHv0lk64eu5DsQXq
 qmLiPtOPcaebkfdI5Vg20bIx5CJY6jNt/xz38MgQ1x7sCR33Nd4/6nDWRzWSuk3LT/MFQwoyDb7
 +MBy/+Dvpe6yy2VkApOWSgIm/l87ifREXwWQFJcBQLUBe04JTa3GKajCijaOdi5zBuIztTWUTs8
 n1wWmO5JmCNDvVxnwaaIuZCuYhskPTYuhPn3gUBUn0kzh8fkj88SW6etdR2OophLLX7k5AnTDiK
 +LN5YHgFW2T5bAQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfX/WUsisKs6NKJ
 63XTeOV/ku8jlM40xj30639kFgVrpCp7tXT7AvERTckb8HsL2Qn8t4KO3mNfI+ViiPAjJhtFBku
 8jgYZXlFZQYuT/VPz3S2G0wtpf5M7FtkPlrOdNg6r8w5EwNJRfznbR3wr9MrPdDRnjd7Xl0Co5M
 7lEjmSUfXSRDVcncEJgF5Ke1cAy/9vZ1TN7f8IOma2b3su5FW5V6BgDb2v6s3L/CcKzYM6zWss7
 Jp4cfehRjjlKfNGOGijRf6gpNGMVT05MXlXZxrtj+m6gndWMF6Z5wJ6GWkqfYoa8XJ9LuRzhO0H
 Ss95P2i1iuUQJMlwkmnTYzn2DWX0mPsL2/XA4S7d9HINsGuYRBbTpLqj0cOvhZ33vWsTmQljbsW
 m6y993FsHt1b/8HXUW4YhenI/z9uU7Drvl+Wq5oOiq++ofiGPoQ7+FkrUGYBPEq3nvk9+gufN4B
 aZuEDbBOza+5vGE9RQA==
X-Proofpoint-ORIG-GUID: 8yIoY_4ofyTo9j6B8yQWzD4hOYBn2fLU
X-Authority-Analysis: v=2.4 cv=fr/RpV4f c=1 sm=1 tr=0 ts=695cd2c7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=8YWg2ve-cigzn2S1SOoA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8yIoY_4ofyTo9j6B8yQWzD4hOYBn2fLU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_011555_055291_A2B43C41 
X-CRM114-Status: GOOD (  17.65  )
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

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
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


