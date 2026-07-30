Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94D0C54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 10:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6nUw4Rgp4SzWkDJhOSewVZkF8EbLS8yovpiTKWdT0A=; b=POvxLxUVoSRMjC5R1nJEnLsOPR
	VBb+wE5rZy41ScUYzG85/4xJb+9OFUUCFxiXmptpMF5WShehtzlG1Aj0FteTLvNbCfRmGr2sN6ewH
	0cT400tK0RT1YQnNW/A0SehIRxvLfuq0cccEcRHr92z5Tjj+EjXwr1OQiYysO/iLdv3g5zt//U4nZ
	ITUAQw1ll8kTdL+4kATGouGmwxyKX+lekGlo7EMwC+rPeLPcNLH+tBcefqetSitvgo1TyKbk2FnJf
	e+25obhCGdPB682Cy7SUGGST6jOYwbkor8fQ1ULs1H0negq7SvqMdxMpXnHUsDSWcbAcvO+xikyml
	q8yJYilQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOFT-0000000AFSh-02er;
	Thu, 30 Jul 2026 10:44:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOFG-0000000AFMX-2Zbt
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 30 Jul 2026 10:44:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=u6nUw4Rgp4SzWkDJhOSewVZkF8EbLS8yovpiTKWdT0A=; b=OI014YKxJe/ll8uq++FsYAmSWb
	J2BDkklp2S3gOjrq16HNpnQqJlI+cXD0SOEi2ZUvImMK2L9SxSfNSI1MpROidY+uhjuR1nD55Doft
	OBRpq+2qmHB0/N2+Kk2WMlfL0mqkXeWwUbBRgu/psdAau81mUg3p2rxkxl0BiyUWKaQRBWYoYcQ+f
	kyoETYNPtuV1i42ellJb1y3azsYyUDqzJkgHfOQmalZdST/RVPzzrzJZBZx9jJ/VAQ1MwIdM0xM3k
	oWMemuo8xK2xHypHYpHi39pQTeeisdn+sEqXLv4z/eOrMe+tK9kOZUtCqLBVBvBtCZP/L7jxiocTM
	dsbBykKA==;
Received: from mx0b-00622301.pphosted.com ([205.220.175.205])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wpOFD-00000006asg-14ms
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 10:44:09 +0000
Received: from pps.filterd (m0241925.ppops.net [127.0.0.1])
	by mx0a-00622301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UA4EdH3329173;
	Thu, 30 Jul 2026 10:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	com20210415pp; bh=u6nUw4Rgp4SzWkDJhOSewVZkF8EbLS8yovpiTKWdT0A=; b=
	t4pLsid7Fv2ujKLokdOgAmKrhDs/kvjN8X+MvyQUW3pRpgpm6OgWL3I0Pos0CnhS
	Mj51p6bwtH8KgoZAJ+pQv9iU/0Nxmdbhb4xcUXrk6t8c1d0hfMPTFjJ8HlicYuJp
	rFYG99kiHdDswQaf0IWPCNobjly51qhA+xowYboTbkbrc3835n2GisIUScnWTDeE
	s6PldToMK8B43rfkOEmxNMxatVHe+fbv9VrqP/J4dQ8G1HPTGTCgGzjJ/yMwuj9+
	qfAv8F1zFXEh3+x4H4tB1Iva8965JGE+3DqRXi0rvbifUpsNLpKIM8KRPqXH9nIH
	pG2IjJD0/v1d7Sx7Dpbz6g==
Received: from webmail.ambarella.com ([12.30.244.130])
	by mx0a-00622301.pphosted.com (PPS) with ESMTPS id 4fq8twhnbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jul 2026 10:43:55 +0000 (GMT)
