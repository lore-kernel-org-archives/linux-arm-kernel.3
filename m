Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCFBC44501
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 13:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dR6f9gGXTOpY1sSwJBhl1gsRgCY5tMNroo+cgHnCkC8=; b=lN0JboVKN4xUW5Rv3VSFo8SZhO
	HcRyZbRDdjbvHiuy2I0JD2uGjZqqP+JuhUQVfdoooqISLmGYsywqfBoiTY56fFrkZs1SA6FJrocal
	Ueyn0QKxVwNo6s7o6jWKze+engftl7BEaw9zCDU/2gh3gI4yjytNooWBbB+oy9ZkfviW4NlyK4o8+
	4oXvzBQ1kzXjSNwCTiQ3Ft+1ebDAYAAbvtWpPktyQsqDg+yj6Vw4NBhFy2vEHA9mBCQ2JflJDK/Re
	Zlwpf36E12S35usz3N5/oiaA2QMLPMMQTBf7ti0vI289mfrUhfEhTCLP8HkCKVqpuRn1J/vlAIqj3
	V+274kZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiXiA-00000006Zcd-3n7t;
	Sat, 11 Jul 2026 13:25:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiXi8-00000006Zah-364E
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 13:25:41 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BAnJWO3721788
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 13:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dR6f9gGXTOpY1sSwJBhl1gsRgCY5tMNroo+cgHnCkC8=; b=my/Hit0W8oQw+kgb
	Y8/Xmj0eT3EKvTrO2UjkD5KHPxMNmFl//QsI7V9bqpnvK2AuQsEkRjDD59GI+xDy
	HPRxRhpCie95q/UjSdAg7BpYatyvP3BwWtDUhe5HbE7g4hfe0nFF00zRrw8liLx2
	TY9ihNfkkqEJs7uO4QFymVGmfj4W+bODMb3DsyurOqmij4zsf5rLd5uWMqN+Jcze
	LGaTU09YF5unY4RoHw/W0MyqGP2guQU5+4uB3nFMUpjkEojBMg3V06qKtiZsrI26
	T64IZ3DXm7TDfhdBbwuaDJxXYpVktBO7z2WOg7H13iRWdLOwri6Qpgn91pNv+nSS
	W+9VGg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeaf8ur6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 13:25:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1eb52e1fso31198131cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 06:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783776339; x=1784381139; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dR6f9gGXTOpY1sSwJBhl1gsRgCY5tMNroo+cgHnCkC8=;
        b=P7BX70yqg3ArlGMThajZMwl/UauLKIvv7D59avt2/tr92sk7NCHP+sZsQQ4bVJcbAg
         iht/G+tAYWsuISD2zb/O0b6P2qt6Sh/gs2n2/Cc7ojftWNx3cxUTnq4/lXTG6+cDp5BM
         c1gCrJM8kqjn7KnpH9nBajsrtAKpjv0MUFn8FbfuRaCa47iOnueoiScC55TnmMBcMcAK
         Mzmzu0i9vEUEOXy0SztnlC4V0XgyEo2yp1PdvI14obkKlFFr7rOpo+XNNB8UgH7pyXXz
         hcZc36mbqXSN5JN5GuxrjfOKMj6BXunFW/wqO0yCipvJiGtg5dFi00FYsvVwgf5NWwMN
         r7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783776339; x=1784381139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dR6f9gGXTOpY1sSwJBhl1gsRgCY5tMNroo+cgHnCkC8=;
        b=AquYBaNpSBWNUKg6PcQQDKayzTX5ZRI8t/Vu85hHGi/WaZbOO8xvDjr6sz7TkgAyrf
         u9R5u8HCTIUnRE1W8KeJyavsr4OoSnM4wazn+uKx2FwCIwiiu3yjJ+ALmNNACUn2VJis
         sGenctEeG6RlM1Z1J0eLpWEhzJiqQ0yPyklqpecHsDlMQl08wNDprVJqQ3Ma+dxu68FK
         FjMzgXrrXfg/nPJRjdgAP1HdxRI/fCbA6dQAd8WrujVocA3XNMvPwGn4wI1tP4HIH/Se
         0YYypgQ00Z/KNNhKQwR9fm+e8vge/Dfdz/3ekQOOy1yfqMuQ0MiV69SjpMSOMbWVBwsu
         GV7Q==
