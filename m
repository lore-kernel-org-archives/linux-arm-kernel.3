Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24737105A589
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 11:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LE+t+QqJAI+/mgc7W1OIUYrBRVzqbLNj9RJHGrZKK9Q=; b=Bx2ziCOAbKPAKWPS41zUNjFswj
	1qBHnE0lOTKJJeTepqaEjTUPGuZ0qkJJQltbslXkz1U/MONivRONCKbU64xI5EmTQVqkeQCmeqUZm
	xs8t+wHSoX9QoEl4Tc3TiU8vBSqcBp9jxVmeDdW59U/ksE7iaMlRpdmm7d+V8aZqjj9lbuU3PnY7T
	TSxHPnzpkXwovCbMU/o6EqLhiENEjEiwx3tOqziCdDv6sfbXQ1QquifMi6jVqRYkuUPBGcTiI6Mmg
	b2AtqLo1TTcC9ErySsOI+TaTo6hdj4EgkZBv5BFcGK26uoimUnti1vHaaY4oBE0L6h4BSy5qUWYZA
	uyEfsk6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eQj-0000000Dyhr-02qB;
	Thu, 12 Mar 2026 11:42:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eQd-0000000Dygk-38dY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 11:42:12 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9gYtb3136615
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 11:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LE+t+QqJAI+/mgc7W1OIUYrBRVzqbLNj9RJHGrZKK9Q=; b=P5phZrdji2XNB1A7
	dTTi/RsItP2yc1RU394FYJtIegEYWxTNyrkQb0nAwMYAKmSD8GZ0IhcKP0iEn39T
	gPpRZjfwGbi1uO32Yfl3TFFBlGMioBr9HyrKxTKT8kBqhEkU2yEOd8CFcf6t9eyv
	CqE9kdZD7mCqzR8uNPVT4RBKJOpmu73ReHRA/EkhWeGpxE2vkNMzto6iDdQJgujY
	LOGl+LoKIbBfmjlUgTd3w3s3q1mw3x1d3hdxAvi6MWs7VO5s+YYappVus92gUf+M
	U2peZk8AIN/AUUgB+VjEDiVd6wpnW54pw9QdSIRCsBJQQnWWpQcwYQoQm+ZwhEgs
	wMOK5g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w9y3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 11:42:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae467f128fso9913425ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 04:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773315730; x=1773920530; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LE+t+QqJAI+/mgc7W1OIUYrBRVzqbLNj9RJHGrZKK9Q=;
        b=QVK1tf+VwN/MpYWCjndvILtangVpwCh/WFcP8BpkMOsGNPqB/VwGRJowjekg/KMwnS
         urpj5hSJ4L2vnoU4Prlehy3e7HztjMlVsz9dW/DMFRXbWCLOw4AfXzjJDHEgHy1KYrfs
         hOAYYcvEUtVjBbfQHmZxkm8sl+gJuCpyknuxzJFvE72VOfGfzSadcw63cqY/p2Ys2c34
         MEZjNXbqSlrOmnfc8xjyouhrRsH6KF84F/ohWtevjUKQ9/blsqAcD/Zze7NigXWcW5YN
         Lo0E00nC8evxj/rXpzDQ3Lg2ku/TgP4BTUX+DQFUAf4CXXKSyiQlJbuL7ncHQgT/lnbT
         YclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773315730; x=1773920530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LE+t+QqJAI+/mgc7W1OIUYrBRVzqbLNj9RJHGrZKK9Q=;
        b=STTCo/ekDmbEOQMjHr0ABk05bpR8DkQJ22xYvkQFv3F3mW0IXW6odoFQs6P5tTwwbA
         K8+vmQz2WktG9C8eiwNoeYOLGBdnG4cFVnVVs4bJrLSvpBxpWrQ2vMbjYYKnaAyyOOs4
         d4zDetZMdDT26xiE6E/SfTQT7uY3PqqXHhoKUFoQzYLKaUJrNLzIUDiq0ydSwkYxWFxG
         J7Zzn9yo/3JOxtTNw8dDHHy+q8/YRoHfAcxS2SH2BW61zL935tGTHl+LtL9hLBj5Mqsq
         kpE1rerCjStCZZrwGjFy1veP3i3l0TpqXKj5prh5bHxb9U1kkXCPWcQ3cjoTce1SUqtG
         4SiA==
X-Forwarded-Encrypted: i=1; AJvYcCXqxB8ieVFzmh9A0K9xvPQaU6nSJhPR6CoM7z11ABVY53IjXhItvZZFRpub+w+6SJIl54Jw5E1XPXMsoG55qtU9@lists.infradead.org
X-Gm-Message-State: AOJu0YyIxaZI3LQEEy1SY4if7BAUJXtFF3WwsP618fT40HmGA9gfdem2
	diWRc2fPDO23tsHtndvuq7faUNwsGMrALc9du7jLt/TX50U2QtAksC27rmOq5Y3JwO/Xnc+ZCPb
	xWy2ZxWyVZGiap8QtkfFzBOckZzUDSdJReWcfn4dtKvEZdlc5eL+QfpnrgK/4lYPQkXkLcngiMP
	OUow==
