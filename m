Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E81C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmvEo3pA7Pq8NfvYG3chpyYLUANHLsFRyacd45P4BwM=; b=ru8yUbSc0847QfNmgz2U/ek9P/
	KXh6RXxANqPk9U2NLEm7MjK1E7X0jhzFKgTD6x1koev0iWyeJDiCwW8n1kKrxwaYkP/iTeRSTum0y
	AricrYdWSAOr3ZFzGGwVUVQsrAopFHcUhCbqJ16/N4EtZLmfLPJ+7ofkAq4iRwHj6c2LFCXmcl0kO
	4ehmvwOpnhH8kiMGZw7XpEK15pvnfSMRZZJklEaIg4GPNsmr6DXIOOqqsgOEAC+dO02TGM4DwhFDQ
	F1e1/bPW8pU7U4dwyCG5YeO5kipkqt9rrqhVkMop/GH5eDslNIzhg4eisrbW7WQB1QwQFBUNi4JNT
	oq82nkew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfm8-0000000C51b-3eTk;
	Mon, 06 Jul 2026 09:38:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfm6-0000000C50h-2Zhp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:38:03 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66694KSk142839
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 09:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UmvEo3pA7Pq8NfvYG3chpyYLUANHLsFRyacd45P4BwM=; b=SMME+EgvC39EFdP2
	bvUtHETUasD8CkHlv0Jqwax6ufpmJ3R8p0IP4CWInLPYJ34pAOcmIvOsqLmVwotX
	pDkGVN2Dm4+0DvNhYD3iKDhIqCUfjY1FGr9V0XS6f15/qd/UpX+oU2RQxski7/gi
	yaX+W1CVH8XapWfVCbo4KQvNCmRy+eSpzktuQkCP9fBXs5D/WjsZMuVuQtxZ4ZGl
	6nwhnUVzC8LJuuXXgonFiJ4BhpYIdyhUX3IQHsgZR0HZDbEXp3MUnKo0b4Ozoe3x
	lQygoy2uVQAZaMSxFhkXWYUzKqbY6+pgOuVT7GeVXH3QSen4oDiKvkZlJrcL2/Yn
	CP911w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4swpqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 09:38:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ead919557cso10724866d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330681; x=1783935481; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UmvEo3pA7Pq8NfvYG3chpyYLUANHLsFRyacd45P4BwM=;
        b=I2xMQCXGiky+K/a2rtoDhyznoJvmxsqUmDp+dlwieAdQxCcjFhimLTVrUmQMcHMQEv
         0C4128RvWTUQVo4yg0BvKyPceRoDm0yI0iroOZkvsuga2cIMwZhnfTpPEXpnstPP1fZJ
         g/dbUPT4RJICYssFr9//OTRlasUIJ7mplMahmusLo8DnW4ufgm5/HsKwu5AhvUi0IcNH
         +zzT1ZOPXisOdmSO8eTffdQUQfPtxV1zqmLok/uuduMT5SB6sZ+qPGQAGUs7OV6sjGxF
         qI4wzBGdTVJWdVbv8M8ZDBiPnSEZA+BqtJ6aFd0ZGzqq2UuhCtCo0raZdTNnSd9EN5+c
         zJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330681; x=1783935481;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UmvEo3pA7Pq8NfvYG3chpyYLUANHLsFRyacd45P4BwM=;
        b=VHQoG7vJWUYgeZipR+3zZIhCYQpOalTcH7jSpZH7VB7EeAqUV5yBkDv5Ee/HY5RHMI
         skF3hgCDdIt4JYXGubQi6x4RyRjSS/4dxTTZd8Ji0kQk2adPsHwEcOvXUTarnz8wtLQq
         GCN8HwprqrAODDbtOaUSMHJKCZ25CQd68qlgKT4FL7xGLWZkvXljDHWrfpmULb5HFkPs
         Ux4vKxshQVbNQkw7VKB3fxGZ0niiwtqsXSoUtYrisJvZg2tWAEmB8t+eVw8l8UFhOv9m
         BWfi0/Ilo/DOjb99U/zwl1VgUoVY/Z6UbYXQ8bSxwPZkbufW5JJ4Ol9mLJ2abRGxO06t
         8LNw==
X-Forwarded-Encrypted: i=1; AHgh+RoC8xzMM7sSFTkA3C0sfEEjJjF/+U9TB/jZO++rmIbe4c//YoeR3yakJYvuQRn/sl7MeLtsHDDjjIqTbqq/oM5D@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc9HZxSDHH/2p5Ra0PmSzRQr//UMipPho1CFbi2XSBpylofcAp
	jSgLg4nvwLNin6AJBhqqQxmT74J7yav0n3Xc8pmJWEPS5d/wO9atVF8j98s67+PbRBJtJVC2iAL
	jZdCUhRVnlaVCfCAuNnnfqWGK5zB6HCe/xLHa1dOvKULEYC0w7Cm9qlQnMxle/vwxJ4ovSlCbdv
	rSkA==
