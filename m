Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3CDC55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 21:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=su8TE8rR1EqzUsl1eMZWcW5BezyRgWIbH64DyFNzHps=; b=WiH+XtsZKchgWZk7HinLSAh+DR
	tuXJ8/Nr5haRVcDVIheGGKeYIcRpiXRcOGrJsExfalcj/yMSM47nFT4gL954OcimIfSD6NUmDtVsY
	94FvQ0RFvo64c8fLe70QGip5okVwvF7qblz1ruZ3ESCMwLlR9WKh4ZscVzaCTOTuZ+7HvSfXQbfqX
	w9/sqejS9hr42p5lcj2WYsc8IasgNIDboYLiT6btFHoA0arJ5D4V6Sz18HaG/r6bQ+VpCyXsRuvIB
	XuWjFDRujf96vx2NYS64h3l3NDfpJqoAPmvy2ElbKfTGMSLbz8ycipnmcyED7epR6yr1A8dK6sT0s
	1GLhwT2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGqj-0000000F3zA-3dGo;
	Sat, 01 Aug 2026 21:02:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGqh-0000000F3wf-14lN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 21:02:28 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671J06ME3600705
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Aug 2026 21:02:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=su8TE8rR1Eq
	zUsl1eMZWcW5BezyRgWIbH64DyFNzHps=; b=ot9IDzLj/rKKWmQg3CxAzCshf3x
	OwZBY9vpuNm1rU8CW5Fy+uLSpCVzu/YeaDr1tmVeI+ea1zjgRPG8U8gdCg5RoQd6
	jCE2NeAbvLvoocpj7OImn1uPAUloIySkhX3j8ZpC567lfYl4zthuMK31Sw4Uddc6
	nAOL1iB3Kb/PmNLcHhfDdgByDsCXakTFRn9FL/r3CF/YD1TTvy6lYXYbUWDTcrkN
	1xKcsis1/eThARvq1O3fbKRsHAfIEoejPCrtQfEJOvV4mYEbLwXGlXBBUvdlkTbA
	pOwTkqMs/+B1oyrbOINE2Bb0s9KAMw7T3VWAvzSbVQb5wcgagCAlolKcScQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9jfshx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 21:02:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1c7f135bso37010701cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 14:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618146; x=1786222946; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=su8TE8rR1EqzUsl1eMZWcW5BezyRgWIbH64DyFNzHps=;
        b=EbnkQuMenOieMY2gDOZcxy5Ie1osWSiSFlGIvN9qrLYvoMsGUzcevlIllmMbFP4ZO4
         6wluqCwtubWPClCseSVxBpBOsU//WfT15p2CpOPqQj5OwrBMfMjfQ3LlKCmPaM15J3z3
         sb1UDERzhJ2LxWzz/S7VZZRHN6Sq6I9igP8Co8i5m47g9wYkLYS/80j3YHbMY5s2vYWu
         tGSVhR+8jueRSdY+HYyrPixmrzxX+jiorYislBXOsekRkaGH/utHtbWkDahjunqIjnjO
         yIQhl4ckuVLpHJQ++ckiXt+lt3a5ltuQjkE3nzYgx5KhQqVdnU4XTZIMYtjcL9eFADc+
         Ef1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618146; x=1786222946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=su8TE8rR1EqzUsl1eMZWcW5BezyRgWIbH64DyFNzHps=;
        b=UtR5tUd4XBEUVFOZtY7UnY4zyVfFlFGCdrRLcI6MWxcoiuWwnyws1vrFsGFu6EnN4a
         Rj+5iH6xDamouvwF/rmF2iPVzxUG8XumTiIRzRqobvdZNXJ7v7JilvwOjoD6ou8yQt6E
         X1o5D/9/mfbJedx2FFrtGTTaJFd4C4/DNPpwWlPA/6WE2+Xas8P+RDEEW+IVN07VBkc5
         jQh/uZOxfDwqCyDqfTXXhxcNuvWH4cq39mYvG3O6tn+S/l2P+spdktze5LeNyVLf+wHJ
         SyaXq5KgNnZpAnMvWvDX+6SHIK3dtEnjL7ijQJDBg7m9to8fBOj+q8LZfwUWA5w3RTV3
         EYUg==