Received: from ambtw-ex-se1.ambarella.net (10.2.5.164) by
 ambus-ex-se1.ambarella.net (10.1.4.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 03:43:54 -0700
Received: from ambtw-cas3.ambarella.net (10.2.4.228) by
 ambtw-ex-se1.ambarella.net (10.2.5.164) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 03:43:52 -0700
Received: from shbuild7.ambarella.net (10.4.8.70) by ambtw-cas3.ambarella.net
 (10.2.4.228) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 30 Jul 2026 18:43:51 +0800
From: Long Zhao <longzhao@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        <linux-arm-kernel@lists.infradead.org>, <soc@lists.linux.dev>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        "Michael
 Turquette" <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        Linus Walleij <linusw@kernel.org>, <linux-gpio@vger.kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, <linux-serial@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-kernel@vger.kernel.org>,
        Long Zhao
	<longzhao@ambarella.com>
Subject: [PATCH 10/10] MAINTAINERS: add ARM/AMBARELLA SoC support
Date: Thu, 30 Jul 2026 18:43:30 +0800
Message-ID: <20260730104330.81367-11-longzhao@ambarella.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730104330.81367-1-longzhao@ambarella.com>
References: <20260730104330.81367-1-longzhao@ambarella.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Proofpoint-GUID: 2E2TaZ-ORL0hTrjqU4cm_1acAjU-gkov
X-Proofpoint-ORIG-GUID: 2E2TaZ-ORL0hTrjqU4cm_1acAjU-gkov
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA4MCBTYWx0ZWRfX3sXvoiWGXpDQ
 r9So4QzNBDic2o8KmHfTFnZ4XrkWUKt1vJrU3YqdSKt1ZH4eHELSztT3WANBwDaeOaWMJ2XScSR
 DpzzohoOg9TBCxftkhCTFqB74hU/vm/oZ7sgheCYPG7OdooP8gx+kfpgMK37KHUUoeZGKJsONVd
 h/ABMMvin06Cw/4Z6h4Ee5PKykZmFrq+SYKAYsQXeMG78SE/4BB0B1hDprZpHYyAYY1n216mxqy
 YmzbeKSNFCGBiBj3oqsXZsV4PL5w4rruL2dE8f5178i4/0uJ6nFKxmQ/9I/w70qzgGh7SPCCqfF
 HCH0tT3sJGuq5Dyxa9rDz7yYmRXlbCuovCC9uFtHIwUP3Iy0+XtbEv/Mm5aniATl3ZN1qIBhRRg
 Rk67dLSKV5q56nfMWsHMoykGbM1IBw3PlaKZzm0IOPKuIDIbarfMtUfRM/5j+ST65X5rB4BON5u
 CBkmnjq/SZckrYQhdGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA4MCBTYWx0ZWRfX2Pf9ohZk9wey
 FxdnnqGB+var+2/5c72ouY2wudMRn9l4VQbXmPp+J0+LVLYIgRvrZxHTnJ9ESEaGBh94gHw6sDK
 ozcqWfWXksCT9o+EtmBQUI+sJkQP1y89RAhyudbu8GFYJdWMZiRH
X-Authority-Analysis: v=2.4 cv=PNE/P/qC c=1 sm=1 tr=0 ts=6a6b2aeb cx=c_pps
 a=DgnZYc2JwZ3KnY28M5UqXQ==:117 a=DgnZYc2JwZ3KnY28M5UqXQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yXVIz-0bn9infC194UBj:22
 a=KblO7da7ppA7TBl3N-nE:22 a=ppJngBeKAAAA:8 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8
 a=zd2uoN0lAAAA:8 a=6h8Q0ANTdPAEg-4E5kYA:9 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_114407_672248_D14B4A22 
X-CRM114-Status: GOOD (  11.43  )
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

Add a maintainer entry covering Ambarella CV75 bindings, drivers
and device trees.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 MAINTAINERS | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 803b60ad628f..34c0ac2e00b9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2502,6 +2502,24 @@ F:       drivers/clocksource/asm9260_timer.c
 F:     drivers/rtc/rtc-asm9260.c
 F:     drivers/watchdog/asm9260_wdt.c

+ARM/AMBARELLA SOC SUPPORT
+M:     Long Zhao <longzhao@ambarella.com>
+L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers=
)
+L:     devicetree@vger.kernel.org
+S:     Maintained
+F:     Documentation/devicetree/bindings/arm/ambarella.yaml
+F:     Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml
+F:     Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.ya=
ml
+F:     Documentation/devicetree/bindings/serial/ambarella,uart.yaml
+F:     Documentation/devicetree/bindings/soc/ambarella/
+F:     arch/arm64/boot/dts/ambarella/
+F:     drivers/clk/ambarella/
+F:     drivers/pinctrl/pinctrl-ambarella.c
+F:     drivers/tty/serial/ambarella_uart.c
+F:     include/dt-bindings/clock/ambarella,cv75-clock.h
+F:     include/dt-bindings/pinctrl/ambarella,pinctrl.h
+N:     ambarella
+
 ARM/AMD PENSANDO ARM64 ARCHITECTURE
 M:     Brad Larson <blarson@amd.com>
 L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers=
)
--
2.34.1

NOTE: This email (including attachments) contain Ambarella Proprietary and/=
or Confidential Information and is intended solely for the use of the indiv=
idual(s) to whom it is addressed. Any unauthorized review, use, disclosure,=
 distribute, copy, or print is prohibited. If you are not an intended recip=
ient, please contact the sender by reply email and destroy all copies of th=
e original message. Thank you.

