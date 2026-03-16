Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EEAF53D78
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n1xeMoYeUM0iSmvPxnEiOO/lpTwBXAxToBC2I8g5MT0=; b=VtKB0rrM9T2kRIxTQurufTz07O
	UGCtV887wxmBnVAa+hQzUUA31ZVWpWiAGVqfPq9zkeV5XemNTmhSJaARIqysWhuFU1yMaWSvWBh9x
	SRsKaoLmg0d+2K5VxVQmDpZLTDx9FJ3zPym3kQrA3WkEG92q8jCBs00DDXGFUKYrtuiJEapoV6u5x
	w/WxAV2G3+HNFxrOf50cfLduSQJkeJZrIRiwY+EAw45/dBYmk2GfpAuMGyi+u2+mmFkWaX+z75NiO
	/totIssZfSMZXsJ2TZmq7s1sP2Y3Pv41tFJ+wR4OdRb1u6EZoeUi/tMZOXG3QTCo+4CC15ZUXRsRL
	5zJhzv9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BPt-00000004VSM-0JN8;
	Mon, 16 Mar 2026 17:07:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BPq-00000004VS0-3fUc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:07:44 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GDdZ3m041563
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 17:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n1xeMoYeUM0iSmvPxnEiOO/lpTwBXAxToBC2I8g5MT0=; b=X+Nlgmj4OOaKssRg
	4e+d6j+YInLZbUUYEhBCPUFKoIM4YtGoc99GwqQ10TJmPjB/CmSuHpPwmbV7wSg+
	gmPOqgVaLk8ZRcWDLGYwb4WoBNwYGGAQu9LwjKdtBF4Vq/PP8ILX80VePosnAn9/
	VUBBXlO9VluIzXokZac37bTWrwu/A3+s3GmM9CEKFq++6YzLLn0yfllLDnndTx2S
	kyronXorVd/CLR6pMaqTIWmB5SUN5szZpHBFg6AuY1JRWB88ClPlvnATCqj73Fae
	8wnwP1NqnvRuRn/MfB0lX8kaZ0Fjrfu8XnfDTCed23SOC09MYiYYPVBbVNuAGwNZ
	/Pg+zA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxdt82576-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 17:07:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c70ea91bfe1so3340431a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 10:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773680861; x=1774285661; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n1xeMoYeUM0iSmvPxnEiOO/lpTwBXAxToBC2I8g5MT0=;
        b=fKM/lEuKRq0aEbzI0MTZydc8aqc11Xy5P4KON8w4t2YSxqhAY5nr5533mo/hFAAjQW
         eN+KHuN/UDngQBj5AmskbCnITPCx0l0Y/ujg9yMynKM8GN4aIhNb1hTKY9kMI4ZCS/Tg
         Os//swC6oG25bXqSBEKaObsJzqb7SZg5UF3/4VABAYv/nI81zdaS2Iqn9br9YS8MOz0n
         w4SsfEjbxgktfGid9ERR97Z0u/K/ikINzVrRmKyAUfnNk3gJviNbJQJCC5Ha1CmRsWsn
         pRXx6jqWJGn1evpa1kav8x9Zb6IJDGwFCBL1duu1YSBRsu/t3tRJnDW+dPmN9PngUU0U
         um0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773680861; x=1774285661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n1xeMoYeUM0iSmvPxnEiOO/lpTwBXAxToBC2I8g5MT0=;
        b=Z62QrMuhL4aQrRAeffrVxHsKFXZPt9pMz7mo2WoltPwfmVCwI0gxYMeLfgPmHu4BAP
         vzUVbKOFWhVNlqDZ8azF+hnGG5vmLEBAB1ZsVisl9KCBdiWuPpSj9cuRz9II+jN6hDgU
         rC4aE9QT4rMai9ygGrX1hWkexKbLSAdzs9UsiN3WUA4bybnx9PwUpl1ofKuzz3gDGKh1
         4YJzvKGj8xIyTOQ37z8y05x+JlKoSuqTIPxxFrHi5e2t1AC4MgYS5t5F2/cprVS0kIPq
         qWXzYnNvWqUroE5+X0YoZhK8gOaUEi0+V13uDl1q2WApTVGOhglBMgXrHfWw/99xIwt+
         ZbXw==
