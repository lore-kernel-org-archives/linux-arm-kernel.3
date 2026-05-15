Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC16ACD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 15:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yBktAiJ2n07zR7RbDMF1ANnkKUO8hFQpm7YthU0eIUU=; b=P/U3MiYshEXGln49IlpXHzsQn/
	7Sx+giz5MgxVSDQ6krpj/obkpLVchQa03oy8x/2pzVzUnYGYdlNI9bOU2AoOBz4YtaVXa5WL4OF0K
	IwyGS/E1FFYDH28EuiyIgb2JPz/2BVCkYjJavIteIW4bOrujPFS/Up7aZbfiM0yPzuIBMgpUj6ejL
	FqevQA9Kgp9ap8fsMWdKfEp25jnNFUcEw8AmQ+WAzqgWI0Ba9k7SnxmFi2I6KFB08AT4rLvzFc/kW
	IDbPht9tSbjFv91+YTcH+Y3uqRcnxVwppeqGYfDFZmcv5OKVYGtWROvkBLr5sT2uZYbsxK7qBB0gW
	AS8tWqLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuSu-00000008hPX-3SK0;
	Fri, 15 May 2026 15:28:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuSs-00000008hP6-3dnX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 15:28:40 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F9HdqY1714936
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 15:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yBktAiJ2n07zR7RbDMF1ANnkKUO8hFQpm7YthU0eIUU=; b=c9kRNYmBGZKoL+XI
	isAGNqehczL0RMyfEb4Tbcj4gpmN4O94rcKAM2rtC3bbCccsaQcouXz6PNzKyvVh
	BsUvQRgAFkzsk4P6mtENc0OmiHELEiN57g65kaIRBvWw4IHHpvOhRd7aTcdfvCo+
	Ot2TLDbZQwB9GKp/Ha5TWY2QnWvYo7MGJ/BO3A0MqzeUgEGOKjba6CJkMFaf43HG
	7BTGQJm54l707h6oYErYK/j4yY6FlWGLNQJ8OsafxWWPMrXvuHVQ/k+4JrYP3GXk
	kb9LcgMtKpay9aGTiKxHjUtppk92NEX5ayohUTTgEWQ/DeSZWCr2FbpZDdGMZ8ti
	BCAAag==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5tyxtk61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 15:28:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4530a90fdso213086595ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 08:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778858917; x=1779463717; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yBktAiJ2n07zR7RbDMF1ANnkKUO8hFQpm7YthU0eIUU=;
        b=MBEvBww0MQ2Ib86BoYS+uvzlTuJTg9TFz5D5xXFHE3z04Q+jhbwVu725j5X/IeSlrO
         95D/uv8l6ZbpPGiwaTMDyrPbURfxl/rZEyIzVYexFEll4QteSxS4PzPLcsd8DXAAtqjN
         WVEzkkkh2ee1EbvonnZXg+XH/YhFPg4UtGk9WP3LfukbR1RkHtnVTBnc/whAVRgL+Yc/
         3yScQipRCa7pgSXK5qVmmc/lFSCLpEwGHKMwSCTytEZptL9LH/lKe16S7xzH5u5up/IL
         DdX+iCQ3kP8GfyqO3uyOUqjMnIYlxRbHEbzobNpIobDazeCynDnpftK38vHu9CHLz9fq
         aqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778858917; x=1779463717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yBktAiJ2n07zR7RbDMF1ANnkKUO8hFQpm7YthU0eIUU=;
        b=dY7EJ3GZ+SB93oqYWshv2kt6T5w8sY1fB+KBF6iZeYBkB76Jsgi27Y9ryWjfCz4EbD
         egeio5r+CLSQ1Uy38htICuIMketounrUYQZHLQ78cokrV7oUmmkeah8tekReutFf2v1z
         inO6ti8P5v1DGHBeC6MMhYldymcI87eA+RrnFmUy2VqYr+cDvPu6AjTs2sX/SKhEfhpw
         jzRLlnMKKCWibNKDdcQF4BSvnp/tRYWLAVkCBfhoQg5jCQjsR2eaZU6GvdDfVGS+wDrL
         DO67aV78n8n0qgd3EeSbZeKiijGWZD3/itjgBZIGseei87J6fzgxKLgjUG76lpf7awRw
         q7Fg==
X-Gm-Message-State: AOJu0YwOhYokZMETThis4MrCXqE2H2qLYAlCorNcur02F87vTaiG8EdP
	++V2cLRwAZ8SNN5erWtbhD9Qyd0oJ637654XIpBzDiZPdkmFbd9GK3tLkr66NcX2iVR1ywL9JQK
	YrEPJcfa3M//eoN2/d2hY8LHIC4H9g1L/3E6IpqKlp5IClXLFr3Pf4TC/dXVPJyzNGKJiqv5X9H
	U6OQ==
