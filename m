Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B799E7BD91
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 11:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rdENJ1I/r/EyfP8e/1I9k0INyRCFdU1Os+q8tW8nhW0=; b=4ajM863cNQgDb/qcOOCM42mn6O
	xKF8YUNgZ/+Qe7RjIgIsk6/bmvyKyqFNhl77Y7KcyNw5VmWqAZWnYm4fqREZnji1Y1V3LbA3O3Tg7
	ovaAul4gAGjmQqJ8D8NPM+qWYJQeagudoezFv1qPTuyjAVtTdrHJbHP7NUXnMn9kxRqnZ4kvz8R2g
	qT6It/O/GqlGMcpBi9MI/IQ8JtOxySgNDfse9PFPPtJ7WlUQLuOBwkFYh1PqjT+GS+jc2tfpgtIu+
	xKzfrqNbTkAl120SvMuNHZ8nCsl8ZUjZHxi8AcI+ERUEuhdsPa+L1hpbt3D3TZKJkambvdAKG2t0c
	2CLgJKCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwNP-00000006Ozn-35bE;
	Mon, 16 Feb 2026 11:02:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwNN-00000006OzT-1FoU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 11:02:50 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G9wD72982810
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 11:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rdENJ1I/r/EyfP8e/1I9k0INyRCFdU1Os+q
	8tW8nhW0=; b=e46fjgth9je/c3AmILAfmH1RzO4rR132DL6EaYoMCFb8uziRprJ
	Z+zARyShCigS9skrevnBxkzcaYOszL1nclKyO6vmc1A/Mnbd5LqwoRThEXJqcksp
	AY+bHVgrVg4RRSvx81xfQGAu8j3K1jSxWcfhYvlB9vu+WNyxD82oHh3u6JWygXx7
	2H0TdHEiu/XjtdiE6yTm4WVhtLo7y4e+l3HImKGrkZeAI9hRL6SNjJnFg9MFt8nw
	dooKaDL77zYDm0azVLi2wPEzQo0ksCe90Ys/D8vMpbfLmXCFciVnmA9xxlJ2HCt1
	phdkj+KLgnDEuk3ZbT+2u2SjawbClyBL0yg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cajb8v5ku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 11:02:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4b8e9112so157389885a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 03:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771239768; x=1771844568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rdENJ1I/r/EyfP8e/1I9k0INyRCFdU1Os+q8tW8nhW0=;
        b=CM3XXAsY3amQIl6et3mNT3Nr3L78AHBtWmXIoUY+D5XjuaWO+y2BPFRtLIiFOccM74
         M2se+eNdXr+BBSLQu8L+1FRUSxea6npZC3N0SpfPjvKCdpfn/e4RZpNYyhAfXxwVmLA4
         p8MA0dNJ1M0faiRtVg+mIlRqfM9hgOLRAf7K66pQ8pfZ58XQBoj5NGhhwPfZj9OwLslv
         YfjYcfmkET9F8cq9E2GUakS2804enl43/m49qZ37ZcAu8zIm8AqnmSYC8aiUwGHDoiKZ
         ppyLwDvKaz3pRckyZJR/K58Z0kInIxxJU/wqHtOHaXK08j2Peg7FGRge3uuO34Y9Rw80
         krvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771239768; x=1771844568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdENJ1I/r/EyfP8e/1I9k0INyRCFdU1Os+q8tW8nhW0=;
        b=TEh+4m423h2Yuyn8IeHgXrhiyIjaL11QRGPuehylG6Sgg2Lu10TCIP5P7z933rxb4Q
         rl35EzXLZ9mMt++wruluXuCTCQo+Gz/3/iqCK7YRttWNIfeDOs27cI10Mspb+h91Dmy2
         fXQUFQOLL0SBkBMwjY15kN79mxA7NAIFOEnjEAhfVQ/fJXTV4afT4mAfwiqRsJNDK0EJ
         Vw+2BliO0mZdE+meTICOzmFkXXg2UmzNmQc7Fi9ns18zBInBDHyhzOna7yraRODfAYkV
         D9WNqYFfSGSASjHriSsXeIU/r3mpe1I0JZEIkcAj0e4Xu1ZW9WvjTbcbAekSVz2RBe58
         XHDg==
