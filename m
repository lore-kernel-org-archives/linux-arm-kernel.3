Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623C8C55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 21:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qh+fdpZVSvn8T4ZHxWuDVMee6L+wS7dVCUrMiFrt4ws=; b=Cjv4wkl9LOOVmDdw2jo0JXs04S
	B+esJmz7qtWgodpJfQS6x77g5VC31AVcWlt+w5JY2C62mnZt8vRt07KzAevto1LP8RmdqvO6xq+sh
	Wzj5b55sICOis639Kt54TwUexM28hYXcOcemCiTsG5jlCE0aMelx3B1lE8wKT9LOukG4dDqA1A2/o
	yhZjq28O1ifZbbsiqc8e62U3rJ+wVBHF9HBIku5URLd2IrNe4NgBuKSmgqi3SP6ESk8oLqphdFu1P
	Blct1gCWzseC6TxW1/8L3Z5CVKWeaaXD6UA5tcXu2Y2zYLoMjSb46LyIA5RRPAG7tWb8uNhQpWMpk
	PB6Al/ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGsy-0000000F540-3s2h;
	Sat, 01 Aug 2026 21:04:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGsv-0000000F524-309X
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 21:04:47 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671J01K54014109
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Aug 2026 21:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qh+fdpZVSvn8T4ZHxWuDVMee6L+wS7dVCUr
	MiFrt4ws=; b=YW0CPB6fwjjIyeVPXG9q92oh10n4Dqu/rXn7bqTF9Byi6WDGJrf
	u0B3Xwh+IS2u1Kfs+mrmyb/7AyBpxLe69yRYvnP20JKMOL1gze6tNtXyaOUh9S9N
	BNPeUST0y8Z4KqR8KHz1cpjv2bPea13hoBnVrFtEX8gOoxS+GTF5CZttPUZ0UYZI
	x9RSOR2NCOgR263mSV2+iD3HHfmV9U4tRXTR8e/u21d1zJ8UIheVdlFxTctwlcEp
	03FI4V5zh1jONdOqbwyX1rzqlhJJztm047Pmpvg9cGpkX3JHUD80f2RDxYb30PbI
	29CRrdBUQlaYiC5Zu6hBxvkzv/pgN9JNNyQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8tx1qke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 21:04:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bff5c7035so43218951cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 14:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618284; x=1786223084; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qh+fdpZVSvn8T4ZHxWuDVMee6L+wS7dVCUrMiFrt4ws=;
        b=JPtVumdq5ZRMbPXxrb/Xu/aAbQLWH/cBecmsWwMYQfIxyPor7oUFHzDHSLTWgBkFD4
         +LS4iveyqqdZCjLyC2wJFAzJJFkBLdR1ENlaKpSRhmCfVjUpXP82ggvQWuQ64RdVOKro
         WtkUfBQ1T/J7NgfhrzhmtMlEeQTmNkX9s2yd3RejT+9hXLFjmEh3mgq4w0qV+TgpDh3Z
         fT+HBEWMtVHbT9pSKRVDGuxh3C/jsCIRHaMisg1+F71RU3pq6y2vBRzPuAl+PPv8kghJ
         oGEcXPIp+879Kvzw/tqHiiUJw59EZcz4Ku3qdEd235Rlk5s6yI+UuXxp66PzcXbr11lP
         wgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618284; x=1786223084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qh+fdpZVSvn8T4ZHxWuDVMee6L+wS7dVCUrMiFrt4ws=;
        b=lvkG+TD/H9da88hHn8M1m96TicVDUG3LbwKZRzBIwHdlAj6xzp/ogtb5hELYakvtM6
         aTEMXMwv4I+O5uGk5yXEogem2zWk9iKMakQClucVbPboQVIsU51SvVX2xssYQGUEsGDB
         80UezgsE4whO/E3LDPbUQlze0CCSzKRxC9zfV+daQ+4SfXGuaimEiPQfKMcSwaPDl751
         k/MCCjCgeJ47wz3R4ijj3WFIvPGLT5BeLA+ZJ6Wy7nUmFvk+pvn3krvz5pN1EZv6zcKq
         lN6X4OiapQGeIsKuUedPr7aUeuQuBYPGsEqADHg+flkjCczavV4Ay8wmUGLtYgdd3l/S
         zrTA==
