Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01261C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 15:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8QpsQNU1m4GxJroPAMjexZ1MBknKFRA0AkELRZtXV0=; b=xJlJvf9YyGVMFPjlAVd/gr9BtK
	QTtQBw7enPk2uSdwxwLsZYgOTgeTTmBUOyDKDd/Lke98/nxME0aBgBoIpoMqP+iYwqj+NWGT2ieOH
	V6vJINLWiSQVsDwzunedyBKQTVXLHVMebNtarOotv4Bs4n1YPKXCmXbvEOT9sMq1XixDxMCUjPiT+
	r30ijk9wMxykSrLn9mIbWFq9x3jRgLU0wBGrszqqBaM5dOD0TDOeg6Zm9sDj82SWC1vb67r9I74R/
	yCl6K2oVnWGzbz7iO1vfaQybNQJxnfzxK1tblERqxcvdzMv2F1hdw/HU7LJBVR/mvo2UfIB7tx/0L
	CwvFXHUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68BU-000000044i7-1ulA;
	Mon, 14 Sep 2026 15:01:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68BR-000000044fm-1kep
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 15:01:26 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0h6r135657
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y8QpsQNU1m4GxJroPAMjexZ1MBknKFRA0AkELRZtXV0=; b=BuDVlL0uPLQkdBFS
	gRWCtoIyDiBTwF4lUx+p42vEDb036xj3A8f+89JrezOJcuVBwwLCiJFPvOD0ra/e
	vQ0a+zi0zZczTmdsi8H188hBQTYvGIvsWDmAsJT9bmOOKfD+H3tG3SU3CmEVgt+Q
	oHeS7QDwwsDusUEXQIJLco5XBChlHMyktNnCg8azHxOjURS4/W11rHts2dO7cN6m
	T8LkkocuB5oGBNt6o+bMHI5JJ4C9zcOQLGw7dZyB3fqa3vLrRo7HzDIOHgkj+BF9
	tHaaQH4WefSa+HFvFQmGoyxwRJ0rJGGsG6S94iC3/EU0mKry3dadSV+CWb/+fask
	yO52TA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq95qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:01:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dd667770efso7782885ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 08:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398082; x=1790002882; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8QpsQNU1m4GxJroPAMjexZ1MBknKFRA0AkELRZtXV0=;
        b=G4q+RJ/6DmCTYkBwdNBeKEXyT2zV+vNlenQWGSKxvn6sVQSIxlOXms2kV+2zsU/AbW
         Nzy2g7vjR+G3vCUfDgLHbvrQ9uwCZIdEBRXrC+x/lKRbRQh5bG3N+EIzaaNWrS/vCb/G
         TcHmy5S1MhUiIYQYPgNcw0Yoiqgc04nHNw6nXVSLJUCEXz0znASA1unvQAiVw4yP8LTL
         e8lpdjW+iOFlg5DDfp9zLF01p+NdOL0IJa81YCxPegtS8+MrXUrMm4/muJA4+7w696Fu
         hnuEZp/G6zg5WNFvBgH0Clg79jXU0MEQj/LX/Vrov1YDgNJG5PYNriP6PW/7PwLF3gH9
         htNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398082; x=1790002882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8QpsQNU1m4GxJroPAMjexZ1MBknKFRA0AkELRZtXV0=;
        b=pGk1Cd0s+QLBUblpelXAoxEAs6Gf2YELQZandVNB8PbMLRN/tfUYjn4xHHkuZsfj5u
         9ag3IBHALX5YEuuo5JcGh8NaEP67EcpI4KtLdC4g8s2JJaXTKZEl9r9KXeTBE2xForgx
         6VLDPSHJ0X5BkhZ3p9gAp+RXy/XpkdsI0GSRQdH+O4X0Sx6k+VgAlrpecrTPxmGJdM7C
         dSp1UmFVQ/3DbjQoxSZaGWTx3bY8zlMvU7xqxrKld7W3p+b0bEtyizvCqYL+5WFMng8u
         W7AnswXug8Scg47bRvjQPUKDP474ishMds0Sxn8UhzoM35N3a+K4ZZ7KcUCJqBo4O5ql
         i32w==
