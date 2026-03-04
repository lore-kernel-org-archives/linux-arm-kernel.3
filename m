Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465F7EB7EB4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 09:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qdf4w6VuyRTEjBvuhus3SpdwxqzLc8TMdGWXxxUkmY=; b=u8TMne+sUPLwMv+zvHan9BOQT4
	JL7oQ00qZXf39hSMdXeK2IKHRZreQyciiblzGvjWMjlLxWJbdz8WFaIHLBIVxYzzy/qJlB19YliwG
	d5JM1ma+Kh4LQ3/8H9lJLVhHYwnz+YrAKuadAWKgAijEdPnWI5Lzw+B6p0V7Y1YJAsLsFLZvBXuCL
	I36+YPCq5NPOdlEjsIC5Qm8dPdd6/etqIXjLkx2PHoKMygraUToOkDkmM9aBTUF9PB6NH0yWNrmWj
	2AF6Ts7iD2TzbUSCL3o9al3u/tcA61o5eufd4cbf1KltycrhJInzOkr+q6qpb3j5riaDyFXw5NA/S
	S0YX3hMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8U-0000000GoL9-3kjm;
	Wed, 04 Mar 2026 09:03:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8S-0000000GoHh-3GYu
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Mar 2026 09:03:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=8qdf4w6VuyRTEjBvuhus3SpdwxqzLc8TMdGWXxxUkmY=; b=hDXMwesnHqxowUv0gK9k4bBekE
	LWnsEBbZysmmD/eXIIkyoax54nPJKE7sKAPl9BDZDF2iqkSV2iS47eARvBGFmIJzMjpDU/bMRzRHR
	cUdvpdHqWAofGyhiE47CkNGQJUIp0jfLWC5JHpNdf2qMvQqpbnXgFnLMFwithxsPDbxs4xcpTn+cb
	PDSbJxwvdDMg3j4ZmwOsSb63VMljxdxE1xUURz0/BoPDBQ7iGisgIdFFrURZLVSlTUGjue3PTVSMu
	gnuQRlWMKNE1RQ1OWofmuZ90eptATOzM095acDF8YON5zdHms1Z1rEgUWW0ZWljFTdxhSHQbZlp5C
	T70EoTKQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8P-00000004C6F-18I4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 09:03:15 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SQwe945101
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 09:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8qdf4w6VuyRTEjBvuhus3SpdwxqzLc8TMdGWXxxUkmY=; b=D3YmsvRRJYmERCKJ
	Ber1vJrUaYB7CCxhj0HWv4yL2e/W8h0TGa1fDv+p8/E6wNljNQ5vRXeVyFAIS/6d
	8HApID8vFDm6JKOvETA8E3Ei7H97jllJBaFRrkIz4BCNr6UUZZ+5aFVMOlWorFQs
	3bg3lMFgfBd5etlzYjZDpFDqZLwDwvFl3lxRpJVbgVi/nGLtW9AiN2Jsv29aY0ft
	ufBP4NmQHKYv9gjNdVkJH1hx5YWxFJWMRj026Vfd2NGsyG4Me5S6Ck1Z4owihYKD
	2rBl7Jgo3b37LauA5BiYKhAsg8BsDF1ZUi4ENA7TBa0q8I3XZH276dCqTUQQZw6j
	ZqS1+Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvxfccwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 09:03:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c881d0c617so3981511985a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 01:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772614991; x=1773219791; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qdf4w6VuyRTEjBvuhus3SpdwxqzLc8TMdGWXxxUkmY=;
        b=OFf2bsdbUQvYXG6qf+lLP1BY4g4DEDigaWrxpl2z4cqyZqRERyfo3KINwFgph8Xu0u
         WAHR4ovPlcMZiFOsFAtJmXKGldygTceBirLhRJfpFczFa316cWuxk4u+E749kp2NOQW0
         7PTZh6Ir/jV49T4Bja84dgVvJ5pveMW+IAmg1KDl5OsiV3DMoqswCe4y+7TO5RjVKORR
         kx8GSonG4AWyVJkXuBlrKDiiRxWXxyvojyeHj0An1spITdEoQLf4EQez7mKknDSQofeV
         QacRqbQV8mXRGfYtTV58MWk3cHkjlWPll4rSfSlV2h5NGgbe5w2VVzUYX1OOxStqwi/0
         4/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772614991; x=1773219791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8qdf4w6VuyRTEjBvuhus3SpdwxqzLc8TMdGWXxxUkmY=;
        b=dPRHRcBuEGgTKI4dbm1KHeccN0z7eNiU3TKZHGsbLJOmJAzjLLvr8R72oaC6tO57aL
         psqR2YNkFoi+iWD4josdDGlt4+hRryVNZwPDNcrkju/c5Qv1LdrZ5mEG+l6xFkw66V5X
         55RHMomeTowezxZAkHpdKR0lcyPaelDi/Bau0f8M/TLfrlPuKWETPgnDnoQDzfnkwtS2
         uVxjThOc3aM4R5rD/cNkkk2X2USJ1i3X1bVP+zU5P2QfpnOgKLifWciRzdxgMTv0q8am
         sXqwpvbCmTHHkTAuYPtHFF4P/5PGJ2If6K/zcORTx+IOmlOp1Z/vwBf7k3T/SK849s3p
         ozSg==
