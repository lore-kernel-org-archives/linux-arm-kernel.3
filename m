Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1101C105A58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 11:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O6HJTG517rx7BZNC+Lqbxk38jHNOTKDXfitY+fGl2Qg=; b=qIZnmJA+kl0L/yFCKHOTl+zXq9
	3ThRfWu8qyQhStGPdEZI5BPmfoEM7uJPHPwqPFpvbPt+SoLo+dk1HLV/9+q8XwCgje6sAH6YbVF+Q
	StbmqxFY1isKcwg/vNZtKVWTWGCENJYiHR9ZeELFpk8Q7dAhQUR6BbOi2g8/r2m5RcbcZ/jWZnRLf
	SRy6aroyDEUrviORRjojJnM78CX209Oge5IcuqD4tzlEcR4eSB67a0zubiEOHi/0fjoe1NyHthY7M
	CCB1LiQVVv2veEXvI1+dhIR7c8zlTFqEVvBl03lzA8jH93WVnx+rc8W3ZGj3g0Ros3nKx59qIWDSb
	Gal3jFsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eQb-0000000DygC-2p7l;
	Thu, 12 Mar 2026 11:42:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eQV-0000000Dyfg-3q21
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 11:42:05 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C2bhLC1739727
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 11:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O6HJTG517rx7BZNC+Lqbxk38jHNOTKDXfitY+fGl2Qg=; b=cTWDR23rSNC6RXYv
	NYm5xAfJP6JIuBegbdJxesqHYjbPVMpbyoaplrYspybiURpA1Trs2IBBicGX/68c
	/5p+bLJWsmwM5nkoINvohPNjkwnCV2Td1WLJKuiQev/oeNlwdMwm/GB45fgFyHxJ
	HBiAKD73NnOBoytDQFweyjSwkRPfJWCUyj7pEosaMeJDL4V+7DNFEgrEfn/EASZJ
	6+Gx97SZIgZENJcFW2XKZ7T0QIf+zW3nzwfP8DgMViWz3ZckUTqhX36WvwMOPypt
	LWOJsODEoFAaVja57lITwPwa+tEi6nJkKgY1F91wyXAO/nJARSgaUFBOp4o2h3W9
	cdmcuA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvdhahp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 11:42:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae57228f64so10247885ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 04:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773315720; x=1773920520; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O6HJTG517rx7BZNC+Lqbxk38jHNOTKDXfitY+fGl2Qg=;
        b=LCTxCyJHsH39e4XUubp1znbl1d4nncfxBANIwNAVjjevMPhSn7B3KtrV/BFy3N1xlz
         Cvb4VXqIsoWx7KO4ie3DT8LkkTOmMbYqn06xtmpaI2sziG53niVW36N1HCmLmMD24MeV
         shDx6U7dqK/ipHi44CVAc764KcN82XPtjmhmWy+GIxO+6nQyowaVDHWIwpxlqL6MJInb
         /wYhP+CWhViPEBrqLiQWYbAnqVvLN8mhgpKfl0WRAFfIvDTi5DoM3QojMTTILQDRE+4u
         3lC4iwuzRDKxIEuhcZAoeIb8a5RQi4WHiWHCkMuutue9O9XIGbuT549TLu7bnDRpOooI
         eFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773315720; x=1773920520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O6HJTG517rx7BZNC+Lqbxk38jHNOTKDXfitY+fGl2Qg=;
        b=g6XjTYEH2G+cqt/vnMUfZQi+zNgPis7JxdmDkS9h+1aY0JwxLjOEUCHjxbiqcoR+Cb
         CN5LUJ6MwWd8PxHzw7wpBzlC+LWNiuD95h4xw6XO5GC3ljadkU89HmDYAvhDlWwSGa0B
         w0wrMvPSR53JzrfoUmy60j5zTdpYWYN5Be/liebozChTcniWpqF3/Q0uAe4nPu3IRH7i
         cH+KaD3ZuqqNz6Sl98GeISEf9whgP1Bak1XN0o3kXNE9nh4XJlwifLe5HjgBBgR9xyAg
         se6oGXf8OuQGi4HxGuWxxHJaBQHpAJK1DJ5rhs768h152BiWithMDtAi8BR/lOir8UIU
         aLHA==
