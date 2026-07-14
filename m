Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E69C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 05:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tuDO+eNFRlMdfIF0TORhgX34sio0UiStdpTpC0W/twk=; b=N2JLeBPVkBof1nTUc7CaXcawDB
	W8YQXrScHH5YabxMc2LS4S1V1lxrqmTwiNI6M3DB2nlTt71+qtGDA+rICeuR9D4c3lO3WpIxSOqAJ
	LFql8KdfT/QDIxKOZWmE9MvTRD8efeU5dqBLL85ckC9kH8f2MWbaVhdRC7Whsq67buuCwKO0x8hHn
	fsd2IIfaTskhgabm6wcl3hjALoOBVSADyXzrKQGyLvPQjjCEJVZ+pBBX3e5+SRd2O+7oFfjD08u+Z
	Hqm3CGhvrIARfEMbyNP4bcBm0rjzyvsw9fWIqq0l2PNOJ3sOV/ph5cz0Hc9JiVMm0xmXMwkXnuyaf
	LE+DHdrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVwL-0000000Aye9-18jQ;
	Tue, 14 Jul 2026 05:44:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVwI-0000000Aydp-4C7s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 05:44:20 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38PoV3303131
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 05:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tuDO+eNFRlMdfIF0TORhgX34sio0UiStdpTpC0W/twk=; b=ioGx4hvNncdMvSi7
	3BpVUZVRxDmhvwliggnB32j975h/OnSD+D09qjmZVJK1148sEmW05hFiN0WugE/Y
	cuFICPSj3Y4MZTdPLSOWXO1FuVUE+XZV6H4hjzjUHZNdBHjhWGYXfAmrt2VmB2ab
	raKj2mvQ5IrTTokJOx6apLpgh1rpzqqbyI3ej/rUbvUpH/cs/Y+ob1b6w5GK+yY4
	3SKJ9esCaHwTTxFa6sI+vWQOkqhZZUesDu8hw3WpuR8NXxYwNFLSdCYReB0+BKiB
	VE1ktKhLmP+ytncuXvutoKNs+ULH3ZU9IWOwmuRp+lEdFsfRtUkaGljOSY2OvGiJ
	OS5Pdw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p241b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 05:44:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc73f47bdcso68597355ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 22:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784007857; x=1784612657; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tuDO+eNFRlMdfIF0TORhgX34sio0UiStdpTpC0W/twk=;
        b=KnGbnjLhyOhqRh+BUiJRkarJa/qFf/uM1dowbIPKPkV67tKeLSjffoAdwUMj1UrAj/
         fn00ZlI6U2+jDLcNs08yHiBPyrk02l3o347/OxPhllh0ouqyg/2aLG17FjkfOlfyWLdX
         OSjZgsp+sbwSnPj+TX9bHnyY1QFwFloMA3ZfBFCTFhD9fkgtQJBEF/pQI6R0sSS8Ku/I
         Fu1E97NTiBQoXfFemNPcQFL7Uhmf5JGE2aW8yKvTBCk0T8jfTV86yav/oi+OUqMuVNTB
         iPP8CEbxB/+IE/M10RIiyOjeyYdCEV8/zMW2aOlALUGk03chzj7pPT4bVg3PHx2AFviO
         L5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784007857; x=1784612657;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tuDO+eNFRlMdfIF0TORhgX34sio0UiStdpTpC0W/twk=;
        b=fL8LqC58GWwL87QKw0TLDRWBQprhiziWT1sa79hrDK9zVfaPALsyNWO/N3YdyJbJje
         QyrjURcR28NguTUVcjFx7S1A3Qjpxm5U3r2/U6beDgJX7NbWQlV17r2OapZDhXHxdsSX
         tS24PNwt+T3zBv9vVgDgExG3ztg72d7r3PnkwBHqpJz6X5k++TT3hUmlJskLA9ybb6Lf
         NBgn6fc7HajQl0oMcM7hP4icvZLJ17pGoU7EOEb9pkbJtko0/oKtqS13l5uUqR/uAV+f
         1L05StMM/MYKnRYVC7iVUEpVnII2Wy77GX8MIb+B5Lzd2NFtItHMmRevzRPHFo41UGGt
         Mr2w==
X-Forwarded-Encrypted: i=1; AHgh+Rp+w43CZt1S42Nk4/tcYiMuCqJ+h97pABh2auq/vrVZO6M3Ek4ioBF1rhaqnOv3WENo9zm/24kxwuBmbg2Ai4hf@lists.infradead.org
X-Gm-Message-State: AOJu0YwDEa7UoDEizTh1zRMSJ0g9bUWPN/wc4dpKuWM4ixqZKBkSEUTz
	lbAWQ02xZx/GA6eHdxI2rWzsKmdq2T4jJ4/v6fywvPvEYiTD6YQPODwRWtypFbrAdf0/BSFZXST
	SwL6IH4hh9eKGT9SOvwhkanfmmty9Y0/THoWavs7PGi6OTNpcfEu5Jk6yi7XGPyEDnxa7J4YX4Z
	oUWg==
