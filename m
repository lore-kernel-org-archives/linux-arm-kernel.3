Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3668ECCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 16:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qaEKEmzWL9qXI7IZRxJYbaoCkmFZEQ/8DgRsPMFUVT0=; b=Go9aRS+pWQQ4MludfdKkCYdf/v
	F2pZEg9Wm6xF/00+X19aC55Wt0TnKzNJwlTThoOGQyM+62SJkeI7MwHGllyfdHvUwlhq8HN33x9Vb
	uQvpBSfLMSpSNx/o4MgK7ouS/ssEmkPOEegCvQn52NUI9c9Vu5/2i6xPTmEWNh8XnYv6Kz9bvKnDo
	MvTY8FbfvUSi9sn5wNErmnMJSZnbD0Yu0NhnU8buWMv+9nTiaTBAzBqO8iwjUrVceMhOVWFfKfmKD
	qf9vFxwwhEy7eOMuj31GKX+JjIoxbnW7us3aeS6kYgKUtdJKoNQCVt2NvflEz2BzzPGgyMuoh/wg7
	kuFQ4SRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHlrS-00000003HLQ-252G;
	Sat, 08 Nov 2025 16:32:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHlqr-00000003GhO-0is0
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 08 Nov 2025 16:31:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qaEKEmzWL9qXI7IZRxJYbaoCkmFZEQ/8DgRsPMFUVT0=; b=JX8o3DK7GZM0S8M1vjVc9OnmGT
	Sojq2lSSGGVun0c/5xt90XgU/fp5+oLIQOHFaPe1r+x8KBmlHpLPd/2nYCvPXiHDVGUt92i63JZmj
	V/TnsFZ5Y90TH4wwg0j2BqB8dBYglIiZruqwPAQSCn4fkxy6HhduZ3AfvyjX1f2pUSG0f3WV+EvZa
	Jw3NOieqwoHJPBd0WF3yV+3eRD3gxxNnoixXcounsS5EYi/R/kqmTutvViRELyxBFqLc+ADxERd8P
	RqMAeLidcDzlL2TL3YRc5DVvocMzIsVHgxwdb4N6RcYcYKzjv5DIX3J9ZXn499jTZyAXK2gHQk2re
	px2YXzXQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHkz7-00000008AfP-2j9r
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 15:36:15 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A8G0Cao2365370
	for <linux-arm-kernel@lists.infradead.org>; Sat, 8 Nov 2025 16:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qaEKEmzWL9qXI7IZRxJYbaoC
	kmFZEQ/8DgRsPMFUVT0=; b=CWe9C4cs3jKG0Nm3cV6U/ZoZxA+aAiX7lQw9tHbe
	LAtLeIBRz+o78IMHwOqWAD3U4DsOYdVh4iXio27OwY6pnXIXf94XDmhynUtsSM9G
	knpgmgzQv1vgtwNHiq+UN39vHCCE7IxtvHt9QTL4m+vF72VCNFgTnttbXcwP2NMF
	OFjQDsmsuGD5vNm1ywpkGKSr2HRgWN26M5ZxLGMMJuZaksWsVuLQmHU6B5TrLJ1A
	M2jh3iqJiOj41HSZvcsOaFlpuXD6WR35XL+IriaXCaUSr5TsR//iFolZFuHjdDsr
	Z6UT7empqlqJlUPgJfmNLYs+PacRjn+UqRNkuTH4gvb5Cw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xu00udc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Nov 2025 16:31:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e8916e8d4aso73041511cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Nov 2025 08:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762619497; x=1763224297; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qaEKEmzWL9qXI7IZRxJYbaoCkmFZEQ/8DgRsPMFUVT0=;
        b=khTP2NCvLb23Fox6qBC89H5B6QXZ3eEm6YGdenBEX0qEp1Ff1jiFJHm6Qolp5wD4aS
         ICROdH5n32ZZBGhaUfBi1gfKFVcxyGD62XAplF2l+/HV/Q25YvnuGlShJEOq7fmV3PLC
         wf1khVpOmfbyb/aoZ898CcNQuA7uagDK4/GQTwntQ/ukCn1L75hvm3t1jWVcXv0CGrtQ
         C9F4rbhksyb61osh6eCMKB8Bam3Xp6KX9vdTuQieBDC2mIRMW9q7lsC73dnyVqGwFkVd
         rPt2mB9yJ1mXKDJYuTJ+Zw0AoAitat60ze7BU9krWG06jUHYWf0VgeYdNGGJKTtP9kzX
         t69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762619497; x=1763224297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qaEKEmzWL9qXI7IZRxJYbaoCkmFZEQ/8DgRsPMFUVT0=;
        b=voSA2msdK8o8DEpZsIvPEXr5Wm0LrhVI7vCUzm+tojRSBKa7aec3Ah79S+QrDfmLD1
         nT24rkvWCD2f64Pve6KLsojFe5ue75sgcsEOe6M1t2pxCV6sG+S/cUgarKQk1COZEgae
         jWibKNKHaSMDtZ2GrGsWPKPSTpFPteqRxZErZx5BCuWhiax/jvTw0sbKqpCJYCDvyMIx
         Zex8IEWKBdCxmIsiAwm89w0vjtpzq+gn9QoGLTeIJeDZ1sB+GS0t6oog11tbYHKya6SO
         I9WwEZS9DKkoPzngDLxwo//yLccqkiOvuYOAi9K6Z4n2anFlji7j6NWTeTLWAkuQAWu5
         yRrg==
