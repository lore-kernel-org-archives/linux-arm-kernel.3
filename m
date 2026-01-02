Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F615FA3744
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 12:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zLiUNZSnAo9t78mimXccZs/6MNf7HQaGBca3M1GbB58=; b=OSRY3ftZW7mUYGaEclvw6Of3dj
	YHN9CjZdYSQzNgREXe5EK5RJwFWKeSvtMxgMHcDXlLhUZ/GPiT7B3ZziOXePrP43kiMG5uqvis5qA
	9kFsA40OFw8+wDmcJQcm+3chacAMWWO4xi2GYl/qhlg31lqiEQr4Q2EoDbhZPHF5j6BHaF2mnP0bs
	g5TbScPH0POxRdMu6SxB9owkgIfOpEa+JZvN87wOUpQK7aDh0vDveOwlzAxzvqcgYy1Y61UA1XZ9R
	OuA/ZPRfAqrK79hZ2vTf6sph3ic4CNeQfZy8B3GEGPBFMDHM6uoksYjsOiZcQNPdHyb/3M5yppJ/Z
	6q0INh5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbebW-00000008Eiz-03CK;
	Fri, 02 Jan 2026 12:50:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbebQ-00000008Ecn-27e4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 12:50:04 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WC2B504776
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Jan 2026 12:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zLiUNZSnAo9t78mimXccZs/6MNf7HQaGBca
	3M1GbB58=; b=QWsp5iE9ab8xJ597i5D7toXb901fdK12hZ33wV4DbhtU2Z9otu+
	quK8vg2iidBwngPCsR0cKI6J1AJRw26HrB+oqJncGhYkaRNgPVILHsXoeUrZ6Gag
	MivsT7qJ5pdhnlliRvJxGXOYGmz8Pr9emp+g7gfaqzzpD7L11fMa6n1O/O2PPyIV
	xv7I5Rx7lskbMSLFgbwy+U9VJhsC/xcUbRi1GqYHJ+U6KHLIKDmcLC+lOlYbjxZY
	8nl+HS5HFWMDQhVqSkQ+tzQ9djHBb6X6WakeOxSJwilaaDGmO7R0xvCg2UuQjZlr
	qNnaJAtPYDdHHMJvRc5hpKc8BgSQrHbqd9w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be8bk8qjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 12:49:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1d26abbd8so368219071cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 04:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358199; x=1767962999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zLiUNZSnAo9t78mimXccZs/6MNf7HQaGBca3M1GbB58=;
        b=D9mMgClNHJ21BL7Hr0Odqjqm4lzIy6oVxxR1PU8dHlZWg/iPKAUG+wMb6s3MB7sK0L
         jVlCUfGLeVA64eGpGFLY7xubfbIg8G3c8d/nvGXipiW+r0kYp9rJT8p9Z93yvfM/KeT1
         LcqkgEoNvhs3QgrPRxOnhUuIk0bB6PlZgDieu44Gc/DqlepHxThJM4lxu++pSCXyTXxA
         jj3EA1pHOi/SEiAurfqPh74WiJuAvSpTTsZHhLdNFYpWj1wwJ55tYoDUD2Is2oOMtwQ8
         7+TqeQhrttLAMSgTKkOx373iX0CDnSsam7Sj6SYNqfbC+57Yln8HAScBXTs+8lXUxmb5
         bVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358199; x=1767962999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLiUNZSnAo9t78mimXccZs/6MNf7HQaGBca3M1GbB58=;
        b=N07y+qcgwl9cllRSsW0FQ/9VORLlXT7GS7+cZ8+3tvLwk2vL9bWksnqovagWuEIlK4
         oXkjiHiwd9R0mPVXKCKd26ClIF6CaU4PGfGk/mX0GhoWYDcOTUazM535LWJGTm0s0yox
         ldPGOr9eGg/2OWgQDWhbxwk8cMCFdgZY7mCjcAEUN5pmYEDonkNk1Pzf27lW5+aEvSnk
         YDN8Czj0qxBNDC3DU7haszhb5K1m0yQcRLx9SMv/+g8v8Upa4Ue6Isc8AtvL6hFIGAC4
         1808Ig+y6q2vek2STHt77kaup0qdjKms1ScydRYuMsdMb+RYP9fIgCyBEuzdIy2rknn7
         q0Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVU6iyHKV8FYC6gEb4K+dcsYi3G6OwzVtoyyoqWTOMYojV7swua3Vvdao67w/t2GmIWHYmpcIH8RDL7xRFR+RVx@lists.infradead.org
