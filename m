Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B15C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 01:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qorkEDO0a/0TLfA/PYRb+YsFk93PMDMeWwVa7QsTUYw=; b=q5JS888iqj/IwSej6ACr8ptyIT
	TBeUb30xU0dF99xb/QEVUs8vKj0SaJxE9qkWOpZWNMhyWWLQgrFeo0AnFZga8NDWyJrZXVu8KTp6d
	/T5PMXjkkZaHB1wrT/ydTLq4y7CexAKIDnvhNNs/6pV4hiotIJ/XS8cCMNQ763p7YAyOaijZV5sxo
	fnPKJUBMgxzhUe/+kTbx+j2X+DDKLZtrsfZujOSw7eqptmrfDn0GekuVObYaFeVl7XIUrwEKKPuDT
	uO047CdtxVcIuY6rL2PO4jI9/IhPpi0PNkuGip4cNzBPfMv8JCPXr5R+iNHfbpclwrEM80OsAoclW
	LajpPdfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1troKr-00000004L6l-2Zvx;
	Tue, 11 Mar 2025 01:23:09 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1troHf-00000004KKh-3Qb7;
	Tue, 11 Mar 2025 01:19:53 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52ALflrt016930;
	Tue, 11 Mar 2025 01:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=qorkEDO0a/0TLfA/PYRb+YsFk93PMDMeWwVa7QsTUYw=; b=
	oMi4pMx1gTc6yyX3riKUulW1d6zZS5wsX8FBsHOG6uk+L3HpvKKQj4KVpa5rO/v5
	jVhYFJvDAY8jHyJxSUglkWWW0fqymzDuVJmklXiZSvgjpKn+tWYuJXT9e91dinou
	OHuh96HmBo9LqX1teaCwyU7WeWGPIcijKipBMEbC32e8m3Ivh6kwbfD/KjQJKnVT
	6erADN5ZkusRDqew+H6y1R/IT0vXN5zw3IqIryOhVjeeQVcyUle7I9g0T8C7+Ycn
	hLSkcy6k7N6/pRPt6/uiQKhAxg5uqR2+fcbNJrqikDHbM1ypivrlbpH0kWSahVqq
	/OnpHMfa5RMNG5nFK7BJYQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 458cp33vve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 01:19:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52B0knIW014923;
	Tue, 11 Mar 2025 01:19:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 458cbencn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 01:19:45 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52B1JfrF014960;
	Tue, 11 Mar 2025 01:19:44 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 458cbencm8-5;
	Tue, 11 Mar 2025 01:19:44 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: James.Bottomley@HansenPartnership.com,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, heiko@sntech.de,
        linux-scsi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] scsi: ufs: rockchip: Simplify bool conversion
Date: Mon, 10 Mar 2025 21:19:04 -0400
Message-ID: <174165505002.528513.7169734727155329049.b4-ty@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226021157.77934-1-jiapeng.chong@linux.alibaba.com>
References: <20250226021157.77934-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=815 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2503110007
X-Proofpoint-GUID: 4rXadeu01eDMV_ByNcnfULWBEwCNg1L0
X-Proofpoint-ORIG-GUID: 4rXadeu01eDMV_ByNcnfULWBEwCNg1L0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_181951_978239_C1C8C5F8 
X-CRM114-Status: UNSURE (   7.41  )
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

On Wed, 26 Feb 2025 10:11:57 +0800, Jiapeng Chong wrote:

> ./drivers/ufs/host/ufs-rockchip.c:268:70-75: WARNING: conversion to bool not needed here.
> 
> 

Applied to 6.15/scsi-queue, thanks!

[1/1] scsi: ufs: rockchip: Simplify bool conversion
      https://git.kernel.org/mkp/scsi/c/3d8256903934

-- 
Martin K. Petersen	Oracle Linux Engineering

