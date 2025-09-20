Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADB4CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 02:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsJsIHjWIG9kg+Z72lMm4FPPciDowTkHulx54Bh9bag=; b=cNH1jsRV0xTnwGFnt3rIBqF82I
	8qiR5ThcYllP+29IwZgMFACBt+y3l5vl3lGVFUs+jxW1YlDNx/LzEic1Fgi2n/1Wb2CF4Yrhtrj1u
	CKHAXn5W3QqUun0OOpVCpVZ6meB80TxoSFxUAh2ORkLIBbirZkDyA95w7KDbqW6x44gg6AnSNH0yS
	TQfFOVoN4ssNgAm5kqGKsZKZdV5iMB1MyNtZva0wCHTcibVn+GE5RHT29rPQijJWxpiSb/O0kmEOc
	ZGP1iK4UovQ1Z4JjI+GR4B4FerkyE+kOJDU3iDF2yOZ9udwL5RuNFeSGWGvoCFLswuYX2RVmuuGyJ
	vSu1zVdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uznHi-00000004Y8j-2AQF;
	Sat, 20 Sep 2025 02:25:10 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uznHe-00000004Y7c-3qPA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 02:25:09 +0000
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K25eJq029482;
	Sat, 20 Sep 2025 02:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=CsJsIHjWIG9kg+Z72lMm4FPPciDowTkHulx54Bh9bag=; b=
	fNhuD3PK3xgchkyrxrFXZsN+t/fWHciOPmYAk/StXaRalhOCtrXcnrziWI1elLbj
	0lora/X878u+VsEBF6amdGRDkuAeN+H6hej8IcuhUCTjlxATdxVJE4rvRNCJqxSO
	F1HagvmUpK4xMUgZESA+LRuqNbXwaP03t4UJrR0D69FoyqVXZTb8LY/lEe5FhBZm
	KxmeSjrClzlM7z8RPupN/mhRugBx5xrdPb0LJmtMj/YjQxuwuMBsl9Hu/PndzaTB
	TSdJut356AjlPxS8fK8k+S04dyyHnnZFC7jt85MRIccrBlaJSN2s54m/3o4BY+KK
	Q/iRXdVS2bHFlqAELVcD2A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 499k6ar0bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 20 Sep 2025 02:25:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58K1YIui020373;
	Sat, 20 Sep 2025 02:25:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 499jq50p2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 20 Sep 2025 02:25:00 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 58K2Lxgd016735;
	Sat, 20 Sep 2025 02:25:00 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 499jq50p2b-2;
	Sat, 20 Sep 2025 02:25:00 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: alim.akhtar@samsung.com, krzk@kernel.org, peter.griffin@linaro.org,
        linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: exynos: correct sync pattern mask timing comment
Date: Fri, 19 Sep 2025 22:24:52 -0400
Message-ID: <175833431689.3341211.14106616916060311904.b4-ty@oracle.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250907202752.3613183-1-alok.a.tiwari@oracle.com>
References: <20250907202752.3613183-1-alok.a.tiwari@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0
 mlxlogscore=986 suspectscore=0 phishscore=0 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509200020
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxNyBTYWx0ZWRfX89q8ZKWBEisI
 VzWqpWA7RCtrEioss/Ly1xhzBTysjmOPDMw5snOGaaefQUWQAvbSKJuv+aZzrgw9EIznd6tfUf4
 iN0FPFCLMVEQTQia5E+UZJwcbxhQNBQMeKfayFz716a3oUTCbsDrF0OKpSnqGBqo7POwsdc9R/e
 W8DQRa3GxKV+m6fO4pUoDGac/Oio5yrEISBznVZW4WNQtFoJDq/PNyXT/6jjTdumk5XI9UARAJZ
 ZeXGuY+uWKLwXoRq9v6NQTJzW6ywm/vdO79mvkANPUTRVzrcbTZMQjD/QrqNfF6vyrQrxkz55sL
 ZMlpLlKpUhOJM9YJ3oqACi2EL6GacrGENHxkMiyp14MrNfayincIab4ioYzOQ6W8yxV1ZuH5A5O
 eSA+2mBtCgaNKa4sKqHXg2ZTkXmWZg==
X-Proofpoint-GUID: rnn4JSyZ3HsHYDEiN_d_XY6-hUB2SsOv
X-Authority-Analysis: v=2.4 cv=E47Npbdl c=1 sm=1 tr=0 ts=68ce107e b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=erYYR6txwRpVtOmW1J8A:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13614
X-Proofpoint-ORIG-GUID: rnn4JSyZ3HsHYDEiN_d_XY6-hUB2SsOv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_192507_342724_4118DF3F 
X-CRM114-Status: GOOD (  10.09  )
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

On Sun, 07 Sep 2025 13:27:49 -0700, Alok Tiwari wrote:

> Fix the comment for SYNC_LEN_G2 in exynos_ufs_config_sync_pattern_mask().
> The actual value is 40us, not 44us, matching the configured mask timing.
> This change improves code clarity and avoids potential confusion for
> readers and maintainers.
> 
> No functional changes.
> 
> [...]

Applied to 6.18/scsi-queue, thanks!

[1/1] scsi: ufs: exynos: correct sync pattern mask timing comment
      https://git.kernel.org/mkp/scsi/c/0bd0e43776b6

-- 
Martin K. Petersen

