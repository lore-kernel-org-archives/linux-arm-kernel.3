Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACD1D3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 17:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQNl6k9FVRxiRZu36Ul1H7qw6ya4whFcoD1DtYOJAek=; b=BCQxSyDdjixCYrpttVuNoo2sNx
	83PPJzT/Q5EITSGmUjfSWSshfg0s2T5GTVrvh4h+vZQIG9m29Nm3WhCDZVWrYDPRi9s+xtS+AbB/I
	TLioCiTfuKZ11cx8iuv7ep/fxxgx23DHs8zpVF3doA+s/ex6iO1pgqKXr9HyAh24tG6JAMJyt3jhp
	L05Q05QpNXxUBmxZVGS4nPRGqK6S1hcLOyf5rqcGjyAbz0lCS/PMwi0WAIXAIMPp0rGA0aScJRf9Q
	g8S+DUY88IimrDfyjPWczjC56sBUaI6ACUn+uo9+h/eUycsrd5ekDNMyLfTq/tcCUDVaCUuUmFWwO
	530IPd/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZuSg-00000002uj9-1Ehn;
	Sun, 28 Dec 2025 17:21:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZuSe-00000002uhN-0lbi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 17:21:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSBr40Z2797777
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 17:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pQNl6k9FVRxiRZu36Ul1H7qw6ya4whFcoD1DtYOJAek=; b=ay5zcqfIOFCL+B6p
	XwZiip/uLTkamPkdcq5FLuRjk1ukMksFGKZgOS3zz0Kxru2tne6vAQKUoYdm6JU+
	9mJCL6nGe6Xee7nuZCup7Wqj/BOYj0KPMMf8wcxrvwYugQcBmrn/AJRTOath2D0Z
	wh8cy15akUANBkT3TaEMgz0d91O334sqgSGV0ZS1ulK5lALqQSHvYUSCaeQcfxRH
	NoAPNgEIpJNgvup57tcezmpQHPMx4ScvlEKX/UVT6PJBAeJN7qoK2Y1dFedOjZPu
	x3bTTKoFqv0Sy++SDCmuiLcNJE/SN+B33p2sjMJMYiAf1ojKRfAiZXHjGzWe89QD
	jUNKPA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7hsafv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 17:21:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a31087af17so160330715ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 09:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942502; x=1767547302; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQNl6k9FVRxiRZu36Ul1H7qw6ya4whFcoD1DtYOJAek=;
        b=GTVhMVMpz/lTF/k7m/2Nk/WmeNHlwYOsZk66tsef78pQQuSYn2ReH9Z2Scxl8B0w1Z
         1K1kc/Xvbh/YW0Qx4HlqtytLingakhuZyr/WSI4UvXZsPlP02brlr8yqW0XxmBWc4vv7
         t8PVPxOflESyBFT7+QKjZUmHojBmV3NqWNHX1MdPy3PAOfAfY8pIl1hqBG/MGAjsXzJe
         fGlKhs5Bg4I4dAfEWLnp03XjMCwhQCxBh3YtAAHTivGy7Q2kZqtuDWmguViTNLXderdw
         zowKIEMjjS2a+v6S+ID0P1vmJB/bNkgCqhlpiB8D2FZpMXXiIhcNPdLTj41d43yUTinV
         jwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942502; x=1767547302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pQNl6k9FVRxiRZu36Ul1H7qw6ya4whFcoD1DtYOJAek=;
        b=dn9iXn/h5XxdUFIUIHXYKlBQRtZulrpy+BOmu6klhZbgHnpiGTnm4CEAahnzA3TdRi
         /9Y81oXEuCB6z4Efz8JGCpDJta4/4HxmAFYXX72zBVPH16lkbYYP7WF5tWG9VBwrTYrf
         wSMcAp2zEd/yJYyKUKONHYqcs8ehB9M3vEojbFFgcczQG4fmbytCrHxVvwGC7rwo6TsW
         W8V0AkTF2cBfN8aVhqbUUYcBw2GM/VEfjlkofwsoamXRrgrc74T9YlqDrZFp4XKCkmBp
         YrM4vz4GaZ6cepDLIma2QZjdnpBmhaKwnzJje2h/cLkr6XoNqb1DFs6dQN/XajJvMXf/
         E5BA==
X-Forwarded-Encrypted: i=1; AJvYcCX3XH+cF1XYR6s4kH7GdEc7XCv2xKt56PuU8+i3dAZhRGomNNAkC42yMc7ULJr6tZx60pLLXqM/Upun5lGoZfp6@lists.infradead.org
X-Gm-Message-State: AOJu0YyDdWLRULjAiPEkRZhkNQ+kPUaQDpydJgLxDuisD7sxHSZ0RZiJ
	9J/RVlYqOZ+2YtiBs/UOxkmiW+ojqsp49SWiQhy+ogjy2HwdZQi+ERW/9njbXhoOjD3aDjtCq9s
	qa5fPiPSwwi2pnYgHu4qMpz1HYIPwuiCpYUGS0XBMG+3G7sGxj+Xe2ARKhOH6Hl+5X0mqSDDbcO
	TLfA==
