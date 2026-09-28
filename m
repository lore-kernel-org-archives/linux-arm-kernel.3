Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A9DC9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 06:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btXV6KHGAw3+GaDmIGslj+LlIRfZXkr4tQ4AjomFcuM=; b=lCVz1qlIzd2o/1008LnT51zf68
	77sIqdZInfKcTg2bOUWTAnFNLrUqeZ8S7XlyfvXsSnyHVf7/Vyk8pq0Uj9+eUcLp5hVk2K+hZ/qYG
	lqBmJvWixwe6QOFSv3jJ9aM/JsrZ3qr84VwjD+qlhTVCFVduPkioEed2YQ8uVn5QIMBaN5tKFR+n5
	5iECNeNOFH/pFESYbUNOCBIPdAnV7n49MYlHP5Zx+9Ay83oFHsmOdPUahELXx5qLHVDbB+faGRcq2
	ySKDoE3/PuXstUeUPXP5DyoOHPPsPduqai18UjXD+gQgboQHnVYtdd/hmtcasUw/xfQg5dKt6mQoG
	O6x5njeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4a2-0000000HQXJ-1q5J;
	Mon, 28 Sep 2026 06:11:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4Zw-0000000HQUj-3rkD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 06:11:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RNAgTZ3441523
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 06:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	btXV6KHGAw3+GaDmIGslj+LlIRfZXkr4tQ4AjomFcuM=; b=lT6eAn09ZKNl93FF
	IwDLvdXtBQkdHxmSi419qsPKTJyUZUAfCVYakruwKtcv3xSjTGH8pNaLuj9LpgCr
	Xvp0SS9c6YJBSzSfwFHCDQRz/oPKWMmXUvbyUDnUYQNcA/+iSsI2bzHL9OZE2zq5
	nUm6OwK43BhDnkJUyhWz06+iUXWor20dYxEf+myujaQfhrpwCacO5hdGCxSlnHaI
	DTPQ67V2lOlfENuhT9DeZorI9+jKq9rIBpxKTm2Y+dlmPIgRgRIk0i+flndELyaM
	h9LL6nB5Ja42OGVkksvsSMSx11VZBguVxWWANfy+2lJAPffSI9e+enNMkmbDQt7X
	lTC1UA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav491np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 06:11:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a0bcf8b74cso2696371a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 23:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790575868; x=1791180668; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=btXV6KHGAw3+GaDmIGslj+LlIRfZXkr4tQ4AjomFcuM=;
        b=YOtnzCAz7beZHUfCdjbDcMRwN5yRqJr5ysmSDTqMHyK0FLRBscRCOvGtlxWA1rnDPA
         6DJjiaf+G38Wv5d3vIqmE1dOZtR3hRfPJpzP/2lQ9mdUHOF82n5vIQ3RHVC5gEYX7lrs
         kLz6pEaG5CM8XQowCNeo/KC953/NOj5UAYLFgxBgyM5gDmkBqUqe8tVVJ3u3SUC//ZvV
         eqwyZCmQ4NS+TzIyruGoDtB3xDrc1SDspDs0WUxfemXnAv9QhamkGNfNr/8Nyiu4OWzY
         hpjb8/+HXrn6xJ9dzLx4OBIr6J7WxaDjxAw0AzSWOKtrIp2hmOvzhKo2dbvR/wdyqVOK
         Gtyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790575868; x=1791180668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btXV6KHGAw3+GaDmIGslj+LlIRfZXkr4tQ4AjomFcuM=;
        b=PNVZkxJWp9ddBCtbzPyxXcNNa+RAH0KScDvgOwBAdhmS5kndmLq7T/TtQoTKWDQqZ9
         HBvEfvi31WHMZ6ZWZO1E9rQe+QuCsKYAKo/1mXlMwysWmvH4ZsryHMoCYrOy/8rRvjOh
         LhESjtR9gDrwPqtCRVlmZ4PKUASp27iLqCASKNOu20wqnZ0DorycRF6ItYJI9Y3GdwYA
         rNz1IZSLoNd5xeUVFosXEjsXUdgmGJTDuiFNWRG4l2bDqEZAlydmXwUW6ZV37aQH+Eck
         TWLmXWkgvE3pxbJWdVOhPjp36rIzZjYRkSNGjT9I8VUZfDj/dryUIBz052TVtEw+wvoG
         tQ5Q==
X-Forwarded-Encrypted: i=1; AKwUvBz7gZvs/Lws9o3ac7L2NqhZ43+3FyTlIUJGzrqAzY9d7AQxcHENqt1dnzHHxWesNr2B2agF1VuXL03MPVjEDKet@lists.infradead.org
X-Gm-Message-State: AFq9FYKwcYmvwz26WzZcjH82/QVKgMYt4HDLnYhld9izJNbXTRLJDnEj
	8Zxtdc57Di4DV/um5pa7Aem0MZjk+w2ytMrw02BSDVw+ExnbyZpqzjmVeEGmW6ukYiv0rWEZ7u6
	WotDcT9qj5yXFxyCGDEjRyapmal9fFfh1kpbgv19yXVE9Y/mdlvHLY/N9LlbpE+LoG8f/GIfUn9
	iF4g==