X-Forwarded-Encrypted: i=1; AHgh+RoGqqbnfaLYjchIgZC6CxnYqTvhIS5FrhqC+JX/b4ZyFUy4AlbwBTwwC2La+uVtbqth7B1ODoe1dbWWnA/ry0hj@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1c1fm7Z0/v5WtZtRHmzjA3MBK4YCv8eRStPxKg3ODV7sYPnV8
	Qf1LNQvi8Wv1VeZRp0DUJBhHpmrmHnRJU/ioyNhkRSeBeFI0oT1og/Xecif/irFd6SQ5qr+diXp
	hu7UxycBtB3V1LTTZOldmgfq01zVYaJbBpAguw9WSgIquDkNM3a6l8dPGP7kJZSiiiiXNtH/39t
	Ibzg==
X-Gm-Gg: AR+sD100/ovInKCcKoK6ADLgFVCoWV8oSGLQ9MuCi3qsH3tmJfBGEq/I5XFqFodf3Pq
	yVHi258+J0gQIJAnvhKTDcrz5eD6zhIWjrtw2w2voVijEbDxssjGQkMHaFaxN6dAeBGVR3nY8hj
	Z+kVehUamnT+qePOsFPVknDsW3fAbXtTjaJOr51ql0mnEczvjNsqW3OlO6nAJ6bo1PboegCZOzs
	vH86b9Yi8X9iuR2OXbI5t9l0Ayi9AOfrwxpbfItZKwU5Pi6us9HEgVNpNGfcg6zDIsYE9caCT9n
	9xsybL8Rv7XbKC542WaFEtXj+jeQXZq/GLYBrhGi42Luo979Qa1jcI3bTYurd35iaZ0/fYDtyPv
	SNws6c1KVSlze7F5i
X-Received: by 2002:ac8:574a:0:b0:51c:2068:a9f8 with SMTP id d75a77b69052e-52b5666c76amr93604221cf.5.1785618145666;
        Sat, 01 Aug 2026 14:02:25 -0700 (PDT)
X-Received: by 2002:ac8:574a:0:b0:51c:2068:a9f8 with SMTP id d75a77b69052e-52b5666c76amr93603791cf.5.1785618145260;
        Sat, 01 Aug 2026 14:02:25 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm17775127f8f.34.2026.08.01.14.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:02:23 -0700 (PDT)
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
Subject: [PATCH 2/2] arm64: dts: Correct white-space style
Date: Sat,  1 Aug 2026 23:02:12 +0200
Message-ID: <20260801210210.383417-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801210210.383417-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210210.383417-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8207; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=TLPCMq9dJNI0+U6Kp58B21ZcDovBwWfAn0P7dz3zarE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl7TJVVii45zt1o7+UEuPFT7vw5plGR4g1qsg
 mNVMPmhXsKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5e0wAKCRDBN2bmhouD
 1x/3D/9P+gGwrzJZcCZZ8dzqE+qXAUOgFQde1f7R/rjhrhTURq+nnKbc7/K5LkTMM8f4xCplwwj
 1DUuSad21WgOqbqUAReAOIgo+BpzVIT6NQG/7SAAw/oD5BPQrd0MlRoRWIkeUrPHnVgRVRelWAa
 k2U/bpEnIbfQmAoKk2ijnQta7j20LMIQ6uaTg6/jvmWcOWi6NS7yUBDEDPzzHX8WZ0CR8nzdF+w
 vP8hjgkivp5Q70XDe8dd9k3TA+EZbiWZpK//yjrJyho8jFNyxUW/MpuX0oIBmgKvbij5IsR/vU2
 fRk/Dvx5uKti/8BRyzpASfodeJ0Ap+UJ4Ie6Quv9h7y+m8dn/mlTginamjFnOJwIrHSb5Hu1uGU
 DeYa0n2F04YDKWD5En6GFJnmQPwMRTOHYNAvFmhICv4hziVIAQnGyv89rekdqhORowGgFRnps2J
 lvazkBvEXELaO9EgZKa0F9g6tQraVklbDWvhMOeaOVG/zrhSUxqZl//01VwTr68zs0UP5iKrW9w
 eFn4vsyLsBTQ6iS8SQUGVjYZiGWGpFh8ee5Mk4lYFFz2yw1QwEUoLw9/O+/gzc5c5WStkVs86g5
 lSfobZYNcgWB5+KYkN4Mtz9io59FTLzflsPYtfWar6qXzQwXch4sZg6E3PQ9iKVj8TNQxpclYBJ eMfc2a9el6+vyFQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yiNIwq-tr08KD018ua1gNxMXlaj_ZAfs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfXx53VUXqPvyyn
 hToKnDCFfxMOz5pDwwDiaXO3TfoB1sZ5r5NU6moJgdooHUGtbbMayyAlh+jBh1Y04argjgiXyf4
 TAZwCDOPceBamIIewFugez6t6UEVPRJiMCg6L479arpqXXcF5hHcaykETvUgvNEiNKPZykGKqeG
 VnrqbtDM8eqRgo+re/OkYzUg9EC63jgNTp9Jjt5bE8nL2XMTKNAAv7cKUwV3x5pLNsMv3l1VZRK
 wrKJONEKi+maWH9EALg5PNJeIcJZZ+mNfvd2rsZeB/HLKwcxxamWq/Yt6ploAHNtR0vTe0t+yI5
 9T4yZEC71vEbG9fl556OtZceLBXFKZI1HGu2yv8XhxkXcwPpWejkzwd9AJKkUTs0gdUSKyQksmk
 27UOtuD83RCODTp1HVkdL2AEGndYZrypNcvKCU6lAK+1sgcBDIGmE4bC+7NHiBiqOQOdhmQ2ZDj
 knxqQhX8jRCI0tuqtNA==
