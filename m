Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06554E6FE24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 17:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IVcTn3KqGR/L4VgGa1zjn9+vt8y24OHnRTPtAi2BpJg=; b=ZTFD1YDHV6k8A9lqUh2ny1QrMz
	6PKpmVGVJD81tKUc3aEc/t3mj9lpFngVAOHmQszGl/vioAwMTY+9dJuLUDk5FnsIAWqcolZkiAcio
	Mq8x4kdOOj//4yJ5iu1UJ0pkMqDTuf+NS7ib34/ZAyoNnJZGnstWT7IFtJCQx5MfC7ic8gATYr6rY
	2pWwdxjnfykR2efAcTr4RgskSwwaJXp53T4QwBjiJe8yt0tCE2bHEhOoPORg16wZAgJ2XvxPpNXq8
	OmLtWWh3NB5o/wmfShaoBR/93HoaYlHVgFDzVhugyBOkx+ognxZC2Ba3N/E5b8nTNjywrc7C7iFTT
	A8PHptwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5s2-0000000FnP4-0DoL;
	Tue, 23 Dec 2025 17:08:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5ry-0000000FnNA-2kzW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 17:08:24 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNEs5Rn461728
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 17:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IVcTn3KqGR/L4VgGa1zjn9+vt8y24OHnRTPtAi2BpJg=; b=eaSiNtgJDlycVQhV
	X864m3O1qGZG4dgcW40DVaZCLClXe8nItZxOImLijanlTPZffDsM3yLMCgQUmk20
	+PJfa2bpCVtHlB2GUhdgaMEwhBOdqgfIjNH6xrXkw6lqcCQ61+MKz9CFzQ7GqZuR
	XwTAtnwkJAFT2IS0uRK/nkJryOzDALooUm1vAibwr+Rtl38RCbkX+2sKxWc+7eV/
	CYn24VR8thvP3bSZgh/xNxKn34c8l02xhd1eFGJCMaEjaE47vrqczpG5EEXTQLK5
	Z09bsd7v0hJN/rZskLbKtxBUi7gMZTWk0jWfdfrGmX0rTCCoZ7g1YTJW/9rW6dK2
	8ETyrQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8frebp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 17:08:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f26fc6476so84241745ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 09:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766509701; x=1767114501; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IVcTn3KqGR/L4VgGa1zjn9+vt8y24OHnRTPtAi2BpJg=;
        b=EAiYrWu9j9om7kqZRe99ptz8sb05hOvt3JwntprtIUIwYNGiHC8t/biDJZe07nbdOx
         kuJG5Z5DmewIj1s0xZOlQnVB0vM7TL1QLDU+Mri3cAKIN/qP2rgLLJJMJFj2PY2TLejQ
         /bHk899AIlXWWGVYgfMYRvqLfKb0R/+SI96djVFBEIYbx9bM5UW6+WOvggwAgQmA1Ogf
         OPfZcvlatn6YgxeHUc7uYIEV9fDa27yosyVGUQiyyEUzhc/VpUPfgf4YdFa9kSfbcYsz
         UhCWQ2tbsspgtqi/cASBKK+wv2Fx4IrezC2tIgXoBq0Flr26ha/7hk+jjSmqtZpACIsm
         5cgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509701; x=1767114501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IVcTn3KqGR/L4VgGa1zjn9+vt8y24OHnRTPtAi2BpJg=;
        b=fsLInw0QDq+y3AHxYRi/t7zYZEh2g/wbGQdB9M0WEjHEVT+V1R4ijVeYsOyd+xdNC/
         qroB9X2VZxGnVsbPXUjd+/5sMuI0p9EpougMWGN/Iv99Ct5W+WMcxAz8pFHlYbo4kChb
         nZF21KTz7lf5lzk9m41hQqPmLRI5znndpnvugNobeDFL1HXHttVS0znHYR73Xpsfh+ru
         HPzJRC/mECOvi7pbAtY3usGKxKavSnPYNDl+MMKwdwFAQ9I6cqQHF+42SXClYcyQswzu
         uVy97aUCUI2YxKKBvUQ6uxQzZ2rBlWQv1f4Qv0nmPCAuuocOel2y+SoINU8vI4m5c/89
         fGUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpFdL8loYKfAygqFL5Jv+ZyVAlTtBM38HtmMccudIwg4vIzcaQ2wxoPpEw/M7nCwvT3HuuUq6LMDLOjZUz1lQG@lists.infradead.org
