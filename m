Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120DACCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 04:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aaEbjaznfRKEBXAo6DFolWZjwipbscJpuOwEOXljFb8=; b=WU0KGC2n1iMId9yzT04qsSVNP/
	rpFVy9+lOwzCmDDalK4RwcP+fr8g/khgCNi1MnXITUdRzYk7/SC6zm0ae20DrD9HA0+UuYhOKUgCB
	COdgYIe28TkdVg9jWoCH1DpnL9nd5BNqgVkHiTX0cRv0O20o6XtKwPv+zPQH3pT9qJsk/V6Wdc471
	vgINzTuMF0X755TNmbPwZOvvcd4H1nyeZqJR2xnbZP79BhTqkt5onsoSl6r1lQnzvt88yQghf18dq
	G1vACOJBjeXQqztQYgq4MZHLUm88uhYhqpUH6ES31LR9PVon3K9agqX0YEzWU1ku8ea7Met17FYe0
	Lw0gcohA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8tJE-00000000RzQ-48zB;
	Wed, 15 Oct 2025 04:40:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8tJD-00000000RyC-1PNQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 04:40:20 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sCpo024854
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 04:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aaEbjaznfRKEBXAo6DFolWZjwipbscJpuOwEOXljFb8=; b=JBW3ymbRgEgRQwk4
	9rv7Ah2KbwTKe8OLqPy27Cp0xo0puRSYiInyXzZRHgaQXIwUp4kZuFgOmmXSNQDv
	fgrdEYUug1DjCytm+MVRhv7IRAOgU80iQqLoc3MBz1hXUAKWjUJMJyjhhUgL7oXa
	d/4s0t87gs0lKiXZoEDXfcpBOSiAhcEaiUII15KRlE24WuqqiDlvUevOOZ/KToVn
	/p7HV9w9OjURqZxkSF6D3F+E+6s9ciJeoxgBAbe9zfd9vdx1WH1Kv5vaw8mYjIhk
	HHEecjNtC4zd08X0okkke8BMqS2xNBo7hqW/+9732xCMhSjptXSiyh31LKY2waQv
	PWBZfg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0u1nb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 04:40:19 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-78108268ea3so508995b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 21:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760503218; x=1761108018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aaEbjaznfRKEBXAo6DFolWZjwipbscJpuOwEOXljFb8=;
        b=DsbzreZJRnqoMu9ecpMn0oNrBEeHiPKI/eqEANqYHqgA8DdGvJf5vurdA/JN05CM9s
         il+TH6W9VA7SDsiKK70gbrCHlhGmF5Uk+jhxrSm84ov+49aGWOqXr5Kcr6KQ3McAuA8T
         iBx6Nh5o5h5K72J4ihS7imlzBbf86JULlyk3l6ULIMgsdyWW0HspWeAldOt4A/BtqP0w
         yhRNBv/MZLS3wl+thE1119tOvnF1WdrIZk9lUkx3KbQPK3sGzfe4TlVll45ajCqF2DO4
         bUQo7XKD5QuuCrZBe1lYG2sEB7v7gt2cHHHBRBwHJgI/povNSKrFZDd+cr/JiUq6F0b+
         P7Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUUpbjISCusY64+worHJt2w8rG/vCt4IWVNiDy0d0WdkdFanBWKzfiz3PQ/TFnvfbbvI3HkDulPEY0K2CvX5905@lists.infradead.org
X-Gm-Message-State: AOJu0YymqfL7yYTdO+JyWsKLdCgVxL4qIQ5ce5l9f21r5YEAqMk1LLyF
	sabR3iuSFjRZoozcdeATlILRWBA7oUn2rBTxc5LAdd+HBrZ6SvWRUqU2mYL7fh6aJ5kZU2oUkPi
	GYaYZEIeVR0WgxcrmrJ9lL1REbSFLnyIGvqMS8SlxMFGL7Wyxox9PaDCGw/MD89hxqAHDWjKipQ
	Pn9A==
