Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9953C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 10:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPrv3G3rnxf4/ikhwHF4l9kt9tuml/Fqoiz4xRaUdbU=; b=Je0nYwdLhuSo0VZvjslLR1Jzfh
	FntfWhmcJqiKoTnKysFudxKK/NqbUG5i9lp8WHI8ly8C+LHounrQa3JsjXCDdXl6AHJtIVAEouhKj
	LQ0nO4w8BKQUGbXJBlOINwki9FQwGQ3k2Wb4rlBTFhXKKMt3vIrbSX+mjbFhs7rWFV8z26lRhQ7BN
	xvWqBJhaqvbl7g3JglKnnubjGzG7bCj4Be0m2hfUl9aHM398O6M6wpD0p4dRDHo3F7gwTjDSFBAsi
	MLHnLxoX+J8XaJBKEUOPuaIt3tvJadleOCx6YkEIA0cQb8CqTM+e1pX4xr+L+er4IShbA77JGD3ey
	dXDsy3lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCol-0000000G2Tc-0O19;
	Fri, 24 Jul 2026 10:07:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCoj-0000000G2T2-2t9v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 10:07:46 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O9T0Du3785878
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 10:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WPrv3G3rnxf4/ikhwHF4l9kt9tuml/Fqoiz4xRaUdbU=; b=Qxwx5qZ33jTNYz2n
	k3LvWD2Wa2/oWsyA43HXy4XgxT9FsajMV4F8UwOTRamNzo1McBc9Sy/MnkEAfkm8
	JvAr6RfZsDtkJHPCfda61MjPSGfeRStY09xBaw/czObWzGOYXeo6g3LaleU1JCUw
	Q6TUIyX3OReVBoDHCrVSb4YtGEJpuQ1Dsa6uYXc0AFsgMLZkkaVYlE/AYyC2gXY9
	clwt4ZYiU7DeZg+mWNrnMTBZRuBxC9pus0g5oS8oyZnkPORU5yhp6Yx1ABO7luOj
	0rtR+ys1K/1As8swtkSeL8DLEG3IiYfowI+MHMjwgyJKXBo2HyUa6ZCAUf76Ay3q
	2fPYxg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5f684tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 10:07:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb92868263so334718a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 03:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887664; x=1785492464; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WPrv3G3rnxf4/ikhwHF4l9kt9tuml/Fqoiz4xRaUdbU=;
        b=fXyEjTCEWHxx8/ITTdynto4xoAPA+dABpL5kTQtCeDKBYauebgJxeXjJhyPjp7kyv1
         XgHRSVfxJUR/7VR7xDu9MPMxnb92BZ377FP40/4jiLYX8TdecG15WBMts+1GShoUQjo4
         fqgA1wwtQQ4DLWOYJf81eVzYiZmf9H9+UGHzFjIuNGsLa8+NRmHAHQDoFC7My/ofTl13
         zmsWR9+Or/u0AWv1B3U3GSrFBecIipeY7liwsto18HlYzpfJ5nlxhNbxXW4ZM4km/AsU
         WiqQqfeEBJe4LWATCX6RfzcIMvyr0aNemAzNnA9R0Dv1pjRRfSCy1hRFpt3qWd1MeZN3
         8t0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887664; x=1785492464;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WPrv3G3rnxf4/ikhwHF4l9kt9tuml/Fqoiz4xRaUdbU=;
        b=VTJqH9AU1e4TuhipabQmo+cEbMeZSeBIdxpS8r5VFjGMKqGYjLXWa43PXwwUZ5qpSe
         9K6/cH4sdeayinD4/eEDvoVrkIT44lpU6yRWdAgWPUHGiOeHc1klAHOOomCAVMvxdXW7
         vkd2VcxlIuLxs9vq6zH8Xk5GHaNM2/9lc84g9i3o2VQa9H+m2DGrMl4VGS1LJyWsgsyx
         tfm0QCvl/ySJevxGwJf1vvRVMn6kzVEnOp1AlumGNeEmCsq75SifJD1n0ethEiXgLwB1
         SAnbJhhwQ8JZ3F6CBMnWfsYEeUVdCa9cakYADhXAZy69NFhj4bB9rcddPZxw/XTN1g7d
         6bhg==
X-Forwarded-Encrypted: i=1; AHgh+RqD+tfvHbjWv/hm9zr/Gc8Fy/Zw0zMA78pvmXOfVxx6EUh6eBiLfMnp+kFpwiSns9tzgl/EnPgu6UrH20li/2Xs@lists.infradead.org
X-Gm-Message-State: AOJu0YxLj2Q/uCYy+/cVMbPdwdIOgfFnTa9H+KB9yW5sLMfOBWP/kAr7
	zkHvCfnKNROiBs5jNLkmHHqLj5j6elqGp4U9SRrQ8ozp1/yvaI1+ADGqNof8oFs97mVAoZ8Y0AH
	/mHpiVQbDZqaxSKljnqFeVqBb3LyRNjyoaQCbbEN1whCN29lSr3zKdwfjjfCuW7i/Lqj/fCgKit
	yJfw==
