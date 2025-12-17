Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B67DD6554F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 11:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4e2ZqtFWUBOAn+zCPWxVaMcfcpDXuDusgMo4taKM2d0=; b=XrwqogvW2G85+g6S8FW8duI0sh
	HnfetJ99BzKgKyaZPcRQ7so/b+FGFIdZw5AC/OqDo9gPAqPgE3ccqzhQyyz77PWI7aHAe3nRkziv9
	jO0iC344QpepsqMC3+OAC+QdQSqh4YSe5ImYNiZGMIrDVWAR9G6BQZhlAuki0fnzaLHyTPtj2XNG1
	Lcc7FB06AWhpDsL+MFFwBk4l5kKkI5KKErtAVik4ICqimzwZIpPQohzBCT9TKYHAeaomDKC7lKgLp
	fhtSJf19b79pifnQBWWQ7c+Br0IFqQowrJ518ABsMDvfH3rvIi4NAMr6PrwOcvo7v0+S5rvfmpHFF
	2q81KP8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVpU6-00000006hSz-34tK;
	Wed, 17 Dec 2025 11:14:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVpU4-00000006hSW-18At
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 11:14:21 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHAESK91564870
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 11:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4e2ZqtFWUBOAn+zCPWxVaMcfcpDXuDusgMo4taKM2d0=; b=ffRi2XaIRw8BBlt4
	kpTvKijZyFt/98jMhsetvourVTv3g1+TVe/QmJ6Ws1TN6rA5+ixb4vbDDmTRC7Bo
	2XNogXULDSsI7ys0rGKhaOClD8Tt+W68rnd8aAKDQbodxDVBbB4Z7orI5zrX7hZ4
	P/RgAoTfdE//tRoGA0qSVrgek+F/CiyrstYkcfWvZgsAYguDCI4AGul4I2UZocXe
	3w6/MtStSHGBoZat/IlfamlAbJev1LrA2WD8BaJCIGKe5aZ9ymWQYK2atC+LuuMY
	EiANncygTC6m+nNwCX1lelQBsrTUO97wQUifNdM+T+YtUsB5HK3uZrGcvJnyILip
	cAqPUw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3myj1cg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 11:14:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f34c24e2cbso3647721cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 03:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765970059; x=1766574859; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4e2ZqtFWUBOAn+zCPWxVaMcfcpDXuDusgMo4taKM2d0=;
        b=P0NrFb5oBqobXGMEvaT74bIYsk/Fry8rgdv/umNlQMCHVsVM2XFfZLyrMMVsyjeXEK
         zfLngM/Qn8+NgZP8IChaVS6wL9G890STI4u+T4SQlWANRYjGEld21ZZRVrhZWgNzC3d5
         Pw8R7Y6kmP9kgS3gyJzGG2xbPShS1nksLwNQs7ncn+W5byczUSFpCK8C130NmABvFkTp
         QhUYLG2NKi63CDofx2EDGQ6tS8k+Onv/jXpvb/ysjIH8czhxhe8a0YhHvrpjn2yYguhw
         CzteWU2h1VVEh7ViKMmSxT7heSMM3qAaqdGN9u46iitaTwV5AMY1bXIrSmVnIhdHYd2Z
         EqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765970059; x=1766574859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4e2ZqtFWUBOAn+zCPWxVaMcfcpDXuDusgMo4taKM2d0=;
        b=EZtpNFUk8i/wP+v7Ta58mrTUa6omv5IYoHu12n2gz8lCoUnZ4hoAOLsJyivisQaYBt
         s/BlQz1WCQjuM4EfEyIfxbitxAOEBnIVvP9hurXaGe8VKGlf4BsMe6+QphEHYwH8R0U1
         DKVetucYrKENweE5FXN5BrPvBXTsXiMOj9P8O+Isa16VZHmYMCHJm6OB+CfeIF18BcYC
         Dzbzgnl1WBFc6tT+t8BivfpHkCtEasmCTgWU9lxkwjWSdxyhAjWSFwMVPoUySZo5hiZx
         Bb4Qf0C70OFqvmxjh0vkbDB/bDrlO47CTNjC0u9zTwZkd3NSr2pb+vjXjohDbvXcYxfW
         QTEQ==
X-Gm-Message-State: AOJu0Yw1XZauPEJmPPxpHd/QySZdePxDPAt6VA4aGdj59t8M57Hb6dpX
	dBVs+pc/T47ii5GcEmUZzoQmMIrjoonjA1g8Hx3foWnnHJXEcFSS980Nx5J/GZ3JOjiAophKwrj
	cV/79r2bX1mVBIwhObPIJdSk1lXDnWCIqdI4kvy9JxrCH8WFzpuJ1slw9omly19iW8/avKeuez7
	5KMQ==
