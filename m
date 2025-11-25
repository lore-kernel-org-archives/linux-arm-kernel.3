Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905E9D0E6E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 14:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdtGzIoGcsgehrQYj1xofUWFHq7b2VQbVK64G5NpfMg=; b=Hi2W+joz/IJrEdXZZVLJIR5GUR
	5LFNv2Ey7eNu7rauj4h6Jhtjjn1Jyrn0BQOCMSH09E3UaFDa0bVdzxDyRk6Wt+D8/3kLN/2lozkLo
	vKuljvXn0AnLX4W6NZeL9TevTNqa+kAzjJRoTytxAH8HmVBZz4NH4ibYvfDxojuFbLllPYGXX8NzV
	ehDt/H7T/AFVKrza7GPCWXi+Jmj6GCoElZcsylTVe8xe2RgQaemWYp8HEDIOiInYQQ1Qyo2FGfoWj
	y5uGVu++nHKBDRmbJ8tCa+xFsf0FHu2wdHR39fNiDEV6TbV2U53+3wnFcO+7S3WseSRP2EGMViEgr
	M//NSX4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtlW-0000000DPD0-0JjU;
	Tue, 25 Nov 2025 14:11:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtlT-0000000DPCd-347j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 14:11:33 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APBKlkR1672147
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 14:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KdtGzIoGcsgehrQYj1xofUWFHq7b2VQbVK64G5NpfMg=; b=iiqUOT3OsAvsfMiI
	eLJntZ1MaBHzYT2msDVKHkBzZoJ/mCg2JwUIWKvOIAud8MV6bp9WGgUfHR0/aBG6
	95dwn3eaC8j/m3w5oPgdHEUT01dgNKxcLUYqC8x1d+LGoY/ck/GUhW6lrJFv/oFa
	jrNZezlxcSGqeUT+FvwIXJHvnebxrpJkcK3WEfrxKJ9EgWgrub6qJ/yeUgi9sqdy
	AAMncwwzwJAI63e78Dho3IMMFEf3C5+4mhL+o/Rtiagi+zOcVB1lC0RQLvp9FEJr
	UAG8dEaV8XakIVPJ5QfaU/a/BLlQ0et4OF5xNGySj7DYii4LKlFt4LnfA+6gnAnn
	HuVlPg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an5w81mvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 14:11:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297e1cf9aedso135577245ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 06:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764079890; x=1764684690; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdtGzIoGcsgehrQYj1xofUWFHq7b2VQbVK64G5NpfMg=;
        b=VcYJu6mYErQ7TIFAae43UMmucg9L+oNGFAK611QQ4APtF6GuXWtObWqVh5aOZvc1Mr
         /EFd17830WZwk+Iv2DM4w+r2MwMGBAtn/HTk30Ko+rNS6Ok5AxDfqYlJgDuhE0jctQQp
         J88AcO0aLg2X2H/MLzt0HhyqjfD5DpPsuSbiLBZZ+aJWgh1BHn11vkCk4oOl6h4BcOzo
         kVD6px1dBc8GG6lC4WcHkcvD0x13ZeGoi6iWGMwT6Cp4WDs0wGHXxy+EtL+1FfPvG+9W
         555YzmyGEKZJxHPtlgHCt46bDbBRIB6Ql5vlkYtzgVssp2T/O+6mPjRDLToNEX6Hb+GP
         oM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764079890; x=1764684690;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KdtGzIoGcsgehrQYj1xofUWFHq7b2VQbVK64G5NpfMg=;
        b=sdLpap+wYDmjzFycCEWVixEvgxEfTCrgZRdEUTPxbKTvmGc4TK4E1mQOhT5c3CEZ8W
         vLDSBUeTOs4eQZmbBmRn/+4i6Q70SMMShZuscVkJc6XOrm0ec24UEfecVM/HPBsryRpD
         skDllOc5KRY5uFvx4xFYOAaBZmykCL2PXmro1Te+r1CU1Rfc8rVGkI/e/FOMKPu55x2S
         VefFyKIJRLFeMWipUdSJYk8rP1DnkLaiTPbweBikUVmicsdN6mhN77s8NTw1ueDAbrvJ
         Jc9cQwzkL9qw+M3e7qwIvdYYZo6f8pOaRwd+dIqDXhEyscNu77H3WPk9X5BNhAES9dZu
         sPRg==
X-Forwarded-Encrypted: i=1; AJvYcCU5zLmVsEZj7ADzuRRmPSh0ok/4hQzFcbTKyBrEE+eouc2kFUiu7D7m8fcNiDAkHG71RCnkJwliiuiEGvrKDlgt@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0hVhjaGiC3D3kDhL/TY+7kkG+Rix9NGAMMAvRRI/UV/cQbsu0
	nCjRSjWVrauGQXtzempIF4mtKJb2F5MHH67iELumtuN9gU48wl2gtYetL+gSXO6/Gu4Ztdd5Kqq
	xCWaNjg8e56z2UrR/lK/pngEymtbgmEq4fWEzIgPtsN7jBHV2KoMmwcMAtrgVCIAOxSiuUqiLo7
	uprQ==
