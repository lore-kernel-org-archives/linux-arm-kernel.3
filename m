Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DEFEB7EB3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 09:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKMv0mITquv44pXV22U/DAysZwknoanpdVPJIYszFak=; b=3HJf4Ufw/C4Z+rcXDR8Nj/M4pV
	OU4dLLhqlOCIlQKPNuVx46xbePNASzRMM4kRWH13hLScJc1WKCZ6zSYvAMsbqRZyo2gIqTCcBkpqm
	1mrKf4uUeU6QsjY2UsxvlH6oiF3SfRR5VxGDWWPWxlQ1izmjkBAU7gJGdo2213SGo9Xuj1jU64te8
	Xrb1JI8GH0tOILGElwrT27H5uF+byOKYzLX9THxVd0E/WLogXvATpztkigBR0wkcvLFAXBWMRz63V
	LGUTDRpOH8/YrI3B0w4gNeWM8A0gh9j4dSViKDJUgcnckrE3N2MjQGRV1TL8zN/Ot0UkrtFSYGJlB
	h8epmasg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8B-0000000GnzV-2Vt8;
	Wed, 04 Mar 2026 09:02:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi88-0000000Gnvf-2Nif
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 09:02:58 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245TIMf1423687
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 09:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fKMv0mITquv44pXV22U/DAysZwknoanpdVPJIYszFak=; b=etSmu2rrizN+QK3x
	oG7GvtW+6Qa6phJi8triQQ2AQrl/vKvaOX7QkhxjDj+PgYK76eLlK0O7E6S9MNks
	ocnckIef5kk0uikiMLB+SwSLDjUl7dN+lgIAdcG8UZqEjo+Wy2/70jXjOgh6nwdJ
	ntxj+1KIps6UyUJZ4VfLS7suCNmvUjjQlppHRsqKp9ImDshNr7MtQMDRg2dJDCw3
	eJt6pf7Co9aKbhjX9iho+fIKxMGZlr7H7upL2BqnlPqlkhdSs522mDtZbX18LyUk
	porvDeHZKJb/YKz9hTqiBP6bjambYy3iQ+L//r4c89tqHMdrYo9vXU4rUWbYYksi
	M6CNFA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpe8u0rws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 09:02:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71156fe09so4094709785a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 01:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772614975; x=1773219775; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKMv0mITquv44pXV22U/DAysZwknoanpdVPJIYszFak=;
        b=LywmY05Hw3BKbU/5W3nER3JbI3BTym7OA2xyZz7EQB7t61jggaScafVCCR/qu2roS2
         4fVHK/pkFhDK4L5SUOkbQPeYSEqVylZy46jaTob+IlBd9FkQlkAqMtQ9kVd2EkiOENR+
         f5tqjZR++WFRxgWkbD+Xv7QFOjEEsQBP3URzNtjgzTHCbb8swnqQiSJyZRSNa0q62pUS
         UqOSWFaYLqb9AE0M2fUmKrZQXwIHPmXF0+D6/Vkg9yu2G1N+S94OotD06zMphzu8eJJY
         XdMiV4yIOb+gDiDNwZ9AWkQYhGAZ2GRH7NUvA9JGnt/lG5N9ztx7fhqkRfOQj3SCH8eJ
         7uhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772614975; x=1773219775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fKMv0mITquv44pXV22U/DAysZwknoanpdVPJIYszFak=;
        b=h17Rg6oMVmArLOVLfVQncVLe9XGdlQIaqcfU1FamzruYl5cInwmGDSjdcCAsyj6wsi
         h+HjTJlimzjgeR4+hhziYd9sGOXER1Jho5jBQvHNqWSQYh12aHvtviJ0zQmcpqTV66Uz
         MXs2XGPNwjgS3gHiCgUcHv2vvD3vAaBSOC5+kV0zSKq8Jdnqj5G1+af9xkXduJ0DESZy
         NPb7Qu692+pWON5Ai+RRkl9mPu/oGWKOCgWRpl2pY7AdyuMItS8sVDbFu6ezrdzQQBH1
         KMMqWaHuKo0XSm9aSXqoOpzEjSisUFmovWUEtTFZmNt3TS1tZ00V38ssdIUtkJmDBMfy
         9kvg==
X-Gm-Message-State: AOJu0Yye/ZTxk2A63UHrg2DcM3Tebn7F6pUHrukNsMkDORnve+6Hmfsb
	896DAiWJ1nHc7tB6pvIjF3sKaAjLSbsZ3HYAd3CxLXrvSuWKNvtbyqysV5GDUvyY7Ad2bkZwt0+
	Q3fGTPz+bOLhzC9q52YBxBciyfLPsxZqmDSzYStd43ZjuNFPg9cB5wZvXAmGSgTWSQ7NIBAp1S1
	wHdQ==
