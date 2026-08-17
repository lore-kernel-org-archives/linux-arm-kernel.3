Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D50AC5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 11:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IGcPbfwzVeaXPPONPxtiLfIGqQcm259ZEgiBE509QLw=; b=wFz6IFHrTGo3aXr2Te5XKCnRNL
	Zo2x6NlloKS0/EMzaagrdB4sHkAUWEz+dKgopWZtVr7Rzi86abvI4eNGYR/HIVH7O3dODQfryQQ6X
	fjQxCBZFYgTls5tdwFpHDYDSJYGvZathZ5cxV6QO5PcXfXDNDNLRov+VcyfrKzHxFSSEhfFFY9zo9
	TqpJ/AsQS2Tjo+sbYy+6pn7L92fhUqP3zR/MWk4uGRcNTZoXvjBXvUmmd2WZE0+EPn93kNoVaTGUg
	cglCNclFYe4e+tyL5W2/+f5hmNH8JG0whSVsYT0OffLYA0UIzgAvKhcFW/+JKKVNQwdeYZYQe4MGx
	0Ebc7hdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvvi1-000000064PJ-1ADy;
	Mon, 17 Aug 2026 11:40:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvvhz-000000064Oq-0HF2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 11:40:52 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H9dmUD1542865
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 11:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGcPbfwzVeaXPPONPxtiLfIGqQcm259ZEgiBE509QLw=; b=N2dM5QvhPUnc1rIt
	ZtMx3Hnd/cTSmFUgHQirwStzDGxxb9fg/Rx4pPgYjXRoszWu6NEo1+ZEdaOl1Oe4
	9h4Q9PELZPOALSzhjViddoyVje1I9U6FMNIbMFG4PCxTkFCsIsc+5C0lkm2ty8V8
	8oemZfMjZAMxe2YRnB0IsPpDPfRahl5MV781bcAIR77yeabKcTugEuRULhLSnaGg
	1AMj66nIDMumJRt+OTo16D41F3zlPUw1EkxLGBmAdcinA1V4RO7N6ii4p/Hej5Rd
	9YYtTm+QBVEGiczZzFvozw5snYnGLPF3iOg9r62dlntyv7DVAvUGD80HCm8Qe6zs
	lhGtyg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xw8gpu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 11:40:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52b4e315000so12416061cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 04:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786966849; x=1787571649; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IGcPbfwzVeaXPPONPxtiLfIGqQcm259ZEgiBE509QLw=;
        b=KZNnXN+9CWs+Acm2rCrU4Yu+PLZslayyefNMPawBkNj8AR/4+XV/gO+f8b2HmDd7n2
         xj7vx4bXilQfV8XgISZzkxZQJIYO3iPSypuPeGLQ059GXsCJPX8taSbSHUf+BT4RT3KZ
         QmpMIHVcqVZXS9Ich7TQSTB2eFcgkAcRDJaHHTz2NKarPLow4Z2utP962Tm2gBuODLpV
         BQjjPY1G0+DfoBHyv7M8FAfhKKpXcSBiZhDFsU24LQk3GspMJMUfP3qyKOptGNasZ885
         7sFraVXT1PJfWf7WfMUtmlTxSHLgllvkev1cL9cPGPcXDab6UCHBGPdscovXpAesf8gD
         ZOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786966849; x=1787571649;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGcPbfwzVeaXPPONPxtiLfIGqQcm259ZEgiBE509QLw=;
        b=Lx6hqWGV6Cmrfo+rpKfrMprk/ByPIFJ/0du88UUacsl1jXc3j2XSQ8lIPSxuQmrXWQ
         H+4YYzyuewP7nDeaf8Yc2D3y4isSJiVcIes7TqP4Qi89+1Pw5a3qt/YiyNbJ9LrYWv+5
         Kdia8wbnJZysOrpln+HQWz83ODS6j1a6qGI2tUVX4//oE7CiJpyh5FDD7NxYSKtoHnX+
         /75boPpuSDVbh3/BXWJYizbdvlzg4DmQg7BbExmXF6t9u40fP5LwqyJ8ShXiyqPPG/Ui
         ke5s2J1nXp8CfgXK9g/B5ATID4+GQQxWLivl5st6cUz99x2NuwMnrgf9U4CgmcZ5vmdq
         6cFQ==
X-Forwarded-Encrypted: i=1; AHgh+RrDtmoingTUPfZooLP8G3e9MQfCa3uR4pmdMfNenDQPBNU2tLt4eoBt0XuNyN7znHsMsoU1n5Z9YSuNj8LHESqi@lists.infradead.org
X-Gm-Message-State: AOJu0YwCv8wo/sWrbC4UKy/PpQmJaX1VmVh6sNgyU/fPrrMgnMLdcJ4+
	BFOh8SYQW8daRUtb271Pf6HCt8V2y/ENG2g10HA4kjM7McSeKVa0GvuxqL5zKub+Bn0pobj6nr9
	B95JwM4opS+iJ5nM5Mnm2g5lCl6mlaI1FQm4UY6dvvqL7ZL+9PEaKslG5SmYddujxYzJATsukMC
	QAFg==
