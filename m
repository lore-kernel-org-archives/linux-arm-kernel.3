Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F781EB7EB5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 09:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Uu8Rc5MUkLbcfU9/lpDj1Gzj2w1uJa7a9HrTNNL9qg=; b=hDP7NMSgI3BlDKWl1+6cFPKCdV
	O/VGdet52l2PFpyXXk5syhVuo/QWTRwYi4KJ/IC3eK/yX6CUMH5gi1F3NShqTeNpj3R2yWWZWKLAC
	85mv/Xdia0DwPKIXepEJSFozqcUVi6ltb/Gx+QhqZDVbL9Fyt896rK1ATA27QpDoh7vEHWQHX4zXi
	J+Kkn0CLv/EuFhplXP8zT7/Zml5EpijmX2FHoW8PgePnIfi0yvwU0YaxhRXQVCuJ3BfeZCIRRxODD
	pIr+KWJg3jC9lwtNAcEXNbxwlwQ6ip7QyFRZClI0cWT2Ixca5B/JVitaWUoqYl12ItJTwfltjxaTL
	E+w5Isqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8b-0000000GoTL-3Pyq;
	Wed, 04 Mar 2026 09:03:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8Y-0000000GoPk-3Slb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 09:03:24 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SVox631908
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 09:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Uu8Rc5MUkLbcfU9/lpDj1Gzj2w1uJa7a9HrTNNL9qg=; b=O8hmrAag09fqLr3q
	PrQi2quDvT98RuvxEuB1INubex8lFDUvQV6PW6VyT/IOoEWzsMg236hTDPPz36EZ
	oEt0n+qzIOmDr5S/0w55w2tdjibkqrtHd86R2y7ns9opQjaa1FvC3AZoMFoyHnyj
	35m33cs6aTBaSZT4Z3nGKvSYN2W/uO3arTryKVmdJvZ+9Q726sp3k8RpSAjzR/Yo
	qOeaASs+FQymTU7agJd6vuaynSuxh+fEc52MjMHVku3DfJlk8tOUAxKOD4YjcGbP
	+3nVFCkaehAzbFX2PfnTQJ6ynl8S2dgA5aqlw3FZSA/atl3PYOeLuJuWaV/EHIBn
	8tAhng==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvtuccg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 09:03:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c882774f0dso4197997185a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 01:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615001; x=1773219801; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Uu8Rc5MUkLbcfU9/lpDj1Gzj2w1uJa7a9HrTNNL9qg=;
        b=aGHlDAqS3qTOxwK+wyImNosYHe/QC8oC3EYgX/UvhgsmSmRUsRmbPmKtOs58bMWtQM
         fqymMWXb0n99aJKjLg7iuuiJZUV2rRSbZf4kLgrvqFeD8BrSjlsu7Y3Iq6TfYrOPyWzb
         wE1PEJvZHRXdDCTZNnhT7ZvPxHfpEVXAfOVPb3qF9h6ud9PME6R48NqCmN1QzhxQ5OmV
         PN69yD2rXo31UQCGMJsEgqNip0wOJ9T9fF9YGupb2/1zqyDJ22xoejcmVknoZCipn8uu
         1Mv3bnh6VBDi2JIT2RTGN0ESpUfmBUXA3kDBq/hbgDLGuJBbfBo6jCXziIYE80HKNa19
         dndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615001; x=1773219801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Uu8Rc5MUkLbcfU9/lpDj1Gzj2w1uJa7a9HrTNNL9qg=;
        b=qHMMBPK2W+NeJEBYz/snXWo0TST/XkfkfUIAcWKx1MM8pCGD4mCorQ1mZsbueyXGYV
         oZK7vOd5Rh53fEoqRFJ+LuicgBmPgkG80goOKCGi5Qufxdce5BwYpGzIazFEakF00070
         SQb2M6gtxxvC3gVJtf7nfBVOw4j+/+UoJ0Y/9vDpSTmMIMYTuOUhrZQUvo6EGSsev8uL
         LTXfrdn/VSpwoE8sc98xiZMGXD5nH6eCdPoK7g2K1cRk+hwoVPX11mfSSxG6EIhpWrJF
         9FhF4ZDkoFo/8jddtga6IODPYMOUlmcm1ILprS/55pdfy11m07cb/R72kFww4IZ1bcug
         EVhA==
