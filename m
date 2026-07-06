Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A87EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 17:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZzheGRlsfoWHphf+vMzevybnf7yYRErojFNsdmSejg=; b=U2YUGShq+r2sNn00ZM7DLn3rYZ
	eL+fb8O/QhGWGonFv1vrjUzdcKbCt6y1IhC1Oyx5AIiN687npLCRn3y/Cp8lWx6Vk9dwEIF4DnFp2
	0qs+Iw2i9a7bsvM2NZGJFzfRyoYl5XTXeroZZso37WuZa1QywU6OI4eu4WnIQq3zVsY4zP04+oHr9
	1cl/bbc5KUz7CSTc1Q/hpBcmGMsXkQ6IyZv+8uk4sejSnKTUTEXoauc62uUnE2dWHx3NgYdrb6qHr
	aMD3d/P9dW6qtrhmQDtkVadv2Uz5PBf1vqtBrXIrIuF78bA+s79et68keztMAQuG9uxLZyP1VLkDc
	s7FIVcRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnKw-0000000DEQ6-3R89;
	Mon, 06 Jul 2026 17:42:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnKu-0000000DEPh-3Pag
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 17:42:30 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF66T982432
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 17:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wZzheGRlsfoWHphf+vMzevyb
	nf7yYRErojFNsdmSejg=; b=PWSQ74ISsra20N0G3LSYA3WMfBSwhAUFaTIdS6Kd
	s7b7U4sT9uJgx/4zLi6Gh+/pDZeAlEpdi8DxP/0Ag/rvG0QAxqFyNzgsvelXXUBl
	KacXcsVNei7i3mZ6PMzcDyCT07PKfl88Y6vHgIOfT/pglQWDqqXV47vP/g/g+8o1
	zGDFxFHVSMPFDOLslQH3DFqD7tD1BvBUnb4MW99E3JRC1Zct9fOgJjhHyO2w0R8p
	4MeC/MfzDfQwCCL+q2dINDgbKX4SfVA3/SPer2vel1P2vzpK3x87pmADDeL9go/l
	oAyLS3PI/H5ImY8q7BmgOQeEOf83kFzBZ0jvrfhTRcPBLg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qpj7xu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 17:42:27 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bd797e447cso4581583e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783359747; x=1783964547; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wZzheGRlsfoWHphf+vMzevybnf7yYRErojFNsdmSejg=;
        b=LD3864nSsJjWrKPS82fGcJBnGVhGMrBT1I62Zb972bCvdh2lzXT1+k3S4sLs/neMRN
         hbL5Gyiy9AmwvSFitnx/5H4t+N8Epr9rkhwDuaL228OctBjnjzFrmcfPeBEAkl5SlqgD
         cqV3DEBDU7tBbYjR+K8FVhTV1F/NHm+LvJuPPivbpU5BvyilHq2rHmdHkE2VqlBUaGcv
         L+M9HxCppyIAUmz8krbnHuEI3+q88Z9HxwtQsPqD7+Q+qTlftryxvsEz41P5LTX/1b1/
         G64THWlRPBIrhyG+5OakLRqYYO8KOjmizxR4ujL6iROyCClhn2DaMJ/2W9mzv00IgpDQ
         TgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783359747; x=1783964547;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wZzheGRlsfoWHphf+vMzevybnf7yYRErojFNsdmSejg=;
        b=hi8fPbLK1GSyc97OeeWFW87xGO0DjOr1a0a5xguzPL7dZR7JZ7T4yUstpE9Ye6licc
         2C9QvPn0exDguhlTT/16+v4g/mzHSfRL5Ou3huOyJJDz9dSsM3B1gHSK9Jt+AcusPb/z
         pKQntAGFqeJVW4bVbTTppx5x+2YAFUSjg8N1qTXIgesrSBgg0qFlZcJx5LIdg5N3uSef
         /XiZslhH6gc6rFHLmWeBePi8EffZDY83OGyLuNfDo0ZHf15P9L7Og3y/hOxWoT1mYuYY
         ozoRH5xE4MWEoqRKegOsHfk8ZE1y9hHo5PS+kiLrZ6sz00zVV9+Mir0I40xuyq84MYvp
         pw5g==
X-Forwarded-Encrypted: i=1; AHgh+Rp+f10/SeTSBk5r4oRka5V0YdFRzbS/Q9gO0YPK01Q3ZWLDarihgzVy2k7shug7AC2UdoH1/nKtHltjl0zaK6ie@lists.infradead.org
X-Gm-Message-State: AOJu0YzI8JI6GttsRXs/nexucRyICG0+kUJMgxhrQUyoK1bKtythqL+9
	yA+ObgzHXf31LPawbES1oy+HmmbUkrRwExHN7n8pXvptW8/aCnYiWu7s/bWY+ust/Wh2Fp9UOvt
	1Xj37c2nbZ0n3c0PaxG/fB4zB4EapjEc+Tb5XofZKa0w5QFarrW7s/l2qx9qYuDqxMMSHrxkgFq
	nTdQ==
