Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8A4C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0UQSMtZb2dkaGCmhPnl+4tNtTS3hjmr7JepIp4F7f+8=; b=AdzjIzSuD5ApYLzaPE7Xt8TK2u
	dGYxPLNSR49VkUmh51aA68NRgM800oQauDq+DLI15iBia5hJtpcIL6I9dkpHficMaD/U7BGskJl/Q
	za+M7YQR533WImFLH65gRLwT+pz4NFpJzWERshT9hWrkQ+iPppXLPFc1tBwekvzixLTmIKR2S6R/R
	ebb77Kbn5+RyYYNiMfxXGyvzCWQdO4f4vY/Gez+nDH1CAzlpyoy9+l1VJnqFIfDxZ+9Nskq/2fafM
	tR9Rp/4yzhV2N0xzcXRZcW1sqT4c3iPDmU2QbHIGwO5oklXaAY2JmnA4AxhG3cVMrBzJ7wZRNgr3a
	PFFb9Jyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfie-0000000C2no-3pqD;
	Mon, 06 Jul 2026 09:34:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfic-0000000C2mP-0pz8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:34:27 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666947UK104035
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 09:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0UQSMtZb2dkaGCmhPnl+4tNtTS3hjmr7Jep
	Ip4F7f+8=; b=KPyn6K98VP+mkssB6+0f8pRk8ckzkuygXCealfEm5Ot03UAeeco
	zhguKZPAr/R9jS0yYEFK2MGUltC5kkJQ7v+CxEY2nCaZG8SynKpYUgmlKuT1aNCT
	8+XSn3zpDRLseiyXvmrhoukcFtVR1CUZ5FJkVuft0SkQX4jWexeWgTX3ogBF83iQ
	R97HmPvZa3f8Yk6VNi6KTaeO1sXL9JJHlpn6iZcs2hzzrg6WcYBBSJKWccVdET40
	DHVKRqxrCBvpfG20paBUBHi8sb4aXOKcHktDIuQQ93Z7LJ1HWrqed0dUlPKjkM1c
	jTyGrPG13A+G/kf/Q0rcn43v6aM6pc5sNNg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h50bhe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 09:34:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e59b0e0f4so195665085a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330464; x=1783935264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0UQSMtZb2dkaGCmhPnl+4tNtTS3hjmr7JepIp4F7f+8=;
        b=SmqDkHbPhQso9n5E1+JdfwrPccCLJ2o8gcLVSxNTdqeEAcgZPOVNx1la7bsUGA/DeJ
         gML4JkT0uKI1NLSs50v8iJXCsPistl+dysdLXOwwSKpdf1X7nOpOrD75pLPBoTq0B283
         EAiGWGbIH9AFOAlHcp80tATHBf7qiCz3BLrF6JQi/SAMo9suv8BCaLHCK5maGnMScaf6
         2HhfHehnyXSFEE0fSm4AHFLry0TzHfuSogqBdl1u+gNn0CSBw+ZhqXGj9jsrxJjwrM7Q
         jZk0NHb4YwYo56ji0EYjyT0l5o91ORLGFREDWKVt1S+7vNa3TJ5WGcaR41RBAAiiOVos
         A9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330464; x=1783935264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0UQSMtZb2dkaGCmhPnl+4tNtTS3hjmr7JepIp4F7f+8=;
        b=Bej4drt5xS6W+EIJNEmkoBEQkoRXitJYg1WQUctpeU5F4mAR9Z4x00mTTbbNrNOoRz
         EMYT2PaVVXBoW/IBvbNGXVHcQrCX79CrlJQv5tZ/hDT61T2r98mea/jtGoBRJKzAKuKD
         VmvoktQjUFNNR1QsGSW8cG2NbsVbOFcn1zp4LTRbSk2pwL4LohCF+MdzG8BgeKig1dea
         cF+hR9YSrDPDaQVOuvkbk9xaCYOYzN6DClsXBhUcZx64lODRTHo3D3SJJynP7WE4PM2b
         u68ktFqWm41Z0U8Bh75Fnq49cjA2yWXUdvm7eAB8wBf3Adgl7yy0drontw31dUykAsUX
         wFOQ==
