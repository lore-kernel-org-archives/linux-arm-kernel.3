Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977B0C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 23:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76Jhh4fUvVx9+AeTNo/sVtcgC9p+Mf69ylluqkqvljo=; b=S9eQsMEwtwTqUHMiRNUgjmFogY
	1wo4aMyWUeLyReBj1+BByjYbjsYZVX7+GY5iOhlPmu50HtLoBLYliJGhXAkXkSXClz9wjv6txc/N5
	r1cBzi1zgEA6r5n66JidCblkoMBbKr6X5dytLqw7ga0W5yL3A6SjLIdHJTDI1+iM0hlBAao3nKoJP
	B3uxOy88mHJ6qigdqDDah2K+z8ocTqc0QRpHvI8+ozxUtBxrbKQx9Imoe/xPcQofC4HPiwIDTDYZn
	x6HLNJU8Qcp2SeZi2D+mYrDOFmSzPoBDIpuOdC6DPXtwQ/ST5HHeGZJeq2MPSBY2Cffk0Jkoj8sqU
	Tn83UyWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn4DT-00000001n3N-2rUQ;
	Tue, 25 Feb 2025 23:19:55 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn4Bw-00000001n0l-0aQH;
	Tue, 25 Feb 2025 23:18:21 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PMZ9QH005739;
	Tue, 25 Feb 2025 23:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=76Jhh
	4fUvVx9+AeTNo/sVtcgC9p+Mf69ylluqkqvljo=; b=BdTVLRx21vS0X4QPrpmQP
	gxjS/9u6fRZyE4Byg4vfc4YlNFidlfoumJZju1fkuHNLLO1iNYkhNTapIuB3JcVC
	GZN2FE1YB22Hc23UTdd/dG47rPfuY63dJZCC/MdwcDraA5OJByued2JFhClzIA7X
	3P3yeS68ikYiu72KvZOPVLT5WJJhbwMhTZbIXCD7FYTlg85nwpyp+1N09tE3w6zU
	Gz63B0fW+JuC1Dk6yyikq1T5EzOkevrpRXRXA7RJnfN/W+SgwWC1YGNDE42HtdBG
	Ictnn31S+NQnM/Y+yhjWFsUKT8/cl0DLh2J/jtJERBVvv/2Xsc588act3B6Tkdyc
	A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 451pse81tc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 23:17:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51PLIQm2025216;
	Tue, 25 Feb 2025 23:17:48 GMT
Received: from alaljime-e5-test-20240903-1847.osdevelopmeniad.oraclevcn.com (alaljime-e5-test-20240903-1847.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.250.206])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 44y51gg9ht-1;
	Tue, 25 Feb 2025 23:17:48 +0000
From: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
To: jgg@nvidia.com
Cc: alim.akhtar@samsung.com, alyssa@rosenzweig.io, aou@eecs.berkeley.edu,
        asahi@lists.linux.dev, bagasdotme@gmail.com, baolu.lu@linux.intel.com,
        dwmw2@infradead.org, heiko@sntech.de, iommu@lists.linux.dev,
        jernej.skrabec@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
        jroedel@suse.de, krzk@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, m.szyprowski@samsung.com,
        marcan@marcan.st, palmer@dabbelt.com, pasha.tatashin@soleen.com,
        patches@lists.linux.dev, paul.walmsley@sifive.com, rientjes@google.com,
        robin.murphy@arm.com, samuel@sholland.org,
        suravee.suthikulpanit@amd.com, sven@svenpeter.dev,
        thierry.reding@gmail.com, tjeznach@rivosinc.com, vdumpa@nvidia.com,
        wens@csie.org, will@kernel.org, willy@infradead.org
Subject: Re: [PATCH v3 00/23] iommu: Further abstract iommu-pages
Date: Tue, 25 Feb 2025 23:17:47 +0000
Message-ID: <20250225231747.15277-1-alejandro.j.jimenez@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <0-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
References: <0-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxlogscore=987
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2502250137
X-Proofpoint-GUID: Xr02HcGTinEg17mYvbDuWPbxj8NLDu8q
X-Proofpoint-ORIG-GUID: Xr02HcGTinEg17mYvbDuWPbxj8NLDu8q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_151820_179988_F37697B5 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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

>Improve the API to work directly on sizes instead of order, the drivers
> generally have HW specs and code paths that already have specific sizes.
> Pass those sizes down into the allocator to remove some boiler plate
> get_order() in drivers. This is cleanup to be ready for a possible sub
> page allocator some day.
>
> This is on github: https://github.com/jgunthorpe/linux/commits/iommu_pages
>
> v3:

Tested v3 on AMD Zen4 bare metal host, using v1/v2 page table formats. Ran host
kernel with iommu.passthrough=0. Launched KVM guest with large memory (512+ G)
and 16 VFs. No errors or warnings found.

Tested-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>


