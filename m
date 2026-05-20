Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63CBCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 08:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4o4tguLJ2M8UFVCSQAOmrgjGYGYAaNNp+BkOJSYljs=; b=0vdnR3AjpvxCKPSGMgj5FLp+6N
	f9vhCGWhRqs26bdGbJnHz34+8rgK1BGDKPYutc5o52P6hX245fG8YR4V/rwnmCNCG0I+32lBaCq2b
	jkHUu1el0ZiFRahW8oemWgQRu/rwlO42v9hiFOmn3dQqKRMcaIK7aHRV4ILFA9ZeoyaIPbv1wqNg/
	qps3wYvscFOVAKBn74k7HmtJesHOAAt/wT0tiAa+7GLkmHwdqqJ5Lf2tu1fGpH+p2rJposOqnNADj
	x/MM4ZrZ8QYZdXI/ObSdBFt0nkf2Q03inLRpuB+RphHB5TBmFswDqmv3XjysbJ9ZJPHemqHYjxsvx
	+/z3GmWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbwE-00000003tFh-2Plf;
	Wed, 20 May 2026 08:05:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbwB-00000003tF1-2x2m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 08:05:57 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6lufT2143814
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h4o4tguLJ2M8UFVCSQAOmrgjGYGYAaNNp+BkOJSYljs=; b=ZaRSheFuPELGrHrU
	5bq5fVMfyqResKiQ70JQ9GcmVcwVO++BNdtAGa8VE2RcuXKOS1fdXMzwTJtDbph5
	Kdz4noyWWRWd6d23UxPQMSbSlVPYhaCaEpU8/dR7MIrPBCAKu4u2eeLWD7A9h8Ru
	U3reVb2kI1+5mBFvP29oQxg4eDYm25BSrQS33OCcAsX2dxLWXMzwkxEAzAllr/T5
	SbMuaMtk4zoKuAm4QahqJUCu0TasoEKPmouhj+BzAYKQPlph23Nquuv+5EWqtMuO
	plY7E2DXbNgLQ53IfLC/cnaAcIDD30ZwYB/zcqQY/p+D8n8MDMmrXgdUON6gqfI7
	uk+kjg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3tkqns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:05:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36781927b4dso4879606a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 01:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779264354; x=1779869154; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h4o4tguLJ2M8UFVCSQAOmrgjGYGYAaNNp+BkOJSYljs=;
        b=fxRhfDDMZjkAf+gvAreI05zR7BqK2F7/fQ4nP+TlsTAdUMixjcmBgu6ysscJ+hC7gW
         Ate+8mATklUs9BTRvSz7nOVpyyGF6QglUYX4fiKZUL0aaJwpbtL+p3A4FRQK7g4qBtjM
         ZIqO1ITCYGEdTbWe/2lwsQmfCqkf4nyfgFOLdHJE4h4SPRU62TEkf8CGPsetVZtxv17+
         THcJLcSYaJsb3zNCbIfsxSvyrDqYdU2abuEYebGoMvWQpQwUhZRNwPY4O5fumKpO5XrA
         lLqPA+VZPFvB8Khr703TN6kvPdKMgZY414qqwW66CJqNRYfz6x0nd4WQX2nLwDpgpYZH
         1C7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779264354; x=1779869154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h4o4tguLJ2M8UFVCSQAOmrgjGYGYAaNNp+BkOJSYljs=;
        b=ps3v50acOqJLUSXYyoysOXBcPNuYQpsZDLvFb25v57Gj+8FvLPMBD0a/ErtmAuyX+7
         JHGhrTpX3+sMRQT9jYUzFvr6HGAEjGwemUw+NqJMzOVnTZMk8yqAod87XK74YzRlbByg
         gVvf6itGuZqMSTdLj3Q+rFxoh0gxrDPWRCMApW1RkQqF3mKlSzxA2kBqC2SVW7IiNL8Z
         uoZWV1O0QvGxDEolpk+AXYb+uZwDSIcSl4wn8xvehVgwjj8IaKtNN7HrUuYbju+uP6Zf
         qOFtgqFyGJoPm+pJIlyvN20LquOAXEUs1kYumnoff+Yq8JrqRkwzR+HvwZjDZRjU8QkS
         XXdQ==
X-Forwarded-Encrypted: i=1; AFNElJ9NcYBjzqAx1qJtVeKrxggx/6npUJqtxEGIdneyV9Npodj1PJFQOYQy9lYnu6k/zW6Jm41wwCMkChhadhjiBcD1@lists.infradead.org
X-Gm-Message-State: AOJu0YwEeLzeOlvSpI/RxWqWnD8tXhLL6RUbdXPtN/YmgA4W8msdD/Qo
	BX/Jcf1pzmkYMJhUwGawJTO0zwrXhyFwxy80C8td0e1jA4Q0Ef9dWBQ6/9XdlAi8phw8YlveBEd
	v2cCQw5tyNw+/oEguU6L0odAzQekL0/LmHOjXJEJiZVypCtDH6dIxMj28m8iFzXIbmvSTGDfBjN
	hXSw==