X-Forwarded-Encrypted: i=1; AHgh+RrmHMS41l+d8gjbhTqosPcimVsTQbjRKSEOT1VtHLpqRiqmqir65Q4J1mNes/ycpGLh8tu7asPAmjV3RVTzWQT6@lists.infradead.org
X-Gm-Message-State: AOJu0YwjiIlmUvpzFitFjIzyWwsfURhpQ0U7z5BJEBLz1NnS0IA5ItOC
	Yv8zOqLANmhWbRLap+lDC9u05xofugtZWaPKumJwWl3TsjRRrwLX7lN5JoncS8Em5eqk/3L/e9S
	zZxukEvq52Yu8Lf9YOhFET0zXwR7VW/6oWZ2Smn6c+tDl8+yKSEfloh83sDYG+nLjDLdvNVcb8z
	v6TQ==
X-Gm-Gg: AR+sD12vstCl4Dr1e0z1Cu+oSq3bCkC9qvC8LCadyX5MIMctOWtnFs818c/8rxQxJt/
	aTvejBU4Ow2+sIWJeTDgBIjcPl6ZDI0w4zjA6ehKQKA9g3KKhJOzrgGfF9gjAKy+UEUaGPl/Mk5
	uAwyzT7MOtyxLkupgxvkE0p59deo1eJqk246TuOpHrwP3XjU5x4Ht0qfTeRjaHuHEbU4AnCiufu
	LVNzXczsb/25qP+o4TuRkN0dpGA+sj2izbZrCzZmL0SCbUcbnlb9VQTHwImgygBs5Tl190I3zxK
	NK703Mfffe8IAySBdXcgPBy9J3hk7RqmAy7tX/mLRwUyJZRTfTfL8t36teYzTQ4aIaaozKCa9X7
	PTRb7+Y/bV0+I8Wcm
X-Received: by 2002:ac8:5ccb:0:b0:517:2c1e:8b6 with SMTP id d75a77b69052e-52b567d8750mr102080861cf.38.1785618284138;
        Sat, 01 Aug 2026 14:04:44 -0700 (PDT)
X-Received: by 2002:ac8:5ccb:0:b0:517:2c1e:8b6 with SMTP id d75a77b69052e-52b567d8750mr102080541cf.38.1785618283742;
        Sat, 01 Aug 2026 14:04:43 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41cfdc6sm17960617f8f.8.2026.08.01.14.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:04:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: aspeed: Correct white-space style
Date: Sat,  1 Aug 2026 23:04:38 +0200
Message-ID: <20260801210437.384040-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3611; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=mzQoX3FaTVFufhdy5cjSSr30a02VvRKHJ+kVUAXYnxg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl9leq0oNwbGaHDgxoiOOAFcXnt+3JsmUGAOM
 64VTNptbj+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5fZQAKCRDBN2bmhouD
 11i0D/9XPDNBCCi0S833xlthpzVxAEri51loOV7T1kVDc+cTDtb8PClIiZl/YdxwV94qwer6kq2
 Km0PMXpAv7QY6kgmhKacv39J5pbwHvBMeBVM4/k9Ksx4GVVvFsxbLlCCy/svG9lYo1SsVPPkk2K
 qcnV6A0Y3SLQj4n5sJo1t5s/vsSolJQGzyc6uA7q1TczUnDyyGxDzdXo48LuyoFIlySMlN4V8zO
 AI0ITPp92zqtgo/EtdsYiWi+yYbZ7zA2i1d8ONbcdCQ9O9EKWOr2+p2Ya4ZOiJExk/KSPqoPRj0
 oOAolMZfh5KCZoJ7HEBvIu+1LbvdSafCazkPGvzcWVY8hgdI3pI4dYQNe1i6j/yVIUmRhZCqnP/
 Gzz6bI9jCA1KJcLxb+7yuTyV1ObyOjGOehLztRM5T4dll0PawwBhxAzAnzcjHEbHoVJbDJnF3h6
 behKKc/eNMBmKIFDHVrUHA8ar9atp+qstsuza/ttVwyCNzFygyq7QU1Od3oqN3u628NGOpZfnuz
 NkAKul8eI1sjWmM0NBBND8mk9nEEhNEr2NiJtXp4ltwSYCrMkDhRXeBZ6fvVzJMx0w+ISbAjFvM
 t3Jg5xi56EhNCE3X6t3IYetuG89+Zixfd9RDga9cUMD3ZdoduG5bo7KcFTSBZTm7+IEXWsTw/PW ARdGF4yuKDV9fow==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfXxVrpQ7Yg6OW6
 QCiCrXe8FIShyJVan6aUPVTpKCxhfFX1aKQ3+f9eQHxQzYSJlHb4ajxi3kj0kcxSfc+c50iSCpe
 YWvbjd92ZVDazCAC13jqCZd8UJ+UdkDhU9InYIhnHB0i8BXbke6D0FIl7uYPZ9RhIo9je8KzW1k
 BigMir163IW+G5KOySgOjxPIYMXAGqytu28gD+/CvApMLOg3GeBqk0Rbd5i88Hzkn3Ohv0yoMvq
 JreXiYpEFY+1DVVPXlGGrH4flybBBLuDhvgHgJQ66YpvrV+/7Fo2tyhSeww1lmp09D4ry+4zn7q
 rkz/+BYd0ANWrhvdg33KVsKXDXd64AwiLJWv4LC56yKPBnEoheuUUvtGf8iERq+4B6vAoHoCKiB
 nD9wtEfZdmUL5kYI/9c+anylMr7P70X5SgiajyvMa/NSKPHEsvHp7DC+dFmxi5CgzJSzze+YVY4
 OPh8HETrx69kGrXsPPg==
