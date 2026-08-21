Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AACC5DF93
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sx6lBFvEGNhy/q5sHRGfQDQiM//S9qhbvL0j8qSm5v4=; b=kPoAMLLeGBTB18C5RO+cvAo2Wn
	ao91ywg9FliDJUCec+b88NYVsv5f84UrH/yBy0DMVmWrH2V9S1UeBZ33Y7Djtmd5ErGQgP71Giu81
	59w0AVn5MYDbet18X+k2HiJ123LCzfxYXWJnwkD++O5TsXRKo76qb0iVIq/tdhJFojMTKmLXFvRym
	UNpOczB4R2bYX0c2Ohbx9GiISjrPqPlO7UuO6nTp11+EjmMUgd3if2jdE6mDidGBBafeud7kTNxos
	RkFSwtmBJ/fAXpgZ9N6Vaf5Jyf396fNWJT1PCGHvDqjIh+tAsREfZX6kUYOXSnZdunD/HFml1XAzD
	FlkXs9ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRo6-0000000Dkqy-3jHP;
	Fri, 21 Aug 2026 16:09:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRo2-0000000Dkp5-2gJO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 16:09:24 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmLvZ2323007
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sx6lBFvEGNhy/q5sHRGfQDQiM//S9qhbvL0j8qSm5v4=; b=NYWY0oMxw+QLdiJo
	szf4Io4ug8e3+O/mIiPbVMM5c/2BPdee8O1E5qJAnkta2E2HgzBMhKX6jPFcd0lV
	lGm3udZmOC0tefQvPJFyRxvdhq1knlg1reSDMqL0N0vs19pQT7AMMyd8N4XGSeAH
	J+DgvQ3/3Q1sfUYPvpzvCvtI/dtxRjVXq65/Ufyj50g2bGE24zS5PQD61Bxlvd4s
	E09nXbAhQRfHaTirqbfKfoDMjyChElU1Yu6ftq8Q4eEXpjYU3hKzMUKExIXMqukr
	9Z5uLF6/I1ipqHOPrJWKaOhSQkqnMuUqMAW5Fx41FwZPJqxFzvgFjBblZypiEs7P
	+ECtBg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fbwajq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:09:21 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b2d1eb484aso1939588b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 09:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328561; x=1787933361; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sx6lBFvEGNhy/q5sHRGfQDQiM//S9qhbvL0j8qSm5v4=;
        b=ODNeuOmqomwWJFQQOBhmEmNO5GgEdNpKZ3VzzjwxBdfJrRlJ7qADRCqZmB7e9G20E4
         tGazyrOECrNnB5xUHy+Cf6yyQAvgZUqfaDfObVgpPztGoH8QruHNg5s35XfmlxV371p/
         tRUghynzvEG0rUgw5Pc94gLC9XPNf5NMzsuuvltQbZoeu+sOOnsvtmE/pM8ao67R+3um
         UwWwoZEwv0yRCPjCmPgtmsKBVJgZEx++SD8zTRq4WeV0vtMRB9uiT6h2g9JR4lWBND87
         krEQ8M/bqI5c4CvmbEcrWx1vZzv5w/5SHV0X01mDasg8jX8ehIXJfbXzufeqiPmMkrFl
         cLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328561; x=1787933361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sx6lBFvEGNhy/q5sHRGfQDQiM//S9qhbvL0j8qSm5v4=;
        b=pRK1ijuoo/nlhP2aRI+Yb+LaUmMFjr9Nu5rySbXRO79FoBgEOR174dnBLAdF3LJ1I4
         7y5Hb8rjaJ0Lh+9d++hU7LcyxKLNrYdQUyPAMIbWp7vW0El/bzdWpFk+TWZh9Wy3CeZb
         uXwRbD9JcWnjAK62wGBg7NYlWg7SmBoq0aQN7bFHSxIownAytPMkdg8rYQpCz/ZWCn+f
         QlbrUX6Ai9+5O/vQyYFtKWH6yKI3F7MHkL3906SnE9AyafwjaXCvVfBsLKaNb9ckOi3t
         W623/RUPVv+PciEwwUobHR6JQ7tqriVlO3HFij4d4a18ZbfgUDQpReW2kxqTtms1n6PV
         p4kA==
X-Forwarded-Encrypted: i=1; AHgh+RqJlDDHzarLcYlBpUsag3Bgprnf/OSOc70p9mW1au9XD18iXyOVbbNWLAxDOmMMxNE+dVpX+Rl0vGGADu0SJpzx@lists.infradead.org
X-Gm-Message-State: AOJu0YyW40s48JFi61PnlXCrl95Ipf0NIchmTBjcAzAQbKKfbtSXh0tb
	3qWg7mZQQLzJKj4kmwkuWa8k5C/ANG55zwNWSyAr9C8UKdCU5/EGn25dlQqmkghE1/ARADKZVY/
	gMdRwFxQ61lL8r9mEWABN+tNPS6qCDhTMomLQPO4ySpwTYzLsOnf+7yEJaMG5rX0g4V3i65VH/S
	GSLw==
