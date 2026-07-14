Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C85C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 17:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lgh4YODdsRL2iadze+USZ/JyD5VPsxlZsZRCppKGG/c=; b=1xGL4VoMqvPR3cL4foaUWqCpdX
	hSUtiA8ZcXTLY0s4ONBvlqdW8tjakuHQYkUfGauSrL6UEL/NnBcCP3as3wBVwABnk/5LtRs+IjEAL
	uiTHcXTGfQv86+oWgynHVynf15z/mc+eVKVX3+CFMTHbOs3Jk+VRwCXXXiwf71s2whTGFBMH7tyh2
	M0l7vB55hc8GS03SJ++Z2Fyj0SclpEI8sgRd9qBSyBSZDCipS6pNanJIg/sYThfF25l2fB/eXB+Cv
	v7H2mORWiBP3Ui1wBOQGegjyZWWA+gtp1EEz5Qb3ION1l1B6WQjKTN9Keyqn4PUjzZl1yctP9stNE
	K/DFh1PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgmJ-0000000CkJr-2n9s;
	Tue, 14 Jul 2026 17:18:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgmH-0000000CkIh-2Rjm
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jul 2026 17:18:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Lgh4YODdsRL2iadze+USZ/JyD5VPsxlZsZRCppKGG/c=; b=q9YfreTmx1TUvRNSTQFKilIX9f
	W/nRLBdK0BusHgWMNuiYLAOlEdMl59gvkTzpUHGwoxyWXWDKPOHs1JXHMoitVUXzw9iY32vUI4cO5
	LBy7SzdOmGmmOJBDVxo6eVu7snGV8I67/z2sBlrCDACw5TvWRnLq+7ezTM8IfmIWiCAeTbpK+AMxQ
	etRFqK733qIauCbPY1py1sVXWVQpIiNsaqvJdTWxwwUo99EPVWQrGJPU4rGuvoUu7yVYmxeT7OdNK
	DBgefyxWMJ7P0APUmqW2l3qQBA8GUWWQOEcw0r4LHIrSmg16Si4KbQACRCFw+lA4yqDjks9ZILZ/T
	/qFCYHbQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjgmE-0000000Citg-1BUi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 17:18:40 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6uX61003536
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 17:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lgh4YODdsRL2iadze+USZ/JyD5VPsxlZsZRCppKGG/c=; b=SyMiKhuBEFGFFMOG
	LAglW1TGtpv/TspKS7Wg3pvdduKYdbbfmGDlAH7ZKt8tBULqrXsn9uiHVVJkDgoG
	W+B9IpwImW9+7Yn1J0t5CeEhONPr8r5gxb1vOFFGPWRDiXINfSu6IhY+XMvE9OLN
	RMTd9uyxtWqVBfl/ZDUuqhXKNL80/B11nO4AqON2iXz5ghYKsCQcKRqsMKqBnJJ+
	pY0P5grkstTY4pn+v6idCcmd+u2VfipEYrotii3oFGfll7NjymxlsXncsMuVzvZH
	6A+G41QOBNlW1UHBofIp1ZcElq0iuK3oR/CXChgkp88QfmAr2TVMyuwXZmKyQiZk
	+w70Fw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnr13m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 17:18:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8487eb67173so7161184b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 10:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049516; x=1784654316; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lgh4YODdsRL2iadze+USZ/JyD5VPsxlZsZRCppKGG/c=;
        b=h//IuVgiFv7/Ji5l8VbHGN9ZgmK+RheYrnpgpj9Pq5C6W8cw8PCGrUoxY6PHXVgefq
         cUG8SNxLpNtMuR/Y1fXN1+jnvSH3aly/tAS4JM2St+6rDOcAq/SVmYBcTgT/CELU5X3A
         8mYbnAzajaSTXbgZ4jHokKze93XT9qt6lkDLBg4V1vOGb6/+NnAgNa9DANb6uOV2wcrr
         qQ1CrfU2tyoQbSWKxgwr7CBbUMH35FNSV6Xz176oOqbAtFc3aJbceyPtu+FZp/GjRTDv
         TpQpFkAwMyECw7KZ8SW+e0ceuDYDcFCNc0Uq+TPVxDEh6Aw6FreGFesqVhgxqDOlHpDV
         RXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049516; x=1784654316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lgh4YODdsRL2iadze+USZ/JyD5VPsxlZsZRCppKGG/c=;
        b=RL3aWULRpsuqAHmpBb7y7T/Sbv7FxemPJ4CKpQdd//manB2V/1OqQugBKjooCvPnwz
         jnzlwP1KqenM9pyU0SINLQsnxBw7E3XEdXYLhUX0ndF2YhfNtMbPNxmHkMx6NUtLshSO
         y6Qhkmwvtzav20LCfByeHr/VRs6aG3gIJhcqOOvJU/wd44V5ER3S7FGbN+gRqe7MXnnO
         PYCNErPTyede2sg7yXpxR9WIaVi+7Ek5Pbk/m1xg//i1WJXQ4IN6ezo6HbGexiVQMlJn
         w/U5oClI8Q0GAGsVmkTRo11lItciSqrE0/UlxyTGDvI26UDs173vsYt1KNySq8jjF3qk
         Ni+w==