X-Forwarded-Encrypted: i=1; AJvYcCV+BcCShnnuqIIcP6g3kly/9VAN2C1yrxx9BcSf5oOQDz5h/vSE59AkFrF36FO2kjkN/uvpZu3jEo5IAMJbRXcu@lists.infradead.org
X-Gm-Message-State: AOJu0YzY+aLmVBI2lIkZmbaHuM+PBjB7afb2yK0OauwqH3VFaq8uVusX
	iZGfzH/BK77pyunTzjFs/PWu4+olXXT9i9MKYyECuXzVppLq8HNEy9rLiaqkdafP2hxjWGhxc2g
	giWJk8MRcsQohKib4+m6snlHWgm2b1dkgeIAC59zHWDseo7JShrHlx9yq876cuxxA3sTJpvugKh
	Thqw==
X-Gm-Gg: ASbGncsrEXyfthQJx6EIrtlAYgL+VNGELrU7N98SPhijPKZaDg7Q3BSMOCRM6Hvy0/r
	k2GTNTHT1xLLfh3s8XTRXsRi50QmKxfwvTkRQUsAT7zH+1/coWBapMf3jMHnTmQ2KfUc1R2ZhUO
	fDQz6Z05lbi9hrK4HuifcL3RVobmYMVLV53EDbeaesJGkVtBswXFjOgXj6vc8JDzn5JDwZAfpjO
	CKyQY0LGy2WJy3zyKJWX+LWCvaI5EfIvTJWEcm31DY/N5Ps/dS9O8HlxNygeOhlAyLYCQ4C0CDC
	7GIzKWHJ56yex1qT13WEAp/qWJPMcEjglJO7pZcdh8lWOrOy2YgQUrSSkB1tv8r9p72mCzNg6ib
	E7ayshnZWYQlP/cHndgW9l8QHgGudMH9NSA95dmOxtuE5DqgAnRRZNBOSjWeQTV2Gserq/Xr1UW
	JRobI8hinb+VXN
X-Received: by 2002:a05:622a:1f17:b0:4ed:aa2b:169c with SMTP id d75a77b69052e-4edaa2b18ebmr20361261cf.71.1762619496781;
        Sat, 08 Nov 2025 08:31:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMbAkZ6c57mJjncJ5Chm4Lvy91cRVZxys7XrDWkXTtLF+qaSCIgluuFHJVziOeJ/04eYI5Vg==
X-Received: by 2002:a05:622a:1f17:b0:4ed:aa2b:169c with SMTP id d75a77b69052e-4edaa2b18ebmr20360911cf.71.1762619496330;
        Sat, 08 Nov 2025 08:31:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59452a25ed7sm1847724e87.80.2025.11.08.08.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 08:31:34 -0800 (PST)
Date: Sat, 8 Nov 2025 18:31:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
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
Message-ID: <3q5bpkktogs3pxjboihynjduabqrcuayyexjqdv3cgp5krjaxo@afnknyguuzxl>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-11-d780ea1780c2@linaro.org>
 <odmsib3dsxzzggq4gcx7gmh6vq3crlv25fz4z2l2ntezvx6gbi@uelqojwjjait>
 <a8952b46-94b6-4fe5-a5be-d69aa41d44cd@kernel.org>
 <a06ed143-c497-4141-8b4d-98fcb322e130@linaro.org>
 <rxhmiudlnrn2pexqtwuuv2jrenrl2ezepknvrc3o34gaap247u@2tsfw6g33rmr>
 <8fc8c945-ae67-4c58-837d-40bdf4d60035@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fc8c945-ae67-4c58-837d-40bdf4d60035@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDEzMyBTYWx0ZWRfX8sP8sO5MGUIk
 1awQudXz5kVwRQgeCuPNwbieww02OkAbGqyOJAHHEnjyDWfybnrFerY9TYe+DSH8+UpG4iIUMgd
 nHx6eyqYyj+aAqlK4FMu1Mn1DKeHhEa0Xqnu58llB9/PlR7fsS7b9tqniBLYwstVz7Weoovj9DI
 lH9JTXJ0ca2G4ETvqWe550BPj/gsw7/Jy73trfGTZSzaWDEW+erBYOw9XCPjOlKqDmVV+XY6BHG
 7Uv42n7quJBHMS9dUJob7t7fRZ3+UHBDtRBhP/o5a5esiJsw1uXw39HbXwzeXNgIe7ci3XaU1sk
 WtaA4MiREBkAgW3DueujNKaFesg0rJUt5WgdWabxqU8POXPA6JmyaIomevmaLf3rwGxgmcuCr4Q
 ILUdz55eatEKAldjWDL6YKo00Iwtyg==
