Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78F6E6F079
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Rpb4W73dFQhb2fFVWipjtDjs1BBDNzb3ATpS6fi83mQ=; b=ji988usBvyrISn
	RashfOEju5dG6BZVf8nwJOMyaCwTgT0WK0QAKMBOa1hEb7HeyMgBd/gU0Wg1MGzKjJGxfH7pRi/2K
	jTeg8jd8jH2jY8O9ioEOuNEI7o7Pv6ZJcI/VyXspHFCXls0qaeIhtKosNnc3Z4NxlfvGLZCsYJkJ4
	LhJSdicLgOFCdUnvgrevBP5lxSkrQ+5draFpwb2k4uPs6sJtt51xzoqK5i8icgtX8mOCtXMVaQQfO
	DCic3SUt1S2JR/cNOFdpml6cHA1HOdVHK6tB0KQXybOTdfo9KXgiaeJD/Clpr3g5VDBc87EDXFDbc
	lwgLPWkQb6HPNRkZ6XPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzGH-0000000Epr1-0UFC;
	Tue, 23 Dec 2025 10:05:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzGE-0000000EppB-06hR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:04:59 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNA2lia2040952
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Rpb4W73dFQhb2fFVWipjtD
	js1BBDNzb3ATpS6fi83mQ=; b=TAiODTnZbMj6PmIgx9AmPxt9azJHDmXkcd8QmU
	d2caYjG+9fRP3dpKbbCX/MqqOww+fHK8m4ygpbKLPRL+NQdtRHTDvANw+HiejMXZ
	+KZ0R2ENLChWcctaHwCkWZXCZHPNkiOEf6fxy8W/5G6ncv6HNjtGK81Sk21UeqEb
	uqeir517kr20DQfkuFHKJXaXVz5TqxqtqLxrQfyqOBgi0Jc4ZQbmGEwiCLGBawhn
	6yV7zTd3clbDt+xqTydTPh04zn3+IZOG4drvZZZ6Zyvxl0Dhxec1AtrfcLBupWgC
	0f+hb355KrFHSK76YEr+Bh1/X4sbZbtLvmUKUHT+Kt0j+Ysg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b763pkb58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:04:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee09211413so121327391cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484296; x=1767089096; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rpb4W73dFQhb2fFVWipjtDjs1BBDNzb3ATpS6fi83mQ=;
        b=FK1jZe3rzHewe0DYpM+kDqGGLh8PODjkgMqBDejgSklsagODJbqcrLtakEHt9KyNR1
         Vid0cPaOTsUM6L+cMMsBzPlt+Hf/0PdchqT+MzAkeu4eo234VagP89AoYH2ZA8nFGla7
         ywJUa8/e6/8/n+L7b1mqhcKvEPEUxoCThm3nXSJROreiGwCekEx2H767sdYaHQ1jiY8Y
         vyIDLhBHyd9BG77ZJnFTCvTDF/bVL7wYNtz5LFb7+h67EGEmlSTo1M+7e4Fp7hvtcUfq
         G5f1iKQVjOSFSSupJmJBXhBQPlDxvnNb3A3Qk5mkbcb3i4hjSYWeDIIJB/9SXP/2o7uX
         sYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484296; x=1767089096;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rpb4W73dFQhb2fFVWipjtDjs1BBDNzb3ATpS6fi83mQ=;
        b=m1VAan3GCR80Te4iE3sw/OgnxcV2jRM/cWZfEXjcAYOTkQl35E/ec4Q7DZ05uiRg9b
         gulSdEBbXfGqZZnw09vqFCjlCoHbja376F51FHGi3sVloQ/a9eo1Qx7XnJKSDFznSIYQ
         Hm2t/uVRZXK4h0SSy4BP+r/vD7E+G3tThdjnYX8ZqDxBKD/nEzeLmOXSDWcPf+9NinlQ
         /BMtxXzFH5f8LHjRNurqPQErqtVnkr9PA9gIUNsRszwGQeUjDboGRQwPv8DkwwxTpaIZ
         wYn+0wDJaySEH1b0t/oiDb1Urw4DfGxeHsSVD3CucRGvqnTWzNuCk7m42aN4CYJ8FkmJ
         Htmw==
X-Forwarded-Encrypted: i=1; AJvYcCVzb+P5b4H8qk8SFUYU2+DmnCBj5yG124EOidTH7tDpdDKk7dSzfv6dRaZj57DslVopMW0LvdpCOIsJ1jmIeCxo@lists.infradead.org
X-Gm-Message-State: AOJu0YxcMTd9SbaNa7bAoHBr2wp+Tx02NpP/bUkjXxJuz6KhlSKiXr2I
	VXYNRCvSYOiWY9GHCZmt9G4WZ7bHiLp0ALuibDwpsaV+M4p/ny1u3fBzltPAHC/9/Zx+p1bqin5
	0J5zquz+yY4h6AgS7Nml+vD1fKHOdZYXQ5SmIAn/g1zsceotwNXDQbuBnhuGPk7VFHhDDNkiU+B
	29FQ==