X-Forwarded-Encrypted: i=1; AJvYcCW9oZn7hswwk/n9Yu/UL9eh0ACvo3QPupMeqr8/+CN2GtqdZQYEOadayLniUpcqPWzoUcv+6nz5RheqPNdXtlp4@lists.infradead.org
X-Gm-Message-State: AOJu0YwE8m6MlUhkfEXkAQsLc+aFapH6YwwZfv+Rzc4MHuwDku+V1ICp
	sM1Hf4Bhd5WKbrgN8HCtkK0FGaspLsjf+OxuKWOz00UD5WJaqtWeYQETjfF1G/MrXBmfhi27lqW
	nS4tOjRYFVxEPs76Opzxx8UGfdWJ8V0/pcNCDHDD2rvAcjU6DsRNL2ujy3FExyyIHlQ8BC0e3om
	MCxA==
X-Gm-Gg: ATEYQzyeHSfIlcGe1RSIXpxFijL/SWtDnvBD2+bRLws+N6inK65T2drpSUSgQumiZ3d
	iTeTxX8wFMEtgxnQKtXG/mHBtbUIMEC5o1OsvwPaH2uaPmE0UfbSOlQ3/TGe3wy+gyeL1iDNY31
	Uvku7D/VVXoNtSedC1PDKByv2tSAdLNiONzV9XZidE32Ne+OauXA6dyPQS3HkfywBUu/odRHqHC
	qGGg+jAgFLTavC4qgng5NNazmF0gywJhs3wb1wQiSQ23eHY/JcZH9JJoZd4Sc4kfLYCOSV5V1Rt
	fZCe98E3z+1D6qRwk6PJZMAOo3Z5T0HsaydaAnHnT6Y9XOf3jp/gTt4HIzF/WSHyqeBVGUKFQuz
	pVHYNOZxCKsp9k/UlGUetNjrVCrr3gM58Lv3An6dfcTns37XBmUEYoXZfqw==
X-Received: by 2002:a05:6a00:854:b0:81e:81fb:b392 with SMTP id d2e1a72fcca58-82a196d9795mr12519519b3a.11.1773680860302;
        Mon, 16 Mar 2026 10:07:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:854:b0:81e:81fb:b392 with SMTP id d2e1a72fcca58-82a196d9795mr12519484b3a.11.1773680859759;
        Mon, 16 Mar 2026 10:07:39 -0700 (PDT)
Received: from [192.168.1.12] ([38.254.186.229])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a072418e9sm14954842b3a.3.2026.03.16.10.07.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 10:07:39 -0700 (PDT)
Message-ID: <dbfcbc9c-2175-49a3-aee4-434b69cbaece@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 22:37:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/3] of: factor arguments passed to of_map_id() into a
 struct
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com>
 <20260309-parse_iommu_cells-v10-2-c62fcaa5a1d8@oss.qualcomm.com>
 <esfzpgpgenydif2sxahsetkglz6kewsgjhkmzr6ulrrkctnkbq@a4zsfdmhbxui>
 <27edd195-b0d3-4214-9df3-74a84da1e3e1@oss.qualcomm.com>
 <dyjdwxaq4oc7ahri3iuhnmobh3gwmn6drhox7t2elep4rlqhuq@fe4gp5t7q5r5>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <dyjdwxaq4oc7ahri3iuhnmobh3gwmn6drhox7t2elep4rlqhuq@fe4gp5t7q5r5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0ZK_Ayq9eWXsVfHrtOPKCW2Al5n0XFib
X-Authority-Analysis: v=2.4 cv=CKInnBrD c=1 sm=1 tr=0 ts=69b838dd cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=FuYIH7Xx0xzBSkYrynBYgw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=GQrJT2J37VpXmJLvS4cA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 0ZK_Ayq9eWXsVfHrtOPKCW2Al5n0XFib
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEzMyBTYWx0ZWRfXwRzvpOzp7rui
 +VPCndTsTt4OpPFPKb/WW819h3R8HEbEALkJSE/Pb1Nv+gH3tmT29FOxP2lomel79UP+fGODZkV
 iZ1DnDlybTuQEbW1mtZUvrts0Ki+nhxFajU1OvaHQuyzz4awHUhGtmJ5A5psDhrjCnjpmb8jiXy
 vAApjC+49LUKIAesDwg4hrXdQwNoo5MtsLyIXGvKVe9oTQO93XyVph3tJo6UId4awKU2IAWrC84
 jpZy9XkMLgnUlRda8tEWy+nqDFGzxokb+bCmnAbEne1jwmVprQ/jnmFysZCevngR5c3vXfgHkCT
 6z5YEvK5ThAL4A70Ad0NfHdRTkI/v9hzivH67rGWoQGaDjCxuYK8kZ461GyOnSro4aWC8Igu6Od
 DEyiJh87bXW4hiEfOiAL0CtVOuWrZujSSLXvwOgqZ0N9egiIpT5gfqfLxLhuHBEahWnWNhJ4FJK
 sCwXsKuKZqSCI/rfwtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_100743_042321_F1D0216A 
