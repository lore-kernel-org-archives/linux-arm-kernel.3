Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77F5CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 07:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FYOzg1Fk7Sgk+JACbw9qdH4YfBZnKqaT7rzqbcYZULE=; b=ZzBjIwg3pxyz17mMnJFExmU3ZB
	zSHvtX1GojoQS397Cu5PqJ4+f2RTuPbQ9VGiVffjBoG1FhUwVQw5Jb1s5t8qiSgnX9yastdAydlUi
	bqv0w5qvhwx6oXXaEwDFXlX9f8fOKjOtqmjqi/ziqJTtZvVDyF13GuXO/s3XegF5m40lZPKvqUUer
	xCAswOfU9Lpo/fXIzc6HMl9Oh4rfo0oOD3eO+8SDqYZ2EKXzfdHyM9uywabaU0TsvVrgTP4yu0Iyr
	dfwRLn0EplrlXsI/RLzmCr9tRay0Btimx/gteGG+U5n6mbMOawweVkQ6R/JOQFnGaigXpRvw++Zlv
	DxlH1pnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUg0s-0000000ETxh-2vLV;
	Wed, 03 Jun 2026 07:27:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUg0q-0000000ETx5-44GB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 07:27:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RHmj2076092
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Jun 2026 07:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FYOzg1Fk7Sgk+JACbw9qdH4YfBZnKqaT7rz
	qbcYZULE=; b=oRoN8/vI5m8H2bkLd7NMzQpQhy2/wmJ/idkPGfPOZViN3A34FCr
	n8rNMPjVIt3uMgsPzOeS+wxUqBYRfTvQTG/cow1aQGxZhakTMhTcVoDgP0UVOkSy
	fo03dCnvcWcdskX/y4kiJCqzbcEI3a6zn138QDUctMsh2pI7Xxnm5qjf7oBINApJ
	GSnjxNPXRlFKJPF98xatbAsnvyQceOndslFa8NOoPUScVL6gj61GDD2dvPCQ6b6q
	al+5foNI4DEgZLQSmfpdIbyL5shA1zqE4J5CfHEO7Khs1i2CVbPuxeOm9EuaR5bY
	4IDITVCSYzEfulicf/1kewr1V8KIoHy1ysg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejev189tg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 07:27:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5176d949c58so9502001cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 00:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780471659; x=1781076459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FYOzg1Fk7Sgk+JACbw9qdH4YfBZnKqaT7rzqbcYZULE=;
        b=ey0pdTC/sfbH5B3fcS/qtHyF+GYIhwvPze1ApgrLTG7pJ8Z6vSkNp8/3oKF8CSna67
         uxIVgKQhXgezPp5vA2MDH5wl/dZ9OUsBsLZkESUu5mDwbAoD2/FRck1w3tUa9qNLI4Xe
         44GDGBwkto7PsVsqa4EBGivCs+hm1Ip278a1bgMoZkd7x5VBm/GsfeVexCShyCRg5oX6
         ZiCig+8i6gWP4gWnPpHqvCnyfsDb3urB2kNci4rDdq+rnmZiFtWjLDPqpyFWv9DWEP0g
         LvoRJXqJaCWWDC3aoG6w6wx09Jg8zDQ99IZMyPbIIp5Df8OBL8kngTTMoYH6ZKucr8CX
         jMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780471659; x=1781076459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYOzg1Fk7Sgk+JACbw9qdH4YfBZnKqaT7rzqbcYZULE=;
        b=JNPhpEG50W15DmzPhp7HEOYaB8Zt61lcvG/nYiK/TFNIftgp7MyEIYZEmeaf9wnJgf
         oew647CkTo0dqwk3qDbtLidyJ7diL7AKBdBBx0mXMVaqPlPG1pAvnX+AIe++er0wl9hq
         GGKCHixlPXAuwZl8Nb8EXr61YSuJEP8RO5KRfxG4M0WPEfwoRtvhCSZIZc3saZJggdh9
         MLOcqwOF5i6GXeEec9a/Mitf4W9hQVywIqINa3LppOtz2rVy0Gx9nveZfYLXwLgSzFQb
         CvlvFHySjAIzlTte8vmKJt9Z3Jf8wX+YBNwtBFq3w+5+OTcZdMIbLkq4aQMzhoClQruA
         qAkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9YnElmfJ9ra4tv7vuJKvfMcnglf/fiYrSIiLZscWohFGrGE4CoXq1h22qAh43HycQYd6kOrA3slUubnYTYJbKT@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhg2P1YYsI9h5WMJ7YqUKRmt06a8f7Y8NEF7L6oO+4iqeQF6rJ
	a2nIWy7yARpSiyI8PUyDvHi0bhkIgQnVRmIgTLRT8n+YzEM86Wc0T5TMsIrhvM8wsIx1uSGgbGH
	DFyy4SUaUSzbam449az9NgIkGEihdx5xZefX2xKbjDb2KuLK6Qz2hIluq1bwKjgl751UQ6UH53I
	9LmQ==
