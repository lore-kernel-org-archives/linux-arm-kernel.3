Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D43CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 09:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tNWCjXxY3vDlbxeyc6dAiioLTzJiUtHmEfK77uv8QU=; b=Pv2+LAh3pQ5hKfTrE4LlEnKglv
	tbT5EdWWTGe3HIinC3i4sw8QS8/ndV32QgHgKuLZRXIwJkJnKaVZojQo+cFLcJVqk6GSC64rZlkpa
	FSaieBocy7T7J1A4+X/Q6zQBjJamG5EGZKwhsIQURrws5iNBXkzwAo41CEBnSX2jsaL8iABAS1iBf
	GxnP4x6pRMYMsU7e3zUb/eVwiqlqu+JbioXwsx7wIXEcY2+Ks0uWPrGB8RSLA+yb/S+YMU6mLqvCT
	3yled9VPqrF4EwjRCMbX32P9/1ibgBw+o643Wv66SMr34VLq5fR/l+WiCXH9cr7iPpXfRGsifpaUs
	SSP05Mtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRoMY-00000001Yxd-0qHz;
	Tue, 26 May 2026 09:46:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRoMV-00000001Ywa-1jso
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 09:46:12 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q4ShAU1802808
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 09:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+tNWCjXxY3vDlbxeyc6dAiioLTzJiUtHmEfK77uv8QU=; b=fr1+vbDENVQY5Zkc
	AWKEyhljX0yFvxH6I1SvWUMTfp19xN/S0yh+TGoyD9Cl2mMP1B+cxYr4CMbB+3HK
	i6mgb6GJt0ChQnVW/edYstQ2ZQ/3qEyz7787O7HhTjAw4XPZE3hs5gii8npI7Amv
	SV4YTLdzF9yQsyRYbZhe8MXQpEJ8I1OBPDETlM0oT+VsBZIO/86gjRfEn9vRxRhD
	fa7RK+Fn5PB0Yls+1QT2cAgdVoCp2+ET9/qfV+TNX1+bxgF2y68cg7pgqK+nzx0o
	z9PP/dkyTpf4v2k4Ml/cIFZEvKeM5ltrMipw4x5NALhFjWWhKMw9d8b7GJjlf880
	lK0fmQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckyqm4c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 09:46:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba268cb5e6so109787175ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 02:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779788768; x=1780393568; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+tNWCjXxY3vDlbxeyc6dAiioLTzJiUtHmEfK77uv8QU=;
        b=fYuTb7cJ6MborwsMKwyc1Tx/774w79MRl2iP/ejSZWaVhqJrpzG2y8W1WSTBjz//Lk
         9xZUrE6fswzYGv533GuVJK/0Kq/gPdFZhcYCWtUAMF5flNlKJiIgxSqgk3Kr+hjye6oA
         mDVOa42kaBRxw/jsMqOTdOf7WD+18yjX1u9DYVmBOw8k8MEMjhNor/z7nTh9yHg/F1u/
         y7oj+V/GL7EZ5crFvdTL5sRhsFJrMNt63bMfoEvVYtzfsC+EyTm76vHri2ZWWjc+1kV2
         hPebdGCtBOUxtqgCjsnTPT2IpUn3wxOyL0G9Me/f/BPsjs8Mp0DW+qOuza/hffJiaW+H
         UhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779788768; x=1780393568;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tNWCjXxY3vDlbxeyc6dAiioLTzJiUtHmEfK77uv8QU=;
        b=kA/3tX4S7t+Wmlv4cEYsxP7WgWUfWUD0LHqB9BjrLWRoBRFEYGOA1ui6fXIR+GNLjP
         Vd8OUhuhoGWUoCsWTJKLy7qdQvGF2Cfq8XAOlZrQaGoeQD9Emt96ZC7Lm1JZZORZa8aF
         PiTvydipJyaEB8keUOccL/yliA5jGewyR0qo9vRWlLhxGyU48EcJJDf5We5YROuOTj5c
         lNJDDGg8hAv4N44r8GaJv1tpA/wXskjo+GxicUylCnXBNKHF3tXodQdemGBQzGV1KzkF
         5dr+rlY9vtBjrCfStF3NTqUlDwSa449cMyZwvtRWTWyEV+yNJUrHuoHK+D8YwnmcLE0B
         OwFQ==
X-Forwarded-Encrypted: i=1; AFNElJ8TlqC31pB8rBuOkiRNXBkNohCFl4TOdWwIveoaylTMGdINhjyJq8B+vo2RjZiR+H3yaE+b/iKid7nvZSHrYTIv@lists.infradead.org
X-Gm-Message-State: AOJu0YzGS+PHW7WnQMEiN4bKk6k+o9txPRNEKOl+maMwnvrZQEi/b4O8
	GUb0ZsdEudUzK6lxbFDzaxeXIZIT3m8qkxBLJ8XCH3adutetsPon3JkAoWHMSsWaGnQSVQyV8DT
	t5P+rVxN2HxAQtfeh7nbVS7Rr5Nc4ZSP/VYjEqPbJS75Ie3wCm36Xyt8UsNBfz0vX1fWNtFpyaH
	lPLg==