X-Gm-Gg: AfdE7clZew+5KxwYNOelu8Nqjvw78335J7x0X5z7gEU4p47y9pz56Av3LCfdFSSQq7W
	Cr38XAzugaWCrCzibofnsV3vXePoevqOO0znYSkfZ0dm4kixeRJv+wGbKNXpRVXfPZI2HzV/ndi
	DGw2I4mQV9bhTJ6o2ag13GVcW3pX2QLDvdhgPuKEcY6znLuP2m4d/8CyWMvrrh4+qOKjWpWNp4B
	eeYdMYa7YMY+eFc1/ny6Ty7XUegW6Ie2N+73za282Ly6JyWmoBV4HjHV52oPRsvjK7LnKahO+19
	kRCoRG+9Q1UsS9fZm2x0Aan5mZNfWTO33w8EALbOCqw0d5vpfh7vbO2MiIAtUWLrFlpslfJahdP
	D3TyeEz9YUSGZsyVozon98HGmbOe9C0OPvkA=
X-Received: by 2002:a05:622a:13cd:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c4be97d68mr86773101cf.6.1783330680861;
        Mon, 06 Jul 2026 02:38:00 -0700 (PDT)
X-Received: by 2002:a05:622a:13cd:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c4be97d68mr86772871cf.6.1783330680497;
        Mon, 06 Jul 2026 02:38:00 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b60575c4sm709337566b.9.2026.07.06.02.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:37:59 -0700 (PDT)
Message-ID: <e2b7e03f-911b-41cd-8ac4-044492e2bdbc@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:37:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: Add GPU support for Kaanapali
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
 <20260705-kaana-gpu-dt-v2-5-6ac53de56314@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-kaana-gpu-dt-v2-5-6ac53de56314@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX/J9Tt3UlXgeW
 tivTTcnav1xHvDzaPa/siIfXjg+fA9o6itQiFN9pEoh0+8Sr5vc7Z2qRKqC7/aNKsw2QM/zNoef
 PMtS7DglLHWdPLmNSn4O+sadu23faVI=
X-Proofpoint-ORIG-GUID: p72oP_7Z0vFy9JLLj4LpjxS_kMs2vLqw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfXzHXRSztOXmyv
 JWBY6qpXNRXnLfgQFs97VicSCWt5tnN73e9Wy4m2FlDFVuCukvc7rBR9RhE1tlnu+Y376UsdDwN
 mumD73qN8/hKfW2h30NCwEktW624TxHNcQLmOxCk3HibfsbM8e//X8kdBXFjCYe7D5aHv3kmvmJ
 cPbXbEhMoxg5Tm8pg+GM80JuQe8YYI4BLHEjU2aq6l8aYrsoWYG3J6DI3pbAc3q/sme3I+iItyJ
 lbA5UngbtCZDKceVMAa2CyLvZfiHFamF5aHe5BocHO9CKZUwDe8ePecjTy5wkOqyNRnelWFtayl
 4VB/Rzc66xwWGH8+WGeNeVeU0PCrzlK+jX/Rp8kVKg+aOoJ5gZ/8zdYaKYuGr7dw2uozfBiX0mv
 zjTJ9GwPbhmSM0XeOlyRHCpMDLEykU7yQIi76KDApZukeFKNiEOURk0E/SHh2Rf2J8upLfqJmPq
 7OlCYeQ1CQuDq/MUzdg==
X-Proofpoint-GUID: p72oP_7Z0vFy9JLLj4LpjxS_kMs2vLqw
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4b7779 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=z65YV3W3F_EkYOo9s_QA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023802_659983_14C35721 
X-CRM114-Status: GOOD (  15.57  )
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

On 7/5/26 10:00 AM, Akhil P Oommen wrote:
> Adreno 840 present in Kaanapali SoC is the second generation GPU in
> A8x family. It is based on the new slice architecture with 3 slices,
> higher GMEM/caches etc.
> 
> There is some re-arrangement in the reglist to properly cover maximum
> register region. Other than this, the DT description is mostly similar
> to the existing chipsets except the OPP tables.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +			qcom,gmu = <&gmu>;
> +			#cooling-cells = <2>;
> +
> +			nvmem-cells = <&gpu_speed_bin>;
> +			nvmem-cell-names = "speed_bin";

This looks good to me, but I thought that on a8x, we're supposed to use
the freq limiting register in CX_MISC - is either of them preferred?
Or are they just hardwired to the same thing by chance

Konrad