X-Gm-Gg: Acq92OGreHxUNINKWSEpMeJgP5eTck0EKGSV8wjsbyugVvC42ZHz3AcUcLeT/yJ5YGW
	9UPdV/80SXtIiP2WUVtghREWlx9i8KtSgyeFFwEDdTEvIvJ/Q3E1p1+x2tdr7pBPMelGfn6GXCq
	5DX8OMqNDKqa2nf4L7WYCJzjnlkeeAkIeyvv/ae2Uex9zKQSUUy/5KpBihNFTtodmNZjkVmlJj3
	ddzOKeoJ763EFiS7MAx4JO74UZP5OijLbZF3VDKbF2n3GF2MFgD67Gj7UHkmkEQiNtpldJHiYAb
	t0d02dGjDavyD6YOw14oSYbLenEbOhfJUw16KJj+HPLKrZziRD8umIMMisrK0PL8wOeHxdZ+I4+
	jU+GwYRpgfTo0t4ChtNCwRK8HLrsv0Wjtjixh9CIpYz8cOEh3dTNfnZw44z1IH1sEkvIROsJAaj
	mL78iejQzGzS2TS/++
X-Received: by 2002:a05:622a:50c:b0:50d:9b4a:e6f with SMTP id d75a77b69052e-517785ae63cmr36451591cf.1.1780471659122;
        Wed, 03 Jun 2026 00:27:39 -0700 (PDT)
X-Received: by 2002:a05:622a:50c:b0:50d:9b4a:e6f with SMTP id d75a77b69052e-517785ae63cmr36451391cf.1.1780471658627;
        Wed, 03 Jun 2026 00:27:38 -0700 (PDT)
