Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83899C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 17:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WlWwBUz8oIiLyO7bjGs1oO3T6bcXCkYkZ3ytXjL7maA=; b=j8HILGMWC7IzeRh8t6RN///q3i
	iEV/7x2gXYe8lpry/ELlBhpHxxx9cwifdhAHCJzcdhR+3EoKD5v2Yzq05mky9f/10NGeoQ4oQVYlS
	7WwKqrmrqodMdLLQbiNyI9Ph+ovuezgBCBzEQ0yFuujULGO1F9RUvQSidYdcFIOtsFZTrVdUhQOob
	JNtp/TD5a0VfCz0UoNfT9v7PlkDmlh5A0Nc4qu0IXB/DqlrnVsg2or1u9suVUj9VHp0aL1uP8u5J0
	qE+/mV9BZ5NN7xi5u+5pnF+oqV1Rxve8oYI4p/Sq4AXdkWjp7NMHUu8O+DSxd2/8SrlrnBBz/iLr3
	c9dFLvMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgmd-0000000CkT1-02yG;
	Tue, 14 Jul 2026 17:19:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgmb-0000000CkSF-40SD
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jul 2026 17:19:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=WlWwBUz8oIiLyO7bjGs1oO3T6bcXCkYkZ3ytXjL7maA=; b=PkOGJ+D57jCI+ptrrDBTVcU+Hk
	skkd8RY/F+SEeV5f1JvMHaEVbfqzlYstEbJOLkzTFowylPxN18DWhfTrkiyUWNRqGuKbXTuwFYbuZ
	N2Qcqt6QeZSFKf21Bxy1Vaz7Xy5qJxuVpgJL5MlG2zD5gKMdal6iqQcXjL9mmAR5sWVDu0qki+RCw
	Pm45AbbcZdMMqhSem9DS2DLfJNs45DS9mkvyq/nQl5VlCSbxm/7cJKEIZoN97c13quoKV+PQpck8F
	e7kF3ThpqD8PFrrqb6tnkFvwn+Nh9vwXszojTgD9k8tGvdQ4qIyqfT0plswvpXXH7U++jH1RIwZG+
	lgYBTH/Q==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjgmX-0000000CiwJ-2ete
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 17:18:59 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6vOe975528
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 17:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WlWwBUz8oIiLyO7bjGs1oO3T6bcXCkYkZ3ytXjL7maA=; b=G0qCDEZ17DRS3o0E
	11ggJ5j39opLgDxXNK/d/wONKxa0fVnp1j9mZQfJ5c51xMnCvqSw+AjQ/xNUsThs
	5KAB7Hc+Lv2RM8XL5wMX1Ojr14IumaPWXwjjM/thnV186H5c+BEnH9Rf6wpe/f9f
	Kgwl7uwHWicwx2y3C1mf+uCPeo7zX7Aig/AfPDNNg21mJCe4OpgOp5jnlQcRKgsA
	1Senm7UsHKP73EwEWGE/ApfeigX/PZY9w0UekDDkNY1tqyApbxNJ3uMlFAqx6/wx
	RQCeM9HFe8/pZuIDQao7b16GfptJPaP2zchdS2djMOIDbzhBlw1EluvDwEd2bJzT
	RvMu9w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgeq2dd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 17:18:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84885a4fcabso1613259b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 10:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049535; x=1784654335; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WlWwBUz8oIiLyO7bjGs1oO3T6bcXCkYkZ3ytXjL7maA=;
        b=kS2y8UdabJ7DLKHMJrJRk5GluIW/iRXrPJ/o9GLp5U/Ar2wFOhcgCPAwGAbcBBpbWI
         5zuBGGHTeZb1cHR4Cjs+/yWF9GHbAxnlfF7LUGm4gdvMTYkJqARWEK3m5W97IJ1yQACe
         yDFevMX8ggetq9FNZWfoKP8t+dbOcnDMznAy2l8VfY+7cvB8YLmJFFrMECGEFAjmxLF0
         jkFRIu6vz/+e/BpybMkqV+9Bdz9p5rbuoMVF/LlmRPje3EpM5m6hjQfXWjt74h7e4Prx
         XqpXmqDZpZHl/HBFackl5xHhxADHy58TY0GrCeUE+nt0SU78HIqeT3kpAayXfpjhkdTG
         yLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049535; x=1784654335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WlWwBUz8oIiLyO7bjGs1oO3T6bcXCkYkZ3ytXjL7maA=;
        b=slRplqAe1IRhL6dxjnI6bdaG3WJsRoQJLx7OzUJqhqNmwRWWj2MvMwjEKnJM9uLxM+
         S5vxoJ0xC+NBmCSGLs65vgsVYwHL5iRQ3RYTBnVpjF9OfdRebqRqOLIdJUemWcBxDvqz
         WDBRHd6Yn5svPvh/LTud6/ZdsbYqqN5ObZlOS0lOZ+eklynrKz/jFZ3jzmIZUPa5X8Ze
         uDjz28deG40iN11vdiS8C8WIb6NUVjo/JpSUxUdl4FR7Q0fjsv8ikrHw0y8zErmlh2R3
         493bMuvvQlBOu3NRpgiBOV9w8ljYKQ/Avv54OGTNerv9TFNhezQzcANIpdpzgc1ni80i
         jVYw==
