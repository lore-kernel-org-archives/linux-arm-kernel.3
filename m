Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52E7D637D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 02:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYJVnBPMXhheHdB/DJlVC/G5ubvTltb2akrj529V2ak=; b=CHrAFlJL2Bx/LRrJvpbh4Zy/Xi
	XQ9LLh4GRg0Ts16GmnPmni88pthQgrIqx7IK+qMHyYNrVKCbdNEd0QC6ysKZlTdqUVnvY0xrhza7S
	9QoeZ3sEWtciC5oO9gnpHUTyxCtUx9mOosfkM37Svu2zGiD5R0dvg7p/V+RBGQKt2mgqlQ1deuwmK
	9Sy7KjgU298nw7/4Hj16st4ROtujrhl3r68gKaereMf2HWHf2FzXLix8zupHL7/WxK1EF6MOKRrMh
	Qt3PRrdfuw9i3t/wrl7cAeFAKmMz6tWd19I6L6TNCfd4nL3R/wXNhmCRBA8CrZvjSi0gkTvJAsRWo
	xZbZ65zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPyi-00000008boY-0rBl;
	Thu, 14 Nov 2024 02:53:04 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPws-00000008bRl-1eNO;
	Thu, 14 Nov 2024 02:51:12 +0000
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE1glgc008722;
	Thu, 14 Nov 2024 02:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=gYJVnBPMXhheHdB/DJlVC/G5ubvTltb2akrj529V2ak=; b=
	A48CLyrrRUW0wIw3MEOMVjBMF4fsBzeh8y3J/lnwbPeiycWBoj1jQngzXlnLaHU8
	0g9oI0RH030CgjfWg8rzw0garMOdU6MKgMPK21e+9ld4/03gtTKUXbje1oFjsZ/i
	aNlpk6W28X44vl3uJBRn+Z6mbE3EUlTeXj0VrthRbH95AdH1/yJLE6I4CIaeOeTr
	mNUgxj5Zd+e2wTQfF6C8UJOi+0VHmKoLWQXaCTQCaM7WP0lz3Ukb6TfJXcb9/bVG
	766KB+a9NTLSLVSwO3+BBNCXxpVLArOQCJPAIxLUuAqY13GnSPPSfMViqnqcfZgO
	YBTjvKLOFNf3w1+I0cWd6g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0nwr8gt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Nov 2024 02:50:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE1LVoc023918;
	Thu, 14 Nov 2024 02:50:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42vuw0p1xg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Nov 2024 02:50:49 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AE2ojYm003527;
	Thu, 14 Nov 2024 02:50:48 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 42vuw0p1vg-3;
	Thu, 14 Nov 2024 02:50:48 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: peter.wang@mediatek.com, Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Stanley Jhu <chu.stanley@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        ed.tsai@mediatek.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        wsd_upstream@mediatek.com, chun-hung.wu@mediatek.com,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] scsi: ufs: ufs-mediatek: configure individual LU queue flags
Date: Wed, 13 Nov 2024 21:49:56 -0500
Message-ID: <173155154783.970810.4459751536411041309.b4-ty@oracle.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241008065950.23431-1-ed.tsai@mediatek.com>
References: <20241008065950.23431-1-ed.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_01,2024-11-13_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=921 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411140021
X-Proofpoint-GUID: Zi8IdhYC6FopUOKlx7zd_MFUMADU3u7I
X-Proofpoint-ORIG-GUID: Zi8IdhYC6FopUOKlx7zd_MFUMADU3u7I
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_185110_818882_8103477C 
X-CRM114-Status: UNSURE (   8.87  )
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

On Tue, 08 Oct 2024 14:59:42 +0800, ed.tsai@mediatek.com wrote:

> Previously, ufs vops config_scsi_dev was removed because there were no
> users. ufs-mediatek needs it to configure the queue flags for each LU
> individually. Therefore, bring it back and customize the queue flag as
> we required.
> 
> 

Applied to 6.13/scsi-queue, thanks!

[1/1] scsi: ufs: ufs-mediatek: configure individual LU queue flags
      https://git.kernel.org/mkp/scsi/c/7670e74ff319

-- 
Martin K. Petersen	Oracle Linux Engineering

