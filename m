Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686E2C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 01:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/RuX3GwU88Td658DflKrFkdi94VCyG7/q6o+rS03Vo=; b=WnA+Rq4G1/6fYCyZOgmLs8Mb/O
	fdVOKDBC8cmI8v45MseisGLCRPL7ywS1pcWCX2VlMELItD+PELIKlNLXxAg0lhSvPjizqr68uNve+
	gtoyKeryGYNJcYnkGCqaxp5lh58KTjBJWs3Vv8jqrfQ2etEW1oTUhLTgj+oTktQg/4vXMuXijGHJE
	B/rXSDsJJfcrc+M+zzxwyoN/fIblujBnRkyiOiI+IcT9w2JPBhjeXLz8cU7O5NVX3YOOlemYddeXs
	zJ7KmjWLzEdIgFmsT7Q/tuWniXhlCDNJSH0bZdAzqeH4wG0iwSzMQTkcDTkMcd1DQ62V1qiLExBNt
	clv3UT2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1troJF-00000004Kga-0dMC;
	Tue, 11 Mar 2025 01:21:29 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1troHb-00000004KJ4-0EyB;
	Tue, 11 Mar 2025 01:19:48 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52ALfsYx014719;
	Tue, 11 Mar 2025 01:19:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=8/RuX3GwU88Td658DflKrFkdi94VCyG7/q6o+rS03Vo=; b=
	nmSpbTLxnRxd+EafKN6/L/AxiRQ2yWRRwEFrCSsP2Yr03G4O1qdq0AbJMRhU0+80
	/19D628J3mAAoVGJ5TxfZ7UgLqjlQV0WPmDZEAza35x0zSXpmQwyncLc9EBvrWDU
	ubZcK+GQZASi33aIlsElbHpCfn68gAyTOnuwH3YIsBVFZgnzfZ6GW5bgRf1QF0UO
	eWPt5trusLZdVTqZ6j3YMP9bk/kjtSIOOPedWzfaWOxagOpdxUo/l9dw+nDUZEfX
	Gjx2b4yjrAtW3ErqMwTBOMP3+HJfbSJ7jCQ7pwvBRbdLLBiG6TM9th/TwjqtFjAb
	KR1DrJ0plAUZU/QKgXvThw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 458cacbvd7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 01:19:43 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52B0UFCK014999;
	Tue, 11 Mar 2025 01:19:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 458cbencmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 01:19:42 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52B1Jfr8014960;
	Tue, 11 Mar 2025 01:19:42 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 458cbencm8-2;
	Tue, 11 Mar 2025 01:19:42 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        Heiko Stuebner <heiko@sntech.de>, linux-scsi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        Colin Ian King <colin.i.king@gmail.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] scsi: ufs: rockchip: Fix spelling mistake "susped" -> "suspend"
Date: Mon, 10 Mar 2025 21:19:01 -0400
Message-ID: <174165504936.528513.7895453741464348013.b4-ty@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225101142.161474-1-colin.i.king@gmail.com>
References: <20250225101142.161474-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=892 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2503110007
X-Proofpoint-ORIG-GUID: ZUjgEaKxxcf7JcaIfoORJdytE4gc3wBU
X-Proofpoint-GUID: ZUjgEaKxxcf7JcaIfoORJdytE4gc3wBU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_181947_211443_49F0CE17 
X-CRM114-Status: UNSURE (   7.89  )
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

On Tue, 25 Feb 2025 10:11:42 +0000, Colin Ian King wrote:

> There is a spelling mistake in a dev_err message. Fix it.
> 
> 

Applied to 6.15/scsi-queue, thanks!

[1/1] scsi: ufs: rockchip: Fix spelling mistake "susped" -> "suspend"
      https://git.kernel.org/mkp/scsi/c/24e81b821724

-- 
Martin K. Petersen	Oracle Linux Engineering

