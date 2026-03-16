Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717ECF4643A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 09:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKMv0mITquv44pXV22U/DAysZwknoanpdVPJIYszFak=; b=qP0AVaxDLNorFJdBUulgo995+P
	GrU1s+oURVg2LGmelbm8HmCnAWjk1jCK5GbymC1ZXqxvQzNVYrjPl/5G4EcsX7+9Hp2jmYF/X8xyA
	F5CLIHZRggLbMsTAesiM2ggGmg64Pcj40/Td3iaSU9U0Ra2i6hdOZ+MFMmCyFY6LdKLV+OZy4D9jK
	vgQH04kdRSKOXC/ako4Jp9iNUW3BZOkADctVY7Pj9QMESq8GMf7b8B9ixvdnWu1++gzKmWVbHXtIb
	TiUBMyDJyDhOZqsnG8vYJNKRxH+fF8l2vTRFkI320wxRSPIwEoXJPMIAeVsuGcbjEgb5kZy7WbcyY
	bDM04kfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24WF-00000003gmv-2mQl;
	Mon, 16 Mar 2026 09:45:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24W9-00000003glk-2olC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 09:45:46 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64dIK538832
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fKMv0mITquv44pXV22U/DAysZwknoanpdVPJIYszFak=; b=JG5AnnE/nAF8d/x5
	VNIZyMN8e+o8g6YrZNC+gLTWBEM1Xas+ZiKr89y/CXRTT4bT9RPPldEQ88BRua6G
	jrREyefTSQ9osqzwq9nJXafRLSdTWwTTp0QhGgPD+7YAzotryVWhbDWkRKnVvEs2
	aD9wb14V/8Q4yyCj9c047R9SfGoH81QjdHcH9MiA0ebcqJSUqpU79HIveU04njFU
	SpDqFhUq1HxphOPBVQ+ccAQ3+1o6zsHcrGy9uNTdoh4OcfMkTQpPHjnuf+XlkSt9
	pvq6nWtzXYYLT5syRvp3D+wxegyORD1kIWzYT10ntFCvBbF8BCXFkmEVH/mZRxYU
	QGl6pg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyy5n306-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:45:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb706313beso597666385a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 02:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654344; x=1774259144; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKMv0mITquv44pXV22U/DAysZwknoanpdVPJIYszFak=;
        b=Y+txJDhNuRcqC1T9LvmKHHbI3PQKxTTvYx1mHI8ClNBWSVa7qcISK79ZiWoHdbtyO6
         yWN426t8oTKFM+FWm7IJxFhN4gpYGKmfjrbrSQ/w+o7XIq9F3C3h8ukrBcWdHDcvHWWq
         WOCTzil+7AdnuiWLCApmMtHzg8L+LUfoY6HKdfkjX2fPOoS5L+GWQng7MWcDPXk1Nkmp
         Nh0DY2kNxpz2iuqSkUXfbj5iRCZyvg4CxDRgdlsIgYddqp1I2cxQ3KsiFr3Ehq8POWew
         moBZqHnlLI+tAA/w5WqM1MZntX6F/IyHs47eYb4IMXhxoUNo+K9UgriLqUpAXYfqmXVk
         m9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654344; x=1774259144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fKMv0mITquv44pXV22U/DAysZwknoanpdVPJIYszFak=;
        b=EtHRa/af89OLwu/+1l+MnGfwUdx58RH0VT2eMCPHHdawWtA62EIFKtYqkoZhsqcBsk
         JlYzQCxUESSsNSxUTfk2//BV54tUZ+0mghSR+TVo1PvKGcfqpcZCCEUfRakJ69+/Voc7
         wicNDx5bMAykctnXWTv/3lr77EYgeQUBoMkcCeYhOtOH6x7j8X03WbflFzBFNgkvXOgK
         r3chAmKVfbfkwAOETQCTjHhlPwlC08TBXGjW7CN2f2TKDshFKD0fIcO+25daeyP7rCDE
         ZR46SD38XHWRQ7EL7TUfiz/fA60lIttlCIvs9j2XuHMY59PXSfgWINJELO2kRSwHiDkc
         1i9g==
X-Forwarded-Encrypted: i=1; AJvYcCWV5rC5c0+ioHOVYxlBit7LS10JSlHcs1CEwiJdu5sQA+TXDhGdkP9xHdtOkrc3gzM64FzxXdonOkg+XfbYdYZc@lists.infradead.org
X-Gm-Message-State: AOJu0YyXze8zEPlukWzR19dneMrgzKZtVhUjSh1UbTIle9g1EX2oOf7y
	aONXDPixtGsmdMgsjfhmUvAJRN1yrM4renW2t/kE/FVGYbTJvV7JrjsIM606NlXq1bRkpFRusWH
	DABQ5ncsbpm+KuR/x7DODFpWzGiFvGymBGDXadqVsVjxpFSs5IDd4iY5O0Wd0qHWoSy6AmHpybI
	WBDg==
