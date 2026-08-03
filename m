Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEFBC5518F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 09:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CcMzfR8AuBhxlCwjCxGKeA1DUODDCoEWqiB6TsALmRc=; b=FXGzeTPhAYfY2430+IvHoJSn5X
	bV1rdV2RBc3TKC6YScu6TpZAYjITfvf5vUnlU2Xqm+6Ao1oqWo13MDBNkbtneAP9MSrwGxm1ECgff
	o2hduURqYBP4pWvq5//WNNTEvdQuNwctRMOc89uwCzcC7CjwbUvhULMX+W/OvXO/OFzdg0+4+ezc8
	KQYHOxO1xRU4ylTxH69xH6UX6cv2r89ui5iUBWPbmLnTRMeX5szY1at9jqMC5oLFydGNjx7Sbr0nV
	gHlvO9uvTvJwJ42kqrC8f1yOPNHHFzzgaBYetwQLLzeAZtFAt18zKMmvypgcaTLCwu5OmSn/BEEBk
	xm+Vc3HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpFT-0000000Gjzh-39gT;
	Mon, 03 Aug 2026 09:46:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpFR-0000000GjyJ-1i6r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 09:46:19 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736bKl33957095
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Aug 2026 09:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CcMzfR8AuBhxlCwjCxGKeA1DUODDCoEWqiB6TsALmRc=; b=FuBW1BhEuWRozKGx
	JeO8DS8E2PuCuK6pGbqY/68JvA05vuF/Gh92L4CYelvStm7lUseeFK/3u6XMwXt8
	fy1zqlSQIeB8toqYATO3T6IIgLuhIopR9eHiobuBCdbmUaea+A/m+yEGsI0Ncr+6
	FLyVj/dHyhfWC0yNNfXlSfn3wr+JzQjMXPvv1U/SW2Rl5C9Tg5m4NuYbYRELjQCy
	61MfCBQqS2OAgUDPbymd6oc+Vs7MnnxxGXiEc2P1WrZOJFn7v07K+n418w5lF7Rg
	lSiIQJht3F7Hur6PZYKk2ZAXWPlpJZfOYS35zFcy2d0CMoVfrk2YLU5Har/rbPcI
	LCVeIA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnvngudb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:46:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7621655eso5930780a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 02:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785750375; x=1786355175; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CcMzfR8AuBhxlCwjCxGKeA1DUODDCoEWqiB6TsALmRc=;
        b=b5aM7IWLMCy9udos3gPEz7gpOWoI+CM/A05XMHkieAuYWi0bhumNqE+xLTruDmdZTQ
         Gw7uWj5dMrj1y4BRc6VaAGc7U3rkrIQT/I2LxYv8BsET2jxgTMHuHvbxxF6XcVszS5um
         MXDBxbkCFUsMY6C2NN3Vo2HpL0kbWQYS7O3ocieDzkJWwxT5nAs2xBQfSwprwPgJGd6y
         YhfvPmcU6bHyII6Kt53HrO/uCRm2WqHFFMSsPk3frHlOUidk8CvaZWQpls05JXHzk25F
         YQrf9e6KdAXuvh/xHKSB1ztUVlA23wGZ+3IzIzSRm0r+waIxjpMTen6JdZP9zgEHuE+H
         schA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750375; x=1786355175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CcMzfR8AuBhxlCwjCxGKeA1DUODDCoEWqiB6TsALmRc=;
        b=iOtrK5+KXqmfwdFj5u2PSjfI1DHBhyTbN7Wqkkag8t4E0fiEFE9DrqJftXS6aVOhia
         eQ9YkTLDOknlaLo+rOI3D15uLsuCfrCaZ+Rd5ZB4xUVGTWYPBOBX0HFIBMtcyePdjF6w
         XTvIE1mKx3bsp9tkDcTRy0QxxxIyD8wvskuqLW/kUtfg4gDloJL9crQYXvsbX3ZbtbVC
         98pEjQQ632yyu18HBh0UeEZj/s2FRantKw+SbqvCjYHftgZUNqODJ8f2YNDoJECWv3Ea
         /2xt5EZrzD1J7rORq9wxEA9+QaqQ2jPfVkrG81C9ap6Ny8DPCIzR9OP9ZFZpyElqXaBW
         jyXQ==
X-Forwarded-Encrypted: i=1; AHgh+RqCo8gHl3lfX6KcbB2KtS0VEmqdVPrwrTqfACyMZ/dIBttfpvQi578CNJvDHkEHzHOZS0+1T7jPjvau4ZQn2AvW@lists.infradead.org
X-Gm-Message-State: AOJu0YxnNLSpsy8w8EHwXt+JSrWA0EBNhzv1imOztjwFJvhH9GCzSqRd
	GfVUszphMe0ewnEBQX9IhAYO7Oo0Fh3Qmgtf906tJDfbcwGdGhOCb3j4l1XCn2jrZzah8YZJnbd
	2vs3N4cG8dW7A1bHhCboXpVk7ACilT65BWDnm0FhTSlpN4JwGJgyVvplFZT0G8Yw0b6qBbjj+sx
	CdDg==