X-Gm-Message-State: AOJu0YwXsyfgbpWlgsGd4HAPFVLTcmFq2Tw0L364UF8rTddBhWIcYFKw
	GveluSS2mJz0lyOzp0DSCAAb+Y0uPHyHy4speWLXWmY4k2h2k+NgHHAgbafebwwVg5OO3TV9o7m
	3iDJOKxecKITAbGTEh6n8pVL123hCN0oynYhCcIjVrZvTr4UaniQho5585H/RGHyKBE4NxkLWaX
	2Jx17K3ENgjg==
X-Gm-Gg: ATEYQzz0aBYB+t9YBkrPXRbTMRo7+u3/Lyt5LpDh6F0JEflLJ7/62eL34if3oy/0ipk
	nnjNyIRWhEydoxSA02Z97gVJc26zlEaGw4WFL7nRsTcmxUBTRS4wUARuMmIGz+m8qlxRRxq71Lq
	RNM5imoqtwnzpEASwc3CLhHt6F8QytTbkX1cW2+I6o2LnrFHJDXN2Jg+TsDgZqzhB4yhoqIdFTx
	KqLE0Ba5ilTmqphCwopmIZyjHrZrZP9u06n7/sZb5Cq4NVihZ9AvZSbZWcXzIrV1RvFFn0Mm/nD
	SgLQjDi6D/VTYulqVP2UIuplhH0l0BMdV/6AaYiePm8QVynSj/Da34fwsjhIXgKRgyU+ACX8tJT
	l/NGiLgr063PHWm8Tw/wZAkYLUqqX38gTP1fSvd0DoCnGRFcnSBjA
X-Received: by 2002:a05:620a:290d:b0:8cb:4cce:e644 with SMTP id af79cd13be357-8cd5af0bcc9mr150435485a.31.1772615001068;
        Wed, 04 Mar 2026 01:03:21 -0800 (PST)
X-Received: by 2002:a05:620a:290d:b0:8cb:4cce:e644 with SMTP id af79cd13be357-8cd5af0bcc9mr150432985a.31.1772615000567;
        Wed, 04 Mar 2026 01:03:20 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:19 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:28 +0100
Subject: [PATCH 07/14] pinctrl: Kconfig: drop unneeded dependencies on
 OF_GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-gpio-of-kconfig-v1-7-d597916e79e7@oss.qualcomm.com>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
In-Reply-To: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-pm@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5460;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SNxn4ssJCq61+0YQndlULQe5RINmdH9u0N6CqwGb0P8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/UxSO5nc8kZcTUF9RyXKUJmf6Of1AYtIHV0U
 6UACVndydKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1MQAKCRAFnS7L/zaE
 w5i9EACQjyTPxi/a1QXOxfGfBGhdjzZUrgi7jiJL4MvvK8VXQiRQvaR2vGldWmrji0tQeSFZVH3
 Zz51abeGu/KvkaZdo4U/rXM4ZC+Km0Lds2jX1QQ8qCFhWgQ1iebcXeJiHNQWCh0wNnY2/meApzJ
 rvzFAhGZcvzdB8OUYP2lZ8dDAMSX8tKOCXynkJ6egYF7XKdJ/l5I6olmeYb6tcEndTOuE03j8tJ
 QbJLbwucLEN5fE3mu757a9l+JrDgLZA77UbCQXFgeRNsa3CxuBJXg5KLeKBXxI5b8W9dqtDWs+4
 CUvvivch/oaClYS87HV6xVwbsGtHD/qE4Dyg+LcqEDKG+dEa7HC9J7LeZNTVqkJUncN3ZAURtrX
 DcQ1t0Ny2sl8WGcfVA5d9DXSr+yjwdgdKdTyiWQrgS2SGU4SKApVGMT19N+juW/HuIYNN0lMJLe
 6GXfm4DUPPjdB7Z46C5uxrTzxEXdGy36eUclO3LQD5Dj67INf7uSR4VFicumGPkf2TRxY6hZ63v
 HCBjI+tS8cdFiPdkuPoT6+AeScisOZ+nTHhHbx4VHfRRNr23JTlWhlUR1uBeR0mQJwAhXqhUVnH
 I+9SsKxtSrdhRA4F5iojV2RWJCwI/ocUowc3fHpCopIkvmKDYE+51TQ3J7ICqF+6zRQFlRKUiV7
 NWCE+XrDTIp9bxw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: SlbLdVe9yhgLWKuYExU2GA1eyu21_QGx