X-Gm-Gg: AY/fxX7ih+xe8I/KpFzhHpZ1WmGyPt35wbwIMiVarT/W0FGR+9VavUSnEFXg8kqFAql
	WFxxVYdg7JBwY59k/7C3BChxA6/2659Q0lOs9WWD0IG+WZgSM0Nk4K+pMws60/B6MX1C8gMdxUi
	Ku+GEMQkubycBmNCLIJ/gFtt3J7b7w4uD+BJig0NpEvZ7KeVjqifXtEotkMISLGf7D+nlSOTpE7
	SA6bmGYj1D42GMVatEbhSLCbhAc7NXX+9DmQoIQFM/39yBWHI6FoEZ1ZwfZL5kgUgGMYzw0n2uj
	+4wyNR/GYOy0JSdcmWBCdBTlh05UWd0+lMn7ODdsKEuNZuKHimf46fgKrz6wSmxVymFkS4fNS30
	Bv9DRMeWG3S6X7GvukiHuJxbnHiwSM9VqtbZFYAo=
X-Received: by 2002:ac8:5cd2:0:b0:4f1:83e4:6f55 with SMTP id d75a77b69052e-4f4abcd06f8mr204814851cf.16.1766484296258;
        Tue, 23 Dec 2025 02:04:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiNHKqDKCrFlscF1e8nxZ5lfR1gZCs8573oK/BJMiXsdrVSl2/AbVhz7yPs2GYVwiIg03KGQ==
X-Received: by 2002:ac8:5cd2:0:b0:4f1:83e4:6f55 with SMTP id d75a77b69052e-4f4abcd06f8mr204814511cf.16.1766484295661;
        Tue, 23 Dec 2025 02:04:55 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:04:55 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 00/12] i2c: configure parent device and OF node through the
 adapter struct
Date: Tue, 23 Dec 2025 11:04:38 +0100
Message-Id: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADZpSmkC/x3MQQqAIBBA0avErBvIqSi7SrQwnWo2JgoRiHdPW
 r7F/xkSR+EES5Mh8iNJbl+h2gbsZfzJKK4aqKNREfUoZNE4E9Dxg/b2h5yoh643+6zUpEeoZYh
 8yPtf162UD/OF/y1lAAAA
X-Change-ID: 20251223-i2c-adap-dev-config-9403ab811795
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3406;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Aessx24OljIFWC+mc2LsHK/66rMxd0lRq5JDSMHPZrs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmk6CFIKSo02FUVtncKxbJmpddSLBsdGwlGxk
 3xgKHq5LdWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppOgAKCRAFnS7L/zaE
 w9lvEAC6IPKCIFxQKEcT0e9etvsanf7pMOhUQltvitPug6OEIG0KYMeK/K84tQWkYK1rDNEM9+S
 VInnmCouxiX6wvyRpsmIWYdoTH3Hx0NwbMAtenLaYgj1HOqPC/2T4EfL2fhIHFks+HcwQJQtX/U
 6IJHl2gOPKIqt/Nsdy7uhRu+dsZtrmTox0QcIWDnQ2u1AJHSOPrUWAP2bziaEPzvN7wMFnmMI0L
 yWjqOuw6piX/7Jv7xgdIphnmGvtOjVJY8CN7EzZPssJk52TGwSu4jbPZ+oh+VVPDc5ednw2LJcG
 GbY06fhDBfb2tk7U5drjc/kU27DZ7CjOZoBeGXE3FMBPIKQBarOf+PxOssqRC6+0y+CfpBs/DWW
 rk1QSObI9tMRBTzeqAMF8jCp6dqEm7lHH21J+CnG3Ed1AFcnI9zYtDqbK4FKGKA2z6wgf0gwQbZ
 48KFlz+jGZHxm7KimHiLcfu5XZqlSW0GKFLwH++KbYffIP0VH8DrDBU4X42xbIZr/WaBfen+HLG
 tgpottRsMj2BslGnnqPwbYb70GrH0NM1WEm1Afevt9odAaChxpRNm0sHJHpnE7mukt8NUqfWiVO
 19KRrejHoawa94lLIdae41mcZ60Yr/TOm8q9qNfStSjmOFamByZqVSisccC+ixsP/EnQD1TXsYA
 hicHpNR/3lUOyWA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXz8F/FVhvAbzM
 hTS1GtiL8B72prS28ihq4QGmZIsDHqHRu4Vf5HFGvm+wunRuzoKqVL1o2zOXT1xWgv36bgSMO5V
 DviGtc9p0LdPH4BQl1Lqc7fmK/QFQJW7Rlfz9hm1I8mm3AeHiTjfs0PZ1Fb4qS9kVBDqDhsLSo3
 1SGG6tqeNIlXf/fnBM1NUVMdpHTm9MDZxk3wcioK5FPtk4jZ8IWbeHShMKJuwaFNfZwMENbzyCC
 wH2MzG0jdkcYyMRMF9JjGNpIctgAC6OuGR9ohdy4jqNj0g7vsKgEmUhocpx34kIgvCJsd858aP6
 FX6/n46jGutq7otpemnG/2fpGoTryP2yFrS3K3UwVvBeT1IXTb3m1RT2u7aLzxQd/4RF+YOoUVr
 hpzr+4TJ5SWdWn19b1e09BTGTX22+jAD2DRWzjcz7+6mQQGJguqIGVfBQAIY+Kj8gIlxt9P/0EF
 TtoAsRdH9yGkqGkiobA==
