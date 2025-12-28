Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0D3E784BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 17:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IVcTn3KqGR/L4VgGa1zjn9+vt8y24OHnRTPtAi2BpJg=; b=yvJ1OEsH2oobpqN3z0HRoiDB7t
	N9eYDEeHU4QQgVulptNBAiOgx1W+oH9R6i7G6sBqLOyUDo/5LK4K/lPt2ncJNOH/bKmecNeCziuar
	kDANuDQXMJHzlpG66ghM9B9g2P+6+8qrYAE3ET3C1pr36nuIt2K7/BcgQG0BBEf3TJEFsmyiPS0gg
	vr11gI4WRk5/HsDmDEInZz6zDDadsa4wbBVoIZbpXuaUeZg+CaEav6i976KLi2ECGe/DsJFt+E1AP
	RB6BauBfh2XHKgj216qJJeLETsGA9BF8Jse+rgDUwmHtFM3siIas/66HRm7luSkw++lIOf13CmeBY
	3IsakXmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZuS4-00000002uKf-1zm8;
	Sun, 28 Dec 2025 17:21:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZuS2-00000002uIs-0hBv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 17:21:07 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSAKlo72320151
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 17:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IVcTn3KqGR/L4VgGa1zjn9+vt8y24OHnRTPtAi2BpJg=; b=pZ2pXMZTL/YK8WqE
	Dj74KJaZ8Mj/3oyXl3NgqX2nV80RXCC9TKWYKLDd4N+sl5qUYDuqUpoQYoHygVfj
	0ZdFSDEUpYZ9FZWCmtmxrIfGgM4pflE9q8Pf8zLZkxTsW94Xlne4iN1VcpHIYM+g
	uuWROg/eOhJuF0IuE8C/vj4XVsReNn+K7lKLe/p7ommRYmnz16VAdC7D6zwdx+C/
	SCh1CtMpcwqMpknAPlqOeyPxKBJ5yGGyoXdJ5YBvj3Pe0oqeBtQBayxPnpIjDGJN
	FmP1YH4IGYUImZHLxI8SZs0f9f7+g3HYBPhF6daX+qQsuELscAd6eAQjszbYCAJy
	lhpfZA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba55e2pnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 17:21:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0c495fc7aso126273785ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 09:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942465; x=1767547265; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IVcTn3KqGR/L4VgGa1zjn9+vt8y24OHnRTPtAi2BpJg=;
        b=NS0ZTN7r3moIxP//gqB7TVvgtcA4wm9YY+exXj7hhiZnffgsq2+gJCGW6hpNwB5uzo
         LJIfRJxkpZBrrj7d/OS6MVLWUiPGGZpiLWeczs4klicFeHOo7JQmj4JcVfrF7CbNjFUU
         5zhjKWIi/1IWU0E/aPBzqUy1gV1GfsYdq8lX+W+dGn0JgtXXZ12nFvttB+8DeK4tV09/
         GlDQkebFoDXpyfydqueu/uj8JnyZPjfY/6AShlFK1WUSaN+/Pa5eugrlw9YvNEAjaOJ9
         o+z/clxgzXYTGbbl/lcIjqPbicrMnlWL4Rtd4SW3i8EZCrOx8/T8IgCOOYYXvNCz6jd9
         f0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942465; x=1767547265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IVcTn3KqGR/L4VgGa1zjn9+vt8y24OHnRTPtAi2BpJg=;
        b=q50Ee4KN3KnJYUtjfK/ZzMGH8PvQ1rmimijFtSSp+IlQiQ8W418YE/kLWiiqjKtHgs
         rmc4IW7JDhea0RN5f/7ZLDdj72SXC8NoG8oJgIWKwNLemx4plKiPkyPVMajurM+n2iO+
         haxp/pVsyHUc9aVwu3hE8dHrGmEaDubaYXrbs5qu3A9QkzlrzWGo9FExCzk5F+XR0WY7
         n8vCJNwjqf+Manl6PHbjFeOikS9OUf8sMK0Y/2/SopO7VIoVHPhF2IJ3gc1VPGpAwnTP
         0iZPi/XK36xlH0l5UJdHVtzPFXG5ajH3yxa82XNRexOwUK60+ZP/2+/M/6vnkaPsqvMI
         Xh/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXeu8y37OAjo+eN7HgfGm3m7BCzMaXK/hJXrxZDfdWiHSdYUKfJaNShXnaUsL7CW0SBzWsQU60yDd+7n9PyCKm/@lists.infradead.org
