Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C0DC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 03:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhwFevJ8wCIuN2/MKjYQuMAXk9L7k7QGGb1ltPjkRmA=; b=YME7xub/kip7Z9FIThC1sdVvIv
	r/80uXsBO3Ktk+c9onDQU+LkAtWu0yz8j0lK3JUbeMvVooNhaa46eSDxnkG/96oJU82/RhZRs/e7a
	ls5OCLjx1PUPhraVkGhswkmABP+90w6dJOITpK9RjA7dhf/yUNViME5ie+gkyYhPHPnmM3OBu99R1
	UbcNUg4YxDhhqVjEz9Id0+v38u7rsk1d/fn1LNeeg7BV9OGyQ6EH1l0NnsFY1kvHu5F4tg0+PWaDf
	bk6me0rOkWu0zYfnG08gpVs4lVCEtjCY5mhFDVTuyM9kiirMEibwfYhEJgOzbSJeP4gxY9GHUTgaR
	ESha/P4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue41O-00000001D05-2Wo0;
	Tue, 22 Jul 2025 03:50:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3yv-00000001CXf-02c2
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Jul 2025 03:47:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=mhwFevJ8wCIuN2/MKjYQuMAXk9L7k7QGGb1ltPjkRmA=; b=eOrWRxNskRqFzgUnj02MgZXAek
	a2ZPY0pCUkDLeKOzDKbJef6Z9I7NAaxjoAh6/pZtqqPTnXV5XmpFDvs6ANPz8WeVDsaYLasOxW1uk
	Cltz3+pPggHctZD0AheZb7W3Ksgj6dHfbLqeWXlx2x19Iq+gWVowaGcxd+Y1h/DOAhVoN+KKUL0ok
	Uj5UYm6CIOtbMaBltBdwmLiVI3EZ89mslyYkFI8aL8A3elhOEiUOMR7ppAWNG2gnMN1ZH1/27b5Pe
	5xVHs2hdZeCbFpnFeiHg/qlaJrDOOMyil/Hp0HbHstLXBIfm+ASRDS5JauK4uBMlBDVFYJPZlnv8r
	p4yP1jBA==;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3yp-00000004dmR-3FGm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 03:47:55 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M1BtYp018886;
	Tue, 22 Jul 2025 03:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=mhwFevJ8wCIuN2/MKjYQuMAXk9L7k7QGGb1ltPjkRmA=; b=
	mbIoHmQhllrTEJRRaZsg+BxKO6NhiGXbLEQkkQxRuIFKUNBvchHKRb7qVjJIf0aH
	nngejMC0uJp8kJPsMYgJbWrjHrjzrTxAVcsiC/h2GRJB6lxYN28qQlmyBviJmzwq
	wKbxI2JMLn1jrIy4KHGMO9CgncpeNVmQcLwxKNYbXEkcpB/d12Uj1JZOU+tzWpLH
	5rluNxb6i9Due9Y8uua2FMCmi+bl/1V6fqonARbk2SnD8el46DMUcuuOalNY+znO
	kvFj4ZHOcOQFs8g5WhjYfZ6UtWPyg7DrfKbMe/HmLL+iG3RQpoMCQ9pQX9PkNgrO
	VMFgOLySWgpvZIqwZHiqHw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 480576m5vq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Jul 2025 03:47:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56M17ReC038404;
	Tue, 22 Jul 2025 03:47:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801t8te97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Jul 2025 03:47:36 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56M3lZix031915;
	Tue, 22 Jul 2025 03:47:35 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4801t8te8u-1;
	Tue, 22 Jul 2025 03:47:35 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Alim Akhtar <alim.akhtar@samsung.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Seungwon Jeon <essuuj@gmail.com>, Avri Altman <avri.altman@wdc.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
        linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: exynos: fix programming of HCI_UTRL_NEXUS_TYPE
Date: Mon, 21 Jul 2025 23:46:54 -0400
Message-ID: <175315388530.3946361.1712627502152861268.b4-ty@oracle.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250707-ufs-exynos-shift-v1-1-1418e161ae40@linaro.org>
References: <20250707-ufs-exynos-shift-v1-1-1418e161ae40@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507220028
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDAyOCBTYWx0ZWRfXyLtUcpfI4Bsd
 Wq3e1GV2GFAeL7YUi5nFS2j67zzAW1mKMZFGoluhIM7SxNT9E/6aZhNOlnd/crH9eE3SWKpfC0A
 2H3CSKXT7qBCw6rYl5NQ4vTswTW6eNCqY4pgZb0HAgxjiP/GW6G7dT4rQxsqnfctEXhpiCiLBCX
 6o00vEG2vEagbibdbHWcWU30FlFaWZEJFsmSJiNoA7bocKkKrJ5LZjeLBf42gdILv9BZEdPx3i9
 DTzQOuDp6psaEVrfjtAwsq3noWdXvngH7MnPxX9i2v6VEKO1t6nl2CUR9mdXbX3ABwjUb2AhLfy
 rEBXRpKqwNF1MZ/YADCao/Q2ieztVuJmUKoglb60R7cx748/hjQvvL8/gJAlxpPVCA1ulXbCyIV
 hNQqIr6QBdygis543zd2tM6LAJY9dABawtHNlxeFWXWFXLfOhEx0YqZhp0dFxyWEQsx28z5b
X-Authority-Analysis: v=2.4 cv=doDbC0g4 c=1 sm=1 tr=0 ts=687f09d9 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=NBqH-hezJh6qG-O4bPsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 cc=ntf awl=host:12062
X-Proofpoint-GUID: oZgBROvOr0m2tP7ifFP0KXsH_bC0PZUn
X-Proofpoint-ORIG-GUID: oZgBROvOr0m2tP7ifFP0KXsH_bC0PZUn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_044752_693580_F4AD9B04 
X-CRM114-Status: GOOD (  11.90  )
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

On Mon, 07 Jul 2025 18:05:27 +0100, André Draszik wrote:

> On Google gs101, the number of UTP transfer request slots (nutrs) is
> 32, and in this case the driver ends up programming the UTRL_NEXUS_TYPE
> incorrectly as 0.
> 
> This is because the left hand side of the shift is 1, which is of type
> int, i.e. 31 bits wide. Shifting by more than that width results in
> undefined behaviour.
> 
> [...]

Applied to 6.17/scsi-queue, thanks!

[1/1] scsi: ufs: exynos: fix programming of HCI_UTRL_NEXUS_TYPE
      https://git.kernel.org/mkp/scsi/c/01aad16c2257

-- 
Martin K. Petersen	Oracle Linux Engineering