X-CRM114-Status: GOOD (  23.94  )
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



On 3/12/2026 7:48 PM, Dmitry Baryshkov wrote:
> On Thu, Mar 12, 2026 at 05:12:51PM +0530, Vijayanand Jitta wrote:
>>
>>
>> On 3/10/2026 2:53 AM, Dmitry Baryshkov wrote:
>>> On Mon, Mar 09, 2026 at 01:03:38AM +0530, Vijayanand Jitta wrote:
>>>> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>>>>
>>>> Change of_map_id() to take a pointer to struct of_phandle_args
>>>> instead of passing target device node and translated IDs separately.
>>>> Update all callers accordingly.
>>>>
>>>> Subsequent patch will make use of the args_count field in
>>>> struct of_phandle_args.
>>>>
>>>> Suggested-by: Rob Herring (Arm) <robh@kernel.org>
>>>> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>>>> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
>>>> ---
>>>>  drivers/cdx/cdx_msi.c                    |  5 ++-
>>>>  drivers/iommu/of_iommu.c                 |  2 +-
>>>>  drivers/irqchip/irq-gic-its-msi-parent.c | 11 ++++--
>>>>  drivers/of/base.c                        | 63 ++++++++++++++++----------------
>>>>  drivers/of/irq.c                         |  8 +++-
>>>>  drivers/pci/controller/dwc/pci-imx6.c    | 16 ++++++--
>>>>  drivers/pci/controller/pcie-apple.c      |  5 ++-
>>>>  drivers/xen/grant-dma-ops.c              |  4 +-
>>>>  include/linux/of.h                       | 12 +++---
>>>>  9 files changed, 76 insertions(+), 50 deletions(-)
>>>>
>>>> diff --git a/drivers/cdx/cdx_msi.c b/drivers/cdx/cdx_msi.c
>>>> index 63b3544ec997..03232b5ffbca 100644
>>>> --- a/drivers/cdx/cdx_msi.c
>>>> +++ b/drivers/cdx/cdx_msi.c
>>>> @@ -121,6 +121,7 @@ static int cdx_msi_prepare(struct irq_domain *msi_domain,
>>>>  			   struct device *dev,
>>>>  			   int nvec, msi_alloc_info_t *info)
>>>>  {
>>>> +	struct of_phandle_args msi_spec = { .np = NULL };
>>>
>>> Why do you need to set it? Parse functions ignore passed args, don't
>>> they?
>>>
>>
>> The parse function does check arg->np on input — if it is non-NULL,
>> it is used to match only entries targeting that specific node.
>>
>> Also, there is this existing path in drivers/pci/msi/irqdomain.c which
>> pre-sets the node and passes it as input to of_msi_xlate(), so the node
>> pointer is not ignored by the parse code:
> 
> Is it only being used for MSIs? If so, can we make that explicit in the
> API by having the 'filter' device_node pointer?
> 

Yes, I see this is used only in the MSI path via of_msi_xlate(). 

By filter do you mean the below changes ? here of_map_id() and of_map_msi_id() would accept the filter
as a separate parameter so that arg becomes a pure output:


int of_map_id(const struct device_node *np, u32 id, const char *map_name,
              const char *cells_name, const char *map_mask_name,
              const struct device_node *filter_np, struct of_phandle_args *arg);

int of_map_msi_id(const struct device_node *np, u32 id,
                  const struct device_node *filter_np, struct of_phandle_args *arg);

of_msi_xlate() would then pass *msi_np as filter_np down to of_map_msi_id
and IOMMU callers would pass NULL to of_map_id. 

Does this look fine ? I can include this in v11.

Thanks,
Vijay

>>
>> u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev)
>> {
>>         struct device_node *of_node;
>>         u32 rid = pci_dev_id(pdev);
>>
>>         pci_for_each_dma_alias(pdev, get_msi_id_cb, &rid);
>>
>>         of_node = irq_domain_get_of_node(domain);
>>         rid = of_node ? of_msi_xlate(&pdev->dev, &of_node, rid) :
>>                         iort_msi_map_id(&pdev->dev, rid);
>>
>>         return rid;
>> }
>>
> 