X-Forwarded-Encrypted: i=1; AHgh+RpvwdZA/yF8/KloNFtt4zVmoh+7Zq7IGjCfSM+xb8l9RWuKgdi0SgBa5LQ9IaFjidzentUtdYZltxGSNnLVsKHn@lists.infradead.org
X-Gm-Message-State: AOJu0YzvXubqAbXwt/fkpXtv+fh0Mcj6aauY42c5+4/xhnu7OIkNqYNE
	oY8Rw/FobWJBhU8ulArZ0KGZD0bKgayNZX3qE516bEyIilehLtNj1PozcNypEbMWBGBs6umnbpI
	MRrniATaTq4RMKjSy4PKXAdHhGe7QqEFXVwmpry9+3sAKUqXH2dFxLbqe16zbZp3cg5LKYrY0L5
	F1Pg==
X-Gm-Gg: AfdE7cnCGfFIVXfM8mn5DKIJK3lMi1y9xYcUUGoRCMDGKy6oG9x/TRe89grhTB7tf/W
	YtuWSGHPD65CltuDCOG4YPQEex8ENimADVxtfnt9nou3+erEO++Qq4TzOnBtNtVO3m7PUMFWlrq
	2JDkJsWv/FXLfuItR3CP2tQVyGES5VOXDX9LToHfvUJCa7As+5sDLRkB8W/3dluKjb1Uce4op/H
	RRT/sq5QbV4aOBx5lRDZaA8NNv8aQTn9QqUYvNhNnBY3W+fShHWp2xDMsuwzs1bQ8bO9fTQqz47
	V953il5D8Z7uUWMOUgO0Wd7PkMIWh/6+/pwl6BuounFcKV0EiHxkO7Obu44qEstVAO98+bmnavy
	xR+0wVWPn6jZZ/0xL4HtLgWYG0cT4oUuUN7U=
X-Received: by 2002:a05:622a:1b16:b0:51c:404:af7a with SMTP id d75a77b69052e-51cbf132788mr29297071cf.31.1783776339411;
        Sat, 11 Jul 2026 06:25:39 -0700 (PDT)
X-Received: by 2002:a05:622a:1b16:b0:51c:404:af7a with SMTP id d75a77b69052e-51cbf132788mr29296791cf.31.1783776339064;
        Sat, 11 Jul 2026 06:25:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm67915265f8f.14.2026.07.11.06.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 06:25:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 15:25:04 +0200
Subject: [PATCH v2 4/5] soc: qcom: Avoid SCM and SPM for cpuidle drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-qcom-soc-kconfig-v2-4-4a907e064281@oss.qualcomm.com>
References: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
In-Reply-To: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1748;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5QSQGqiyXRwrFcknIZuAVjqWPj3lMvMMcCM69qrmlkY=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGpSRDSiAdKjB1yDVw1E8Bu0DseOe8OnxtDMnq5daC1yT36B9
 okCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJqUkQ0AAoJEME3ZuaGi4PXxQkP/R2M
 t3ajECZUoBV60x8A65VR7AVtMhajrFiMk+Fbll0gPPcBdT81gOYtdycynJqsyvXGJugrntbOhiG
 CUZMNZNyr8fG4OB+pGINE25XQYeB3yre8eavG524z8O9xlI5i1WVgyPTxPh4opwg2+NRGMoPHzB
 +W4e8BNnnZlMZcgD1rZ+HEGdeRx6o4+gIzjZQ1V036REJGDwojSdlA3auY/UloaPznOIpdRvSHC
 5RnqgwDyR2ry8d1PxoxlJ8Y3AdXpIv4KCQEkLpf4Qr0AYFqeaAQBFptf8tdB8M0adGB/JrXpWfX
 OdLeEOvnGon06/97lYAOyrI/PPVModV1aCoNyBHLLdeeOwFAhe1vwxdGjoSh2yerf4G5bc+yGvB
 gLw16lx2sYfwifABkDjOtLVnSLrAAYa6j3qXEt+z0o6ytLC7Ft8YBFcTpITL6APhYb0/lCEO+GG
 W+yEE2RKbvbT+57t5In/mmWGSRe57OE94bHRz9BtxKXDIgf7W5YA+DjVL2/z3q46aPPq/Sn3iLa
 dDd8UcDTxZ5ADarj6+iE49ldjPautgpIjYVDT9QuiCUkkXfz5V+jCiR6H+snmiIwljMd7ovGmmP
 27yOANSiu3Hb9VC/472OzM9Jf9npOQsZx3sZ1mOOlXpR6CcQjg23OF8dkJXPAKxYV0BUtMnNIcd
 3KbR0
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 3dqKbiUuXx4qYgBMS7qctw2WtZO_ar75
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDEzMiBTYWx0ZWRfXwUG2jtrQu5+Z
 18TD+CzrOlenLXwi+R8KTdj5VBtEJVee+WaVvdJC0XB6rSWWa3pY3nBct3vdRvYDOGDriqwsHdb
 MmoWVqZU2JAeSnYC4kQKharV1zVXLetpEaWpVhBto8EkTqVptrKirvgFwlW+wscg/tl5CebAbMc
 3/C9q4aWxN+Z0+ZFapci9wy7RUKTX9QdIsjlBf28J5Rj5lQzE8QYhO3PRl9qkTwWLgTkP4Tllri
 4XRuWweiaCXekNBhOtz0+Tny1woFlaltSUFfWTadfwL7N9ccymjNp11Jf00qo1+Xf3zV152fpYD
 Uw5u9xdDGB+0Wyw0V2BjBVqDpZJZo6/3wbm4uVNNiIUxxsWky5CXlcepJ1YhZvj3bbijbrvq5Cv
 zdv3p/LmtL69cVfLARv4DrAeD0Qm0mR533h5DS6DQTcDHQY3JYHczQvOD/2eeg/XYF4AnyIiFOC
 1EcwdqZPiVsmjje4zKw==
