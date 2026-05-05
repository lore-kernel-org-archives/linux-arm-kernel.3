Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1EFCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x2DkZv2vjeyX7QS9/9m0NS3mR3P2THZBgDbbte5VJB4=; b=h+HuL9qDQ2LQOtwsU/JRF5eJHl
	ZPSRQDCra02mYmKurSIy3DU2v4jEQZy3G3zoGVg9ZULQ/7YyDUQY1v7uMlJ4VIXW40p3IDKEnhv6H
	ArVu0tK7nKa9FXzUi5bNbrMN2mOVhkYH0vRUWkIXDPYX5kuz3Z4hRwNPgOQbxta/3OOA14eOR2sMU
	9PXP+BtautQyheMCipj7Za2EvPUoGMvCQp0VxokGCYwDZvfQ2wBMz/kcdE3qt4dGFJKQvEZ81iwlR
	F1KichWpwn13oIlSJWuTWKmgn1qQ+W/48glnmBsZqjiwVutrTva/gRqb09PJdSCDiDmeDGHNtyg7h
	/7WA5pog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKD5p-0000000FtyD-1LmV;
	Tue, 05 May 2026 10:33:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKD5n-0000000Ftxj-37DL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:33:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6455wOSj299881
	for <linux-arm-kernel@lists.infradead.org>; Tue, 5 May 2026 10:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=x2DkZv2vjeyX7QS9/9m0NS3mR3P2THZBgDb
	bte5VJB4=; b=UzC01LLsWWT36YRTRDJ8T12atEF7HUb0dzYgAEnsUUZCRRtUjmN
	ntamOvzdEV/w8krgxVwiDbYLszbSW6Eg7zLv/WFMH5Z+aFF79SDThhbml3Sikapt
	fM0RxKLQ5vTfvNAP6b4y+SNqmXsm/GGWjTk8qNfYLZHzOmYinR/j8Kjl5AuYGtaO
	X1FQi8IoZFeKDHu/TsqfjMxGeaxgG5sBkKy7pSXFgOIKT0HADGQCI38I+At/DHRF
	vLvxu2LKDrgc7+JoXhl44PnyreHEclnpNVKWLxovWNw4Eqqgxrv+LzjNQqsWaPf3
	EGNmlYWig1PkTLIXlY5MoBAJfdbcTuyh6bA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvndc28e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 10:33:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8e8c47a3so143781191cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777977210; x=1778582010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x2DkZv2vjeyX7QS9/9m0NS3mR3P2THZBgDbbte5VJB4=;
        b=S9ky/+IrB4t0swuVEpH0wCNCFQMD+/Su7Krp0Wz586uDx2KxAzi5iWxjoLlJq9KyXI
         UIvcjGqqmDc8sqaMcSTS0CZGIO7EbDTgT1nRhnaT4t+k516TLsVKkFZ3VTnTaC5Nh+5z
         mGXq6yguy5Q6JldKfi73pDmtQYtIvgnstv6yVaxHc0HzSG0pXgYVTAqggCVlRj0U8Dcm
         lx2rKGbk6A99A6a/mADvV2Y0/82UGj7KbbbQGDTQ1XfUgkJ3SEq+oHQvefhiTZ9wayPv
         xJsH1VQK2Fxh8T0rAmsye9ihJmkdUgqwRmK/cxtskpnOOvdpRVf7TF8PolashSeHrDHE
         kSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777977210; x=1778582010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2DkZv2vjeyX7QS9/9m0NS3mR3P2THZBgDbbte5VJB4=;
        b=TM49t5ftI8MR8iJV9IhN2mWwQG0P6kysBwBrVZnTTwjgOaWdc/1qU8p5x7iCUTt7hm
         40DOu2z0mwjpivGl5hKsmHB2clidXHVfYKDAJTKG0oOOreOAHigMIndiEgZ3YSmPswXW
         vsFKlotqu0jdAmm+rYE6s3GYDBp5B3JneybzQaE0VjobVNfDPxqMJzJxPIugMsLA84Fo
         +mE7FF5OdBwRBseZ/2I3c1UQl1ZvNBLYZF7jDs9xbc1pO0F/RWZ/kCmjdzi/v3zcho7z
         aiX67dszkcCfQj4ChV1n1U2mTwtfxbpXBn6ld/+oIzL9KVr5eiYsuEZ/aqRmhZQZTuN8
         kzLw==
