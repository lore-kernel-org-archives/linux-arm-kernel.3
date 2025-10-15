Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B95CCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 04:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FjTIG/ndF7kmFm1KFgILV91linf+L9tY7iP4vjPrynk=; b=pF8IbDUGNxzX9r+jbU362Zp5ze
	VoC5P6ABVEDoQ8N7Vf8YyCw+2XhGsvKJmnFmYGDpeg6/l+Oks+Ikdb//tgeySxYOi90wdnsOZxxj7
	K+/pwFLwN31BdKUsDVf2gzWVQFrpDCt88Fn9gthwCRRa/jZIAV4rZY/izuABTm/mAiGxJZcf+nr2p
	a5I1Cf1wnErJX3oDTHrDK5pupV2WSKB0Zo3n7dZUa7xjm88bH428pU/bGuhxQB3iylvypcQyqO1dx
	XAS3VgmXwIlPWa3hk6r5BtANvAv5jHzJp8UqfT+Ng4NkIsdYC5MvDjLo+iXr/mxheTxNyH5WFCyBQ
	YvpaO9Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8tJY-00000000SDS-23PM;
	Wed, 15 Oct 2025 04:40:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8tJV-00000000SBh-2gts
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 04:40:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2s7ET002556
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 04:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FjTIG/ndF7kmFm1KFgILV91linf+L9tY7iP4vjPrynk=; b=AXIkmmS9pyUzo8Fv
	mqzhC/7w1zqpq7LEELCMAeZfUp/tUE3Pw2LzkM2ADMTgtmQn0Dz6bjoQ268en2oc
	Btih0GGoPVefXtxa7nawCIUFSvw/Q1gvNZEzNKoIK6kUR7wmdIYX1g6cDqcVDumO
	5jzEPWN1pS1cwOLu3temVqfElp0CZGV+fERihcitO4lu1OubgNoC59ZgaZk+W064
	W6+iWDdp8CJI7HvbAGBQGBvfa+TubtjjU3f/M/Y7jULovKylIM43lIHwiilMEuKj
	wAAqubCc9k37hp5tCIF8YveLoziQds2/sO/txarRnJ604qw2NAz6Bouxn2yx4XpO
	z2D77g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd934e2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 04:40:37 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b631ba3d31eso9195934a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 21:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760503236; x=1761108036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjTIG/ndF7kmFm1KFgILV91linf+L9tY7iP4vjPrynk=;
        b=l9JkvjwSGKfSaYJE7WvPo31wBH85499KekYNHQIV0ep8gXx+fqHQPYYWT8via5Fcm8
         GtVZeYBbxm6fcsgQq2/WmQXhh4o2roUESBLJKIRUGmQlu6gzcKgeVNWZYMOfBJNgVeum
         BVqHn/oFTCW/Or/EUv5Ww59fskAbZakv6Bkc9HfGLFdkYPk+3+qG8hn66SZQLZ4ZdBZK
         byeSdR+zmAXYHzu0eg4kjJ2Zbpr4bYgawPT499K+NoNbagD1sGI6Zq9ANnsz3WvL4jRm
         3GK6u58QNvCKIROswhsitdZ4xpojecBsYRGH2ADILpBB56ODW9TIY8iKNK+T5HAgN+6M
         jpHA==
X-Forwarded-Encrypted: i=1; AJvYcCVKpE5oisJ79FSn5xpnKyJOT7esFXL0q89aFsH+05JEOYTxRRT+pSaigaXEA2ckq2lBz52TzaEV9s2SQLtChfBd@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvb+qQRWpbwZqoXxCaWWsT47xRpRFgc15oCRO7SnQV6PK+9UcS
	G3Fyo8dijJhClcPrei5oeprvZ13OgURGek4q4Y8ueD7uCOjplGe2Tl9HKIcNJPlenFISXICpA6T
	S/69zJFfoTp5EKkwxsAKfl5eNsvxideR7YNHwbhkVt4kiCcVxGxhRWqIgbzt9xUBVhuA0PxGC/E
	c/7Q==
