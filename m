Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AFDC43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 08:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dsuvkNF0CRvWMwPOO/jhGrruMUfqUKJkLRonqqcBpsg=; b=3019Aiya05idn+1Fe18ZQuIu98
	ijq7lqPw+JxO4ZPW/oTRDwPQzyz9VaXsc3Dsv4M7FfwpcalpKVYC3rO45tHV0QlE9CqzarsyWJr4a
	PNqrQGLfGy28D5TMCJXrmbU+b1b6sETmiLGHEBLC+u3mU/h2jNEFTyx5B4ifFkWp8f7SWEGmW8Nuo
	JM85f6VV+R78m0thRwllrJgl270Jh6DgioNCKuoSkfW6aVXlfxp7KHzoWwGtONcqe9Oqux98u+9mg
	3vyVlPrVkoePo/QvYXOM+2qwsJ1vi8WhR6c0SeTgNcRIt563XSQA+L3IqDhhBeMQmRnpfsIFu6J7x
	ePLgozzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7dx-0000000E1qK-1LnX;
	Mon, 29 Jun 2026 08:47:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7dt-0000000E1ot-2Oo4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 08:47:02 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8OIMZ2348855
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 08:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dsuvkNF0CRvWMwPOO/jhGrruMUfqUKJkLRonqqcBpsg=; b=S5v1Oid/YK8zkt6J
	2ItjNKJhX4moBJ+xFFnUfRz7spo1b7QPzxRTMwHqM6TOXp7IZl9+etshzKHNQ2rz
	i8xUonlPASvKY+E0gX+DsEkgdmdjL8iV4rAzMh/hFyB88f+QRqDRE/LLHLRQlLi9
	IpQcxAeTgjRc+k5mu42tticXPsqjKzVTtE8BYoA6yky3gI5xFv+Cqj6pu1r+A+gk
	rAnUY3QSJEYk4vDJnN8Jarv0mR/jFbeb4re3zvxWlJQ7g2jMik0hamPAGO168iyi
	ypMG0IKeeleScoOwHOtgelvOflQSlXJE5WE+2ubIBIOFSEzNDKahIp5iVb9gTuvB
	maH2kA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s03dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 08:47:00 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-96934c2fa45so27783241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 01:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782722820; x=1783327620; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dsuvkNF0CRvWMwPOO/jhGrruMUfqUKJkLRonqqcBpsg=;
        b=fVgrwEUG5ElPRIzn7gw8w2EQGqAx0yhzgao+9iuY5PsB9bHt9y/PnashI9RD0u10K8
         5iZ4HldspfwJ9sEOxm3bQLvBGxEUgDpDOJmVvIE5QCYNBamVOpE0zB5Af2+7vwCQUZxT
         +LOZT8WrCUu2axs3R9nRkvn9wpNgLn/Ni8wRqswEVCZTgSmS/7SN56tUBkDml7H4IV6v
         e6XDhKuFTED1SBpF2cE4hgjVz8OLADH6rhhmW4f56Djl03wubMD11UYdocsyNOvV18Zp
         1jl00MF2D/ntdl6nag5ubKVx72OxXmE1t5zA042BCxw2o1/ugrmulAePl0e9EAKrtNmZ
         oCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782722820; x=1783327620;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dsuvkNF0CRvWMwPOO/jhGrruMUfqUKJkLRonqqcBpsg=;
        b=J4NSuuo/7HLELQYG8f8eqbBDBrL8cw2JeuJFxeUiVSr7oKB5uTyh4egCeUpIlhBV+x
         Cx7iOyuRh5DaALCBoPup0R2y5VlsG21fRz5t/Bg4sxPacRABmhc5veCmQxpDWgCnfVLZ
         uxuSY56TvzWX7yighoAT+psNjwBzLzpUmgRgPIIb2UuXuMQ5zZlV1ilNGDACbW/4i1k0
         k9NR0GgP1+Ruouwj//lD1uG7FzOR4p8gbXaq1XO7/ULF+NAebzSkuX/kAqusgFGTVLNt
         fKl6ui12tjynW7s1p8rSrMiRl/4IT+yJFmsj1jE3aqkGcyu04H0PMTY5UqdehHEVmbI7
         iXXA==