X-Forwarded-Encrypted: i=1; AJvYcCW9+Q+apPHbt6JJP8oImg1RyJmYT3IFgYa+LvxXH4obj/mGjnPegtrwOzJw9RJvndS4o70WPfnq4Eje57BgC2Z7@lists.infradead.org
X-Gm-Message-State: AOJu0YzjBmAdMR2LEf81WSZlLGxUMxdI1fG0jPYHdl8nX6MgAvDROFNX
	2fs3zIGYBY8DYxSdkdz0YlfxXXCBFGdKdMH8BAqzpqaFaazqkurhqKjHAsPg03ybMd2gRyVylrY
	GkOu8iMMVnWOZQA2tuyosoC3enO1j7AJITPzv5lEVk4SEtqDLqJAoYvvf5euH4gqgG3T3RbJUo/
	sCiw==
X-Gm-Gg: ATEYQzweTPQ3oH4qOubjxH6dneTq7xo1WvPZhTPHtwgk4/PXvzeoUVNubBQGIK5u4Lo
	7+ZUydrM/6EOufzmePbEOKZwEaIn7I/PGn3oFKBVwYBjBPzV0fYHziBN38DHQFMuXYf4bD+zVN3
	YFXSGnqAcOAWrIxjRdmMWKsTA4SPrnwqoYhSErF9M+QCOz4V0MGkCrxXl18G/zUG1au08sN+Lpg
	QAXyicITBDm+Dhxi1rcV+CJ/PFnnoV8qVK3KVo9tMMlHbb/JqTD8ntlG3Mb2qNNbHcxUCn8U1r3
	F3zfVUtMHSn3v5UzDlPgCpDLgTYuXEoi39PCN4E/0epNuMS4OMDk28DSDt9exs0/GEDRGjcSeqK
	CXFYuTnFQsjakgXO8J0VotuiE9KmIlLPILVPNm7vjO3TM7MDklTgCkN77ow==
X-Received: by 2002:a17:902:e807:b0:2ae:478f:2ec with SMTP id d9443c01a7336-2aeae89119emr62683525ad.29.1773315719577;
        Thu, 12 Mar 2026 04:41:59 -0700 (PDT)
X-Received: by 2002:a17:902:e807:b0:2ae:478f:2ec with SMTP id d9443c01a7336-2aeae89119emr62683115ad.29.1773315719067;
        Thu, 12 Mar 2026 04:41:59 -0700 (PDT)
