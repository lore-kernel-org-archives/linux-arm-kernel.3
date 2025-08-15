Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D52DCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 16:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i5lrrc2avf/a05fFSkE1yarwBF8oN7CO+XYLX3+cBU0=; b=gYJwU81PbFJrJXfGS+hsTr/3zd
	5HUop//FY/l13rIAvUMgdHiUbc6OFjg4Spe+PudqRUGeizEgqy6Ii0KsoAhOxgxEMbK7hZAUUm5gS
	Wd8Qv55RanQGx4NcgvQMIwGsQw4DS2NnVd3itMjqwA7t2kg2coskDbt/p7r4B9FZ0HtIfU1RogDES
	8tE0Fj6O3F7/rWpI6EfrHgHSnM90xmz9kTq2Ozi9HmVhM0mHo6CyJCjQlr2OkOfwcHSEx/xWMYmcz
	PjFfgL6idE3qeZlIuCDNY6gOcH89TCnH2MGJAPg3ishZu/tbDR0QeY6ALBNv+VX+L9N9OV9hWSlBn
	zuEJAf/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxRJ-00000002zMr-0wM2;
	Fri, 15 Aug 2025 16:38:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvZ2-00000002jqH-19ls
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 14:37:53 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEJFJp031142
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 14:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i5lrrc2avf/a05fFSkE1yarwBF8oN7CO+XYLX3+cBU0=; b=nmiFe25XvVMso1Gn
	lLZBRnJ8G4H+V4CN7xAbTqbzeI1DmCo6p726nc1gFoxpqMkHSm5pl2FNhP4Q4Zxs
	S6f0MKxXXxf4dE6a2wOQJ+aYlOhRqEU8z+bFNEn9NkVDLAmGW6U0iFd+Gxykh6xx
	ke0oGTrB7MqSXt1ez9Mfjq/uf92PSMC2jN5dpuF+p4TLtzmH9Dg8aMr7tx/CkBuT
	Xp6+yAyEfdr5oczi8tABkaqyJkFodahG9SQ/Bdkj7mQy8AFfpI4+mK+e09gW8WD3
	6Jaatv/Pm1OSKqQtNt7WEQo+jvU14+Ru0KBkJIOa3nOw7HIAKV9DPx94nPl8c1A2
	F5cYRQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vx4wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 14:37:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e2e5c4734so1865999b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 07:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755268670; x=1755873470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5lrrc2avf/a05fFSkE1yarwBF8oN7CO+XYLX3+cBU0=;
        b=hzQpzqvOV7+ZR0Hi131rw34vVRnXyNIuQOwABgIi87QPQGs5RycCYlvPRHKBdvuiAv
         nXD9j/C1O9Mw7DyClCS1S2MH1ZaUmmNGumPDo+NPHXfTN9WMUjBcx5IEdtHgOqHUY6G5
         eOzYyl032DiJX5jbveRIod2VQIcM2OtyGeueiecnPnETyWP1ecuDP/WTL7xitJi0+MGz
         cxic2LsncI4AH8uqh8H+5YP3lfY3GCKSKUqAeJFFL2iaUeecUOueSfoeYwEsB4GgK+l/
         lPSVsH3+yiLp0Bi1dgDfGCeJj4VVh12gexSWXms3xjLO2NM1NG/tnwp47dI2l50Kqnu5
         hgrg==
X-Forwarded-Encrypted: i=1; AJvYcCX5Z0+6mCbkXhhzM7xcCAU9gWVFfrImMYNgXTAv30/giQWGFNT3nPwzNguyB63mDuwgh+WhNF3KpCD/cdrQsPNZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxRdDyDwhVwuZklPtAezlknCf/XAXETjoUm8AcyEekO8yq92o3n
	ByYX1+DsH6eTroQaKpeXA/12M5/UXN396V19GiHSUOhzpGxn34cFagQBJgLClvd1Bykzurim7T3
	fCrRMnYeaT0ZBOfWhV0wfZF+kQG4tY/6qPyWxLMjGhJoz/0U3UZdrf0Lf8lHaIM/RyLDOvyvbez
	EBVQ==