X-Gm-Gg: ASbGncuxS/KDIHZgP0zA/DJncbrCRD1YjX87q7diBCr9qFKhLE/SqVp9cFxpHNp+w+/
	lJaarhpMYM73j12WQxCoX9+ew3dMl9/SYmL7jCgg/bGsDxnIfoQf6dw9iYHk2aBT7CIMO9s2AZj
	Pl+4DvQ4QKyzWnt/b6OS4kN26PSaz1y2zfDh3077i+jhniBXfo/ZJil7K+UxXCyfjpp1pU0N6SQ
	VTNhg2aR9LlhBI+qWrb1BB8zzAu+7oo9MCCZfBMNpP+qkC1nw/6oGIWGL33pfjUdUGgD9bfwUGt
	F1j1NOiiNj6hhkb0iQir2rooEw26I++XkORrpozjn2fxCsN9/2NzTTTU0ZTGBAQjFM/7zMLlzXN
	3
X-Received: by 2002:a05:6a21:33a8:b0:327:957:f915 with SMTP id adf61e73a8af0-32da8fcd0a3mr34162529637.24.1760503218198;
        Tue, 14 Oct 2025 21:40:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkvW707uWwbvXiG8keTQAlZReMI+HRsSwGyMxnWPsRVW43EYNt0vrSlWIfI3lMvZSsHDMDGw==
X-Received: by 2002:a05:6a21:33a8:b0:327:957:f915 with SMTP id adf61e73a8af0-32da8fcd0a3mr34162469637.24.1760503217682;
        Tue, 14 Oct 2025 21:40:17 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9787af5asm705406a91.20.2025.10.14.21.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:40:17 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 10:08:26 +0530
Subject: [PATCH v16 11/14] arm64: dts: qcom: lemans-evk: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-arm-psci-system_reset2-vendor-reboots-v16-11-b98aedaa23ee@oss.qualcomm.com>
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
In-Reply-To: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
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
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760503106; l=994;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=1jBpq+iZuKpAQm2NP3JS82veq+AIv0X5C7ExNAj56cU=;
 b=lQ4o1jBsBU47/mjmjh1XOZfhtlXeUXvjB+DysCkst3CeU5k7XwEFoJFmc2egI0sxXbtLJW/nZ
 PsyQu7Lt+Y3BbUreCtFgJMXmjQg5IohsDBovTYY2Fnxpf8sWNtEl+X8
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXzntJd8cfAI8v
 TY+7aAKyxfpYL/N/uZ1bTBigdnEeyf0nvupJFpoD58dRNQmoDNevg3CmWwkTocA/niNTpCHAKz7
 ITUS5lVBqwaZ+xCjBuz8f2c3L57oVfYfFBa/N0ZwQZuWb58MOCCa6Om7VCJLISCTTnRbXZm8wEz
 BmlR596JKUURJNoK3JMKBIUPTE5UJuiKJor7cFnan32yhdM+fAtT2C+3YuqL4rbKm0ox6uXJvgb
 DFjUauDr+bH28QIzYWVE3aKxP5JuCDTYO7drjzNaKHJFyUFcSGCQYS0aMz7ZHs5ujZvDC7WeJtq
 AvNHZoo9j7jtlHxfoFsuiJ4lZcKUH+n9hVjA6VbFw==
X-Proofpoint-GUID: zBnoobMlfk0i_dYoSvIZ1uB2Uk29iLK3
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ef25b3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=JGo1Z14By4IpQyqbhUIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: zBnoobMlfk0i_dYoSvIZ1uB2Uk29iLK3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_214019_392606_26AB3E3E 
X-CRM114-Status: GOOD (  14.06  )
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

Add support for SYSTEM_RESET2 vendor-specific resets in
lemans-evk as reboot-modes.  Describe the resets:
"bootloader" will cause device to reboot and stop in the
bootloader's fastboot mode.  "edl" will cause device to reboot
into "emergency download mode", which permits loading images via
the Firehose protocol.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c7dc9b8f445787a87ba4869bb426f70f14c1dc9f..09460441888a7011ff613c4fe9fa4b6872e12172 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -587,6 +587,13 @@ &pcie1_phy {
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

-- 
2.34.1


