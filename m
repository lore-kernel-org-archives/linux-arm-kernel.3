Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21611CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 13:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8cPA997XuE0awkGepna6I5www79fUhweZMaYVACJLoU=; b=LmxsbMkp7OwjuN2HDVpwfqtacg
	uqUOne7oKXuKNk514FbmG53UpLxIk9lZhIf8zdt7s6yJJCkL8bLEZEOhvzpd8l+b1WRzzsWBuxxcg
	6aIogTparsenJbxvf/X/nSe640hcmEyRPU2SkAiPhQ07pJFFk8QlMT4ts9tBkg80P251e/syn4iv3
	/m4jD9p2hK/DGh/C2ajCdk4WyMAi+4QLgvXOhPDyeXDoN2Rj7khHWOe0snojORwNGWs4XctGPP/Tm
	gA6BJDmXl8tOiABWMGLLs4wex8eTBzwGpc+0JYIm7XFgQzju7MPYvW50EoRZKCZ1isThz03j8SOdY
	mdc33O6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaUJ-00000003gLM-0fHa;
	Mon, 08 Jun 2026 13:57:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaUG-00000003gKx-0xA5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 13:57:57 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRapf3759460
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 13:57:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8cPA997XuE0awkGepna6I5ww
	w79fUhweZMaYVACJLoU=; b=WUFTxF/cBaRxHKYXcYN/1Q0/mU2fDC0l+9YpuUW0
	Fo1iwLMnUV0E35L8ARdTo5f0jb6sqlHJx2aV+375s7XORA/9/gmz8pHq2s0y51ey
	IWy0vVxk89vcAL0M0rBrW81qeZN6yAuCgU1UrW88wULZYtRzVGVCS+/ywUbb5jjR
	uiBM/bWx2XcrXelhI1nQpYgsjvpZj1njuneRDN5PSfwWg1H2RitPOwlrxJcrwCQA
	AZfv94gauqHTaK9U161ueHLvPBgOXbWBlZ64ndbfvL8cHVz4NhyfogDIRTF6yieM
	vTdPFwKw190P5uykNJfCnR3XZmJW4Xd+4+AdaemUc2gk4g==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0habv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 13:57:55 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963b11561bbso1748100241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 06:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927074; x=1781531874; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8cPA997XuE0awkGepna6I5www79fUhweZMaYVACJLoU=;
        b=a15BxaV1iynW9ih6rzOUiwWJPmAwccuKVoFE/928icD/5NdSWu2DaHlAIx1WoxM+dB
         zp8fSDGxuH/jwNfcAsV5WF4pbfkb9G+2QELdpSg2sg/J0f4E7895pnyOS9Wq61wYxqCd
         U8C4zQfFWaroG6VPLfYCL473LoRqIWXWu7CgSMZIzGvdZMpydsJHVomVLEqN7p++tdC7
         l5Pvg8fhogFBfK7tiJuAr3R8Fppk2rW2UR3op1VhgGQEgxTKtd593ZewNF8GYSLR261R
         goSPrKsjXuZ+aLgQ8nNk7YcXEPmcW5t4n1eSI3W6hehdkgJAxns/X9AhoPFu/hiGZuXB
         +E7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927074; x=1781531874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8cPA997XuE0awkGepna6I5www79fUhweZMaYVACJLoU=;
        b=dJvYuuOL1175pj7dh2U6rVTYW162Df+ktmvc5PDFtYj8jGx3UAJ96+k5tO3ikXl1lx
         fIneJ6xLWdw8iMx/lgp4WVqkp9fydjr/OF3y0hLXimtTM/0qLyAI4nH2gE1Y9E29HXOe
         +iAXJSrGmzaHEPzs8UHTGLVUzsN31docfiqx1idz1DyyxaSSXAh46hXD3cIDQw84s6+/
         ujmhHZtQyFa1w7pECTZIfrex8WAjTPs4lNe3cFRmiDSVu6X4fwLJVctQEqbTrdL6gYYD
         Jjs68mWyyCz1WT28489Vv5ustosUiQ5wA1Vce2E64TuS8O3ASgeisBNvdhtkm+m2ON5S
         NR1A==
X-Forwarded-Encrypted: i=1; AFNElJ8kz6doYUSfN3lcIdrr/hGt6R6aEdJXo1mKeiLkUC80raOnDJgE4Q/YfXHhp/biVkHSBtIxOhSktGrUXnmMdjn/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9uR8JMSj5O7Ukf+VOUcbAXmtv1F5oOt1QhBQbRDQc+2ziTFCn
	JJjV8BRwlY0AACqJpEAkuPnhvK/V8wBW67z4jYXgc/MxFJ6mQTdtJh2tEZ3MaXK6S45JcZLwUul
	aBH+TDcLNwkC6bcxfa71aIazoq85CIzmXbXJo/hRCiw0qKZ1mTnQIT56ZRwmJu1pqeJ3Qpw2GWV
	b9LA==
