Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81ECAC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 03:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OljqLUza+/baG9lUxsAUE7xPAIhfTiIdxHd6klwyagw=; b=d7Wkck64kZqDlZU9auQpK/3xLv
	FK2Jy9tNCA/bVmlK2yRyEUL0moIdy81Y2SiRkaIHOI1oHIJyPRV6OPhAXcR5yRi0BlrWwpin969JT
	dItXHsoqTJzeI2ZeSwbnDkJ0gRiYtK2ihHNwxja0T3xCZ80HGsxQtgw7tUHP2/TM/QtvSDEONt6MN
	qIyauduQ7uKcMGAz5F47qvWGJPJEY3z71JFyPSq8O01FKTFRobSSth981qI9jteQuDNMtiRgGVMg4
	pCjVt7BKoRt/wYFjdzKhIIxrKjt6WEzzNUkNnju619rqLVsD9lmcxpIrA5vNs+c5hLe7AJXiYi+wq
	zmCahsIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf9jz-0000000HBLJ-1ZGG;
	Tue, 04 Feb 2025 03:36:47 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf9iO-0000000HAzS-3VaI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 03:35:10 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5141Mpce008581;
	Tue, 4 Feb 2025 03:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=OljqLUza+/baG9lUxsAUE7xPAIhfTiIdxHd6klwyagw=; b=
	FFJfIXHjRuOGQVijrnCzoA156Qk+NYpQhSg1UlL94wBJ77jYyJv4E/QsaaZEVZvF
	MzRNI0Ga7MuJutF9QhkpTcPsVgJ57L8l1ftRhMKWNTGsHswN5c5uwnOv7MWwSFYw
	Aqj+IrOeLwJKeBJ1X9jxBUsVowFlbdLc2I+PcPtXBBpqh1iOwAdzwuR37b8iwYJs
	CMVDWLn6y4gofR9Cu/VIEB04UoqX1PcR11WebONqF1/fPOC1bj72q1vhYDGSN7Q3
	wUbfJhLpOsDthRV8CnngZlJty2zAQ8HizjK7nl2gb/PJutdYh7r+wiASEX4mKx4W
	uXFkHdD25UhN3YuQYM2n8Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hhjtuy2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Feb 2025 03:33:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5140C0vi038928;
	Tue, 4 Feb 2025 03:33:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44j8e76f08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Feb 2025 03:33:55 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5143Xs6k015172;
	Tue, 4 Feb 2025 03:33:54 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 44j8e76ex2-1;
	Tue, 04 Feb 2025 03:33:54 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Mike Snitzer <snitzer@redhat.com>, Jens Axboe <axboe@kernel.dk>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Satya Tangirala <satyat@google.com>,
        Eric Biggers <ebiggers@google.com>,
        =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v4] scsi: ufs: fix use-after free in init error and remove paths
Date: Mon,  3 Feb 2025 22:33:04 -0500
Message-ID: <173863996284.4118719.16500657324570528150.b4-ty@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250124-ufshcd-fix-v4-1-c5d0144aae59@linaro.org>
References: <20250124-ufshcd-fix-v4-1-c5d0144aae59@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=888
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502040026
X-Proofpoint-GUID: aWx47z6fFMo2i7ui5DF1-UpbrtUACWdk
X-Proofpoint-ORIG-GUID: aWx47z6fFMo2i7ui5DF1-UpbrtUACWdk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_193508_883929_5A5A3ADF 
X-CRM114-Status: GOOD (  12.15  )
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

On Fri, 24 Jan 2025 15:09:00 +0000, André Draszik wrote:

> devm_blk_crypto_profile_init() registers a cleanup handler to run when
> the associated (platform-) device is being released. For UFS, the
> crypto private data and pointers are stored as part of the ufs_hba's
> data structure 'struct ufs_hba::crypto_profile'. This structure is
> allocated as part of the underlying ufshcd and therefore Scsi_host
> allocation.
> 
> [...]

Applied to 6.14/scsi-fixes, thanks!

[1/1] scsi: ufs: fix use-after free in init error and remove paths
      https://git.kernel.org/mkp/scsi/c/f8fb2403ddeb

-- 
Martin K. Petersen	Oracle Linux Engineering

