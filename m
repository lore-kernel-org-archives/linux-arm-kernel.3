Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53E8F46441
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 09:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvHWdMGL2qhQtG+yXiw7hgmpA7lCBBYNzpbwEI5vSeI=; b=3t4T0pnNgJ7bBxGKf6vVQuZY0Q
	2teddHyiBRwnw1VMyELjD6W6w0EjK8vCkwdKGX0/7OOVM2iFpJkeHEWUbQDjCJBpq3v1ECQKQN94X
	CZeeQOXGTFGllaP+wWM83Lj7d8E3UhVdWvJjrt1H7ccxckaFV9H6qpubsS+J0hVeb8DkDpxlSt+cF
	m1/S3qpnc2KeFOUjbm23xbEoU8xQmrfuwT//7Mozw0WkAs0114Vyd/jIbTa/6jj2J0pO0St+nmAhp
	P7itlzNh9O5NWcTWtBsnnFdNF1I0AWAwOarzq8vR72okG9Bvc2KDscjHWTJDrPnTeJkWff9mLNW//
	80Hv0Brg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24Wl-00000003h4Z-2buz;
	Mon, 16 Mar 2026 09:46:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24WR-00000003gtH-01DM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 09:46:04 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64qVQ1724895
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HvHWdMGL2qhQtG+yXiw7hgmpA7lCBBYNzpbwEI5vSeI=; b=MmRWhV8pxvq6yPAM
	Yg5E1WSc+BeQb4tX+XvJ2iUF3BjbIcU0ZH5WZLOgUYzAYRw/7eeCdhMbin4qtwWh
	FchyrhgzJ+vAGzFhWchYm7iXBPYgZCUgKcoV0dRKlibhTWrrrWrtiNvgo5KmeefG
	VyWfmOrp0y9G8UxLUetK4NviyuVlCozyEXASZgn6F0/SbZpHTJ0kB7KSGd/Nj2sd
	f+8xePkvt3dAR3HVM6WGKN6ZiMAKk+hazqGJYmUxIcbnwW8dctw1bI0zs3OfOxPh
	adpbDRI40qYCMnj/kEJEL01743iHjrrMuxU41dAps/QAazGcbWS13bGGXTwOPdTC
	X8ElmQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0udn03f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:46:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd820c6a4fso4015155385a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 02:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654361; x=1774259161; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HvHWdMGL2qhQtG+yXiw7hgmpA7lCBBYNzpbwEI5vSeI=;
        b=WQrrE9Cq5VkMbcZtI9pO0iEM6QgZVT0qGWujkV+V/liMCClqtOT2WoeuhvLGEW6QDQ
         NSfvcgVysXubkp1tieZEd+PirTTBVp4H9QTGD+t/ytkxPtUe6AkUXBPGQFu/ltHY7SH5
         +sM9TLoIeKjd5ZDk2BQ4IAuGkOJVykBRCwyu5KwY8joQnlPfSXZjQ6iottYZdp90+k9y
         h7YUlSiA1DvdnrkcQ1CBZEc3qRBtv4W9KQlp0AiGnpXNDwt3ubuJHsBGMLaGHZ7U9Xbq
         Gj3n700cfwdEHfMRg6m68TWnG9MHDH40JTRhyusvIiQ+KuuZMjQP0jaLDWzlTkr3EhID
         mNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654361; x=1774259161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HvHWdMGL2qhQtG+yXiw7hgmpA7lCBBYNzpbwEI5vSeI=;
        b=Nug30z/rE8RRkMPmYJhfX3JGrTD8uMmZyJi8EnjXSy7FMMCmjFo1BBf/6D/osvh9RI
         TglBnvzmcOVmTbRjp5n2s0TEqetN8ju6Y0yBJp7Q2aRrFOMoIQ7a8z5rEg0kJKlzqzEN
         rZydDT694T4Fy3ypXW5AxDi47m7sGyrSconmOAcuYrfUTEDF2Vyr/E9UDxp+k9Hjupf0
         oak6ce5ZsmGMrFqQZRp7MmeEDzGzPAXkW/XzCZ2ql0BUPeA/RnfDHQYjZXQ/YOjrnPLc
         B2P4qvSe9usc+gvZvIgPEvedcIT/TFv6C97AATCZmmj8bnG18LiTSCr7RkJVbDGtpiOr
         go9w==
