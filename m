Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD17C44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 17:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFHN2qyJOM1iC26km9OAgCA4h/0y1+tM0gE8VpSZk3A=; b=2n8+yTxhiUskrOjfxYVvQOpetV
	gGxBsD1mYFegNXRYKh0UqrZ4tmVx49uXwqDMPznBVAGh48cPrDw5Hp8+ul0Md/E4JMO8W9n0ucsUc
	nw03W/AU3Ji9O8djTDiGXeWEggipP7GcBBLqGHxkyx68BAdzjDqHqBgey0+qI9L+jBUdR6bbi19M9
	Sscj/MPohFbKmQ3b+hEGQDDWgVQWniLj8PadLSscZnAZwKcKp8Te1RN3AqlmngfU0w3wROkJkej/v
	KceRFxu+qTdr10d2EmHdTy+ugJ64OSkfWilHbeDdsA9PMPL3wJ455Xtkl2j6hvX51UAmYyaCDxFTV
	VTIHZNZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjglE-0000000Cjl2-04Ou;
	Tue, 14 Jul 2026 17:17:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgl7-0000000Cjha-46px
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 17:17:31 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6qoV1003055
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 17:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zFHN2qyJOM1iC26km9OAgCA4h/0y1+tM0gE8VpSZk3A=; b=FSxVkGw2uYfpzVjk
	oYLqIGkjTfxBsP/xuJL8NAT8OuDiLN8J9Sf3u+u91wCqhhUsUqy34HNqsEOvUZRz
	4DClD0BuMasCT3MX6+EO4RGQi4UhUwWGCFMZDrdb/3f8S3CW051RzenA4Jt8uPyn
	AbO5tNiKkY/thNjp013Dhe+wGdHaarfH08Lv7X0eVhqpUqSTXOtu99elPqZFKzsI
	e9KrOf6VZKaROjALQXnHV6jLaMja3XAsE+GHGyeFe9fiyGll0wbg3UjGaHUryrY7
	xL0jyMYoJPhsbcSsmmL48mWBTaSqlmRkOy92PfbVNth3bMKcjX4/M/HOjYxBENjC
	KHaFTA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnr13de-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 17:17:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8485b7e18b4so7988491b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 10:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049448; x=1784654248; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zFHN2qyJOM1iC26km9OAgCA4h/0y1+tM0gE8VpSZk3A=;
        b=NbhzUPTXr/2ycz/O/rfiZ1cop9FwPuz6ySYuEGurqjsIXI/sYu5EvOSJIzDN/2g6oA
         slYOi2qCQb6FgaAmc7m0c86Zjgri9HEOJB+CSSuFAFPin5CyvotteRDLbDgEWlA78qJ9
         KxA95j8EFp/K6VDhvgKe/0mhjNcgFaKMwKeMDKeZbqtoAWzBjiMXoMHkYYDnzL0jxbQv
         yOpJ+TW5R+C5QYsVjsqg+qvzuMN/gkJtSO6B9NW1NO/4xNalUJ+hvvCL//+BK7g8sbIt
         KLE1ERp9/qBohijzJHYDSz+9kvP51oZXxH3fFlSSaSu65i+wTTg3l9rVsXhzITho6b9v
         Ekmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049448; x=1784654248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zFHN2qyJOM1iC26km9OAgCA4h/0y1+tM0gE8VpSZk3A=;
        b=k47dfJJqF1ljciqJCJisI2kKlAfSknlWDGaNpYySvvoIfTW3QFymy9IIxHFMxZju9f
         pHvGi45dFQg9Pa9ek2w+UZKiT/X6qtz1seAehgx700lXFxYCLLiujH4PJAdR31/NLdnR
         REPGuXz50kSZq1TccSnBzxqSbuSJjpcJU7cny0AWgg0LKNksjDgIsyl1NKmvHqQ7LWsn
         PseXUVIFNKwOeWHp7VoQkEN3YSpjql2p4n9tNXR9ahskoNDRzcWeghGxWkDrw31QTu+v
         h1cdw71GVuXPXN+kIyYV24Qt6H1YCznutanRX9T0+uK36Gx/SP7JXE3jzBEh5N5h9MkI
         huFA==
X-Forwarded-Encrypted: i=1; AHgh+RrmWDPJQ0AG1ha5pOYJC1s8CyB+e88bdBWvd7jdHEKQdxPZcLOUfK1NpZ+8chzQBxZQU/Mlgvw3flf8JvYXn21s@lists.infradead.org
X-Gm-Message-State: AOJu0YzfY/R2FMO3J2HWjshSpLuaY9bLXIgwlS5RsK7h+VGF/ee8OmX3
	LgQqXD5e0LqkPd2dlcZbb0xPuLNiUMs78gDdpfE2lsUxKFLFHHeRCCzwh7SGUS2oriQnS0BG04m
	EjUYmOJrzisoHWcJf5Treh+i9Cv95EmXzPOiPkQ6CruPvciwcDRHFAMGuwS4y+wyRnyB4oCG1Kw
	N/Uw==
