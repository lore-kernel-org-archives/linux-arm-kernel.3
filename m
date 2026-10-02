Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D4BCA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3zYMfD7SYACODh40S/6KTO+UvPK8PifRil7ROAHH8Rg=; b=BhdoZv8v9cBPyHMjF/INTntkX1
	3hzSWZ/4+LKakzoLTgwluzw6kkAjvyx2vNkscbeqwAheVZUfcY18lc760JB3MhecTxrbHQtW4/acJ
	+vpZjo/m+6++69qg0NaUDdQheufV4Qijxtv4Ceh+iPMlq2O+V1d7p/CAM1MCHwfCdHeEeXtkknYmd
	+QQvtLFvb7QUEhdRPrTtIN/+igI4430Hvw5Kvrzhr4BYjMg4+947E/OmxxESRopDpxspC+xXbeLUx
	gFzXgoLPu7PImOkltEvkjoCRqA/UIasMgXcUVdYTis7krh6NT6ve2BbHHJ93Jq8XB1UrDN635AEKD
	aB4cNDtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCf4y-0000000BuDM-2lCV;
	Fri, 02 Oct 2026 15:21:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCf4w-0000000BuCX-2H42
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:21:43 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FGteP1878168
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Oct 2026 15:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3zYMfD7SYACODh40S/6KTO+U
	vPK8PifRil7ROAHH8Rg=; b=fohTN48MtqndvLOqeSHIBh3wkHdoeZKqt7FSJqi0
	fFFXMbDBfmTL+qCdLpMNaqofijXG4qoLilelLg1k903QmD8uxoeoxT3ig/ZXvs7D
	+YokVGBiAucHKfC4FtWZk6G86GrJ9jlqJ7eBiV1fDcJLBuqP2ygKCLdO8Z2M9Z1W
	38tiGYK5J0EtVfZ2oqfvN2ec8JoZz0bzVqket/oLz+RK3rsjWbL2m7HcWE9fTInN
	i1SHdPDKJwgaHneZ2CI1hnp0FJCEps8QUDBuIN9aexaoSLMv/kL2NQGHKhqCmP5C
	IjvDBCVHhdQMvSmP+dD7GYVlP4eXOVNs/jpXa8CcCEERrA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1w8tkprq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 15:21:41 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7b424ed3331so1125084137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 08:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790954500; x=1791559300; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3zYMfD7SYACODh40S/6KTO+UvPK8PifRil7ROAHH8Rg=;
        b=ZZj1hDOudd4YB4sRwWgJlZsU/1PzQwfwMNEM2fP5giYoBj/CNFQjnjrm9di2bKTWn0
         ccXqGgjY/r7Au/BsqZ3yUmxEYGAMBUpkt6qVdeWB/4LqlLucmhtNf7UXTGKmhq9lSa6m
         yopdq3nGS7mj/s88uKL6pPtApx0+DXlldzem7IJOqaYMxf336yxdcgL+MfgcnhQT1mjh
         gi+1F4jLxBXn042L+KOleGJ12cvXyzYSo2mO6dg4qBU7+JuTclpHWtdqIiPh1AcLyV1/
         0KtphAFGCCgdeBUjonhRSfAD2ijQNL5TYdvRGf07ZMqFFJGgM0CcTYE7et38G6VFE6aE
         o9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790954500; x=1791559300;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3zYMfD7SYACODh40S/6KTO+UvPK8PifRil7ROAHH8Rg=;
        b=HJdLiqA6IG23I2bzUDmOUdvNYzQ8oKglZYTNS23H8hWjaDLjgvxK/6e0cxf7C3bCDK
         +e3yuyl5GO4VF5/AkYDLQ4uFfkTYtaaYm+7wuvvwsuQd5R65jYKUgcYLjfTxK7a/1iDR
         sy+Htta/TKeUMZm7WZ+FjGsSFGhqIXth39VHWP2L7tVnv5ecE9r7bj27RApyTj42w905
         WOHHKCgBZl/gqkvdprASXAgbE2HHMCK6XgOa0Ul+IxDe8+BMKiMHJH0Q0jx74v/Bw1z/
         FU+9KvBmMnja64wm/mXn4dJxS8Vnpk6ao/oWqoivcnb+9y9FOX9//eJWGfRthawk3Sk2
         G0gg==
X-Forwarded-Encrypted: i=1; AKwUvBx5pkDAML4S4DZLeu/tZmIsE1dMl5hs9ljQNlcDNAIEqaMxFU2lKz8s1AwW5ZEtjsC9c/FPGHeSc8gBRph3ZUkG@lists.infradead.org
X-Gm-Message-State: AFq9FYKiPuEcRsR2bQSUrcSiJ0wNqOGVXXBe63Lt+rxLwEpPhryuZJ8P
	fogoL+UK3g917FtNkmtuke/F3ekSu7uA+lM9Fgg/X10gD6MZbtOiTrJLhPbSIZR81vtyF2yW9G4
	86nY3evhl94ZQmAoZuAEBSq3Xy65Vy3/1UK7CJCCay6VhE+NBC9CS3+g7YVzfeYp38oTPntjZ9R
	Aghg==