X-Forwarded-Encrypted: i=1; AJvYcCV5ZdRHk0MZ0DDx390IxAakWUHwO6Y0uVv2JgJjOyeo58Caii8lLjNqOu9djEZ4AvwkLAsEDHqJa6vdddcx0fft@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+Sl/wjlpZjQqMcXG34u7JOi3KzIQyekvnQ+uwZaqSDzCnFxEV
	hOo/dIUx2V7hodPO3yZuUQecX3irR3vErR5aq/C/1sSbeRxEa29lH7GxjNBJNa9yW++kq8zl6NX
	WAQaLwnhjYr5yGwlBEIUV4iLmLjiBEJRx21zp/DEipeTW80yTPwrjOF8x7uAPKuGLR4UKKKqpwt
	jefw==
X-Gm-Gg: ATEYQzwKpeEvf7yDnhKBHWMJxTmYvTwhSaMKq+GrxdjvKuAxkAtz4DtlG9EZxZnn0kD
	IXPae6fvPLUlC6LrmZ6IF4/M0n0yTkWJozH7WLF5vG9p9/QN2nkANb7LpcSRQc3lt4cYsZOqtR0
	R4Quxuy70poV+gnLlMiPE3fDgv4XNSg44vDyt3Tyl1jqz/NG70lDyn+1gZfuohqsSS8mUSIR7Cx
	sqI3Jx49ft+nFgtF+CBBtotrG0T9yYLFeDPlMbcc00mmJKtQ11tSGyptEW0GNc7D8+okWG8IrNn
	XBcpNZ7M9NOtSkGSI+Pun63/WTpGgkiTAJY+2aOuNIHYIW0kpbw1PNcgTVbnwykoTzyY/JRhRJh
	Tl9rEZWqg+uz/F38gP1KpTr0dpD/vTDbFO1oCEwQl2X6Abr16LOe0
X-Received: by 2002:a05:620a:2549:b0:8cd:8f18:d1f4 with SMTP id af79cd13be357-8cdb5a4abf2mr1564739085a.6.1773654361427;
        Mon, 16 Mar 2026 02:46:01 -0700 (PDT)
X-Received: by 2002:a05:620a:2549:b0:8cd:8f18:d1f4 with SMTP id af79cd13be357-8cdb5a4abf2mr1564736685a.6.1773654360971;
        Mon, 16 Mar 2026 02:46:00 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm503138755e9.4.2026.03.16.02.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:45:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:45:28 +0100
Subject: [PATCH v2 8/9] power: reset: drop unneeded dependencies on OF_GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-gpio-of-kconfig-v2-8-de2f4b00a0e4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1970;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=N/KccnxICgrK3rI/2fd0AqdTwq45Oh63UAkAjH8PkgY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt9FBUPuNGhiF3uPrD3MLEpw265O2ryCfQa0A0
 3Zj48AI/n2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfRQQAKCRAFnS7L/zaE
 w/O9EAChOyuMMoMQSI3Z2l1Ai1DTeM7NVpOttafe54EyetzU0xw8PjsPlMgISx0CWvQ0gahGXVq
 fw++E21GJiYXzpJ3b2aqPC7+zX+2H5Y5orVnw/nRobgzElec6gqJpUSmgt1YDLvxp0PtuPSm6Ya
 A4iXITqLKjd0udPk2gaJGei2UMy6fkjfX6uyNSO3TGmBLquvyFRSevreObYkrywIO+V8vgMiMpa
 wZpzyJZe7cDpXUdQRXxelUAxN0B3TcO/io+SOISUGGzvRwiGpfQQcGSjttrm6om3sHQdwjdIMyV
 toCf80JzUY2N7Ki13DRxjZVnCAOFIXuD2K59YObtzbB9iqtXojbGl+NFNYXRpjhlk7+LOdFCwVt
 Ys9JHWGMBrCk1t9+CpAgigQ1LbMxDP9+5EC1frWy4rS7uBZlOEaozyHrRn6q1i4NhSgPKlIFqU6
 E4Qs06xlH4ks+yPLrcLn5D7P1nGkri8AAIFhOWNYP5POm11KHxerWB02ZbqkwkvkUjLIkumX0wH
 xegWOZOlRuSPp2wPqnVW8WZQqOh3OPUOPIcPnt/UxPvPlLXsz/MvVFadH4CmLG7UVcsD81jpgk8
 L60flzwaTd17bTl5BJJTYa4ZBOk1876I9o7jppj4M2qDWpFv/RRgVGA/71+FMt4JBE9UpRcNRD8
 Kfg2tDgl4ySflcw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=BJ2+bVQG c=1 sm=1 tr=0 ts=69b7d15a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=esZZGTiVAK7d0sqnEIwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 10ZogUSAmGtnjN6JDqnM-63YmOZP2BOB
