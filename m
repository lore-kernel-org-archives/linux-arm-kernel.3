Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2485EF06E2
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Feb 2026 02:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcETeBu3Dm8+7JToFL4CZXhvEvkcVHG2c1u9m4FGNxA=; b=VgzCavGTgMZv6DyORtICeqpi9Q
	A6Ki8ySg+FdywA/f9Czi98Sa7WFJh3r72qgFyPsR0r1LnRKIVTsV+D05gpis4xe0hjCxTRYXMAohj
	wSD0qbYQ6qX00YdtS9GA/pM/up1GbI3gQlzutUKGWGqijqW5V5nO8oso3988lNBAwTKplRJt6NYDS
	MJ0/3DR5YLRWWCrmL3AyN1E8Z+YlAiRDUtanfffBk33HAtwcjg0kPwsENFvyvQQ1MYBLXJpgUaJBc
	zqU0O5TUOXEv8Kmerii5dJMke6DkkMX1EwLgGvRAwef0gslWt6ythlboXKjRm/JyE/36riKAM6dQD
	p6BgN5nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vou7n-0000000CvO5-2xWV;
	Sun, 08 Feb 2026 02:02:11 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vou7l-0000000CvNS-08Zy;
	Sun, 08 Feb 2026 02:02:10 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6181t2k11885188;
	Sun, 8 Feb 2026 02:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=tcETeBu3Dm8+7JToFL4CZXhvEvkcVHG2c1u9m4FGNxA=; b=
	dYpWGi7kWFnDoR8VmoWzjOvpSNkJ/uDdNwH0LNrj73IhDQC8Qvn9ph4Ow38l6yji
	ON0y9To2angkzFnSGJX9CiO01mHE0IIqE/05/KDDq5UIZhbZGGMh0OZlWCWQZRGV
	q3zVCirqo+MG7ex/nnzprH1RMhiHJ3rmarcjazsXoqyuF3XhB4QuSwLIzDToZhij
	ZjBXUnP0lkSCQIunvpPQaxfi3C/sTOI7LUcJzK829OD1ykCrgV7Mtu7mV96ZWiGB
	tR3TtBTl2j/AxFFMxgCUjcQtWajVwm7OvQ+V3JsoIgqdfKMUCJ61RE5O1il7SJWG
	7ejyrsLuMJPgOZ/MMyaL5A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c5xjyrhpa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 08 Feb 2026 02:01:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6181pw6w006636;
	Sun, 8 Feb 2026 02:01:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c5uubuk4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 08 Feb 2026 02:01:55 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 61821sxM016745;
	Sun, 8 Feb 2026 02:01:54 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4c5uubuk3y-2;
	Sun, 08 Feb 2026 02:01:54 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Peter Wang <peter.wang@mediatek.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Arnd Bergmann <arnd@kernel.org>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        Arnd Bergmann <arnd@arndb.de>, Stanley Jhu <chu.stanley@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Chun-Hung Wu <chun-hung.wu@mediatek.com>, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] scsi: ufs: host: mediatek: require CONFIG_PM
Date: Sat,  7 Feb 2026 21:01:43 -0500
Message-ID: <177051564504.3805738.4590217986991125255.b4-ty@oracle.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260202095052.1232703-1-arnd@kernel.org>
References: <20260202095052.1232703-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_01,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602080015
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA4MDAxNSBTYWx0ZWRfX6izQoR5uz+l7
 NsVyF9eHFbaYsduFwWxucBN0oVqzRDIyc854L9vXglXb4+MCJOg7qr0dT3340qS+cvnnZbdacBo
 CaUe4BiwUZn033ac7/f9XWhLDMJgDIW3R+um3uewJ211Ar13MzQ0Wq+piXwMU3TaQjiI/nKj3Z9
 ev0OZsV1mtYl/2JQxpFrJviqQGuCjkgfqtZmTFgYl6cKkydhd3qbDziD4ogkA7ToP7fFMpwJ++k
 uWf1DHQK8FivqtJIwFzdmn6wa97Imns73y/yoEJJciaNcuSUOKxJktEgv9uMEWZ9RvwX/q+peDe
 LJgYamD7bMwkFofPXzsgqu+VyYIfb3XkX9VZYy9hf4fMzhn/aKtLbpycRA3FBCdiCj5CrQ/roS9
 Iwl2YHaw2MyDqzxPbtkxsMQe1P6hjNPx3FHMSw+X0NbKAnDflRzhk6t6tTMR1WRZTuw4EfZZnSj
 89VTCQyAsYhcJTJAUVMI9M3hKC2Tmcqo1UanRxRU=
X-Proofpoint-GUID: SXHAOhsG7xFZ8meJW56HdLJhmdmPwTe-
X-Proofpoint-ORIG-GUID: SXHAOhsG7xFZ8meJW56HdLJhmdmPwTe-
X-Authority-Analysis: v=2.4 cv=VPLQXtPX c=1 sm=1 tr=0 ts=6987ee94 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=Fpp2hou-xS4CYN6b9oAA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_180209_073714_3055D074 
X-CRM114-Status: UNSURE (   9.61  )
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

On Mon, 02 Feb 2026 10:50:18 +0100, Arnd Bergmann wrote:

> The added print statement from a recent fix causes the
> driver to fail building when CONFIG_PM is disabled:
> 
> drivers/ufs/host/ufs-mediatek.c: In function 'ufs_mtk_resume':
> drivers/ufs/host/ufs-mediatek.c:1890:40: error: 'struct dev_pm_info' has no member named 'request'
>  1890 |                         hba->dev->power.request,
> 
> [...]

Applied to 6.20/scsi-queue, thanks!

[1/1] scsi: ufs: host: mediatek: require CONFIG_PM
      https://git.kernel.org/mkp/scsi/c/bbb8d98fb453

-- 
Martin K. Petersen