X-Gm-Gg: AYBFou0Ek+9CExcY4wRQGkVi2mtQGelFFTFosuIHxV4XYrSz5JYxsxT7wOUsYHkQaeS
	PPPF6CqLBnFXWejFuylTnXux2fp7ILqgvsEkk44nz0zAHtY68GP/cWe1CbVi4RHX8ei3043DMWi
	EgXAEZo75HKdyFaf+gg6/DoCC2t6IFFpGuUVL6+xGS21Jeeu6U0+lErIaY6ZKSqDueR+l7RviGM
	o6rnPYIe2Z9tISByy+PoPYhgAY+YM/kJlEe3pwSXoPTINjP1awbU+M1DhKcLjRxU/7u1GJ5cXEG
	YjGM+r+WZnPqUxsaTweTfWtkPJ1+DOjWsRLyQHmnxxa4gO92QAp0JCys2LhxBqr30UwY0JrItWC
	r7loFdCfmJe5Jy7z7Bf38TuyHRXqN6mgraQxmpFLkV3DeEgVBPDSWR6mbrESMY1PPFj2Fyf+MLe
	mJ9vhtCGjcv4JT
X-Received: by 2002:a05:6102:3976:b0:7b5:b0fc:55c with SMTP id ada2fe7eead31-7bf80c9bc8bmr1205477137.6.1790954499959;
        Fri, 02 Oct 2026 08:21:39 -0700 (PDT)
X-Received: by 2002:a05:6102:3976:b0:7b5:b0fc:55c with SMTP id ada2fe7eead31-7bf80c9bc8bmr1205468137.6.1790954499452;
        Fri, 02 Oct 2026 08:21:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7bb71asm808570e87.78.2026.10.02.08.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:21:37 -0700 (PDT)
Date: Fri, 2 Oct 2026 18:21:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Michal Simek <michal.simek@amd.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/5] ARM: dts: qcom: apq8064: Drop PCLK from static
 replicator
Message-ID: <z2bu73w3xcl4ofbp4td3rj7wazzoth5gq35obiqkrfhhfxufcq@hrfvij5jnb55>
References: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com>
 <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-5-c3edca1c480b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-5-c3edca1c480b@arm.com>
X-Proofpoint-GUID: AYyyzwZZGSxGWjdytZNyVendoaILO2Lx
X-Authority-Analysis: v=2.4 cv=ML/1C8Zl c=1 sm=1 tr=0 ts=6abfcc05 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=7CQSdrXTAAAA:8
 a=-Qp8ahHsIWLXR-OXa3kA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfXz1qtUNclgO1R
 K5reqtVsLDhHn6/pifLXHvKPEdaJJ35SeiQMsyG7k6Yt6nPkQUxkt7IItt2p4fOwaDLdj34O2pT
 T3goMt/S3ngINaE//FA5cxFuA6mQNNBD4vBh6C29V64lkqzSI8Mx8Cqf1NbMS0QV3DsxGWECnuR
 GTF1oKaoO6cOLbJIhywRSP5SA9EKmelxIh3UnIYbr6KAgiiIgB6gQCNKiVo9PiBa0vIpYOcf2ZO
 PIAkxSwOQTXqIeSpJnwjzKjJQD++Y738WtIR7bVFyR9JlX+6utrTM1pVryg79pXsaHhXY075oLj
 yhTdvW4StUbnKhSTe8+KRmPO4DAWriInqcCP4+1zrxTRK2RyYKMxbaEwjMs/e3rJGYykSHHNi4H
 MIy+0trjQX7kuuiQQVOoHHFlOk6O4EJgzen/EMa7BvupfthaP+i0Pf9R7WEPCEgDR9Ms4GjISDD
 JIFX3+WZrWb2Ixns9pg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfX3YLo3Ri9Jlc4
 uNGuo3LympP8EBtdRG7EQSyJUztceyreH3LCwYYV1RkZ+vohhkgXvY0we5P9mBxrD9RLgY0Vw5N
 /PnsQv2AvG+Aymd2bnTPM09u2xc4gLs=
X-Proofpoint-ORIG-GUID: AYyyzwZZGSxGWjdytZNyVendoaILO2Lx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_082142_586941_F4AED5BD 
X-CRM114-Status: GOOD (  20.36  )
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

On Fri, Oct 02, 2026 at 04:07:24PM +0100, Leo Yan wrote:
> The APQ8064 static replicator has no registers to program, so it
> does not need an APB clock. Remove its RPM_QDSS_CLK reference.
> Other programmable CoreSight devices keep their clock references.

QDSS clock is not actually the APB one, it's required for the coresight
(or to access some of the regs) if I remember correctly.

> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> index 09062b2ad8ba550c3c2ee5849c96fb68fa2dff4b..d3ae9b835b9f45ce0bf66c850006a6ab149a183e 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> @@ -281,9 +281,6 @@ scm {
>  	replicator {
>  		compatible = "arm,coresight-static-replicator";
>  
> -		clocks = <&rpmcc RPM_QDSS_CLK>;
> -		clock-names = "apb_pclk";
> -
>  		in-ports {
>  			port {
>  				replicator_in: endpoint {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