X-Gm-Message-State: AOJu0YyPu+b+9mTKruuqEc4YyXcO8A7SySWffDWY0wZ/p1lkoJVrcaxu
	uLelkO8lG4hDoGFhx6i2UnusK3R2znNi+0KMsuvzvbW+IiOCrrXsTesApL//b2KUmmVvWJEhDtl
	jxcD9T1khoAd1hSp72pThucQT59Q1fQMgI4LvduHUA45zcqZ+TQmJQVLKJ86E2ESE6TdeiwGAfG
	x3EA==
X-Gm-Gg: AY/fxX5JlkKc8LWpAb+xcboacc2athS88AbQdlgF4v/ugUjazD1uHDgEgoutufww/AS
	cAY9UaiewICsilOZOA6+SjhhFlx3r/w3bvLii1760tga+YMT0wPPZq9j+9sY66CieITDrpSAoLA
	WquzGZK3hAhHUoM3OjPQ5hyxKsYcQWVzUAFP78OkChzU9NeQiL7ugXY1gIk2a3alr38xC+VABJA
	5G6WXwfepCtnMc5zestCeaGB8a10aEYSFveKzGeqIimgShyYYz22xJ2R4M6hXUad0ClKL9mcjo2
	KaRKG7pCO2wAGAmrvFh+dyJh5UvaeKbD3ngtR4A8BDACuYq3OdSnfldBbTdsU1C10JjDJfJG5yA
	Q/HzHpHYK2rkWNJTd6CimAKA/0pIljUsFQFd7t9CyU+0PDg==
X-Received: by 2002:a17:902:f68b:b0:2a0:afeb:fbb6 with SMTP id d9443c01a7336-2a2f2202efbmr247419085ad.8.1766942464903;
        Sun, 28 Dec 2025 09:21:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvLWJGvwwSQTUevMZQ5PBmpbNhxoSUnp1idgws9zQOSNVHlKUJTahTxvetNh17hCPL7TDtLg==
X-Received: by 2002:a17:902:f68b:b0:2a0:afeb:fbb6 with SMTP id d9443c01a7336-2a2f2202efbmr247418855ad.8.1766942464387;
        Sun, 28 Dec 2025 09:21:04 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d776ebsm255743965ad.99.2025.12.28.09.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:21:04 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 22:50:22 +0530
Subject: [PATCH v19 04/10] firmware: psci: Introduce command-based reset in
 psci_sys_reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-arm-psci-system_reset2-vendor-reboots-v19-4-ebb956053098@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766942426; l=4358;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=LHOC90yAoiwemIEAKL3+u1kkTKM+A1ZqtQ5uNG8qwD8=;
 b=sWN6sTNCRcdeGqX6q7zskFmdTLAQicaxMgOh0lxtfbIU8M9y9rQgQsYsISuK6JP1Qm/eaa0cp
 JuLYxzWfqgIDtw8t8c7Ba8IvDrELeHysFF5pou+bwpIA+SelYR8d0P5
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OCBTYWx0ZWRfX3+8hk7EF9xEu
 n7Qi9DKwTRE9EqiNa5F5Y5uA4PjFxfZBQGvmrHudx1EVe8EDu5D+XUJPNkoFRUBBOCGxzQQk2B/
 Tbsf2H4GzUlqxnHpz3e3fbsiKbO2nSmPL/VcyHZ6avv6+FTsXfqsO96zA07xmjiM9dMFE6OypD8
 5KWRoGzKtNvQNWG8u+mzHODs4droGdsTH770o3wjRfmHq6kC01wP14haIvkWEjLPceDvCT+9WU2
 KhYR8gR6SE+ecpLqW2fiOfFWhZFKdVbY1IGknALg5xCQHkemaeBi2B4t/w7CQhmCczNFCk+yODD
 iB4EpVJJnWOEnPHPc5KH1hFcxCEojkIfzVXeia4mJRAcaMRIBPoTGHamLEOWAoUf6zI3V82GzMO
 NFmD5xCswBXVT9VqibSqHXdsNQSnAWdNwgnGn8yz28lMCglL9kVGm3HcRy9Jn+Qfdu74ddrJxcT
 l5cpksKrEw4LbJHzABw==
X-Authority-Analysis: v=2.4 cv=UMDQ3Sfy c=1 sm=1 tr=0 ts=69516701 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=eczEI0HPkUfQIoTEgvMA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: xHgQTll8437GfgdhE3Xndd3e-xpxciVu
X-Proofpoint-GUID: xHgQTll8437GfgdhE3Xndd3e-xpxciVu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512280158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_092106_219166_DC5B67BD 
X-CRM114-Status: GOOD (  22.96  )
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

PSCI currently supports only COLD reset and ARCH WARM reset based on the
Linux reboot_mode variable. The PSCI specification now includes
SYSTEM_RESET2 for vendor-specific resets, but there's no mechanism to
issue these through psci_sys_reset.