X-Authority-Analysis: v=2.4 cv=TYSmcxQh c=1 sm=1 tr=0 ts=6a6e5ee2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=AwhILCEgSuoyubdv8HcA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: yiNIwq-tr08KD018ua1gNxMXlaj_ZAfs
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX24JOVEZUj1sR
 rvvRLKHy+P5x0vUET/q0PbTN7D0TAlvXDcRvvtta2i9Edn4wGgjhUNQ1ylNcshibR3a/lfr8idp
 79Z3wmyrjTTmV3aRd/SimE/qhjMy6jg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_140227_301693_C1231BBC 
X-CRM114-Status: GOOD (  15.42  )
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
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts          | 2 +-
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi               | 2 +-
 arch/arm64/boot/dts/apm/apm-storm.dtsi                   | 2 +-
 arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi           | 2 +-
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi                | 2 +-
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts | 2 +-
 arch/arm64/boot/dts/marvell/armada-3720-db.dts           | 2 +-
 arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi          | 4 ++--
 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi      | 2 +-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi                 | 2 +-
 arch/arm64/boot/dts/nvidia/tegra264.dtsi                 | 2 +-
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts               | 4 ++--
 arch/arm64/boot/dts/xilinx/versal-net.dtsi               | 4 ++--
 13 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index a1c5d10f2f54..91df4793dd6e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -546,7 +546,7 @@ &spdifout_b {
 };
 
 &tdmif_a {
-	pinctrl-0 = <&tdm_a_fs_pins>, <&tdm_a_sclk_pins>, <&tdm_a_dout0_pins> ;
+	pinctrl-0 = <&tdm_a_fs_pins>, <&tdm_a_sclk_pins>, <&tdm_a_dout0_pins>;
 	pinctrl-names = "default";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
index e930f2f26f4b..e110792cdc76 100644
--- a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
@@ -293,7 +293,7 @@ socpll: socpll@17000120 {
 				clock-output-names = "socpll";
 			};
 
-			socplldiv2: socplldiv2  {
+			socplldiv2: socplldiv2 {
 				compatible = "fixed-factor-clock";
 				#clock-cells = <0>;
 				clocks = <&socpll 0>;
diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index 4c4938faffb1..d67f5ed985a2 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -174,7 +174,7 @@ socpll: socpll@17000120 {
 				clock-output-names = "socpll";
 			};
 
-			socplldiv2: socplldiv2  {
+			socplldiv2: socplldiv2 {
 				compatible = "fixed-factor-clock";
 				#clock-cells = <0>;
 				clocks = <&socpll 0>;
diff --git a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
index ee12fea5b12c..926bb4ab77af 100644
--- a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
@@ -33,6 +33,6 @@ &hpm2 {
 	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
 };
 
-&hpm3  {
+&hpm3 {
 	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
 };
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 761c59d90ffc..6a066c43d24a 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -644,7 +644,7 @@ mip1: msi-controller@1000131000 {
 			brcm,msi-offset = <8>;
 		};
 
-		isp: isp@1000880000  {
+		isp: isp@1000880000 {
 		     compatible = "brcm,bcm2712-pispbe", "raspberrypi,pispbe";
 		     reg = <0x10 0x00880000 0x0 0x4000>;
 		     interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
index 82cd4115746e..afe4ef182ee7 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
@@ -107,7 +107,7 @@ qspi_boot: partition@0 {
 				reg = <0x0 0x00c00000>;
 			};
 
-			root: partition@c00000  {
+			root: partition@c00000 {
 				label = "root";
 				reg = <0x00c00000 0x03400000>;
 			};
diff --git a/arch/arm64/boot/dts/marvell/armada-3720-db.dts b/arch/arm64/boot/dts/marvell/armada-3720-db.dts
index 06d4a3a93f84..efc32074bb11 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-db.dts
@@ -109,7 +109,7 @@ gpio_exp: pca9555@22 {
 		 */
 	};
 
-	rtc@68  {
+	rtc@68 {
 		/* PT7C4337A from pericom fully compatible with the ds1337 */
 		compatible = "dallas,ds1337";
 		reg = <0x68>;
diff --git a/arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi b/arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi
index 91ba5f7dc9b4..feffb9c299fd 100644
--- a/arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi
+++ b/arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi
@@ -353,7 +353,7 @@ cp0_mmc0_cd_pins: cp0-mmc0-cd-pins {
 			marvell,function = "sdio_cd";
 		};
 
-		cp0_pwrbtn_pins:  cp0-pwrbtn-pins {
+		cp0_pwrbtn_pins: cp0-pwrbtn-pins {
 			marvell,pins = "mpp31";
 			marvell,function = "gpio";
 		};
@@ -378,7 +378,7 @@ cp0_spi1_cs1_pins: cp0-spi1-cs1-pins {
 			marvell,function = "spi1";
 		};
 
-		cp0_uart2_pins: cp0-uart2-pins  {
+		cp0_uart2_pins: cp0-uart2-pins {
 			marvell,pins = "mpp50", "mpp51";
 			marvell,function = "uart2";
 		};
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
index 16cf4414de59..6f4879c49da2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
@@ -1159,7 +1159,7 @@ asrc_out5_ep: endpoint {
 							};
 						};
 
-						asrc_out6_port:	port@c {
+						asrc_out6_port: port@c {
 							reg = <0xc>;
 
 							asrc_out6_ep: endpoint {
diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 820670dd6042..b80f64bb81ea 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -1765,7 +1765,7 @@ asrc_out5_ep: endpoint {
 							};
 						};
 
-						asrc_out6_port:	port@c {
+						asrc_out6_port: port@c {
 							reg = <0xc>;
 
 							asrc_out6_ep: endpoint {
diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index b141e8f884fe..013228a81723 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -2015,7 +2015,7 @@ asrc_out5_ep: endpoint {
 							};
 						};
 
-						asrc_out6_port:	port@c {
+						asrc_out6_port: port@c {
 							reg = <0xc>;
 
 							asrc_out6_ep: endpoint {
diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 14e033f365e3..b5db62a0a550 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -404,11 +404,11 @@ scmi_vddio1: regulator@0 {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <3300000>;
 	};
-	scmi_vddcore: regulator@11  {
+	scmi_vddcore: regulator@11 {
 		reg = <VOLTD_SCMI_STPMIC2_BUCK2>;
 		regulator-name = "vddcore";
 	};
-	scmi_v1v8: regulator@14  {
+	scmi_v1v8: regulator@14 {
 		reg = <VOLTD_SCMI_STPMIC2_BUCK5>;
 		regulator-name = "v1v8";
 	};
diff --git a/arch/arm64/boot/dts/xilinx/versal-net.dtsi b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
index 15f767608e67..21bb917bcba1 100644
--- a/arch/arm64/boot/dts/xilinx/versal-net.dtsi
+++ b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
@@ -1074,7 +1074,7 @@ usb0: usb@f1e00000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 
-			dwc3_0: usb@f1b00000  {
+			dwc3_0: usb@f1b00000 {
 				compatible = "snps,dwc3";
 				status = "disabled";
 				reg = <0 0xf1b00000 0 0x10000>;
@@ -1099,7 +1099,7 @@ usb1: usb@f1e10000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 
-			dwc3_1: usb@f1c00000  {
+			dwc3_1: usb@f1c00000 {
 				compatible = "snps,dwc3";
 				status = "disabled";
 				reg = <0x0 0xf1c00000 0x0 0x10000>;
-- 
2.53.0


