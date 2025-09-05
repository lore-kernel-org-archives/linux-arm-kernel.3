Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38991CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MNTVaRidqIqXgAKjCzr+BWLK86N6w+7fH73KgXvjBA0=; b=JLRP4jVqWXGkOpC9CMjMxxFdA9
	aRgZQEmWtWLsCfADn5JsiO4sQFgEdFWuoSVuGFLwRH+WTjY7RGvk0GuCczdXrVwJohaLbWjwNQyD8
	T+OMfFbBpxO+Zp00SFbjjRFArj0uRZN34EIekHpfNYAcgP0yLhj6W1Fhv+ZXz+YAXa9d86JnYV7gP
	B9ZpLVwOsu2ler7pvyZ7UwimpdqRIXShetHhqALpssM7s0KwHJ2azg/9Q2FytqwjHe1AQdiRgE58k
	eLPOu72ef3tdCEodr3l81HwZAez7v0TZFRtQIAlhc347x4R+n0YHZabmay2vhnxHnZ00dx9dO0XG1
	LeWN60NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugYZ-00000005XBJ-07Wq;
	Sat, 06 Sep 2025 00:13:27 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uudld-00000004exn-3Y3B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 21:14:48 +0000
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585LEe1h000688;
	Fri, 5 Sep 2025 21:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=MNTVaRidqIqXgAKjCzr+BWLK86N6w
	+7fH73KgXvjBA0=; b=dKugqIPhq9ZC+89Ri9k61+v/Yno3dFKMTAsRVWZHfTcQW
	j6VnbAulUJW4u6GsEP4VG9nbIWCLrhJEFevcbtHge8ppYtqASWh2BifrpqNRITaS
	hE8RFhZUVZDk0wulv+mxPtTvUHIrK5rAWb/FXkc3xrDakp2u3F8GTeK7Ux4Bd56T
	1hMZpR+buEhGlmgZINmDiB7TVNPT63icoryfDQPO6alWbcfOxSwi1K1gnL6y2OHT
	NcnNvqRf5Y3wKA7aKylL6oceZhF16jnb+QJRT3GuPadC8/S88sVeZc6vZAxKZbrX
	trnovOtZUBlrox6fNfbqOfv/SAkmgHmuyyiufEkOQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4907ktg004-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Sep 2025 21:14:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 585JoCav033333;
	Fri, 5 Sep 2025 21:14:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48uqrd4qvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Sep 2025 21:14:39 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 585LEcuq038219;
	Fri, 5 Sep 2025 21:14:38 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 48uqrd4quv-1;
	Fri, 05 Sep 2025 21:14:38 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: vigneshr@ti.com, s-vadapalli@ti.com, lpieralisi@kernel.org,
        kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
        bhelgaas@google.com, linux-omap@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: alok.a.tiwari@oracle.com, linux-kernel@vger.kernel.org
Subject: [PATCH] PCI: j721e: Fix incorrect error message in probe
Date: Fri,  5 Sep 2025 14:14:34 -0700
Message-ID: <20250905211436.3048282-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_07,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509050209
X-Proofpoint-GUID: yjoYByN9Zdo31DNY6AEfeu0WOeY1RLep
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDIwOSBTYWx0ZWRfX7Dv9FNCmvvf3
 in+cAPNtPOam6g7FcUOaEcgI3VwbLkiSCe/oFlLyTSltTsosiFhdfA3mlqQ1W2qnIIyYLNaA9lA
 EUMuGNdm7e7yy8MzV7ZQbOH+g9C124Njm6iHHx7Z1UgzM3sFb6kIre95FiPEeY0JmSgkuYxZuu8
 U6RqbJ3t8zpLiONRxnpHnfCXu9NS6AHIr4pE2fZMvxKLY3Y1PQnpotyD2D6ZyUTJ0tZg9ywein3
 MyHxJR2gsfsDorJy6WdkkHk+sKyofb9KEcdz9fsZzIeJ5IqfFsGpWplyjKYsHK2+osRVJh3bauL
 eC1maQsYSv0c71zxSdAXCe7QBP2c66EXq/PweM4Y/U+UGJmRNl9Cpf+w2qrcMXUrFcac0f7BQzG
 qlybUAoN
X-Proofpoint-ORIG-GUID: yjoYByN9Zdo31DNY6AEfeu0WOeY1RLep
X-Authority-Analysis: v=2.4 cv=P9Y6hjAu c=1 sm=1 tr=0 ts=68bb52c0 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=yJojWOMRYYMA:10 a=yPCof4ZbAAAA:8 a=kyFhivpCSvuUZvO-LAYA:9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_141445_892188_32225EE8 
X-CRM114-Status: GOOD (  15.51  )
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

The probe function printed "pm_runtime_get_sync failed" when
j721e_pcie_ctrl_init() returned an error. This is misleading since
the failure was not from pm_runtime but from the controller init
routine. Update the error message to correctly reflect the source.

No functional changes.

Fixes: f3e25911a430 ("PCI: j721e: Add TI J721E PCIe driver")
Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
Not sure if a Fixes tag is required here
---
 drivers/pci/controller/cadence/pci-j721e.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index 6c93f39d0288..5e445a7bda33 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -549,7 +549,7 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 
 	ret = j721e_pcie_ctrl_init(pcie);
 	if (ret < 0) {
-		dev_err_probe(dev, ret, "pm_runtime_get_sync failed\n");
+		dev_err_probe(dev, ret, "j721e_pcie_ctrl_init failed\n");
 		goto err_get_sync;
 	}
 
-- 
2.50.1


