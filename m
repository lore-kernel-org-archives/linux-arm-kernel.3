Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA749CFD315
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 08:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gSauOwJJuNnjyPBbUyUtrFBoFmJO4GXnpVHS0oMoaj8=; b=td14OWaBm4OrHkkJ202vxzaIns
	1emRgEPZwXuYxcTO+0fh4RaDPowJAl0LDhElaZP0OJIayWqKYj1Pnas2yH8Mm32tA5ivDSp4LUu5z
	4n1eEYZzCF4Nvnhky0F7nsI6qHfQfuQB5YhE6/dNUiguj7ubqmddvFCPCtM/Wg9lHgKY/dFGqKcVA
	vUpkk02YRdlaPRCO+4paIYJ+gXxuVTdrIWdMLEAZ7c7U9SKIaVpgdeVOi4TerymVDvdYP6PqCnb6P
	5tMpxhMC83wlpeQC6zOnNhihceXOMxmOzoZxWZPcR/aCQAJPVnBmAuvQ69tesHMooUcZFxHOC9NY2
	amIqzwBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNomT-0000000CzkG-3QVV;
	Tue, 25 Nov 2025 08:52:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNomR-0000000CzjU-0D5o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 08:52:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2gf6Q1687862
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 08:52:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=gSauOwJJuNnjyPBbUyUtrFBoFmJO4GXnpVHS0oMoaj8=; b=iX
	j4TveuWpA5coXgr0M0TbC+V0Zo5MHtRXOBP37sjII5XjbKOYZ6ZEbzAfWO9M5KHo
	YduYESNZyBmpr9WSZl00qfsKxLwHsJ11pkiVdy/89e//SI0bZErQEWV9lImxPEME
	Apil+h+ckzGQTsoBY8BoF/FLRvgJsgaYpI87PZ8jWwQUqt4txsHfP5JcOwooAXXK
	LnaTdBHQr5V2Hp8ErRFpbR9aLnunA5GwsXvLeQsD6sbLNSXAaDNsh06mN80EBGzb
	fuJ4d9fe82m4Jfl56VZnt74ajgMogdNuD/AJg81VrtbGn9rC16wKq6OJkgDx0s//
	WRr8RGSCs223guPGki+w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amrv6axeb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 08:52:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34374bfbcccso4949776a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 00:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764060729; x=1764665529; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gSauOwJJuNnjyPBbUyUtrFBoFmJO4GXnpVHS0oMoaj8=;
        b=kRMMc7ImuYRxz7Yqg6W5d+lkcE+bZJJFA29h6I8UwvZv4ylMA6RP7rFj6LNzs57r9H
         lbn+MEpNLWwi6FPxEH8Ylu0HOyE1AoGQhyzeUO9Mz5X7yzsHs81rvCMHpHOX1yusN4cA
         FdPB7VK6VTd8bw4jzOmPLNeEiKuneE46dksDbOQUCYWTMVZGDurtXWHuxe8EUAV1UxN6
         foGsRyYUrsvefMRQ25Htq2lysH2Sy0HW8l4KmEcacJ5wVVpuJ3OJTPKZYFSvwrWALYbU
         v722Iwy7iVBvJd5NFOI/Y3gFPf6daifUEDBaDuZWwt35TJdTxopnbX/9kPP8psLZZkCd
         5ECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764060729; x=1764665529;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gSauOwJJuNnjyPBbUyUtrFBoFmJO4GXnpVHS0oMoaj8=;
        b=DDBY8U8NwL3DblAC5seLp6hEg9jGdKx1PWzJTXaNqzryWffpBtLU9Vwpk+5TY0tgRb
         2KX7NQ6rPJPPmIQ8ZFeYl4MIwQzXhwZEDhFGTSK4fS5NJTUj/2rSmAYE40jc0CrnKFay
         dDq387l8nVPHR1iQWXxbsfHz1iR+TPEzxcRKGg711/vllolA232B1uJakUWl6vlNjvhF
         E55QEjPu00JAG7c8+biUZVTZekbvBmSR6wcX1f0WoNUx1XQGpP2ZosU24LtsMbGllQ19
         FPSn691BNQaV8l7wM59Svb9eOr+ppXmDMXeSNLC6pBxilRt4GUFEua2chEnfemEyBPTF
         3V9A==
X-Gm-Message-State: AOJu0Yzjcghx2VxNQjM7nC1p1xgoraW8fGOeCPEZFQvUN8Yhpv3ZBjo9
	XJWWVpSDNqTkX1IokwWrIYQSZNgegSV+gffCT4+8tUGdJqqgYkqFWj6N9EWHDJij24uC+nWzR3E
	zVZRQNpMmVcMVGqz3QL7N5CR6ncfsN9Ax3Pd9HVEUmpBK/a00pSo0COpLBF+I/1nKxLWAQy/F9V
	ITeXwUdr2Fdw==