X-Gm-Gg: AfdE7clsZPgH4hPSIzDV93uWPlVvpUeg6AffNh8ggR8JLJ2QJq4cMASrmPIATqbFUoY
	+5xSDHi36qxXoOdtzuvhS944q05+A9QFyI7f5OyNH/C5Rf48mO+Z5e2htMZwvvkBxrZKe+rpAkM
	QxoOaTvgJEeCeNoDrkmwiRSlWzXL41im9WfXNtSwCwZaSBKKpjGgcgzNKWH4VgUWIGsyWWyZc7G
	HL6L00km31O44Wc0xmIxoRFcWJardDqKs2v8vBdpOwqBz8eNZ0f1HUlS5rm/mq0YlcGXT1WOHl+
	O005sR1lRIA+Mj2jj/6Au79iyg/AZnDtl2oqcpvPlKykdUyziheVsJvXjnvE72FF1tF4QabtS4d
	rUiu1XSzmXt31zmAgEs64asftEK2iS4Vp7lGhSnsQUIdXO5Q=
X-Received: by 2002:a05:6a00:3e24:b0:847:86b0:888c with SMTP id d2e1a72fcca58-8488971d94bmr13898055b3a.48.1784049447551;
        Tue, 14 Jul 2026 10:17:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e24:b0:847:86b0:888c with SMTP id d2e1a72fcca58-8488971d94bmr13897994b3a.48.1784049446949;
        Tue, 14 Jul 2026 10:17:26 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:17:26 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:32 +0530
Subject: [PATCH v23 04/13] firmware: psci: Introduce command-based resets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-4-e7453c548c21@oss.qualcomm.com>
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
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=8392;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ctQvLTJKfrXPTV9ySg7oSX/KcelXwjfNCdBeL0pLEu4=;
 b=SOUs+g6IvT98LaENeem1JD2kteiBbRMeyl3Y6VWdoJ2jkc9hBDg+UwF7+zs1bhbk+6Hx582Zb
 eqzB67lz5wMDeYTxYesBdv47rKnUS3QCBc8BYfNfaPMXViQeoX8ZXGQ
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfXwj0FcScof/BM
 Vw9dM23thspplxoDg7zmBolYg4OiR3Ot4bw5dWmgxYN4fpowrK1Z3o46igHb3Kbkb0yRiZ9s0iW
 Q++GM4GbwAuy36oVMAJ/3J8UyjnjJ/k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX7Nk1oUIPY4KL
 uiBaqQa/95qw13b47TJ0eJ1SEj0pstBRsVpod4w9iFDocGqn2kiNC0EEI7+VE7INtLwYiYCiRz7
 RWPA65/X0x0lVG3GMZlcDYGjha2br3EZz1bEJbv17Q9sddPPgLFAZMkIRtJVx9pHqxqKzvNMozf
 KW+RXe6d7G4E/lkdblsUuiBOdkX7aFMF6AiPQtKXAOQksfsxQMT2Il5PiLy2jv0Gs0befeMXJDw
 cGmHYVrD9Aq3GPhtlzMiQVDGgoeY7NeeL3mYrT8FINDbxVUNTxQ8vq/yILyiXRSWXiK1VV9phd9
 WQ1uHrrvsfbShA61XExDi4w0962BQpZChCyr2g/Xm6cHGw/FVvA6S+/WpAFVNcoCiiFSP8qfm7C
 W0CDWQ2BU1JaX4ZAI4nuYUGWaj3l9nnrJTrTOC0PolpChsgvGta510pWeHvOibuiKe3jQVK9QA0
 OmvNKPj4R3uA7T/Vn+g==
X-Proofpoint-ORIG-GUID: 7ULb1phrxqWvU4lWf2vO9-t92Qc9QNvr
X-Authority-Analysis: v=2.4 cv=NfPWEWD4 c=1 sm=1 tr=0 ts=6a566f28 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=g7gMiRdxR7lOOi1eyjcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 7ULb1phrxqWvU4lWf2vO9-t92Qc9QNvr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_101730_151017_57A63AA1 
X-CRM114-Status: GOOD (  30.89  )
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

PSCI currently supports only two resets - SYSTEM_RESET and SYSTEM_RESET2
ARCH WARM reset. The reset patch is selected based on the Linux
reboot_mode variable. The PSCI specification now includes SYSTEM_RESET2
for vendor-specific resets but there's no mechanism to issue these
through psci_sys_reset().