X-Gm-Message-State: AOJu0YyjabY598BVGD8ePn1ChDxAeASAaAfCDYDLhpiBM/gRTa2bMM/L
	dMNgugPTon+wsv7d7d5RgWcUJyoGjyCE5NWkKoeRIwuA6G8hI6nJTGR4L8LcnvEtnM7XJuwbetY
	7hYRAyQgCQbmA6GyJ22MN2GMNFEIfnNJpnNcnegh4ORmZ+lyHpTlboZ5Tw8LafPH0UigSW/pxp5
	2WLg==
X-Gm-Gg: ATEYQzxzjYnasKBzeRjiHeXWr/tb3/jzzi8PMlnHdRTO5n7saRRYJrQ99wTPENs5Wsr
	kxb9iwk4d86Qe04RN9tvLchjRnxEe+wRDVhj14zzM5pxatW3G+HqNSkr731QwkbsC4rsTxXDsnA
	d3c2N3FKjS0U4qlNk72Qahg2rtx0mtiGgrdSDG0g5moKnXctz1dZHvWiZBVSGDMO2qt7PU6n6WV
	XhlGUiCsA9Q88WrKlcOMDr9FiqSbJkjqKy1AwsB00pMSNGgiELUw1EtObg/ySW0agH/eWs+5MZU
	x8r8Fc883D6FgqNTZHH3/UE0FPeePnpXuubWy4dISgU2j6iHXXFNk2LcXeECXXhF9RNNz5uRwqU
	FkHsAcsMO55fvIdug0V6nrdJT+wYRQ73AkfeuVfjUukkcEOYTiyA+
X-Received: by 2002:a05:620a:2556:b0:8cb:43a3:8b6f with SMTP id af79cd13be357-8cd5afac027mr137833185a.67.1772614990760;
        Wed, 04 Mar 2026 01:03:10 -0800 (PST)
X-Received: by 2002:a05:620a:2556:b0:8cb:43a3:8b6f with SMTP id af79cd13be357-8cd5afac027mr137827585a.67.1772614990300;
        Wed, 04 Mar 2026 01:03:10 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:09 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:26 +0100
