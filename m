Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F643105A589
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 11:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9ejYWHNwRhjPiGAgnplcOS8lPIHbm/6D31/N+auTSw=; b=GvIuP3pnxGoqmTcE+nxc2viqa3
	Lp7JRFe8QntgxLVxAV1s+vH7t8hIy/ttwf7N9+DLUSUcx2mppuKbON+JpOBk+5DSlq8anEJc0KIhh
	43w8PJVjdJuuqzTgcbOCDCwv1TXLJ06C6UPm330ebsJ0RJ4ps1R5UJNHxvM/9BbZSiv0KOpVJy/67
	WjwB5qYRAcu4LZukZ5jqtQ0xTD6aVIndGquO30nzohV9+bdAKL3cl7bZAsXOWW4oPCrk2B3SKQXAA
	L48vwr8fd1BXGvj9jQuWxukbrSeNaII8C7FCYETMVCPKdZq0enuYG630VH3/UD2NbkWVHCWJMRMnc
	F+zHirJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eRR-0000000Dyne-1Tfy;
	Thu, 12 Mar 2026 11:43:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eRO-0000000Dyn6-0wHj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 11:43:00 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CALZrd4026924
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 11:42:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W9ejYWHNwRhjPiGAgnplcOS8lPIHbm/6D31/N+auTSw=; b=HmaP0o5E8kDigSFa
	alJVniCiNF7DjBpO3slqiNJ3tC/PYMDuDwHYrqAZ6m3faf3xBUSqMLfpUEiT0ME7
	uWWAeSVIZ60cNAHJhwuo6Vb8dOptnxFIZD2ZPlI6SJHGh0bEalGe5AilAQjBoaDU
	QZVlr/4PFlZA2kIerIpl0o8Gs05Rqi4LvYe2xoN8EAgrInA5+6ymKHj2jVoDFZlX
	twDN9GpYJxK9TErk0jdzr2qqWM7kBKQCbwArOlfCHOrYnIloY9u/so8cENTOFlPK
	42iYYDiTfRSrfY3aZO54lNm32900MmfmU17DmtlRZIiqhD4bfqXTlQnqegCK9Mod
	59ZCww==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh54swrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 11:42:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aec784479cso5175755ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 04:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773315776; x=1773920576; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W9ejYWHNwRhjPiGAgnplcOS8lPIHbm/6D31/N+auTSw=;
        b=LngTXnQE28EwIFMEvj+nRXJXj+QFhuipCQNa3T9IJJ4sCNvaMaqw2JIBPSBXJQ6QVk
         TiWqZH5/Mtnkhof2FlvSfqpFDfalW5b8yjuK4GMlQzHwywoEzvyxG69LD1MKmdsKSqUS
         eE2X1qhtjNQRqE+ZHRUFLUT5g9uNwOnP+USJ7433n/vPXHE0J6t9ByU9MamYVVFWYoF0
         zNt77OayAUsUQDklt1hV491P2BUYFT1O6t2iBTEFgGDT5zDQRwOnjlSuqgSV2dmOttym
         7MzQS6dpcYocxReOmlSspMkgnuiflAt40CUCcUTpkZbinRR+YPSGnjOHQT488qYqMvY8
         ii0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773315776; x=1773920576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W9ejYWHNwRhjPiGAgnplcOS8lPIHbm/6D31/N+auTSw=;
        b=j0bft3RAzQwVi5QnFs49SPtcyzbTRQgNAcYurKdT34vhm9Ge416yoi739IQq4zWIV2
         VaLeU5UyDAq8b2YPDi6S9QP6+31nqEh4FehnDFa/MByc+8AEkwu3bbjnJkEFaWS/YzaG
         /DwO7aRHamMjyExgLADpY4iBSCsStf9miN3QYZxawsX7NIDNZsIXP44HtLI+NZx02gMq
         7jAAK9DjeSVTDrnNHhU9kKnTor59w645H4xrcEmOFl2Vk4esgllsBtEW7RpIe+SjxwJc
         FNqFmnAvhc2NZWcVpqRMsYCEGg+09IOxB9W3cU+CFqGl08p/qbYysHDWAs9101pCBMrb
         7ShA==
X-Forwarded-Encrypted: i=1; AJvYcCXL/qaJl4ihdcZJHW7j3VYtjIqr0WUGt50XF8f10O9M0En3RzO1H4Kk7TMeyv/GZ4vD0tf7Apjss2Cx5J4IwFL6@lists.infradead.org
X-Gm-Message-State: AOJu0YxHFuBJv8O0i4M6BQyfUmkK1MjLhSn6Iy1NJyV0/hDoikIEfepi
	EkspbP/bv8XcYlIO7xPvDp+nZSNvru8Ddy8KAHSY0x3CDBJEVJ7TQ3getHAqpiXT/Gh43OxRIM3
	mwkprQqu32DdBmVcZeX8fyiLOyKCDi3fOkPrHppeCW0sz9RdoAFvRtcxutLzAGybEIYjF+tqu7l
	yTCw==