X-Gm-Gg: AR+sD10xx7U/mCHtFDRrM5ONlq93V70awISD1Ss+mhbi5qXOzirM9vN78Ht978lq5VJ
	tKhez+uogdz4V8v0htnqFlKlvQu9Ehu/uxoH5u3kablFI2V7+YvuA6MjYiMgp0Xc00eHnt7NoAM
	uBfrjy84RbJoPDDBKM7Y3qZuc1u3Bg8hPCLtAYoNYw6OxWl2MWd9QZdUJKWG9BrysmqiAkzZQJq
	1fTNurb/o8/TuEoFZWgbRMVpekL7jRNjSe5knqDiG8q0t48hoLq8yDNC5h+CqhNNMEP32KxFhf+
	trAN3qHx+fwcYZqHdxN/nnCest/IuPK372i/YSCaLrkSu/RhLNbXOURIGh0/6Yz2NVgAsX6dkdP
	3yqTT+s9YZHd2CG4NJ71Wvuiw
X-Received: by 2002:a05:622a:118f:b0:528:1ea6:eaee with SMTP id d75a77b69052e-52d852b4f2bmr165577471cf.1.1786966849229;
        Mon, 17 Aug 2026 04:40:49 -0700 (PDT)
X-Received: by 2002:a05:622a:118f:b0:528:1ea6:eaee with SMTP id d75a77b69052e-52d852b4f2bmr165577101cf.1.1786966848755;
        Mon, 17 Aug 2026 04:40:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8588499sm543504a12.14.2026.08.17.04.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 04:40:47 -0700 (PDT)
Message-ID: <08bc7c0c-4e15-4e76-8ed0-34dbee36a6ce@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 13:40:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] iommu: qcom_iommu: support non-TZ-managed instances
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
 <20260809-msm8974-iommu-upstream-v1-6-87f5cd492560@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-6-87f5cd492560@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QdyCY--QNDB2Rbmcoy2FNQE4D2Rt0b9x
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA4NyBTYWx0ZWRfX73TmoxisJOvi
 Vrj40qTThl6KRtzV9lwBOPJiMM579Pu6LMX9zwgXIuoJomvXZz5E6tmgt/VjpSKDKUReWBlBECS
 EROzhKUewbUSeH6QGH2cBaOmWRINjC8=
X-Authority-Analysis: v=2.4 cv=SuCgLvO0 c=1 sm=1 tr=0 ts=6a82f341 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=DBckZHbuUVvodCrkklsA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: QdyCY--QNDB2Rbmcoy2FNQE4D2Rt0b9x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA4NyBTYWx0ZWRfX6yblzSj7s7rM
 OUqCF+eg/I6801REkVRTRzKbzeD32P3AutIAnuif0kLILFoCd4M1ykUhU/ytCsN4oowLrnJjXOY
 FRAt03H8FcJYejthZHL52bEuqTUIfqk3QIUGww++8ChxJOcXEnau5cBGEFrR5aPLADP0Pte3sc0
 4pgyhwYpTpC7JCB+42xoL7f+j5zkxjtdrrsKwVTDeuZ56Y4wDV8Aw9IEvkUE3Nzc6bSju+Pi8As
 1bhlSCEp2bkyRb71dqymponjIr5BQ5FnokEKhJcnPwoF0vURZpqPobg1aVCBQDW/T8JSja/jsG2
 gz51h7Fmmd9eMdTvqdp9YMdtdnT4g+hIRnntQ758vP+jrmCgpF5b8dCSqpi8xDaQjZK8fyiITes
 DML3xalPh1uPbbWB17YrMKLiXOxkZyGZ1QxSbutSrO+msZnB0EDfc3F+yVccU3b3+Q/HXL/mn5q
 MZS7x3l5gsqPEE3OoYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_044051_224883_77A45D1F 
X-CRM114-Status: GOOD (  17.50  )
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

On 8/9/26 10:15 PM, Dmitry Baryshkov wrote:
> The GPU on MSM8974 has never been usable upstream because its IOMMU
> cannot be driven: unlike the MSM8916-style instances this driver
> supports, where the secure world owns the SMMU global register space
> and the OS programs just the context banks after a restore_sec_cfg SCM
> call, the MSM8974 GPU IOMMU is not managed by TZ at all. Nobody sets
> up its stream mapping, so attaching a domain leaves every transaction
> unmatched and the GPU faults on its first memory access. Verified on
> the APQ8074 dragonboard: restore_sec_cfg is only accepted for the
> secured instances, while the GPU instance exposes its ID registers to
> the OS (IDR0 0x78034404 / IDR1 0x10000003).
> 
> Add a non-secure programming mode, derived from the downstream
> msm_iommu-v1.c driver. When qcom,iommu-secure-id is absent, reset and
> program the global space at runtime resume instead of calling into TZ:
> clear sACR/sCR2 and the global fault state, invalidate the TLB and all
> SMRs, install the per-instance stream mapping (SMR/S2CR/CBAR, with the
> downstream MEMATTR/NSCFG/VMID/IRPTNDX values) and enable the SMMU with
> fault reporting enabled and stalling disabled (sCR0.STALLD, matching
> the downstream terminate model). The stream ID map is per-instance
> configuration data since it is not discoverable from the hardware; the
> SMR index allocation keeps ASID == context bank index, which this
> hardware requires (downstream msm-3.10 commit 4d92ea10aac3 ("iommu:
> msm: Use CB index as ASID")). Also set CB_ACTLR to redirect cacheable
> requests to the L2 slave port, as the downstream driver does for every
> context on this IP generation - on MSM8916 TZ owns CB_ACTLR, so the
> driver never needed to touch it before.

At this point, would it make more sense to retrofit this atop
arm-smmu-qcom.c given all of the differences vs 8916?

Konrad