X-Authority-Analysis: v=2.4 cv=O5MJeh9W c=1 sm=1 tr=0 ts=6a524454 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=0Q2KlgmO6JzD7cqg6jEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 3dqKbiUuXx4qYgBMS7qctw2WtZO_ar75
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDEzMiBTYWx0ZWRfX3lnytFB9dFcb
 vmaC5xLqJ+1iL50N4Q9AQxPtkp6swT2iOMX3xGBybWeWTcBsluK3KwuhToQ1R0PcXHlJ8JJsLZ8
 GBQ5GAT5vZWn4DoYeU7LDN3cO/VOEQ4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_062540_795856_1D4E8523 
X-CRM114-Status: GOOD (  16.36  )
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

QCOM_SCM and QCOM_SPM are user-selectable drivers, thus
ARM_QCOM_SPM_CPUIDLE should rather avoid selecting them but instead
depend to avoid any possible unmet dependencies.

ARM_QCOM_SPM_CPUIDLE does use symbols from SCM and SPM, and since it
cannot be built-in, the dependency must be as built-in.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch after suggestions from Konrad
---
 drivers/cpuidle/Kconfig.arm | 4 ++--
 drivers/soc/qcom/Kconfig    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
index a1ee475d180d..b88b01aa5829 100644
--- a/drivers/cpuidle/Kconfig.arm
+++ b/drivers/cpuidle/Kconfig.arm
@@ -120,11 +120,11 @@ config ARM_QCOM_SPM_CPUIDLE
 	bool "CPU Idle Driver for Qualcomm Subsystem Power Manager (SPM)"
 	depends on (ARCH_QCOM || COMPILE_TEST) && !ARM64 && MMU
 	depends on ARCH_SUSPEND_POSSIBLE
+	depends on QCOM_SCM=y
+	depends on QCOM_SPM=y
 	select ARM_CPU_SUSPEND
 	select CPU_IDLE_MULTIPLE_DRIVERS
 	select DT_IDLE_STATES
-	select QCOM_SCM
-	select QCOM_SPM
 	help
 	  Select this to enable cpuidle for Qualcomm processors.
 	  The Subsystem Power Manager (SPM) controls low power modes for the
diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 4e6eac2769e5..fd4d4ecd2df0 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -227,7 +227,7 @@ config QCOM_SOCINFO
 
 config QCOM_SPM
 	tristate "Qualcomm Subsystem Power Manager (SPM)"
-	select QCOM_SCM
+	depends on QCOM_SCM
 	default ARCH_QCOM if ARM
 	help
 	  Enable the support for the Qualcomm Subsystem Power Manager, used

-- 
2.53.0