X-Forwarded-Encrypted: i=1; AHgh+RqI9eoV1vpD2OCWySTAYnKK4pRJiA2iMULEOvcw5CtXPoEsHegq6nCtZ12MAuNmqkHkUn12Op12XBzQjjGIgiVV@lists.infradead.org
X-Gm-Message-State: AOJu0YyGeF4OsvVCLYvv5p9mdJuYmKV9YhEAwCPvTDEh4RzkDOHBPEHI
	+hJ9VzyMqcP+qeF5S6Lfql/BGsGHNF/tbzagUN1DxdH3yKRFXxVbVKUS8JUQpJFEZngPoXkyuB8
	f29R8wVklKOiClGypezxQhkbRzOycpj+FwktUbFxPx+kljA5RweKhVpOxdQKYoPX1m9ivMSRZYp
	YZZbkTcMh/iQ==
X-Gm-Gg: AfdE7cnZwkPawLuMtWYpJP3GIWUyGFzGPtMIergqv3BjIKJq2w5tfsTf6MuDG8PsuR5
	FpBxakTEF/TCBRD5KbAT1i0Qw3oGRUWBxRXONisNqCo1Iqibz7+Dbd4knSxu39z3O5JWfCtJQlD
	iqV49tXPPcr48s/kx//B6Q3GXb4yWqz621cf3fYuB4nvRPbYnn0XfnVls4FfMG5zYYayvOd5YNJ
	R+Wics4wYMrTh1L3upsaZT1LNalakJ2+PPwQVxW3ki6vu77MXeY0O38jC09G4mMKSR8SeR8V0Sg
	BYEGJWW5KHmRyiKH/LMIbK3mM+sGskC8cSfoxs2ZzuqE+ad7evU8AdFM47pRg2FaY9jCchhz4uZ
	4ZOcVIrybvBe8zn551AUIaHphCeQ=
X-Received: by 2002:a05:620a:4486:b0:928:f440:2dc7 with SMTP id af79cd13be357-92e9a48f671mr1300828185a.35.1783330464479;
        Mon, 06 Jul 2026 02:34:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4486:b0:928:f440:2dc7 with SMTP id af79cd13be357-92e9a48f671mr1300826185a.35.1783330463974;
        Mon, 06 Jul 2026 02:34:23 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d910sm22610871f8f.6.2026.07.06.02.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: rockchip: Correct indentation
