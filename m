Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F4BC5516F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 21:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uME0EjnuiD1KZlegyiL2xSJMHwGRLyLgdjypPXTk6so=; b=iurMasaF751QVrPYdQxZEGeKcw
	pU7THs/kOJnmHIc0Us9zgBhLYgBeG45BBwLuAWDf7y+zdP1dDqcL6AIR85vw/0CYqbuVSqjzXEC7x
	U64uZmTZHWPFghTPs7fdYhNWcFmACchX6W8vJqiqW+ReIWdo94ycHe9wY7nMLsbBkIz28rzhIppra
	QzBK5WM3V1ZJ40XYmxiqdG8vlj3QE3T/n4Sh/PKcNoDr8PckdYVZhaF/+qDmv5Q0S7zJMVTYB4llM
	WS6c1K5pfYCpg6hha1/P0rUU4AXc1NjpCrip4+8VJEeVWR+uV9XGblM1ZDZAzWZChW2cXAZhoEgaA
	l5nmUTFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGqf-0000000F3wK-3yMS;
	Sat, 01 Aug 2026 21:02:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGqc-0000000F3vC-0COg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 21:02:25 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671JaDKO4106115
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Aug 2026 21:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uME0EjnuiD1KZlegyiL2xSJMHwGRLyLgdjy
	pPXTk6so=; b=FNv61k5Dt0fi7BrLLopELhBNls8n8ibtZ7FknEnoxSorXNSxWR4
	6bqEyghP6cCpbXjRFZRHn5LtCSXFQwp1waAS3d/ypO2rIZXDNCkNd+XQM9x/R9Ia
	nXNv3zeNkSeYWGZRDheI3zcR2gZM+FL7gVcS3y9APZ5STfDyqeq/GoQhhfCUncgX
	2tyFIiDb0BWWBq9m0TB1fHU2a6e3qz7G+ZAerQ87iNfnAFKpJqdMSUdA9Le3ULVL
	t6boK5pAVWU1hRWvONJB9DDLMw+gMy4uPXPdySLvUvwMUqfcuAGAY+MKvfqdmyOW
	11D9B08xaEWjs1CH92j0nOIgOxAi2YCdlUQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8q51qsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 21:02:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52769fc3f2eso23047691cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 14:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618140; x=1786222940; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uME0EjnuiD1KZlegyiL2xSJMHwGRLyLgdjypPXTk6so=;
        b=GmzydbbGFUCee3pekELp+Sq/vtGog2EBDK7YnUu0r7GCIb9WKwza2m84Cp6/Z2yg2m
         zrFHuaaG5TY/qsMmNq61AjqSjBLoqfXg/fFOBdoNUlRdGcKdRB5HwPhzeei+GGLCaA1l
         1Wj7N9lgoNnmAECoiPDyJ+3kHKivC6ggYigH9o/T4d0zCnAhPyEngo1lFDVkmjmX5jnf
         PqxKtY28UF7SUxf56FOcGGw3poKNP+S2AuoPFAWa3eYw4NWKL7w+v5vs+r69A+aCSmCL
         +TTYucu8OHzbCOXs7fdgcVfc29Eyk1VXpw5RNX1qDBPCOEcwU4bWKBcfzri1gbLmyBIT
         mjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618140; x=1786222940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uME0EjnuiD1KZlegyiL2xSJMHwGRLyLgdjypPXTk6so=;
        b=CwC47KNidmmk6mjACdrEfNwG7dlNjo7O7sDronR/RYNUrVf3TPwT184w3TA4VyM16E
         vyJP3ZzdiMl1uEUDYg/8B4jV4aOaVGrNs2BQxTwkgW+CEvHPQ/JcPWZS0pideGh6UUK0
         xnPetbD9nNNB2Od3788aLgggoIG4pFShBNSpUWH8cYXTI28nIB+hrpeeE9Jah72kLJ0h
         Scpz+ycOj2ZVMaUTDbZFpe01/QFbLzf95qwN4JwEa/jjshWLFV5Z5tRjqdJ48CZttRPP
         Nx3UYRQ9bH82uxULDHq4qZVoRedv2mj54DZvxNzByhjl7UlIr4nokbbtTVXUufgHU7Ur
         O58g==
