Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9C7CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 14:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6KLS8vHiombqosDZEYpdFeq0nG5CyaHud+DvpMo+CE=; b=xKBjRm3zIsI9i777S3hxOK6tYz
	IZ41UrN+MzwNE0sCPEpHi+UqMLOkz5bzsflcBBkVhqt9+bmGJodLzBFMCh0XUEN5ItvDhcjAhNBDT
	MsBuVWz/ZKk1F8xAQ7c2PBB5w7QCX3A7CxTPnTrmk2kW8/EZzM2uAVqdZGCQu8rKurDYKiI5jqnD0
	YUZxsKKWbxd5mZ44H0luhj2HRhSnAByZWoHm2zgs7jchCVoo2qXxo7ehmK8m/rmeFebxPS/+aUlkE
	Rdv5t+RO+ELNW34yi76cGLJ69h3PvyiprHKlcc1h+13/WFh9MrcAkVvDnqbRuQm8bf6UJa3RqgDJt
	En45oQ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNX3p-00000005jke-3yhE;
	Thu, 14 May 2026 14:29:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNX3n-00000005jjH-3lP6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 14:29:13 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBePKq1717710
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 14:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o6KLS8vHiombqosDZEYpdFeq0nG5CyaHud+DvpMo+CE=; b=i/7XF9ckTQVND/dC
	TYkq0l/GzJfcDmNbkYBgu/dmSahdZq+voxXEMKcAkQ9jb3/EwuGoHCDIB9g3hBoL
	q9hjln/GwV1tjG2/W5JoAHU0+pq9IWdB/WR93kiDXc/zJZWyhGwH2aTxEy0ZaFvS
	rPqIeaNy31v4dslLkEQWftw2+af/NBnBK70hNs7ebp06nZLJUVKF7AXg6Jdk/NN8
	5cms4Qk5F2qvkU1BJ4CexyQUXHzxVce0pkvKcF3umunCg1TvR5t2qS1jiqGF8xps
	BX2OmFHWyceJkJzvPJRDywNzES0NDADXC/Wo0ktlcdA7dcPe4HeFe67OTqd7xfSi
	BDLE6A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57y7hwcx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 14:29:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2baf7378ad0so67887465ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 07:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768951; x=1779373751; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o6KLS8vHiombqosDZEYpdFeq0nG5CyaHud+DvpMo+CE=;
        b=RcnQMpvZXK0Lj2uGW2OURJnZsTGlDtMqwQJQnKWhPbNfbx/AXmf3g6IN3r7y12iNUk
         4jnye/LzcfAzBNWH015CdiyCvpr+YhCkZuL0hGaHm+5PynYI1nG0xDEChvkc0/tfjEYe
         jJDKew0NhpZiNIuhNHqI7PHerkA6X5PNd/7eXs0TFKFCmvsOaR+zEWGqZINtw9jbtUd3
         B303PyzM6sKYkGBr+3KuVR43YBpABprEXe38EssGYAdF4hZq8Bsn20MM7IAAYNf+QlTV
         nVL+a9TzeDFjYMKWOexXvJtazKQq9bGyial7lLWeq3xZ++EMZZZ2db/AixO+fU1BzK9B
         iNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768951; x=1779373751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o6KLS8vHiombqosDZEYpdFeq0nG5CyaHud+DvpMo+CE=;
        b=ZNj6fe9XEPd0KmOUK3VuGzMvGU0QBeecnOc9hwZBndw/7lg5g/62dpTFKsaVUWe6Wg
         P5G4koGuMCZEgqgOOy3qvJDsSSHDmhy70PBDeX7OE++5EqLnBLPfTVZjddmvCP8maI2A
         wdyM71+bWSpM4xG8S07jPeGoZ5TDEoO4Z0wbpWSFompp3S8eKx0ZPC5dtOTM+VLF86t9
         axQIo4vSXAq6aMj6kHeyZVoHygAGjXqVTAZvXssFmGN5o7edAWCBUAUbDab2AcmxgznN
         HhZf9kyuyJM4foFljOP6DQVUXnC0Quq03ZQSITe2CuST2Bc60LbH2pyegO2oHYrAwpgu
         H7hw==
