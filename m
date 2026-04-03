Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7320ECC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 02:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=va8tZAzcik9ibYN5dhcgHo1/7Og0KTYznIgjG96zuQE=; b=wPtnat+3C6ZQ+cpBxHLa88JVM3
	PXcpqZuTwjLidgInnkbhH4YQ4PxQQ5DagIJ9365757a4jGm/u7lN53ww6Goz47QI99iZ0nASK2bsO
	Ijn2Rpqj8movEMS1WmuPt61fqGDdpRtBjhiwq2xLsKFQzKrS9WbWegDgeC0yz/IdtOzq2VNyhKihn
	z/+QpmQuYAh74zZe0ZYk2mAHSzZphjnOuelHDwQm1G5nZNj/M85r+eFJ6ymwWBjt6BwxmRdA81w+2
	TU2vFrusPExdZT9ACQyUWMyX0zo4+qNiqlhDIu//3Db3JC5pplWJmi/yIymFq1C2NuwDqJaDA/cil
	d8aeYldg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Tus-000000015CR-1fOZ;
	Fri, 03 Apr 2026 02:05:46 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Tup-000000015BX-1KIC;
	Fri, 03 Apr 2026 02:05:44 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6330P58C3150600;
	Fri, 3 Apr 2026 02:05:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=va8tZAzcik9ibYN5dhcgHo1/7Og0KTYznIgjG96zuQE=; b=
	cG44+wdKf6Tsvz0CAm7MuabTvueoPrpy1HHvc/ZKaE8kiPo23/Adrj05ikf7xlvO
	BWgibIrWmphiREqrrWVL7zNnweIFafwIsLdqQzsq/DcQ6/4d6IZYVI3+a0h79Ejm
	vbJtOOS0Gm76gQDYw+eKCapRF+amu60ueEp66+ZiIN3g48+fNqqx31Rq9Ruk/rPm
	sPtgVUk3bpqj/RDEMB7s4m7Q1Z9JtNt5uJRNnkDbRdotbBySjwlnNJ2gxEAvLSpo
	iUPZ+4Lu7O0FDRV1PfFtTYHkpl3cYRpsllpwYl1TCwif6O7JPSnzzqBwLclIL1KD
	Ty4zObYB9q1v5UpD6yz2iw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4d66v5se65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 03 Apr 2026 02:05:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6331A5Lk028960;
	Fri, 3 Apr 2026 02:05:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4d65eddp3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 03 Apr 2026 02:05:39 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 63325cqX017364;
	Fri, 3 Apr 2026 02:05:38 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4d65eddp33-1;
	Fri, 03 Apr 2026 02:05:38 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Shawn Lin <shawn.lin@rock-chips.com>, linux-scsi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v1 1/1] scsi: ufs: rockchip: Drop unused include
Date: Thu,  2 Apr 2026 22:05:24 -0400
Message-ID: <177517593422.3522679.1544975066978972395.b4-ty@oracle.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320215606.3236516-1-andriy.shevchenko@linux.intel.com>
References: <20260320215606.3236516-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_04,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 malwarescore=0 mlxlogscore=624 phishscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2604030017
X-Proofpoint-GUID: jMrp97DojdWvgtypZ3hTaCcxL8mvjgnP
X-Authority-Analysis: v=2.4 cv=G7cR0tk5 c=1 sm=1 tr=0 ts=69cf2074 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=EIcjfB9IiI4px24ztqRk:22 a=VwQbUJbxAAAA:8
 a=kJSQstGPYqi19cbqO5EA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: jMrp97DojdWvgtypZ3hTaCcxL8mvjgnP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDAxNyBTYWx0ZWRfXz6/IPjs5Ksft
 sSMZS7rSwfShxry1hbwSuS85VcpGz4EIl5J86V0o5m6H4LIFZPl9CmPNlFpz8W/VSIvFlazZOLR
 +V7bmKsBhgEAccXO/n61oIvZJ1Ktvrv/kQonJhbQaE7nni/5ZGpWpu3aUW7hnRO12QTiCEcUBoz
 mr0ikJethsbC3wPqrx+LV6e+RMbrl1Yp0ny2W597zfZnRzAWsaXW+RIj+H1ELsbeRf2oxoXXGK9
 OFij43Xc0i7JUNsbhU5wzAZUBchXzJIPr1dzbtffK6jnIwDE3TGZu/mrKgcIqk8h1jEZzHsT4qz
 i/vn/sdvMEd94CByE59icH9rApmIIYA/aBY+4AUWNZCSRTVqS2dnVr3ZTVPg35SUU5p+fnH3Df0
 146YNgToR9XRIAcVx8Vu0GiCpTYViqLWpQHjYchK0Qsom4F7Ujckq8kItgbl6nxfUbXEh6xbbx9
 5SIuXISiMP9YV4UcEEA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_190543_362835_14E06DB7 
X-CRM114-Status: UNSURE (   9.09  )
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

On Fri, 20 Mar 2026 22:56:06 +0100, Andy Shevchenko wrote:

> This driver includes the legacy header <linux/gpio.h> but does
> not use any symbols from it. Drop the inclusion.
> 
> 

Applied to 7.1/scsi-queue, thanks!

[1/1] scsi: ufs: rockchip: Drop unused include
      https://git.kernel.org/mkp/scsi/c/8ad1ddc50d15

-- 
Martin K. Petersen

