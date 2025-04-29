Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BBCC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 19:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZDZI43E332yNRCJFIwANBWoXEasKU0d/26e/2xQtgs=; b=Xf7sbZHW1pqYZAqHAUov3rOgPv
	Gt/ni9grFuA574vIKxF2tl4dV9HnZ9RdrVjIHhicW7zeo7otrzsu34AgwsjT5A8Q7enQu3fgreXcI
	Y2dGuyJwrC4HGO/H3gEPnsDnMDmt8TMPcY6c9uX/dRBEKoJpDJ67DklG4m6sGwso+tYZ9X/W9osuR
	UpsADR/2Zz8MkxDay+ZOanSUn9b9Csy0mjA5mS88MFO5ssVaipaBbcOK8n98SjdiMIABaaNX5Vhtj
	hJ49/4NY29Eo1fgt+K9FhloFC1Xr8w+zZ14gzPLbro4AAINbxV8OsPIzox7nZZMoHvBMMyWjLk/jV
	VPx3GN7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9qcc-0000000AefG-0o1D;
	Tue, 29 Apr 2025 19:28:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9qaf-0000000AeRY-3TYi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 19:26:03 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA2GWu015302
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 19:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SZDZI43E332yNRCJFIwANBWoXEasKU0d/26e/2xQtgs=; b=o3eFeqyZdPLFuCuH
	mP7nN9MEbhQ+Mt8pmNMbSPMTt1IvhBiQzblyX1+x3ULG0XB1A+lB/aoNc3Ht4Pgq
	DlJ4M/1r2Ctd0FG1W82odOgUwCgjimm92UfF6YNB/KiCTuFj95eCRUFib32hij9U
	ycI7pnmb5QjnW/ZqIkqWaYYpcI0sVq2Bb5O3JPKiBy3x93oPJjd2pKylQcIpjlbp
	tgvWeTUtS5hx81RgYui13cn413QQPZ6mrXy45V6FLtvuwArdNbifm/fjn71LrwAL
	nIQ6OeFIlrqhpko4UqwJ7U2DeZ8UY8TDP5sWorLJIkLQ+SD/UBfQXa/nNCDYDiXI
	p+9Ugg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8hvjfg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 19:25:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4775bdbcdc3so14521811cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 12:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745954759; x=1746559559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZDZI43E332yNRCJFIwANBWoXEasKU0d/26e/2xQtgs=;
        b=FfYfdAIuPvBLVqswJYdJyfjv6zWYx+MOvG4TYpPCq0Or/I3Nazs4JMWGlb38ZTZ3M+
         37hh3LQCPzsnYLO5OT5z19dxKtvTpGSy8CmFNMnMFT/fC4v12SzwHIL2xsHdP7If+M+n
         QNSMFlPHv+wfODyZUDAQwAA7r/U1Ns24fvyFBHZQ2v4nYkz8HJZ7HlGvmEcvDmUovgcF
         DYGnLe1rFtRrUz9zBTuTFWjhVcAIJkTwUWE8qgXO0/gMGs7Ol1KsmV+p3dyk9xtaHmV5
         0VQfdTPdf/ntCubvmVMyHZ2UlugPEmMmgLfR0Co3kMUMm6MCyKufabGIP6NNSArLB0D1
         Kndg==
X-Forwarded-Encrypted: i=1; AJvYcCUrnzKdYLVlTKGYaC/tGNxFmYH0tgpuzNPtcNzAQpYD8jb05iBpLp9VZTUVq1Au/4LEbY4lK4eyLtM4GT2FHI5j@lists.infradead.org
X-Gm-Message-State: AOJu0YxwZmG/A+NWN58q5LoHdsZ40s6W8rIvp93R5scmqnOIbqykznSj
	BzSqiNHiP/rhgmnQMMJAA8e1WsyH1/owTEooF1fW+f+2VnpMvnwjtnVLbXCuKUhqGMX+Nr188zi
	nIwsPd7PN7IAHOUM5QUOtKlNgsF2anvtkwvvjEltBqfag/X3hcTlRGzntuIi8OBErwXRw2BCOqQ
	==
X-Gm-Gg: ASbGncsBZN4zafT2fibiiGUov1JBK3dUMdIZqFJkksxvVX2gc9BtN9LuyCg0vvu3slN
	54fhwA3/VcMamXwjZTGRc2MhNvzqPhbqtZ4olNDVHaoA0z54x456ZxrGb3gQoY+mf5ScepcnKpf
	22dZeJPnZwjHUfW9PAxfeV3S3bHY70VRKqHcZOMSfS0jhBSm7vEtFTibLNIwBYvlA/xs3TW9hux
	2rr4nk1rgTCyUtZDBjxMn/cropbl4b+D8u+2FBb2cf6v6hgp6QRd79fMCFfbWjMtMroP1ArNi/0
	Gav1+EY9DLnsm96VxTE6SBeVeXbZG/9AtIw448+rdQnPrCZawGmVy2JPnyj1qhGBZw==
