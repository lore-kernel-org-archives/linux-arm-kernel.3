Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAA6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 17:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGOdWSibWy2J+WMzG5kjYx1/GW5ewADeIBUplqEh2Mc=; b=RaxHDKYz6/28pznxrnL1RNTp3p
	auc6v6yAAtNjzzsY+OqsgB1qhsXWjUCnz8EdO8WgLsuLxaCGKRQ/4LLxKkLdE5d/mRhRxhdsjEGiO
	tx74U1TXOscZzRdkWNBfjJbv4UB2XAEFV4qKExr7Kq7LJ6PUX818bHu60ks1pXTncdVZmhVpt5Zwc
	o4INsrFSMD1p/ioW+ojVSU8Y0eYjMkWQpobqrniWzMDVBa5Hw9VHdbUZgUDFJjsqVJ1+cs8Ks/Jp6
	3YmSI1PdFTJ65bE4kQJ8Z3ceKK+7vKxiOVCoJAi57RnBjdTJKB03JAf53wLSlwc8VwUpoTZ1c+KwJ
	nknHwKmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnHi-0000000DDis-1WiM;
	Mon, 06 Jul 2026 17:39:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnHg-0000000DDiR-2GXW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 17:39:09 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF1VZ825623
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 17:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YGOdWSibWy2J+WMzG5kjYx1/
	GW5ewADeIBUplqEh2Mc=; b=WH0qJUeNVYS7Hd/3LByKsTPskXpLO4fmyO/Y3ydE
	IqVkCbncnX0WmHjSLfMyDdk6T/Zy6uuVUaSSY9492sNMmvdaMcFtLFd0xPvzzLrc
	rsouCxI6KHCQ0MJdYSb4ILsgh0qy2mSoz7D7+Ly02Ee+N+D/hJ0sIZ3d1F7s2L5p
	qym5hMMAOTODns2f6b2r/lcRmvwTJLxJ2fMRngyLx6YwR4Of/7OARmvm7R8EENq9
	fwBGw2HAo219wcBF0Uyn807adlS4Te/FLJ9iaXC/2D94MjzWD229OgBuO8kT2Xuo
	VhN9KWNNMqnGdoCvN4BcGYBpdfEcjsXOIvTlQR6TkbjlCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t8ag7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 17:39:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e53b8a302so310375585a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783359547; x=1783964347; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YGOdWSibWy2J+WMzG5kjYx1/GW5ewADeIBUplqEh2Mc=;
        b=Cq1tmV3Jmc8qhS+h5lI1/snB5Dr3QAxm5Y2IeYzv5M2eXMtCaOfG84AHrd1eYz9jJN
         Og3KPEZhin2Q+7zEKJFM5MYUgoQZw6MVVLgxZxNPMBsILz6KiP7Aak9q88rEoyw2+lMC
         OgrqpK3NrVqxv5e4cwpl5uPIDgjvPyoCauGEjnG5oGaq51o9AdbVo+iMDeKeOk74QhWe
         6TL041QpJeMHXeFuk3x9snqCI3YXATz472RIPYDEXi0Hgunpe2Uucfur1nwq1d+3U+c6
         vXK/b0gtx0TqN0Y3hIW4zV/RvyCbtJ/NG4GSTtfgSG8IvT8VH8tGOC5BO0o1v3EzkFk0
         lwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783359547; x=1783964347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGOdWSibWy2J+WMzG5kjYx1/GW5ewADeIBUplqEh2Mc=;
        b=deGB8c7jOWbDrW/17JUw09MW6Vx0M4G7SSRew9R+yMfxQcuJxgR8Oxx3w+ReNr37qp
         GZ06873PW5bdP2XWSLfcbTk7Dc8DqZKohJW0y1aUUnFUuxGAmrLGbRgIdJ1DlBOLS8Ga
         rk8iNva73KKerPnqMCzTdQPSkVXzIkkgU19HGod0jOIeL5HMX5UgIfuyaM44nm8/yPYT
         70y7CixTYlFK+bofm78dLR2zz0dEhk2LzQH/40fi41m5lcQS9mupqV/IXBef370wRE/W
         9ucqFCQApp04vRe9p51pKpGi6FkPJ0XKrcPDqeCSVeBnq70B/5rHqfD8IqvrG+sxqGCH
         gBng==
X-Forwarded-Encrypted: i=1; AHgh+RoWee+0SqIwg1B9ZyPYdlrarFJvLiKlX0e0/uDvx60VzzcFG+Eko+P3GyH5npXZXcXrVXCAbSk/cWmchkqo2jtp@lists.infradead.org
X-Gm-Message-State: AOJu0YyuAD3NeMi8ee5lAs/8gvWYWGPLF3JU/V+9myVGbC06245vxq02
	8HX1UpDtjOk7z61vThemvD38JZstXl3zlHtHXWgJALp12L+795j7x+vC82WxaFhD8o032ISz+Oa
	f8RXqozCoMR3HtZPoLjntg3ICPHPNd89Dss5uDH5rYCvWFSND3vDhuVSeLS4FURFntNgrdBZIsX
	vklA==
