Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F824C5B567
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 07:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8zmE4Z0t67Uc/IxjelkCGk5duWoHHbuKL7WpxEI2yY=; b=TfanWXWmT89DAtE4XzLT95kjXr
	BlyCpshP5xokAwoSpFPC5VZ6zJWDnA74K6EBrasj/buJ80lxfYmzMh/tubViLL12AWmBdI00BP8u6
	D/jRQ1/Th7hkYU3j6aZhQ9oiiDCylOmVWKiVAQsfnsXzi1NOBdIyRbAEL0vzlVZBt3BXNZtq5WEvc
	HLpIFe7mGtiLiznf4F3WJzRG9ViLzl6K39HjcXc0F/5LSRn6l+TIWghXFxOs3OQBLpASKfi3a1gqf
	s4Ev6AiaCmPNBz6Kd9Qbnqy2qTOoybmHOqeQV2g+hKpPRP/QrgBn0YPwOEgu7aNLFRUmQHg9bTjFe
	DO1J+9RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu3KY-0000000FZXU-2STJ;
	Wed, 12 Aug 2026 07:24:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu3KV-0000000FZWW-1AsF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 07:24:52 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62Ew02646984
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 07:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j8zmE4Z0t67Uc/IxjelkCGk5duWoHHbuKL7WpxEI2yY=; b=Zm+rjJtAIhhcVVmq
	JDFGgDHRb4vGNP0a3JP6Bkam278h3H4CuLU/ueuWx94zrh+FIQwq4a9AkdnaiGei
	RpZh9f8IMHxtsHa2o968rt4MLpIrUn2oufEH7/LFDsl48yVS6dDwYyT0s7tI8AqY
	A9uHYU0yc+BADE8Xluuv5PbuQyfsJm+vFwMVw8ZujWwUldlsUeVDmk13qWxnPUqm
	QUnLr0QdYLIfinuax6pszF6kZTtozeassr6PvRvCwrrT18Y6AxGnFK6whzABp3E1
	rkwV+TJ2KWan2wv0aEQdJSUqzlc/w37QkaA6DgRPXHzqM7a8tfhkek+3OBkvP7OS
	zIs9OQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049km3mv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 07:24:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfe48ca1efso9869365ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 00:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786519490; x=1787124290; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j8zmE4Z0t67Uc/IxjelkCGk5duWoHHbuKL7WpxEI2yY=;
        b=D3Jb89Phx55oM+MRgWpGzGhDv/2zl3xTZCUM+klWSe0spBqBz62UldXRIlksCGI6wf
         bNru+6j/Bz8UsV94GYLsc5StSAQo8/Rl89G/iFCwLQZO2ntKL74wMFWoBaAarvercTps
         dMhOjZmQIVUiu/VnQJDfFN9sdXNFbI7A8ELUv0LQrE6DhJ7SMvpgr4TFIGaDCTq3KZEv
         9Eb0Gr2kg9PxWAU9YYwFxJNcn9IM6cZNtzg6gOlegXT00w1g1WK2E3eoEUQ7DrCsi1VW
         428G4yibkdbzQGs0sbm5DaBvPtKEyA3oDdrnYonBZALIvAybWdhpqQfKB1p70ztSCmrY
         BERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786519490; x=1787124290;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j8zmE4Z0t67Uc/IxjelkCGk5duWoHHbuKL7WpxEI2yY=;
        b=obG+gfcW5CmaQc2XVFJj52Gf5wp2NroFIrM4e661E7lTmIbqnk2WBikzZuG1CXJTIR
         hLuRI/aqgLuMR3y7P3DFG6UWJEpaa2fGP1/QjzA0T5JTz/N5LM99TT/jUyXAPKWTz4qa
         au6giX0JDkkITp6Q4z4ajDkdguZUnLiULBQpH2uGHk8LEhA985ZVWpnQUxvdhBEvOfNS
         oPIly3QTcIl4RairJhhg4bAFOBichNZKw7Xhg0t+jPa640siu6otorTWwSODx4RTaXek
         TVIoCnd4HppMMUWUCX2Wtju5DYLpNCuhqi5HSeg3KoXU5oQ5Lo8spEDjByom1qLbKVup
         cNXw==
X-Forwarded-Encrypted: i=1; AHgh+RoTIOzQFX11KFsos/zIEk5nArSNyI4+89+hfcUtccjl9z9XdD5WupsC+sIhgWDmNBr/1pAUIBKR0UOEKWdS+2FQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yytz4YNFSMyCsf5kmujJNf8VAUhlyCuLNTOuW5zk45IloknAt5V
	hWBpj+ju/UmQuFyagCes9MCurUyRJhXxdoHiqszEprWMRHlqzaidLKhqwAWuMgK2a/v8pI0E40I
	gH2RzVT51cMryALw6ZTxwfGkfaZhYohsrZ0jybRYQXEyxthBD7odyxtDaEXJBFwl7+sSIHKj0E+
	cf6w==