X-Forwarded-Encrypted: i=1; AFNElJ8ifN7cqOL2PPML6rrptWUEMxJ4NVvxHyVkBgjA2PdvbIAm2TYg/YFkgFCKfIDO1mgVc2IYWXJCmEO0chSA2SkK@lists.infradead.org
X-Gm-Message-State: AOJu0YwWz2j6T2YVIWXMd4dw8wLmlDe/PM8r4i5mdiHBDiTotdNBgcUl
	DVBsJYRJZa4cYpCJke3qWO416m0UWmBspQ8eZswt2jqMMq1mQzNeiyshfM3/Urlr/TPOkbjauLO
	zc26SGUkRscDpOq0bwmsX7wRfDM+UdCS90t7MM8NPzrPSPEN6t73jbxENaUraXsbOaRsp+8CgCn
	PzcQ==
X-Gm-Gg: AeBDievn2LjiUyDkYd9ReZyBXKaHMHyMkuqC26pVfCpxKYn4AFcyBNgfp4jY2qCvPwS
	oMWERN87NXcsynN5zSvT6GiCWwE5iKfRKgWC2wVbTCGFPZZAAlaH1qPMlsgxec4UtEkR/qkJVzG
	IB+N4CG9s5kg2N2X+Ig2tOtuXpzQhex1BkgFI8dSjzZ0oQrhO1mH/EZ+DuxXsnO7wDjdNqU1iww
	Tqf5qH0Zel3l8L8+WaJ9QDTR6lLHXDBy+KwOKnBHhCxqhRnq5T0bOe+c/8JWqg/wP7L2vZbfRQX
	j/GYixbd/fV8dtyMcRyvNkYTGfSpZEIErOMSQBNpmLaHYpxfBdh4qS36GNgR0oa1oSY14T+5kXz
	a01zK7Up355dz8RPLaOGtWwoaTGjSmmxfmS7MxKDEgfO+oPw=
X-Received: by 2002:a05:622a:4387:b0:50e:60d7:b272 with SMTP id d75a77b69052e-512d32e32d3mr120093491cf.41.1777977210065;
        Tue, 05 May 2026 03:33:30 -0700 (PDT)
X-Received: by 2002:a05:622a:4387:b0:50e:60d7:b272 with SMTP id d75a77b69052e-512d32e32d3mr120093211cf.41.1777977209617;
        Tue, 05 May 2026 03:33:29 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb69698sm608975275e9.1.2026.05.05.03.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:33:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Robert Richter <rric@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Alex Dubov <oakad@yahoo.com>, Alexey Charkov <alchark@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] mmc: host: Move MODULE_DEVICE_TABLE next to the table itself
Date: Tue,  5 May 2026 12:33:24 +0200
Message-ID: <20260505103323.207010-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2716; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=PjW+DnQKVSB0mT0jRom/dUieI9edI4FfKspoUTAq0v4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+cdz46Nekv3Ivsw0G+x6XR1JfbSXw62V+jb93
 pR1j5MH3/SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafnHcwAKCRDBN2bmhouD
 12u+D/41b4gKZmew7PuY8CCotWa+e/dgECIHhATwN3HmcshZwBB50gv8+t+O0BWCDSd2TbGG/LL
 dlxAA2dvt1UBmyMJfYKMkkwz5Dl6qw5mRiQopBVx2kLPzHS+kw774ZiMJWR4FBEjEPXf/akIFfe
 NClWF0a1zmC8fXPnmpgkPLcUeTsi+OysDqZk8Bzq5D/sYZNfXrMzkMkWXDHBYINDmGsSdBoZdPk
 5cYV22KU6zfZmHrYZGiTE6EH4nwXqgbdvZxn8cA/lEfBn0XhQ54YKc8M445nK+ECBc25tp2Rsy9
 X0wcjZ/4KfowYSs1h9lYEPlHH1KQmtj0gF99N/eSKpMyFprJlYGBlgtgs8NLoNg79gbowwOw/t8
 9Cpf2QJxzkHI8GtsWI35WhnlupQri8b3dDsRN2Vtc7N4+jqgUxgPzUp8298yT8kr0IvDFQLkole
 0HofMe99yucWpMzw+RAtPWXgUNBPXiVbYpsa/orFYV/8ScmdglsPqVxOIfh8NkyztVSksplcg89
 jETZErRwdldhNyS6yX45ZeN2QKS3FDUHyEde1cOE4b/W/88JC/WNPWG1laXdpSkiCpnYhpgnId7
 4IB3WpDcx9dcH+ckNH3VM3ajzhuITonDYiyY12bTqEouX8FWbDHv1xvWwihmSvdXUmUje+7yhL/ XnUTcl2C7BI38aQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4p-z9fAe7WlRIlrQ_6-xIqptD5Z-Jp3_