Received: from quoll.toolboxoffice.it (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f0a43e9sm5381844f8f.0.2026.06.03.00.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 00:27:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev,
        Russell King <linux@armlinux.org.uk>, "Theodore Ts'o" <tytso@mit.edu>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: configs: Drop duplicated CONFIG_EXT4_FS
Date: Wed,  3 Jun 2026 09:27:27 +0200
Message-ID: <20260603072726.19404-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2595; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=rAbXFaXFU6UvePteZWVBleQLgNYQKxjPkG8bfnnqoDs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqH9deBeWI1AbqghJFz4j+0xmG3QYTxBltIGzts
 QbZR0wzmGKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCah/XXgAKCRDBN2bmhouD
 1wrHD/4xVkFvRp8eDM9rgBwX69LF/qnkkZaz849Bfft3iWPeAO7Z14ivBJiBFpOXhEHaeA81JMl
 pXGS1M2c6eAp6Ezq21bhFZyzqwiFdAfiMsFrQoEjxRDu6q2hdb+dUfUrYTnQk313PhNlnMdHBzC
 Ryv6/H/c/4a4m6cA/+ewcLo0gMKxarDfu91WTFOQZp0SvcJ6+MxWOrDc8laipUCddKjnJL8VAC9
 PgB3U53SeIiIdbFHVLDeJI1JmwyrDgJDmcL5DZPtT1MgVVyUV4lLvgeWqey2U2QgHIAsCsJ5U/L
 SyrDLhYcTfLpDwqfHIzVN9lQw/VlniyDUmN5WPxAMzk81mlaNvgw7mFW7IjU4KtocC9WsPrAw0b
 clSxFqqJHR6hHpaI0mu76nH43iOTm9QRFdxkekg0FjfCQA9/O8PcNzq9uv6wL8DQwORJhfIiMng
 rEKReJWQJ2OMy0JV625kGpyy8WabZQZL8zAJjvCpDoc81+6EiJUwPhvcFbdlOg1mty84kNCslM0
 /Fs+a7/ah23DVCiWtKbQwctAwX1aQmLlHK3eJxEkaYYdkzVO2kUopC2FuwfffA3AfC7t/U97Zms
 TJ4nHlFzpCqlPXPk6pnG66le9Ye7jG2msJmPgqqr+EJ2eS9g+fi14NZYerAtCJpLPAWy3N9jfIL VKi+9Cxx2vVK18Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 053N3TgoQZEcysWOJNd2wf7nTDjwsqwV
X-Authority-Analysis: v=2.4 cv=PNE/P/qC c=1 sm=1 tr=0 ts=6a1fd76b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=s6cvWP-jlV_YwPVwP18A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 053N3TgoQZEcysWOJNd2wf7nTDjwsqwV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA3MCBTYWx0ZWRfX96Socm/LfHyc
 DdHNT66/9dICm9sWtMVgqbV2Th86P7BkGoHRo0lvnHptle8ZZHHYPXRUgAOas/Z7gicGoTtPJjm
 jF03vCozcHX5akUvw/IgeRmNZiwFUnDlmxlob39uqMc/uuJPcFqkhpPG5ZY6+7dbnBysTXEpsYZ
 nU/nKLhxR76IuY53pODkdqTSawZDZiOhH5gQJ+p1tx+DPU+LzXAI2OG+bjO70d3aLoFQFvGHCRl
 z2X2tfBg77WAuAJKlmAVHs3me4poE6LS8NfkIs/HabauCFjt/h7JgR2pWGr7umZABV1ZC+VLtoS
 ZF7QHLwwqqiI6TlR0L4W1/bDp/aWNC/AbcouWEOlAzMH/NxDoHZWtqqihk7CvEXAbSQUfWL2T3p
 KFjnmrvmsXTNrkOAdEwvkBtlY5i1NDXVqUhMfgGQxP6jz2zWp+JlSbEkKY4AYkHoE2l1XWrbE+i
 ose9AAGsZjiQqqteCFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_002741_127367_5A7B75E6 
X-CRM114-Status: GOOD (  13.17  )
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

Remove redundant, duplicated CONFIG_EXT4_FS to fix warnings like:

  axm55xx_defconfig:198:warning: override: reassigning to symbol EXT4_FS

Fixes: c065b6046b34 ("Use CONFIG_EXT4_FS instead of CONFIG_EXT3_FS in all of the defconfigs")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/configs/axm55xx_defconfig | 1 -
 arch/arm/configs/dove_defconfig    | 1 -
 arch/arm/configs/ep93xx_defconfig  | 1 -
 arch/arm/configs/mmp2_defconfig    | 1 -
 arch/arm/configs/mv78xx0_defconfig | 1 -
 5 files changed, 5 deletions(-)

diff --git a/arch/arm/configs/axm55xx_defconfig b/arch/arm/configs/axm55xx_defconfig
index 22b189090e15..0952e5e94c5e 100644
--- a/arch/arm/configs/axm55xx_defconfig
+++ b/arch/arm/configs/axm55xx_defconfig
@@ -195,7 +195,6 @@ CONFIG_PL320_MBOX=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT2_FS=y
 CONFIG_EXT4_FS=y
-CONFIG_EXT4_FS=y
 CONFIG_AUTOFS_FS=y
 CONFIG_FUSE_FS=y
 CONFIG_CUSE=y
diff --git a/arch/arm/configs/dove_defconfig b/arch/arm/configs/dove_defconfig
index e98c35df675e..3d978ce34b54 100644
--- a/arch/arm/configs/dove_defconfig
+++ b/arch/arm/configs/dove_defconfig
@@ -97,7 +97,6 @@ CONFIG_MV_XOR=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT4_FS=y
 # CONFIG_EXT4_FS_XATTR is not set
-CONFIG_EXT4_FS=y
 CONFIG_ISO9660_FS=y
 CONFIG_JOLIET=y
 CONFIG_UDF_FS=m
diff --git a/arch/arm/configs/ep93xx_defconfig b/arch/arm/configs/ep93xx_defconfig
index 9f3c7324d1cf..ce41dc8c435c 100644
--- a/arch/arm/configs/ep93xx_defconfig
+++ b/arch/arm/configs/ep93xx_defconfig
@@ -105,7 +105,6 @@ CONFIG_EP93XX_DMA=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT4_FS=y
 # CONFIG_EXT4_FS_XATTR is not set
-CONFIG_EXT4_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_JFFS2_FS=y
diff --git a/arch/arm/configs/mmp2_defconfig b/arch/arm/configs/mmp2_defconfig
index a9a212abfd69..0ea608c75f22 100644
--- a/arch/arm/configs/mmp2_defconfig
+++ b/arch/arm/configs/mmp2_defconfig
@@ -54,7 +54,6 @@ CONFIG_RTC_DRV_MAX8925=y
 # CONFIG_RESET_CONTROLLER is not set
 CONFIG_EXT2_FS=y
 CONFIG_EXT4_FS=y
-CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
 CONFIG_MSDOS_FS=y
 CONFIG_FAT_DEFAULT_CODEPAGE=437
diff --git a/arch/arm/configs/mv78xx0_defconfig b/arch/arm/configs/mv78xx0_defconfig
index d3a26efe766c..c6b46141cb69 100644
--- a/arch/arm/configs/mv78xx0_defconfig
+++ b/arch/arm/configs/mv78xx0_defconfig
@@ -93,7 +93,6 @@ CONFIG_RTC_DRV_M41T80=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT4_FS=y
 # CONFIG_EXT4_FS_XATTR is not set
-CONFIG_EXT4_FS=m
 CONFIG_ISO9660_FS=m
 CONFIG_JOLIET=y
 CONFIG_UDF_FS=m
-- 
2.53.0