X-Gm-Gg: ASbGncuROoPqSX8hSMQhOrf3fgjdYoajjdr34QgdoVeXgfOJuUcu4FjilNnb87fCkws
	AOMN3yFsgLtnnCHxFCQq45Y9P8jAF0u/GWytryZEAPrkRD8s7+ktPwwAPhP8q6UIWvWFCQ4q6No
	CgV++Bx2bnR5Yrg+bL+BoYYVOTWALhi5fS+WYyLbCdfUOIy2ANNNB3n7kzJYYBvzHnlkIIOm4va
	mVcv/NcUsMmJWFhvhCEug76gozjZIFwOEijJE5aOwBHEJtiE9PXPki8UfemkuSxlGeqazIPQQXO
	CxvWH6A8i3o99ircopattsPCjHABZ81gJWuvohLuTWTxx5WS2Xi6jrkzJ2mJRK3L/aeOtqmKYOS
	H
X-Received: by 2002:a05:6a20:a11e:b0:21a:d1fe:9e82 with SMTP id adf61e73a8af0-240d2f2190dmr4146130637.30.1755268670046;
        Fri, 15 Aug 2025 07:37:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgzJYKQGF6HZbbUlkil5MvM89MNKhgpQynDfRIXAkhE45tUGeJKiRVkBH5qpZTooaymsp6Tw==
X-Received: by 2002:a05:6a20:a11e:b0:21a:d1fe:9e82 with SMTP id adf61e73a8af0-240d2f2190dmr4146065637.30.1755268669594;
        Fri, 15 Aug 2025 07:37:49 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d73619fsm1437576a12.39.2025.08.15.07.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 07:37:49 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 20:05:15 +0530
Subject: [PATCH v14 10/10] arm64: dts: qcom: lemans-ride: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-arm-psci-system_reset2-vendor-reboots-v14-10-37d29f59ac9a@oss.qualcomm.com>
References: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
In-Reply-To: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
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
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755268580; l=1694;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=/6iy73dToa0i0suzb1dVfuaLnEqyIE2pxMqX2jMdr0k=;
 b=GVK2pWwSQM7mtpgjB6rhLQwgDjqbyLzua5XFkOc/igbeTVSvy58+vU14vmU0QTk6gS8dAb2Ji
 c0DpCdq3PJFBnBgg7nhR6dYlM97gnoUxLnYhZvf4MXEdg7rrxKGCddi
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfXw9Wn33QaHJaB
 0HgvDIKIoB+t72lmz3OShbIEPdnBRpKzXT4T4gHa+shE79/Q9ASBaShtPPvQNvwH7GWcpf2iTNQ
 GqasF4PK3b9OI+s+F0eL5Y8JnGQjTn6fqI1Llt0PL003u/3h3Oa3fQBgFG8uy27wxrvJfv6I7Fx
 7nBIsoCzEVWYeQZt7eh1FgAHgvlwsoBauCxm88zq09wlbutfVdXtuhLdI8hLKXUazVK9/HXBllF
 Cd2zlOQ7PDY8qSGJD9ik7jiYi3DU8xrsYPSRzbzU9RAH3irOM65r7Gxop0oXTo/Sf5zzDm81MxG
 /r6bEZQwSsYkLoDTbzzaZGtw0YhHFbR+PeZhzLoP1s0YsQLJuELDrJO71sdbhDq2E1fjN9ZFkjY
 cLnqhDmc
X-Proofpoint-GUID: Z7N1-hcykk5RthVJeM04om2seRzRqXv9
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689f463f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=w06kbW2hXDg5FjFnD0gA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: Z7N1-hcykk5RthVJeM04om2seRzRqXv9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_073752_440322_3FC05077 
X-CRM114-Status: GOOD (  15.65  )
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

From: Elliot Berman <elliot.berman@oss.qualcomm.com>

Add support for SYSTEM_RESET2 vendor-specific resets in
lemans-ride as reboot-modes.  Describe the resets:
"bootloader" will cause device to reboot and stop in the
bootloader's fastboot mode.  "edl" will cause device to reboot
into "emergency download mode", which permits loading images via
the Firehose protocol.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 25e756c141606fbe0876ed48a54809b372650903..016f0a93a432b5e3f5b095b428e0c3de026edd45 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -722,6 +722,13 @@ &pmm8654au_3_gpios {
 			  "GNSS_BOOT_MODE";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 64f5378c6a4770cee2c7d76cde1098d7df17a24a..dbcda335fe117e608950c20de9a87c7eeb6b5475 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -620,7 +620,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


