Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163D6FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 14:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5S8tE5yzvb2fyw/Yz8Rd+CLj6vFI7WsTMQxLJ+Sx+CA=; b=eX3Hemr/qJ4MTFiercbYlAxOdr
	RZGniPog1YRCE5AP8F+hMshzf9MDW4sMjvTuUoS9rcuvjsTu1vxgmBtWzmgWwCDO31dWzRUhwawe3
	cLCTtCVgrJ8zVMla+BDyXsXaPftICH6c70nbX8uV2rwMtAInVL/BG2sEx52yMJlRu2aV/TW9nVju+
	zieasUSZHkc2fhBD9lwp4uonMPNMcWLLCiBPQkyFFoZaKPKyO+IO7C++EymBYeOAwlCPZZUpED1Bz
	9+nqoQbqKEZ2vv0uEGUrSxpWsUYyocUYheXKwndhR3CmNUgcOf0PFmdz450V2w7AY0+Pc25igQXoS
	4yJJdHVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wISRX-00000005aQ6-42rG;
	Thu, 30 Apr 2026 14:32:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wISRV-00000005aPj-2WMz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 14:32:43 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UDNefg2480926
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 14:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5S8tE5yzvb2fyw/Yz8Rd+CLj6vFI7WsTMQx
	LJ+Sx+CA=; b=bToY5agWO/udXWYglmQgQd1UTbrOC0ps2TVHgkv6vmudfpGVkhq
	1tLOEMGB40BPa7gc0pxj/WW4Ug7a51pmNehcZi/R6gskGEA58AMl2a7qbHtU30R4
	lN+xsB9ElB9YFhTgpOFo1NfN1kJVjj7UBdaBhYVgxmsypcuge0RaaiWspPTz9cVR
	7uhgKjSiOBvpGpBBXAKSJmewj3eCnud911kQe5CviXSRtRYlARNOUxn2nkbat+t8
	am2axvwPn94BQzmZKWCWcuuccmiSlOx65JXdCtnntP8qsBq1M6zksShzGle3wO3d
	vuFWu4+BtyX5sPnrPldtUgsgf89lrl4YDAA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv7x6gbk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 14:32:40 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-47c6f914623so106850b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 07:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777559560; x=1778164360; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5S8tE5yzvb2fyw/Yz8Rd+CLj6vFI7WsTMQxLJ+Sx+CA=;
        b=Boh+dRE/O3HxBlNZ73DErgxu318Sisc+uyi3JdVCa4Wq/eqdJ2DXIq5a1//Hx/D6x3
         75SlbeJ1vBibrQQv6J/ujZOfd55FhksY4vEDCCm6keqci9ZAiRhdEgwi7+/9MoY6hHtA
         5OjysD0lPpX9P+d3uEay2/thAr8J5enSNkT52TjIJmBNk3XASpG4Qjsw6/j13qGNyVuV
         bJ2MdW30vK6lnUQItFu06ihzVJizDjOwr9cOsxKuKaT8ySH1ND6Q1dv2nzsyGVSF9ch8
         nH1Pnxpc7maX4EjQF4roQ1WbYmgmnHT+AGhFHdTbNAAtnZT61bHDaNBqZBYeJMr5H+bO
         LnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777559560; x=1778164360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5S8tE5yzvb2fyw/Yz8Rd+CLj6vFI7WsTMQxLJ+Sx+CA=;
        b=aW43CM2XOo6GaQajPyfWsh9yH7ZdeFFr66736Qq3uKq+ULx8jT204t67ezYLwaUUGX
         kxhF0G3d/apc0r4TvHBBirhejk5Yan8MeGImoUMLtrCWdFLf2PqOUn5A4jefKmCWP//J
         Jf97hYZGDjsMY1pOr23YUiJQUx7y59BNq+l44FaaUzfnzKjI+mokFFRE5ffZRLY5nRdh
         p8HhsDhnL345DqyzM/o0v486sz9eUazJ9bTZljn5Mgag8Grm2B11KDbSzpWuNoy29ycV
         hzEVpC+V9EzBV0osq17x2divcinVqUHITYh3SN0iCAfHVzqTW2lLvyVKINAaHBBEZQf3
         E7dw==
X-Gm-Message-State: AOJu0YwIfwJpAcdykOwE6thA9Gwm7pvmzTTi47LwiU6uTRj+QpVmuaLo
	3NOcWPcN4Wdx1RpnPI7VfjhlWdgAYMSyerVRezzFJkDMKv8mDBXoyM3RqlUmeY8u7FgSl3Xi57O
	EUC1TmNxTDo7p+Lg2wkbPh1K85GSPNIgoEPiC7anvkyJ3XwF02J1X4xrulyIgneS5JEnzZSLqc+
	wr1A==