Date: Mon,  6 Jul 2026 11:34:20 +0200
Message-ID: <20260706093419.273625-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1729; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=L7FpJNgmmdFvafbWuh2M8eJdyOikGO0LNl+eQQNyUTo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS3abFxhXoFWPo9u+R/DFwgtbt8gzn29qroFS5
 g3aXI7FUnqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakt2mwAKCRDBN2bmhouD
 1xbbD/4ruIoImEerlkWKIhHVfjMOELsSaJEHfnm36aStXPBUhDxfQL8mCJu3e+r6qOIjb7Kfd2h
 rvLPWOnk4J9KTk87a+M55w9zFf7B0LNBAp6V2lkybe8QoWSVCvpHncG1Z2TTbr+secv5C7sPSSF
 rSwAw2Z3jy0JCrfq6z3KCiLi1XZOC+Xdxph/q/HcD2YQG6sleZbaSbn+job7IcPRsp6metGvBg2
 2AzTmcBYiNYBZtvzdvHbPZsHGgKWcVoqrJr/gth5A2NytofWCeG9bEcYoj5M7CKAh50M4dergGL
 JJksrlEtqZZISzfOv/vbNJy4uzGaXf9JXd13Ul/AwI7DUQX99ekv5CZSIFrRcAjf173/gQ1URqI
 14RsuTlqD0WB0Dm7I3ECv4fyA/Z7wzGrTx87qpfFZpkUydyN9dKwwywJVG/zcj1ZdDqLjaFYDO1
 /U2OXzAhH/yxIXpQNwV/oAq0DxPJ3BkRk1ZcdXpd2VOvO4uA92WxFIh9UlrQkt1LQt0sLzEgnvm
 1/7Pwi3sav1AE6DGXK0pz1gJQNrDCpQfoxilTvkeLTuN5pvhbSqOT9cXl2NkiPXimNyeC/uT2u0
 GO9eunj1E/5gBc26eb7AhBwizjtqaXUS4rvZRHrXdbxMMXEQVyNpBMvGgmaYq3dTZopvMI9oVv9 AU6dSVW39of+BOw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ncjHBoHu1uhwqWg8CYl6hkma84YYlVFn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX8oPZPpUkPUsx
 HxNsSQlR6pzehlKT7DE3QeHKxZI0nddf7QE/25dqKb9HtumxZz5YEEXgZ7iKDlXFSTjnZMXrScj
 xxjX3j4fR2tJjs7GkJfuOcwzojhdIoU=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4b76a1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=LhIDl_lpc6LIOOucnsUA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX2o8VjP+r7A4Z
 3YCZRwWQ7Y9RsJiAU1eOnb2lUDv1UD8XJITrEeX/1RHs7tDLVaxoPafdqDjE2HLbh3jgL52G508
 +ySYcyJGoXkW12ZRh+tH+3Ibr5DVy1WWBfhG3JyztV/1G+9fMFuzs+8P4LCDgXptnFuXxnzTJGr
 gXTj/M0PdzsYcpeMtDqCNz81yGxIbK/5dcVPcZpa1dpTueVFZ2wwgnVXniEmoG0HzQh8GrfU6fw
 UTyMfLNyIb6Pd+GNJIrZrpSfEBOr4OgvTM7um1YszYgTLdyGGmf0Mfj8/YkFTT9gzddNn0VZbXK
 ceyGZaW+LPj4kKIAuShN9x5YHGefANZICulp0Zxs27v99aomSFIsBVPFtHbGSx8OfL4mZNf/K0E
 WKlQmGHxXk4uyndYF5TasPKYgTAKsNPlZ5liXRBgIikPt36K44FXXjur1jI23RCsCxqR6+cmw7h
 3tX5uNeMbMcuFwJ85AA==
X-Proofpoint-ORIG-GUID: ncjHBoHu1uhwqWg8CYl6hkma84YYlVFn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023426_358005_3763C832 
X-CRM114-Status: GOOD (  14.24  )
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

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../dts/rockchip/px30-ringneck-haikou-video-demo.dtso  | 10 +++++-----
 arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi       |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso b/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso
index 760d5139f95d..d0725595ade0 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso
@@ -45,11 +45,11 @@ cam_avdd_2v8: regulator-cam-avdd-2v8 {
 
 	cam_dovdd_1v8: regulator-cam-dovdd-1v8 {
 		compatible = "regulator-fixed";
-	        gpio = <&pca9670 3 GPIO_ACTIVE_LOW>;
-	        regulator-max-microvolt = <1800000>;
-	        regulator-min-microvolt = <1800000>;
-	        regulator-name = "cam-dovdd-1v8";
-	        vin-supply = <&vcc1v8_video>;
+		gpio = <&pca9670 3 GPIO_ACTIVE_LOW>;
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "cam-dovdd-1v8";
+		vin-supply = <&vcc1v8_video>;
 	};
 
 	cam_dvdd_1v2: regulator-cam-dvdd-1v2 {
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
index 7b1086682d11..acf44f8b47ed 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
@@ -382,7 +382,7 @@ &i2c4 {
 };
 
 &i2s2 {
-        status = "okay";
+	status = "okay";
 };
 
 &io_domains {
-- 
2.53.0