X-Gm-Gg: AfdE7cm6Dko04OG90LCEh5cNbfFU/qIJYopL8zPahiK0Hi7S3v6ioQwNypYYKXYI97G
	mCrEnD8E3EbxCueBg18WQZKQfyUtYlZSH1nsiQnO6pucGmV6sWXv0pM7BnuWBG7fLpgo16zrB/H
	UDeBHUM4aS5O1AsjEyCuwBD/LAS2swM7ZyB19bu/2FDmEhxriaX9Q8gVQtHrtKbv611MbU3rEr4
	o/wiO66DwqnMfnZXE858Jjhze5waLLb+awqNbjgWYVV/2BijWWL3vbHvvDHHQOs5j5fA4XjMKUs
	5wLYsfAgtwFIBl4ukS6T/vZDeXT0hEpYkAs4FWXES1axSbqzohn8L6y8beUEZ2CwMVD/l+OM3SD
	m8Cig2Tv/6k/+1kldY6PBmGejtBfQjVO/CfgjEa4M5Gj4B7UAu1uqa2PkWADwY0j9sbKAucKsMt
	yVNsfWl37Rf8R6tF1ZULh/gUGZ
X-Received: by 2002:a05:6122:32c4:b0:59e:feb7:8a5b with SMTP id 71dfb90a1353d-5be8953a62fmr939547e0c.0.1783359747087;
        Mon, 06 Jul 2026 10:42:27 -0700 (PDT)
X-Received: by 2002:a05:6122:32c4:b0:59e:feb7:8a5b with SMTP id 71dfb90a1353d-5be8953a62fmr939531e0c.0.1783359746659;
        Mon, 06 Jul 2026 10:42:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c8c1asm3007595e87.81.2026.07.06.10.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:42:24 -0700 (PDT)
Date: Mon, 6 Jul 2026 20:42:22 +0300
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
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <h6opbtr2ced3sannj3ym573qc2sjk7ek3clpto5j5mtqfrfk6w@34sk2zraoqtj>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-3-afdca0125a65@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-smmu_interconnect_addition-v3-3-afdca0125a65@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4be903 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=LVq_GggcSHk3DsAf1gkA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: KDQXUsJEU3YS7SVW-gTSmUcpdbS6S8Nc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3OCBTYWx0ZWRfX24/jjuDCfa+F
 0SUxJoP0tfpnQ9vaot9mTINeTMIC0LMeHTUVrs7z+m+ciuceNFg8SdoSLmAqDHBJYQ9YBtoaUS3
 dzTfDM12mK1ioe4N5VrMYOny8Rq6qtWC16hw4Anjz0wv0L9A4rL1pUDdbgtMFCtrIcRNGzvFFQQ
 G64C5txGJpdiBfdCsfDT8SuuQfUd84Au5/BvgMGk+J4fyfSxFOCcHImXINskZTc63vX5hKAyB61
 UxaRrNoHEP85BDGteeirB9JxpgfKB2LW8pWQVDGigCu+NW8bhZQ3qOdKIiIjwCjcilZ8DBHr720
 qT7xVEj916NJbl8kP4qy/2mv3YsOdvd1q7QO9idf3lTyqQGNq6MTVw3PVUrhdC+4mPp+8Ecq+fF
 9LRc3+QXKU/HIZ4PH4uQkmak8fzpwnJYY0NPuPjl3i6J+4J3WMqq6IVdCMLaXgM0gyjNrtPNVn1
 UnFlAzOyin2qDVy5e+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3OCBTYWx0ZWRfX7XXYQ4jORGtj
 H9sD/m56AuFuE2u2ogGkvLIR8ftAFokqPSAqjCIKZn3QosztYT5+KE70RsG7SFdx9qc5ZJ8jVIw
 Xk6zF6r+Wqasc1amOHBuBp2okbYnOaQ=
X-Proofpoint-GUID: KDQXUsJEU3YS7SVW-gTSmUcpdbS6S8Nc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_104228_990314_40237B9A 
X-CRM114-Status: GOOD (  20.03  )
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

On Mon, Jul 06, 2026 at 10:26:36PM +0530, Bibek Kumar Patro wrote:
> On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
> are accessible. Without this vote, the SMMU may become unreachable,
> leading to intermittent probe failures and runtime issues.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 90e50c245c0c..721526f023dd 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -3389,6 +3389,8 @@ adreno_smmu: iommu@3da0000 {
>  
>  			power-domains = <&gpucc GPU_CC_CX_GDSC>;
>  			dma-coherent;
> +			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;

Why is it ALWAYS? Would it be better to declare it as ACTIVE_ONLY and
then drop the extra suspend/resume play?

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