X-Gm-Gg: AeBDievZ1ULTN7S+ywTFLmIl+nK9SE3424ZlZShhWkCA9YvWsRpg7PmqQynaKHUPYKO
	WMAlTcGTuNmsRCS4d5q1vqnOBWCtSVBFtN/PyOCsExbZ6ajs6hQvD9T5QUlLdtn0pQ12pU59RfD
	6dyKltcxkTNkhUFubQw36PLttKgZtd7SXzwsH9JAVCY6muR5mcaAjVx7PnpfL3eio+D4QaLgHxj
	UTVqO6LcBvOw0s/jA9adq2oqgu4T9PhfdIk0pDoe1R0mZNIeH3CEolpjiwK/CIQlR2qiQXJQkjp
	mrJj3lsUNBMtbcMpvh3SBsREMTcysE6DCzBnG1/Hm+LRAj1cmopT4132+CqcSZJNUOuXEKEfWVO
	ArCkTYvVXI9KfkLEieDB3pXQWio8txLD4ZmHpuNYEAGdJUwwxp1T4q8sHlmTw
X-Received: by 2002:a05:6808:3208:b0:450:d471:dce5 with SMTP id 5614622812f47-47c5fb7e8d1mr1727801b6e.6.1777559559869;
        Thu, 30 Apr 2026 07:32:39 -0700 (PDT)
X-Received: by 2002:a05:6808:3208:b0:450:d471:dce5 with SMTP id 5614622812f47-47c5fb7e8d1mr1727768b6e.6.1777559559395;
        Thu, 30 Apr 2026 07:32:39 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:85ad:7a05:49a6:88be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c3058e5sm43675665e9.16.2026.04.30.07.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 07:32:38 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3] arm64: Kconfig: drop unneeded dependency on OF_GPIO for ARCH_MVEBU
Date: Thu, 30 Apr 2026 16:32:21 +0200
Message-ID: <20260430143221.108382-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YjInSsQC1p0g07HVfrkfU9KQRIt032Dj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE0OCBTYWx0ZWRfX7O1JtlDOM6RU
 7j9DNBd+xSCkh4jIgW/7zEA1axJ6Xvkivh0uu8FXsa06d/7M/WB6Pr3XaVrizGYwNn5KAbCCmX+
 1x6fH9UxOScdYsqSaEBm67w5J6ekQKkvZvm7XpcaoLv+5qsFDwmO4ZjbjGRHoYF5keuM3W6TZGt
 eDjeoUniIUPkMbalmkUj+rRj3gfZNm1Pd4lOnXDjaxj2YxervgSSpRA/3OqjdDC2oQTNdJcdLki
 flmX9j1XJe+/NaCqRFFey6fpSOHK0HReUerQ5x+Lsf6IrMEWB9j5SaHrW5cXdl2J1PFpm5MY6Kk
 UzdEGV6iffcBAV8cXcTQX3in6ofibWDUdmnjmATFhiny+cjNg2ouomGBSwoETQlxOXieP8+E/vQ
 xDURjwoSOtS/V+62L+BK99Mx3T9uQSRTf1jiYfe7/m8Jy84Moo8OyTCXs0Iu2J/0/qPLeWeOSYh
 l78tOjNAHM2m5o7XN8w==
X-Authority-Analysis: v=2.4 cv=XoTK/1F9 c=1 sm=1 tr=0 ts=69f36808 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=ZOGCbQUdEG_qiAXPShsA:9 a=TPnrazJqx2CeVZ-ItzZ-:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: YjInSsQC1p0g07HVfrkfU9KQRIt032Dj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_073241_647069_127FD451 
X-CRM114-Status: GOOD (  13.88  )
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

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly. ARCH_MVEBU already selects GPIOLIB, drop the redundant
OF_GPIO dependency.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Send the arm64 patch separately so that it can be picked up for v7.2
- Link to v2: https://patch.msgid.link/20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com

Changes in v2:
- Make gpio-watchdog depend on OF && GPIOLIB
- Drop picked up patches
- Link to v1: https://patch.msgid.link/20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com

 arch/arm64/Kconfig.platforms | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 72c812e76b0b1..dc995a7321174 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -243,7 +243,6 @@ config ARCH_MVEBU
 	select MVEBU_ODMI
 	select MVEBU_PIC
 	select MVEBU_SEI
-	select OF_GPIO
 	select PINCTRL
 	select PINCTRL_ARMADA_37XX
 	select PINCTRL_ARMADA_AP806
-- 
2.47.3