X-Authority-Analysis: v=2.4 cv=a7E9NESF c=1 sm=1 tr=0 ts=690f7069 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=J7bR4seyIF3FtxC4LtQA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: yRh1GsDeI1j0MsCf8K6_qqJsLtnrp98h
X-Proofpoint-ORIG-GUID: yRh1GsDeI1j0MsCf8K6_qqJsLtnrp98h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511080133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_153613_973893_96D4A534 
X-CRM114-Status: GOOD (  37.50  )
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

On Fri, Nov 07, 2025 at 03:58:26PM +0100, Krzysztof Kozlowski wrote:
> On 07/11/2025 15:23, Dmitry Baryshkov wrote:
> > On Fri, Nov 07, 2025 at 08:08:28AM +0100, Krzysztof Kozlowski wrote:
> >> On 07/11/2025 08:02, Krzysztof Kozlowski wrote:
> >>> On 07/11/2025 04:19, Dmitry Baryshkov wrote:
> >>>> On Thu, Nov 06, 2025 at 08:07:18PM +0100, Krzysztof Kozlowski wrote:
> >>>>> Replace open-coded getting root OF node, matching against it and getting
> >>>>> the match data with new of_machine_get_match_data() helper.
> >>>>>
> >>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>>>
> >>>>> ---
> >>>>>
> >>>>> Depends on the first OF patch.
> >>>>> ---
> >>>>>  drivers/soc/qcom/qcom_pd_mapper.c | 17 ++---------------
> >>>>>  1 file changed, 2 insertions(+), 15 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
> >>>>> index 1bcbe69688d2..07198d44b559 100644
> >>>>> --- a/drivers/soc/qcom/qcom_pd_mapper.c
> >>>>> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
> >>>>> @@ -613,25 +613,12 @@ static void qcom_pdm_stop(struct qcom_pdm_data *data)
> >>>>>  static struct qcom_pdm_data *qcom_pdm_start(void)
> >>>>>  {
> >>>>>  	const struct qcom_pdm_domain_data * const *domains;
> >>>>> -	const struct of_device_id *match;
> >>>>>  	struct qcom_pdm_data *data;
> >>>>> -	struct device_node *root;
> >>>>>  	int ret, i;
> >>>>>  
> >>>>> -	root = of_find_node_by_path("/");
> >>>>> -	if (!root)
> >>>>> -		return ERR_PTR(-ENODEV);
> >>>>> -
> >>>>> -	match = of_match_node(qcom_pdm_domains, root);
> >>>>> -	of_node_put(root);
> >>>>> -	if (!match) {
> >>>>> -		pr_notice("PDM: no support for the platform, userspace daemon might be required.\n");
> >>>>> -		return ERR_PTR(-ENODEV);
> >>>>> -	}
> >>>>> -
> >>>>> -	domains = match->data;
> >>>>> +	domains = of_machine_get_match_data(qcom_pdm_domains);
> >>>>>  	if (!domains) {
> >>>>> -		pr_debug("PDM: no domains\n");
> >>>>> +		pr_notice("PDM: no support for the platform or no domains, userspace daemon might be required.\n");
> >>>>>  		return ERR_PTR(-ENODEV);
> >>>>>  	}
> >>>>
> >>>> Here you are mixing two cases:
> >>>> - There is not match in the table (in which case the driver should print
> >>>>   a notice)
> >>>>
> >>>> - There is a match in the table, but the data is NULL (the platform
> >>>>   doesn't have PDM domains). In this case there should be no notice.
> >>>
> >>>
> >>> Why? Existing code printed notice in both cases. Why refactoring which
> >>> tries to keep code functionally equivalent should change it?
> >>
> >> Ah, you mean there was a debug before. Well, then I am a bit confused
> >> because table has entries without data (so expected condition) but old
> >> code returned ERRNO in such case - so unexpected condition.
> >>
> >> Wail failing the probe on expected condition?
> >>
> >> Unless it is not really expected and notice in second case is valid as well.
> > 
> > If we know that there are no domains on the platform, then the notice
> > definitely doesn't apply. Failing the probe is a separate topic. The
> > rest of the code expects that _qcom_pdm_data is not NULL.
> 
> I hoped that separate topic would be the reason, after commit msg
> adjustments, to keep this change, but if you insist that this must stay
> debug, then this patch should be just dropped because it is impossible
> to achieve with current helpers.

Having the same pr_notice would be misleading: we point users to running
userspace daemon, while we _know_ that the daemon is useless because
there are no PDs. One of the ways to solve it would be to add extra
wrapping, so that the data in the match table is never NULL.

-- 
With best wishes
Dmitry