X-Forwarded-Encrypted: i=1; AHgh+RpkasI2eydNrbi4pCmu2lVjSZr9RMbvn5OSSeg41BJCRegnJ8Z9klzVMaNGnx4WY/C9VZxdAmYT30wNPAwcyt9m@lists.infradead.org
X-Gm-Message-State: AOJu0YxclBUmIHS/H9KZ7Zt0xbikh7qltWEOdM9pPUjd+VujF6xWVPNm
	com8IIGUdGfQvhK+sk3fXfG5mtd5PzUdV8uMo0wocu7xhVe+dWIT+xPzzY/T0oym1Yp/SEurh1f
	mKFvlabEnyl9sWKEWNr0tX0Vc/N0uPOD8t99ZnN6xeN3NSFbRLsWjumHST3cVL4502PfVGlFhgv
	ExrA==
X-Gm-Gg: AR+sD13iEIBxBUdArxCCbNYzrZEL9uE+AvjZnUuIhlYF6gtdsTrmcRFSoQsjEgxSNl0
	R06/letYeyQ3G6XcEIOWceZ4KKRn8ZHvJgNoOGk/KovzKSLYnMqwCrI+1Jrhft+Murf630TfTBw
	CcuATaXBdt6aWGZ/wXIBoluQWEv3lvBIe/gChOc10lN3s0IsOoiZJbiZMZ+djftZ4T9KsUap30G
	0pV/8jvf/GCbrSVNr9r41bW5xix9NH5OwcnRoK6mmFd4JljMSWOgezVrKsJql536e05EkXjU+pC
	JkXrg3B/8+7Hg17M89PcmHmvAIFIcEXRaHV7Vt+M50vgzRZNcLw/wIrxOUzGi1i7+p+NR1zlbSu
	z7mMvTh2rpoYHHYKS
X-Received: by 2002:ac8:7e82:0:b0:51c:19af:6341 with SMTP id d75a77b69052e-52b56796771mr91232861cf.36.1785618139751;
        Sat, 01 Aug 2026 14:02:19 -0700 (PDT)
X-Received: by 2002:ac8:7e82:0:b0:51c:19af:6341 with SMTP id d75a77b69052e-52b56796771mr91232291cf.36.1785618139228;
        Sat, 01 Aug 2026 14:02:19 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm17775127f8f.34.2026.08.01.14.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:02:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Michal Simek <michal.simek@amd.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Khuong Dinh <khuong@os.amperecomputing.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Dinh Nguyen <dinguyen@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, asahi@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] ARM: dts: Correct white-space style
Date: Sat,  1 Aug 2026 23:02:11 +0200
Message-ID: <20260801210210.383417-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6498; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=dv0IIlCsP38vrPIecmLJafEpOPtBJNmDRJ5sixEKHZg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl7SsRxgMMk94Xc+rsy7znxzWW5ysdX87dpQb
 nFQFBr+RKKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5e0gAKCRDBN2bmhouD
 18kqEACF+c3RDPAnQEScb34eL8+0jQrH6tktw9P6Y8y+kcrVv8yqLoucGYos86e8vBzU5eSRai0
 Y587bJwjIRV4BWweCeATMc+i3muqTiLYWMGB4uSdfSSdYGRrnMZqK3TLtqsgqq+Vcuc8odVSx52
 mJJ4IqY5CnVkLr5Huvvm6g6/7OP/VaxBjHCVpjfK858kf5WKIRx89KbafiTl/LCqt7S1fGPmCOH
 ujW8j9GZzrm0ndk28zNRBmNjF6/aQDBMGWbArv6rGybceysUKatJ1w3vPguVzkRlDja7dRP6ImU
 wRkvws73lWIe53aHya8BQH9NZ0GAWd9hFjIlCCxiOjHQYAYwpIBbFHgOIB+4XNS3eC6Gi/Q6+PL
 I5hvZixbTC1ozQBlPK+PqmIoT9VVs8B8kZg0W4BmKoUbTxD6xY6YpM0Jk6q6MnvVOuHJPoIHd5F
 jb9tIYWBLHBWGNDcApVpMfqWh4W7dnKyXoUObmZrayyRmMR2reJ85HGzcGLa5z+WP1zKgZtlFmy
 +cziKE7NT4FYzUHhpeuqddFPzR8Fk0yaaodB8RE6C4DaLoFA2pjCFWv/rM1YW1GeHqWlL0+hEo0
 Yf0Xs1ZYIR2j0eWLVslPrArnMjNg0XCdYMGYi5BCIAQ1nAhnV06kVqIG2YFmyD22PuIKuOr4zv1 mVSVdXzbmhPbIkQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX7tJ6fNwApoRS
 lDtsQIspeSaFuQw0We9f0mmp4QkeEUb1LxxxZErq8yd3k6wZfqvLZAVxWitWbikFCpcn7qYFUL3
 JYd2sUXkpqOimBhqXndSwJNW4C9jL4g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX62ofr5E2mR0C
 we8BQzqrlij1XvSSHqVZoadb8FFjHPR0eGH2UxxjrzjOi9wPoMAJuQlwy8ITSKOyIqINGs+58Rc
 1/AM3oPyhGCE74Hc+0IFInSkJvgXu1u8ul/CEvJmc8exeNJRLxZjzYwNLepS2dPSJilSCcKCWm8
 PrlUnD4Ji2nolxJ1ZPKzPBRNdG/UFzgVmCTElAhgIrdbk/WMkfOT9BGDF6gUodiFc8PNK4a9i4D
 JY9HvSHmcVmVlZahZLe2Hs84zlBc34RMJwV4GWMghrcflrqehtCYMay80Vp2vi0chVxsLIuHkII
 g62ChmF29NGdgj2LoQ9t6la8uHwhmfrM/eTHLboT8wmSypVsACGWNlSauoRVRflvmrBBZzAoDL/
 HEmS232qAfQvqnaPRm8RZqOg0TSsYxVqKxfMazlh12oYYivhlkRo/eV36rc9l2MuGbtdhNG8Oyl
 YEMzeX+i9PudEdmHx1Q==