X-Proofpoint-ORIG-GUID: i-ptKxqtmgDbq_ZPyJWyMJfiO_UbqUXY
X-Proofpoint-GUID: i-ptKxqtmgDbq_ZPyJWyMJfiO_UbqUXY
X-Authority-Analysis: v=2.4 cv=H6TWAuYi c=1 sm=1 tr=0 ts=694a6948 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_sFN2lLQU9JdPEgOWvQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_020458_180768_18993323 
X-CRM114-Status: GOOD (  19.91  )
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

It's been another year of discussing the object life-time problems at
conferences. I2C is one of the offenders and its problems are more
complex than those of some other subsystems. It seems the revocable[1]
API may make its way into the kernel this year but even with it in
place, I2C won't be able to use it as there's currently nothing to
*revoke*. The struct device is embedded within the i2c_adapter struct
whose lifetime is tied to the provider device being bound to its driver.

Fixing this won't be fast and easy but nothing's going to happen if we
don't start chipping away at it. The ultimate goal in order to be able
to use an SRCU-based solution (revocable or otherwise) is to convert the
embedded struct device in struct i2c_adapter into an __rcu pointer that
can be *revoked*. To that end we need to hide all dereferences of
adap->dev in drivers.

This series addresses the usage of adap->dev in probe() callbacks where
drivers assign the parent device address and the associated OF-node
directly to the struct device embedded in i2c_adapter. We extend the
latter struct to accept the parent struct device and of_node directly
and make it assign it to its internal struct device inside
i2c_register_adapter(). For now just 12 patches but I'll keep on doing it
if these get accepted. Once these get upstream for v6.20/7.0, we'll be
able to also start converting i2c drivers outside of drivers/i2c/.

[1] https://lore.kernel.org/all/20251106152330.11733-1-tzungbi@kernel.org/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (12):
      i2c: allow setting the parent device and OF node through the adapter struct
      i2c: qcom-geni: set device parent and of_node through the adapter struct
      i2c: bcm-kona: set device parent and of_node through the adapter struct
      i2c: keba: set device parent and of_node through the adapter struct
      i2c: omap: set device parent and of_node through the adapter struct
      i2c: rcar: set device parent and of_node through the adapter struct
      i2c: st: set device parent and of_node through the adapter struct
      i2c: mxs: set device parent and of_node through the adapter struct
      i2c: highlander: set device parent and of_node through the adapter struct
      i2c: gpio: set device parent and of_node through the adapter struct
      i2c: nomadik: set device parent and of_node through the adapter struct
      i2c: bcm2835: set device parent and of_node through the adapter struct

 drivers/i2c/busses/i2c-bcm-kona.c   | 4 ++--
 drivers/i2c/busses/i2c-bcm2835.c    | 4 ++--
 drivers/i2c/busses/i2c-gpio.c       | 2 +-
 drivers/i2c/busses/i2c-highlander.c | 2 +-
 drivers/i2c/busses/i2c-keba.c       | 2 +-
 drivers/i2c/busses/i2c-mxs.c        | 4 ++--
 drivers/i2c/busses/i2c-nomadik.c    | 4 ++--
 drivers/i2c/busses/i2c-omap.c       | 4 ++--
 drivers/i2c/busses/i2c-qcom-geni.c  | 4 ++--
 drivers/i2c/busses/i2c-rcar.c       | 4 ++--
 drivers/i2c/busses/i2c-st.c         | 4 ++--
 drivers/i2c/i2c-core-base.c         | 5 +++++
 include/linux/i2c.h                 | 4 ++++
 13 files changed, 28 insertions(+), 19 deletions(-)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251223-i2c-adap-dev-config-9403ab811795

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