X-Gm-Message-State: AOJu0YwVCHL3ZiLzagodGii8j0YteZPKjVeR4WaMn1mkxgaicbaV5DHD
	MlKNyq6zzu77EQNIhLPrIpF1n+/3tRaU+o37ZuhRzZY02cwNDOsGdBacHKvh2Yhb/MtjdrN1UNF
	x6OpHEg+e4RyEOL7BZRkWFVB0pUmdeBzXVJea8Mdj5I5GwDhLAirn49wItU3ItHorIfuG3uJ7oJ
	RqJQ==
X-Gm-Gg: AY/fxX420tqsAktpkYo6ky8Am/UnkjaBeYmSOp6bwcm4mQBINQlKwTmupnJLxhB3eA9
	z+SDrgX1dy7C9OffXgKerMAiz8As616a1ke8kBGZMgkn3BfMrik9ANGCDeYknxs5KutHrfwmLOr
	KXsxSY+TpUtBcxDage01OveYoC4Ief7jocNYnvWUrkJ3Y/gnrpa4eGlyDDKqjM5zJ2esgga2Co1
	LM3yUI77uUPzp4erM8hPeS8+ZCangpOSgQTovWUkn8Ec377belNXhlTwsoVmPFza3qq0eYW9EW8
	kS14nAGr8vgA6zMjgSRIAm/Yy3luqFfviE8U23eJwg19/wnndaxOpEehHlxKfsI1v3GvZlBTGwb
	hC5CLUChoCqoRn6LpKPgUXPr18A==
X-Received: by 2002:a05:622a:180e:b0:4ee:268f:baa2 with SMTP id d75a77b69052e-4f4abd01701mr641766261cf.27.1767358199051;
        Fri, 02 Jan 2026 04:49:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZagIXa4K7UiwD5qxXFieVCGwspFO5xpb5gF8sjqKgHUder8jH1otxtn+PNVNQiVr37FiqWA==
X-Received: by 2002:a05:622a:180e:b0:4ee:268f:baa2 with SMTP id d75a77b69052e-4f4abd01701mr641766021cf.27.1767358198703;
        Fri, 02 Jan 2026 04:49:58 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa477bsm84559575f8f.36.2026.01.02.04.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] media: samsung: exynos4-is: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:56 +0100
