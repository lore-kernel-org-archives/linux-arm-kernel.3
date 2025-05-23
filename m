Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C7AC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 19:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDD8GO02V6xisZvlrexGxwobQQAXnk3SkEUC/8wzeJ4=; b=fSksYqJMP5qWiWUsd1FSSV1Kk8
	pfMPE0W5gms1Phbji9TYb+4RHEaqFyiSbXyVQClZEOLipKyCIrn+iOYovdAB9DsHktLn1PsIlinUY
	fOqSSs2DmgkCmXozW2Jg68lNZqPQUMSZJjxOG2ugnr7yeSaqU4YaC+0vozBdFLZhatk31v9kTx7DE
	wJeOUxKu9DxJQjk4+YszxohWDmVkJtoGhV7jlAKYuSTHM43vO9FTBaKm2Ri8mnZV4SkiPvqVe1+c8
	prRsb+juYLtCTKQYQ9JEEj53U69i9JksPRzFkgF8AFEPjuD9HV/YCmX9ZebaCvIffbuWSvap19VwV
	L+qHd/lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIYJd-00000004ozH-2Qfw;
	Fri, 23 May 2025 19:44:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIYHZ-00000004otu-1X7C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 19:42:18 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCY7RY029164
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 19:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rDD8GO02V6xisZvlrexGxwobQQAXnk3SkEUC/8wzeJ4=; b=G1O7VeWcf0aMeNX9
	pvSRtOwpkX4xqzzI2UsHomt54kNwd9dYjxzXQ20gQjs6Vb+gFmuxxyP27kLoWcch
	GPJ7Hu5xTh3cpdy8JScSkc2J5gg+BAcKiJsYYPoCRDD66WIz31ajrgwRDhzRJwZ9
	5pedIktCpyqS96szL/MVzxmM1y8MeoVb22z7oMdRrGDnctvloLyRI2/Vf/4mc507
	jwkFZEq+FBobA1aDf14M9sEjJKVPuDjS6hPS+HC2ifuJx5/xRugMD9QMrVAHHd5Z
	Ef5kOjf9BWnlDM4oA+gO2KcWDG2OSqqM7FTMHf5FUxcLnnmjYYGKL9dVwjECg3Fz
	Khn1pw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4b59u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 19:42:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fa9136c2f2so372476d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 12:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748029335; x=1748634135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rDD8GO02V6xisZvlrexGxwobQQAXnk3SkEUC/8wzeJ4=;
        b=R6oijwIzaHZdVYMWS9AMxM8FmONH2/NHFzYXoVpDJl9QFJDtfLympIP06ITRIM+ptt
         Jy6jWwql9CZTiodB5+0rqcbGsbJlZ/pApdvVooLIqY1YeNrSdDUUec/bq4ndHc4usJGS
         EMQwyQ8+HetOasW5oYuhSgqmHC5+MgCW/yfbw/RCgvoYx1WfvDTzbYVTfoQaQ7E4K7QZ
         H0XlIMaY0VN1r97qjDTl1y72uWGk6NAWtVT9DpyZ1qyhB58OhMANuUqXC2KE1pZklQrh
         DkwUpp8wLNntJ0ct5NGes0K1/FmtaAd81POp05y2aWhmreA6Gw31qu56VgBOwkcy6t4P
         rGFg==
X-Forwarded-Encrypted: i=1; AJvYcCXVjccnZM0tRivxyOzXtrZyLzb8JV6m3gwPYMY7hMRrk+0d8ZsnUKpjw0krvbhrCtHRXcJALWSKRvDgaf05Uk/I@lists.infradead.org
X-Gm-Message-State: AOJu0YwDJ/vCUtflBndItqHHOuICAVW5VLWdtkjeLzI3PqWCVWiqb/gC
	NchMhO9M9l+zKRDi6j4pnsCo2UZxPSrlxJg/gbkIDOzw83tfOtRC2S/KPU5H0nFzAv1pm5c0weg
	rSuh58RYXpz3MOq4Dyk6C6yJkCspV/aPnOlDrQkSkpmqSal1OQzp8rEBK01pGA9gI/37p0cKnJr
	lKjg==