X-Proofpoint-ORIG-GUID: SlbLdVe9yhgLWKuYExU2GA1eyu21_QGx
X-Authority-Analysis: v=2.4 cv=A75h/qWG c=1 sm=1 tr=0 ts=69a7f559 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=vlgKDOFDcSGwYYau-yIA:9 a=XcN_yYmeaqUB91j7:21 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX+wX7X+ZZkdqo
 puQa8eqy8Y5kub07oVnB0TA/aFg9859+IqoUQSXW3TMDnL41uq02x9by2cM5mohMOoZZ8e78XI0
 QXSbZgdW/gWMZ7GipBw5KJ2GFCUwgIvcv7LrEcOBoRxUWB38MmSQY1TPkR+BncyW7qsyhrlxhT0
 +RXg4WgO3FQ7bQgysQh7ADEGrxaUxVlHg7hhM3hKrZP6Yo3R7NL/f17mtlhmXvgqXaDGu7IJVll
 htDUw+AZN5oxQ9rcjTyQ82IzvBAsSHWa/MxnPqzQ6ddITl3FJqfI0ocQsu9caWaNU+txJA0xA6M
 kQEfbGPHXJLCcyXSB3dV/LgRKFEeGCVqz438O0phJldpN9SVIgepvqP3s6uZ1ZXpaBZgw8BsxZY
 TOmNaoCQqMuOpIo0EbgBwm6KoTc5ALEil7h1M68uZjHulT7WFHEKKckk++qvulQhZECs7fBoAap
 H3MoY5PmZgrRpXnp3Dg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_010323_035636_25CE3BD5 
X-CRM114-Status: GOOD (  21.13  )
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
 drivers/pinctrl/Kconfig          | 9 ---------
 drivers/pinctrl/bcm/Kconfig      | 4 ++--
 drivers/pinctrl/meson/Kconfig    | 1 -
 drivers/pinctrl/starfive/Kconfig | 2 --
 drivers/pinctrl/sunplus/Kconfig  | 1 -
 5 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 4bafe1dff1951c470fe5a4131d0c06b497a4b575..03f2e3ee065f4268dbd2f94a0ffecbbc4d89df20 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -77,7 +77,6 @@ config PINCTRL_APPLE_GPIO
 	select GPIOLIB_IRQCHIP
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
-	select OF_GPIO
 	help
 	  This is the driver for the GPIO controller found on Apple ARM SoCs,
 	  including M1.
@@ -126,7 +125,6 @@ config PINCTRL_AT91PIO4
 	select GENERIC_PINCONF
 	select GPIOLIB
 	select GPIOLIB_IRQCHIP
-	select OF_GPIO
 	help
 	  Say Y here to enable the at91 pinctrl/gpio driver for Atmel PIO4
 	  controller available on sama5d2 SoC.
@@ -293,7 +291,6 @@ config PINCTRL_K210
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
 	select GPIOLIB
-	select OF_GPIO
 	select REGMAP_MMIO
 	default SOC_CANAAN_K210
 	help
@@ -419,7 +416,6 @@ config PINCTRL_MICROCHIP_SGPIO
 	select GENERIC_PINCONF
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
-	select OF_GPIO
 	help
 	  Support for the serial GPIO interface used on Microsemi and
 	  Microchip SoCs. By using a serial interface, the SIO
@@ -441,7 +437,6 @@ config PINCTRL_OCELOT
 	select GENERIC_PINCONF
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
-	select OF_GPIO
 	select REGMAP_MMIO
 	help
 	  Support for the internal GPIO interfaces on Microsemi Ocelot and
@@ -482,7 +477,6 @@ config PINCTRL_PIC32
 	select PINMUX
 	select GENERIC_PINCONF
 	select GPIOLIB_IRQCHIP
-	select OF_GPIO
 	help
 	  This is the pin controller and gpio driver for Microchip PIC32
 	  microcontrollers. This option is selected automatically when specific
