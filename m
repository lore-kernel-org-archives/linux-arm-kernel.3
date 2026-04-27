Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883D6FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 17:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c6VbKKP68YJjXlE++Nlt7wjf5OWIFB06XgENwyM8iY4=; b=mPHLouEfRL5RyEmmih/27acp21
	S0hRGe2/EHPNQtd3SIOPkInob6Vtmupjgi5vRaPYLu0CkY1KBovnmLcccPDNKmv62Lkrp6Osoz77u
	LNiGHkSXWudirQjrhMCYP9Q1IVaCIvi6Oq7j+5uSy14VZxFNWLthzwz+OpNbKclr51BCYoW5vUnpS
	fxNyp+7rKr+01PgiNrk/S7+qaJNL8lBL813IrXzRR76dQnUX+BGNBdGA9N79tr2twS6kvI26mYD8h
	5hSMNfzbKBdHhOee2xQIAfuKzN15aWm+2YYmptQWdu14gbwfQR/EQMT9DZKg/Z9dhM9M3kGT0KiMa
	KtonXHfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPti-0000000HUgC-4BGf;
	Mon, 27 Apr 2026 17:37:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPtg-0000000HUeQ-1Bdi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 17:37:29 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDteQ7241134
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 17:37:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c6VbKKP68YJjXlE++Nlt7wjf5OWIFB06XgENwyM8iY4=; b=Ee90QlmKOKIevaNT
	g+6xaGj08ZxfGRvhKrefY4D6mEzNX/znFaG1hWabxVvm2leF9p+oVRJj8LZqFLuI
	tuJJePzDM/RfK7SCkQ13a+525RbJ8H5n9J2yklgp4PKjCoN9D+5wOPpisVGHb9ia
	tTrz4pR9pCWZDlVWgwU/2jn86oZsk5pFjzRHoX7QRZXJ3VR1ZzfoQ/E6/gCcW3ZC
	wDtZxRjc12e3y2RoN28lwPyIfqZwmdSpP99uGABBmJeJ603yeSsE+sMa7+NZbL63
	38fc2FtWwEWIXHLMKZ7JdZaANbFyinyiQ7SUGY58Tdh3rH5ajLkCvGwZF18rBBIc
	tjrMKg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt946rush-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 17:37:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b249541063so93779845ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777311445; x=1777916245; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6VbKKP68YJjXlE++Nlt7wjf5OWIFB06XgENwyM8iY4=;
        b=Sjt+0t/4r8xJrWm7oQstx7lNc9eLt+RGkrzhg8sq9dWadZAa2Jq8MxEMpMnQkDVZ9k
         OCHS8ea6gp+RYWBUKBP4xZ9lyH5hZahmbgwcc6cvKvJ/KmJKGhtoVnqMwLFTuU3gfS1E
         ub27zqLfFSOqwojLfUjgc1K4sM/gWFduev7zj8rWHCyRotjpwPORdTAWyg9M60YAiw5W
         PfN5kD1dWuaz5uyl4KxnHPBNKGxdYSmnY2L7Dbpg/iZVga8W/lkhDeryNvNpe9LE5jk2
         RMLYHm3H0S2SJ6egZby9lR/slDNCictwrvBgCOYf8ihYc5/PCz4uYp1UBUC4ON9LmySJ
         I8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311445; x=1777916245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c6VbKKP68YJjXlE++Nlt7wjf5OWIFB06XgENwyM8iY4=;
        b=SMTP3rvHoPAw9JG5/Kzi2vpIr7jyFfhOSlReZywrVNZsm/Avg3OXdHMgo6NA8hKwDN
         G+1X3PebYk6+9Gbp9l6TuCP4rX0eYIccQEx7eaeJbuuEi2gU0T8IgkemQpqkjGwn509H
         XsRMpjlna9Nbg8NfPmoXEVsazz/5mvaKejYegKBl6aCIZ0O2YqGuPS9ymE0DPZ5Bmsdz
         7qQZY9AtJtcfYoVZ7TZV/+kGw9FgjuBcNEk5bL5ievs0AIFAlHHWKJie54IJZrXOQrNV
         XmtSM5PDkne6I1JaNSMjkAcTyOZHCfUdKaHRuZFkEotJd769U97DhZ7LqVc/6QZBPGJs
         OUvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/BuYw3l6edouiWn7c1VqhWxbYxOPhSR31UTfMPFOHqbmLis5/X4Fw2Evjc5aCOarY6K9sm0+1anD1YrOrKb6fo@lists.infradead.org
X-Gm-Message-State: AOJu0YyAmcKGPn6jyiYQykgyjc69kR8hKYAxnuwI3pq88fgbKjj0khZ9
	M4iUI0NdmSPj4kYzAJnhg1DWmlquWQjI9XNnpPUqVtUjLRUOJgrRHcymZceP3rFkuDG9XSdEM9+
	Rr8WcEnvEjYftVVZMh4pZappTK6yWHh+O5a2hN4Tfe8OqqmQGObK3oIPpxgZHMDayT3ZWBBWaEh
	+sVA==