Add a command-based reset mechanism that allows external drivers to set
the PSCI reset command by passing a reset_type and a cookie.

Add support for the following reset commands:
  - SYSTEM_RESET2 vendor-specific resets.
  - SYSTEM_RESET2 ARCH WARM reset and SYSTEM_RESET (reset_type = 0 and
    cookie maps to psci_standard_resets).
Unsupported commands fall back to the regular PSCI reset path.

Default to the existing reboot_mode-based reset flow unless a reset
command is configured. If a kernel panic occurs after a reset command is
set but before the final PSCI reset is issued, ignore the reset command
and follow the normal reboot_mode-based reset path.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/firmware/psci/psci.c | 106 ++++++++++++++++++++++++++++++++++++++++++-
 include/linux/psci.h         |  36 +++++++++++++++
 2 files changed, 140 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index e73bae6cb23a..881819d09911 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -12,7 +12,9 @@
 #include <linux/debugfs.h>
 #include <linux/errno.h>
 #include <linux/linkage.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/panic.h>
 #include <linux/pm.h>
 #include <linux/printk.h>
 #include <linux/psci.h>
@@ -51,6 +53,14 @@ static int resident_cpu = -1;
 struct psci_operations psci_ops;
 static enum arm_smccc_conduit psci_conduit = SMCCC_CONDUIT_NONE;
 
+struct psci_system_reset_cmd {
+	u32 reset_type;
+	u64 cookie;
+};
+
+static struct psci_system_reset_cmd reset_cmd;
+static DEFINE_MUTEX(reset_cmd_mutex);
+
 bool psci_tos_resident_on(int cpu)
 {
 	return cpu == resident_cpu;
@@ -80,6 +90,62 @@ static u32 psci_cpu_suspend_feature;
 static bool psci_system_reset2_supported;
 static bool psci_system_off2_hibernate_supported;
 
+static u32 psci_get_sys_reset_fn(void)
+{
+	switch (reset_cmd.cookie) {
+	case PSCI_SYSTEM_RESET2_ARCH_WARM_RESET:
+		if (psci_system_reset2_supported)
+			return PSCI_FN_NATIVE(1_1, SYSTEM_RESET2);
+		return 0;
+	case PSCI_SYSTEM_RESET_COLD_RESET:
+		return PSCI_0_2_FN_SYSTEM_RESET;
+	default:
+		return 0;
+	}
+}
+
+/** psci_set_reset_cmd() - Configure PSCI reset command
+ * @reset_type: SYSTEM_RESET2 vendor-specific reset_type as defined by
+ *		firmware, or 0 for standard resets
+ * @cookie: SYSTEM_RESET2 vendor-specific cookie as defined by firmware or one
+ *		of enum psci_standard_resets when @reset_type is set to 0
+ *
+ * Supported commands:
+ * - PSCI SYSTEM_RESET2 vendor-specific reset:
+ *   - @reset_type and @cookie must follow platform-specific SYSTEM_RESET2
+ *     vendor-specific resets.
+ * - Standard reset selector:
+ *   - @reset_type must be 0.
+ *   - @cookie must be one of enum psci_standard_resets.
+ *
+ * This is an in-kernel helper intended for built-in reboot flow callers.
+ * reset command can be set only one time per boot cycle.
+ *
+ * Return: 0 on success, -EINVAL if both inputs are zero, -EBUSY if reset
+ * command is already set.
+ */
+int psci_set_reset_cmd(u32 reset_type, u64 cookie)
+{
+	if (!reset_type && !cookie)
+		return -EINVAL;
+
+	scoped_guard(mutex, &reset_cmd_mutex) {
+		if (reset_cmd.reset_type || reset_cmd.cookie)
+			return -EBUSY;
+
+		reset_cmd.reset_type = reset_type;
+		reset_cmd.cookie = cookie;
+	}
+
+	return 0;
+}
+
+bool psci_has_system_reset2_support(void)
+{
+	return psci_system_reset2_supported;
+}
+EXPORT_SYMBOL_GPL(psci_has_system_reset2_support);
+
 static inline bool psci_has_ext_power_state(void)
 {
 	return psci_cpu_suspend_feature &
@@ -306,8 +372,24 @@ static int get_set_conduit_method(const struct device_node *np)
 	return 0;
 }
 
-static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
-			  void *data)
+static void psci_handle_reset_cmd(void)
+{
+	u32 psci_sys_reset_fn;
+
+	if ((reset_cmd.reset_type & PSCI_1_1_RESET_TYPE_VENDOR_START) &&
+	    psci_system_reset2_supported) {
+		/* PSCI SYSTEM_RESET2 Vendor-specific reset */
+		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
+			       reset_cmd.reset_type, reset_cmd.cookie, 0);
+	} else {
+		/* Retrieve the psci reset function from reset_cmd */
+		psci_sys_reset_fn = psci_get_sys_reset_fn();
+		if (!reset_cmd.reset_type && psci_sys_reset_fn)
+			invoke_psci_fn(psci_sys_reset_fn, 0, 0, 0);
+	}
+}
+
+static void psci_handle_reboot_mode(void)
 {
 	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
 	    psci_system_reset2_supported) {
@@ -320,6 +402,26 @@ static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
 	} else {
 		invoke_psci_fn(PSCI_0_2_FN_SYSTEM_RESET, 0, 0, 0);
 	}