X-Forwarded-Encrypted: i=1; AHgh+RpPoj4V/zODnC4yf1Odcy+NTgw20mwU1uxb4PpDBP6n9YecMB3IW+Mqnfk6Zx8AKuxeDNCZ2EeejggF5F29tD9i@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhf4wGWramwSi9S4R2evBzObOoKbCGgKhwhkA6kR95UebC2Jqi
	nSNOSSPCA+C+JU2Vab4dHCqVmUEZ4aRB+uahMDI00tQdOPWy8JZJuGv290ryLmCuYWYc24vpmy3
	yLblmiBo+an2qYG07d6DxS/C0R8ApXO4220jjIjlHC+x5z+CTulwbV6kJ4ZrHiYIcx0/YaYdazD
	PCGQ==
X-Gm-Gg: AfdE7cm9XjpCR1zWwwU2AJHYPm+xDzSXfYLj6MPi3WbgF08heKzgl8tiwQFPdMZLk9Y
	UU9oFqlPTkA6q0mUoMc7zaoDT2/DOzRKfuOxo+motcsmKeJlPSrXhrMsUnhr0WNmfiLlG9DLUl1
	FUJnkchMre7IwDjzdYCVAAJedtnx4pLQ8F/C+FrimjVcC/+17bmLbZ0r23ia1uZ1nosGPZ+bb0r
	CN/V+TZVzu9Ipqr24VQ2tb03VOFCWPh3wp6LDld457IhPskBjlJPRxOTahczuvdgVVRHER7enp/
	/Y2SzKadpQoZoBECv6Bz9KgTcJdpW/Mwo7gvcyMPyj8OliCf0EcXzMcCUx2U6vdMYxZEZvgZNyf
	OvOXz+XrdZiBOv39lXX4YaSfAk4wlwzuR/78=
X-Received: by 2002:a05:6102:6c5:b0:738:4343:fba9 with SMTP id ada2fe7eead31-73843441853mr493661137.6.1782722819879;
        Mon, 29 Jun 2026 01:46:59 -0700 (PDT)
X-Received: by 2002:a05:6102:6c5:b0:738:4343:fba9 with SMTP id ada2fe7eead31-73843441853mr493642137.6.1782722819368;
        Mon, 29 Jun 2026 01:46:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698481d0359sm3009277a12.30.2026.06.29.01.46.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 01:46:57 -0700 (PDT)
Message-ID: <3ac0279b-105c-403a-90e8-822c28a6dcfc@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:46:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] arm64: dts: qcom: shikra: Add Adreno SMMU node
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
 <20260628-shikra-gpu-v3-4-9b28a3b167e1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260628-shikra-gpu-v3-4-9b28a3b167e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2OSBTYWx0ZWRfX/zY4VIevaHhk
 cLFkX3fkDlgPgJKd4J9MYttOrbHMwALxI1NnDR2TPC974M/KM14TS1bHWR6JUjUwvWbSJu+ETf1
 UUh6ggMjYoUxAsKbmKULy83K3LnVAno=
X-Proofpoint-ORIG-GUID: w2tZdbPio1YkliVlCFNFLggckVNKVaTn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2OSBTYWx0ZWRfX4OLzjsnEPhIK
 Pu1qrJceI7K1fAtgUYhxyJ5/j6spN607M7+tZU57fJma/F94FiXNXluLJFzWnQaZVqQdDc0ub7p
 JQKsjT0PZBmHujKFUY9SURVM9SRNPG/BS3eiauFYBz2tLvaS5KdNXls1QjD/c+mdr5aDesnZFx/
 eUjjiN8BNmXPQ1E7Ky+Ksl/2ysupoLLyyip7mUntqnwnt5awcE3RR2C8c/m9pBT2IcX5aZuGFYc
 YnLqCodHEh1grm4A2Bbc7ygbfgCGcN/5uWKl64ydddhUn0riqWOW00WvU0GNv2sLuco51kPe989
 dejPfqKMQrGw4gS9cQOdRYbzKySM5QjkLRgwMyXAUV+FLy2vG2BBf+43az5llxLX7OiSauASqmz
 rohGlUk8KnjI5UjK/7HGU1hwo5ZA0sPRbI2KpUpsuNnVycLtcXiRh/ej+ub4Ncc3av1jj6/lawN
 sNA+1OGTAyoEQKPo0cg==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a423104 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=CtAqrJV6yErwifH23rQA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: w2tZdbPio1YkliVlCFNFLggckVNKVaTn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_014701_621348_0163CD52 
X-CRM114-Status: GOOD (  10.66  )
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

On 6/28/26 8:23 PM, Akhil P Oommen wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Add the Adreno GPU IOMMU (adreno_smmu) node for the Shikra SoC.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Drop the sign-offs that don't apply (presumably applied as part
of shuffling around the handlers of the patch in the in-flight
tree OR missing c-d-b)

> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