X-Gm-Gg: Acq92OGJBt3rJcCihe2RNLkxhlOJ12xptqKun3D+BbWYcql/oMH+6De2g/erVQffNrn
	KFmLosKZAUd6GZHXmwwRLKM746iXYfolEpBHWKvjr+9l01T/CxycWf3ELRjkgGjmHMADC9qNT9V
	xW7wQ3vCVLk17cb3GSEC5HUE++n0RIuB8cT063/3L9YZgBmNUFe3WpPXOvsCKXfocqblcT9uvcc
	EyYuGFtsXz79xiFTQPy0H5AZ6s0K6isyjqib11mxLtFW0/odpCMhzJHAyq35AJK5bbD8gkuFHl8
	0gVH/ITzIosJNikH2C6pzIT8gDC92DEAlZZt1+I+Z7QAoQraigu4uwXq1+4u/q/jeM0WJMFaFe0
	PLc5fSxabNH7qLTXzFbLLgs7SRSTRKtgLwixswzkA86jjgDg+O6ze/3V7fY21aZkOSm9yGJFf4J
	03QxBH8ggkOO9HmjjYhURD0rRYrvEKAuK2rE24VaTlgkWTcw==
X-Received: by 2002:a05:6102:c03:b0:6ef:dd26:e2c3 with SMTP id ada2fe7eead31-6feffcf11e1mr7169186137.24.1780927074584;
        Mon, 08 Jun 2026 06:57:54 -0700 (PDT)
X-Received: by 2002:a05:6102:c03:b0:6ef:dd26:e2c3 with SMTP id ada2fe7eead31-6feffcf11e1mr7169160137.24.1780927074019;
        Mon, 08 Jun 2026 06:57:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed2adsm3867106e87.1.2026.06.08.06.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:57:52 -0700 (PDT)
Date: Mon, 8 Jun 2026 16:57:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <p4xnrkcpbufkkbv4kq5civbt6hiwv3warrz7jiyinsfkihfedh@jfa7sgyzot6j>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-3-2a6d8ca30d63@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-smmu_interconnect_addition-v2-3-2a6d8ca30d63@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMiBTYWx0ZWRfX+W4RGb8b1udL
 TkxaYnNHmK21ia6A0zGdMPUlSyZrDS196t1etO29FZLMMHT2MzMUIiwSl3v11OLAmtxYWbLJ6Ij
 zvTgWT13krshDjitQUUptz3umzVwasXg7RNsfWwArY2gfZhMLrXyqUGGNOUEQLCGSxv/qTGLY3Z
 GFstTpRCLq80k2y05HKbdi387PjlOsXcs0MGvXxVqWlpDAlCDpcr2eRBhfXQpU3Iydqv1tVCdpH
 iuMspDIngNDICRbsj6PzJYimjmZmHL4Tv2IHvY4ITgOyMBZUs/HuDIohqkuvX+SX7uvoc4R9xbT
 acwPLKKvv0LRwiT7KuD/vGH4L6q9RaKwlczpNeLe7Tt2K4B+tqk/7QJfBblXLnYD5csUzPLgzq9
 6IzDGfMce6QDAOHDD+SNtiX9OyXdgz3CpzogihQi4zErERKG2Tc4ImnYJoSqDgstwhTCqIXRaDt
 d7pS3WSBdceWYZ/r6aA==
X-Proofpoint-ORIG-GUID: m5uWGRFvUjMfi1vPv7zedVypDF5psTI3
X-Proofpoint-GUID: m5uWGRFvUjMfi1vPv7zedVypDF5psTI3
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a26ca63 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=LVq_GggcSHk3DsAf1gkA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_065756_385734_45914D82 
X-CRM114-Status: GOOD (  20.70  )
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

On Tue, May 26, 2026 at 08:12:04PM +0530, Bibek Kumar Patro wrote:
> On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
> are accessible. Without this vote, the SMMU may become unreachable,
> leading to intermittent probe failures and runtime issues.
> 
> Add the required interconnect to ensure reliable register access.

Does it only concern the GPU SMMU? What about the APPS SMMU? Should it
be voting on other interconnects too? I guess so, because currently I
see that TBUs vote for various interconnects. BTW: should apps_smmu also
vote on the power domains?

> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index fa540d8c2615dc02d941eb16bc7253204c2750bd..eefa4b836a81374ff437ab4bbcbc3fecc1590ab6 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -3386,6 +3386,8 @@ adreno_smmu: iommu@3da0000 {
>  
>  			power-domains = <&gpucc GPU_CC_CX_GDSC>;
>  			dma-coherent;
> +			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>  		};
>  
>  		gfx_0_tbu: tbu@3dd9000 {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