X-Gm-Gg: AfdE7clgGAp7qFPloSlliMge3TT1IVi8xyf08vj3rpnSsJdKK4TaZNGRgt7Mz8jhe7S
	cl3KpccCizuAglBXlJqMu8dM4ZggPQohrhyS/EF0YmqtPVeWc39zyIQXELnlRo0IjLqAu/cnrv5
	udPy8uqOOUVXvp2Yxh0PQ0qQzUTdDmaJyL7xP81xDtXCOdemN84i/2r43tHOc4nrW2eHQEK13Rb
	PQMyXhdV7KMQqEb3fUJaR1EmFlJqrhPo9pHwoFla89GFQwe1Yj45pVSW6vxqEyxWtGZ+lYdVOu2
	nUa21eDf3CH9kvPHs2YzNxkw8tBUok4+G+BrobeHafakDw6R8jEf6T/T6lKGmhq+2SJD3vfxMlQ
	TZt3dUe1apB7s2cR08cgcO6P2HrBEeNdVpLL12yJxkELeAMGr3E3ZIxSkbaFm4yLXaBxsFPW8cZ
	rIsgkHs/mrjXCJ93l3efzA1wdH
X-Received: by 2002:a05:620a:2904:b0:92e:84f0:d3fb with SMTP id af79cd13be357-92ebb529002mr232285185a.15.1783359547102;
        Mon, 06 Jul 2026 10:39:07 -0700 (PDT)
X-Received: by 2002:a05:620a:2904:b0:92e:84f0:d3fb with SMTP id af79cd13be357-92ebb529002mr232268285a.15.1783359545628;
        Mon, 06 Jul 2026 10:39:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad18af2sm20869461fa.7.2026.07.06.10.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:39:03 -0700 (PDT)
Date: Mon, 6 Jul 2026 20:39:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
Message-ID: <nrht4irqtvt2vk3lrqvljonarc4kanht2nrwjt7pppsfhozffv@o4xei47l6gcj>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-1-afdca0125a65@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-smmu_interconnect_addition-v3-1-afdca0125a65@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3OCBTYWx0ZWRfX+a7UoInZ5HYA
 /RALxHiuUHuun4tvJdJq62xFVzSunCOUgKU0K7mzFw0HFFXLIkUVVoYenS4BzzUkxmN/o5x47a8
 B+TG+iXDTpyQVXFDpaGPRPu0DGWK6uc=
X-Proofpoint-GUID: lFIrbCGIfBQ2sfcXwSTYjJerfgmLSEIk
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4be83c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=3fmthTPW8Nr5gDDPHxsA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: lFIrbCGIfBQ2sfcXwSTYjJerfgmLSEIk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3OCBTYWx0ZWRfXxGMGj6rgrBuN
 yG7mro7MkWhRFj3vAXt5oi6D4343YpqNSeeGFE4JawHuoXfOp0GSqA/LvO8GRH21x+EwKuX7Fp3
 3w56jQu3M75YEIpywFpTuClWgqrmlIC08u7QNF4zu/VZLYWf7furqU6Wk0AJjWZVYTxjG12TocD
 vLebnzp7J1smMnW3b9d0E/1CcwzLmuhRQgn+sFt2cOrN94imaZo5NuTovXjozmlJd7A+jEwVlb9
 MHK/+7e66KwAbfxgZ9WvnD5y7iKNSeTF1Bw/uViONNLu/6A2wReHf363cEtoJF9chDFD0jY841k
 yb3X8MRsL5Iogx8w3h3Le982CvSRWf3I0gZiIcUSDB3qoT9wWcii+KxzI2sIcbm5k1i1MAnmOcH
 M/sjMaaqr5J/bxUzJf9mm5omSbsuu/lVDrY4kunB0kfufZU51sC9oOwYQsvHXnObCHGH7KcwLnU
 4yZGyTYIVdwiPfYsQwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_103908_583071_EC87FAEB 
X-CRM114-Status: GOOD (  22.63  )
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

On Mon, Jul 06, 2026 at 10:26:34PM +0530, Bibek Kumar Patro wrote:
> Some SoC implementations require a bandwidth vote on an interconnect
> path before the SMMU register space is accessible. Add the optional

Why is it limited only to those SoCs? Is it also applicable to other
Qualcomm SoCs?

> 'interconnects' property to the binding to allow platform DT nodes
> to describe this path.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index a701dec2fa0a..fab8944d7b63 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -246,6 +246,13 @@ properties:
>      minItems: 1
>      maxItems: 3
>  
> +  interconnects:
> +    maxItems: 1
> +    description:
> +      Interconnect path to the SMMU register space. Required on SoCs
> +      where the SMMU registers are only accessible after a bandwidth
> +      vote has been placed on the interconnect fabric.
> +
>    nvidia,memory-controller:
>      description: |
>        A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
> @@ -644,6 +651,26 @@ allOf:
>          clock-names: false
>          clocks: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          items:
> +            - enum:
> +                - qcom,qcs615-smmu-500
> +                - qcom,qcs8300-smmu-500
> +                - qcom,sa8775p-smmu-500
> +                - qcom,sc7280-smmu-500
> +            - const: qcom,adreno-smmu
> +            - const: qcom,smmu-500
> +            - const: arm,mmu-500

Can we be more idiomatic here?
Something like:

if:
  allOf:
    - properties:
        compatible:
          contains:
            enum:
              - qcom,qcs615-smmu-500
              - qcom,qcs8300-smmu-500
              - qcom,sa8775p-smmu-500
              - qcom,sc7280-smmu-500
    - properties:
        compatible:
          contains:
            const: qcom,adreno-smmu

In the end, we don't need to list the full list of compats. We need to
specify that it's Adreno SMMU on one of the listed platforms.


-- 
With best wishes
Dmitry