X-Gm-Gg: ATEYQzxRyiE5js52oVXK/cD2k/3CJNxxbgEmqOewrXpia1TMIssqCeLrMQusTxXU8jt
	1t8oztbjjbCS5fownQFRPG4RJ6zfT7ASb0K1z5XTMxlCqVY1mpZ+glDEi/2p7epvNQ+uBNOlpwz
	qD+DCVTVlmkSIrz3vLt2+wUTgJ4iNJSyYkgzR6oDsd2VUEOe3hpA6Dzr42RHqthp8+P+b1k2v+G
	kxWsvC45Cq0gcqLV7UxtWS1Nbe6vBlimu6d1b8uORG24oeYbOgRARUIgMh/QD67GtPctKYEbXaE
	Ahvq8V6eXj30ezuj5OlTT18UZhRipYH/Z6hYdDfjU+AMgPROMHaegAU5QbalUE3OazeCppJMsxC
	7MIUStj0CizW2JyLIGpxuMXoq/4RpDhkUjy4tijOSmtQ7GDDTrgRx+zdcew==
X-Received: by 2002:a17:902:db06:b0:2ae:3fb2:ec9a with SMTP id d9443c01a7336-2aeae7ad446mr64958925ad.16.1773315776356;
        Thu, 12 Mar 2026 04:42:56 -0700 (PDT)
X-Received: by 2002:a17:902:db06:b0:2ae:3fb2:ec9a with SMTP id d9443c01a7336-2aeae7ad446mr64958285ad.16.1773315775895;
        Thu, 12 Mar 2026 04:42:55 -0700 (PDT)
Received: from [192.168.1.10] ([38.254.186.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae25cd67sm56194955ad.38.2026.03.12.04.42.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 04:42:55 -0700 (PDT)
Message-ID: <04eabe08-f339-4d9c-8b61-184241d192a4@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 17:12:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/3] of: Respect #{iommu,msi}-cells in maps
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
References: <20260309210849.GA591344@bhelgaas>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260309210849.GA591344@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: d7EzmBdRtfeBk6ucnosHVs65RKC4TIFk
X-Authority-Analysis: v=2.4 cv=BNG+bVQG c=1 sm=1 tr=0 ts=69b2a6c1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=FuYIH7Xx0xzBSkYrynBYgw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=2oAOsZZM3GA0Nya8fkwA:9 a=QEXdDO2ut3YA:10 a=d1F_yjlUjjEA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: d7EzmBdRtfeBk6ucnosHVs65RKC4TIFk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA5MiBTYWx0ZWRfXySYq+2ZjXnV8
 2snY7Qetq/w7+49Ts0N23Lsg4gEduUtxA1lq4gd+A4t6xgzzIY20Fqs7GqtEinFTIuClmmMgaPl
 nZK/X5XbPoJThDp+bfCSHDp/TIR/ESUodQEaw7x7hE519kPblJhakS7+BEH8aSA+Veb1WEK5E22
 gOwr6wTOJNju9lsyw1iMnQ0+quNIFkXaNPoMzr9/KFkJq1GhAyKEhhGnu8tNuI58Kn6ve+jfr/g
 OQgRMJmxbEBEe/sPoESDdLgmGHzMsp/jGOoYljj2/wqG7Xaz2WpA15MtTmzBmZhHN/DW0wychYf
 UX1aPqdAtzw8PMaF/WkY8DRouivAxvnzcPCIz3e5e2GsuzjcXFoZvASUbeP/Rx9SRT1WNlBAkQm
 kHZvgaNWa+qVFGuB77mo0EdcFSAFAzoyjyaExCThtyw5aCGYiFpNJfomemFk9bCK8qNtV1qDKQ+
 9ftKIPRkG1TrlvyDO4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_044258_761109_09F8F5E9 
X-CRM114-Status: GOOD (  10.58  )
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



On 3/10/2026 2:38 AM, Bjorn Helgaas wrote:
> On Mon, Mar 09, 2026 at 01:03:39AM +0530, Vijayanand Jitta wrote:
>> From: Robin Murphy <robin.murphy@arm.com>
>>
>> So far our parsing of {iommu,msi}-map properites has always blindly
> 
> s/properites/properties/

sure , will update.

Thanks,
Vijay

