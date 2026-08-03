Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88555C5518E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 09:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o/+3/8QxNTkVS2/4tc3nfViSHcapFtRLbeTLF1zxXN4=; b=4G/SC6AxouzO1Yze+GPZr2ZM+k
	F0j2OXgwOf36nfefWfnf60JncqMY3qeP6AeFq9jFMeRnGc31AxYOZzk9BHPnnKuf7I59Ecjrs6i3q
	CLC3R7VlA3SLwwBq1pwW61VY4jQreSJWn/JLBVK9qmjdjw5iWggUg6WqXvEIvpOTfwu5X+vo56pJ+
	RdfrjrQtL+DNkrRFqW4F0/o8vORyjcVTeeIQcESzd4g8+AgTIdrDYtsfwELkRiU4KCt/sHEC+yygE
	lzNtDL9hmFi06aBhcEzNjKT2VcVA9iIvMjmQRRLVhXlT3+GRdrF5MV/qhyupjmitYyAgyB7a7IB4Z
	IwVCnnNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpFy-0000000GkGq-1Aos;
	Mon, 03 Aug 2026 09:46:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpFw-0000000GkFh-02eV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 09:46:49 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736sVXX3790731
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Aug 2026 09:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o/+3/8QxNTkVS2/4tc3nfViSHcapFtRLbeTLF1zxXN4=; b=QrS8cyTeGtmmLJpw
	VZ7FRl0hxHBX+kaoNrTzcTE6OBufJsUH5AVMNCJExi2+0kpen8ylUY+VcIoc+IYU
	hX/uh5ma9MggKifQCrcpyP185ySGaVIGtz0XxmvecLbD0Bh5/LMftrGyYGZuwQH7
	4g0uC+4PsN5AA7+jRVVnxkLxL0gENilXwGaaf/8UqVBTc2pAiYxzfmN5El4LS/Mb
	hsa4A73b/GE6bRunzA75dSlcr0iZSdheaykODVXs0+mrTQHuUaQiM6NSbyb5ut+5
	fDEd+YgXjAaINpxdoVef/ZbfOHO5Y+4PmZU3RLWF08D5ai+FBR0/G5CFaxWSTVbU
	QcW1zA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftp4r0spt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:46:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e667368f0so5904560a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 02:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785750406; x=1786355206; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/+3/8QxNTkVS2/4tc3nfViSHcapFtRLbeTLF1zxXN4=;
        b=iM+1kCwoRkJkSmRuzCs9vwsWGlnGlEMEsJUCC5+aWEnpACu5DoIrOoGILIJfyzmbAM
         cs2Y7rAC8ToxIVTx2hVNYde4Y2DUb14RWBdwSW1xN46s7u+0hLyWpGVzBwKrUgpaWX27
         ZWmG1sKRitaUgSZ+j/LvZ4tkwjxSO93xSF4PjX7CifJzyeVdPvR/uzdeDCOdLCotB6bO
         XfCC/SGYmEtP8kBOGtb5n/MUs/m8FqhyR0KAcKXCcbaq6GXLRnE8L/WM/cNDiENfWv1N
         ZjOgmcpcKGZrGqUKLuNRVuUgonlFc/EMIKxo1yq2QD1RhNQ64sizvho/PgloN/qkm6rP
         2qCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750406; x=1786355206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o/+3/8QxNTkVS2/4tc3nfViSHcapFtRLbeTLF1zxXN4=;
        b=rHQKXeLqR9OPaCZK6vRu0dl9EUru6yH/T3QtUfG7X3FXvGNorw37/CvfgM0e06/AmE
         Sb7X2yiAZWwWw0ma1Fh96vTpQexRto718gVbqqzyc1TqULq3gohWgOl830wCAQN7sqz1
         QeIeIwq7uKx5jm5R84bkFvLR1ty2ckhCloE1BndG4GW1MipsNtO59Lb/Kg5RickAw68T
         5gzsKbCBc66e9fPolozPNBJ4/Kf8Fd0mkKINPYDH/fvFGeCxWNvq4hPLDCpNrPdI6CDS
         6IFuCa2ePmu1gGGb/wMLCF1OHenCl8WvMRK0areLqCwgftP4wnHGYd5o4zoEdSVXZT2B
         hfvA==