Subject: [PATCH 05/14] regulator: drop unneeded dependencies on OF_GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-gpio-of-kconfig-v1-5-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1108;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PtPN45Tp6Ia7+N4Tukr0HxNpokkC0paUCqcZanVagK8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/Uu+2aQcMQSqVOqNgCut0t832TSfkkbw1j6R
 7W5/bLJkgSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1LgAKCRAFnS7L/zaE
 w67uEACvJxSq4g8szPu73sGCAqP37wmvt9beKk/jsRxx5m44qR3EiDbwd68jXBA77Dib7kUNBYS
 0F+pzXOFqNgMYbxl8MYu2FfZ89VtwWnJvWTklsjrxfkTyBiMbaDpiMci5p/Ca/7FKzj66snZfT5
 Bs5h98gRyoJlKIC0yhh+HGcCsKaG+uSPf+moAaZLIl//HuCqTMbapKqpJVQbss1r3/EtmXPQ7yb
 gt414Gc3mJb8IFtZhO2retB6beVtnH3OFmgTYXV8uYo7XfEObejOJScfKNCsI0mxXwtW21PSg1B
 HQzEWFmLV4eRlm1O7ON4sv6HUlmZhRgq2G7I/fF4zV3n3/DGOKMeShWLgRr+i3r5V90Px6k5ZKi
 MForZCflbkS9MoozMkRB/ZgO6ZVGSkU6fYIyWNsp/NbSomEoBrkzwxkkE1Bt6iA5qDlyLui1sJQ
 Pj/0JVHFTS4ucYiTjc2ofCFYjUNZMOYnFst4YARZ6+imwg4qXdjbtpZnAzcNi0+GVH3+zgL1Pm2
 zGZ9WLaNbVkPiCLrNcoTmOO5msz+KmtnD+MSprvKhYJFr2o8dRIwq09sgeG77cZUl6wHLQZjn8u
 g8l1Cv8pxFNm7CDr/DeYJ2Rp3SuwN9pLohd33mIVSEJmw8Y14XfYsop8gHmHkFGbofajDzN84iU
 yluMQdaewamYX5w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfXyAeEaVq4b1hk
 DlIMX63BRIyW1o+9CMefo/m5hDQBrpbwhJFTsR3sc49M4RRvNVn4zK2QgdqwXyjonjJXxlAf4c4
 Go+t+QTvKsjgGIjcfJMLrajdau8wVQorgbsUucgvyF/i+sMsd0JFNEuGOtABGY+2Oa68y3Ax4u3
 YWl7m7Eb2U8YvgLORwhtHtR8SgB3Dq2GMbffyVVBnC3xHjPjNVSTmRI+QSfhdyGOr2/tFQ+utM5
 og5tKingJhJQ6DwTCvRn4aOkcqrrU9voAaZIJfHQ995QxC7kqyJHCG1ayp7P2D/1bVn5Fuudq6H
 jkTAtv75jExqkX5JLoARzJ6/UUhYDhpHwzbFqumnjE0e0TLg3WHMVs+a5kzZwLQB0QqIkCm62bk
 zApb3KDUCLu/a4lFtOFAZkuC1vyBmx1vGCzN9/cFbCK5sM5lPpvrz0/lc0AHXkjI+C7JKQoJe5F
 sUVZd9N1j02YZhGlVRA==
X-Proofpoint-ORIG-GUID: j0otl9on4BUxrPHn9xORXEO2Dc4gWumM
X-Authority-Analysis: v=2.4 cv=S+HUAYsP c=1 sm=1 tr=0 ts=69a7f54f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=6oIPHyQYDuokVZevvhYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: j0otl9on4BUxrPHn9xORXEO2Dc4gWumM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_090313_646920_3C3994AD 
X-CRM114-Status: GOOD (  16.74  )
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
 drivers/regulator/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index d10b6f9243d51574a9ac662b93d4678cd7d94a4f..10e64e3ffb1f5f60e0b62b16ab513f002a42fa1f 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1232,7 +1232,6 @@ config REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY
 	depends on ARM || ARM64 || COMPILE_TEST
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on I2C
-	depends on OF_GPIO
 	select REGMAP_I2C
 	help
 	  This driver supports ATTINY regulator on the Raspberry Pi 7-inch
@@ -1332,7 +1331,6 @@ config REGULATOR_RT5133
 	depends on I2C && GPIOLIB && OF
 	select REGMAP
 	select CRC8
-	select OF_GPIO
 	help
 	  This driver adds support for RT5133 PMIC regulators.
 	  RT5133 is an integrated chip. It includes 8 LDOs and 3 GPOs that

-- 
2.47.3


