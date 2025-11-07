Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE566CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 14:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+a2S++AQUY0fS2KV6X2nQwoIE5xNiyzvEu1cwp1iZQ4=; b=bJWNMudouyUX36v31dxx7lRygZ
	AxmzZEbfOUbC2ByWYByybgVoN5iACjxMVNlVQq46zLpuqJXFDkftAOmcj83PZh+zHhVF+mJUfIWEX
	T2LHkkgmDfkgGtvcHMc4/Q7nBhpi4wJCjt5jfQhCMWhDhH1aIX6L61VsxlcDGfOL3kmh7wbDYJcLi
	JroIBM96wSvEJ9fiiHzqYanoKavfTRV1BLMxhce0N0P+CX3KM07YjHWeUEphnjZgBkiLkK2CoNl86
	jRwFT9Z0y0K+jAiKKPCIAUHTv4uosPYrgUktygJuP/yQOXb4mVqCChB4yni/F9XTb3gclK6L7mFTq
	JxdnJOqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHNMz-0000000HT4Y-0Y7w;
	Fri, 07 Nov 2025 14:23:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHNMx-0000000HT3p-1FkP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 14:23:16 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7CTwaS2280821
	for <linux-arm-kernel@lists.infradead.org>; Fri, 7 Nov 2025 14:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+a2S++AQUY0fS2KV6X2nQwoI
	E5xNiyzvEu1cwp1iZQ4=; b=D3EH6cRXHXlqi0AUa8ErSK/1mhyPS4IsS0+Tsl0e
	AbK/mcejq0gjANtVa4azJivGnL2Q6QXA0LKdmVrCcTHEUsZZj9DhP2DJ6CjF7UQ0
	ggTA/C1rlzOT+9M8Pa2aJF/tTaY3rMqzqrbaXWNXNffmJZcdi/nbXAd45omgtYwJ
	uv3MM6iBu5guuFBv2pXBhTNlOVL4/v8kH++WkUj6/E4yhEitVolHsiuwVWcRyXO7
	GVfkDkLpnBa0MosX1l5y5Lergwe/TQqWUDaAuq1aNkmZ0TmyHsr7V2FiODeyP4BU
	SXfH15gbaOb5W9uXsL1bFgonRW5+jez1Rf7aH8eocyMmaQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9a9shgfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 14:23:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b225760181so104808185a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 06:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762525393; x=1763130193; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+a2S++AQUY0fS2KV6X2nQwoIE5xNiyzvEu1cwp1iZQ4=;
        b=SXbEemCg/BJWm40BYx8QUU0LhKGW94Ea48PSdwR5g4cD5f+cH8+XWX9Irswrc0znFk
         B4FnCEvqMiQJpcg0GrQcDEjNi/7RMkBoz2cwoamKtAI80EQaNv8HmpzGsxi13nSqleeY
         jw3zaOk/PYcfqddfIzlpe7nzPsrbdn843NshyBhck9GRAVyOwfTvJCuz1Mp/gQtuJMxk
         ZF0bQ6uIdCDebeTxyvd3aEXQoaupCjDoiKmHqVTfKiGpWlnZ4dmuQArnsnggUeIAE/lV
         hFmZbsPurI8/m7AfgbtYowl7eyYvxooupq+RByDuJlUXgygjjWMYfcM/kA5lRw1VjFLH
         rbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762525393; x=1763130193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+a2S++AQUY0fS2KV6X2nQwoIE5xNiyzvEu1cwp1iZQ4=;
        b=d+Q/5ozkCOvnOQnzAfhQY7RQczPLjwmcjy7cHa741Cs+gRc7ZtyfHGHapcr1vXFxVt
         /QOBVsbczwJYvL8vAxMY108j7nZjvVl1m/22LRCU60AfvSMdKou+tbXoXrEJuPlH5eMU
         dYnwBgVFaGdGy/A9K0lOKCoe2mESJu2Cr23do5mOxwdxNTc3PQpeHI95nsY+1NCeWobS
         EqX/8vaOAdpsRyJEiaVitZS8A6XOp/hr9p8X5kZwZ3uG4vYcwpVvlWMpGYMluo/fR88A
         ViFo+ksv79mM/PAv3MBxdbBF51F/qw7nPMRCKcz8fMH6OhMeHr4jXj/vv7bP3YYTwou9
         PU4w==
