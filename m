Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1C3CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 14:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3gmXevIZBqHz/6HbBP+YQLOenk6XainQhMGwbD9zac=; b=oVkUiHjTcfDLG0BzRGywGIznRM
	NcZ8QSW8/lfXugQAVpWTnINK/hqBjNsS+2ov/5ZHpw1fAoWQ5DB1ACFRorGd2J68B1kqffhpswwGF
	/O4shCJMS8F4EMQShYMSqieu+XcWdHKI5/RLhwCUYBJXwOFCa4h3XUk+Z5wasYdf2ZCHYyA/mPpq9
	WnsVbGm30DQ0zyD2Gr+tv5tBlefWawd06uRehlXCn6LvkJ4pHWQdosvLhnWGSrr3arbGoo3VmIsTw
	1RHGyTHMzDQIRYLYrsj+Tgff5sSI7fKGZToFtrF3onCTfEXkhjvU/6Wo9sWmS7wUW//Hzj/2ql4M3
	1s+Ip1PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNX3Z-00000005jZF-2Rai;
	Thu, 14 May 2026 14:28:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNX3X-00000005jXs-4BX3
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 May 2026 14:28:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Z3gmXevIZBqHz/6HbBP+YQLOenk6XainQhMGwbD9zac=; b=Hh4KFM/TBBpWGTGfzv7EDE8QYZ
	Y3MrVjg7x4wLRNob820rfZPrHfDe1niMX/kj1cUYwa7n2jMY/h53XM2eS+fY3FT56YHQhmHVK7Es/
	B/h27hSARSDSReE+Q8IelwNaqxEexOiqWJJy0sXOvilmGWsR8e/42tm2ihFHnk03dk0z4oxzKtCa1
	JSo0nWlajpQUFL1EuLOVY3C+vASVHomC8WteHJtOagqXaPw807XJB1xVboJPS++sjGxNTd4q9TfcG
	eOKr7lwVgvaLYavV1yBY5ExFuhPXjt10h6Ay8YQkTTBjdgjgmVXtMBOIdpnSmpre+bqpC+cFJJEEe
	LlTGmlfQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNX3U-000000037WO-2Vvf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 14:28:54 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeRei3891053
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 14:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z3gmXevIZBqHz/6HbBP+YQLOenk6XainQhMGwbD9zac=; b=gnaUlrBtcmS0yLMj
	vnRNkqwnm2zN+h3FF5X4ixzhDVvpd0mG6TP/s5+7fOYUaDQZRnLmj4VvKeKKpoor
	op+2LjuHq6qdeQMCZuiU+0S53gGhSsTFWqqA0mGixkqkZVw/2Iwo3KQh0y+IPAWk
	ATJ96uE57gT/luf7y5L/5DGSAdXu7nm6ttZ17nhyo7g44pryVTy0uJNfUr75tmG3
	0oI71fdz4XFj2csQjgQGHxshAoP3Sc5CWVps31rAs8L3XSiO26Yrc7aapFcpxDU0
	+QpKtMxx/bLpQhrWpXP9d5gSgb5F6JTht42+rejUgKDiQMAEOMAHe8ojhNEAhS9T
	jQd+TQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4tvd2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 14:28:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba268cb5e6so71820645ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 07:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768930; x=1779373730; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3gmXevIZBqHz/6HbBP+YQLOenk6XainQhMGwbD9zac=;
        b=bB68WM/yzXwoe9VMMYiA+PjbTmjZuUjFCspMh0HGCe67wxpMOth6g7Bn3ca7OBtGxk
         +C8CPUaZUxx5EZahp2YCqHH4zugJNja5ypcB3L/BA1FC0ReMf5IHg4bqlBmjfXEGYCbd
         fB9zeH1lfhix8Mhev6yHSNOOzyUqL3hk1x4OhDqlWTV5/guzxAJPge528JR+DNNxqNKg
         azmjqbd+b8+Zy1ycSWyD2DuJuk34NGwmaiw/TMpevrB4vWvWRolqNbAFReA245OruuRF
         DGsPj7zzqNJgjB5LLJOp7nF3diAhOiNlBCjG3SlOsa5+i1nHCVCbdKUVga/9UnvJM8G3
         VB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768930; x=1779373730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z3gmXevIZBqHz/6HbBP+YQLOenk6XainQhMGwbD9zac=;
        b=rYumLyg+p5fCu5xXnqPOVBatjRK6bneT6XKtR/gRVjr3a/XtjE7UnfDQc/QHE4yeTd
         oXzcMEaPfmh8IMUB2zt0a9sB+j0xQNtRTqA29MMxKYIXit9LnDFU9F0UkHw9LFZ7Z4/H
         1pLc00qwHY+Oz5j2oc8JU6bLBz6HsLalJ7eb2zSQGv/PMlRBPS3T3P7LKl1IkL+f7hjf
         sGF7ULpJIPLp9P8hC+ndrCzUw5FiPdJrhObAkB886eB4OgbaXPnJgCsmr2DF45KywR4h
         ugSvqWp2gVMyj+Q0pyEKALzECkqPFtCO0YdUK/i07wV13fvrY93NCQmqHwyRt9HB8wbN
         BPLg==
