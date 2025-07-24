Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8A9C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frgttlq1wUpHfs85c6sOB8oFTBM5O4TFBHJ8W4S/2Zg=; b=AS6cD0otzRxhE+y3+atHZrH8sd
	utPEu3SPqYZ5iEzHNjRAKSRisLxCh/JkSiNAOHoQQRHOvWTfcH2pXLdnVgKneYTBDds7W6DQfj2/5
	3kyClKaZxwUeqn4IHX2IC7wOgMEzbnWbNLyxndD7PMKex72s+6Clp8VGfdvJDMxv+C1CW38njLO5M
	zDa+OOeOwClbVvVPrpkBG7NQX3sgDD/BCBOxF6mApeFZ+FdsMKkgrjflVKDwHSEcvfdzJVNOglWMK
	HV0rAC9hCGe+4muGLGg5MHAZX1T01fEVpT84LCXLeFd8yxfeisrPaZYd2fFhe+oJSkVGthAqaxdq0
	7d1ndKJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewNc-00000007a79-2WrO;
	Thu, 24 Jul 2025 13:53:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uete1-00000007H6c-2Yrw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 10:57:51 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OAF30S006839
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 10:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	frgttlq1wUpHfs85c6sOB8oFTBM5O4TFBHJ8W4S/2Zg=; b=MCM9U+EIRXdUhkkj
	RnaQHyphmlwj8ufux4uRqT1CeeRyh4WJeQyMhFCoM7HUZE8B54OyMur9MQ7pLAHK
	q7Q1KVrS7BFGTDMUnHwdUrmlCjNOXtf0Rp/Gdwturu54n0TsR+qJU3AtKnFv2WhV
	Ajeq9g9mm1HxhnKm5PMSdv09h5GF5GTeKQLa+UREcjMI+vHbBSZEp5ZsQOJYdrBc
	29cuk/jHFBZqdsYWQeB8ET0R6F2HpIBhXtEQ0eTVFTrqxXZJKuhGlQ4XUWQjybWw
	SQmEEyV1+dpeOxXC5puV3gSzpq8fRjewj3wouaPKzcYBH4zMbbbQ82M9zd+81FQV
	uLJMxQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6tk2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 10:57:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7071696f5eeso693616d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 03:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753354666; x=1753959466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=frgttlq1wUpHfs85c6sOB8oFTBM5O4TFBHJ8W4S/2Zg=;
        b=ri4zVsNeZL2AOkLStWA2mlrOrT5rvvFyD+PybjqUU8dAyl7svZeXsft6aBbaaueT8B
         v7edoYOaXdeFx89M0R+ayYzi9iz8/ZHxBZ56DIUkVODeKKEFIpNlneGj0TSwzn3kfTaZ
         J7cNZOlU8NvDJ4jCLMTmWJoumuCdqnb3Y9kxeJXMqXjD/CQbIEvMYbJd6Re5sBoxPUiP
         KauZyvdJQ2b05wgkbm0nIeyWpnajm4fycYfZqXNeqomFiLIziSFLAi4dsA8BQG2qvHvK
         9g7nFxKm2JvGToEhnhY7vl/DggOkdnobNa+NH4rFMxPIuX3b16Wfed5reaYOG+4mIosS
         bfMg==
X-Forwarded-Encrypted: i=1; AJvYcCXyXD4MX34h5mXU9wGOaC0OL9vxcxTlJMie5lQWLy+vi95LBhPsBs+oyZsFELf3uzzlcRuNbmKiCSMD6AUSK8Lw@lists.infradead.org
X-Gm-Message-State: AOJu0YyT1RLK9IOoqnxTWkyY7g5NIieGZrX6X6fbnf6vSRWKzBfQVW/c
	Z+zQa3burIpCLzLyUabLYlfetBLBKc/RLSbkX35509n26Izs8ZOKMjeE+eXN3HQKFJIASIBNFD9
	cxzGPi2bZ0if0CByZoN/ocgcBxFjbBg6FwvBW2OIh6vDDqGDE3ccO1+sDu1G0/W4lHd51XZ2e5m
	abRA==
