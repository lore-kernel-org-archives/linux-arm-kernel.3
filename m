Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99677CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 14:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XptDc+YZFL8JqGr8hCEtPLAIPxbU2ERemzFyFeabLdI=; b=W1/AO+XloRacEL8WE5BVeBYMom
	LDMCnmjCfI8eKFcyf4fhsIz5SBYj+fK2CSZBO5ZYwXVYEIco6pHr4mDJRh8VjzJMyGeeLXiPFAN2U
	5OXZtoOSxctyke6IpMhfZaI9G5Mcu8zK8qZssjdOZ4LXkIYyMBYkqwjcGVhDr8iEvLtqPqprqqLS0
	PpREJsSJKYDGgP4788w7x/OJIeVto4G5ZfJtBNaYRaeJqzh5uOz0vYWO+XA+FOlav0QhMHZLn5r6b
	AV7OQlMHn0v5vnWpL1AjST7UjGcsW71t+4bYhxM2rJLzs6VFj8DtA8+qjRm4tUaoWruUrgXAEN+8u
	2FXLaw5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI6a9-000000045lj-2sQL;
	Sun, 09 Nov 2025 14:39:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI6a6-000000045jF-2o0b
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 14:39:52 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9DuGZs484654
	for <linux-arm-kernel@lists.infradead.org>; Sun, 9 Nov 2025 14:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XptDc+YZFL8JqGr8hCEtPLAIPxbU2ERemzFyFeabLdI=; b=LouQCAfvJVsviDRk
	e4CY4qK42rhnC0FvsyR2Cy/0F5qmsBpki4Fqpd6Ilw3/karaAt+lzYTtsXLMiboY
	mGuBD20b1cO+uOCgAHGusvJJrjG69B990iYgFvyDpMKUHe6a5FNkPzQaoR3YQkt5
	E8Ffsahc1ecGoxpaiRw5CeSIuKs0Gdc9lgbNmxMnxMw2reAGoHQd66xTG0qrQI/Z
	F2fG3D/j4eD7tt/NfXvMq1u677K6Wo6lfeTiNyC5f0Lnht90N9oMjp0w9kbMurth
	m3ojc9ApXLNT4xSsyoZE38iKk47TJ2O/HR7iwTLi8vlqtYG0KvhnKRAHtnw00VfK
	dagjPA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xs7a8dk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 14:39:50 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b8f8e1f1044so3731936a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 06:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762699189; x=1763303989; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XptDc+YZFL8JqGr8hCEtPLAIPxbU2ERemzFyFeabLdI=;
        b=YIhAXxZdf4mIHUSGOGpKFjG59iWdBa4xnkf6ioMAaKkVrWlqiDN5Qel9Tb71p4mWfO
         3Gz/zMV+HWWhy8V+4DdZgPCrBE+FWtZavD5wThGkuY6yROjR7oI8kBTpzsw0Ow248oj1
         rZ9VU9TgIEzaoZZwuOzzHg/n0tWFbrhmnn2BVNKTi2cil6HfvpQMjsMxHI21EN0QC238
         bfPjuzhZiyvfWPrDA5kjRnQ2UhYe095ifn6029tU2b+fvHO85f8ehy3WtXq+/3Btn5N3
         69taMsyCCLwJCiuR8dkt5f3Xh6GJ4do9ux4EKnj5Wa7Qk5ncRR3gmoclmbr7F8bb5sl5
         qjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762699189; x=1763303989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XptDc+YZFL8JqGr8hCEtPLAIPxbU2ERemzFyFeabLdI=;
        b=JtCNIVQQ+Uz/bBy1atZ1G9DbiNNF7eFJL6gZlGPuohwofiy8Ay71eLGNNF2zteTwzS
         W4+sfx/ylCfhqjmmWQumHBFYNWraHC6cHEKEqNkDUZwzBmY/LeO3etTb6/H0eGBSnLVU
         6y31B2Abx8iJ7kbdN0HSOX53iRXfxR/7P/XUvvmyOuvycjHDZV7evp41Jqq9/nlEehiZ
         n1hrzyJqNswXG3X9PmrElHhij26NGQmPNKnD/kOfSkjuV4g0jG/OghvO9ANn72viWqZP
         2n0YxRco3Yjiq8zMb+J/w4uXW7oFGpZnL0i5nHBthCXMTFA/Gep+GO2s1/QZcOFH36U4
         BIBA==
X-Forwarded-Encrypted: i=1; AJvYcCUniC2dFvsLxk3kCRFlwlKjSOGD0wcDIMeOywdrGApUq5GqOk4C02l7+3dQgeJtWKePHcZqWGymrmq6DmCF4ez2@lists.infradead.org
X-Gm-Message-State: AOJu0YyNOLffpnQmcUodGcsC1+n+AQqCsH5pn0VZNdsiuCem0uk0Nvv9
	kwhN0Z95V4rOYRRGTwtbABJoxkFs0pZy4TDwtv27HKAs2m2WRMTTg4VzuZi+R3swlEa4D37qmkL
	SQ2BmeiLz3588U+efqwWtISQJW5LluQbLFfB2u9BkrMzdx1vJUPD7gtfa42VIckBbZrJnhOv+Nb
	MSjg==