X-Forwarded-Encrypted: i=1; AFNElJ942r0hud0eCpMfOCmy7itWXdVtKAHMvCftiaT5XXXVkZksmx4/LM8flRpuGGcCN2FX6jM8zn6aZ3CaMxSM9y2H@lists.infradead.org
X-Gm-Message-State: AOJu0YzNcWdcOTbdXpfoQcq+e0GgpiJSPLTJh8HaKgwdK5bFay+w+CxB
	uwm1faCD3YWn4VJzM9IF3V6YECDQ+3MX9vI3FI5uEz+9PK+9mvq/oEMP7+kENIm8zf4yqs0vDE4
	QU3BsLeTGPsdN2kkrRZONIl69l3Ji37VKdxQL/7aOEoykvnNVRVgNXN3uIU8EkCOgO4HAPX0JYB
	64rg==
X-Gm-Gg: Acq92OFWipNQahFV7FPRWnji2rUhMaFjx0NNMw9YYDQWuPQIoxxO8OkJAZRRFS2zM4t
	LBeZE2r9sB07bLyRk30nfVHlsY+8X9rr6DJWtMUVho0UZLimSeFS//+5ybfS6oo4bBcAD/ExShB
	TcuyV6LZAmqLpKoR2D/ht5Bmj44EdVhbhNG9KoY5ddouvyTbJC5rXkUGxyNfPiuvraswCOEeD5E
	gBJuu9XspdlBm9hb9LzerOOOTQjOu/4P39PONMtX+NN8vwYQLoHpOl3X3IS6wd2ijnIuvJDm+W5
	533ZB8Gmkve1oh4R0lNOFfY9iNWTMQq+DkvTqvQq7vmI6ikL05RGThQt06DB34UQujbqmrS7PxE
	5gwAePSvJAW16j/ywVCq6XANYYwPKO8h21Qpu/GhQ3/gYebdJCf+mK1nKUg==
X-Received: by 2002:a17:903:120a:b0:2bc:78ec:54c0 with SMTP id d9443c01a7336-2bd2ff2a51emr89626695ad.31.1778768950475;
        Thu, 14 May 2026 07:29:10 -0700 (PDT)
X-Received: by 2002:a17:903:120a:b0:2bc:78ec:54c0 with SMTP id d9443c01a7336-2bd2ff2a51emr89626035ad.31.1778768949767;
        Thu, 14 May 2026 07:29:09 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:29:09 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:54 +0530
Subject: [PATCH v22 13/13] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-13-28a5bde07483@oss.qualcomm.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=1676;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=fv/5hA6B5h6bSFJ3jKPW5Yj8V7+yiEtiEsQ3Jf2Ak5E=;
 b=DTfcdvmuHlaXJOFI959VmgqyKdy4KwC74h60uKvEJMgANVtVK6agBUfCB1qK6VdTsL7mvl14J
 T3zgl6il8yIDiXblCoQ5QJIMe1V8sJGmhryAweJi3aC5fMddvtrdDHs
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: RE1PY4LOh9SZJBoy5M3Hrbt4NscRkAl7
X-Authority-Analysis: v=2.4 cv=UY9hjqSN c=1 sm=1 tr=0 ts=6a05dc37 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=NtfjKPfcWimlndMDSJoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: RE1PY4LOh9SZJBoy5M3Hrbt4NscRkAl7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfX8KTmQf9ruRJ+
 5YC7JB+kg4HGDT+ZhRdGdeTsHBzYnKQiVfeEsGUAz0x9+GPlLPMLUBUkSnEAUJuzq6sUnTRTLjE
 /NMHxf3zVcecBe4yfJ++pzRGEQOCmXn8hblzCT25NgCQ0xA9BXWcWwOJjrReyR5nXIRnHvkK3Bw
 OMojnumK0IO3ta/5tta4gh3y/rP5xiy1yewHNEXf/nJ2g34tXafUmxMKH/oK7GmW0yWo6hTi4lN
 WLZxx5Xhqg4lVuWE7OKUcAfoo+6QQMatNOtOgD5DPEJsDugsbsQuKzg/8UFTCMAzmEA+yqsJGvD
 53Stxp7NLazHrFObWncU5kVrIDFLkZM8naKvBbHklS7zIV04n0ylQCd5yKX1SOsUpFZHEUWU9Cm
 s+j8lhG+nAQFo145/9Bp92BKMZj5XkPcIi0j6uISi/79IveG+EhsAtkcSszTQIPYRGNnS2GHNl7
 01yEAmlSSrA24qQqiZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_072911_947272_1E9A9DED 
X-CRM114-Status: GOOD (  17.06  )
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
index 831002789838033ff6c4135f2d558a0af0d3ec83..ad488570135591eb7a9e5dec5fb1924163a159e9 100644
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


