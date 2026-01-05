Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7779C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+iNK/CviJGpsoYfpGa3P7BzXOJu5rWNivgQO0pzVOhI=; b=atDlq1y0ChivwrfLmaTrmlYAfq
	KKtF5ugUGOzmHexrnhib+l0pYVg21SkjWlCh1T9bswFOPwU0CAhfIjt3f+U0dx1hZSju0xoU36/cx
	tieuJyIGlRwk/hyrT++n2roBR9z41wnTDb1I50WLXj5TSQL34BmvAUm+rKTaddl54TSNE1Ma7mV82
	izKwVzJPLgmGutHV/zVgrZKn7/PAOSKJA09ifQibhdpVp9FF0gtBHd3s2oG6GaTH30AiWRWTIyvat
	51bpdG9nB7OzMCCYABXWrQLwdhliDq/TzBCHykRpyt0h6/R2rmqudVKPnhmLBrZYqR2Xbeq6kxBld
	iD0PoB7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclap-0000000BXES-2CIc;
	Mon, 05 Jan 2026 14:29:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclam-0000000BXCK-0CMu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 14:29:57 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6059clq2610460
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Jan 2026 14:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+iNK/CviJGp
	soYfpGa3P7BzXOJu5rWNivgQO0pzVOhI=; b=GKrGuv+MDRzWfoH6u2MOaWA+jUS
	QMJW14mjgycgebMrgtwzzoIz1KFBvmTRklF6sUa4KahKDwl3Q4YwULmRTNGLgT8V
	C7zBejimhM++9gZO+sZQYp4ILpQ93ODbv+zI5iOwGwZfK+PPimmXNYA7Vn2LLfGQ
	uG93w5yRfvjPEQ6+p4nEe1OgI8pMBGISOm3HO+s3BVYYhGSI37a94vKxOpZcSGja
	B/tQnUYg0vPlxcriq0N3ZccNDltxupt+vOOpXW3PsgXaFMNUVs2s5HFGU7l9j2/E
	Tg4FAvhQCwJmAa8jOeVqwTnE8yPSXFUGjbk2xTLesjIK811F41xPHEi2BiQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgaus0q4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 14:29:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6855557aso52277681cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 06:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767623395; x=1768228195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+iNK/CviJGpsoYfpGa3P7BzXOJu5rWNivgQO0pzVOhI=;
        b=SpwRJ/cEw2tB8z7m4Fe9kDXit7Qdn/ahy6JuLa9yRCipStvIWhsrmZfJvV7t90PMjU
         kK3Qb7x8oNDARJNc/I9eRDjwqrcxhYJsawr+ITWtoneljs3v2nyNGHvYgMKiyppdikMB
         mXxEOQAgimrmlpA03uIv6PgWh/U6FD0vqkD7i3N2AcYof7tw9ThBxvbROWmYJUDpGh7a
         0I4b17xoxIGHk5PxZGREBybgoHR5/cebPGqT1+Qqw1PbcTsKJMrGEMXnZ3XrwL4S5Nld
         J8TIeqyy9t3d/5Gjm5MpTFFzFgu6T2Ajb9Rr0gZlPVGc9a7jGGnI9kYyl+Q7UGO6H6U1
         9k+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767623395; x=1768228195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+iNK/CviJGpsoYfpGa3P7BzXOJu5rWNivgQO0pzVOhI=;
        b=sEus0dC69OrfZqUbOIjLHC/kvrPaXnqt05BAwBT42jokogv3Ld7kG9xptuvUqgS8mS
         s59llwctLm6pJj82fVY3hurHaxroKL0fbFwI6jlBCDegGIoel51suXgQgK4yiWTpO8Fm
         lLLpysNkFTXLTWodPanTp59QC9dfTO5P/bmPTYXu50+19emVoU1Z54TYNStOUZXDIRqj
         W3+Xj0yltlDO28mSwJ3y7QD2/njUg/9gww5xleXsBY9OBE8rEBtC6vUxyRUknkaZBloh
         xJfzNJRHart6a4k9+rpwIR/9+mPxZ1P36lkH1MWTtI+Z7SHL0HXdGJWPbSef4XRRGmOy
         gSuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX64pyWgWI8RSOZDRHwwkYRmGKl/ZbxZ7kbm2aW4npY62QvO1ssxskl912idEogT2ovi2/UEi30p8KJhE6MXPfC@lists.infradead.org
X-Gm-Message-State: AOJu0YzzR3CVTS0+IWAyMoaOc4hbB/EoppUIjbRcIxf6pDsOow9nGog/
	AC8R7lWUuT62PLjN9UdKKZ4SaxkmuKpgB3P5EJZz1CeEfpdKIJ7HykmIksQrRZSm2EEfh33FmeE
	h28wOL8vuAuLcTAKVvUwCRAWb6gwZtHlpqzMzBvPK8vpWULWmlDWitC+LULBhA1v0OgBGoDSn5Y
	k+CA==
X-Gm-Gg: AY/fxX7wPXM15codc8FaaWS8NandWH/Wt3Z7WvTrBI6/Uu2Kh/cfFAzMdmlmkkkB9JX
	pHneKSDzFtKGowddXvGivpYWIs6ohSBoPSNJ/NGEfkwyZQnrwA5+CUPn77olM0oo5eW62T3mVSN
	WKNG8/C1kMRk/kczUhAnm1H/9s4A59s37ceYpNacFhxD7QpeN5pBOoZBpTSWtBkyDBZSNWDqeGo
	/tGEb+qVBY5Lkps8XprlZYnizTwPQwdpbH32ZBawnQtT3A35RQ2BQAIN1ojX6+7g9LPTaBgjL5U
	A5wQwFYMYbYQqHO25YzQaTkxKNwvFysx2l05OEwVpvh18LRGhIlPT6odFdziIr0GWM9UY6p4Iah
	YkMtk0Y70cM5MwO2fr2R+i2ReAA==