X-Gm-Gg: AYBFou2ag2m+OuBNLfuReSDl+INyl5g7lZiMxoMhdXyF9XDdg5tegxayt5bYVvfcJg4
	4fL0OAm7TnDTeYKHc2Ji79vGhuCaSIiDcqascYsQGaGRX+ss3HRyxWRiVRoy3EoWznetn2W8fjT
	bXNUsl0EkrqdYV4YUooQJ5B5FgqqKwDd/ABO7WY65QgxrtPjK+QYZbzGzdLSvZKjvLoq5CCuqwB
	PVyn06WVl/F3lcID3oi15b5/UF9lTZAdpxXsKGDdB2PIypAFKmo3L4xZT4FGOiUVMT0LjRjZYvf
	rfMsuna93JhQOndJ+RwPz+kjP6gl7XsU8pT9Ca8shIELGdDgGwm0kSPxDimxj79vI7VtTTEvaW2
	tj+LxSGzxz2lBloUwkuT5baSG2HThQDJbQ4NI
X-Received: by 2002:a17:90b:5447:b0:3a0:af81:3bb4 with SMTP id 98e67ed59e1d1-3a0af813ec3mr8396945a91.3.1790575867632;
        Sun, 27 Sep 2026 23:11:07 -0700 (PDT)
X-Received: by 2002:a17:90b:5447:b0:3a0:af81:3bb4 with SMTP id 98e67ed59e1d1-3a0af813ec3mr8396900a91.3.1790575867160;
        Sun, 27 Sep 2026 23:11:07 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm20040846a91.1.2026.09.27.23.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:11:06 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:39:21 +0530
Subject: [PATCH v26 09/10] arm64: dts: qcom: Add psci reboot-modes for
 monaco boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-arm-psci-system_reset2-vendor-reboots-v26-9-b24e2348e8e1@oss.qualcomm.com>
References: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
In-Reply-To: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790575761; l=2076;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=HciPNJeroVrXrUOsjAQZrtcE5R9UzHaUh1eqHckGx+o=;
 b=hPf+aIICqH5htfgWp4dOT7kChia+2ZMeqDSjDVyVxFVsQKuug44L112lAdROLl7vrj4p+53OX
 YYt2OCBrbX+BYkXzqST4XOmtjjqMQCT4q7YuDtFj8Sd1NNpXztj7COl
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-GUID: U63NJ8HGArfsvi_A_JUDD1A8AJRf0kKJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyNCBTYWx0ZWRfX1Hj1J8S4GdiQ
 lnuGibwInVqwQKgId0RA1ZzRgvZ8GZQ3qt0H7jnUMVFpERifHswYiLGvwvBKNvQRSTACYK9XZFd
 /qcV7s/WyW7OSdHM0Vgh1vk4xlNeLESpo2FY6pcXX3KOhpwWL+FBn49YbuYK0cQW4Fv4cu4jc30
 T8Ydgjj4fZ5pbF41bqWkereU6++LWd+TW9PCEskgkOdpbq5we8ydPtp/24zM+HzPurjLBsMRjwo
 a0AzUB0BYvhA6aJ8WaU7Lzo1eydo04u3qLsmJUJUgqMwdH9XNkTJ7kBJuNaUquyISqw8qn0TFq5
 VMAnHM/dVb6z92Vy098aIjhMO2LRc2y9xkGZBdxJOJVnNBPJ9acziErhcwYOzhTg24x6AZUV6SE
 dkrgWpphHzvtCqeahtk8V7/MrsXoZAqZ34T0eI8wGrAtcwlm3es8gD6KPwaRbvz62qxGDcWxgYn
 nei1/BKmcsU/oI6ZlYQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyNCBTYWx0ZWRfX+be8hEn1DoWv
 4Iqt2WKuEF6GKBcYytIAGD+/cs7t+3l6Lf8fNkLacdAYPkHHzOHWkkHDVJXS1RBtNKpC0udOco7
 etye6bJeYvO+w4naS9yOaqXt/3D8OQw=
X-Proofpoint-ORIG-GUID: U63NJ8HGArfsvi_A_JUDD1A8AJRf0kKJ
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba04fc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_231108_991907_DBC70D7C 
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

Add PSCI SYSTEM_RESET2 reboot-modes for monaco-evk and
qcs8300-ride for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts   | 7 +++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi      | 2 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..df668dbf2bc6 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -661,6 +661,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c0_data_clk {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 395d32d36844..9f1ab59dee2d 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -654,7 +654,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 1ff39530ea3d..aa95584b000d 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -678,6 +678,13 @@ &mdss_dsi0_out {
 	remote-endpoint = <&dsi2dp_bridge_in>;
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

-- 
2.34.1