+}
+
+static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
+			  void *data)
+{
+	/* The function psci_handle_reboot_mode follows reboot_mode based
+	 * reset flow and psci_handle_reset_cmd uses reset_cmd based reset flow.
+	 *
+	 * The reset_cmd is configured at the reboot_notifier phase. If a kernel
+	 * panic occurs between the reboot_notifier and this final reset, skip the
+	 * command-based reset and let reboot_mode drive the reset flow.
+	 *
+	 * The function psci_handle_reset_cmd invokes non-returning PSCI SYSTEM_RESET
+	 * calls to reset the device. If it returns, either the reset failed, or the
+	 * command was unsupported. Fallback to reboot_mode based reset flow.
+	 */
+	if ((reset_cmd.reset_type || reset_cmd.cookie) && !panic_in_progress())
+		psci_handle_reset_cmd();
+
+	psci_handle_reboot_mode();
 
 	return NOTIFY_DONE;
 }
diff --git a/include/linux/psci.h b/include/linux/psci.h
index 4ca0060a3fc4..39fe0edec651 100644
--- a/include/linux/psci.h
+++ b/include/linux/psci.h
@@ -8,6 +8,7 @@
 #define __LINUX_PSCI_H
 
 #include <linux/arm-smccc.h>
+#include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/types.h>
 
@@ -21,6 +22,16 @@ bool psci_power_state_is_valid(u32 state);
 int psci_set_osi_mode(bool enable);
 bool psci_has_osi_support(void);
 
+/**
+ * enum psci_standard_resets - Standard reset selectors for PSCI reset
+ * @PSCI_SYSTEM_RESET_COLD_RESET: Standard SYSTEM_RESET command.
+ * @PSCI_SYSTEM_RESET2_ARCH_WARM_RESET: SYSTEM_RESET2 architectural warm reset.
+ */
+enum psci_standard_resets {
+	PSCI_SYSTEM_RESET_COLD_RESET = 1,
+	PSCI_SYSTEM_RESET2_ARCH_WARM_RESET,
+};
+
 struct psci_operations {
 	u32 (*get_version)(void);
 	int (*cpu_suspend)(u32 state, unsigned long entry_point);
@@ -45,8 +56,33 @@ struct psci_0_1_function_ids get_psci_0_1_function_ids(void);
 
 #if defined(CONFIG_ARM_PSCI_FW)
 int __init psci_dt_init(void);
+/**
+ * psci_set_reset_cmd() - Configure PSCI reset command
+ * @reset_type: SYSTEM_RESET2 vendor-specific reset_type as defined by
+ *		firmware, or 0 for standard resets
+ * @cookie: SYSTEM_RESET2 vendor-specific cookie as defined by firmware or one
+ *		of enum psci_standard_resets when @reset_type is set to 0
+ *
+ * Supported commands:
+ * - PSCI SYSTEM_RESET2 vendor-specific reset:
+ *   - @reset_type and @cookie must follow platform-specific SYSTEM_RESET2
+ *     vendor-reset encoding.
+ * - Standard reset selector:
+ *   - @reset_type must be 0.
+ *   - @cookie must be one of enum psci_standard_resets.
+ *
+ * This is an in-kernel helper intended for built-in reboot flow callers.
+ * reset command can be set only one time per boot cycle.
+ *
+ * Return: 0 on success, -EINVAL if both inputs are zero, -EBUSY if reset
+ * command is already set.
+ */
+int psci_set_reset_cmd(u32 reset_type, u64 cookie);
+bool psci_has_system_reset2_support(void);
 #else
 static inline int psci_dt_init(void) { return 0; }
+static inline int psci_set_reset_cmd(u32 reset_type, u64 cookie) { return 0; }
+static inline bool psci_has_system_reset2_support(void) { return false; }
 #endif
 
 #if defined(CONFIG_ARM_PSCI_FW) && defined(CONFIG_ACPI)

-- 
2.34.1


