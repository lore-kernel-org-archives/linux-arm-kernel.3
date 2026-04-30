Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73476FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 07:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V7JzakOUT7akT5SMUuhE/hDcVBqqxoGfQexPvwrbb6Q=; b=QszRVtjBhuK+kI
	IrVzdJ2pmdTIsuY2pk9IflqCZpFKxD+AnUlR3bhEGWfpcA27QgWzeNJzJuS/lP7QWGhCK/zEeG3vC
	y7h2JxldAwiG7zIElj5vaakxpa4wqO/WOrk8WmncF0lNluHAguWJaB4Ag2se+4qntdjDK2mOpERZf
	FQ0jo7tjNLXHOfAhxq+dwSK4Rl26YLRV/3VueD5mml5lVU9v7/WcRbswTg7qD0MvfG5lEbLeGLztq
	RlHmfEp3ULqzz1/APH72k6A+uyUKP+AOaEi1lYdq24R98kU4HRxkMXlvM626ckWsa81Ado+drzegJ
	Yqb0bTTYWu+O24+RHdTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wILrd-00000004stm-474j;
	Thu, 30 Apr 2026 07:31:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wILrb-00000004ssS-17HF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 07:31:13 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TNvT0A3733909
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 07:31:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=V7JzakOUT7akT5SMUuhE/h
	DcVBqqxoGfQexPvwrbb6Q=; b=V8jz7+3AoG34ijaiBiEbTr4kmX8Rik2a6KYneJ
	Doj57lZyjxXF0z6D26a68iHGLzvn8qVa1adh4GMHKWdP2SrO/hERoa8Lu8hS5skT
	Z1BbbWM6Fkm23aIzorC3jTNkSlF6PrUJInlTJrUiD7flh4qNhgBBzWf0WmpBfd1y
	KrdRNnYA/mUUu+zkY/TUx3HybctQuiNlDme/2w6sOwjdUPTNOU673Bbw8rVM+vJN
	3tbNVTnQOfKBpXIWT8ytNTeN29b+a8KO9wKACxZkbde8KX29lrXdMu7OkQNjvMJD
	qB6Lpm2ufwOqACpDdoLv441tT9i1VyOG0Nk2YG/aCk4jQWnQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duv3x9bya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 07:31:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a0b5478a12so35425446d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 00:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777534269; x=1778139069; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V7JzakOUT7akT5SMUuhE/hDcVBqqxoGfQexPvwrbb6Q=;
        b=Ozx88LQGDR+8P/c0yUpgcpE8mrY1ugDIpnT1PHdOesR+uaqN8UB0uYNPVn6fn0mLT3
         TyHs6DOZSw8CN7DCySJl4oE635CFhV/9JJ3XKWWTMGihvH5Ec01t5GzguReG83MlaVKV
         I0doDmpGpY52EhCvpYajbPTecrEst6v3O0EkyQP6bnH3flrNf+4J5U27pME6w+DObbLy
         yYWFtedCScMUt9z8JUR8RmlQUHVCGFmHrbVbrUZ1hP88gBbH5dCvYXIoVOFF4lHk2ye7
         jfRJDjrXqpM6s/YoDlBBITKjVeqpf++soEJt/3XxViUAQ4o2CFHAkQpoMyEoe1nqYAX8
         Mdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777534269; x=1778139069;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7JzakOUT7akT5SMUuhE/hDcVBqqxoGfQexPvwrbb6Q=;
        b=sOFOln48bxW5v4JoXKmwxYVjQN4MkyDDuq7KLO+JB7sckRsB6j6lz9zt/N76XJwABX
         aBzyCuKMebc0O6Fr5+xHCCEc13yTdr6xkoe3dS6PuMdDbNvF1cNXJU1rdDJO3df+cBQG
         1y7q1YAu+x9A0mele5x+QIImI9GCIXpEbAdlKJ3SzRZ+MTJJFYEiF9xmg35f+p9PrEUr
         OfzczvTT3YNAP0+hYTserwovrQE5OMxmd490mQYU6rXneRTlmr+UYF1921CxyR5OUXCh
         7jkHE1hBDmpPbSKcUJIhygxyMNhNDZymRnJK7WR521kpGgy5ZocmlOtDAKXwu505oPfA
         WxqA==
