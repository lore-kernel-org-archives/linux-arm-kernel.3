Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F6CCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 14:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gE3d/1mqNsHcbczvOKMFyfwo4Ec0LoAPoKWOy4Q3dy0=; b=qrXPeiL2pq6a1LlKfx9AxBbKB+
	wHo1wsd2K8A2IPHsw8pOPh3YpUCYYVveG4xtoDQKz8Ck2MWeu8Hu+8HXLddJQPBLFeJRE/QlkDCHA
	yWWx2H7APShAYLaRiaFKDbTSFFQpUeVrTCoppPkebVb5G66mdQ9AdwDRYFYjEAZXd8GIQ3EE7iIk2
	hG8clrAQRU0hyG+YsbnuysOVsDXIO2LnsRCYug+Io9B3jcFAnABSAvsMfmBxj1/AtiAkPWVk2XBZg
	JipjZq18DJs8hSoWU1Ol6WKMrEp/KCm4T50vq4kJ6EAfLpOs5k/ExC3rKHoeRhNABOoVy57WEUYQk
	4DK4fEWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNX2N-00000005int-3JOq;
	Thu, 14 May 2026 14:27:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNX2K-00000005ilr-2Oz9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 14:27:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeUs01717878
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 14:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gE3d/1mqNsHcbczvOKMFyfwo4Ec0LoAPoKWOy4Q3dy0=; b=Za9oxAA/rF1GkL7y
	+mI/3RVDP6D9uz3lcEGB+fbN7gbNSHIyw39ynDpsUMR8QWXxUQWyTVsVJy9UElHf
	7HeMFJZh/3h3j7vWu+zv+Yi/smAiz6I4ygvlI25wm/GiVlde2p//43DlhdJEMP0D
	KHsj2nkBJDVGWGqpayU+6c5x0DAKqjZah6TQOyzDj3tqnx1YGpOSPmhsPFxIbZkr
	PczI1101hpvJDFbM3j6C1zuGsI6UG1cGHsTaJK9vD37fkeai+24a9A+Y66zBzzIz
	01+759ZIIAqOw2RhCv937VNgHNiWH+L0SlBsC4KoIOHv8Th5rJ8x6SED4CSio8XP
	dUUuHg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57y7hw4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 14:27:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba6fe41283so91815375ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 07:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768859; x=1779373659; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gE3d/1mqNsHcbczvOKMFyfwo4Ec0LoAPoKWOy4Q3dy0=;
        b=bWFUQs6A79XGTHkZLwR+qkkwrdBhPs2RKhPVvKwl9ZivIBRHnwJJXtI4hFqJRV0rnd
         jF5sYq3UZ3jPPXmpKyYYb+WSffdA/rbKHX+ZFx+upC0znbL0uCcCSIgisDiXylHCkUbN
         fK/tool8pQKzqwXDDXGVJRpdRXgl2REqxkyDZrIF7HX0E1z8FhCUeDfThNMJTNapnu0h
         OtOBRhwzjY21G6aEtntS/LiOo6gpAePF/r5AUWdP/KAwku/PSfHV0dkfmg8Y3mOMCqt3
         xw/1Rf/ZHP/k1WQcLPuGk1GMtgYYveRbgSHsQwNmcOaoXp+QEhGU6BLtq6vvXiQ5RkhJ
         bvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768859; x=1779373659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gE3d/1mqNsHcbczvOKMFyfwo4Ec0LoAPoKWOy4Q3dy0=;
        b=WB0K5LBmhviSCQbyEsHPFPecE463JdxBWuPIB9ok/JhU1NEyCkwVm2AHsSNqhd7U9Y
         ECFM5Mmycp1m3vMfQ1XoDKWmdrX7Ij3u42tbtp6VwkvKafqahlZaImHdFFb0s83lMFxI
         R0PBOn3BBln6HlaXhjCNy9bSCgPJAFG1kHJjaiu4sxfvfRCiSEnXmMmiv55/XvfKrOD2
         taEvzTkDwhTLi5uZk3AbqqLZ+J5FFmd1IlhoOlbcHrm78t0OYEnI9B5ork4hS8dNp7Dx
         +UNkYR137exqX1pQEhlK38HwlcAc+mbD87ES25uOvAmLEUzgXB/TdoGPBEjtVxmmwbTU
         0euQ==
