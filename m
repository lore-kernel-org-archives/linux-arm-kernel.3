Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A20C55175
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 09:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkbUYnG5QVUwJjpx/m9+iBpC8gUP3/hJ5OfATJdYexg=; b=aJJzQ4jXgXURtI20xKiq7z2XpY
	u2EWYdOE9/1ti0Sv/+FlbPt3H7k1VrrGBZTI0ZbMUj4qM6SR4zh3UyxDXw6Mfg9F8WuW9V7S1Pqu4
	O8TF25qFnunTpxx6cb1Qaun51SpYTSSzEEH6awfvz4rJSUJjFUb/KYuMEgrhzWZMyyiguoZYs5E/E
	9Et4ROWYjtbULVWfUR6fjRHyk+c+cXaz78RoYOMDTnUyp4TT/ZMIrEcnE57KS+rWrTdmEp4ZiCdac
	M71LBo2znioFZaURMKyj6ojnWT7W6N26CZ/yzRdoC8j6etn85farMNlxAefV7P3YINb7NwhmD1Tvn
	gLt6WOhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpFd-0000000Gk5l-3iG0;
	Mon, 03 Aug 2026 09:46:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpFb-0000000Gk3q-1LiZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 09:46:28 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736T09H4014129
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Aug 2026 09:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RkbUYnG5QVUwJjpx/m9+iBpC8gUP3/hJ5OfATJdYexg=; b=ljwniybB8G58AIXW
	p/ACoAOs2h09mwEO+AJP0ukYht9lNoqDX+L4DsIfDm2tJwQm+WzTUVwYKSPqsczN
	nZmoEPasbwOwXUPFtrR4sgucdpVAT+wYdZEoYHDn6jy5GhAUtCnnRfk6lJerEqTr
	p6hC/waAu05Yll1Vhei58EkbweInvItTDmNCwvqscXMwMyje4E/xkKC2D6bq9DU6
	zsnbAlqBH7sD/LGOkAXW1PYNBkkxiWyuVHoAqEINhw8EQf9+YoVqU/ZWSvkserqF
	kna5soRi9/n03t7be2zbat68tMUskFgE9HigAwfRl10hg4HLYtIPU3HFBAjwVyHX
	TADBAw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrt8v9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:46:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e6d253330so3904236a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 02:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785750385; x=1786355185; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RkbUYnG5QVUwJjpx/m9+iBpC8gUP3/hJ5OfATJdYexg=;
        b=EnyBwdkR3Ml9Za1fGnD23jA0USO9Yk0kAc33X3+hdVuAcIPN1tDofHbfZHMaHblR3m
         D0JG4Q9Ho5QIOBd++gs7MqOtT2PU8dGsKygigQSJBUd7nznn3I9UE3QowQEkuyjATuqI
         L1roE/Tx5cvk16//EKsRSWjGkQDZo2viEnLSCGlipcZJiO0x/DXLdS8SUhh4HNCWGgBp
         h7C98LGzOwQhTysS8BGCtX/eo9D/Di8vlAf086AIN4m8ArWlcqsQesddwCR4JOF7Dtp+
         EH5J1oajocASHAuFGqrEgU+Pnv0ATXPIR0dfIQRPNmWbAKv0/nOAUr3q/3L1btq4sUMp
         UxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750385; x=1786355185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RkbUYnG5QVUwJjpx/m9+iBpC8gUP3/hJ5OfATJdYexg=;
        b=gNqSRjnDkBMEnfXDSRyjy4UJ25MLwmt9v3OE4dL/OIsbVpGqzQBsU7a6lMv7lk4shh
         Wbe2iYt+gUBTiO9LcQFFahHPUi7e4xtg5seRo8vf5BmRdFIR2Bt8pbdBjhPiTU8Jjzd8
         N5pVhET2RL8H2NcAko9sfuLUJjAojnx2Zna+vni9vqDppKWshJf5vcHx9zMzDKOcwwhh
         OI+DAgQD3a2TjvclT+cqZqMgANluu5LUQriobrYgzhtff1KMkqQm4Y1qT8i37o9rNXuM
         27NdFcHOAKSJR0j+TVSN0Fl+/yyiIycv1f0L4PkDeYFqDBxkBgCk1OplQ4GZFxsxQ6jK
         sklA==
X-Forwarded-Encrypted: i=1; AHgh+RoyxOvlOMdJSGWA8hPfGEXTTOCed25MFB5eOr0iI/BrhEpx9XwSeOY78VsYL9VZ618KRXaAqvLksEpMIMBmhWZl@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp1FN8ubmvVT/ns9caaSPH/2jWmAbGWN0YC4jsddMwA5+cvNhG
	Sq6JB/OzEQRYajxRwU5GwnbMPyZwhXKcpIgKykxPE7pFN4CInwi65Qq7FYQN9LIov4NTjRWSWil
	My1mu7yqXrcO1I0Szml8KBv7zidnzXQnoWF5Pl/eCCEDRLjO9gGMMnj4OFQHXog6c9sTg6aBRa3
	czMg==