Message-ID: <20260102124955.64904-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1366; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=7Kxp4rafP02LArCpSg5dncCo0KyLbUptXkzMYKxwphg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV77zD2hVA5D57NH58kYmrfiyJQ3QXONoILlur
 6D15JdueleJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+8wAKCRDBN2bmhouD
 17PZD/9Lij+SGI18r/gFDiIrQhcXUCtmYd3oxV+HNEyfOOtGYWT5QXmo5Vc4ZPW7hLRHTYxd8z4
 ufqwqpNHT4Bd03OrijU1h1/htWdD4OW3w007czSsAeAi4wtfMk2OrydUHW0ZJny/VB3f9tpnHPH
 u3o6nULvSNMZaj2pzRwHOgNXajwzS8eXEQxrQZ9s3aaBCtAgF+5471vnQSZ95PoAHlnrjFi/wRt
 DyOM5JxExVg2cxFrpC2BKIk8rtgUHMNtxU3OZJj49C1TGHmE//EZ1mTtZ0reC5lkN0D/dKVjw7C
 WI3Vd4eXAB+yrdYhkCIvzPxM4jQ86R7lD3tv1aOTr14lsa5aZTe9UaCHyYjwUQVKC1jlwRt/TW/
 i8BQD/1YzAgObycfzQsOytiVA+Ra/KtVZy5RmwOLfFBDD5c5F/rSVCtxz8eYbX69RxszY/vFPqf
 xeTzfWFTodIr5hbqsod6LOYsMiOQT9vLQLLZRUtbfbtSknHzdNnXxeoAlwUtailGSFYG6TnXBFc
 LYV8Vdhs3uS8Ji6jN7tboxFJqwyWXNWxNE9rT6hoM221vdzHRKIrEiel8t1Zs0uorXtVPPYHL5q
 vhyb8LR0ZeiKkdZTKhFZEZXub73MILtbU3mTTMvlMyuGUQDDysTs9WfV/AfgRQuPGFSCJJovGk4 mjjujELBTaPYcWg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX3WoyLUG5Nj7u
 r9IHGXS15YCVbPA8TVNWD8SHx/zL070BeIM11DcKTfmPLv6+nAgvz+TCD353etT6uBX3fgrhIcm
 LPhB8hOTRduwjjqCDiTBCcJ7wM8bhaukB9+/28gPslyh+48fcG7mank5S9pIhrLTB/muYFQwsrG
 jLifcr5UjdN6IpbyImY7ba5qCqSA5UozOi6jGe3nsESAoBOfShmWYjBpNTPPoQMDvaU2M1wGngE
 QgTncm6Waf46kn07BRLjiiqYdYGAueK9n0pjbYbARYRTyfNEXjSeLpGavq07xgSNCnbTG0iB5f5
 QSrBoCUf5eYJ/ynlc0F2OGZiKCL9ZPJJ32xT8E+zvEBsOpn9fPUIM8BRXkIlQ7NzMM9u3rIgvcd
 rBzmtBTaV0UmSE2zdAsq35IDV2bRvjcPt1aQT91jDTsmQxcyEzHIT+9d6KU7ppML3Sd2M0ALIkf
 HxEL48jrkrXYkAS/DSA==
X-Proofpoint-ORIG-GUID: JC-fw6ZJdATb5uAATiPYvOdFC8kJoP8T
X-Authority-Analysis: v=2.4 cv=d5/4CBjE c=1 sm=1 tr=0 ts=6957bef7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=i4aJ-GEgVbPWXsRE1ngA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: JC-fw6ZJdATb5uAATiPYvOdFC8kJoP8T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_045000_624363_E249A132 
X-CRM114-Status: GOOD (  15.46  )
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

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/media/platform/samsung/exynos4-is/fimc-is.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
index 0827fdaf455a..14d84cc96831 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
@@ -200,7 +200,7 @@ static int fimc_is_parse_sensor_config(struct fimc_is *is, unsigned int index,
 
 static int fimc_is_register_subdevs(struct fimc_is *is)
 {
-	struct device_node *i2c_bus, *child;
+	struct device_node *i2c_bus;
 	int ret, index = 0;
 
 	ret = fimc_isp_subdev_create(&is->isp);
@@ -208,11 +208,10 @@ static int fimc_is_register_subdevs(struct fimc_is *is)
 		return ret;
 
 	for_each_compatible_node(i2c_bus, NULL, "samsung,exynos4212-i2c-isp") {
-		for_each_available_child_of_node(i2c_bus, child) {
+		for_each_available_child_of_node_scoped(i2c_bus, child) {
 			ret = fimc_is_parse_sensor_config(is, index, child);
 
 			if (ret < 0 || index >= FIMC_IS_SENSORS_NUM) {
-				of_node_put(child);
 				of_node_put(i2c_bus);
 				return ret;
 			}
-- 
2.51.0