X-Forwarded-Encrypted: i=1; AFNElJ+PJKPqVyroytczol3x3cSaVcM9sKGdNZdLbmPajGhCDT5eJQRIX5JMJ6fCZdxeGk8sHxVOlplhmAvZoXifUGqN@lists.infradead.org
X-Gm-Message-State: AOJu0YxAGh0RWrw8IoN+8NLa6hXjZWknyxEuVRthubYICZcATQo1qX0S
	ymKjI4CTwB1m7Rcb3RevWSRvhDusI9vsqVAZYnZ8GEdByCapuf571APQE61Wb2leMS8n5AHky71
	1NjFPDfmN+0RT1myjjMXTiNVCXmLYoDl2I75XI07Z4LWoYoXgwB+ENxZpN4Lf5U+lZCULcPEOKs
	8dng==
X-Gm-Gg: Acq92OFTWgY1xu3U4/Dm/rM5OtNzjfwkqHK8Kf55RGNMcaqeGFd60nbWdBhFXeO+wsq
	CgKkB+yoV03PElMWyYOb4DIQl1+YuW6Xj0JqOfFCNI9M6UNTycl2lthdEQyzHTvFWEfmT2K0r+2
	ZNO5RBV2rom0W3BxOlpTrYdANWOhCgRp2IyGIR6vAbaLaP2v88N/hUqG33EE4FdA6lRJAMPcpEI
	RRTCMV2q4zC4TxaRNNhUevz+v4O2g9SnuGtnidYO4R4T75EVBbpLnPtUAkg1Zr/YEFADRsQmV9R
	nPap/XaKZTkh4wVn/dTKuFs6w+LG/OKKhqEloFjlBB2JrUF0aN/KAR+K7sDQ7jgRXmIX07BkrAv
	/sZftSbrqiNufrFRXNZ+UtShVOJkHB21LLXNPPBcIqHcIrznofDySWnWSaJ+VoSgVrvq7
X-Received: by 2002:a17:903:120a:b0:2bc:78ec:54c0 with SMTP id d9443c01a7336-2bd2ff2a51emr89557315ad.31.1778768859262;
        Thu, 14 May 2026 07:27:39 -0700 (PDT)
X-Received: by 2002:a17:903:120a:b0:2bc:78ec:54c0 with SMTP id d9443c01a7336-2bd2ff2a51emr89556465ad.31.1778768858626;
        Thu, 14 May 2026 07:27:38 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:27:38 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:45 +0530
Subject: [PATCH v22 04/13] firmware: psci: Introduce command-based resets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-4-28a5bde07483@oss.qualcomm.com>
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
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=6677;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=bfZxbVm6xwqrZva4/bjqZKtMacFd3ZN//N6v7LMpV10=;
 b=9VP2h6vkEBUeop0sGH+o9wi/BYjMPJpDm4SM0A71zlJUWo0XDTwDWz2RdsH182u6VrBzGPm6m
 uAduIwm2DyGBXkPoCr07IxmqXWX2D4r97bu98kkKpDuxmVeuv6PtSxo
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: JUYlkcLaF0ng5nd6Ehtea0SSMemel4FB
X-Authority-Analysis: v=2.4 cv=UY9hjqSN c=1 sm=1 tr=0 ts=6a05dbdc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=syBxKCaIGq6wZv0syL0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: JUYlkcLaF0ng5nd6Ehtea0SSMemel4FB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfX8L6kPmpdW8c+
 8yc082dxVvke4S13Fftl2+IypUog/F6Fi2q+yT5PIjUuuj9CRpsfB60S2ut8E1hTDZJlRd7hkhJ
 L9yCd5SjC5Q4hQ7l1N5X8VjyPR1g4liIzXiqiG11E9btfGBvHHxFe49b5b6CVZrguq/usbz8Vfm
 Q8kjnqtuV7lWaFzoCArULGs6BxxMIPmXH4KOp0uXPL8ieHbat4t33EPgiWKCE4Z758t1YQnmctV
 2B/Je/BkL42QHcD7MX7ixtElgpgo7AanIWQLYYv64TneDZM/bTwNaSeE7IhlOAZ2B9LecD3M1uD
 RkpaaIhGSug3D1ZA1DamDEu6gPIaZDd3Xxk9KCbWgE2mxZL6QATJPZcob1Z+Qg9kgQZN3GF1yjZ
 t4nwynrzfWK8pDfaDs9qzXgOb4b+YZNe9gjnmuF6azAexTce+No0xbgedgDktIUMAxBTztpqnpV
 Og0lrCdggIWU1lW/IMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_072740_692836_DCCC13A7 