X-Forwarded-Encrypted: i=1; AHgh+RoGGAkz0j9sAgBo1T+n7SRS3fUcJa2miYuP3W6e3GkMy8tDmolv5FAEOwgeE2gJ7zXKReSmmOOJkS6UfVFlDgPp@lists.infradead.org
X-Gm-Message-State: AOJu0YwEPe0cu27msRK1GF5V4aRz7Z6Jin1QQvaw6CSf2JsNTRAl8DwB
	HImGtYUEUqT+mO2alY/PzUzLspqQkq6m41FKqgvDCB+8P+vZGHdCaDftYwOJPRAqIlZQAlxCgTt
	p6d0yyMVyoIlX7+6qXVCe28fe9eFVaLdcHxlbjCk3ujrpgu/ZuSX6yrF1UAdLbTqzTiS0eKDYzc
	3Z0g==
X-Gm-Gg: AfdE7clXZLp+j8C9AsdD/upc/+jHwYOS475+yWKTecLu1FrbL8/lgc9/SX+9VwXog4n
	rak0YmJnQeUh2M5G5GHcLiQEIXPzgWxLEIjMjFH4d/p1I+PLmni2C/i7fbtwX3IPZLo19sy2wdb
	SSk0HTL46lYHWL+OuAxhQM3oxtvCHqzOrwQnU3OWrDJLqk8iHN0fB+cDdReQLa43HDHd7F33mpF
	XVs2k6YGwHnLnlHeWV9NDrEZLJq4nfbgJybIhsqhzPbIW6B47PWI3uS1aqrvrL9ngxm5CJ/Iy6O
	Dy0qZSK4QX4fmyBHvibJU5mVIZeAqsiDH/q/DKW9HOFxG3UB7Sy9lQ5aaGGwJ4CHdNy+MqwXEQW
	7zUno3SnKtMdrYzlRWOkP+4XUR+4fPDM2T1pzVFRGHLK9slg=
X-Received: by 2002:a05:6a00:a0a:b0:848:2f73:8ffb with SMTP id d2e1a72fcca58-84a51658d90mr4261329b3a.68.1784049515427;
        Tue, 14 Jul 2026 10:18:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:a0a:b0:848:2f73:8ffb with SMTP id d2e1a72fcca58-84a51658d90mr4261285b3a.68.1784049514895;
        Tue, 14 Jul 2026 10:18:34 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:18:34 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:39 +0530
Subject: [PATCH v23 11/13] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-11-e7453c548c21@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=2178;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Z/HoJXdAtZ7QJgARbgQpZ4UcAlYil6V3oBtsMpR4ihE=;
 b=NaGRjqx/cA+/1xxaf4JRY1stuUiBVDE4/O5+Y6k9ajUNbjjxsYWFrascqLHoEHnRcwwMr0haC
 V0njs5oGlkgBrHPIGEO6WpR56MRLhWFK/13OcpxwoIQxt5U9fMLpEoP
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX7SIfL4Zm0aXb
 OGlJxw1W8rgj1EZPD2oldAh0C3GPjuQTx459Md4pnTXCV46M4ZUgUItac2wMHdYEypgI+R3su48
 7REiGuWX7uxLaY8m585ovbooL+pTA1I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfXx0ZkmC1BtvS9
 Hbc+I0I7jvlF9l/YmB1Ag4Ygw+IjCRzWqPum+H07l2WflbMtas4FUbjSvWvnJmVSVn+0W4HnvNl
 xLLh7KweveuJMybJ5OQFIrj+CZkTWhnyejpVzZaRYQga2Gfs2j8M3wPSiIzNXFPmUuVDk6M25nj
 ja42LsgrzQ9LvGNmpwx9Y58idvaRym07lOn6DFfMpCg48/70BoNZ6lBwZ5CukrhgG+e0spWPWyA
 waqjzHUsnAESYd2UTVxaJmXatsEINjrX++b8crYqst9KuOhkqPMLSCvQoqwWtfk1o1XMQXhCs70
 pBac/SOjyJ/ggiS6rpvTWNUe4Ai1CeASDD9xiHQxcYcbuddiPDHeEep/To9WrEqE0UO7nQWe/U1
 x2POKNlhYYQsgOK9Vhct+UA+n1/APtGAdQ79xhBO7ZP6Dh231OTrakQQIYsPmaeqXgTLpVk40Qf
 5zRfctGDdrkl6djJ5FQ==
X-Proofpoint-ORIG-GUID: _ld7tMeCDsbPM3gh9SfYyDz0K3f1trUo
X-Authority-Analysis: v=2.4 cv=NfPWEWD4 c=1 sm=1 tr=0 ts=6a566f6c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: _ld7tMeCDsbPM3gh9SfYyDz0K3f1trUo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1011 spamscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_181838_634063_66365F45 
X-CRM114-Status: GOOD (  17.84  )
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
index 0c53640c42a6..3baad102270d 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -911,6 +911,13 @@ usb2_id: usb2-id-state {
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
index cefb8ff00806..cc96442403e8 100644
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
index 3b0539e27b51..55a3fac0c4c6 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -549,7 +549,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


