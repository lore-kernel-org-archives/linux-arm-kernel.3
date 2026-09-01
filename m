Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A158EC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 14:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fV9PRxEUNiN84sI9N6/IsE9FUGfoQAhpy34kXAt1Nk4=; b=H2SQBT3Qt4NiWQ23ngyWyOLOVB
	m4iPhldUEQc0NNVzJP481+/3xuARzrxjIDO90robnF/10j1sjkHxlzvLDShxyRYyV69M4VcDFeRkZ
	KGxpvhocmEUX450ZC8sq56cK6E1W5knpXaazIxfwGwAAkXE2NM9Zv02kz1rAi1qLOqpx3EhBcgQ20
	9R4hgiyFwXDNAeyv5GAThyM3RSJ/JTS40JwZsXTBgLhZOHsr4VbEEFSg/qPXtUlhVyORCqXAr8fHE
	fS366dnFo/rPdCxdC6LnhyQ21lFa8Y52Qj/nfXbNkUhnCI31/NufCH0WSZ3WxRg+f/QihqhYDu+Zo
	mpjt2tPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Pdr-0000000CMTA-21V4;
	Tue, 01 Sep 2026 14:39:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Pdp-0000000CMSn-2jd9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 14:39:14 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E9aZB3004441
	for <linux-arm-kernel@lists.infradead.org>; Tue, 1 Sep 2026 14:39:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fV9PRxEUNiN84sI9N6/IsE9F
	UGfoQAhpy34kXAt1Nk4=; b=WqXsfw/e//gIC1Re6XF1fhw4aUFv2lryP5UNewhq
	p9Ys2DlsGUh9gcW+73JHYSrUJ9xfOE57/qVxmVmDLU3nt2fykE9EW8cMDBhgxyGM
	RZ0M3XlJ9j59taRBRUGTXA7kzmDvSTWkKoMvQQhOGl6ChwAULBfI1PexjaxXuSHZ
	FiIxKvO9a/8aNdQGItebxCnnPuJ4745u5/sJVNJJnoD+AyZph3Ju0+F7qqymM3/0
	KSTQ5nZrZmR9sjq6Q6y0Lvt/q+a/ZHnibMG/kYOHUaw84lk6MSK1FV4rW5CQVVCs
	TrmQhb90/HH3F5ikb8j08bPhlWGY5SJVh6LNppQ7nvcKPQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh2mac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 14:39:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0aso1793458a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 07:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788273552; x=1788878352; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fV9PRxEUNiN84sI9N6/IsE9FUGfoQAhpy34kXAt1Nk4=;
        b=bBUSSOyt9w1xSJgRb5uaqIJzDNDup/hr2BhoNk+triJyajJhALIh1dAqlS7x+MMzjA
         NyqERS94tieqeuMreNpk9i7zbrvnB0rEUb5UXXHWibE72KcNjuLWgWZzys7R9R3bZ2cC
         8m7UbyR+rq+hYawO908uO5Ow8QczZHr78y1r66bB3CG3/vOHf5mmNb03t9/P+TaE0wsz
         UZg9BesTkI4XuIasi11dBhcUxue0gWEWyO2sPznveGsSZiCraNE2RXw/nC8hil7EEIeH
         rLTzOlI7eln30HG3N5cOdtJlnS6YX52nUrp1M9DNQIlmTFuoFI7xcITwQEYZO14xtqNT
         CO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273552; x=1788878352;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fV9PRxEUNiN84sI9N6/IsE9FUGfoQAhpy34kXAt1Nk4=;
        b=DXcfbegogbEKWZeO4Dp+HAKipH3ZMPz9nI+ck3F4z088K/ZFItYDC1syaU6GfIUZiQ
         EC9Xbl/HU2IvgsX8kb/i7nc5iSYiFk7UrgEGCztGQpaTBm7fU0kmlo/sKSYhBnBVeIBv
         csHajFPLsdbjre1PUTjtSvBtltJJYxhH6cTF8r4ye+d0kUv3M+COzFVA79m/fTxNi87U
         +gChVuu1655F2mqciwv3506y90jFNzo0xQMHXI55uv4KVutOLn9flMh9V1SF0qKqzx5x
         37bBLkZXxIHAKfEbihJrg4Boe0ZYefs4aryUnDfEbkfRYeCozgv7v3lnXTIW2xb39Kt3
         os3Q==
X-Forwarded-Encrypted: i=1; AKwUvByR65/7VoNGGufnF7K+Seaplmh1PJmn3VykFwSwMbWGqX2bpdL1j7D4gU8e1jGiiDzHSlfEJasWT/rdYSc5pOf6@lists.infradead.org
X-Gm-Message-State: AFuF++nB6GfxK5vHk/A+q3u7lEEbilK1L6s1atoFq1MoI1txkkDLbR/f
	ojTcv5mcU7wq0kw8Qt3lT2SquxWRbxHNiwkR/9rp+4/YuISQTk/lKfu0h4HloTt5nsdpFqDCQvK
	Zh2gnsGALMNZ1GYAcRorGAD/o7kZm1t//t9rHTuP2aiOJZIHmNHhZ/NlQbTbzYKlL+3J+OWU+hg
	BVQPZ/pOzp7JyZ