X-Forwarded-Encrypted: i=1; AFNElJ/ZdUGzy5Yn2RYw58d+7HT/k3AR8WJF6RTk1DWMj9ztTH6d7pMNvBHswkl7XtBbO2zej/Rg/zGzYzwrnpM7sUEH@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj5Rz/6c+9rDJYNzfG276qn02WXP3hbwpIiO5dm9Fj00yA4vZO
	8EdYh/bDQ8I9yH4ICWfKOhYA0Yb5oA9IJwSQVp4HjsVvbAxAkI8r0B9SbTnLrmvc8Nhyw9KLK6O
	ALGzLPFHoFWDVP/PJcWSmCKv+PZFWSpfpdoZLNakpKsOL5wqXv/7p9ySF6bTpPmtil28O96c1DN
	OSqA==
X-Gm-Gg: Acq92OG95zdoXB2E/1N1peLc1cFFp/MNgWCUJaExtXhScKe3gLZFuLMByVy2CIbgTQd
	z2MvUxZ5gf+0E53YdlF4j4y5tfiUMbjx+b9buT0aKioTPcVVtwKBi3XduDR5buZ0v1gNux2gGHv
	uFZx/kDgkPpgZvGhOnvY0ecwF8LTphvRIQ98NNGABHYBAUPWzmfnNLi4lYNP8DwHGzBV+BfPe0A
	3bX/UBL7vGgqLnWnpE6flWZk0EunngRglFjeOxIbjFbDdVU08qrU6hMdMj3TzzrMRAaIzv6zhrh
	G/pm91UD9u2ddAyM4LwxTcFjSO00fLxORduJ+RFXXpd1ZbeiG2vZqzzjglWdWqqBtvOQ0EmJgnf
	D9Ju+5Pon4vgtbfvdHNudld2pBx/BO60929a+dYLfb+dSirL8Z+V/tQtc7w==
X-Received: by 2002:a17:903:fa5:b0:2bc:f3f5:a6c3 with SMTP id d9443c01a7336-2bd276f2a78mr89745905ad.39.1778768929782;
        Thu, 14 May 2026 07:28:49 -0700 (PDT)
X-Received: by 2002:a17:903:fa5:b0:2bc:f3f5:a6c3 with SMTP id d9443c01a7336-2bd276f2a78mr89745225ad.39.1778768929231;
        Thu, 14 May 2026 07:28:49 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:28:48 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:52 +0530
Subject: [PATCH v22 11/13] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-11-28a5bde07483@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=2346;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=hQWk5GnSgPwZS2e2a67KLI3RcOaWHf38dgj5HvuzzxY=;
 b=8HTGNQ569NTCRAx7lz4yBrYgkXlEUi/4SOkrgYaKZRigAugMeSI6jpFJU4nygrEPOBC4fE1SH
 3jYOuzc8rIMDsTnHivJRdKPKjx/MAVpDeDU87PiKaiePS32/DUYOZ8J
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a05dc22 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfX4KxWkohzHss5
 8jaQFyIvzGLC6EIJlDhfsdno6daMzkH+aCFRoN4dFPqMaPSNiBNZ1meP6rutrCeHuTaHY7AzGZY
 Fjdl55Y32+iwZZj4oHXNul54EMyDx26WPMqiVWfGYRe48uQnctO3yNivcujgtTjftnm40Gh2Jyd
 BhTRQtXoi5yNx3xPqz80aAgMWMHOjabSAaakZmYk9PmMeRNa1AJNeH96iKjQfkgaZ7mZfzAtd2P
 /ZSz2So8DwPSYqf1CC3EKtWn16NaRe/ngVi7L2RY46a1L/JoG+6Z3BZSrg8/l9tfCPQScGJZU3a
 8SLlrxn+Ejy8qNOw6NsEF8dt79f3A6uXwZomcoiegYr+jRNOU6+jU2CryAyNGprQqBuL58uZnYk
 BNNsxQ/h4jBB+ISjQFWeXl0pLJH0t0Hgs4tQTt6ouVp8STjtda1WGsdzYcFulUyyzPclwUN/3/y
 oGS9x7bo0MoH7v7HLRw==
X-Proofpoint-ORIG-GUID: uOgHZU0tFmWHQbcNLREsHdw5Ztdq5Q-I
X-Proofpoint-GUID: uOgHZU0tFmWHQbcNLREsHdw5Ztdq5Q-I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_152853_350400_B4AE4F21 
X-CRM114-Status: GOOD (  16.46  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for lemans-evk and
lemans-ride-common(sa8775p-ride, sa8775p-ride-r3, qcs9100-ride,
qcs9100-ride-r3) for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c665db6a4595cef441f4bd5ba21fe133652b97c6..8be0f50188839e6301e33a50948a523825fc5a6a 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -758,6 +758,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c19_default {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 40f88498999bd89e030a6685e6b84e7283e866c6..2a9ef170f654b1e270b1fa6d4b861dc0c4642760 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -800,6 +800,13 @@ &pmm8654au_3_gpios {
 			  "GNSS_BOOT_MODE";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 84a1e5ebbf5e58b2fe11978c3af08cda614605f0..447d80aec5bfa1fcf11a933669f4740ef310c9c2 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -559,7 +559,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