X-Gm-Gg: AR+sD13IYGGD30pVaw1n23smSPrG6gNmy5ZY9hZ4kowXarwe1lAy+EFwfhrbQQpdL1m
	K5e443/N64cuhe2V0xnrAAXWRVjgB1p7LTqiDlMLIGWeUmZzXonITIDQq3Z7h2E42bJ52zwfQ5I
	DemmoPWQvMWcwjOtcA+5JgodIPT0OkSKQPsJI+ibyoh4a7cxAr3nIIz9t3QAwglLhNgmvfYAWFr
	2p1jyWEjDAGDr4yQSspf7RhRsealk04J4x8XmvU6Xzyid4JcMTVZrX9efpI4jzSPRkWXbRT0Dps
	9V1MwieZcvC+FGfhwriMeXeblGEJilHWcWA8K2kR6e4OzoG22Um6UOQD/+EdBHLVjEhPuSAU45N
	KEItgQM5qy7uLhNbR3ZOwZxJ3FJHkT6knAcrWAiE9MuDkNtp9NSeVFImXXDmybBZmEg==
X-Received: by 2002:a05:6a20:12c8:b0:3c3:875d:704d with SMTP id adf61e73a8af0-3c44b00802bmr7811674637.25.1784887663885;
        Fri, 24 Jul 2026 03:07:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:12c8:b0:3c3:875d:704d with SMTP id adf61e73a8af0-3c44b00802bmr7811635637.25.1784887663493;
        Fri, 24 Jul 2026 03:07:43 -0700 (PDT)
Received: from [10.133.33.207] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1c4c3asm3985530a12.31.2026.07.24.03.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 03:07:42 -0700 (PDT)
Message-ID: <875ac597-83a5-4fcc-9c45-fd6ea6de5d09@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 18:07:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: shikra: Add coresight nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260723-add-coresight-nodes-for-shikra-v5-0-fd5494471b36@oss.qualcomm.com>
 <20260723-add-coresight-nodes-for-shikra-v5-2-fd5494471b36@oss.qualcomm.com>
 <52a09911-a846-45c8-a9d9-bdc9371acce0@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <52a09911-a846-45c8-a9d9-bdc9371acce0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfX1S0V9Z5yXzVw
 5O/H1iXEFRyRiq3rceeA1CeSGrgxkI8KFYdGAdEaZ+C5HzgKzmXQERouP+uYnlfPNPAra1RHi9k
 cAXUrY/zABdnzWI17emEpAzfln+AbXY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfX9fd2Y/0SmwPa
 Bbnhx8ytHvIRrdE1+NSB/Xt2+HVbfAyiWWxqZRaj7k2zswZWsyqbj4VEDLNOZoVLsSBvAsw07kG
 /vpmU1Nfxj/R1Z0pSkqO2lfoz4/zivixuKSFjJOzbLB6by2RkLVlOaLHCnHh/HtMxPyf5HPWHRR
 11XfrQl/CCTBoFVAN5j/mZSw0HE71ExOIHRpCw2t87U6TOAhmma3ucEtMKczZyuOPTxleSBaZUO
 K4Mm9Q0BgE9OpE62ZnT7ks0SKuzMOsGQf9hupo4WWIxwRXO5Hg7773j4qtirV2UoZsibFz070I3
 iep2ytc0esn0Jf1tEz7cgV+cKKth5VaiE6X38Y7RgiestB/uMO2NG63eoVxSnCkxA4CUqjJunIf
 LI+jKzt65TaxNObp2lKOgvML7JH1KOYypUIqgcCjyJzxvZnb+1Q0Jes3MZp22CS5K56rGGOqaVm
 qw8ctxkMOKffNfia3YQ==
X-Proofpoint-GUID: R1bEJzoGaEAlB9iXzSsqKF7M7YXaXLqX
X-Authority-Analysis: v=2.4 cv=BNeDalQG c=1 sm=1 tr=0 ts=6a633970 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=DtxiUo3CK3xeHLiv9V8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: R1bEJzoGaEAlB9iXzSsqKF7M7YXaXLqX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_030745_739157_93CA7B91 
X-CRM114-Status: GOOD (  12.67  )
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



On 7/24/2026 4:18 PM, Konrad Dybcio wrote:
> On 7/23/26 10:26 AM, Jie Gan wrote:
>> Add DT nodes for the CoreSight debug and trace subsystem on Qualcomm
>> Shikra SoC.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +	modem-etm0 {
> 
> I think it'd be better to keep all ETMs 'etm'-prefixed to group
> them together
> 

Will try this proposal.

Thanks,
Jie

> Otherwise
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad


