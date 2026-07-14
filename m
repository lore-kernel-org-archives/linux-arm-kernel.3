Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB183C44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 17:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gG7R/01sqhJDRepizNPrgnwNsv/MIBa9LUQwgiZjRW8=; b=p16NNv+zrRbcwW4Yb1ZS+bNyLp
	yxHiqkzVeJrwjM31SfC7ya205E/g8FCKd3niiBMEYlZCqLR3FrEQL9/gJbDEY2kz7j2rxPFuV+4w7
	K6votGy6IIKKJYxnKF9sKdYudZIVKfY4ORVM+83H3f0XmcNhVymGz/4z0GjhmLl7azJRFaLAtMeX3
	NUMoSogQ93vY4SrT0Ho2M3BgJnTovxCYhsM87aty0Xoc6fMni5+JuXBXB7do2ZzruAM3ZCDJxq2YM
	IXkMUXTHdb69/EHEWxkjWT03B9sdCEz1tOqr3KN28sCyA8zXH4mSwnYy2zJPdzxBhQhttaxCKvWWY
	1AvnnXXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgm9-0000000CkDD-2LPH;
	Tue, 14 Jul 2026 17:18:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgm7-0000000CkC4-3f0P
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jul 2026 17:18:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gG7R/01sqhJDRepizNPrgnwNsv/MIBa9LUQwgiZjRW8=; b=qHyaWjPkuFCU1yt3gVQDSqElXR
	diVL5Rf1qgS9t6ylM4L+TJyIZfWF7AcbVjQQayxQwAs2gzgwaXXCP1PLbmxmHvarl0TAYFqN3UO3t
	Lbj8/jLBM49k3CXh8D2fzH+CeK3wJzcup/nlFWa9TkrvmEZ6mEDcPO8gZOfrviqQA+7zVYHjTyhqN
	lWc7ym/+8U2xqoAryHBKHAPitjROjqKXGmqUI+ghRvLrHUJVNKDoOi41ob9uYDYKA0AwS61G469Gb
	4KECwtg/Cm9eF8+nf1AKJOlDqxUk38fcQYiAdPuRUomq7P26sFi4LrEjkinay3sdO48/HTuivmHgT
	c8y8XBPw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjgm4-0000000Cis7-2gYp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 17:18:30 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6vOd975528
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 17:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gG7R/01sqhJDRepizNPrgnwNsv/MIBa9LUQwgiZjRW8=; b=pj+DyRlcHZB4KDEq
	Nyo+dST9tBKMJxKuyLZw/7K/s+E12bczgmD6bODwSreG4Wpw6AYDFsh2+Td6Mp6P
	hZitrFRK/qLghv7wFT84ICnhwGMiAA63ohKh/UT5d9NUyp4HcKDSP+QboM9XTXCn
	zZ+NBRYMTwwvXETcg7d4GLFQn/TcF2vpAIGiM10kMbydWocyBVolvscpk9JxqOuY
	S7kZehoVzaYWPY9+U9kMWfRBBDxKbOV/GuD1oMbcfJ4UIC3vZREWVhnDVKEoxrgm
	vqjYIoJjWqtLRrF/UjWvrw08745qbHrfaDNkEjn3QUbVJmxv2umFvFm0qIiA+PXB
	RFEy/g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgeq2dan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 17:18:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848474825ffso1890817b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 10:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049506; x=1784654306; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gG7R/01sqhJDRepizNPrgnwNsv/MIBa9LUQwgiZjRW8=;
        b=RbTl/9r9tSaP0OtP65uDvVkXBZZvLDfG1duOlpA+NrCv48erI+qWiwi510d/dqCRO9
         uzyyhVaWuGsANCbBeWl4ZcZlhFyTyuiUw5/r/wxwK/TaM3STUS8DYUimiEJd+4q/7Bp/
         nS7BYglq48K3kgYI3c08ZwNFnaFNTl8Hu7zA7RbpEG5Po/9pI1NEdxVgZn8eVoZZRXjK
         4SV1nZhRh/v/2skyWg0PxoENMtjBLXxf6qwzVnaL9q3YeHxQp0t8HDU/jwmJJvOPHMeD
         6aFwpj6Y/Lja0YnrDJNpAq/azLpxz67ABMW/FKPdkjsXJSf9f+HnyoLfVIlBg+jtG+fb
         ljIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049506; x=1784654306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gG7R/01sqhJDRepizNPrgnwNsv/MIBa9LUQwgiZjRW8=;
        b=Ab6l1atdHCFO3BP94sAR54WPfng00Xv3203RbBYhTq3GdvLE0QLs8Qf0aiLZzlxu2Q
         1QJTcCLNHH73mrTYc4TXtBw1eZK6E7l9KNArS0NIGBmRysDieKlTScRjNOV5aLBCt7al
         3iRyZFCIUx4S7/GAswHUPEQkkxbTznyz5PgdByCADREVGgr3kR8aLZC6sqEd0+KCKEUF
         0nEzZ4gTEVWl9D4IHgZlfLQb0GJPunpNudHLNIa0VLKFiI7L0rI9zq1PqHBcii0URFX0
         b5wtpYTGlkPl4bOCExqqBjGQKcUMXi7eV6ZgKAzlYHYYB6cCwS4E15KThgqdpl9cM9KZ
         jKDg==