X-Forwarded-Encrypted: i=1; AJvYcCXVMchWjNVSupikJsFSH7T2CGVMg6Yup6drz9csnxdRfnlkWAGvePcKyimU+ik8DEglw4ru5ymdT4XpbKeAM8Mv@lists.infradead.org
X-Gm-Message-State: AOJu0YwSI39jq80Drx2t8NVoaM37r2yMK4jvyHieFKfDNd8yEjs71RKk
	+msKvkeWkvh0BQI52P7+3r2AMit8OLqbDFPeh8coQegQj344WJ54zpXaJIiDSdegUz1Y88zV1JZ
	UgQtysp2hPezuUt2eR8dY56ezSjOrkUDEWu0JzqxZWW3db5iXx33WaqfJ8naLxkcEDTPkA/SpZR
	NTfg==
X-Gm-Gg: AZuq6aKuRrqsxve0x81yQUK1c4BHQAq/uyK65y/yUFOVgObB1jdZjQYVD88V6gsznlQ
	T+FRo3fkOvAkudt2u/eC+o8xWZ3fc+t3OojZMmqOlsOp7GivoFp8EpwlyabdBJFf/2HH/lGSrob
	yrl7dTQYtRu5KcZRuJEA5KRemQouL+rwprSMqkNtWip2zI/hICWz0VtQaxX2vUIDKi4SWfkHl6y
	M+Ydx6k+T84CgcXwpk0UA1tlF/B3aEPxs6GUj0sMY0y8XtssIDneA+JLvsl6cyaEbDRLVFJcBpH
	CoZ9E17rLBfg4yNJyZMIl/lk01GDYL/BUlsfp3xdhTOzlbLIQ2xqyV6wH27V+bR2SFht8J+cadO
	loBf67px1pvXMFHVwLwsGHG77Y9u2mJGftgdatw==
X-Received: by 2002:a05:620a:a102:b0:8cb:4ef2:f3b4 with SMTP id af79cd13be357-8cb4ef2fca7mr649159185a.73.1771239767642;
        Mon, 16 Feb 2026 03:02:47 -0800 (PST)
X-Received: by 2002:a05:620a:a102:b0:8cb:4ef2:f3b4 with SMTP id af79cd13be357-8cb4ef2fca7mr649155585a.73.1771239767195;
        Mon, 16 Feb 2026 03:02:47 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d99e194sm326264725e9.8.2026.02.16.03.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 03:02:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] arm_mpam: Force __iomem casts