X-Gm-Gg: Acq92OHzimi/OF7V3xEKmHpQC/+rsZRpDYdEGyR4Fm/68/9PhqatXrHVCOZQhGzPgfE
	F+dYv426+t36nGj2Jm6dJOhPH6VbQBwXrhM4xPk9/7vcVTr8Awv7sVmJj0Srwkx2Y6ZrN9OS6CY
	8MSimALHFwSLwygF+ay/6mzcKWg8v1Gdt7x9ztkw/VEJ+FpiyaG+FfaUQzxW0qhpldUJ2+8WeEq
	mUIk8FWN/MkayieDP6WfxjVeG8tLdGVngH2J+9UJV42JnibvlCpaOIjn9qzCl2wzNflc098DJVc
	B9OsqvpWuCSbxeZl13UU4f6S3cRBfU4lpE2Aya3FtH5xatDbAfI7nD40qgYduVsRS22r7LEzknB
	96ohaZoZv0juS/v8ssfdmXLfsFO1S9uiHIvYh7N5qzkFma+93ow6enO0woyGZa0hudjSaxBIOor
	z3Kg==
X-Received: by 2002:a05:6a20:2454:b0:3a3:addc:8f47 with SMTP id adf61e73a8af0-3b22ec64553mr5222456637.42.1778858917409;
        Fri, 15 May 2026 08:28:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:2454:b0:3a3:addc:8f47 with SMTP id adf61e73a8af0-3b22ec64553mr5222414637.42.1778858916923;
        Fri, 15 May 2026 08:28:36 -0700 (PDT)
Received: from [192.168.1.10] ([122.164.84.236])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb123986sm6209094a12.32.2026.05.15.08.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 08:28:36 -0700 (PDT)
Message-ID: <cb78b09f-e3b9-40b7-84a5-8f9217f4fa6f@oss.qualcomm.com>
Date: Fri, 15 May 2026 20:58:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm-smmu: qcom: Add compatible for IPQ9650
 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260512-ipq9650_smmu_binding-v1-1-04defdaa140c@oss.qualcomm.com>
 <b8f02a31-b175-4dc2-9b2a-5765774b4d88@oss.qualcomm.com>
 <39588541-b6f8-4697-9787-4b42df21156b@kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <39588541-b6f8-4697-9787-4b42df21156b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dMWWXuZb c=1 sm=1 tr=0 ts=6a073ba6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=pcck7Iv2+kD8UxzcD71x3w==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=skYpixVSqG8Zg7K71KQA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: UFGmNGLift5ZQnftjE6sR5TxahakiGZA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE1NyBTYWx0ZWRfX8gAstCpHeaGK
 +fS1BNPtFi1kwPv8OnPCR/tLMCpTmmTRwhvjM3Sbm6+WfLFYdzJCTBePf5q0mrBM5kWV0yvo71s
 u6/F6tFZpGBDof+iwF8IPClfxC04oq8+is1Mlori4pH+dbsOp+PUI91g8vbwwA6oU3sT9icprcs
 a/MolVgMRcWNK1ea1rHDFTM7AnA4Ee5HmEz1fNJcvsZlg2q5ig7Sa3KCE7VyNYJ+zl2cHGUsgTe
 HM3mlDgeIZwnPEXCU/LEbeoAtCOus8Ocgzade5vh7ZIVmbW9W+Gwq8QnAGiYKvbZsM/l8azSWTU
 HaPL0pySt7oVMXx6bmHuWANOyaheOOk7JQiGJBSc2M9cXxGh4FNXVdKUhy17c9NqhI5tylzvGEd
 1aKwPU5DFhi7T+P+jPtDQ/uwtaJsWQwqLS9wnEGXjLDKkv4jYub13wdU4x6cCghVRdOearrMlFp
 XFSy0ro7CydR4fmGo2g==
X-Proofpoint-GUID: UFGmNGLift5ZQnftjE6sR5TxahakiGZA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_082838_922941_B56934E8 
X-CRM114-Status: GOOD (  15.49  )
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


On 5/15/2026 8:46 PM, Krzysztof Kozlowski wrote:
> On 15/05/2026 15:30, Kathiravan Thirumoorthy wrote:
>> On 5/12/2026 12:17 PM, Kathiravan Thirumoorthy wrote:
>>> Qualcomm IPQ9650 SoC include APPS SMMU that implements arm,mmu-500.
>>> Document the compatible for the same.
>> Kindly ignore this patch. I will repost along with DTSI changes once it
>> is validated again!
> Preemptively, I dropped all your patches from Patchwork based on earlier
> comments. Now I have proof that I should be doing that for future as
> well. :/

I understand your frustration. Apologies for that. Please note that, I 
have validated all the changes before posting.

In this case, when I was cross checking the HW doc for some other 
details and I noticed that SMMU interrupts are changed and HW folks 
haven't notified us. Hence I wanted to re-validate the change and post 
it. I don't want to change the binding (if any such case arises), hence 
requested to drop this patch. Hope this helps.

>
> Best regards,
> Krzysztof