X-Forwarded-Encrypted: i=1; AFNElJ96J4WNgIkrxAL+sWmddVOXU0yARXIU+Tip6h8+GQkCAVg55X9ik53/XGR9GYCXVX8rmnfrO5DzvqT51qqRe+0z@lists.infradead.org
X-Gm-Message-State: AOJu0YwuSnfd6fHYDN7TuqznSEW8+u2seSsER3gFdNbjxkmD13W5EyRw
	n0+xxcDbcu4wyxYrTWI1dhSorhj3cVsEzaOJld22Ow0k55Jx36I2XW8Pa+vdEK6eQbMN0HyX0mX
	zxBRYv9yQKBgPswxk6dOKSIw8qLljvOKhVgMkI7SVzRwzWVivZ2IkZ4RZ6FNoz1/z/qlUx9Hz/O
	zqlw==
X-Gm-Gg: AeBDieuF7jUbeuoVhhDJuEfbnJLJwlqeCF0JGgb/y0ndcw7+EJ4+s8Egfjt291l/vAJ
	LhojexH1cttx901PKgiA7F2pet4z0FxAbjV/KvJgFjXktog2RtsuXPCG1VjsyFD34ipXAd7DRlO
	rGyjat0UjivaOn9WdyQpCzVCLk1l2Lfw4QfnXREjE3OTmKgdvg7gDHrDQ/LV4vgP2lK8yi7OOwK
	feY/OLzn3nKZn/0h2Za6PWX2F1sRFbc1eoN/7o/q7I/AknMT+ChsWPPOzvALi9gutrcnC1hh8wM
	saQSe665az44EK39MNcqnSzUBq8INKTo4W7txU1f3txNt7CfASxZHZ+7Y1lCeVbfyyb8RjDv5V/
	PCq+LY5K0UfjL9gPSAkMz5F47wrps1hr23bjr6Ez05gEbftWpUu9M5OjL066W
X-Received: by 2002:ac8:5fcd:0:b0:50f:b181:6ae7 with SMTP id d75a77b69052e-5102d10aa50mr12953741cf.17.1777534268556;
        Thu, 30 Apr 2026 00:31:08 -0700 (PDT)
X-Received: by 2002:ac8:5fcd:0:b0:50f:b181:6ae7 with SMTP id d75a77b69052e-5102d10aa50mr12953271cf.17.1777534268014;
        Thu, 30 Apr 2026 00:31:08 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a:f446:21cb:22e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed69fasm59515035e9.3.2026.04.30.00.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:31:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v7 0/3] ARM: omap1: use real firmware node lookup for GPIOs
 on Nokia 770
Date: Thu, 30 Apr 2026 09:30:54 +0200
Message-Id: <20260430-nokia770-gpio-swnodes-v7-0-c88f74c90dd6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC4F82kC/4XOTQ7CIBAF4Ks0rKVBfosr72Fc0IIt0UIFRU3Tu
 0u70YWNm0neJO+bGUE0wZoIdsUIgkk2Wu9yEJsCNJ1yrYFW5wwwwhwRgqDzZ6uEQLAdrIfx4bw
 2ETKtqloRJik3IHeHYE72ubiHY86djTcfXsuZROftPzFRiGDNKyaxkUJotPcxlte7ujS+78s8w
 Awn9sEowmsYy5gWBOmaaI2lXMH4F4bFGsaXzyTBkjdbWbEf2DRNb7Gr5lBbAQAA