X-Gm-Gg: ASbGnctha9j3PAAfPuK5jJ61wu6kEu0Km/cxvvhsoxJQyQzRxjQ7NY+eBStDCAZJTZw
	bR3yDEl37HvGGp+/xqRVWQZD8LVhxFAlmAC6I9B8dFnbWnzdw9KxPfzw6kVz1koova5ri1kSfpZ
	qeKYIVvb/FBqZOcHxQX/kCYsc48JGsHXgMHmsdOWGAoAjAtkJyd7C0Gh4WRTyNG7x5GQAXzbyst
	Jkn2i4+oj1efsEvQlgEBCbxiVzjyLE5NNrszNEA8lNFU9rvzzdhkOOIeQm90wgEZZFyKg6Xz6cA
	TuEkO7noAR8aFvDUOQEfy4CAvnDIHqo3a5sLCyiIBIW5AKIZXytj4eXjGAr0prwrbVkWTKgqOSy
	DPewKOgre
X-Received: by 2002:a17:903:986:b0:295:1e92:6b6d with SMTP id d9443c01a7336-29b6bf762e2mr179884435ad.46.1764079890258;
        Tue, 25 Nov 2025 06:11:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDdJzjmEfULVH4U40vj7hFWYZbDC9ldO4MPl4fLHvCDnTdfxPW+aFnKkbKvy6S17W0LV0gBg==
X-Received: by 2002:a17:903:986:b0:295:1e92:6b6d with SMTP id d9443c01a7336-29b6bf762e2mr179884025ad.46.1764079889763;
        Tue, 25 Nov 2025 06:11:29 -0800 (PST)
Received: from [192.168.1.2] ([2401:4900:88e8:55c:689:49de:1265:4666])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b25e558sm171977765ad.55.2025.11.25.06.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 06:11:29 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>
Cc: Radu Rendec <rrendec@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>
In-Reply-To: <20251125102726.865617-1-maz@kernel.org>
References: <20251125102726.865617-1-maz@kernel.org>
Subject: Re: [PATCH v2] PCI: host-generic: Move bridge allocation outside
 of pci_host_common_init()
Message-Id: <176407988578.155590.11732737188227682700.b4-ty@kernel.org>
Date: Tue, 25 Nov 2025 19:41:25 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDExOCBTYWx0ZWRfXz+k69POxSPeB
 5gV8vZ3KBh3jZUW64ylCXjSLJcqMdtf9mnVCBUtvkrPDnvtSjkr98uEFuxpP8DEYAjuYsMiVLpf
 +OmdcXinNUd1lGvIVMGfX7SyFccM4XBijA/2vlmkcApriGyNV6sT/N8u62lssSmbyPBar4jKhcc
 0dM/o9mIrtQLwHAU2rJIlfFZuskQrh3UHDHLf9Jx5kN4Zsv6BN3BMH/Hvqij9+hP0c0yVT7J5KX
 NJzAp6XVuXVK1BiLtqHFz9yvnGW8G9YO9yvH8ZOkYu7sYHZRJXvqXVy2IqtdRMPopDL9ANzZTcu
 Z79P9vhLocQfHSFh59G8FxtQ1LXrhVezAafFlCs+geZzpcocejcdFeQborgC7TUiYibJ3apjlAU
 GeETFMzocD+r3JaBPvqtnKbHn2apNQ==
X-Authority-Analysis: v=2.4 cv=RvTI7SmK c=1 sm=1 tr=0 ts=6925b912 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=M9iB-ojpKhN3dxfJ59YA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: Lb7K9whu3TavHlGwoe0vSkQUerh0pi64
X-Proofpoint-GUID: Lb7K9whu3TavHlGwoe0vSkQUerh0pi64
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_061131_802833_E74D32C4 
X-CRM114-Status: GOOD (  12.03  )
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


On Tue, 25 Nov 2025 10:27:26 +0000, Marc Zyngier wrote:
> Having the host bridge allocation inside pci_host_common_init() results
> in a lot of complexity in the pcie-apple driver (the only direct user
> of this function outside of core PCI code).
> 
> It forces the allocation of driver-specific tracking structures outside
> of the bridge allocation, which in turn requires it to use inefficient
> data structures to match the bridge and the private structure as needed.
> 
> [...]

Applied, thanks!

[1/1] PCI: host-generic: Move bridge allocation outside of pci_host_common_init()
      commit: b1e24e05e1408602d3414b95031242bbaa72226a

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