X-Forwarded-Encrypted: i=1; AHgh+RqTR0R/k4KC7RTCaBjU/vTZBuJ6A/uRe0ylypEb+Rc+rm2he1aWITXfHsc5Qt2apTVVV2ejJl2I5ciBOEwrxd6i@lists.infradead.org
X-Gm-Message-State: AOJu0YxN1i9jkagfhHjz/hgC22hTc/k+IZRDbzfCWk8npLh3pfX9EsN1
	f4e1WeeVcUvtjmVvNAeixU9JAELd+rDSmd9tb/F9b73l4bXxk3/tdX5VXHRtU7tG60kgZQ8kLPJ
	5v7PXVOpT47Qaf1w6CKHs97Im1JY8LVGHJJCb9Qm7OXIza4H9/aPr6ghP9ldTkG48I9tmMFAYhy
	WLHA==
X-Gm-Gg: AfdE7ckNGVfH2g4JJ5ly4P2ijO695/q5krYiVhDbjTxac8Icp34fU8SjpVYsZuiYrO8
	Tzp/pa1Wt+SNEPnE7F9q59ZfvbdjUV7gVMZ2uzRZZHQmZJ7urqi974nfxaD6m2zD6uOWJdUO1Uz
	6bD8US4sxuQZVks97y35NbeJAZumyiDHXeY6cNRUEBHD3mZZPo0X51+xQAxQ/yacherOBrElX19
	bjgwI86z6rrIsvofQIxB25zz6W4SHsolVs/nqBLt9JgqepgMtQdI0M+ZmyvNdLHb/UGtyo8nSKi
	rmUAhXTiueqTm+or0xyf0ywNtDTsgRKr6B2z35rg6pRVbWeOTQQgNM/s2P0yOdvFp7NolG07i0x
	Q08WXRipFRf1h59/lzGF/H5yCYs3fc1dsza0KPcz8wJTCvps=
X-Received: by 2002:a05:6a00:1a87:b0:848:57f3:8f92 with SMTP id d2e1a72fcca58-8488abc3652mr12495384b3a.17.1784049505559;
        Tue, 14 Jul 2026 10:18:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a87:b0:848:57f3:8f92 with SMTP id d2e1a72fcca58-8488abc3652mr12495342b3a.17.1784049505079;
        Tue, 14 Jul 2026 10:18:25 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:18:24 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:38 +0530
Subject: [PATCH v23 10/13] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-10-e7453c548c21@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=2145;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=PUOB/WUFiDir0kcvDNojilOCna+Is8nt41EZNien9Ag=;
 b=KWNkfXMmKYthJN1uiFBbtCUXReE0eGK3H1pxspQgqexOI1PPkEewBDCDbvLzZhUdhh0OCxaDh
 BwcB08aHB/3DrxL54W/bnlwFFGWJlmFNQDZ+h9ABzFiYnUXo+kw1SS0
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfXy96asqkBeXkh
 Yg1pzu3iSE/gO5Ewn8ke+1HN/UCcylbMRLGFWcGJTgwoQHIMUfyvzOOjIdit33b2BmX3j7176B/
 GkSnTXilljYxnGZ6x16/ZLf6Q+Z/HZjTOQr3QTCX7D34OgPsErAv+wqrsdRCVm4x54XavJThhxI
 ODY94IhXoV9o4AYdQPpO5p7f08o2IqKg1It/c9d+EXNpr7iLtQmOcEkPGFPO7sDn5TKM5zbivL2
 gUyKPah1J7Eg7VmhGVB8cwoZMLMns5EEUsDotp+GTBuDwQ3pHIK0pADdSKFDyQQBnkBM/S+N2e8
 aPlxLVurkXZe5J6xXhaxTqLq8hsd/HgleYA1lmFnmgZJw1P2B7J4LO6l0nHbBdmz6hVT+mvrruF
 Nod9YffT96VWoh0s/SXRhSei6FA3l+ZeakBYQv4tXnPt0j4oY71NOVLZZqmB0yXOXpvat/G7HD9
 jXHotX4PPJxfm+xtmlQ==
X-Proofpoint-GUID: _WdYWLR06f11ARp4_W8d-WhZDYyVl2Sf
X-Proofpoint-ORIG-GUID: _WdYWLR06f11ARp4_W8d-WhZDYyVl2Sf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX2X01yRkD+nGP
 k1nVJXB2w3QTLIC6YLoJkJg/HPasThOfLwr/yn8lTr+TvoCHdYI4Mj/+gYB5pzPD70+ED1ZhC18
 uYft2rZW/q6a7cMeVK+34S9OvIkdY1g=
X-Authority-Analysis: v=2.4 cv=V9VNF+ni c=1 sm=1 tr=0 ts=6a566f62 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_181829_002389_299E8503 
X-CRM114-Status: GOOD (  17.98  )
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
index 7e73348fe0d0..82713f49ba63 100644
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
index e9a932c90d14..0dd67cae41ff 100644
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