X-Gm-Gg: AR+sD12eeZZuehQRl7cqvCEGJSmeJTCuTA68yGZbNr9DOMgJZwhEkpWl2758aBa+42b
	p2kCFZ/wlCxNi8EPhIUTnO4zPcOEAcXArs7jCyw/Nci9Em7WRQhJ3mSu0PvKFTeaMuj3eGLgLz9
	BDsZsrqbw7BDS0Hfhf87HLG/INOdJbdkq5vT4RAU9nDx9SrdYgbJJ50IHEFECMyh9Q4+613mPMV
	1LQNJZ7mWAvVu4t+YvRSMb0tbG0hAL0hQDpqqqJzinu/b9QG6pe9OozhNv4FVL5ACSk8oTF/IMg
	uM1G1+FHe5CTeCE5TpKX7pXt3RHpYRkkjXJB8nMum1wqwOOqD+fxGpQD6NVblaKcQU9I0sLwWMa
	z+Sh5wD/ZaRggCwdwTM6H1PrVK2TVNniEjOEKD2Yvj1XarWl/sEINz/eGv9ToLvdBHQQC45rlkz
	vtU6yM7ZeN2Ozmd64LOLBp6gs=
X-Received: by 2002:a05:6808:1394:b0:4a4:866:c395 with SMTP id 5614622812f47-4b2ef3079d1mr9005011b6e.13.1787328560704;
        Fri, 21 Aug 2026 09:09:20 -0700 (PDT)
X-Received: by 2002:a05:6808:1394:b0:4a4:866:c395 with SMTP id 5614622812f47-4b2ef3079d1mr9004887b6e.13.1787328560203;
        Fri, 21 Aug 2026 09:09:20 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:09:19 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:38:54 +0530
Subject: [PATCH v3 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-1-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
In-Reply-To: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=973;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=gHxGYWhnicYORaElGwhsc1d3PMvje3as8cNJCACI2hM=;
 b=4s47+ystpTmuQ1rGl9zmtQ2TkeJgm/KBhTGCUovSPNHKV9O35WPS3bN4aQd0VIeR1yIiv559R
 UNXDB+NH73zAksFBSuiERuQP6ZxsPQORcPPodjzf0EqvrTjR6vodKD3
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfXztE5hmd5hv90
 K66oxS3ElF++U/xPBtQ6+lPrXRbCu51CTbHCYkwXwx1pTHjyc0Xu4lesUcJyCA7it9SR20ctItl
 h7FVBfWjtc+P7FUI6MOy2A/RTp6gy0Y=
X-Proofpoint-ORIG-GUID: HA2jhF5moUSinhHoP9Jj4OaQJ-Nm5leO
X-Authority-Analysis: v=2.4 cv=L9AtheT8 c=1 sm=1 tr=0 ts=6a887831 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6t05LGSwh5SlIrDCal4A:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX0MD6M8PQj8oh
 PfColHlfno7oiuyQU741Bb3KbT5h9X6RKlS+NjiSlmNVUObSqFYvyk/c04zLfuY+Rih1jGqvJ8W
 acuCRGg8jS05cB6l2HcCvpomdrQ/mv48tEF1JdRwJyX6R1MQhh6quR8iPJgCIkyTztJO9qYxrHb
 OsRtRiyPKn3znI/1RtlFXoIP1cbSs+pThXN25NACmXYYBWInqOPBT58Iw6biTtTPPlPFwMnT1pB
 ry7lOEaRfhU+/y4Se36OdBEjEVVUgMI7F51CfTj8Cf1LGuXlIHBTGe8FsnrFwI0D5lnZMvoGI92
 FfC6fC4hPX/FHfp/lxqJ7OEtMf/AeS8IHD+AU6jRMTyavBLzka5mJsSGR/uCYAfHT8XNk6GyMBL
 mWEDf/2Exw9sUBqcXgnBcGU9nnlnTidOczs9iQ/uuwFMI+spDZ2YrFqCzxioxXpM57xZZu3OJQK
 l9RCIG50BPTID0WxljQ==
X-Proofpoint-GUID: HA2jhF5moUSinhHoP9Jj4OaQJ-Nm5leO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_090922_948879_E7C495F9 
X-CRM114-Status: GOOD (  14.45  )
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

Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
wrapper for its debug UART. Drop the explicit ARM64 dependency so the
driver can be selected on 32-bit ARM as well; QCOM_GENI_SE already sits
under the QCOM_SOC menuconfig, which is gated by ARCH_QCOM ||
COMPILE_TEST, so no replacement dependency is needed.

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index fd4d4ecd2df0..5b3c9d31fd7f 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -39,7 +39,6 @@ config QCOM_COMMAND_DB
 
 config QCOM_GENI_SE
 	tristate "Qualcomm GENI Serial Engine Driver"
-	depends on ARM64 || COMPILE_TEST
 	default ARCH_QCOM
 	help
 	  This driver is used to manage Generic Interface (GENI) firmware based

-- 
2.43.0