X-CRM114-Status: GOOD (  27.39  )
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
the psci reset command via a exported psci_set_reset_cmd() function.

Define predefined reset_types - PSCI_RESET_TYPE_SYSTEM_RESET to map to
SYSTEM_RESET, and PSCI_RESET_TYPE_SYSTEM_RESET2_ARCH_WARM to map to
SYSTEM_RESET2 arch warm reset. Interpret zero cmd_reset_type, for
predefined reset-command selection via cmd_cookie. For non-zero
cmd_reset_type, check for valid vendor_reset_type and set the psci
reset_command and cookie accordingly.

Disable PSCI command-based reset by default and treat invalid reset
commands as no‑op. psci_sys_reset() follows its original flow based on
reboot_mode until a reset command is explicitly set by
psci_set_reset_cmd().  In the device reset flow, psci_set_reset_cmd() is
called in reboot_notifier phase and the device reset happens in
psci_sys_reset() which is called later in the restart_notifier phase. If
a kernel panic occurs in between these two phases, the reboot should
take its original flow based on the value of reboot_mode. Disable the
command-based reset in such case.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/firmware/psci/psci.c | 75 ++++++++++++++++++++++++++++++++++++++++++--
 include/linux/psci.h         | 19 +++++++++++
 2 files changed, 92 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index e73bae6cb23a3bfa6441503f667b0ffdfcd72536..4e0710ab09cdb0af7280ff4334aa1ea1bfe95aff 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -51,6 +51,16 @@ static int resident_cpu = -1;
 struct psci_operations psci_ops;
 static enum arm_smccc_conduit psci_conduit = SMCCC_CONDUIT_NONE;
 
+/*
+ * Encoded reset command:
+ * bits[63:32] = cookie
+ * bits[31:0]  = reset_type
+ */
+static u64 reset_cmd;
+
+#define PSCI_RESET_TYPE(reset_cmd)	((u32)(reset_cmd))
+#define PSCI_RESET_COOKIE(reset_cmd)	((u32)((reset_cmd) >> 32))
+
 bool psci_tos_resident_on(int cpu)
 {
 	return cpu == resident_cpu;
@@ -80,6 +90,35 @@ static u32 psci_cpu_suspend_feature;
 static bool psci_system_reset2_supported;
 static bool psci_system_off2_hibernate_supported;
 
+static u32 psci_fn_from_cookie(u32 cookie)
+{
+	switch (cookie) {
+	case PSCI_RESET_TYPE_SYSTEM_RESET2_ARCH_WARM:
+		if (psci_system_reset2_supported)
+			return PSCI_FN_NATIVE(1_1, SYSTEM_RESET2);
+		return 0;
+	case PSCI_RESET_TYPE_SYSTEM_RESET:
+		return PSCI_0_2_FN_SYSTEM_RESET;
+	default:
+		return 0;
+	}
+}
+
+/** psci_set_reset_cmd() - Configure reset request for psci_sys_reset()
+ * @psci_reset_cmd: reset command encoded as cookie[63:32] | reset_type[31:0]
+ *
+ * Save reset command.
+ */
+void psci_set_reset_cmd(u64 psci_reset_cmd)
+{
+	reset_cmd = psci_reset_cmd;
+}
+
+bool psci_has_system_reset2_support(void)
+{
+	return psci_system_reset2_supported;
+}
+
 static inline bool psci_has_ext_power_state(void)
 {
 	return psci_cpu_suspend_feature &
@@ -306,8 +345,24 @@ static int get_set_conduit_method(const struct device_node *np)
 	return 0;
 }
 
-static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
-			  void *data)
+static void psci_handle_reset_cmd(void)
+{
+	u32 psci_sys_reset_fn;
+
+	if ((reset_cmd & BIT_ULL(31)) && psci_system_reset2_supported) {
+		/* PSCI SYSTEM_RESET2 Vendor-specific reset */
+		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
+			       PSCI_RESET_TYPE(reset_cmd),
+			       PSCI_RESET_COOKIE(reset_cmd), 0);
+	} else {
+		/* cookie part of the reset_cmd decides ARCH WARM RESET vs SYSTEM_RESET */
+		psci_sys_reset_fn = psci_fn_from_cookie(PSCI_RESET_COOKIE(reset_cmd));
+		if (!PSCI_RESET_TYPE(reset_cmd) && psci_sys_reset_fn)
+			invoke_psci_fn(psci_sys_reset_fn, 0, 0, 0);
+	}
+}
+
+static void psci_handle_reboot_mode(void)
 {
 	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
 	    psci_system_reset2_supported) {
@@ -320,6 +375,22 @@ static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
 	} else {
 		invoke_psci_fn(PSCI_0_2_FN_SYSTEM_RESET, 0, 0, 0);
 	}