X-Forwarded-Encrypted: i=1; AHgh+Rplo008NqFTWeV5GzpQ5XxMJfRb9LLC0OTaO0uQBg6hao6cR/XRBHTa1WzQBAilX90DCtmD+4HOJQMQv27DzmXC@lists.infradead.org
X-Gm-Message-State: AOJu0YwJpSjl6LtoNzwx4ZQ0nFmNTMt2B+sPQR77mJi9ccGiUWZBhtM6
	9Mcfs2rnvE5biOJYtkHPxyqwLyhFOcRY5d+q6qw7JFguCjJuZUGRkF7bKSNGtt480r+wFFMOlH5
	xXZyksGBHDBsdSG8Xclzx/JHQZzDASY1rhulP1jXSYzL+U4GZXjxwo9DalrpkT8rLIEc7g+11Sv
	Pnfw==
X-Gm-Gg: AfdE7clpytRoBopvPTfAxWXTTCW9rGDFq2zqIPSeZtgiWJpct2K6W4re1uNan827gVu
	GFzfhqjWM2Y/dEz+ndpJ6AC1Fdov0XPMDi64e2We/XfCTNYzYb1NpB4Hu07i75ws3aFLuMm+Pi3
	wathea8pGRQyom4vaXthLO2S3ri+vlQagShRvY2vBVsG0+3MIt1DxlhO0PDj3PY8NN/zauBPaBK
	f85WczD31wTU0ENdUVpUCDn4afKk+6OG8FrynP3Ot/dJst0wzL7JtpO1Khx7HiGwywCRbEFzlhD
	upX1kZwmUbsoOP6AdB13ye52WwC4+DX1I283THzKgGJ+piAdzC7L2Uo0YRtHVcm+GETFPo0ekOR
	wDa35DYjug0tANZE7t+o++VgEt8smyZaK9l5tnrmjuMCpgt4=
X-Received: by 2002:a05:6a00:1741:b0:845:e1a3:107e with SMTP id d2e1a72fcca58-848896eb340mr13731443b3a.52.1784049535203;
        Tue, 14 Jul 2026 10:18:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:1741:b0:845:e1a3:107e with SMTP id d2e1a72fcca58-848896eb340mr13731384b3a.52.1784049534635;
        Tue, 14 Jul 2026 10:18:54 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:18:54 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:41 +0530
Subject: [PATCH v23 13/13] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-13-e7453c548c21@oss.qualcomm.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
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
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=1558;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=/qLMtF4YYOHcd2N1W678IQPXyBmX86FCA/XfWBXjocw=;
 b=rUE2oOT0yyF7AuITx714xgSvucEBSc9KhTWpFSLaurtFc1XMsG6TrtEbHt/m+uYS94IanfqNZ
 NwgxWKW/LsVC7sB2UWTCKChhYXd85Mq58VSCviNCWEBEwY4SaEZPtkL
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX/kEZLcodokfr
 u/anNfnBqtj9d+336yFduWcvr+/0d3ShGMkHnhSKeH7/MuXiX8lFf4IsJscFmYGtzAozhmRvQHx
 J5FuijhTkCjFKz/48uvxVXMkrFh0ZsdXDnoHzuEqJS1PUPwIETLmRlkesyTagB6fYd0H/5PveW1
 N+ryvEBSy9vohOOlR8nRwwZ3OaDYbfG7Wlla0aAP7/rX+Lw4mJaOcS8pjveV4S+mhY7d0nuLXjS
 YLbd9AlTxESm3dTnHQAgwQkqR743NNs1h2flFXpVin/mKpYlri9J/N4bcfN6OopK7HObvEzLbhw
 QNLN3IgJGRskFolOfbkIhVQIK6ikjV5XMC2nRuQ0LCYQHuLvHHfNpGDNrDzjhorhcSDjadam0Uu
 fJ+R5d3lvennhn2muMWtIlS/k0yIxqS5Ma1i/aEKbZ60yMStuntD0KQCbKUdKOJODVHGl8oU6oj
 VaQ2eG/3NNyuO6D8znQ==
X-Proofpoint-GUID: -rTjKpRSaqgZ8jcZllvJob0PD-bqwbed
X-Proofpoint-ORIG-GUID: -rTjKpRSaqgZ8jcZllvJob0PD-bqwbed
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX6uY2OQ8+bFkG
 snjmJVS+FQNXcP226bJCJ950OFt05O4sjtgEttPXWm8pFfGSSVawJPPO+/8K4PwP9ozXz6nVmxI
 6R/8vjIbJhEY9ejToTzi5YEpYNWePqM=
X-Authority-Analysis: v=2.4 cv=V9VNF+ni c=1 sm=1 tr=0 ts=6a566f80 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=bjH5yOvFM8yfI_BY5k4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_181858_135427_DCB66D04 
X-CRM114-Status: GOOD (  17.48  )
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

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/talos.dtsi      | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 047b4efb04b9..48d3519f50ff 100644
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
 &qspi {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index bdfb70ca9740..6a7ce5a2963a 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -581,7 +581,7 @@ pmu-a76 {
 		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