X-Gm-Gg: ATEYQzy6DencBRBrniY90tD86hRgmjCB7m1thJTO/GUdDxgEb+MHtrTVMxpSlLPt5kA
	rI3AefcKFTEBARrVCAWEbyA7VLjYW6Ma0dzg/vDBEbaWodZAOxs/pL4ODkWw67ce3Qyh28DagUc
	8UU6UUyEIhcGuBRCz1uQlKZLe19VPhGIrQ4fmHKN+1QQ78zlJ1Jpm3HhamE7UtaLTPCyurzDJPN
	H0X53rGE/LAKTKyKzTH3P0JKQcyXunqu7f5znV2AK5IWkyZcgHwGw7Vxxz4TgWcS83dH1lS9hx8
	zDXaEMXm/TtiE1itrlYCh+hCMfEzXNMMEC9ECwsjeSVto5LHIL9pH4iTuGPVcIluBqhRRIiOxW2
	v5qpf1vCywJIdfXtHDRK0zt2FFjxeWyMsgxNCOENcMSSy4O9wGPkGrjQVIg==
X-Received: by 2002:a17:902:d4ce:b0:2ae:47af:3b29 with SMTP id d9443c01a7336-2aeae92124bmr54674075ad.57.1773315730426;
        Thu, 12 Mar 2026 04:42:10 -0700 (PDT)
X-Received: by 2002:a17:902:d4ce:b0:2ae:47af:3b29 with SMTP id d9443c01a7336-2aeae92124bmr54673835ad.57.1773315729939;
        Thu, 12 Mar 2026 04:42:09 -0700 (PDT)
Received: from [192.168.1.10] ([38.254.186.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae22217dsm53886225ad.4.2026.03.12.04.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 04:42:09 -0700 (PDT)
Message-ID: <ce25b963-0e8e-4411-a406-7b466eadb1f9@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 17:11:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/3] of: parsing of multi #{iommu,msi}-cells in maps
To: Bjorn Helgaas <helgaas@kernel.org>
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
References: <20260309210506.GA589665@bhelgaas>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260309210506.GA589665@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oGv6AJf_bmSp66r5fKX6BUGIunJAypX0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA5MiBTYWx0ZWRfX3eLP9HgEYKVQ
 sHTK6wdAwSsVHVl4NXVNq9RxBWT3jw8c+19SqLkJXUbkblqvyAi6b6FzuZzxlTZR+Yyt17nabys
 9+iW3oinUAMNBP4Tk+nYWZ8vD+MU09YChvPgfR2mWfXBdPPOWlHBsURCmPbMYc8+hcIYz6LsuUG
 Af4HI3CEmVjBmEnPC7KrLIuHtQvDMxaWCfMfy+95f1O08566hH9zGNgd9uzG8cw1F6qbgcwjKWd
 Gq08EnWkXbFVU+A874rp0opYwESHet9cZMMqwLbqqIJ5WLr+IfhDmM36G83If1YenvR48N+Gime
 2WwOriPJSYj+H14d+K0hRHqwGVOMts7eFQ9OyqSP95VwwjmHBASmDSX1URHFTZrQd+UNz58GkaL
 82n66CD75w7RHhXApjKed1qRuujiPkBw1cqN5uEvGUEG2hjgh/aGk1IiC7CYOJn5lM28oWuwy81
 cs7Aa+TWmDjVju3dMtg==
X-Authority-Analysis: v=2.4 cv=YucChoYX c=1 sm=1 tr=0 ts=69b2a693 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=FuYIH7Xx0xzBSkYrynBYgw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Iq-Xo7JqGUrbNy38CdcA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: oGv6AJf_bmSp66r5fKX6BUGIunJAypX0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_044211_821777_639692A2 
X-CRM114-Status: GOOD (  12.49  )
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



On 3/10/2026 2:35 AM, Bjorn Helgaas wrote:
> On Mon, Mar 09, 2026 at 01:03:36AM +0530, Vijayanand Jitta wrote:
>> ...
> 
>> Charan Teja Kalla (1):
>>       of: factor arguments passed to of_map_id() into a struct
> 
> Please make this subject line match the capitalization of those below,
> i.e., "of: Factor arguments ..."
> 

Sure, I'll update it.

Thanks,
Vijay

>> Robin Murphy (2):
>>       of: Add convenience wrappers for of_map_id()
>>       of: Respect #{iommu,msi}-cells in maps