X-Proofpoint-GUID: p9xZjbUAOaj1d60v-ptLiQ5JwFVRRn2k
X-Authority-Analysis: v=2.4 cv=IYC3n2qa c=1 sm=1 tr=0 ts=6a6e5edc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ED_MHW6qaQPFTTync5wA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: p9xZjbUAOaj1d60v-ptLiQ5JwFVRRn2k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_140222_199848_89A6AC97 
X-CRM114-Status: GOOD (  16.81  )
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

I'll take this directly via soc@.
---
 arch/arm/boot/dts/armv7-m.dtsi                           | 2 +-
 arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-nsa320.dts            | 4 ++--
 arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts          | 8 ++++----
 arch/arm/boot/dts/microchip/at91-kizbox3_common.dtsi     | 2 +-
 arch/arm/boot/dts/microchip/at91rm9200ek.dts             | 2 +-
 arch/arm/boot/dts/microchip/lan966x-pcb8291.dts          | 2 +-
 arch/arm/boot/dts/st/stih407-family.dtsi                 | 2 +-
 arch/arm/boot/dts/st/stm32mp135f-dk.dts                  | 2 +-
 arch/arm/boot/dts/xilinx/zynq-cc108.dts                  | 4 ++--
 10 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/armv7-m.dtsi b/arch/arm/boot/dts/armv7-m.dtsi
