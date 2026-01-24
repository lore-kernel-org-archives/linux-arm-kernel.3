Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B67D6CFB9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 03:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RnKYwmF6i+rHZr+BY3hLagVUqg34uJpLZi4fqObvuM0=; b=mIze+FsYAAlhD0gwABEs2CX0Fq
	S1MWl+BraCLduFbZQuNrCG7uQb5deOS/sXd/uOVoR5+M4tDOUsz0PS1vU9FLCHEbLgvdsP30N4BiB
	ywqG8P3lEow9sxv4atNOFLuEKsLp+Sso53vXj64hq9VTJZ7mhj+aR69IBCmMKFUucmnEflr8yZg/+
	a/cSSW0EPWbyTcsc7OURli7Dd9zDDNykjLMEPy7EqOYwV0OPwbyPSNlKrJYt9riu9Bs+efZ6snqlF
	MUC/s/zBCAof67jP/Y2yBgJrLVq51ZYxO4zo/GrDLSF6yn2U1dnc21usGptlYhxzsXyUHE1incI4N
	ksdM4dDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjUfa-00000009w3i-3MJR;
	Sat, 24 Jan 2026 03:50:42 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjUfW-00000009w2c-1Jso
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 03:50:41 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60O3NN14476494;
	Sat, 24 Jan 2026 03:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=RnKYwmF6i+rHZr+BY3hLagVUqg34uJpLZi4fqObvuM0=; b=
	Tu8BW31sNGkM38OMWZxaUo0JncOv9pcISVi2uAuAllkrj9hV0pbM3gP1X/lCLA02
	8tEd82YKIVu8/0qOZQOuFElm0h+BhYFwzkzKqQvlXe4PK5WLCf3KZptvY6h2RrFb
	Xa95EK/IhHtwhsTUkvzC1tF5bzrGuc5LZM1oe9GZnKx4IIDcWjGysVRZBnd2Fsqe
	+v9XjccRwOTf++lfzsMySNVYdLPPnnEGi3j0y+37qNyjAlFM+omn+MSYrQb7Ty52
	7AcrQTfGzt/OeFOBm7vT5AbXs8OPeCYipQ0hVslbRxJnt8cFEscZt6UY9pDXS/MY
	aUSLxanJVi0afR5hfNH4gQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvmgbr1tr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 Jan 2026 03:50:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60O1YA05019835;
	Sat, 24 Jan 2026 03:50:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmhbah6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 Jan 2026 03:50:24 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60O3oNSp037773;
	Sat, 24 Jan 2026 03:50:24 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4bvmhbah5x-3;
	Sat, 24 Jan 2026 03:50:24 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com, andre.draszik@linaro.org,
        willmcvicker@google.com, tudor.ambarus@linaro.org, jyescas@google.com,
        bvanassche@acm.org
Subject: Re: [PATCH v3] scsi: ufs: exynos: call phy_notify_state() from hibern8 callbacks
Date: Fri, 23 Jan 2026 22:50:19 -0500
Message-ID: <176922262101.2870193.14804934834575560482.b4-ty@oracle.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260109-ufs-exynos-phy_notify_pmstate-v3-1-7eb692e271af@linaro.org>
References: <20260109-ufs-exynos-phy_notify_pmstate-v3-1-7eb692e271af@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-24_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601240027
X-Proofpoint-ORIG-GUID: hFwdphNVDjyou4hOz4CtSBr02467BzhY
X-Proofpoint-GUID: hFwdphNVDjyou4hOz4CtSBr02467BzhY
X-Authority-Analysis: v=2.4 cv=AqfjHe9P c=1 sm=1 tr=0 ts=69744181 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=vusFXfun81BZlb0r6IwA:9 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12103
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDAyNyBTYWx0ZWRfX0GGPXLF70t+n
 4TL2J8UVVtSDLpFV6+CbbSxmgYDIrZ0kT9SqfShi7bOxJ3QhHfBsabcGLL7iCjSp/VqRzNp4jkx
 n0ZSudPBjpMFsQrNLRfWcIueyCccfAsUdwVF1pJrWwFSz9L89OuEHAt/SS68oqN6AEUWKkC1DsJ
 oiAAnG/WoXLWmHvwo4E7E6L+JyOyeI2guhU7zjO+ap8fQxMzGGMBClWEqLtp2RYFdbWRUw3rftL
 K0GXiIGG43DeGMMBZHl6lkqGWJvoIijdFjRt1Uef/rbaBKnS1NSC/563W1EdwiCxcLhsK+7cTbB
 Q3g97ACAt8GmZsR9wPySooNhKofyedUGZe7loRuvEHhfyroy/gBF2yE3tNTeBUGyEiOsmJAoDuJ
 lMNIKcfZP7FfLdjRg4hddGyvo2RUr9htMBLEqC+A1QNOPhHR8GN4as8r48VmWQIDhiO/hc/QUQ6
 nV2857AhSGKeHCVjOsP9aBRx/xM8wA/dkVun/9P0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_195039_767102_07FA050F 
X-CRM114-Status: UNSURE (   8.55  )
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

On Fri, 09 Jan 2026 11:40:14 +0000, Peter Griffin wrote:

> Notify the ufs phy of the hibern8 link state so that it can program the
> appropriate values.
> 
> 

Applied to 6.20/scsi-queue, thanks!

[1/1] scsi: ufs: exynos: call phy_notify_state() from hibern8 callbacks
      https://git.kernel.org/mkp/scsi/c/07959ef517b8

-- 
Martin K. Petersen