X-Gm-Gg: AY/fxX4OIO27N1myR4Wan9LOT/vcmMyyhLcmofYFWpeV0Q6uNHa+QeyozaxOLSlnE4m
	svKWTU3oDVjOvyA1UuTPTZbUKseXTTszOALz2bzoKDRpCFlv/A8BL9fNUSoagHCJfXUsQvpIWu5
	+YNzv0sqyGtbY7SGXxjSI/cWypJfJiAJuhSqwaZf86HGJDOGIFrh11nPrt/2sY4/YnkF16BZLiw
	7H0UPRC7hKuLsXU7J67mMazsZSuOoQ+evC6shwv/a5WRD2Bjxl2Ji13NygAsxFJvsUJmyC8GWUK
	u1VewrCLxJh1dIPDmDAubOqE9MSpSpA4lbDPknmB8x2Ag3TlFnjOxSd8q8/CACJWp5a33FmHdOe
	q2myVvA8J4/doZ3sHdEE/sEoceEdoHl5O6EOQ1xvKKrDGwQ==
X-Received: by 2002:a17:902:cece:b0:2a0:8df5:2f6f with SMTP id d9443c01a7336-2a2f222359cmr260366815ad.15.1766942501896;
        Sun, 28 Dec 2025 09:21:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEq787p1Ho63fjlcy8G81u/QrkDgHtvjgeeroB0B78/24OrcR7OHDo58D/xrcx/ezuepD0T/A==
X-Received: by 2002:a17:902:cece:b0:2a0:8df5:2f6f with SMTP id d9443c01a7336-2a2f222359cmr260366545ad.15.1766942501409;
        Sun, 28 Dec 2025 09:21:41 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d776ebsm255743965ad.99.2025.12.28.09.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:21:41 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 22:50:27 +0530
Subject: [PATCH v19 09/10] arm64: dts: qcom: monaco: Add psci reboot-modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-arm-psci-system_reset2-vendor-reboots-v19-9-ebb956053098@oss.qualcomm.com>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
In-Reply-To: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766942426; l=1066;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=djZF5UFBEvnca6xGc5FxK/x9Ur59exsc3OaeKnFwerY=;
 b=Mj5E0OFdKuDieuQWf1uoUuRUrw7EexTkeFGSadCtQdobt1WP6IyHfOp7HA3VEEGikWX6W8k+a
 m+7/ZZbc8RBDyEenZKLfJRCu0VwCGaKF+UCG7idWnBegycJqDiGXCS8
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: 1WG--HRmenAcLhW2vb5dqpJG38JST-U2
X-Authority-Analysis: v=2.4 cv=O4o0fR9W c=1 sm=1 tr=0 ts=69516727 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_PJuSq69R3b4qrRYkJAA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 1WG--HRmenAcLhW2vb5dqpJG38JST-U2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OSBTYWx0ZWRfXyXSFhZB72O5D
 8gryG9GaoGYW6wm+uUL/sYvSDd0Y6KjoyKnFdq/WXyP+JAJ9X3DLSOCSSAvHoARdRiagB5QvJlV
 Mx2amn/zIDvk9jyw5I3J/85BYmbYlKt6N2YuER0N+YCIMER81mJ9JzJcWEsnHkyxO1RX/U9vii3
 3bHlkj6DVZBoys0MPo5YnrsZmmHfDobV8A88l4fK9M0s2GlCM8EtosC4DkhKOwOi5GOSiJLLJZr
 vSuFV6z3nlblEGp9cwT6o8iYYZkfvnX0YPUrVl88LZNQ/wFp1vFOWNMzFNVmvaO2vkbgZFQ5MBa
 E7qq69XgRJxJV9wEd37NA8my/Hos2YDF9SGoehm5PmijlnT0anOq9eQOOmcO9lNyet8C1DNgBFL
 Wgv9cFYZmVec8a3dDR22sn3i9UoTOFuqEUkh+uU+NNf+EkuzjI6wqI1eDfUJQ1itf19gEd64vs2
 qh6qJZRD3ZwkTkbqE8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512280159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_092144_344521_37A43AFA 
X-CRM114-Status: GOOD (  14.16  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for monaco based boards, for use by
the psci_reboot_mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 816fa2af8a9a663b8ad176f93d2f18284a08c3d1..9c8087f870fc8889edffda63c62f4d5167729cbc 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -732,6 +732,11 @@ system_pd: power-domain-system {
 			#power-domain-cells = <0>;
 			domain-idle-states = <&system_sleep>;
 		};
+
+		reboot-mode {
+			mode-bootloader = <0x80010001 0x2>;
+			mode-edl = <0x80000000 0x1>;
+		};
 	};
 
 	reserved-memory {

-- 
2.34.1


