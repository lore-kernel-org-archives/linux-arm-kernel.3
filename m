Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B679C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ml3ta5SN1xbqlfIsvlPisKm1wFDAiGC6EKlzVfQ7Seo=; b=t/61rvdHS9STCTlpN5gfGGwYxG
	cMvEG/UVRsymQC3npoz0IXheDttlRI137OIqKC5//3YpBWAm1GEN9wty+6wJMRUnulLgfWga9a+GD
	+9BISlFxTLoMsDKzIl1z5oZzqKwpSf/Psx5hU8A1By/6Ion5lzGsPYPxtev7aoHH1TaUzj4Nt+Ji/
	6Zyxwo7z0eHq0ONc7A3F7sFtZRyPIMveWBQBkK/Ko639DtEDMX586F7Iy5atmS8feeW74LY68Sja7
	20c1S2ENqfD8xCkp2zIm9ODlkJH4iEpJn4JGknddglUSubu7VqtzCykzSG4paKzHLB++NgbXtCAQS
	LvonYrFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woSI6-00000003u0l-3G2b;
	Mon, 27 Jul 2026 20:51:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woSI4-00000003tzx-3iRo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 20:51:14 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RIC006245548
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 20:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ml3ta5SN1xbqlfIsvlPisKm1wFDAiGC6EKlzVfQ7Seo=; b=TfcEVxYHH7awtRre
	u3qOjQ/eJ6aHTo+6+m7rfqbloAlVE8jjyrLS0594MLb0Rc6vhfr41+bnY/NgcvZs
	N9SOJB6QO6ENi3avgPBGoJ1uHk15Wz8PRzLaEo4gefSMOm2mKKhBdKOdEg6BkPdb
	nTN+10Jkt8f5wVUMC4n9rD1p/uC4cRSx601en/2yIA9HR4m9EZkH1qfgVAN0o/cA
	6fbcaj8zBSCcCRkGT1tqYGGs0Idoj7KAvl6AI1LtERHcA8umtcRpgGOWQ98znmJM
	UcY5SIdgc561hG0WMEzgK4g+5DOH+cDFjD2zT2zotSVSZ1NQOQaYieacapuF1uLJ
	uXIhow==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4nbu162-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 20:51:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb5ea36f969so3439380a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 13:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785185471; x=1785790271; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ml3ta5SN1xbqlfIsvlPisKm1wFDAiGC6EKlzVfQ7Seo=;
        b=cYiqDpKgKhaVFVaW5+Dd851jGJZXy3n7kQJWweU+umfVqYawlx+biZHGQuiow3nnR9
         L0B6id7nJbN6m+Ci2wqDrL0lmdv5R4F1G6oQEPGLVTWinPTkqFnlplcH3VwgLo9oam77
         RVzErnQ4TJfPijxo8/i4SD1xD0bve/WHBnEiXCxyInS/rgbzQkLZAncQlR8oWm2aoCXQ
         vq6j2THUmI104HrsXVNySAAxv0RjsWKVwnW14ni7/oL8JtjQCZXC8j/kjBvZKvd3Gw+L
         ZrxH4aQcwswaqRzYbkW7D7W/LDKsul6eYQHSG5EWOXG4HV+wjKqF+RzMWLSCIjwoMWxF
         xZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785185471; x=1785790271;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ml3ta5SN1xbqlfIsvlPisKm1wFDAiGC6EKlzVfQ7Seo=;
        b=oIAQHjfYlHj0QAnE4IVwSa03S6mJn7fpoCSKB/1GqLstjGbpxze2ZKxR5gWpGJf8qi
         F/GcijF74bkkqpvOJE0lIj9ZuxC9RywvD6AVpwe/3keLbjbpr7IbZnrIvXLncwX5rfDf
         jBFoWtXJpR5cr/4J7DSTSr1HKtzSg+r++G8xFf04sOeBrhER3Nw41yBs5RqKAFGXN3S5
         uFOVMoRcn45PJZPB2PhOv3dtz176AHCNOBGbV85mAyRhTMXx9HpHBf4FrGtj3XskGC9X
         SiTBshpZyaP9FyTt/2pnlr4CnTv1dSFEFLGIcp+uXTITVMmRam4C4FoB1r8yVepi3W2e
         BvdQ==
X-Forwarded-Encrypted: i=1; AHgh+RozxiADO6NWKBZ1hWB5StM4eztegfl1Io3h5/hBTseknT2ho2ssPYbeLl8pTLY9TsoQVJITzBz1f0soFAp9e7U7@lists.infradead.org
X-Gm-Message-State: AOJu0YxssLmvhcCHIGBu4lG4tKdSodkPHIAs8NzCcS41S0rEic4Btb6m
	B+mw22nRB1EfSQVfxQCjZANdpxOGsqjaDrJCF1MUpqd2TJOSX9ETNqI6E8ZufcwxwaGsfbvyZBT
	UXQR6sZ8oZ2eFcamMmzZhl6CnehgAzcnIAzgW/Nome/FO5Vi+P7nM9rlETJp1eosDjGLZGMsfOG
	JFbQ==
