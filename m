Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8272CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/XX86OrjTks5Leb3+o6s3i4q/wmypiYTlR/U8wdD3TE=; b=GR63889U2E1BTG3HzJz5MDcQug
	RKtSQEyQbnBUixcvG7ZzVijZUSOVoVAKjO83Q/klSWqR5bKcWAz+f2dauwPL6rLy/rLxJ286oJOjk
	3GQJ3FIpIskQD7rJU/M2IyT0DSNtWhTDRZ1FzXs0u2Qk7uM6SFdqp2aL1lbW85kjBP50QK0OUASag
	a0sjO3tKPxvFYECX6Di/8mJXjiMSMYbbbr9Sv4gRCSyqpa4Ob2LokORq/fRM8LH4fX1L64Tihb01i
	Cuc0YpzaTMcHLLrsRgs3eUVs1bWOGitOTzm++OclLNpXOBoYOzx91VtxVPItvpwG5EjvelFjnpVLg
	SDFkcOOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gnf-0000000AXqX-39G8;
	Mon, 22 Sep 2025 13:41:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gnd-0000000AXoD-0Z1m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:41:50 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M9BrQk029909
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 13:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/XX86OrjTks5Leb3+o6s3i4q/wmypiYTlR/U8wdD3TE=; b=QsGWt0dE/ChdseDI
	HZp7l9iSEIy852PjlP1haS+wrWWzb3edOqlYm5RjQQV8iKYM8IT2wY0hCUqh/nbE
	VLeJUC5lp8VL/hnXGWz7BaFyYyQA9Fo8BOrdeFGSo+IBGJvYA3TLimX4NYXt6Ujc
	xu4tIo3mrrud6cMxjUPrruolcdrSqOkUDFBWFg3NkZemrkaX6bt9kpdru/NGcU72
	R0Lbfhsjf+13Fdiv4CaZAoNzanCXaSh1tZ8PZYehhf7wUO0ID400WL+6SY/LLA41
	FmVozoctQwwmI7P7pkwYrRBTcrksGaWOazf68DQaITClPOQAU8rUzCh/e9Mo5/Wh
	1TPqag==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kk0rs6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 13:41:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2445805d386so50150795ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 06:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758548506; x=1759153306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XX86OrjTks5Leb3+o6s3i4q/wmypiYTlR/U8wdD3TE=;
        b=DQEUhc39hwaSXFIsAQEGQXTETlSN1DpZyEMblGPZV5OPblkwfPtwNecPBguXA3uD+6
         HvLGHE+8N9N4XspXUL0GndstTKGe0JNHnK4RJrAKmufx05R7y6WKjJ9xcjq4aUn5G6Fa
         oqqkfeRGBundLS6nSvU1NiczhFEZRuQsodYwh3VncBotFfZKDfdr7lDNz3c3tJVxAH/E
         hq3dnq5n7VYkqZP+eN2DY9ABdXa6XE8EIcKmlAIJvViWpN6Z+45OekfvCb9PaANfbYLS
         /nsJjKLf9rRaCp7ZUuqzNHfbH5MhRBVB9vlD3ly6avBD3BL2Ms6U3lGI6jq0bBNZP8v8
         IQ3g==
X-Forwarded-Encrypted: i=1; AJvYcCWCnTeb98QWc0Fdldo0aMOx7UMj095A+7IkVuyCgGO6wYDC5Cp+VsfW+JHrjaaaLX5qUUjTJEXxu6gd1M+1X9MB@lists.infradead.org
X-Gm-Message-State: AOJu0YzAWwdta3jEJCXib/poOxzsJwGvY1voTZNdgq+3upTw3mH97BJd
	snvHWaIFfx3tfs9/4uFGQNNv6Ju6Gh0mCd+fs/yFbichaCxEAjOGSsQM+voEFoZuFgk3Sltmitx
	tIT3e6DiIl/u7AMHfBl0g/2te6OTcO02zaSt9BwDlbT2T3eon2yPdfUdr6hodBpUohzd+5rt4Ha
	4kQg==