X-Change-ID: 20260330-nokia770-gpio-swnodes-5da8ba35946e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2254;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1N+EfBQB45Tp1UHYeYYJOHZLrrWLfb06n+j18VwGZl0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp8wUyVo05YkXyeGq+r5+ABl8MGaLWfVKJhfYwF
 D7bkHjP0hGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafMFMgAKCRAFnS7L/zaE
 w9P6EACPoKJBjfy/3HccBoDT7Vcxp56X8dUSIvSER+/ZKPQewE2NBo5IZzxEV/l3HA32Hf0FhVQ
 oysmoXhqs8RnVWNT/Q70oqtl9lSqOyGAal61LnzUp5+8agcZsJWBaAZnTOYqLQl9B/SP8ggwmJF
 SbeDEwtEoVHSGZ5JtBXLe8XQ0UteLBNUiZoI9fb+Ro93mao8ECJWVnAZQWds7mCF1RVdlWPyvVn
 De28hheIiN0Lh6ykp8hNj76km/Op/kji2yrcn/9aRhoodq4RE2hFKHvzmPYUfyMpASWQ/JK23Uf
 3ixXMRIFHjpOj0nIWigGy1UVgCtZpGmYVk1wyZwS0xmC8C20LeTw3G21blZLXB9sYewBn+ioUD6
 HRhIhh+ltOQf2XodXwNHPhV5lcY9iHKPIRoDGdrjAq/Ib2ObsyLNLkl0PBdTD5p8y9ZRwUnOnlN
 AGPAjG4iPHhPY7yqnKKEN0AYF+2uIdv8xRYXiED6smIEbQKizoe4ou52MrIuqkSTAGlDxvTl58L
 BVuM9O0hK77+vI844XLP2G1kTqYg85XIwQKQsW51eKDSdvzaZZTDYgBrYHiLRxm+IRKmF2DwF/l
 2xT1vPiAPOS63bz61/KDdlxHnnc1axlJukOwTvP8q0olX8XRFqnp4ysQsF9y50eyqIhWr63OmlW
 Y/JpsT6kYEjqTfg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA3MiBTYWx0ZWRfX5So6bAgpAZAO
 bS/fcilmcZXDdpNFYL1aW4+YXfcTB2/EuYry1WCZTqBk3ignjV2t+bbD5udndiL5tkRX2NVm7N2
 +WL2N2Lm4djJTnDf60h93+S+ZmerKxarpiSIvoOgDalPZvkxXe33HbJOjld068S48fvJaufd9FB
 IRQYkviYe8STXqR3bP6pPetnosnHAH6vBY+8kMzKzKedOoZX4Om+6iqZjNt2pWXx52RC/XdDfl5
 cCtnUDfPP0yxgsw5pf1rR0WAE8B7SStmhsmf/JiDsiqpc4cGSCgESXrxzjVpxmZX7kNVmiJL01k
 Xu0p9M33sMoVt0Zq+bmyFPi0ONOdOuo75swVLe3C2t+qgQ2qm+VQ7TWk7glrR8wyVTugIMOSOUQ
 Qp4eXRC75PlIuQjceJBNC3smSa9FxLx8ZOAt/fWp+xvElawe7J8fzof/nqUlHR21+ZK5vW1AL/K
 1nKDK5xUs5Y7LJJTvLw==
X-Authority-Analysis: v=2.4 cv=Oc2oyBTY c=1 sm=1 tr=0 ts=69f3053d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=WeWpliTHXVVyQaQyHOwA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: __98qO3ynM_pXmgUPkpt0jfukY2cjfgq
X-Proofpoint-ORIG-GUID: __98qO3ynM_pXmgUPkpt0jfukY2cjfgq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_003111_496243_05CE0CAB 
X-CRM114-Status: GOOD (  15.45  )
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

This converts Nokia 770 to using real firmware node lookup for GPIOs by
attaching the software nodes describing GPIO controllers to their target
devices.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v7:
- Drop ADS7846_PENDOWN_GPIO define from patch 3/3, move the value to the
  property entry
- Convert the second dev_err() to pr_err()
- Add the device name.id in the pr_err() output
- Collect tags
- Link to v6: https://patch.msgid.link/20260427-nokia770-gpio-swnodes-v6-0-b693296c1985@oss.qualcomm.com

Changes in v6:
- Switch to using platform_device_register_full() and pass the software
  node via the swnode field of struct platform_device_info
- Drop driver-core prerequisites from the series
- Rebase on top of v7.1-rc1
- Add patch dropping an unused variable
- Link to v5: https://patch.msgid.link/20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com

Changes in v5:
- Put ksysfs_init() in a separate new header
- Remove software_node_exit() in a separate patch
- Link to v4: https://patch.msgid.link/20260330-nokia770-gpio-swnodes-v4-0-b68592e977d0@oss.qualcomm.com

Changes in v4:
- Add patches making software nodes available earlier
- Remove stray newline
- Link to v3: https://lore.kernel.org/all/20260212112508.73500-1-bartosz.golaszewski@oss.qualcomm.com/

Changes in v3:
- fix references to the MPU node

Changes in v2:
- fix build with CONFIG_I2C_CBUS_GPIO
- only export the two symbols that are actually required by the nokia
  board file

---
Bartosz Golaszewski (3):
      ARM: omap1: drop unused variable from omap16xx_gpio_init()
      ARM: omap1: use platform_device_register_full() for GPIO devices on OMAP 16xx
      ARM: omap1: enable real software node lookup of GPIOs on Nokia 770

 arch/arm/mach-omap1/board-nokia770.c | 33 +++------------
 arch/arm/mach-omap1/common.h         |  3 ++
 arch/arm/mach-omap1/gpio16xx.c       | 80 ++++++++++++++++++------------------
 3 files changed, 48 insertions(+), 68 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260330-nokia770-gpio-swnodes-5da8ba35946e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