X-Gm-Gg: ASbGncuHdrFU35bKCX+UiHXIAo5p2EHzufZa2ctWxVSmcw2kmEr4aTReotUDTpOwsKb
	hMwMRXJR23Qjla+xSXhFTbuwxQp+QBAOpeeTVokWXxALDa2KWdS6XS9hwYva0usNa12Riw7fY3M
	2idKI2JeV+Ci2PewyBbWQmLzmMzHe8SkWvWBegdVQs08Z0BW3y6aF+YknmRWqL1bZW3sxLgsPsQ
	ltnyIkoUnTqXxuVQgqMdk1j0SUn5jO6g7NzaWqD8RF2GRbewnrTvH2QRCFbogpSkvIq05AYd9ri
	aQVElhcY5TkfDB99BLf8HUcXqh5UlnnCMOMDBo/jyootZPYUU/QEm2V5ft2tspflyUF/RzUL+mB
	ravTkOngmOYgGj9+ERw==
X-Received: by 2002:a05:6214:1d2f:b0:702:d3c5:2bf1 with SMTP id 6a1803df08f44-70700537849mr43874936d6.3.1753354666076;
        Thu, 24 Jul 2025 03:57:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOPUGD8doV9+jglxqU2GB0DYEWEF7aTYg/TWGqOaOfQBWULvPms9oF3r1fFWzU0hBkNoKlEg==
X-Received: by 2002:a05:6214:1d2f:b0:702:d3c5:2bf1 with SMTP id 6a1803df08f44-70700537849mr43874396d6.3.1753354665532;
        Thu, 24 Jul 2025 03:57:45 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47cc6e753sm95191866b.50.2025.07.24.03.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 03:57:44 -0700 (PDT)
Message-ID: <bbb07270-cf7d-4fc6-9a74-334fcaf00f05@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 12:57:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/15] pinctrl: qcom: use generic pin function helpers
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Andrew Morton
 <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
        Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP S32 Linux Team <s32@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang
 <haojian.zhuang@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-mm@kvack.org,
        imx@lists.linux.dev, linux-omap@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-11-af4db9302de4@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-11-af4db9302de4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=688211ab cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=jpok1_DMC_Ne8w05vhoA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: VNAO-bmjBHwjmlg0dwaJs0_EiWtjKM3V
X-Proofpoint-GUID: VNAO-bmjBHwjmlg0dwaJs0_EiWtjKM3V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA4MiBTYWx0ZWRfX8m09Ifdk1uwx
 B7FlvQax4HcXBFrK4RUBeOFZuH4RebknLtpnkUkJyGWYqq6A0gz25EiHWIG1TXRsRc38wvSyQ0F
 a5NzdPBTD63+jPB2QLaJ6Qt3yEhybQ8YPmFq757QoGRxfTAL7GMYI8LTDggw84XhENt9f1ZxGh5
 u1CVBgOjC1Si3h3n4y9SR4ykuPGpovibI9y4Gn/9M4fHT2+/pquTAdVnPlRqONV/AVr7D2j9vUs
 1fl4JVDwb/Pn9Lb4PAxNmaFT/fJbGHnpWkO5Od5432W2QjfX/UL15a+ZKHpkEKxmP3RsN8dhZrK
 Gi02VY90jhOJJ0RstXmjBqwwk98vsOKxW7JN6L37Ojbbf/+DGGCXixt+q5ArRuMrPvos3WR5qR0
 dGdtWU5mu1hCJHRt+d+/mNEt19Tao/R36pPbavYiUTX50HSpvUH9I/s8fo07YA2sMntSXEt9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=516 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_035749_771092_73F04C65 
X-CRM114-Status: GOOD (  13.12  )
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

On 7/24/25 11:24 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> With the pinmux core no longer duplicating memory used to store the
> struct pinfunction objects in .rodata, we can now use the existing
> infrastructure for storing and looking up pin functions in qualcomm
> drivers. Remove hand-crafted callbacks.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