X-Forwarded-Encrypted: i=1; AJvYcCUCqi6MGdLHyippWAwWZngkp4BO+3Ruqg4xH2FSDY1jSAuevohAOwB80b8pe1E2hKf3ZuaVJcT+GQpaW+1VvRd5@lists.infradead.org
X-Gm-Message-State: AOJu0Yxkfrit3/JCqe9ZC8pqCe1XlGgfB76MyfD6ykgnk5OHspIKhEmJ
	YmReE6J4f8sFOpqD2GQvsvjyAalt/ePb0FOfOkU372PDQauv+heovRsDGZhe4LtprZVNLNUCRcf
	zQo+tiN+2KcA5ICdTWH6wU/7EhsSOuQBn7f/ecYiVQvGA27I5wKJMUGPdNArAqCzgQW5Tw1NHr5
	L3+Q==
X-Gm-Gg: ASbGncuMaiU/w4OJoHk4P7c0+VBUCc9PMDvBJSbERHeNSgwaMfAhEKZlUHlDQ1ppPMt
	wnJbiU7ngRwhKtRsws3ikaPtRRiXUL4Oc18NnwX6Opxi0aiHhhzH+QdkvXrVn2DGGKhiqLGFejb
	Lt8Yo1+MmPf7RxsTKzUl3rQIwNgcm51A1WFh+dAfbekYAJhcz2+s510KtOfZSNTFud+oFDu4wO8
	cdu5oR3ZzFm1DWmHK2thJ+fqs2FwhBhZHjV6JRgTpkv6bZkV0tznvBMWq3JLBQrhjFFKsQIV78C
	C5AwUhEdT7XHzfeUfUSPbxKwwBqDyiszOTMsiyXejoBC0aGmP+bUS1YzWeKEWFzmoRF/Q0Jc5O3
	PmG8sDIvD+a2+Oh0ZQUYaWic6N4tGSE/7Ha0UN75XxFWvZuj5n2SSqcOJH88TLPpjrGYm/H5+dm
	QUcCs89C/9ww4T
X-Received: by 2002:a05:622a:148c:b0:4ec:f477:60e9 with SMTP id d75a77b69052e-4ed94aadfc9mr39449361cf.76.1762525393063;
        Fri, 07 Nov 2025 06:23:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+3yaL/5/mqUrpztFbYMzYBN6uO1ENGma7JKY17KMFkOU2Ru1L93K1rV93BVrdOZy//IT/hg==
X-Received: by 2002:a05:622a:148c:b0:4ec:f477:60e9 with SMTP id d75a77b69052e-4ed94aadfc9mr39448991cf.76.1762525392601;
        Fri, 07 Nov 2025 06:23:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a014348sm1514752e87.7.2025.11.07.06.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 06:23:11 -0800 (PST)
Date: Fri, 7 Nov 2025 16:23:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 11/13] soc: qcom: Simplify with
 of_machine_get_match_data()
Message-ID: <rxhmiudlnrn2pexqtwuuv2jrenrl2ezepknvrc3o34gaap247u@2tsfw6g33rmr>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-11-d780ea1780c2@linaro.org>
 <odmsib3dsxzzggq4gcx7gmh6vq3crlv25fz4z2l2ntezvx6gbi@uelqojwjjait>
 <a8952b46-94b6-4fe5-a5be-d69aa41d44cd@kernel.org>
 <a06ed143-c497-4141-8b4d-98fcb322e130@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a06ed143-c497-4141-8b4d-98fcb322e130@linaro.org>