X-Gm-Gg: AeBDietBskFgLqvHi7mNNB52/GV9cWeFNEzVZ7o1HEwpS0KSMedFm9EsGUfiXiipYkP
	ao5R9LiZZF2QQRkB01icPrRUOkZyuYnHRC75JCVba+NL1BalZanj364h3qBuuBWSK1ALKgFBboD
	/YoPUrU4oaTWZGpGiblYquQr4pV257yex3O/nZ5o53DN6afiTNcQSznxjlXY8tM5nN5lFJm/loM
	57AjNNn0nI0SHXjqsovL7ekpQ5IgnnwWVP6F/k6t80KzzjW67RP1PgBS3/Iog1rHqHDkr8KHRk9
	Q67VXWWCnMJ0rFpOckQdtzEMOmXa79TeS0CSw+xjAuCCAWf0T9D5HKdVWk/lFfplWp/4YX3VSzE
	z65zEX+WrJUckUh7JLZKusn16QKDzBH+LQaKePG6cQ6P6tKKuNCA86PasD12OWj6la8/d
X-Received: by 2002:a17:903:2f50:b0:2b2:5491:e32f with SMTP id d9443c01a7336-2b97a8b5beamr2078025ad.16.1777311444539;
        Mon, 27 Apr 2026 10:37:24 -0700 (PDT)
X-Received: by 2002:a17:903:2f50:b0:2b2:5491:e32f with SMTP id d9443c01a7336-2b97a8b5beamr2077465ad.16.1777311444013;
        Mon, 27 Apr 2026 10:37:24 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8369sm329115ad.75.2026.04.27.10.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:37:23 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:04:53 +0530
Subject: [PATCH v21 13/13] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-13-dcf937775e73@oss.qualcomm.com>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311301; l=1603;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=3BzhTvgErlfjD/MREd+a1QNRoNkGhIpRGYMAT4WSFWQ=;
 b=rvn05Gu5bqUE6iUv9sodoL3hQhfRwlgTa3Cm4zjZRZac81OqgAH14XDEWkx+l9/fHu5A2bjHx
 nw7c+wgzdRID5zsDH3CkO5wFDgB8jbP8ZS1xVZ/Zpc3wmTkAnb+9Z5r
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=YcWNIQRf c=1 sm=1 tr=0 ts=69ef9ed7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=NtfjKPfcWimlndMDSJoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: TB-1sieXPZ1eQ3RBaJ-hw6lzKIFH-Zbu
X-Proofpoint-ORIG-GUID: TB-1sieXPZ1eQ3RBaJ-hw6lzKIFH-Zbu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4NyBTYWx0ZWRfX9DOkYjeoEM6r
 lRhFlGfw5cUqmY0YYaJNiveZMQCs0Ybt7HOXdcfI+gw415mIp4vvW2Q7ydh5drfc4T0PRwmllZG
 DXkPjvCxY7zCJp5NNfRwAWVLBOeF6edDsZZ7hhRwFk3nzu+taHUUqZamJ1ucdPYhY1PNRgFKBmQ
 aYqxPqo8h0nPNKeWnvwKS1dVnwUPlVUlaSOmuBu1ORkzv46JhV0R6t9AblCCcEJX1GkO7raUSSc
 hcftFfNRjUleehZOVyLCz9CGMhglg2ig8zRW4PXIiZzpX7s0YlgeL2TRnB/SReXufFvtGhWfaPm
 RxKF+v+zPupLBbF4V/Rtkcox7t0fYC9hts4DpZ/EDm/2YOzvFhr7pQcI4Uj3PVskH0jR0JbxPTO
 Qxtm1m8/h6xkX0SSVM1midzPJ173yhTzBFu4JXEsG1pI8QOnizxEs7BI3mmc1EANOhMq6i/l8XP
 MhRFG2J8+Pa4h2Uci0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_103728_449594_9F5CA8C8 
X-CRM114-Status: GOOD (  16.48  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for qcs615-ride, for use by the
psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via the
  Firehose protocol.

Support for these modes is firmware dependent.

Signed-off-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/talos.dtsi      | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 7e05f873194a0b61e80281104104079b4e0f51a8..8e0c5235f6741b80f975326e2b4268af068c0ae2 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -498,6 +498,13 @@ &pon_resin {
 	status = "okay";
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
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index ff5afbfce2a4744777829a1938754f02a5f6cb5c..83ba8d3bc40731f54d71b6892045bc1dd15d320d 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -560,7 +560,7 @@ pmu-a76 {
 		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