X-Gm-Gg: ASbGncuKuZvdW7ctNbgje5k/Jx9/QfTysDL1wHzNEQwEINySDpeitAOviG30a49FRjK
	yqA7ZPlPlVMGqE4Z37cBvy7poECsJuA6xzjB0Q8OjZwml1dZKTq31xL1n4kc73Cu9K1wbbKuaa+
	6CevjqdWy888aT/ziKwAGCGdDwzqdr/8xEKq2MN7ZiefGUVdoVJmVj3mJaoSRqLuHjlkh4RrmdB
	d5BR0CFdghT0P81wCreqz7GtYahVBXTH0B4WHAgPcisHj5W2Q+RavMjAyiRHCpYe3iGzBZ7lNxU
	bQ96zkyGsAWzlVWfFAR0lnTmY6y0cN/6ryUxpbLIETs1TghJ5HB1LVT3xwRHVTynt7QrgIWM044
	2
X-Received: by 2002:a17:90b:3e82:b0:339:a4ef:c8b9 with SMTP id 98e67ed59e1d1-33b5127ac7fmr40641878a91.17.1760503236339;
        Tue, 14 Oct 2025 21:40:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHu/fh5mCQeexri4hyHIJ+5znOiZF1zUORQzO6knj6EhQWcqGep8TUPRpxsCMjewhs+3tmVA==
X-Received: by 2002:a17:90b:3e82:b0:339:a4ef:c8b9 with SMTP id 98e67ed59e1d1-33b5127ac7fmr40641846a91.17.1760503235839;
        Tue, 14 Oct 2025 21:40:35 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9787af5asm705406a91.20.2025.10.14.21.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:40:35 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 10:08:28 +0530
Subject: [PATCH v16 13/14] arm64: dts: qcom: monaco-evk: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-arm-psci-system_reset2-vendor-reboots-v16-13-b98aedaa23ee@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760503106; l=989;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=9IjzMJlN9zEtU0sFSpSy/h7SjvAv8UW5k17M6MwN68E=;
 b=eKdR++dyMjdBMNY36k2+x34nY+d8eC3Efd9IO354picD4bMu6IjS098QETQt+9/1DnVL0mhUr
 2ovRz701RTgBcARNwJjYePv/sDEKqx+Mar0UMjSJneEp3CIfL5qmXUA
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: 0bwo4oNh1jhXQV4zHVtsivwuHl8-2_4g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX6jHx1yWfQfTZ
 t11iL95AYkcSePphGtQdJEkWWSMc12w9K/O9iY8vF34akFW+5+NMKM4LGdlZvizZdjdxyDFeOlv
 ISGsqlUJGhWXV6PKSQ32Adoo+Pz8uti9CMOygkn32hHnz+FqjEk8UtEkvZXUyBLcXUr9H3rVUzl
 JlfZit8IpCMv5nZDfieVNAfQzWljKopMeOossNrIdW0DypGgQ86EJtzWIVkvKyIOgSOs8iT/I0Y
 PZmvdlMYqEDGwY/bO8u0XivyVYLsBSlkwqyDO+js++5HVFnLrCvdChm6YbAQSrk1ZEALc2saaqp
 0nRG2CPZ3JhfoMxzhhkN/7Kc9Xw2hkG1jquFHZ2vrhorBEVhD8QP6lQr19ps4Qd8Q2ywoD9gvtO
 PJh1rQJpjAQ+O6cwTSoRVPd37diDjw==
X-Proofpoint-GUID: 0bwo4oNh1jhXQV4zHVtsivwuHl8-2_4g
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ef25c5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=JGo1Z14By4IpQyqbhUIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_214037_692610_A6A51049 
X-CRM114-Status: GOOD (  14.00  )
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
monaco-evk as reboot-modes.  Describe the resets:
"bootloader" will cause device to reboot and stop in the
bootloader's fastboot mode.  "edl" will cause device to reboot
into "emergency download mode", which permits loading images via
the Firehose protocol.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index e72cf6725a52c0c0e017be800bfac1773fad1059..87d613094e551e1c3b56dc45362a588eeae07444 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -400,6 +400,13 @@ &iris {
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