X-Gm-Gg: AfdE7cnI2Pf5Zl14dAqsG7LFyuHl93hBdRfvBFm9QROuL4jSItu/h3nFHczS3T1k6MO
	p7Gt9XZ+AfVS3cC7xx3Sq4XzK9HKx6506nKqD/Y6B7rz9MjmPSb7cebGXvfklJd6wKFSsJUzO/T
	Nzz/QwAP6lH5cAOiDeKfTDN8XoEH6eYt99g0qolms2XaOTWvKeRrs9PHPr5QcRba4KNbc8pEvXq
	riqjEa6SJyy8NEbuN+Bm49g/EZ2aEqmLzq94Ke43XvRJIkXAB9NMvFgkc42cNXOs3tR4hCjIDpF
	nNP8geCFOF3dewxUKHYfx5HhRH/cHz01Rrh+vHhgRb1hY3rIiluWmyJYNfDjkBT6hieS2IgXMTO
	F12XhFQC7LgBUgZy+tGmcZH4s/+vOB1M78Qiyxq/b+UMu3gHfSkE5ezekSydHh6Jsa2liTU5XaI
	LgmTOy
X-Received: by 2002:a17:903:380f:b0:2c9:c18f:7446 with SMTP id d9443c01a7336-2cef143b0aemr11672715ad.27.1784007857057;
        Mon, 13 Jul 2026 22:44:17 -0700 (PDT)
X-Received: by 2002:a17:903:380f:b0:2c9:c18f:7446 with SMTP id d9443c01a7336-2cef143b0aemr11672275ad.27.1784007856591;
        Mon, 13 Jul 2026 22:44:16 -0700 (PDT)
Received: from [10.133.33.31] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb6e2sm111538675ad.3.2026.07.13.22.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 22:44:16 -0700 (PDT)
Message-ID: <aef05058-848a-45a8-a082-a484f167e872@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 13:44:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: arm-smmu: qcom: Add compatible for Maili
 SoC
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-maili-smmu-v3-1-b48de6f5ae4a@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260703-maili-smmu-v3-1-b48de6f5ae4a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA1NyBTYWx0ZWRfXxexZPkkIEgk1
 ZMywhUn40VS6zGcUHK1uPvHpj6avtsxtUG/8hbZgvenUVaw9v8Y6aiE5cqSsfW+5BBJQvvDuWrR
 kKl1EM8Yr1YiZrRuryqYHxFjXnpel8Y=
X-Proofpoint-GUID: olIi_5Pue-JByk2SS1mB6eIVbDxiI4lm
X-Proofpoint-ORIG-GUID: olIi_5Pue-JByk2SS1mB6eIVbDxiI4lm
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a55ccb1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GanE8jRN9TD_0qqWZfcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA1NyBTYWx0ZWRfX2b3a6mtuutdJ
 Rc0eMf847JSugm9Lob0HOvQaM4DNXx6nR2cKZN4sUpZSRXbYV8hhMMp2Dqwb3KFTB/y0QQ8Na29
 Y/Uf8+NsHFyQQI3yB+btpEBDXLi+7M1T6s3Ik/GjIlGEE8vPbQ1rs5NBIPdrAJ65g8m9Ykf9Eq8
 qo9tlM9KL8ZmbhUMZvn1iR02gcG1ly2cFhF0IC5ygk/+AVjJp4Y53G7EMSR3qT2eEqKxgSx7aEn
 yj99yHNMKu6OzeLyhg791OZA3KdIxvS63h+FmxeKjGuShZ02UR1DSzA6qZgT32avZfCpu5gBbNn
 DQxnp1oUbvG1TDrOQIndU7JDQH/WcgH/136aduvFm9EvlqkTLXfPyYXEcmZENideXI1BIvWmJDb
 GDG+18diZKl8NTQd8z21utOyDZfbrhh2JGdh6mPIKaiYwM+nsmB8obAyCwSfwKwGx2ZDUYVDbdx
 I3RvqWU7BaBXlDjGkbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_224419_050764_A9B4467B 
X-CRM114-Status: GOOD (  18.25  )
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

gentle remind to pick the patch.

Thanks,
Jingyi

On 7/3/2026 3:50 PM, Jingyi Wang wrote:
> Qualcomm Maili SoC includes apps smmu that implements arm,mmu-500,
> which is used to translate device-visible virtual addresses to
> physical addresses. Add compatible for it.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
> Changes in v3:
> - add smmu binding to the block that disallows clocks
> - Link to v2: https://lore.kernel.org/r/20260628-maili-smmu-v2-1-87448a7678ec@oss.qualcomm.com
> 
> Changes in v2:
> - patch rebase
> - Link to v1: https://lore.kernel.org/r/20260524-maili-smmu-v1-1-ec85b12fda83@oss.qualcomm.com
> ---
>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index a701dec2fa0a..fd095161f6be 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -39,6 +39,7 @@ properties:
>                 - qcom,glymur-smmu-500
>                 - qcom,hawi-smmu-500
>                 - qcom,kaanapali-smmu-500
> +              - qcom,maili-smmu-500
>                 - qcom,milos-smmu-500
>                 - qcom,nord-smmu-500
>                 - qcom,qcm2290-smmu-500
> @@ -621,6 +622,7 @@ allOf:
>                   - qcom,glymur-smmu-500
>                   - qcom,hawi-smmu-500
>                   - qcom,kaanapali-smmu-500
> +                - qcom,maili-smmu-500
>                   - qcom,milos-smmu-500
>                   - qcom,nord-smmu-500
>                   - qcom,qcs615-smmu-500
> 
> ---
> base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
> change-id: 20260628-maili-smmu-9ed0f2c189ad
> 
> Best regards,