Date: Mon, 16 Feb 2026 12:02:41 +0100
Message-ID: <20260216110240.159691-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1708; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Rds3PTVkKWxwWn38jsDlfBy/btVot4gFCGSRaPiKkug=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkvlQptgO/Y8CPRdBZfUG1LIJu4D6Kh2sM7QRX
 sJ26lfc9liJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZL5UAAKCRDBN2bmhouD
 1/NUD/4sneth5O2F1CucDzgKp+d3cfiIAD/3FnwRZYt8SGC9x0cxMiCXPYW9RaTFSLQHGDYHVX1
 CXjv1KqbKFD2w6GWwr+XHffTRPdGH28VjlC0lL4IQ9o8PhLw/MMTcLU4rZpK7TQ1E61R18dYZKp
 WivL2M2Bi8WJ7QSu17rJkMprD2my2qmNkU37aND+RjSPQ9sqk85y7Yp3emijKdSPFCRx9O5xRIs
 ag43yjToLWFXPLxkmltW66an6x83+cmq/V+ED3eRABlIa42ygwc/zxbmMFwbytPKz5fDyzOhWpQ
 LPdnziVZguWeOVUyt/EAGh2OXcBWyEw2f8rVoT0g84X3NmHcPA0azaYtnzPAeoDoXgdgO/F/H3Z
 16fmwFM8eHzbLAlajeD+tYVAxDFqavG7iIR5i2r3sd2Y2SSeuCi65vVCnwtSqSTgMl4en7D91zb
 qHQEw77ZRwzmlcpmmjNQopndQzWQ0E2R06lHvE7f2l2ahHU9y0tpD9kCv7T/RpnqSlRxFQ/Xzb5
 H8nnPvLkUTv5fWGwBrduvvQc/ktZWhFA3ZlIxI+tnNhnbszm+rrGodwTYS9OYIZnpBCOM1xmX9e
 PW0fgS9oChOiNIo/WGMKyW+PTa0MP58pe8CaDtqog/KgWEjmmfHTP5R3gUYUNHRtcyD2M+c4Azi 3OqF6on/2+O/L2A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5MyBTYWx0ZWRfX1oJv3gmYHl14
 LYiImCuMOJess4YS9iomvi/HqDmYUyx1huGBJ9yDI3dIPUoyk/UuSqtqWu8UdMdXfwJG3iRCBJY
 tzXMe3BXkypEFKaQVmwqZwittzj4faT7i/uvjmixYJlBtHgIcWWMpLoU8Id7Zj6aob4LJQd5bXk
 dneimnvzB5kwQBMvpBA266+xHBKid3aKHaFiWmpGtkAqjTObzhKBcXwonPeoWUToJM5K2+eqIkB
 YGuk7KAGtnD9X3uqzcYhUpVJMeLjV7Y3DhpghA2puXBjKKUoxs8jqj8ICt26EVe6O4R9Edk2k+U
 22/xVJ2EE9Y3vWVoq8C9omaVjZo6/Rz5I+jrednu0a2NU31SviOEAE0tONBTqZs1+XrJYdNrxSD
 QFB+euWaUvm05RZaBEAE8IMyGz7FxAWAUlJ7jllZIw3ub36yYWkcP/jXBoIw+YfmqHaAMxyvKLv
 RRg4MDKNM930Ud4tX8g==
X-Proofpoint-ORIG-GUID: 71nabscFX67c07v1GsWQVcbUpgYOw9_p
X-Authority-Analysis: v=2.4 cv=Pe/yRyhd c=1 sm=1 tr=0 ts=6992f958 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=ZAxJu9IyM0E7pVcPTG4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 71nabscFX67c07v1GsWQVcbUpgYOw9_p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_030249_361646_C4296AA0 
X-CRM114-Status: GOOD (  15.76  )
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

Code allocates standard kernel memory to pass to the MPAM, which expects
__iomem.  The code is safe, because __iomem accessors should work fine
on kernel mapped memory, however leads to sparse warnings:

  test_mpam_devices.c:327:42: warning: incorrect type in initializer (different address spaces)
  test_mpam_devices.c:327:42:    expected char [noderef] __iomem *buf
  test_mpam_devices.c:327:42:    got void *
  test_mpam_devices.c:342:24: warning: cast removes address space '__iomem' of expression

Cast the pointer to memory via __force to silence them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/resctrl/test_mpam_devices.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/test_mpam_devices.c b/drivers/resctrl/test_mpam_devices.c
index 3e8d564a0c64..2de41b47c138 100644
--- a/drivers/resctrl/test_mpam_devices.c
+++ b/drivers/resctrl/test_mpam_devices.c
@@ -324,7 +324,7 @@ static void test_mpam_enable_merge_features(struct kunit *test)
 
 static void test_mpam_reset_msc_bitmap(struct kunit *test)
 {
-	char __iomem *buf = kunit_kzalloc(test, SZ_16K, GFP_KERNEL);
+	char __iomem *buf = (__force char __iomem *)kunit_kzalloc(test, SZ_16K, GFP_KERNEL);
 	struct mpam_msc fake_msc = {};
 	u32 *test_result;
 
@@ -339,7 +339,7 @@ static void test_mpam_reset_msc_bitmap(struct kunit *test)
 	mutex_init(&fake_msc.part_sel_lock);
 	mutex_lock(&fake_msc.part_sel_lock);
 
-	test_result = (u32 *)(buf + MPAMCFG_CPBM);
+	test_result = (__force u32 *)(buf + MPAMCFG_CPBM);
 
 	mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 0);
 	KUNIT_EXPECT_EQ(test, test_result[0], 0);
-- 
2.51.0