@@ -499,7 +493,6 @@ config PINCTRL_PISTACHIO
 	select PINMUX
 	select GENERIC_PINCONF
 	select GPIOLIB_IRQCHIP
-	select OF_GPIO
 	help
 	  This support pinctrl and GPIO driver for IMG Pistachio SoC.
 
@@ -521,7 +514,6 @@ config PINCTRL_ROCKCHIP
 	select GENERIC_PINCONF
 	select GENERIC_IRQ_CHIP
 	select MFD_SYSCON
-	select OF_GPIO
 	default ARCH_ROCKCHIP
 	help
           This support pinctrl and GPIO driver for Rockchip SoCs.
@@ -557,7 +549,6 @@ config PINCTRL_ST
 config PINCTRL_STMFX
 	tristate "STMicroelectronics STMFX GPIO expander pinctrl driver"
 	depends on I2C
-	depends on OF_GPIO
 	depends on HAS_IOMEM
 	select GENERIC_PINCONF
 	select GPIOLIB_IRQCHIP
diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index 096d0778427e274d6532ffa872c87dfc9d155727..206f3f1249cf50c662c44043e6d2d910a5687bf1 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -120,7 +120,7 @@ source "drivers/pinctrl/bcm/Kconfig.stb"
 
 config PINCTRL_IPROC_GPIO
 	bool "Broadcom iProc GPIO (with PINCONF) driver"
-	depends on OF_GPIO && (ARCH_BCM_IPROC || COMPILE_TEST)
+	depends on ARCH_BCM_IPROC || COMPILE_TEST
 	select GPIOLIB_IRQCHIP
 	select PINCONF
 	select GENERIC_PINCONF
@@ -185,7 +185,7 @@ config PINCTRL_NS
 
 config PINCTRL_NSP_GPIO
 	bool "Broadcom NSP GPIO (with PINCONF) driver"
-	depends on OF_GPIO && (ARCH_BCM_NSP || COMPILE_TEST)
+	depends on ARCH_BCM_NSP || COMPILE_TEST
 	select GPIOLIB_IRQCHIP
 	select PINCONF
 	select GENERIC_PINCONF
diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
index ce6aeec2fc791a067bbc33a0b518d8a15402f7a6..1af4fc320f42bb893ba9f42f4bb0b6d7e034e512 100644
--- a/drivers/pinctrl/meson/Kconfig
+++ b/drivers/pinctrl/meson/Kconfig
@@ -8,7 +8,6 @@ menuconfig PINCTRL_MESON
 	select PINCONF
 	select GENERIC_PINCONF
 	select GPIOLIB
-	select OF_GPIO
 	select REGMAP_MMIO
 
 if PINCTRL_MESON
diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 8192ac2087fc363900b0018bf9e348c030d7b7da..a9a7cb101684451e5897406c52ff955157639faf 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -9,7 +9,6 @@ config PINCTRL_STARFIVE_JH7100
 	select GENERIC_PINCONF
 	select GPIOLIB
 	select GPIOLIB_IRQCHIP
-	select OF_GPIO
 	default SOC_STARFIVE
 	help
 	  Say yes here to support pin control on the StarFive JH7100 SoC.
@@ -24,7 +23,6 @@ config PINCTRL_STARFIVE_JH7110
 	select GENERIC_PINCONF
 	select GPIOLIB
 	select GPIOLIB_IRQCHIP
-	select OF_GPIO
 
 config PINCTRL_STARFIVE_JH7110_SYS
 	tristate "System pinctrl and GPIO driver for the StarFive JH7110 SoC"
diff --git a/drivers/pinctrl/sunplus/Kconfig b/drivers/pinctrl/sunplus/Kconfig
index 4b5c47c193d970b2dc1e9517381936253610af28..69f82590f6d245ba42b773758c5a6955063ae606 100644
--- a/drivers/pinctrl/sunplus/Kconfig
+++ b/drivers/pinctrl/sunplus/Kconfig
@@ -13,7 +13,6 @@ config PINCTRL_SPPCTL
 	select PINCONF
 	select PINMUX
 	select GPIOLIB
-	select OF_GPIO
 	help
 	  Say Y here to support Sunplus SP7021 pinmux controller.
 	  This driver requires the pinctrl framework.

-- 
2.47.3


