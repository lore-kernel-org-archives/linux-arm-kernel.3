Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02163D637D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 02:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2xpQOSvTdgzYveTuZa5PBcrhfFsbdou2bBoiLT1WrLw=; b=eY/RS7209TuTRCID6EontQ2JC1
	zl19gL4ZpVYralCWrdkcy/m4DzRaP33lBQ1BJm/th0ICdH69AchBd0VSn8kpvZ298UQ1RMRpcvIOg
	3il8bM/JFmLKYdS48PDgUn7UHeY/3HuPvcKSFDJMN9IpG/dQnvirrLWISyAbFhAhGNFR2qDte5V8U
	jn6LC+tAvlBXuJ6nl5jW5EldvtsSRJfe5aJL7ayEmg5BwNZAZAopFcwn+jsVglytal5rZ66Po3KOl
	7ZdRvIPJg8m1PnrJbcXy13OjkZCsW6GuHxxuh3T4OIWTo17acU+/oO5DOnpP54GtCxtjb6E020wQ2
	LlGotDWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBQ0U-00000008cAs-1DOq;
	Thu, 14 Nov 2024 02:54:54 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPwv-00000008bSt-48W5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 02:51:15 +0000
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE1gVRf008624;
	Thu, 14 Nov 2024 02:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=2xpQOSvTdgzYveTuZa5PBcrhfFsbdou2bBoiLT1WrLw=; b=
	Ms4yBSy0c88bWNxiMRJC7NL6xohYVmMpWjvj/pfWO2Ms2mJuhFdL3YegMsACE/MW
	TpyN1EV+U7YlJWccuNPcVLq6g5ktMOVBukCJSMNAiMQGmGgtF124OOEyVkozfNpz
	/1X6rcggcthuhMVB8NEr77vzIk/HGoPOgOez7Z7O+dvksDVtg2hmZhdrMljikMAL
	3ay1zqJLjZkIIFel9Afcgo6n/Ircd1FdLPc7fMxx5vNagmD/23aHszlzr6Zpmy0I
	y6v8t1SP7yP0dWDfDQXnYTSGWfCGhRWfRucHeA57zxX+QQ4vyeRzSE8NN5U8maRh
	f/LNtdhejgt9yuAgKDn8zg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0nwr8gv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Nov 2024 02:50:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE1DZZs022776;
	Thu, 14 Nov 2024 02:50:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42vuw0p21x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Nov 2024 02:50:55 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AE2ojYw003527;
	Thu, 14 Nov 2024 02:50:54 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 42vuw0p1vg-8;
	Thu, 14 Nov 2024 02:50:54 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: alim.akhtar@samsung.com, James.Bottomley@HansenPartnership.com,
        avri.altman@wdc.com, bvanassche@acm.org, krzk@kernel.org,
        Peter Griffin <peter.griffin@linaro.org>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        tudor.ambarus@linaro.org, ebiggers@kernel.org,
        andre.draszik@linaro.org, kernel-team@android.com,
        willmcvicker@google.com, linux-scsi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/14] UFS cleanups and enhancements to ufs-exynos for gs101
Date: Wed, 13 Nov 2024 21:50:01 -0500
Message-ID: <173155154804.970810.5299849140703683713.b4-ty@oracle.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241031150033.3440894-1-peter.griffin@linaro.org>
References: <20241031150033.3440894-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_01,2024-11-13_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=902 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411140021
X-Proofpoint-GUID: M5n5jR7XPwi3JNd14hW_yIGicGu11iSe
X-Proofpoint-ORIG-GUID: M5n5jR7XPwi3JNd14hW_yIGicGu11iSe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_185114_166074_858E84B4 
X-CRM114-Status: GOOD (  13.06  )
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

On Thu, 31 Oct 2024 15:00:19 +0000, Peter Griffin wrote:

> This series provides a few cleanups, bug fixes and feature enhancements for
> the ufs-exynos driver, particularly for gs101 SoC.
> 
> Regarding cleanup we remove some unused phy attribute data that isn't
> required when EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR is not set.
> 
> Regarding bug fixes the check for EXYNOS_UFS_OPT_UFSPR_SECURE is moved
> inside exynos_ufs_config_smu() which fixes a Serror in the resume path
> for gs101.
> 
> [...]

Applied to 6.13/scsi-queue, thanks!

[01/14] scsi: ufs: exynos: remove empty drv_init method
        https://git.kernel.org/mkp/scsi/c/07c2a7375044
[02/14] scsi: ufs: exynos: remove superfluous function parameter
        https://git.kernel.org/mkp/scsi/c/afd613ca2c60
[03/14] scsi: ufs: exynos: Allow UFS Gear 4
        https://git.kernel.org/mkp/scsi/c/516ceaaf539d
[04/14] scsi: ufs: exynos: add check inside exynos_ufs_config_smu()
        https://git.kernel.org/mkp/scsi/c/c662cedea14e
[05/14] scsi: ufs: exynos: gs101: remove EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL
        https://git.kernel.org/mkp/scsi/c/5278917250a5
[06/14] scsi: ufs: exynos: Add EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR check
        https://git.kernel.org/mkp/scsi/c/96f3fd267fce
[07/14] scsi: ufs: exynos: gs101: remove unused phy attribute fields
        https://git.kernel.org/mkp/scsi/c/5ef3cb67f3da
[08/14] scsi: ufs: exynos: remove tx_dif_p_nsec from exynosauto_ufs_drv_init()
        https://git.kernel.org/mkp/scsi/c/f8fe71a3fe89
[09/14] scsi: ufs: exynos: add gs101_ufs_drv_init() hook and enable WriteBooster
        https://git.kernel.org/mkp/scsi/c/9cc4a4a57677
[10/14] scsi: ufs: exynos: enable write line unique transactions on gs101
        https://git.kernel.org/mkp/scsi/c/ef8bfb00e9f1
[11/14] scsi: ufs: exynos: set ACG to be controlled by UFS_ACG_DISABLE
        https://git.kernel.org/mkp/scsi/c/36adb55631d0
[12/14] scsi: ufs: exynos: fix hibern8 notify callbacks
        https://git.kernel.org/mkp/scsi/c/ceef938bbf8b
[13/14] scsi: ufs: exynos: gs101: enable clock gating with hibern8
        https://git.kernel.org/mkp/scsi/c/cabc453ca6c3
[14/14] MAINTAINERS: Update UFS Exynos entry
        https://git.kernel.org/mkp/scsi/c/d49df3d39244

-- 
Martin K. Petersen	Oracle Linux Engineering