X-Gm-Gg: ATEYQzz5tsr+GCgtWmLiO7liWU3VC/qbJ34IAnMKN6538gKf1vRjSxa0vIInwHjIN5R
	yxaj/GnLuy5mHwHc9PAvQO9IJBUg0wxSSK2DIz4bxgZZVPUK9ZiNp3AvEGTtvOqSn8os9eYeq3f
	CqB1X6WUvFBH0hTOQdQUwBVz7LpGZU4jHSwJK5YoPSutQJmyLkUkoyoS3WFKdIrFtO7XkX4jWvI
	fOUSc/unbfs1JvMYn7soBqsaYaKLOjtE/LlDxUnaFFlTMJvP54LTkl4XGR4biw2bke1H4FKv6z2
	rn8TIZcwCJMNXGQ28mcrO8pV4yv45EKchjK5hcUZJJKckjyevugS1JSpRcHxltjuzQ+TpgYTXiK
	XCR62JA3PJQ3UyHzGtopvBAq6Dc7z8HvugIJoK7BjBtXQbzYoxLl+
X-Received: by 2002:a05:620a:4488:b0:8cd:9a1d:507 with SMTP id af79cd13be357-8cdb5b05cbbmr1541324285a.53.1773654344077;
        Mon, 16 Mar 2026 02:45:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4488:b0:8cd:9a1d:507 with SMTP id af79cd13be357-8cdb5b05cbbmr1541321485a.53.1773654343591;
        Mon, 16 Mar 2026 02:45:43 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm503138755e9.4.2026.03.16.02.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:45:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:45:21 +0100
Subject: [PATCH v2 1/9] arm64: Kconfig: drop unneeded dependency on OF_GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-gpio-of-kconfig-v2-1-de2f4b00a0e4@oss.qualcomm.com>
References: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
In-Reply-To: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Linus Walleij <linusw@kernel.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=760;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Et22qRZo4fsW5XM2dyTAA1YIF7lG8E4lUkHkWMi4kdA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt9E50k0Yyy71AuZlT8Wc65mGgqmwiMHz+yTE9
 mBP//nBbEmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfROQAKCRAFnS7L/zaE
 wzh0EAC3O+9SFE3V6nL0tyeLcO0MhgOELnTHnumU0Trq6qxKGHWv2wW6+NzHZXi3AfchBdL0E51
 n/t4F7uCATqYUI7vKH8azhV/4lPHX8SmA3OVwnPbYWk9V2Dn/gnAev750KpWQtwnf9PSrz5Tjft
 DvYivEJMrr2Bliop6ub+CP/OkgFZ9/3ZNwVjGtd2wrTScmGg/p5AXyj9l+6kivWIxz7s6OmwV9k
 lK2dxVVy3J0Tsrz1TaQMYfulx+Yy8aom9UeRNHPlgdSokyA01eHQ7eLRtEhXFREQvZdRBh8+dGn
 NBiSftUMD81V/Oc9dB6rHXafNgk71B8rq8TYqW/mse/eywvTtgYkkrdKfD7dBktZM/sGCXcYyl/
 oKaPUBa/CQhpNu2cwQS5ono7MSRaKGG4sOdpQW0U8iuRuuMJSRCm5VLyD3rV85UFvLRoILKK+bc
 npCLMn6s60pbCe53JNECxMlnR31Q90oI/0aXVK28IFcM0xM4FTQnVVm7RqnDlyJHvB7V2CKNUUi
 lhEtZHCoAmOqaIiZyeTGFqYFKryUZNA7fNS/h59H42ZU5oFk0BoVvDfIkrx4+MjEOo9QzKMuAe3
 UN1ji24LppAAKJPaYClbLqeKvGJlGjbvOHxIcXPYqYmvb4EVe/30U2+xg/BDS8rFMEFj/re88ci
 MvP1Pmh1dsosBvA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: e617DAzD0QKJIGoOvARoue8iDS9I9XuL
X-Authority-Analysis: v=2.4 cv=QOxlhwLL c=1 sm=1 tr=0 ts=69b7d149 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=nExzm2HfQztilrPChXAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: e617DAzD0QKJIGoOvARoue8iDS9I9XuL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfX9clTK6Vz98JO
 BxFkbSeowo9sC9tPfArwnIQr3xta/dQ06Cz72Rl6bEHeCuKZhaYWJN5cTeib9wmgV8oQ2dQWe6L
 YsfIKsC+wKineZSrAcwLlh3Bf99W65TwKA3HCeXkchWsJvgxMGpyNeushVmJs7fCvLj04RCvNjS
 N2/YqzfnCjOx3BZdpune3bZByQR0alefDEo/I++AUeYGcylmBVmBqckmmeaVFSr7+6hQjQtyup2
 TARdWdYL+ShHIIVIC13gy/pORyoj0biqoKE3ySkdIKnsLNduMQlFZ5AQFDT5Rh7Dz7EVRH5TCyT
 f02+ou2UUH9bnd5Lerajs3nypytk1S90lVMVsqKGB5gb7P2WDZSgdv0cYBjvc6DdSNm1YwUAUEt
 30bSty8D3Q+T0k3LE/yuyTwc83VQm6RO7sTMZ2o66r3ZG+PE4ZCMj7CXCFEnlO69JOWlTPySlZZ
 SBHY0oLAwarPUg/4Cpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_024545_722360_D6FFE8E0 
X-CRM114-Status: GOOD (  14.09  )
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
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/Kconfig.platforms | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 54eb1d7fd419b4249a6860357da8b3dce2e2146d..9441ea827524df368f5aa1304b0122bebac3d245 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -245,7 +245,6 @@ config ARCH_MVEBU
 	select MVEBU_ODMI
 	select MVEBU_PIC
 	select MVEBU_SEI
-	select OF_GPIO
 	select PINCTRL
 	select PINCTRL_ARMADA_37XX
 	select PINCTRL_ARMADA_AP806

-- 
2.47.3