X-Proofpoint-GUID: rc5vYLNW0rSxDeX4bnOKFkjp_exBAkPR
X-Authority-Analysis: v=2.4 cv=T9C8ifKQ c=1 sm=1 tr=0 ts=6a6e5f6c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Sc2Gg_jFPfLOXhiJGNQA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX+EZ2kWahuQg/
 l7JIdGV3ak/t332M1Ay8ZPrOxd2msS9YVDMSeq2MzOMZX9gLZ+CsFyDbTDEOH8v9e1t9juEWhw9
 zh4R18w4DNzegD1G44Jll7QmpWtPqEA=
X-Proofpoint-ORIG-GUID: rc5vYLNW0rSxDeX4bnOKFkjp_exBAkPR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_140445_897060_7DA97D3B 
X-CRM114-Status: GOOD (  13.65  )
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

Correct a few white-space issues, like missing space before bracket '{'
character or spurious space, which will be flagged by dt-check-style
("redundant-whitespace" warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts         | 2 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts | 8 ++++----
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts | 2 +-
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 2 +-
 .../boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dts    | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts
index 64f4ed07c7d2..fe48397c2a6e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts
@@ -244,7 +244,7 @@ pca9555_5_24: gpio@24 {
 		#gpio-cells = <2>;
 	};
 
-	i2c-mux@70  {
+	i2c-mux@70 {
 		compatible = "nxp,pca9546";
 		status = "okay";
 		reg = <0x70 >;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
index 820d39a92974..1898093b1550 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
@@ -673,25 +673,25 @@ power-monitor@14 {
 	};
 
 	// Module 0
-	fanctl0: fan-controller@20{
+	fanctl0: fan-controller@20 {
 		compatible = "maxim,max31790";
 		reg = <0x20>;
 	};
 
 	// Module 0
-	fanctl1: fan-controller@23{
+	fanctl1: fan-controller@23 {
 		compatible = "maxim,max31790";
 		reg = <0x23>;
 	};
 
 	// Module 1
-	fanctl2: fan-controller@2c{
+	fanctl2: fan-controller@2c {
 		compatible = "maxim,max31790";
 		reg = <0x2c>;
 	};
 
 	// Module 1
-	fanctl3: fan-controller@2f{
+	fanctl3: fan-controller@2f {
 		compatible = "maxim,max31790";
 		reg = <0x2f>;
 	};
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts
index b29e08cea254..041809c161a2 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts
@@ -513,7 +513,7 @@ psu@5c {
 		reg = <0x5c>;
 	};
 
-	fan-controller@5e{
+	fan-controller@5e {
 		compatible = "maxim,max31790";
 		reg = <0x5e>;
 	};
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 6287f80d70d9..383955cc2702 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -484,7 +484,7 @@ psu@5c {
 		reg = <0x5c>;
 	};
 
-	fan-controller@5e{
+	fan-controller@5e {
 		compatible = "maxim,max31790";
 		reg = <0x5e>;
 	};
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dts
index 5143f85fbd70..61735d828d07 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dts
@@ -24,7 +24,7 @@ iio-hwmon {
 		io-channels = <&adc 0> , <&adc 1> , <&adc 2> ,  <&adc 3> ,
 		<&adc 4> , <&adc 5> , <&adc 6> ,  <&adc 7> ,
 		<&adc 8> , <&adc 9> , <&adc 10>, <&adc 11> ,
-		<&adc 12> , <&adc 13> , <&adc 14> , <&adc 15> ;
+		<&adc 12> , <&adc 13> , <&adc 14> , <&adc 15>;
 	};
 };
 
-- 
2.53.0