index 26f5443d85e1..6ee18d6a93ef 100644
--- a/arch/arm/boot/dts/armv7-m.dtsi
+++ b/arch/arm/boot/dts/armv7-m.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 / {
-	nvic: interrupt-controller@e000e100  {
+	nvic: interrupt-controller@e000e100 {
 		compatible = "arm,armv7m-nvic";
 		interrupt-controller;
 		#interrupt-cells = <1>;
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
index 74161b76008a..6c4131b846c1 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
@@ -141,7 +141,7 @@ mdio@200 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			switch@0  {
+			switch@0 {
 				compatible = "brcm,bcm53125";
 				#address-cells = <1>;
 				#size-cells = <0>;
diff --git a/arch/arm/boot/dts/marvell/kirkwood-nsa320.dts b/arch/arm/boot/dts/marvell/kirkwood-nsa320.dts
index dd5c8ffc8781..56334b71152d 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-nsa320.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-nsa320.dts
@@ -30,12 +30,12 @@ pinctrl: pin-controller@10000 {
 
 			/* SATA Activity and Present pins are not connected */
 			pmx_sata0: pmx-sata0 {
-				marvell,pins ;
+				marvell,pins;
 				marvell,function = "sata0";
 			};
 
 			pmx_sata1: pmx-sata1 {
-				marvell,pins ;
+				marvell,pins;
 				marvell,function = "sata1";
 			};
 
diff --git a/arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts b/arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts
index fec7269088d1..19a286dcc8a5 100644
--- a/arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts
+++ b/arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts
@@ -35,7 +35,7 @@ led-4 {
 		};
 	};
 
-	led-controller-2  {
+	led-controller-2 {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_led_red
@@ -58,7 +58,7 @@ led-6 {
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default" , "default", "default",
-				"default", "default" ;
+				"default", "default";
 		pinctrl-0 = <&pinctrl_key_gpio_default>;
 		pinctrl-1 = <&pinctrl_pio_rf &pinctrl_pio_wifi>;
 		pinctrl-2 = <&pinctrl_pio_io_boot
@@ -170,7 +170,7 @@ verbose_bootloader {
 			input;
 		};
 
-		 nail_bed_detection  {
+		 nail_bed_detection {
 			label = "nail bed detection";
 			gpio = <&pioA PIN_PB12 GPIO_ACTIVE_HIGH>;
 			input;
@@ -276,7 +276,7 @@ &uart4 {
 &flx0 {
 	status = "okay";
 
-	uart5: serial@200  {
+	uart5: serial@200 {
 			status = "okay";
 	};
 };
diff --git a/arch/arm/boot/dts/microchip/at91-kizbox3_common.dtsi b/arch/arm/boot/dts/microchip/at91-kizbox3_common.dtsi
index 465664628419..75d2e748a3db 100644
--- a/arch/arm/boot/dts/microchip/at91-kizbox3_common.dtsi
+++ b/arch/arm/boot/dts/microchip/at91-kizbox3_common.dtsi
@@ -298,7 +298,7 @@ &flx0 {
 	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_USART>;
 	status = "disabled";
 
-	uart5: serial@200  {
+	uart5: serial@200 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_flx0_default>;
 		atmel,use-dma-rx;
diff --git a/arch/arm/boot/dts/microchip/at91rm9200ek.dts b/arch/arm/boot/dts/microchip/at91rm9200ek.dts
index ce691c4692b9..b849bc7049d6 100644
--- a/arch/arm/boot/dts/microchip/at91rm9200ek.dts
+++ b/arch/arm/boot/dts/microchip/at91rm9200ek.dts
@@ -117,7 +117,7 @@ kernel@50000 {
 				reg = <0x50000 0x300000>;
 			};
 
-			root@350000  {
+			root@350000 {
 				label = "root";
 				reg = <0x350000 0x4B0000>;
 			};
diff --git a/arch/arm/boot/dts/microchip/lan966x-pcb8291.dts b/arch/arm/boot/dts/microchip/lan966x-pcb8291.dts
index 3a3d76af8612..1f0b0b647aa9 100644
--- a/arch/arm/boot/dts/microchip/lan966x-pcb8291.dts
+++ b/arch/arm/boot/dts/microchip/lan966x-pcb8291.dts
@@ -64,7 +64,7 @@ fc3_b_pins: fc3-b-pins {
 		function = "fc3_b";
 	};
 
-	can0_b_pins:  can0-b-pins {
+	can0_b_pins: can0-b-pins {
 		/* RX, TX */
 		pins = "GPIO_35", "GPIO_36";
 		function = "can0_b";
diff --git a/arch/arm/boot/dts/st/stih407-family.dtsi b/arch/arm/boot/dts/st/stih407-family.dtsi
index 08acba209c56..436fafd30317 100644
--- a/arch/arm/boot/dts/st/stih407-family.dtsi
+++ b/arch/arm/boot/dts/st/stih407-family.dtsi
@@ -812,7 +812,7 @@ ethernet0: dwmac@9630000 {
 				 <&clk_s_c0_flexgen CLK_ETH_PHY>;
 		};
 
-		mailbox0: mailbox@8f00000  {
+		mailbox0: mailbox@8f00000 {
 			compatible = "st,stih407-mailbox";
 			reg = <0x8f00000 0x1000>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 6022e73f58af..1d6435c59096 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -382,7 +382,7 @@ goodix: goodix-ts@5d {
 		VDDIO-supply = <&scmi_v3v3_sw>;
 		touchscreen-size-x = <480>;
 		touchscreen-size-y = <272>;
-		status = "okay" ;
+		status = "okay";
 	};
 };
 
diff --git a/arch/arm/boot/dts/xilinx/zynq-cc108.dts b/arch/arm/boot/dts/xilinx/zynq-cc108.dts
index f5525c048426..e7cb82c7b8e6 100644
--- a/arch/arm/boot/dts/xilinx/zynq-cc108.dts
+++ b/arch/arm/boot/dts/xilinx/zynq-cc108.dts
@@ -92,8 +92,8 @@ partition@f00000 {
 
 &sdhci1 {
 	status = "okay";
-	broken-cd ;
-	wp-inverted ;
+	broken-cd;
+	wp-inverted;
 };
 
 &uart0 {
-- 
2.53.0