X-Gm-Gg: AYBFou3yBPuHidA3XLfl23mJLvPsxtdGU1VGhy4nF4oljoGvfcNPS2UgQ1CPjAZZcJ2
	6p+BskZ7vwov2H8FDWwpHlytsArNUeCl4vlFaEeCTUIRZ1Piz+axjr8cMQpju/sfOw247ck/xnA
	H2Y+FecqyNtc24CDkOHbz4INHHv58dCYeJeSY/pY9l/wjjSaYjyKncOmcfw1SITc7vpH4nzWmTz
	VfbCTsPfQ71nNyiICMXRwrU5oSiNDwCd80s6yNVoYtl9+SqpZgYn3jAGEpEonZyJWAr5JSgpYgx
	rFuo+6DlWglg5esfjB8/vMhxCN3m19VubWbY13PLLHg7oYJi02RdejK3n7ZXfO4FxjOKONKzIPC
	y7+k77ovtnMBFbYWhRfHV0qU0HTKVtIRE9rw+2R9kw94=
X-Received: by 2002:a17:90b:2247:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-3990f890861mr6035578a91.16.1788273551767;
        Tue, 01 Sep 2026 07:39:11 -0700 (PDT)
X-Received: by 2002:a17:90b:2247:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-3990f890861mr6035528a91.16.1788273551258;
        Tue, 01 Sep 2026 07:39:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm59617569c88.4.2026.09.01.07.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:39:10 -0700 (PDT)
Date: Tue, 1 Sep 2026 22:39:05 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm-smmu: Document Adreno SMMU for Nord SoC
Message-ID: <apbjid_n68ySR3ji@QCOM-aGQu4IUr3Y>
References: <20260901140816.74200-1-shengchao.guo@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901140816.74200-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzMCBTYWx0ZWRfX1xqNZN99DkPU
 IhCEKCsNSt+8++INHZWRSBnSaPnILBEXy7HlXP9iFXMAC8/4Tg4M+J0pO6ZrWldKpz82NCbJ34L
 XO+1gNU3h75s56Cs4FTf036uOa+ABKA=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a96e390 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=gVtPwv5BqHs-4ipWp5EA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: CyKwH8eC_xWfe99cqJRoLX0igQ98sS3y
X-Proofpoint-ORIG-GUID: CyKwH8eC_xWfe99cqJRoLX0igQ98sS3y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzMCBTYWx0ZWRfX0Hv16HiOEvEG
 AkWT9N3oplHHelohV2jzaEuOU+rZQG6pqjLg/ahXESvo99aCPFafG3oKHvbif16bIiUXn1B9Dta
 8xqLMVpIEfIqiHtPqYsAz0SVdMSnCSn1jwRScK6+9YQJNIyjlud5/V2Z166NxQs6862Q2oaNRcj
 Ake/HJltxkD/rmoI4/AEgB2E9sxzzsUK9y9o4bxdCgE+OAc6dIajdyPiX6erm+ylFaM/gnV93go
 BCWgtiuGAhAK1v5sjevg5RXINqAOq2xgfbSDdvrH7hLMvLtOyIFyFQ7yV1vLUECYCpoNZ/whrZp
 Lvc4tQVW+N5i3qJ0696PTjHrdt/4HNJNudyfiD6uXPi+wIaycwWUb/DZwwVUIF5+C2lvj47LElF
 KjqSfgkz8BJOF4148m1Xj+YSDyzby2Qc0J8ItkyQLsz7TeAhpLOdV4EkHZ37bh1Ri+mCts0h50R
 WcTFsy7/JaA2xdAj/5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_073913_815011_828DE7BE 
X-CRM114-Status: GOOD (  20.37  )
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

On Tue, Sep 01, 2026 at 10:08:16PM +0800, Shawn Guo wrote:
> Add specific compatible string to document the GPU SMMU present on
> Nord SoC.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index ffa33b7f4a96..ea338d313c05 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -102,6 +102,7 @@ properties:
>                - qcom,hawi-smmu-500
>                - qcom,kaanapali-smmu-500
>                - qcom,milos-smmu-500
> +              - qcom,nord-smmu-500

Ah, Sashiko is right! Nord GPU SMMU also has a vote clock, so it
should be added to the clock constraint list as well. Will update.

Shawn

>                - qcom,qcm2290-smmu-500
>                - qcom,qcs615-smmu-500
>                - qcom,qcs8300-smmu-500
> -- 
> 2.43.0
> 