X-Gm-Gg: Acq92OG6KDR4339dnaNOkLZLbCr2iCB8j2VeNQNvlKiUU1HyxDpSWPxVunJwPR9AKoc
	aXes2iM4Lxd9Whrdt+73TZx58DvoQfOLWSOpir9jzmfkfsdGtMPHvZI+m4JX0Tc3B6fk1VkZM0+
	+E2PtIfBziN4Xd7D36QiYWDMwS37FLVDwHJClT/3OMzB/B6loUngNki1h4TFXb40kGxqX15dmKx
	i+n1wkuOvz7Y2GNZPCwCOpKN7ZOuJKJzsXpHvPRNgyrGZiuQBqf17duMwqX/IGz7HdgXhEoUiYh
	RBFSCTGHLRI0KKyyaW0oHgaJ8DjZrtaLGJD2vm07vvZasOR4oTjf+WQi1jmjD9GKUMzjDpz2IuS
	DY9uDJhr2qaFTdloEB/DXhJZ04B+XjTZHxl26i03SwbwJGWhJQ503z0QSwLKqddNJa3Q=
X-Received: by 2002:a05:6a20:7d9f:b0:398:ac0d:9a0b with SMTP id adf61e73a8af0-3b22ecb031amr25955109637.50.1779264353640;
        Wed, 20 May 2026 01:05:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:7d9f:b0:398:ac0d:9a0b with SMTP id adf61e73a8af0-3b22ecb031amr25955066637.50.1779264353199;
        Wed, 20 May 2026 01:05:53 -0700 (PDT)
Received: from [10.219.57.109] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb11683fsm18637582a12.26.2026.05.20.01.05.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 01:05:52 -0700 (PDT)
Message-ID: <11b91838-9b24-4a62-8760-fdeb3703afc4@oss.qualcomm.com>
Date: Wed, 20 May 2026 13:35:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 0/3] of: parsing of multi #{iommu,msi}-cells in maps
To: Rob Herring <robh@kernel.org>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal
 <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260424-parse_iommu_cells-v14-0-fd02f11b6c38@oss.qualcomm.com>
 <20260506221915.GA3290640-robh@kernel.org>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260506221915.GA3290640-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=feCdDUQF c=1 sm=1 tr=0 ts=6a0d6b62 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=zmrd7r8un3QtD10oEDQA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: hHG9U-YlvUhXf4MGmLL49xThmaoSYNI4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA3NiBTYWx0ZWRfX1h2HsyTTNZPD
 0tKdgGMuzS0vegW7zfbsN5gfc6KNG8XBWCjjglQDFrnGES9XLSzkHG+TN0mCQ1HNZbD8GpZRTR1
 Aerb+vCIcaRQWagASX7pnZ4lRem4j4FZV0IpxQykZsACvMq1Jp0jAtCwrtjIu6EdMLogFkxHVIX
 tZhb2pkQnnzfI24z3WjDoarIvDaFBHUlzepENJsNEo3KjGZki2EjXOm3vgRsEZDx+JrCN1ppGfn
 a2Yie+yegvQWRR8W+S6V2j5DylPx+DK90TVlcjBFgredLBa2fluZ5LsqgaTheuSRiD2qSOdzzdC
 5keD3oPPInqJtx+gHFg94JzBH/IKWmj3DIH/2K2x2niscjtWR6VqkfQs3/PM0e47qWZC7K0oRIG
 nIVVPdR4QZWXbQZFmRqEWJrWh4x9JlNuxTs6pUFJ5eg7zD9cE9BmjfCqa0vfq/DlDb2MrsHTUTq
 Yo983e36yU7UwaM/q/A==
X-Proofpoint-GUID: hHG9U-YlvUhXf4MGmLL49xThmaoSYNI4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_010555_866584_F69D2BC5 
X-CRM114-Status: GOOD (  20.63  )
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



On 5/7/2026 3:49 AM, Rob Herring wrote:
> On Fri, Apr 24, 2026 at 11:26:07AM +0530, Vijayanand Jitta wrote:
>> So far our parsing of {iommu,msi}-map properties has always blindly
>> assumed that the output specifiers will always have exactly 1 cell.
>> This typically does happen to be the case, but is not actually enforced
>> (and the PCI msi-map binding even explicitly states support for 0 or 1
>> cells) - as a result we've now ended up with dodgy DTs out in the field
>> which depend on this behaviour to map a 1-cell specifier for a 2-cell
>> provider, despite that being bogus per the bindings themselves.
>>
>> Since there is some potential use[1] in being able to map at least
>> single input IDs to multi-cell output specifiers (and properly support
>> 0-cell outputs as well), add support for properly parsing and using the
>> target nodes' #cells values, albeit with the unfortunate complication of
>> still having to work around expectations of the old behaviour too.
>> 							-- Robin.
>>
>> Unlike single #{}-cell, it is complex to establish a linear relation
>> between input 'id' and output specifier for multi-cell properties, thus
>> it is always expected that len never going to be > 1.
>>
>> These changes have been tested on QEMU for the arm64 architecture.
>>
>> Since, this would also need update in dt-schema, raised PR[2] for the
>> same.
> 
> Sashiko has some thoughts on the series:
> 
> https://sashiko.dev/#/patchset/20260424-parse_iommu_cells-v14-0-fd02f11b6c38%40oss.qualcomm.com
> 
> Rob

Thanks for the feedback, I have Posted v15 addressing comments from Sashiko.

v15: https://lore.kernel.org/all/20260520-parse_iommu_cells-v15-0-b5f99ad4e7e8@oss.qualcomm.com/

Thanks,
Vijay