X-Gm-Gg: AY/fxX5p4uGzNpFDzCBkBB7SDkySgFGHdjZ8ioVWkez5HP1Y2UglGfUyhiRSw2T6F5M
	26IzBR8zgnIAwzJtaAYKyyJ8uejzZPfGlsLAY+LgabUSF3dyolxm9Yi1Khbv06WX1woUCrx0K/f
	AiXMbgYglx+DBsW/lw0A1Bd8Bi9eCN9m+Svy7orfMGIzTdMUGS6/pLdnCVMAU1kV8Ak35c0cksJ
	+UclmEesEWg7I4xyUTKRy5ZxPuxV0LRQVo/at5fkClAvBNoRvFFxFDsVTnJE2iOFdeAktTE6Dol
	vLE8Yl7qM5Jgxv2MwHwQ4ynanvT50HI3d3bBRsGpN5ixVt8CVEbhNkF2ALgUa9Ue8UldCMs9TZv
	D24w9hx3tfDm31nnn1w9D0Lu/Kd8bSG8D+E4U9+ljfJ76K7je/3NV+7nzRCLQFcnxxw==
X-Received: by 2002:a05:622a:86:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4f1d0564b23mr187735271cf.4.1765970058715;
        Wed, 17 Dec 2025 03:14:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeeL3HZVOPvmf0IAL/4i2bYNx5YCSyo2xx9Dhjqf+zLDmXE2sc9O+agiSgDUlgq4sfjkUdtw==
X-Received: by 2002:a05:622a:86:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4f1d0564b23mr187735081cf.4.1765970058316;
        Wed, 17 Dec 2025 03:14:18 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa29beb7sm1932015866b.11.2025.12.17.03.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 03:14:17 -0800 (PST)
Message-ID: <19bf8b37-4b40-4825-a8be-a94139389c69@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 12:14:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] arm64: dts: qcom: monaco-evk: Add camera AVDD
 regulators
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251216062223.2474216-1-quic_nihalkum@quicinc.com>
 <20251216062223.2474216-5-quic_nihalkum@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251216062223.2474216-5-quic_nihalkum@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA4OSBTYWx0ZWRfX0fRfLn4SlqPO
 fhSLAwISZyKNjdjGm+MKrVqxi8uJAO3v7jA6zDHqz/cOmL3+UGrjJx0pe3zKQk4JF30JAjJ7TA9
 f3XO0hybreq76xAXlw5KljGun/UyuR0cd0kaLfX7LmFaekjN10w86tDeCisgrhcdYBLEFMkdmMU
 D1rQNf4QVxwFhWl8uWIDuPb3IjXAuKUQeLcOzcUKSUyyA2MO/6A0nEnsEPUFJcA/4CXElnmpP1s
 eFZUoYGTysrzVDUGn6HxkNTKaPyXHBNuXD07kyPe0RT5Q2DD/t49oUGjRoBoSOTuklof3gq2J3u
 UWmINu7mUeMtZ8aQJ55qBwJ3k7o4LyjbV6nMak7EKLQPIz6aJI87YKK4a/7QSeenNv4g0S8X1K+
 yhmSeq+nUpCV9Nb+QNrpWuFPwLX79Q==
X-Proofpoint-ORIG-GUID: -4tHUgKR4Gq0_l5BUMqT5YxDe_no_Ve6
X-Authority-Analysis: v=2.4 cv=CtOys34D c=1 sm=1 tr=0 ts=6942908b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=xHf7uapYn66AqgDo174A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: -4tHUgKR4Gq0_l5BUMqT5YxDe_no_Ve6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_031420_318989_1819523E 
X-CRM114-Status: GOOD (  10.27  )
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

On 12/16/25 7:22 AM, Nihal Kumar Gupta wrote:
> Define three fixed regulators for camera AVDD rails, each gpio-controlled
> with corresponding pinctrl definitions.
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---

[...]

>  &tlmm {
> +	cam0_avdd_2v8_en_default: cam0-avdd-2v8-en-state {
> +		pins = "gpio73";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};

All other entries in this scope are sorted wrt the pin index..
Please take care of that and add my

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

> +
> +	cam1_avdd_2v8_en_default: cam1-avdd-2v8-en-state {
> +		pins = "gpio74";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	cam2_avdd_2v8_en_default: cam2-avdd-2v8-en-state {
> +		pins = "gpio75";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
>  	ethernet0_default: ethernet0-default-state {
>  		ethernet0_mdc: ethernet0-mdc-pins {
>  			pins = "gpio5";