X-Gm-Gg: ASbGncu/p5eRsKuOHOl9twKjMHuNhPZ8Yai5VWpIaT6dy9ifiaiYPSNYTIKFl5+lgjF
	anv35rvY0wx7nLuhKUed5hNSB5TXQS1QiNTX6MOZR0mHKvnQxJG0A6x71/46znWXDAqcyUd5lnb
	oIRuEBShLz2qlo6AvALnVHpcsZd5kF9dgN4ojUFBAHpeQIPg/ZSyp45af/Eh5QJhQfQHdpy/QWL
	yeYdB+wj1DxzkPu5KjNrjLWbQ8Z6RoHwf9gBWJdOxrLE/s37VD9Wyl+0iYTWwsp6rA3vMyiubkl
	t/IekWHpuEzLLAvr1/W/TymkLeGJibvRj8itbjxWFiQHdKLfzip6AcDZ46ZC+IBtHKoYg7C+Fir
	h
X-Received: by 2002:a17:902:e34d:b0:24b:1589:5054 with SMTP id d9443c01a7336-269ba459b10mr113332465ad.23.1758548506385;
        Mon, 22 Sep 2025 06:41:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgNNvAsHHiGeaZP5VoAA68roYo+dylnrvlMM5UcciZSIuXaq9nHAxUEjxfhhDGauwJ/C7wsw==
X-Received: by 2002:a17:902:e34d:b0:24b:1589:5054 with SMTP id d9443c01a7336-269ba459b10mr113331885ad.23.1758548505861;
        Mon, 22 Sep 2025 06:41:45 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016c13asm134246755ad.46.2025.09.22.06.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 06:41:45 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 19:10:18 +0530
Subject: [PATCH v15 08/14] arm64: dts: qcom: qcm6490-idp: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-arm-psci-system_reset2-vendor-reboots-v15-8-7ce3a08878f1@oss.qualcomm.com>
References: <20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com>
In-Reply-To: <20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758548419; l=1628;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=SNQVZvT2DjzWoTyJ6c2xvqRrn5RNzP7FXJ+E143gp5o=;
 b=cXxhuEtcDtlLV8MbUWnz95YMzEkXXM9COlMe1WkI4LfKje+lywF9OJa4i2AekHnGx7dhm86zA
 TeShTpKJYqcBxvl8B0sIHfHocfMC4IReLyv/Qv9fiQba51ttSWvHuez
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: faELPWOIZ0cp1eS2gS-weR-d5RZ9azJV
X-Proofpoint-ORIG-GUID: faELPWOIZ0cp1eS2gS-weR-d5RZ9azJV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfXyWkE51QoAeIo
 QhUZtUwvLcX2BVT9Hw+94wXeye5r9O+P0r/7ga9zP/lWbE+DXgyvbmiRDFEzq0yp5uFDMlGaXKf
 tnT+596e88E0mbMgBm7XSNENmduRHD+V1c882OQ+rA7qDNRaHz1vfKdoGzT/jQSEgSoC+jTkfMc
 IkQ+y+4dEJd/SO8CbrSn+YP5Prs0HtKE2FkUFr+K8AJHvnfutJvB2QRvuUFfpeA7MsQlGU1iQEW
 SM0t85IKdkhmilJ7Kh5/aOqPZjuvhGMqPknuv9HOvceX+6L9VOGpcffKDxCsDakr6JiOFOygqHn
 uCNzQnBzwXqhRwLnef+7XyQ0OjabUPOYeGxghggiz/3enSQHNiNV1xA/gEg+RH7GHTLRx+wikmr
 /pfosyR1
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d1521b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=w06kbW2hXDg5FjFnD0gA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_064149_377311_90DA6A88 
X-CRM114-Status: GOOD (  17.34  )
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

From: Elliot Berman <elliot.berman@oss.qualcomm.com>

Add support for SYSTEM_RESET2 vendor-specific resets in
qcm6490-idp as reboot-modes.  Describe the resets: "bootloader"
will cause device to reboot and stop in the bootloader's fastboot
mode. "edl" will cause device to reboot into "emergency download
mode", which permits loading images via the Firehose protocol.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi     | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 73fce639370cd356687f14a3091848b8f422e36c..84322b74917f3a70adce5a4182adfa5d787ab11c 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -695,6 +695,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 4ac909214a8690111b2596d36a8e6e79d0f05131..bed389aec1c944a849fd2212e4e35e2a729fa935 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -858,7 +858,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