X-Received: by 2002:a05:622a:1490:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-489c445ca44mr1384761cf.8.1745954758655;
        Tue, 29 Apr 2025 12:25:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeCpvJWeqZH0ttcvHHJ9VqFEgyci4j9m5BtdmVr/zQ3sRean1THCu8ARbeAV6i3mZ/LHvo8g==
X-Received: by 2002:a05:622a:1490:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-489c445ca44mr1384561cf.8.1745954758152;
        Tue, 29 Apr 2025 12:25:58 -0700 (PDT)
Received: from [192.168.65.43] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acec0530c37sm225421966b.136.2025.04.29.12.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 12:25:57 -0700 (PDT)
Message-ID: <da8f8506-edbe-4a4a-bef9-29126d3e5c04@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 21:25:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: SDEI: Allow sdei initialization without
 ACPI_APEI_GHES
To: Huang Yiwei <quic_hyiwei@quicinc.com>, rafael@kernel.org, lenb@kernel.org,
        james.morse@arm.com, tony.luck@intel.com, bp@alien8.de
Cc: xueshuai@linux.alibaba.com, quic_aiquny@quicinc.com,
        quic_satyap@quicinc.com, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@quicinc.com, kernel@oss.qualcomm.com
References: <20250428095623.3220369-1-quic_hyiwei@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250428095623.3220369-1-quic_hyiwei@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: z1Oob557YAkpIYRCpImWXGYJXZ4GbYwz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDE0MiBTYWx0ZWRfXwfcys8zEQOxq Rmim23bwRlefNHiov5qh5wXXfvfH0gpG5ond96S9FtnpyJmW3f/BLRpUr/n4q8Sdh+Vh81Obzgr UjY3bH6cfecjwJilJS46tCYbTDD5AXmuq/2bJJF65FR6UTATzrSfln8eBstVLOtBElmJN/kwVf7
 l9fjnWeEQo+L8DZz5Mt1PZSwjo1A9+h2SMBHJHIIWkd/nHl8Vj83GOoDGGRsBK92UMd6RGXTU9i vVzjfRXjRlPNmjnrpjnk6ZH1ONqlgKqVkszvLErkp+8PJpce3RkuC2m76shiQVo8mqNJOaTyu0e 4m2t9Ylt7fXmA1HqOm5s5wtP7Fxb8OZ/WYl4KAlZ5JGKv9k515vbUqRoJluO26kMTghw9wuh3uZ
 xdDa2sEjU0dui8MVznep5LwzVR2QORXCqaB6mjaax1nZ1gBIKiBrjotXPoQnNRTUV8UoKptN
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=681127c7 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=SRrdq9N9AAAA:8 a=COk6AnOGAAAA:8 a=uYIpP0hKP73jGhetqrMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: z1Oob557YAkpIYRCpImWXGYJXZ4GbYwz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=898 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_122601_875545_6C1384FC 
X-CRM114-Status: GOOD (  16.04  )
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

On 4/28/25 11:56 AM, Huang Yiwei wrote:
> SDEI usually initialize with the ACPI table, but on platforms where
> ACPI is not used, the SDEI feature can still be used to handle
> specific firmware calls or other customized purposes. Therefore, it
> is not necessary for ARM_SDE_INTERFACE to depend on ACPI_APEI_GHES.
> 
> In commit dc4e8c07e9e2 ("ACPI: APEI: explicit init of HEST and GHES
> in acpi_init()"), to make APEI ready earlier, sdei_init was moved
> into acpi_ghes_init instead of being a standalone initcall, adding
> ACPI_APEI_GHES dependency to ARM_SDE_INTERFACE. This restricts the
> flexibility and usability of SDEI.
> 
> This patch corrects the dependency in Kconfig and allows the
> initialization of SDEI without ACPI_APEI_GHES enabled.
> 
> Fixes: dc4e8c07e9e2 ("ACPI: APEI: explicit init of HEST and GHES in apci_init()")
> Cc: Shuai Xue <xueshuai@linux.alibaba.com>
> Signed-off-by: Huang Yiwei <quic_hyiwei@quicinc.com>
> ---

[...]

> +#ifndef CONFIG_ACPI_APEI_GHES
> +subsys_initcall_sync(sdei_init);

I think it'd be good to leave a comment such as:

/* Initialized by acpi_ghes_init() when ACPI is present */

Konrad

