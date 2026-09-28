Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD8BCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 11:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPso9G8Y2iqX226aLF2wFKAraeHtAaZ5eheUmmWUNuE=; b=TOEs8fBGedmgVcQZR/sIvwrgmI
	JZ89UvGQqif8RGtb3TmW1p3BCYlc2fBFLOZv6JMZQu8AP8uQnrl9GgXyL5BZi8GCQY9PqGnCpy0+8
	dg1DgquGuDJ1MLtOf//RTIB2F1o0GvCDKR3fxA6gX+BnuTsB3mCo6uQExZiMQ2GwNek8NYHedUpvn
	jMK2K6Y/8bc+sB9DrpclUbKeFsGrtv2MDbUjJBc8ArlVWA32EofBy2b9jDQbg4ZtcYM5XcwWS5pqF
	sNVF8XxRsgswtSjS6A7mbSGkZzke5YQ3OJv1G70kCw1ccJ9x62vVXo2NEb7spd723n7TePTr8Ifco
	a3aV6AKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9Pi-00000000R9B-00HS;
	Mon, 28 Sep 2026 11:20:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9Pe-00000000R7w-3dXz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 11:20:52 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAWFH1042616
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 11:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qPso9G8Y2iqX226aLF2wFKAr
	aeHtAaZ5eheUmmWUNuE=; b=dGqUILAH89LghPjRZ3nLKZq+3Sb6o3v4knl+ualO
	Pfspx1VVNq+ydAq8PaFM5Mh7DXkIg0EHd9oe8WAVMH4tWVRaLtWHt5MBG50DWcTA
	2JpQkJNt7YjhhOcBrpLcnAf+3L+FHNfQ1Dmi9Q0fcYheomKby4H25rKPfJf6QpkQ
	bME9y57HtCfXQXT53GCZswwa/Jzz6Z9PuxauMUURdyUFtER+a26MlhjJxYJX1stB
	PSTJTdied1meUi73fetsoZY/k+3AhX6gdKgfqf+r5RQ9d36VkqnvTOfo3oY5Gb8N
	BLbvfnsawsFk5EVeJCjptIW64NCKX2aerthbFG5pjDulcg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyk5ms1at-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 11:20:49 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso1073026c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 04:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790594448; x=1791199248; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qPso9G8Y2iqX226aLF2wFKAraeHtAaZ5eheUmmWUNuE=;
        b=aqeH6Ived4iK/8M8s0fu5P6rraPSrk8LDTylWuy7xR5fSzGrfYkhvka+guyTGk3bDW
         v7iR1U7x3IdhCstM+PYscQiCFCKNa5cP/sneuCKlxEcLqBbNOxFjOS3xIkrTSnskoPWe
         92vtB8blD/EZ0/Zq0xkZdNqx3DZdMoyA99qHk8SVCwLJsXZCef0zl9oEbMChhfkTG4+U
         jRNAjpf2XCUkFh3AEy1ZR49DFXvvjrz6YohgdowYD6DW7zXtVjdcLizrIoxlXT4+5D8/
         WyCvv1GtMCqx0kKyAX9jNfVOhJWSl+DZfsIiPz/LpeMUJakyCQTlwgmbcHO/xzfpiDNq
         s0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790594448; x=1791199248;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qPso9G8Y2iqX226aLF2wFKAraeHtAaZ5eheUmmWUNuE=;
        b=Yl5E7nICclpFQeZ0NIFWfGdnn4zhlds8itFKfoffFnGQof3Uwgjno/NBN+KQZ4/8a7
         q5hapITu98IfpuhywLSA812hojYR7qe7EWpXL0F7yVl/pfgN3gKAelEyB6okelf7ty0H
         doZRt3ax/R0igr+b4mvv/dMQUBYBhBYhotYJ7KIj77POQmhNzAdKp23ePbT2cm31ZZGC
         8s5UrdGLl1pge4smcsBgpRLOVelvBigeNnJz1fq8ACjhwmrOxWbUd4wUPS3UCNTjTI4J
         WLfxfnMzCkM+A/NIVWOpQ8WO0jzVMY36PxpnC7sdsumFnFTpoGtFFSKODJslyZm24POz
         YZ7w==
X-Forwarded-Encrypted: i=1; AKwUvBy5UHZW0KlEfi43xPJnt1j3QfePBh915oDs5jTNjmt9OXxG4TOQb0fbP0ccClPWDGizlhO/J3QeTQ3OMf0+Zk3I@lists.infradead.org
X-Gm-Message-State: AFuF++lsy5/bs8Op5bNjFkYzoCGmdJ80vYplL5qd3PEwvYWhru09k8LE
	62YldpSUC/5PVAAa9qQ2+Kq3Wn86ecIdTosAPnnfTHvUYBPRNlZ4XgTrjxTHJa4KbHBQX1Z1J00
	LV5LoJaDEuATsTzqj8nVQ0eW4wvrHTxDqUB6cxFOFAlril90tAYf67O8J+atgTLmY8kMBjc2ceK
	9jUg==