X-Forwarded-Encrypted: i=1; AKwUvByYaUZQlgL8iBxZFwwbyJw1kNiyDjVsVl3Nwj+SpuW81t5WihsTn01X3WR+Xgn+/KNZ4BzxOS/j/9cGnlRlEINc@lists.infradead.org
X-Gm-Message-State: AFuF++m3I/EmDRx/jIQR71GK+xm6/1DWUze3lvZU4KgvoNMOQ4SJplRu
	GWdp0gKiLaTysJgJbxqBkfCbXrX1A0ZUo3V4/LAJvzp5FigKR43rp23iKSm8CDfXzNPay2smqw2
	SRVnyl5nI0tuDxaDIBhzhBoJgVUpaFJcYfNL/CcgwEfTFA7g7oFZbjPydaoDYcfiu6S/91//9B2
	kfxw==
X-Gm-Gg: AYBFou2OMizS4VJrDtrYEs8ipyy885NbLjVvcB2/6AjpWpC0VAnV6mi9nogKk+EP+7C
	eWoL5NEuwFAMrgFZLCfwNuIfNVrGASmFoHpo3hPO57IfzMN7FkMooOKrLf9wzyWgIecQK3VdnVv
	K0FHPDjclV6TlJdm7pyzCwiG9xWl1/D7aDSG0TudBd/LEsWf/XdmQBlHX/i+xU6qrY5gIGc24uT
	V+t23OdvU8AcjQfVogBj7DSuJ13SwtgwDQ5uHaR9j08FXUDFkj7skvZ+HGUCwWntdTlW3g3unxP
	8ZEWxBWGRLUH1cKCBgqsvQokFq+TM0o3ztm/VIqxO2+lfATnXshyhh+CH5SU3pumkrdqjCc/1a6
	h4jwiSTdFSEpbP/LcHZYz5KSxdSIVqC5Fociy
X-Received: by 2002:a17:902:ec84:b0:2d8:d4cf:fe48 with SMTP id d9443c01a7336-2dd6c7af936mr37526365ad.14.1789398081909;
        Mon, 14 Sep 2026 08:01:21 -0700 (PDT)
X-Received: by 2002:a17:902:ec84:b0:2d8:d4cf:fe48 with SMTP id d9443c01a7336-2dd6c7af936mr37524975ad.14.1789398080977;
        Mon, 14 Sep 2026 08:01:20 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd4007bd4dsm42943345ad.4.2026.09.14.08.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:01:20 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 20:29:14 +0530
Subject: [PATCH v25 10/10] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-arm-psci-system_reset2-vendor-reboots-v25-10-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
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
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789397948; l=1558;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=4fTpCSkuJ6PFbWarr8sThQ/LuS8y6G1v4667LcR6KHQ=;
 b=OK+6WeOtO64lo0FcZHTNlZGIoPXAR7yNvptpjLckifVArrp5hx2yljQM7GJx04qdJ9a+fg9n1
 IBav0oSF1hCD7C0am0pWIpUA0S7pbcnv/yiFUJ/CrmRTv4cfbCR4OZq
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX4yMpyqv5QOqa
 IFAgn0GKjDQSKCV6pPfZXjTLFFi3NoAyy9LtGuJDfxda6Mx/acFq2VoKhJrhfa7jdpscXAOyJd1
 aDn/PE8iKIRstQMxSkfcMZagUktsQU+MndxmPTX/7GvrXPNUVi22KJvesgaGQtDMnNcVFb2hS/+
 uSoxthUd0fNAbxc2pLskHkvB7So4LwWLK0I8s8Vbwn4fS04A43N2kce7HVGkUZuMxgGQY81dAoE
 ikGoobNfsiXHltLaVl+0Q4Oz+/EjhE8ih5mDGkjJdvYY7i7aUtx+zilTncma8SKiDGvNNIPM2TV
 IpKtgcIiVzzuxSBGPm7rOEl0xCVmTrdT7O6FZU8POHGjU7DMbHUW/5Mva4kMFosg9iScndDZOaJ
 FnHRe8EkheanWIO171O6x2/5oCxwSA==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa80c43 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=bjH5yOvFM8yfI_BY5k4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ExiPoh3Q6uwP3OQum-t-Dv9aLhWbAHpc
X-Proofpoint-ORIG-GUID: ExiPoh3Q6uwP3OQum-t-Dv9aLhWbAHpc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX1rTVlrIJ32i4
 1RGCMVZtoBgOZ4tu+SMp//fKv7NYNKYoasj2AMhZd2z952ST+0WX5oYKFrKceenxahc6PzRMzWF
 MKG/7pS+ccQ+/dYFix2/F+U6u8JuHJY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609140215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_080125_526679_36C39166 
X-CRM114-Status: GOOD (  18.19  )
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
index 531cf41b94dc..a2197dec430a 100644
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