X-Gm-Gg: ASbGncvMaqYoYX8b6sJfARBnChqu4kmUzXpkFoLUx7oft/r4QUI1BJDpypzSvO7fUQ5
	rd72Mm8oe8IKqIes02+hEhabpgp7SHkQp8VKnGdEoDZo/1/+NhNA7UYG6bKimJbkQNw+tJHiSM8
	b2hmzcHa2YT8NvsjWANfOcKLFaKUAgfg1U7GmS8brtHSJX307R+Xsbk119dm4y0uY1xXkU8BCuc
	+mK7elzRYMYu0lh34mOIB7sidZOpxiepHOlbBXSNkAOyH/ITTo9m3pGV+4xw5Jby6oqf6/qeCKZ
	rWdl4YLLsHci2v79Y3YemapGaVbwiw0JE+lVMwg7RCLVtzCQHVf8b6vKSBcwLB8OJA==
X-Received: by 2002:a05:6214:529d:b0:6f8:471a:9fd8 with SMTP id 6a1803df08f44-6fa9d28fd01mr3864526d6.8.1748029334675;
        Fri, 23 May 2025 12:42:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEakNeqD7PjHCb2lw3PkVQBGbw2mv8vCsbXcVbucJNPHi/LLt7DhFiJHbVdrvpunQbrFKGGPg==
X-Received: by 2002:a05:6214:529d:b0:6f8:471a:9fd8 with SMTP id 6a1803df08f44-6fa9d28fd01mr3864236d6.8.1748029334246;
        Fri, 23 May 2025 12:42:14 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4b6d18sm1268078866b.153.2025.05.23.12.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 12:42:13 -0700 (PDT)
Message-ID: <4a0ec467-b81e-4282-8e09-b7adc67eba97@oss.qualcomm.com>
Date: Fri, 23 May 2025 21:42:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/21] pmdomain: qcom: rpmhpd: Use
 of_genpd_sync_state()
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Saravana Kannan <saravanak@google.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Johan Hovold <johan@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Michal Simek <michal.simek@amd.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
 <20250523134025.75130-10-ulf.hansson@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250523134025.75130-10-ulf.hansson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE4MCBTYWx0ZWRfX4hTpRJKNz5aH
 rIG/CWFGAgI/KMgqJLqvt3eHQkLBC2Nn55MDia7nxKxp/daKAp9prpv5QSy3pdIvgQdq5FChwo5
 89znLyaVQrnr44jCMcC+6ZR2Z1RnfzsZLcgMTqPt31XBaJtzZp1nWm0gJdtuUdHMEoO2kUvVuZw
 ygrcK11Y5NKhB6rn4JiEtSwwlnET3vAjGmBMqp2THyrAdewI0QXQ3R2J6nq574fASRiJyNU99jV
 kdVkTgI7wWBG6eYfFKq/5eEpsvf6PFx2giz0ZO5aCF6RikCbqJeRrRtKEhEtwDNaN2SD0K+NRao
 AYyuf1BrzhL0pKSLu84npRUZRsxIX0epuWV3nHVruDDT/KSI+erdnRSP7D3UiOMFfk5j16wNHSQ
 SB5Uer9dJJlFUWTG0bBaygjI/23TtlONc1jriXxqZTgifoQVKzHTlfIeIGbh2GRrfO3IL7RS
X-Proofpoint-GUID: iIk8GIlhRW_DRd1OGVDH6m5PdhA-4cNu
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=6830cf98 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=_nM6lhH5BCRQepSfEGgA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: iIk8GIlhRW_DRd1OGVDH6m5PdhA-4cNu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_124217_411590_5E849E80 
X-CRM114-Status: GOOD (  12.27  )
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

On 5/23/25 3:40 PM, Ulf Hansson wrote:
> To make sure genpd tries to power off unused PM domains, let's call
> of_genpd_sync_state() from our own ->sync_state() callback.
> 
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---

note: the subject is wrong - this driver is rpmpd, the other
one is rpm*h*pd (patch 10 has the correct subject)

Konrad