X-Gm-Gg: Acq92OEGkW5Z2XlTHLImlncMaAqt5SY95CS2GFa+QRMQJK8s3WT99qbow3q6uvdW+8E
	BM8QwdnPzcM18SlnQbzCY12m4VF2WUvirEr9pXvdMnDPVF/U5CmMX82pm7CJbp3dkOhYTzV87v2
	NWis+mZAeNPje+9cCoKrDuoN1aC1APfWwv1agmyTUuanb2JnhIGRYH02NVTEhfds+1NvYxhxPEc
	uWGLwR81/lSmjzwJSG5spBdEwYqkCVY7jEodw0HN9daeRv0XXGekc9QH4WjiogyoEAkyUFs2Mje
	aTy1IjLVnsrO4Uq9vwILqgqRusZiifslBsNJZjjsAALlmRFnSzSMIz2xak+EOX6yoj3dI1NlBTu
	K2C+uxYLBprSrrtRg2/xPEc3p4a+h1Zq3MzElEWESSIG0VKG/fTV3dzZ0
X-Received: by 2002:a17:903:41c2:b0:2ba:e42a:231e with SMTP id d9443c01a7336-2beb064837dmr200645465ad.37.1779788768348;
        Tue, 26 May 2026 02:46:08 -0700 (PDT)
X-Received: by 2002:a17:903:41c2:b0:2ba:e42a:231e with SMTP id d9443c01a7336-2beb064837dmr200645035ad.37.1779788767805;
        Tue, 26 May 2026 02:46:07 -0700 (PDT)
Received: from [10.219.57.109] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2ebcsm121223885ad.49.2026.05.26.02.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 02:46:07 -0700 (PDT)
Message-ID: <f2eb5c9d-a78b-401c-8796-f7ef7a8d7386@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:15:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 0/3] of: parsing of multi #{iommu,msi}-cells in maps
To: Krzysztof Kozlowski <krzk@kernel.org>
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
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260520-parse_iommu_cells-v15-0-b5f99ad4e7e8@oss.qualcomm.com>
 <20260526-finicky-crafty-hare-eae27c@quoll>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260526-finicky-crafty-hare-eae27c@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RMyD2Yi+ c=1 sm=1 tr=0 ts=6a156be1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Jo8nEopC4ZUABtMbiE8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: VD8MZUVnbl4sILHUBDBn_B6ODHzTwioh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA4NCBTYWx0ZWRfX/5Ow41tzq1xb
 NMn/NHzQY+Gf66Ac1mj4/uzqHZtdHGP+czSZ3x6MaBykQKRCKJQrUHyavD3s2B6gfi+pgIvjGAZ
 yl4FDE1CMct5JvBgGxiTe15rbkpEF+gxmrUKticEtVM2zd1I37R5617XWI4OEmN4mt3dDRxekLD
 um9THbFaDbUduC21ZHTUupSuZthTJxgPYLVhWX/6SM7IAUEdjNtzuRGE5ZoaUSUsjoOHxkOPsHk
 5dY5dJGaTNVeJa7Gkd2rmuuQE4Uy5dJB+LitvrzV0z3Vx3g58DBj5w5T6LJcq0cvh0C9Ccg854O
 fsE0Mfvyf4okiXx0Am/szCMNKHW6/fwrJMa0vNeQDOmhVEsM57Oq39ZKGIHGbh+W+yo+nUOeBpM
 Y4xXiWqdnGjVdhzaAs5QjTNfJ0YsFMXgKHLUdhD0iRfW7dSZZOaZiXSKMNvTNYaenGIclEsYgT6
 OdpJbTExDYCtdT2svTA==
X-Proofpoint-GUID: VD8MZUVnbl4sILHUBDBn_B6ODHzTwioh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_024611_579053_AD8CC5E6 
X-CRM114-Status: GOOD (  27.85  )
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



On 5/26/2026 11:42 AM, Krzysztof Kozlowski wrote:
> On Wed, May 20, 2026 at 01:32:39PM +0530, Vijayanand Jitta wrote:
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
> 
> So there is no real user for that. That's unconvincing. I would assume
> that at least you have real user where you test it.
> 
> If you want to speed up acceptance of your patches, then also I would
> prefer to see at least one more user, beside Qualcomm. IOW, show how you
> solve other people problems, not only yours.
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof,

Thank you for the feedback.

The upstream user for the multi-cell iommu-map support is the Lemans
platform's VPU device, which requires iommu-map entries targeting a
2-cell IOMMU node. We are currently working on the glymur series [1]
and once that is finalized we will post the Lemans patches as well.

That said, I think this series can go through independently for the
following reasons:

1. Correctness fix: The iommu-map/msi-map bindings have always
   specified that the output cell count is determined by
   #iommu-cells/#msi-cells on the target node. The kernel has been
   silently ignoring this and assuming 1 cell. This patch makes the
   kernel respect the binding specification.

2. Backward compatibility preserved: The of_check_bad_map() workaround
   handles existing deployed DTs that target 2-cell IOMMU nodes with
   1-cell entries. This series has been tested on the glymur platform
   [1], which uses iommu-map with 1-cell specifiers, and the existing
   parsing continues to work correctly.

Thanks,
Vijay

[1] https://lore.kernel.org/all/20260515-glymur-v6-5-f6a99cb43a24@oss.qualcomm.com/