X-Authority-Analysis: v=2.4 cv=d9jFDxjE c=1 sm=1 tr=0 ts=69f9c77b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=UPwjdVLwzqKTMXskr54A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 4p-z9fAe7WlRIlrQ_6-xIqptD5Z-Jp3_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5OCBTYWx0ZWRfX0cfLjnYrZ/At
 EVCSY3ekjGSwJIkShQKXxMFV84dH1RPSt3VB3WQKwE4QbPEXzry+QFwB5wwBh4uVeVW1IV+OLsl
 VC70W09Uj+sMZ+4bFXfw8ARZrfS4NAUwzqxRFfdG3gnUQtUO5zdryAab0R2uF0iMiT30DdTHQU/
 HOa0rfqyxZLIMlzKyskoT+44rGFeCuSAzCf3HfVi9Agghz/l4E5/LzjFGCyFlJM0mtKOqadZYM+
 OgigdcUAzYMZWsl27/Y1zJ552jJXN9aOt1c7xaTSkeV0u4fFglSYwfcSV+sj2nmB1+U/gR8nYh2
 dTEbNoCntKdvV8ivKW5Fg+3Y/vnhom2Q34MU26mAQSzvUMRwFlK9kon1iHDHtR3T9PLa9ue4GEw
 UjwMYKegMUe6ONLemLF8tJENyyVEG1HAOYR+Si64E2uIu2V7KYne4onuya+p0Qqyj09+xrBPWT/
 s/H1j2spTPLm5w+BbSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_033331_787554_E742C068 
X-CRM114-Status: GOOD (  18.64  )
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

By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
exports, because this is easier to read and verify.  It also makes more
sense since #ifdef for ACPI or OF could hide both of them.

Most of the privers already have this correctly placed, so adjust
the missing ones.  No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mmc/host/cavium-thunderx.c | 2 +-
 drivers/mmc/host/tifm_sd.c         | 2 +-
 drivers/mmc/host/wmt-sdmmc.c       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/cavium-thunderx.c b/drivers/mmc/host/cavium-thunderx.c
index 1373deb3f531..84ff6d82ae3c 100644
--- a/drivers/mmc/host/cavium-thunderx.c
+++ b/drivers/mmc/host/cavium-thunderx.c
@@ -188,6 +188,7 @@ static const struct pci_device_id thunder_mmc_id_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_CAVIUM, 0xa010) },
 	{ 0, }  /* end of table */
 };
+MODULE_DEVICE_TABLE(pci, thunder_mmc_id_table);
 
 static struct pci_driver thunder_mmc_driver = {
 	.name = KBUILD_MODNAME,
@@ -201,4 +202,3 @@ module_pci_driver(thunder_mmc_driver);
 MODULE_AUTHOR("Cavium Inc.");
 MODULE_DESCRIPTION("Cavium ThunderX eMMC Driver");
 MODULE_LICENSE("GPL");
-MODULE_DEVICE_TABLE(pci, thunder_mmc_id_table);
diff --git a/drivers/mmc/host/tifm_sd.c b/drivers/mmc/host/tifm_sd.c
index c1f7d5b37911..aebffd3ebf60 100644
--- a/drivers/mmc/host/tifm_sd.c
+++ b/drivers/mmc/host/tifm_sd.c
@@ -1044,6 +1044,7 @@ static int tifm_sd_resume(struct tifm_dev *sock)
 static struct tifm_device_id tifm_sd_id_tbl[] = {
 	{ TIFM_TYPE_SD }, { }
 };
+MODULE_DEVICE_TABLE(tifm, tifm_sd_id_tbl);
 
 static struct tifm_driver tifm_sd_driver = {
 	.driver = {
@@ -1070,7 +1071,6 @@ static void __exit tifm_sd_exit(void)
 MODULE_AUTHOR("Alex Dubov");
 MODULE_DESCRIPTION("TI FlashMedia SD driver");
 MODULE_LICENSE("GPL");
-MODULE_DEVICE_TABLE(tifm, tifm_sd_id_tbl);
 MODULE_VERSION(DRIVER_VERSION);
 
 module_init(tifm_sd_init);
diff --git a/drivers/mmc/host/wmt-sdmmc.c b/drivers/mmc/host/wmt-sdmmc.c
index 1b1d691e19fc..489daee4f4fc 100644
--- a/drivers/mmc/host/wmt-sdmmc.c
+++ b/drivers/mmc/host/wmt-sdmmc.c
@@ -744,6 +744,7 @@ static const struct of_device_id wmt_mci_dt_ids[] = {
 	{ .compatible = "wm,wm8505-sdhc", .data = &wm8505_caps },
 	{ /* Sentinel */ },
 };
+MODULE_DEVICE_TABLE(of, wmt_mci_dt_ids);
 
 static int wmt_mci_probe(struct platform_device *pdev)
 {
@@ -980,4 +981,3 @@ module_platform_driver(wmt_mci_driver);
 MODULE_DESCRIPTION("Wondermedia MMC/SD Driver");
 MODULE_AUTHOR("Tony Prisk");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, wmt_mci_dt_ids);
-- 
2.51.0