Received: from [192.168.1.10] ([38.254.186.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae22217dsm53886225ad.4.2026.03.12.04.41.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 04:41:58 -0700 (PDT)
Message-ID: <57537059-4989-4704-ae6a-72576d031216@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 17:10:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/3] of: Add convenience wrappers for of_map_id()
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
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org
References: <20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com>
 <20260309-parse_iommu_cells-v10-1-c62fcaa5a1d8@oss.qualcomm.com>
 <3plcdobbd6teiluzijzk33yepbpsur24tnmjr32sco7a4loptm@xmzmsaurvmvj>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <3plcdobbd6teiluzijzk33yepbpsur24tnmjr32sco7a4loptm@xmzmsaurvmvj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA5MiBTYWx0ZWRfX5nxE7DORQJAT
 03heKXTSW77Sq4SSgKDkZI2f9iNlUND54ggesfcBkOUMcdJ1J03zcPZ9N2+IQ08I9yEEWCR1mGk
 Fz+51Ba/FKj1cFb4Dil2V3QgR9j4E2qTOwY2jVQQu+i+WPSWrGUglkTebd9uhCgxkK7vGy0Sj4N
 BbDK9yAg9RCt5qHUetO+03ro68LM3o4tvnSagSd/qEeQPMdg31JrH/aFA8aznSuzXhfvMKX40tq
 83UQf7aQTb1Liu0jwQirxVmbBhf8UlFGIzZ/WhAvPK7Rfg0TAiMa+f1xi3KkJ9RgaShQeuPtIna
 jSx2AexRAvfW7d8hZ1gDam3Y3jjz7idtGLq9k4Su1fkZGbXrFTTmBLav9PCUaGWj69f85q1uJys
 0vnm2iC9PjVzw9P575t2niDFjW3A9qd9DuQ+8VNI5uohokL0uaa64RybpWRnAK7B6xhikcr8Cn7
 cP1JcYW9FqjW5Ms4eKg==
X-Proofpoint-GUID: -7DA2sWfNVukXoGo5ZrcWg28qiTsD-7d
X-Proofpoint-ORIG-GUID: -7DA2sWfNVukXoGo5ZrcWg28qiTsD-7d
X-Authority-Analysis: v=2.4 cv=XsT3+FF9 c=1 sm=1 tr=0 ts=69b2a688 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=FuYIH7Xx0xzBSkYrynBYgw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=6wy38kV5EeFARYyu09AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_044204_089949_95DC90E1 
X-CRM114-Status: GOOD (  20.11  )
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



On 3/10/2026 2:46 AM, Dmitry Baryshkov wrote:
> On Mon, Mar 09, 2026 at 01:03:37AM +0530, Vijayanand Jitta wrote:
>> From: Robin Murphy <robin.murphy@arm.com>
>>
>> Since we now have quite a few users parsing "iommu-map" and "msi-map"
>> properties, give them some wrappers to conveniently encapsulate the
>> appropriate sets of property names. This will also make it easier to
>> then change of_map_id() to correctly account for specifier cells.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
>> ---
>>  drivers/cdx/cdx_msi.c                    |  3 +--
>>  drivers/iommu/of_iommu.c                 |  4 +---
>>  drivers/irqchip/irq-gic-its-msi-parent.c |  2 +-
>>  drivers/of/base.c                        | 36 ++++++++++++++++++++++++++++++++
>>  drivers/of/irq.c                         |  3 +--
>>  drivers/pci/controller/dwc/pci-imx6.c    |  6 ++----
>>  drivers/pci/controller/pcie-apple.c      |  3 +--
>>  drivers/xen/grant-dma-ops.c              |  3 +--
>>  include/linux/of.h                       | 18 ++++++++++++++++
>>  9 files changed, 62 insertions(+), 16 deletions(-)
>>
>> +
>> +/**
>> + * of_map_msi_id - Translate an ID using "msi-map" bindings.
> 
> Which ID are we talking about wrt. MSI interrupts?
> 

id refers to the device’s requester ID (RID/BDF or platform stream ID),
not an MSI interrupt number; it is the key used in msi-map to obtain
the translated MSI device ID (id_out).

I'll update the kernel doc as below to clarify.


* @id: Requester ID of the device (e.g. PCI RID/BDF or a platform
*      stream/device ID) used as the lookup key in the msi-map table.

Thanks,
Vijay

>> + * @np: root complex device node.
>> + * @id: device ID to map.
>> + * @target: optional pointer to a target device node.
>> + * @id_out: optional pointer to receive the translated ID.
>> + *
>> + * Convenience wrapper around of_map_id() using "msi-map" and "msi-map-mask".
>> + *
>> + * Return: 0 on success or a standard error code on failure.
>> + */
>> +int of_map_msi_id(const struct device_node *np, u32 id,
>> +		  struct device_node **target, u32 *id_out)
>> +{
>> +	return of_map_id(np, id, "msi-map", "msi-map-mask", target, id_out);
>> +}
>> +EXPORT_SYMBOL_GPL(of_map_msi_id);
> 