X-Authority-Analysis: v=2.4 cv=CdgFJbrl c=1 sm=1 tr=0 ts=690e00d1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=Pc_8zquyR68SUQC9iicA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDExOCBTYWx0ZWRfX6YmNGte0gSwa
 9ZyTtmg7NGsgGPD6ug1eg9iz2OEgxcguXkCSORZQAy7PCxukQxQQkON/STXUm08ui7fn8PUcoCq
 PYtmx8XbhW7Xhu4LXdjiBoeRQkzJDTSQVJZ7sk1G4QL19/wHuTxJnzgxbn/XR9jz2J+yfIEQfkl
 cbon+wf/MUw9cgzuTHOiNlOnsPdv+NZIBBienzG0paFIovP6LhCdwokX5Hvg1k3M/hDRz1CPwUz
 MXlHkyzAfsPNRFt4gKnq9VnRQ/yHFrv0jEFHzzWhBWU+FISQz7pJQaPMbhZ12UXcELGNlEEG3Ri
 t5x1OP70ax2DceZjsAaxRPKMOMHwWwG3UcIv/6fmw5C1g/6drtpVZRxD32gTZVsNN9OfOTG53F6
 8PsfDr8v9Jw9kV/lGoovB4laJrcPIg==
X-Proofpoint-ORIG-GUID: 7mZ8EGFbz2p5WqcUDXqYqJeCWYMEDbBQ
X-Proofpoint-GUID: 7mZ8EGFbz2p5WqcUDXqYqJeCWYMEDbBQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_062315_490194_D698AA38 
X-CRM114-Status: GOOD (  33.32  )
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

On Fri, Nov 07, 2025 at 08:08:28AM +0100, Krzysztof Kozlowski wrote:
> On 07/11/2025 08:02, Krzysztof Kozlowski wrote:
> > On 07/11/2025 04:19, Dmitry Baryshkov wrote:
> >> On Thu, Nov 06, 2025 at 08:07:18PM +0100, Krzysztof Kozlowski wrote:
> >>> Replace open-coded getting root OF node, matching against it and getting
> >>> the match data with new of_machine_get_match_data() helper.
> >>>
> >>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>
> >>> ---
> >>>
> >>> Depends on the first OF patch.
> >>> ---
> >>>  drivers/soc/qcom/qcom_pd_mapper.c | 17 ++---------------
> >>>  1 file changed, 2 insertions(+), 15 deletions(-)
> >>>
> >>> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
> >>> index 1bcbe69688d2..07198d44b559 100644
> >>> --- a/drivers/soc/qcom/qcom_pd_mapper.c
> >>> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
> >>> @@ -613,25 +613,12 @@ static void qcom_pdm_stop(struct qcom_pdm_data *data)
> >>>  static struct qcom_pdm_data *qcom_pdm_start(void)
> >>>  {
> >>>  	const struct qcom_pdm_domain_data * const *domains;
> >>> -	const struct of_device_id *match;
> >>>  	struct qcom_pdm_data *data;
> >>> -	struct device_node *root;
> >>>  	int ret, i;
> >>>  
> >>> -	root = of_find_node_by_path("/");
> >>> -	if (!root)
> >>> -		return ERR_PTR(-ENODEV);
> >>> -
> >>> -	match = of_match_node(qcom_pdm_domains, root);
> >>> -	of_node_put(root);
> >>> -	if (!match) {
> >>> -		pr_notice("PDM: no support for the platform, userspace daemon might be required.\n");
> >>> -		return ERR_PTR(-ENODEV);
> >>> -	}
> >>> -
> >>> -	domains = match->data;
> >>> +	domains = of_machine_get_match_data(qcom_pdm_domains);
> >>>  	if (!domains) {
> >>> -		pr_debug("PDM: no domains\n");
> >>> +		pr_notice("PDM: no support for the platform or no domains, userspace daemon might be required.\n");
> >>>  		return ERR_PTR(-ENODEV);
> >>>  	}
> >>
> >> Here you are mixing two cases:
> >> - There is not match in the table (in which case the driver should print
> >>   a notice)
> >>
> >> - There is a match in the table, but the data is NULL (the platform
> >>   doesn't have PDM domains). In this case there should be no notice.
> > 
> > 
> > Why? Existing code printed notice in both cases. Why refactoring which
> > tries to keep code functionally equivalent should change it?
> 
> Ah, you mean there was a debug before. Well, then I am a bit confused
> because table has entries without data (so expected condition) but old
> code returned ERRNO in such case - so unexpected condition.
> 
> Wail failing the probe on expected condition?
> 
> Unless it is not really expected and notice in second case is valid as well.

If we know that there are no domains on the platform, then the notice
definitely doesn't apply. Failing the probe is a separate topic. The
rest of the code expects that _qcom_pdm_data is not NULL.

> 
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