X-Gm-Gg: ATEYQzy0gmFmVmpBhff+0PK8zjW8vmD8UQ6F3Xi9MrjQNzdL7zmQlSYc13xE0dix33x
	Gibf7SIqIGXk8+B9PdKDVmwj7m4wPGRrCC3TK5p9TgxgCnbg/GfT8eeOARVD8Vhyg23XzADdL1Q
	jBDSzUIlLNUJZz7RCF+X+ZhxQueJmibeFtTNfsOfmqozdlhvZpdPXm5SMP74bI0pzlxXLOhdz5W
	7V+cmuZZSasPYSkISNTBliFYEXcdnjBQdNWi/67/u3v+U/IC3B/NsLUZpoK4M28R6f9/gsGMVJT
	2DF+6bW01aijJlUyxq6EeWCwPsmz0aFPS6GQz2+CkrRVtRVv1EDfbjXSPm+gcP4B0mD9Pp7Gkkb
	lGXwk5WH/chZZpq42oQHAHgTbjU/CUQNpYEPpXp4DbroWtynbKWlK
X-Received: by 2002:a05:620a:1912:b0:8c6:f411:5eec with SMTP id af79cd13be357-8cd5af817a2mr154595785a.38.1772614974712;
        Wed, 04 Mar 2026 01:02:54 -0800 (PST)
X-Received: by 2002:a05:620a:1912:b0:8c6:f411:5eec with SMTP id af79cd13be357-8cd5af817a2mr154589485a.38.1772614974225;
        Wed, 04 Mar 2026 01:02:54 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:02:53 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:22 +0100
Subject: [PATCH 01/14] arm64: Kconfig: drop unneeded dependency on OF_GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-gpio-of-kconfig-v1-1-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=760;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Et22qRZo4fsW5XM2dyTAA1YIF7lG8E4lUkHkWMi4kdA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/UqST44JLf/6SC8h3if++ARk5Zk1RSnf/wtu
 ShX2ySz2bGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1KgAKCRAFnS7L/zaE
 w04zEACcM3xXYrildZ9Wyvzi6zYaS/VDWOtU52ZMAJ4+Wh2B2hAS8Ih/mocnq33rCiXxhVnXn/3
 jnAWPg4G3R7DoGyEHeKDhMtmgbuf+jQVeAJqXqpmKhxp1YGO0zbO3obbcoiG5HbZFINoLT9orm9
 m2AhCFbVWQXR4UeFBxYhCgU5rVmawWHimujZPt1ZBuL1A15sbzij8JAQexq/MoxGo4aaPgAMDmY
 fw6cQs3xFFznZvVllt7nNUn2YxgcE3z78u9VVhIjIndc2R3WVBC6MuvUm32nZL5W9ClHj+Ex0K/
 UCWK2PKYjOpJUxgWz0CKq7UfXSpUtzkSEM+P/a2uVUbsRhCOhDeWpfbk9nG7SMDzJlB19hOVyc5
 Y8lZFm90Nm5za4kaqvWBqoJvNQe1rnfI+7adzD29qg1ZlSLV6UuR1A3hSVSisghrGZWDw5yPZ4P
 czcoRMGNqHkbYqZEOZIAvOOHwbxJPQYy458HZ1ql/esQ2Z0TQkznLVALIOmk93TkfN1QAOAkAgc
 ZBIdqoJF7fm6NacBK/5k4vBM1unmCOOYUr0KG4Jfz1FI5DaGBXyMhcJQhdPTUn82XhHarg1jcgd
 +KFeCTLnphuVcl6AsadJSAd7+sUhnviaLDXNK5MD3jGhJ6Wb1mvqIahEUMjDv/hPWDkvqwepwst
 CXWpZ6tcDATGOpg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: DuPJh5uPQ-GtFKVGgkvfOhK4e_aGtp5p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX0C7ptEdmUZv3
 /dANjDDb+FBmldpNSJLsFPudyyHQLxrsY7fjgXo5HcPpa6LBQQiJlQa8XbdbAhdlMFWpWY24XWy
 C2VB3GXVTDA3T7A9HM4ca7GoA6IuS6UjmS5dvWq8jDBUmnPlZlrlAEa6kiBgiqCC5t7fYBxK5+h
 XLLCqCgkxvuNuMQHi8zgNS3Ch6uZcLkCLSWwz+/heATc6ZMzEUsIToG5aFk47krMtekuVYj/0de
 UoM7DFz4eTDOiVbRyDNiYqwcacwD5xtTSv7EIZ6tmdYNjRdRYFrloLGI+OMxFC0qkb7Yq7vx2gZ
 wILiLUJlciyh6cygkmtch5IsV3aEZzRQe10gHfngKtfnsooQpeD/ZNrRAoW8eJ+R3mTgWp1Acec
 HItmWphywJj/yjp7MCQUuBYkCA7GnVTqTQHLtxJzVSCNCp0A/FK+Wmdffi62SblSauLTw71hOHG
 MtnePq4aD7PJrMN+yOg==
X-Authority-Analysis: v=2.4 cv=FpAIPmrq c=1 sm=1 tr=0 ts=69a7f53f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=nExzm2HfQztilrPChXAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: DuPJh5uPQ-GtFKVGgkvfOhK4e_aGtp5p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_010256_740657_D5778D28 
X-CRM114-Status: GOOD (  15.29  )
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