X-Proofpoint-ORIG-GUID: 10ZogUSAmGtnjN6JDqnM-63YmOZP2BOB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfXxUUvLWCtGndY
 8Au8o7MMf/buzcLccRhGSERHRfHOuyKl93tJlAU1H6CmUQRLO+gUCFLrEfAnSDQI8aEPHKvcGpD
 tm6Mu5Pq7BBSTHoQOTVRye5MC8KwTI9YdfFTnFTJuYqBjLN/4vipOU/V4v0y5ZQw0ItjbiJOmaL
 0eLmyfSeJJmz3rt+guL/zNQ3fCURB3Qw3ORKCHi8WVBGj0IiOSY5MN/4Fv1AQCyasIjajGE4XTg
 MoUcCt1/ubLppwgzMi7EMpUkbJUoX0HcxvkketkF8hOHfgavt9VoyWEJLbtbtAwQ8T4jh5ctTPQ
 LjSFYv195egVXkQqome0PuQsPMdoj45nE2nnEOt4x5odXjdNGiRMkEjImASf8zgeLcMgY52zEsr
 KTZqqNggELrvvQgeuoZYshc/jOIsk4oDQD91rDDcPHI6/FR/c5/hXlCrjZAd7vUyklmvYtIQoMm
 Zf2iyV2Xx8y957ZsUlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_024603_792042_170625D1 
X-CRM114-Status: GOOD (  16.87  )
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
explicitly. For Kconfig entries that have no other dependencies: convert
it to requiring OF to avoid new symbols popping up for everyone in make
config, for others just drop it altogether.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/power/reset/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index f6c1bcbb57deff3568d6b1b326454add3b3bbf06..8af398b4e6f7fc5f2ecd92f11d03c43cdefe1ab6 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -97,7 +97,7 @@ config POWER_RESET_GEMINI_POWEROFF
 
 config POWER_RESET_GPIO
 	bool "GPIO power-off driver"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This driver supports turning off your board via a GPIO line.
 	  If your board needs a GPIO high/low to power down, say Y and
@@ -105,7 +105,7 @@ config POWER_RESET_GPIO
 
 config POWER_RESET_GPIO_RESTART
 	bool "GPIO restart driver"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This driver supports restarting your board via a GPIO line.
 	  If your board needs a GPIO high/low to restart, say Y and
@@ -181,7 +181,7 @@ config POWER_RESET_PIIX4_POWEROFF
 
 config POWER_RESET_LTC2952
 	bool "LTC2952 PowerPath power-off driver"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This driver supports an external powerdown trigger and board power
 	  down via the LTC2952. Bindings are made in the device tree.
@@ -198,7 +198,7 @@ config POWER_RESET_MT6323
 
 config POWER_RESET_QNAP
 	bool "QNAP power-off driver"
-	depends on OF_GPIO && PLAT_ORION
+	depends on PLAT_ORION
 	help
 	  This driver supports turning off QNAP NAS devices by sending
 	  commands to the microcontroller which controls the main power.

-- 
2.47.3