X-Gm-Gg: AR+sD11YH8dmUXQJvFP3VJAxviqH8l6FphXpcdaZ9CqR0pqAiTYo5QPXTB7ma35BwZH
	dJXbN8DufsaZeF/HfEqURdu9yxTr3O8Yrev+iAwCfEb5B7E7Cosq8itmjn2lluR8nRv5nR0Uufj
	h/BzkSkBvDntTODjb9q6Paf1Y4KA7i3pbV9zNFharIgn4SLqdUhd+cTTvJYzR9po8j9UzkZ8oYB
	bNTC5jdoixJOctDVbxQIPN8Eit3WbUtuVDF13lEdLGWsy38ImwqBwecJPWzV46xiRVlH2O7hDcN
	OSSgSP2HQ0Hm4XhAT6nRD1QqhkOqTfjWJqS+n1VByfzmO1Hwy8ytQ/zFVsikqJ4b9kQMaa4mmB/
	/Bcmfo85Q9bel9yHacljIK+1ejb0bWBPl/N89
X-Received: by 2002:a17:90b:4c44:b0:38e:baf:6087 with SMTP id 98e67ed59e1d1-38fbc55b78dmr7942281a91.35.1785750375169;
        Mon, 03 Aug 2026 02:46:15 -0700 (PDT)
X-Received: by 2002:a17:90b:4c44:b0:38e:baf:6087 with SMTP id 98e67ed59e1d1-38fbc55b78dmr7942240a91.35.1785750374705;
        Mon, 03 Aug 2026 02:46:14 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2be6c8csm3660671a91.13.2026.08.03.02.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:46:14 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 15:13:40 +0530
Subject: [PATCH v24 09/12] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm-psci-system_reset2-vendor-reboots-v24-9-889281373870@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785750274; l=2145;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=7gXNlR1o8pvBTeUND9fIjf5bCHj2X+kzGUngmo2YPFo=;
 b=QnPk8zoYCiSKzuRa5gqJtn5pFY6pPshnwaLvDzq0DRAMNJnv3wwALCsoc5TnH3xAy/STPH0bO
 /pMa2XbKfqICzDVEPwpxaz5Qk0kjLWwfbu6UWG6z1VoZ7+bCFOEYbhC
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=aoaCzyZV c=1 sm=1 tr=0 ts=6a706368 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: vH-l3NX3WHwEQaYpIhF8Gh0euQ3MowFC
X-Proofpoint-ORIG-GUID: vH-l3NX3WHwEQaYpIhF8Gh0euQ3MowFC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfX1tMSxWZaGuL8
 96tL1L2/LyNgOP/KVsimO/Mhxd6HRGUX7FvkrhUhq0FSh7kLb70EiiTouAyyBkDoKkafmYXsMoV
 NhR6SGLTZwLw8W3hJbnwF7xRLn9CkAhhOO8c9GmYapZ5Wt9nMPJjG85AbF49tMKdpU8zb8jUCAs
 uRP766wjhPlzsWenrKORrR082X0zxBXN/MC/KFWTuObarBjDV4+vtqLwOFnORJGOFcNEd9YSYoY
 osqb4w6IHFBIl5bAp/FKSlf4k7l1hOY6QFDxKYOkwN/rPd/i87k1EbSZ/qiEIoVE3VeduW0CQ57
 yP3YaD3xHxFbp5w9qI7ovlZcjPjGgsKmJIOyf+JVNn5JsvdoO5yrG7TX2izpFEBYsH2kJYX16ot
 Tp/J799y/QljKLbbj1zztr4i+8vwclZxHQi8nVxmoivakNDwovlDEOt1tBpArSExAuQStmOvEzy
 n7z4GL60mFBLOa/TmrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfXy+gJjAmU1Fx/
 XeJvpw+ftbxxhrwXoRLXz9CHpi3sTImM20f41BmoEKrWsWkOCgf6bReq9GYUSy9sxKQBBtH7IU1
 GOBXmxMFDhTOq94Sj7Ukf0DvO57q2lY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_024617_579705_77A0585E 
X-CRM114-Status: GOOD (  18.01  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
for use by the psci-reboot-mode driver.
The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent and not available across
all kodiak based boards.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi         | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 7 +++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index f74fa66f1a67..6e3837c2490c 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -866,7 +866,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index bdc02260f902..b7a0b5347639 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -786,6 +786,13 @@ &qup_uart7_tx {
 	bias-disable;
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 90f2eebc349f..4ba5246fe3f1 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1105,6 +1105,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power

-- 
2.34.1