Add a command-based reset mechanism that allows external drivers to set
the psci reset command via a new psci_set_reset_cmd() function.

The psci command-based reset is disabled by default and the
psci_sys_reset follows its original flow until a psci_reset command is
set or a kernel panic is in progress.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/firmware/psci/psci.c | 46 ++++++++++++++++++++++++++++++++++++++++++--
 include/linux/psci.h         |  2 ++
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index 38ca190d4a22d6e7e0f06420e8478a2b0ec2fe6f..ad7a3267276f9e26740aea99c11f171ac715f9ba 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -51,6 +51,15 @@ static int resident_cpu = -1;
 struct psci_operations psci_ops;
 static enum arm_smccc_conduit psci_conduit = SMCCC_CONDUIT_NONE;
 
+struct psci_sys_reset_params {
+	u32 system_reset;
+	u32 reset_type;
+	u32 cookie;
+	bool cmd;
+};
+
+static struct psci_sys_reset_params psci_reset;
+
 bool psci_tos_resident_on(int cpu)
 {
 	return cpu == resident_cpu;
@@ -80,6 +89,29 @@ static u32 psci_cpu_suspend_feature;
 static bool psci_system_reset2_supported;
 static bool psci_system_off2_hibernate_supported;
 
+/**
+ * psci_set_reset_cmd - Sets the psci_reset_cmd for command-based
+ * reset which will be used in psci_sys_reset call.
+ *
+ * @cmd_sys_rst2: Set to true for SYSTEM_RESET2 based resets.
+ * @cmd_reset_type: Set the reset_type argument for psci_sys_reset.
+ * @cmd_cookie: Set the cookie argument for psci_sys_reset.
+ */
+void psci_set_reset_cmd(bool cmd_sys_rst2, u32 cmd_reset_type, u32 cmd_cookie)
+{
+	if (cmd_sys_rst2 && psci_system_reset2_supported) {
+		psci_reset.system_reset = PSCI_FN_NATIVE(1_1, SYSTEM_RESET2);
+		psci_reset.reset_type = cmd_reset_type;
+		psci_reset.cookie = cmd_cookie;
+	} else {
+		psci_reset.system_reset = PSCI_0_2_FN_SYSTEM_RESET;
+		psci_reset.reset_type = 0;
+		psci_reset.cookie = 0;
+	}
+	psci_reset.cmd = true;
+}
+EXPORT_SYMBOL_GPL(psci_set_reset_cmd);
+
 static inline bool psci_has_ext_power_state(void)
 {
 	return psci_cpu_suspend_feature &
@@ -309,14 +341,24 @@ static int get_set_conduit_method(const struct device_node *np)
 static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
 			  void *data)
 {
-	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
-	    psci_system_reset2_supported) {
+	if (((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
+	     psci_system_reset2_supported) && (panic_in_progress() || !psci_reset.cmd)) {
 		/*
 		 * reset_type[31] = 0 (architectural)
 		 * reset_type[30:0] = 0 (SYSTEM_WARM_RESET)
 		 * cookie = 0 (ignored by the implementation)
 		 */
 		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), 0, 0, 0);
+	} else if (!panic_in_progress() && psci_reset.cmd) {
+		/*
+		 * Commands are being set in psci_set_reset_cmd
+		 * This issues, SYSTEM_RESET2 arch warm reset or
+		 * SYSTEM_RESET2 vendor-specific reset or
+		 * a SYSTEM_RESET cold reset in accordance with
+		 * the reboot-mode command.
+		 */
+		invoke_psci_fn(psci_reset.system_reset, psci_reset.reset_type,
+			       psci_reset.cookie, 0);
 	} else {
 		invoke_psci_fn(PSCI_0_2_FN_SYSTEM_RESET, 0, 0, 0);
 	}
diff --git a/include/linux/psci.h b/include/linux/psci.h
index 4ca0060a3fc42ba1ca751c7862fb4ad8dda35a4c..d13ceca88eab8932894051e7c86e806c2ad8a73a 100644
--- a/include/linux/psci.h
+++ b/include/linux/psci.h
@@ -45,8 +45,10 @@ struct psci_0_1_function_ids get_psci_0_1_function_ids(void);
 
 #if defined(CONFIG_ARM_PSCI_FW)
 int __init psci_dt_init(void);
+void psci_set_reset_cmd(bool cmd_sys_rst2, u32 cmd_reset_type, u32 cmd_cookie);
 #else
 static inline int psci_dt_init(void) { return 0; }
+static inline void psci_set_reset_cmd(bool cmd_sys_rst2, u32 cmd_reset_type, u32 cmd_cookie) { }
 #endif
 
 #if defined(CONFIG_ARM_PSCI_FW) && defined(CONFIG_ACPI)

-- 
2.34.1