X-Gm-Gg: ASbGnctHzqFev6Ac46/mmIAEebBncoCCL3LNmEz6jMSISx72PSvfXBe8EkmHSxy08h4
	5XdoIjQerQndWgFjFYwD8Hi3IcbJMws2nEIz8/mnA3fr6n1l4M/ldqeLtRbjalREmgRV2zrmsHa
	UxfOAwAGg5wlhOGD7SqFhgl4jw/4CdZr9byinmqlZZT+Nk9zexkXNqHSMwSlIOyG3wHZ1TAzzSK
	/zRbZBlWdlQPCjEo06vd4mymIPTJUfnpqQuGfQ0/FDZHEI4cZhfXnuBeuDIaW4Eyy3l03CrOnMu
	R2YrxO6lUK9S6sWOPITqjPd/HzoOetTrzk/i/w33acSlZNMHBVOm53s3OYdvWrYyfe7GyCiFaVw
	FmlRr3G79egOPzp/oxCzn/OTQFjA+OjnxGMzbMDArjxY=
X-Received: by 2002:a17:90b:2587:b0:340:f7d6:dc70 with SMTP id 98e67ed59e1d1-3475ebfa0d3mr1890902a91.13.1764060729409;
        Tue, 25 Nov 2025 00:52:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqlg2GTH+sdvTW/Lfp7+v37BUjIzLIPd+XyOx92rIomrTFQY1YmOb+Absubbcv1hwpDBnbrQ==
X-Received: by 2002:a17:90b:2587:b0:340:f7d6:dc70 with SMTP id 98e67ed59e1d1-3475ebfa0d3mr1890883a91.13.1764060728893;
        Tue, 25 Nov 2025 00:52:08 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727a36bbfsm15991068a91.0.2025.11.25.00.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 00:52:08 -0800 (PST)
Date: Tue, 25 Nov 2025 14:22:05 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        jean-philippe@linaro.org
Subject: PRI support in arm-smmu-v3 driver
Message-ID: <1256faaa-e9cd-46a6-9a42-25aa74b984a8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA3MSBTYWx0ZWRfX3CtaShXpfoNT
 8F2W54CyVWWE4LPQV7B2UE4aqxCUzWMH+3wi2y6/8yDjfk9kfanioOgZMdSGzgcW5VSkly8MUFo
 MOk9tkkLJ+q1j6Zad0fKMQhlUKuCLjWsSCLH29lEAMFxtHoIccFVABiG/ZtKJ2cSZFiIt0BEx5S
 n6HoT9WBGWBsyVY8J2uRPp8mrcVI1RrSzlM4aPk39KuSrGX+EPM1XXIkPYYHd5P69jvxqVewhYX
 Nph3RpC6S47zeUGKozGzKUny8lIHW1YiwwwZd1ABvZOo79jNjICY6gs3M/EZrsAivCbD2CQLmaB
 SLQvAWseXxGvNS/Ys+wK90Zuaj4IXmBTNvjCZOXQELm5lI5Hh5lp2qgMSWQSIbmw6XjHDPvad86
 kQzDeGMY/Xd/y/AuCuj1chHhi3CO8w==
X-Proofpoint-GUID: jYeVa5WjxNx2LE3a2LPRVo-TaQR3nLoU
X-Authority-Analysis: v=2.4 cv=f7BFxeyM c=1 sm=1 tr=0 ts=69256e3a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=Gpj13mTOjE8SKnWQHpIA:9 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: jYeVa5WjxNx2LE3a2LPRVo-TaQR3nLoU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_005211_098638_D4183C81 
X-CRM114-Status: GOOD (  12.86  )
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

Hi

I am trying to understand IO fault handling in Linux w/ SMMUv3. While reading
the code, I understand that SVA domain creation allows taking IO pagefaults.
arm_smmu_enable_iopf() checks if the master support stall upon fault
feature or not. How do we handle page faults for PCIe devices, for which 
transactions cannot safely be stalled? IIUC, The PRI handling in the
driver i.e arm_smmu_priq_thread()->arm_smmu_handle_ppr() is not doing
anything. In the SVA support for SMMUv3 series v7, I see the support for
PRI via "Add support for PRI" patch [1] but it is not merged. 

Can you please clarify if we can support SVA with PCIe devices w/o
pinning the memory?

[1]
https://lore.kernel.org/all/20200519175502.2504091-25-jean-philippe@linaro.org/

Thansk,
Pavan