X-Gm-Gg: ASbGncsUSUzLu18ydzlVoQU+Ss5Y0ZpfED9cgVM2fpyxbkUCBYZYKE6UqYJpj9SIg96
	lyVbg+lT3stf0fhwiBM3RdiKxPtQj/aAzVfhlzV/HSN4MtZTyN0w6Ib1puPQnkAU91vKDNJg7Yp
	WQmT2jIhd1L6v4CfJwLvV7WK4DY1253OHKQ1c3jbmggcMXBO5HL3Kbcw0gPPaV6Sf2nXpXDu8UO
	nDc0x1Hb9ER9XdtO8mQ79SSuNqhq4rgQhBxHESyJyKCvE5kztbGBC6nxPPBanPJKkHk7EMs/Pu1
	gWs/ZsYWYjZW26OZZp7dDwZypcvVhUlHbT1BpHrhu/AfJLyjdnqWWsQHQJN568YvQnBb5Ji6iaH
	ti3xrRGQGbapfM9nDfjpl8jCUpDpYQUQUryE=
X-Received: by 2002:a17:90b:254b:b0:341:88c1:6a7d with SMTP id 98e67ed59e1d1-3436cbb3db9mr5858488a91.18.1762699189605;
        Sun, 09 Nov 2025 06:39:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOq2jGoZdaGTg/RuLpVGRCaTMc0nO8pbXIWYTS2/MK7JSUVoJbW0TcdZDyaG0BSL/En7Uqvg==
X-Received: by 2002:a17:90b:254b:b0:341:88c1:6a7d with SMTP id 98e67ed59e1d1-3436cbb3db9mr5858477a91.18.1762699189136;
        Sun, 09 Nov 2025 06:39:49 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68a68e6sm14845401a91.4.2025.11.09.06.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 06:39:48 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 09 Nov 2025 20:07:25 +0530
Subject: [PATCH v17 12/12] arm64: dts: qcom: talos: Add PSCI SYSTEM_RESET2
 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-arm-psci-system_reset2-vendor-reboots-v17-12-46e085bca4cc@oss.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
In-Reply-To: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
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
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762699073; l=1067;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=0DTO16A80WGqaz3z0hmwtkj7NXigq+2LLdiQNk+Q8ls=;
 b=tP463FsuDoN9+kJtN2MV9dK0Lk1uV0U1Hzq/yfzIbjg8ificPJU+/kUUPfp6nFtHl03InJtGh
 9VS6Mie4djKAilbj5ymty9l4y4D5eBAcfYCHZhg23+5Kh3vudrPO9iG
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: h3aRU95unLfayaVFvT6RV8dTetfbeZH0
X-Proofpoint-ORIG-GUID: h3aRU95unLfayaVFvT6RV8dTetfbeZH0
X-Authority-Analysis: v=2.4 cv=LtifC3dc c=1 sm=1 tr=0 ts=6910a7b6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=4cuBwC7xTQKafrdxVH8A:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDEyOSBTYWx0ZWRfX4qJ2vEWXeF2F
 SkftobaQYOH+DXopHIpCMcukUxPkDFe7KmbTto7gMNuJ7jVNu5VHAERwPr+JvxMQNguqYSQEo87
 NxU0FFGRBQ28TN7CjkjBZMM92PjH/zh4DTrpY+ogZL7sjaR+GNTyHmynaOlbbwRjafLI3Uc7vwr
 moDiW6Bx8KfdsXmJVGO7W8R1m5Y6BP6I6Q28RRQeIh5tQ++LjvGcQcDitl/Oekq3XLcjx7M7i80
 C5XqlsXfXW4P/hwdiiOFafU0fesZydUsws2vtja63dcgiMFuId+ec7bfRL7FNajGIylLtgU0WhI
 i/IN+iYIq3GNNXB9U5v1tzSO+JlkyO8UHB5CeDTW8sGCJ105KP/OaGpGwPARilWHJeGPjO1/2nd
 pm+wiPZZwiCZx3bpIZLYFzbNXPpvJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511090129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_063950_933527_57188F4B 
X-CRM114-Status: GOOD (  13.99  )
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

Add support for SYSTEM_RESET2 vendor-specific resets as
reboot-modes in the psci node.  Describe the resets: "bootloader"
will cause device to reboot and stop in the bootloader's fastboot
mode.  "edl" will cause device to reboot into "emergency download
mode", which permits loading images via the Firehose protocol.

Signed-off-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index eb6f69be4a82ea47486f5c8e39519d0952b146cb..c946d07c540f5ae40f147ccb06539ecf0de18df5 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -612,6 +612,11 @@ cluster_pd: power-domain-cluster {
 					      &cluster_sleep_1
 					      &cluster_sleep_2>;
 		};
+
+		reboot-mode {
+			mode-bootloader = <0x10001 0x2>;
+			mode-edl = <0 0x1>;
+		};
 	};
 
 	reserved-memory {

-- 
2.34.1