X-Forwarded-Encrypted: i=1; AHgh+RpSrfKETwVjv7zz+digYDPZzjzH+r3XEKaLbAlV0s+Nw55tdteq+8kSlSJMSN2DfA0EAYyrnp+mXw0VU8EmUZT0@lists.infradead.org
X-Gm-Message-State: AOJu0Yylr7DDEtU/ZEMCFG16WpcAjElhKraJbUt+FG/4aAa2T7KESkwq
	LWOw1qddhWhBQLBBG/apTFT5VJfbQx1eCuCy+kjrTInYiU5XzD7fMFK38BgXTvsQyri18DbjGyU
	40W39BVCCbXoP/ARlRpLc3vCQ72MQWsfax8FGgWdsz4gGzSEohRXIYsEYOk9YufisX+YLbXfApX
	X46Q==
X-Gm-Gg: AR+sD11Ph2ftxiM1R985O7t+wGpjm1/N6KLb4bS+pM86kQ36aJEoSkk7+Vc0LZZ1Dd7
	gO/i8RY2KQOAioe7QURBL/FF3NhbZrhCY5isgqgks2LM45Nl6czfGnARwT/gtTuXAkFJ5hrRoMl
	rMW5sqaoim+djbRmEkIZpTOlmHVlRmoBqz79X6WheSGSSjW6ktdMOjznnaf9tZDW4OxsvCuoXfK
	NsgnVY30M31Gza4qT6VgaLL0MSjHMrD5zoD/Pw+/3AQZKAtBbmgznnVQ9K7M87JKFpIk34CHAW0
	41JtPjpP0eg2lTZN9tYzWcTMJMzLRAeQrpJhlxq0ASVSCCWIEr7+vgn5pMDJlynUaIfG0H5HiRy
	/U9vkSuy/okpgiFKzVUekA6UUvwq7/61h25Me
X-Received: by 2002:a17:90b:2750:b0:38e:2c8f:a01a with SMTP id 98e67ed59e1d1-38fbc42c3a1mr7728823a91.11.1785750405843;
        Mon, 03 Aug 2026 02:46:45 -0700 (PDT)
X-Received: by 2002:a17:90b:2750:b0:38e:2c8f:a01a with SMTP id 98e67ed59e1d1-38fbc42c3a1mr7728767a91.11.1785750405386;
        Mon, 03 Aug 2026 02:46:45 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2be6c8csm3660671a91.13.2026.08.03.02.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:46:45 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 15:13:43 +0530
Subject: [PATCH v24 12/12] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm-psci-system_reset2-vendor-reboots-v24-12-889281373870@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785750274; l=1558;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=OJwAm/Vozmf+aVTmHqCY4oum1OVPcZBckomX6WcElq8=;
 b=JT9H0YmF5yLeWr/AEcg8+MJ7UyCAiqsbYnspRpD92XUQxxYXUDNXtMj4+2agXuu437sW8T4nT
 RMamNuCOjdDAy6VL5p10AWng8umeH3A/HICOVzaWNLeNSbuCV0twLTi
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=X9Ri7mTe c=1 sm=1 tr=0 ts=6a706387 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=bjH5yOvFM8yfI_BY5k4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: vYMm_RZpi-bXsg0-4CqOBfAtFnNe-iGd
X-Proofpoint-GUID: vYMm_RZpi-bXsg0-4CqOBfAtFnNe-iGd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4NyBTYWx0ZWRfX+KCs14x7E5J3
 H7ZhiB3Izqm2fFVscTdmlgWe/WSaFaENPteWZ9cnsnKwjBD3gX3KI/EBytR91VDfSy85KavazKk
 JOu4fDYUuoxXezpxF5TTuSL31MqWruo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4NyBTYWx0ZWRfX4uW6sUStFD/o
 6RZrf4o7M2HiME56TRnwYg6Ob7uoS4IL2mjIE3K2eBVDM1AhtRslzz5bNnmmGg1+awkhu7E6h9v
 ofQl0arqOzXLoc1EVnzwWDkxwJkGNvKtEeL/RogjGrxBECCbD8iFiVjRu0kpaao7xluedGatuqU
 xKLS5Dm+mGn0xdo0dYW98/3hjKirr9mfpkNsV2WtRvgGZRU/Leqj2k0hOaWJClJgNwK66IKzLDv
 I8l8ssEiNykSpuNyuvlLrE535mI64oKo4j/8pWdZg25opKKNggNq8qTFu/Yf5CV5XJTQxRLRmf6
 sRcpl9Yii8oJ+WOFEnfzb2m391dotLlM5AmArE3hnn6JNmrdqBNZtjm137yACRNkN8L+Cqdq+75
 5pSU+86HQOJf0HBpUGHEecYPwvDnaNJcvGg71BJNwzUQMdEIq9vtIgVfITfQjR/+xf8T8E4oBrZ
 muZakC54eundV3Hzlbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_024648_173516_0DA115AD 
X-CRM114-Status: GOOD (  17.80  )
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
index 07ba5733ca92..113f10775991 100644
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