X-Gm-Gg: AR+sD13RpkpI9iw9maPWG7AO7dZ8sDx2jDtgC0DPkbugZbACphw5sJX/XqqwpTf/Xuh
	pReXceGxPM54wZVgH3pLOcMOA922Y5FAnRBPwmS+nHO03g3VVPt8icXkvjH3kfmv3fJibj/y+IM
	jiH9YIIC3D4uH68IyH340qxMpCgd+l4v6TgdcL6ZL0MZOFlK37fTJ+Ipb/xwErP+HgvabDUDL1F
	T7DsqKuOOvBiTL5+T4BCt31TVz/yr+QFfctWcz1E5PIemt8vgBTTaPLLQ43CMrgTZxCPI083FUY
	Y+zegSLwbbOj3wq8cSXcnIAnJerW+NYXAMMQCw/g8bpOycHH9IENIJ2oZohb+tOb+MrrGsyZcLt
	3+HFNM9fgMpJRe1pSl6siFAZ4jnTyIOXVyw==
X-Received: by 2002:a17:902:cf0f:b0:2ca:e565:7b15 with SMTP id d9443c01a7336-2d3453cce11mr40084085ad.10.1786519489974;
        Wed, 12 Aug 2026 00:24:49 -0700 (PDT)
X-Received: by 2002:a17:902:cf0f:b0:2ca:e565:7b15 with SMTP id d9443c01a7336-2d3453cce11mr40083855ad.10.1786519489524;
        Wed, 12 Aug 2026 00:24:49 -0700 (PDT)
Received: from [10.217.219.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d351145d87sm2545055ad.23.2026.08.12.00.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 00:24:49 -0700 (PDT)
Message-ID: <d5d64ea3-9c6f-41f5-adc4-9923381d732b@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 12:54:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] pmdomain: arm: Fix -EINVAL from
 scmi_pd_set_perf_state() on state 0
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-1-61171ab1cdce@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-1-61171ab1cdce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kDzSaiPOld2T50ywp7t7hqynzmcC_tOM
X-Authority-Analysis: v=2.4 cv=IO4yzAvG c=1 sm=1 tr=0 ts=6a7c1fc2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=9TDyKcSpi701ZX69LQcA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA1NyBTYWx0ZWRfX95RprYsaH+dg
 qFSDJajhV43InmA/NhDRfcIlC1DJxz4Q5e6OH5B2AVWmGK1KlAHCx7IlTCzzej0izqdNrRLdqUu
 HWQ7X/Ht+JLQjT4MeTzOO0tDUzN7vZP8qZUBMT4ghRnE2QkgXIq2U5k93UnwHIeZTEp1zZ5SLS9
 l22fV3IRjNc3KSAYdAbL+t2U4kLIO4n2mPl8Y/lEe/B24D0TIq8UKh2ho7fwAnv31Qfd7AJ94/Z
 QPBLnkgPgurl60916ZAGqiwe7Tqb9BApepkFLJQ6pfppEhup4YkbpwjMCOqd/sbFLs2Q8fmFEqJ
 Xz6c6JDLZISmr3FlmA80vbFt3jvSHbRxk/lr9RSFUSisNh5B44xx7beE9SiVkfJwZ0lgmVaoy8f
 8Mj8CmaFclHUEjbgm3t8dkdNEEZUVu+XYsu5T64027g0sDTdxqAFUJ7AJzZ34IAZK066Urj0SgG
 psh+tcVvUdUmB+hGsxw==
X-Proofpoint-GUID: kDzSaiPOld2T50ywp7t7hqynzmcC_tOM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA1NyBTYWx0ZWRfX4JZbWTEfKF6h
 k8++QCaui/WD0wkaFIZZ5GmHqZvG+0w8owG1BAD7QU/czeP6+R0FPBf9JWxIG6C4unTDl+a5Vmk
 H1pAjprOR2P3KyY704ls8cjBfPmDuhU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_002451_330234_0AB4C74D 
X-CRM114-Status: GOOD (  16.32  )
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



On 8/5/2026 1:27 AM, Praveen Talari wrote:
[...]

> ---
>   drivers/pmdomain/arm/scmi_perf_domain.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pmdomain/arm/scmi_perf_domain.c b/drivers/pmdomain/arm/scmi_perf_domain.c
> index 3693423459c9..e390f902a444 100644
> --- a/drivers/pmdomain/arm/scmi_perf_domain.c
> +++ b/drivers/pmdomain/arm/scmi_perf_domain.c
> @@ -33,7 +33,7 @@ scmi_pd_set_perf_state(struct generic_pm_domain *genpd, unsigned int state)
>   		return 0;
>   
>   	if (!state)
> -		return -EINVAL;
> +		return 0;

Won't this cause an issue to other drivers ? how are they going to take 
action based on changed return value ?

Remove Acked-by due to this till i give back.
>   
>   	ret = pd->perf_ops->level_set(pd->ph, pd->domain_id, state, false);
>   	if (ret)
> 