X-Gm-Message-State: AOJu0YzTwJfki9wYLBAd3onFxMUj/9SnVsJLW+6oVtNuzDzkURCgL0Bz
	HAZ0fRkJKVGFbCaDSON+16Zol+3HchXQW+LhM2IaSRy/xwHqD3m9ldOUzFtoVkZHVHlXDpvClWM
	9rrsh7ZpMfqV/2tPW86NeqnS23vG0Gaya4wd9EnzxvQeGeMtM2Iad7YcbtE7sKi1IjevT+n75p4
	YhBA==
X-Gm-Gg: AY/fxX51KcmRifQjo9Vhh2vHJov72MYyw2rtkGOlB7v0Fnjl1Je+5xJKkvYLk/GQG/0
	rOhEQpo1OjpG7RgzCSdtvYjfKyDEltrqs0jvoZiwTrbe2fnNqCQhp8aCMX5E033hZs23/9U6PYW
	oZ/vZrdigwRYESkT3jzHBIHKHs+L4WiVU2xS6p/vCiE+5yBeEaQdz8qrLYMVHxY0Hb9e+y+f0FZ
	fdbJ9IOZ9Ro8/UcTUuLNc6ZIEcLU3aV4ABmUgHWz9L1CBQMnFOnJ1g/FFh7e3+pw5aTQjucvwPu
	aGHuWOXCE02g8njzxwXG+lBXzmM9FENz8fCQ8mrjNvxGgZR6tqG9utif6ORh4hVCCm4ftNKDgd7
	lHgbDkr48XZfgGxft/DEv+iTIT1RZLBC9t810tCyT5o8Gxw==
X-Received: by 2002:a17:903:22c8:b0:295:425a:350e with SMTP id d9443c01a7336-2a2f220d13dmr134701795ad.8.1766509701391;
        Tue, 23 Dec 2025 09:08:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFk26fhnYgDTEBsdmUUC/AAEsrc3ujLIZgh5oYX7oAw9+/sEzso+1u3bhLOC4iE24161w5pTg==
X-Received: by 2002:a17:903:22c8:b0:295:425a:350e with SMTP id d9443c01a7336-2a2f220d13dmr134701475ad.8.1766509700852;
        Tue, 23 Dec 2025 09:08:20 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d863sm130019325ad.80.2025.12.23.09.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 09:08:20 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 22:37:35 +0530
Subject: [PATCH v18 04/10] firmware: psci: Introduce command-based reset in
 psci_sys_reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-arm-psci-system_reset2-vendor-reboots-v18-4-32fa9e76efc3@oss.qualcomm.com>
References: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
In-Reply-To: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766509672; l=4358;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=LHOC90yAoiwemIEAKL3+u1kkTKM+A1ZqtQ5uNG8qwD8=;
 b=G2fEOckFFDds6XCzFZhwADptUUMnJ0eihB+skHyOzPygTJJ3xdGdKn34L+Hlizn54f63bVHQz
 E+QxO/wmQH4CxHYMORTMG69KwQN1FeBJPNFCbu3mRinGjzOiMVdoFHb
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: -uWvVF-6iMR1WwCCDVZHz5aCAHOIha-b
X-Proofpoint-ORIG-GUID: -uWvVF-6iMR1WwCCDVZHz5aCAHOIha-b
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694acc86 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=eczEI0HPkUfQIoTEgvMA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0MiBTYWx0ZWRfX0fzkU9iQ7bf9
 nar2+CHEQp8q3GEv+afcX08zeoFpMYIWTqpqg9wJlxYwsPUjh9QPjFb+Es05kPRpbGBEOHN0Apl
 /8KFkAY9A8wQY6LlAsU0HlVPvuC7VRfKVh4PN//YQcmsLkSWg4RDcySTzasOp3friDPByLsXvRE
 AGLv6DQGQZCb3KIGv0SnV9QZ/C0n3C3xTCgyTIToMBcDilzsfkDwQs9ugESEgbpzJmrA99lLuKI
 XoErCwSAuRkuIOXXFZjD3M6mydFz8o6L/wqeLWZDOfLTWro93dsNUJ4IBIBy3D4FnLUD1FFfsKo
 jyHcQRMNAYkPGLTn9zWhtll97H1dK2R7xl5PGySJFvnnT+nyPMToln4rnBgVBKl4WIjclRoTZC0
 1YEjRz3aPc+Lw+IYMUliyLY/GMhJq36ob1hgwlomd2EFXj3zhlYk1hMet/gAkQqls18B8O8xjvg
 LrkA+VC1+GZFI53PBqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_090822_711283_87FBB60D 
X-CRM114-Status: GOOD (  23.10  )
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