X-Gm-Gg: AR+sD13dPx9HMY6TGZJuQiPWp0YYq+z7BGm8CoPCqA52pGZgFC7dsCCNpiYQ+XHCR1D
	0JWEDi0Uw0P6yiJ8EnLAxzx5VpfJk2YCDSz8LwcAAZ2eyiBql+fR+PWdwONQsniQhz/aw54FSfQ
	F/r7wYha0HBUxLrkdnMJGlb6ZPItIjtjEihvRLLuVR9q60MvJNdTU4p5AEQMBL10HVEZOjebYWh
	abrFYtTM/rfEXvLE5/KS+REKqFUfzuHH6yvvxP7LsYtMDRTYmcEeGhh7ELG3lfVwLVIstqAxhUA
	UQUbq0YGdWgNOPNhcbUJky6ZKtteF1t2Czwny6KtBhAbiSQy9MtcSb3vtO/4hYE5Ucnc2CUlWUU
	b8lF5V343F9K6EX//GnYOS45eDwhAJdmHRJ4j
X-Received: by 2002:a17:90b:1e46:b0:38e:4f42:d0d6 with SMTP id 98e67ed59e1d1-38fbca8e5e6mr7069176a91.12.1785750385373;
        Mon, 03 Aug 2026 02:46:25 -0700 (PDT)
X-Received: by 2002:a17:90b:1e46:b0:38e:4f42:d0d6 with SMTP id 98e67ed59e1d1-38fbca8e5e6mr7069120a91.12.1785750384847;
        Mon, 03 Aug 2026 02:46:24 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2be6c8csm3660671a91.13.2026.08.03.02.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:46:24 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 15:13:41 +0530
Subject: [PATCH v24 10/12] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm-psci-system_reset2-vendor-reboots-v24-10-889281373870@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785750274; l=2178;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=eX0gyJVSoiIZC4uU3tt6tpOvtTx0GJUfdT5GBO9fTMQ=;
 b=RINqxFXiKRYq0XQfmxM1CrYk2MUvveTibsQb+NSF/OZeeVCPI2iDfg9IvXNAtieahlF3sAyLO
 IGXmJGGc147AIH6szVfuhfSfGdVZqIIEioAPxE+NSIFUkr3ZbV73cx5
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfX7NLZ0WHxKXoo
 2xYTVZhE2KxdwpWVv95DayzAcgZ1ZXpLCqPAwge/r0W6H4d1NE2ibJ1AzodZ1NiekJaq2r67etx
 6MQjGTvmyRlFM+ur/yLB6XLsXaojNkfEMeHkPNt4kuf2Leb6iOkK+8esbuG4z+x7oYv2yzh5tJ+
 9WMONnIfIH7xluhko5Z88LasU3W0puQsJZkL/RhJziS+eHESrNagZDoN9qJKoOQkATN6xEqXQvb
 uwbweQ0Cf/bNbV/eP/wDzfdMahTpShvx99F7SYK/90bEPFcUNFQ+sCViek0zEZNXgMMykJhC4zV
 JejNthmJs6+UeGD0cy39TiP4qQF6t829nSQQxMW+llJAk8VpnFcdKJKkknOzy1b+PAvDk0ed66H
 ZKk1wrY1Is7c10JKhe7xd16QbAw1kM3k2T741wthXskyKLzSOTy1ZwjUUhRmtGCGZj0dKZUMpai
 p0t9P2fyl3+a7yEC/Nw==
X-Proofpoint-GUID: I-7UJt_TdxuhSYk9phsNFTlW5MHxw6c2
X-Proofpoint-ORIG-GUID: I-7UJt_TdxuhSYk9phsNFTlW5MHxw6c2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfX0GfzUu6Q1i9J
 niPR1cy/ORO62gDoiO279oSso9SbwxPLQNylVoQTh9JgU9EIth9yxOBYR68VlqBeOOVW1NSrJ9o
 PD4QqiaqRWTzebJJUpoHJfU1Q85zt/w=
X-Authority-Analysis: v=2.4 cv=Ft81OWrq c=1 sm=1 tr=0 ts=6a706372 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_024627_510848_CB7174ED 
X-CRM114-Status: GOOD (  17.16  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for lemans-evk and
lemans-ride-common(sa8775p-ride, sa8775p-ride-r3, qcs9100-ride,
qcs9100-ride-r3) for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 0c53640c42a6..3baad102270d 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -911,6 +911,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c19_default {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index cefb8ff00806..cc96442403e8 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -800,6 +800,13 @@ &pmm8654au_3_gpios {
 			  "GNSS_BOOT_MODE";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 17bc5bcd9d09..cde157f6d7c0 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -549,7 +549,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