X-Gm-Gg: AYBFou006+9aduAO6Wuag3oSQLr/mz2LiFAyY4qEsr+ZasNcIZAKIKRfV8Ct9z7x59b
	nTDwzOPjSZNbK8P1UeoJIemLHlKblkDGnp9VMbgQmmANkeIh6NNV13759fFGjEJPtOH3cRPPGbj
	l48mHe6z45b1BI77h3cCvQMLbJUsYlqxP/yZ4/um6aq1q0NgyKp2lFenmerQO285/YH5T7rT2is
	JRcnV4DiEp8lg1SH1XwluHZd4L+5XnqQHLg/hubdHBG/RtTZkP21ArvLUK962EXUuir6fNUf8kA
	Hnb91cYZ9N45eO+FGqHXrUByGQyHManPW40eIDFeVrE0o59KhoNpAXftLSz/JTxbzFYJHMRA6uu
	gw+2eZWzQF0kf+cHopzeaavzxLuvcMR/bT+SegfFhPg==
X-Received: by 2002:a05:7022:b042:20b0:144:ed03:7c66 with SMTP id a92af1059eb24-146ce680be2mr9817591c88.20.1790594448310;
        Mon, 28 Sep 2026 04:20:48 -0700 (PDT)
X-Received: by 2002:a05:7022:b042:20b0:144:ed03:7c66 with SMTP id a92af1059eb24-146ce680be2mr9817551c88.20.1790594447739;
        Mon, 28 Sep 2026 04:20:47 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-147913a776fsm20668467c88.17.2026.09.28.04.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 04:20:46 -0700 (PDT)
Date: Mon, 28 Sep 2026 19:20:41 +0800
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
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: Document Adreno SMMU for Nord
 SoC
Message-ID: <arpNicG_jUzh1ZrL@QCOM-aGQu4IUr3Y>
References: <20260902013858.130887-1-shengchao.guo@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902013858.130887-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 1KFuFbST-9QTxgDysltbDfWRQd4ZTdKZ
X-Proofpoint-GUID: 1KFuFbST-9QTxgDysltbDfWRQd4ZTdKZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0NSBTYWx0ZWRfX55fV9QLeeqjr
 kU6Ikiyukrj0Mon+dIi1vYJD1U1csxHGnLhoRWtogix8bba4hKWuGnClHwEfrR49jaHKJsUwjYx
 Zy7mxAiKqZvM7PrFKJl9Wqu/U4vOKB4rw8NXDuu06Ht8s3BMHInMUbTBeTUV91jlQP6Vd68u5Y2
 +wCBxlvq6cUKhYsPkTFh3RlzgLKmooLSw0WMDU1IwzcBsGOQdgzOHXnqgZ/Zw+OdhAyNgnlPNQe
 SXOoZv4x33fYItO44LREPhWFNKtYPPpBPsKeYazRLK9xGliRfRS/qTqOWekyZ2348nM3P8dSLLS
 Ntlzm/4beqPIxpgLYq48YKaaczii/GneUH40d1ZlhSjbpTgFDLVVHXrvVuYwYgcscp6+kDmejY6
 PV7IOk1MbXmIc9cEZiTMyXTZcFP9tbZcbSD1ZRVHGeZsTV5VeeckiXT6T1SYo9Czou6+5ZEiE2x
 /ahOXnUL0HXHdaNJlwQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0NSBTYWx0ZWRfX71UAqnsKluo+
 bLSuYKDHDrBTx3xvf0kxKOvYeTAnkXocG/zeozYzd+emr38zckfk7MmywYLnmp3VDvgxCLvd1vt
 lY5Dvp6lWSZb4KEFh9fgQcBskGBsHdY=
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6aba4d91 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F8PB8KkoD8y9vLVCxn4A:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_042051_038192_DC0774DE 
X-CRM114-Status: GOOD (  19.11  )
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

On Wed, Sep 02, 2026 at 09:38:58AM +0800, Shawn Guo wrote:
> Add specific compatible string to document the GPU SMMU present on
> Nord SoC, and constrain it to the single HLOS vote clock.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Changes for v2:
> - Add the missing HLOS vote clock constraint
> - Link to v1: https://lore.kernel.org/all/20260901140816.74200-1-shengchao.guo@oss.qualcomm.com/

Hi Will,

Would you pick up this change? Or are you okay with that we route this
change via arm-soc tree?

Shawn

> 
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index ffa33b7f4a96..214a9c051588 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -102,6 +102,7 @@ properties:
>                - qcom,hawi-smmu-500
>                - qcom,kaanapali-smmu-500
>                - qcom,milos-smmu-500
> +              - qcom,nord-smmu-500
>                - qcom,qcm2290-smmu-500
>                - qcom,qcs615-smmu-500
>                - qcom,qcs8300-smmu-500
> @@ -579,6 +580,7 @@ allOf:
>                  - qcom,glymur-smmu-500
>                  - qcom,hawi-smmu-500
>                  - qcom,kaanapali-smmu-500
> +                - qcom,nord-smmu-500
>                  - qcom,sm8750-smmu-500
>              - const: qcom,adreno-smmu
>              - const: qcom,smmu-500
> -- 
> 2.43.0
> 