+}
+
+static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
+			  void *data)
+{
+	/*
+	 * Command-based resets are configured at the reboot_notifier phase.
+	 * If a kernel panic occurs between the reboot_notifier and this final
+	 * reset, ignore the command-based reset and let reboot_mode drive the
+	 * reset flow.
+	 * If reset_cmd is zero, there is no command to handle.
+	 */
+	if (reset_cmd && !panic_in_progress())
+		psci_handle_reset_cmd();
+	else
+		psci_handle_reboot_mode();
 
 	return NOTIFY_DONE;
 }
diff --git a/include/linux/psci.h b/include/linux/psci.h
index 4ca0060a3fc42ba1ca751c7862fb4ad8dda35a4c..c2458291a3faf5ac89b1528dae2c9b805a2dd075 100644
--- a/include/linux/psci.h
+++ b/include/linux/psci.h
@@ -21,6 +21,21 @@ bool psci_power_state_is_valid(u32 state);
 int psci_set_osi_mode(bool enable);
 bool psci_has_osi_support(void);
 
+/**
+ * enum psci_reset_type	-	PSCI_RESET_TYPE for SYSTEM_RESET.
+ * @PSCI_RESET_TYPE_SYSTEM_RESET: Standard SYSTEM_RESET command.
+ * @PSCI_RESET_TYPE_SYSTEM_RESET2_ARCH_WARM: SYSTEM_RESET2 architectural warm reset.
+ *
+ * These enum values map PSCI_RESET_TYPE_SYSTEM_* constants to reset strings
+ * issued from user space. When user space requests a reset, the cookie
+ * carries one of these values, and the PSCI reset path translates it into
+ * the appropriate PSCI system reset call.
+ */
+enum psci_reset_type {
+	PSCI_RESET_TYPE_SYSTEM_RESET = 1,
+	PSCI_RESET_TYPE_SYSTEM_RESET2_ARCH_WARM,
+};
+
 struct psci_operations {
 	u32 (*get_version)(void);
 	int (*cpu_suspend)(u32 state, unsigned long entry_point);
@@ -45,8 +60,12 @@ struct psci_0_1_function_ids get_psci_0_1_function_ids(void);
 
 #if defined(CONFIG_ARM_PSCI_FW)
 int __init psci_dt_init(void);
+void psci_set_reset_cmd(u64 psci_reset_cmd);
+bool psci_has_system_reset2_support(void);
 #else
 static inline int psci_dt_init(void) { return 0; }
+static inline void psci_set_reset_cmd(u64 psci_reset_cmd) { }
+static inline bool psci_has_system_reset2_support(void) { return false; }
 #endif
 
 #if defined(CONFIG_ARM_PSCI_FW) && defined(CONFIG_ACPI)

-- 
2.34.1