X-Received: by 2002:a05:622a:1114:b0:4e8:916f:9716 with SMTP id d75a77b69052e-4ff473d0731mr134520791cf.36.1767623394580;
        Mon, 05 Jan 2026 06:29:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE06SnXQd0QyMUw3KAomX8sIlRFZrYWQP05g/qKtByRhTo4HPd8NEFQcvSlC7YlkgOoEKitQA==
X-Received: by 2002:a05:622a:1114:b0:4e8:916f:9716 with SMTP id d75a77b69052e-4ff473d0731mr134520491cf.36.1767623394170;
        Mon, 05 Jan 2026 06:29:54 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842673b560sm2074066b.33.2026.01.05.06.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:29:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 3/3] ata: ahci-xgene: Fix Wvoid-pointer-to-enum-cast warning
Date: Mon,  5 Jan 2026 15:29:47 +0100
Message-ID: <20260105142944.372959-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105142944.372959-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260105142944.372959-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=897; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=BWYdpph40V6+ahw3fGxd5TEaRDtyIoFvWrDnre9gYGI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW8raBLsX3Vc5LQN/Lm/KA2HXWJ3ElsyFcYpKw
 oci58LT6wKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVvK2gAKCRDBN2bmhouD
 18W/D/9BzNbkGi3fl7+u/MRsmiQ4kbuD38XsWOnVNS+RGOdpux08sN4iFjzr3Qvr756CrBgHF3h
 stnwcqEDDpEEK/gmVbPiOVxnL2akfXubjpbd5m2yuaHW/1pUULHCLLL7/n4nDmihY6i7G4m8PLa
 R61etURmds9vifnE3hkCKsZfc1ZxmeEvP0XuKTTV+YSKcNuMAAABCQS2IqcphURKrif+wDd5olw
 Ofe542fLtcTf7aT3p4ntPfwzfHDrE9dAjkEO/Ymz9gmwD8/EbjqX+nChs1LkxT7Z4E+PBOjdvdA
 ZBQM2DhKPVsp4xW2bFpNEx9hsCZe1JPSQCkhZ7kCyiBKsrwIa9qV3gDDYaHP8vvfivW+0cxCZp/
 udr0JU1stNjyXAgysiXaXUcnHDFrCs+aRWmQRGku5UANHi5OSqe2yxMxKCEU4x/p2cQpSuePdNk
 RzLiw9L8xvbledztQcqx8Z48tTFoBbem3qjyplQdQ+Gvv5UQjZxeDbPBf4M7+BuSgZIaiSQGFd+
 BaPLMa//bPBu1TjLNWSnFf52tywgSbijSfC7oM1Xw/aV2kHhzLmzBnRaA15rbAFvF5XlNoO1uMY
 +SRaNcbfYi3Nc7+ReyYxQJW4/fiLDSsnsuXul2FeRPkQYje5Pveh7YYWUAp13qoPmXmcoGqAjGq Sr/2aiwJPTacv+A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4noDTJ6v68LfHWnxXfiVBYQdLlxh8dkD
X-Authority-Analysis: v=2.4 cv=DP6CIiNb c=1 sm=1 tr=0 ts=695bcae3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=O-IaotXkb1TqCMFDYkEA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 4noDTJ6v68LfHWnxXfiVBYQdLlxh8dkD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEyNiBTYWx0ZWRfX6b0iAxYdOU++
 vXK44v6rDQlLNvkhuWvuvFIAZeJNZn02T7XwtZqts0LsImFeiBytzdeV68ta7ZYQUgAW8cyiN7d
 p74CzM/C3t5os5yPzXUkYq1HyNW+ge5XvyUF/algeTf//iUDl1bwH6hMEn9K40mgVDxMA8+LU7u
 F9R7JMFqMCr76lPzbgoDCMjJcT538lGaYgzDj83IJ79FioIrzbSPH82oF+hoWxkCJ2QoVlSIjsS
 DGRD2nJN01dxKa9jeH5Z+nGlkkNLFSIN5HEnrgBkKhXvYp1xCAv8UwXq90RP5X7htOm6cknbIDN
 rN9CRIuOv1LNgLGJmc+pRYDef0SUfIwHHvCP5q/vD0qGsIczWbxMAPDr+2m5fC+sh7wqlLU+JAh
 Mbe/CeRBUFjJ3/Rg2Vuq3TO5ezj7L69FthdE8gg6vrhpwtFKPkaqEsG3oLlNaJqqJPQ9pavE2ox
 /PMIEeUCrFbDKSWAetw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_062956_087913_52AB123B 
X-CRM114-Status: GOOD (  16.09  )
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

"version" is an enum, thus cast of pointer on 64-bit compile test with
clang W=1 causes:

  ahci_xgene.c:776:13: error: cast to smaller integer type 'enum xgene_ahci_version' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. None
---
 drivers/ata/ahci_xgene.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/ahci_xgene.c b/drivers/ata/ahci_xgene.c
index 6b8844646fcd..98c99b5a8242 100644
--- a/drivers/ata/ahci_xgene.c
+++ b/drivers/ata/ahci_xgene.c
@@ -773,7 +773,7 @@ static int xgene_ahci_probe(struct platform_device *pdev)
 	}
 
 	if (dev->of_node) {
-		version = (enum xgene_ahci_version)of_device_get_match_data(dev);
+		version = (unsigned long)of_device_get_match_data(dev);
 	}
 #ifdef CONFIG_ACPI
 	else {
-- 
2.51.0