X-Gm-Gg: AR+sD12MKJTeD9ScKurm9lu9AgjenMNVgJ1EICZ0n0UwgVWWzxLUtR66y8oEn7V8Ofq
	jMahaxNfVoYv7oFoaPsWOom19U0UAegY8jjrcDVevbpdZouORYiYcR6CTX2yOxU32EFvTgmIE3E
	RU82rNZa5HCHInIiyL7bUfokhdE3xgTNZNj5R5sr5jnmBGBv3jG9Py6fNPztQ2oBK4yH4HxK/RU
	8iJyRDNkosIRI3keDoBIKttQ+qsfNNL5CzMg9paiw1xQMEmpZMyqtcfk8aOzQ7/XHZkOfuJlblX
	TiBtIr1vAnxkMUL1CyVxTUbFf6zGm2OO/ANGpgaCUxlSoZyRyEtNS3XRtpRPwAHG1r/NTwv1H6f
	F40/8psTydx6Bp/bo9WT6xmaCoD9tBVHHyq0ZKgKHO+1x3twP4hGoZg==
X-Received: by 2002:a05:6a20:4305:b0:3c4:de3:816c with SMTP id adf61e73a8af0-3c6c7d90345mr1054503637.37.1785185471197;
        Mon, 27 Jul 2026 13:51:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:4305:b0:3c4:de3:816c with SMTP id adf61e73a8af0-3c6c7d90345mr1054480637.37.1785185470747;
        Mon, 27 Jul 2026 13:51:10 -0700 (PDT)
Received: from [10.73.232.208] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc419c52sm35047910eec.10.2026.07.27.13.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 13:51:10 -0700 (PDT)
Message-ID: <f6443353-b3c5-4922-a98a-1292db381ca7@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 13:51:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: ras: Introduce bindings for ARM
 RAS error sources
To: Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        faruque.ansari@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com
References: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
 <20260720081954.1858180-2-umang.chheda@oss.qualcomm.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260720081954.1858180-2-umang.chheda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sHYv_ccFZ8XMp2lI3Mgscg4YJRY6o77V
X-Authority-Analysis: v=2.4 cv=cJjQdFeN c=1 sm=1 tr=0 ts=6a67c4bf cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ZKp2R2PTrS9d3pXqUQEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE4NiBTYWx0ZWRfX9a7iehv/rt5H
 rDNdtDnmojygFgRJ5VJxoJG/B1q085HMm+DEjwUd8p7XkrHR1jC6nDoWIAZmhKBHHStT8vbOSv3
 0fHkJWGvtkdIMdoMqy/mMAZAZeqiPdM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE4NiBTYWx0ZWRfX96iJYfsHAd0W
 JWBlYgTLqVAlSvFk1hYV3wqAUx8DJDjvSc2I3alE1tN5NBTJ1zXmARrqsRa01Lyn7fWuxIniDR0
 sdfj9d5OtRNlJJWJVPaI0wHyZYdj/tbBSHTuE/YPkbfaer4ylpUwNOyAFbp7NsSXakHn0jPRFn9
 aiifdCevhzCiWcWDscAbgGwilGBU1RZyuMRK5lisk7Gzk7ZiqBbgXoA1nMM2mzhmH7Y6X71Kkp4
 1C8lzfZKcgDAXh1vX0v6JEyrjH3WC/NsShwp91ESZEd/3VgNvuKWtrRQvcT0OcoGCuwu18OephU
 Wev1dlGfZdjHPKa5FKYqpJeaLd+QeUE/7gie6yUFIozUTL41v5CPh1kir8SitBDGUy8u9RiNq3T
 O6qU/WA4R2fOUKK+K2OPs+lc5jqcDVkCvsRW0qaCVeE1F0uDrll3ivxHTxg9OjhIDcLZNCBFjaf
 xdKw3ilOaf5ZzbGscQg==
X-Proofpoint-GUID: sHYv_ccFZ8XMp2lI3Mgscg4YJRY6o77V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_05,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_135112_934132_386FA2CF 
X-CRM114-Status: GOOD (  15.06  )
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

On 7/20/2026 1:19 AM, Umang Chheda wrote:
> ARMv8 and later processors implement the RAS (Reliability,
> Availability and Serviceability) extensions, exposing hardware
> error records through a standardised register interface.
> 
> Add Device Tree bindings to describe RAS error sources.
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>

...

\> diff --git a/include/dt-bindings/arm/arm-ras.h b/include/dt-bindings/arm/arm-ras.h
> new file mode 100644
> index 000000000000..c2f4e1f8243e
> --- /dev/null
> +++ b/include/dt-bindings/arm/arm-ras.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +#ifndef _DT_BINDINGS_ARM_RAS_H
> +#define _DT_BINDINGS_ARM_RAS_H
> +
> +/* arm,group-format - error record group register window page size */
> +#define ARM_RAS_GROUP_4K		0	/* 4 KiB,  1 ERRGSR  */
> +#define ARM_RAS_GROUP_16K		1	/* 16 KiB, 4 ERRGSRs */
> +#define ARM_RAS_GROUP_64K		2	/* 64 KiB, 14 ERRGSRs */

Do you want me to have different DT for 4k and 16k and 64k? This is not a right approach. 


> +
> +#endif /* _DT_BINDINGS_ARM_RAS_H */
> --
> 2.34.1
> 
> 


