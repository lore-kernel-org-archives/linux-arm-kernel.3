Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2669EFCE33
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 18:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6K2GYPaT0CXFc6s+49BofuLoHb7MJAM3YjniV/PTVb8=; b=j+0TGqwVJL8GBibGA+9k6yNBTm
	/l+3Of6j5/bFpLwkkmnH/A+Fy4BCDh5A5HBAQVTstpxx8lIpn4frcQa7OFG7UM3V0i0DmOHg/ELig
	E1pjY2cuF90PaIfj5thhnijoKhVcWJ1y2Nv/zQOIY1kU3Mjlph0vrzMdOzZ7DXsyaX2WZ9HbwzDCe
	y45Ggu3CFyp5efxjXc5s1mHr+dh+1qZCrFpqNKno58BBUyV23pTs6/HGmd4XBbzKU+xapcZqO/nDW
	2opcvuTeBT2MKI6AZksAXdHhX0Yx+fHaL7wFtgPmuMwwNRxgk0AIFuOAxqWi1EF6544wR4G5zyMpz
	IyYwsMDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqZt-00000000I1p-06xf;
	Wed, 04 Mar 2026 18:04:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqZr-00000000I0R-0wl2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Mar 2026 18:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6K2GYPaT0CXFc6s+49BofuLoHb7MJAM3YjniV/PTVb8=; b=aG/eLaf4MkskhrpTRrHCBLa2hm
	KEEG1vbNW8JZI0NKphdlef5N4lLO1Dtqr6DC/+bXcermnC6Ch7PZKboPdrH03OWPMnZfPP7B+rOQF
	u9hADQlHy4Vs6WUN5HWMcs7+akE/SjpBEpNPcbIv1pkxykgbX0NuNUYaB0rdv1GwSc8d29X4f/DCu
	u2iHuZIQ5e95nU7i7uKLUbP7aBgBloJ5dRK6zZn38sYI5pZFwUqVqYp9abPpqb3r8znSsGLh0LRAE
	DUgjCESSUIn/WOmQYquhsrSuG/FdPFyCsPu6LZtnPV2d42koeu0Kt3KFcN7FAH5j8NtkNqG4jWIxF
	O61yZYbQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqZo-00000005I3y-0joH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 18:04:06 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624Bvhwa1677935
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 18:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6K2GYPaT0CXFc6s+49BofuLoHb7MJAM3YjniV/PTVb8=; b=ocSBfwS7W/Cqi/ue
	ZKO60KY+TP+VXwxHOycgTe49YR91RvnTVgtJIm5D2HRSguOBT3tG665Jbaicvk9y
	ROgzKVtPamxVB6dT66ls626XYV/icTNUpXk+Au+E8BmQshznRl5b+3ljI2NxU+DC
	BwepL6Y5b+daHg7u+CyeempgDqkX2lEfulkHaVMwgETG0MZot7HtIFaikaqTbxjV
	0/LtASQp3Dm6R3PvHjtOzvPSU2NoD1ReT2K1UgHbYYqQazU8IUoP4Ty+b6LfqyEY
	xt2Jpw0jDQSjztCZibEHmOLrTjt6hvYAu4UYgK/BTdy/ecj8UEtiYFh0TDtPQlTs
	kJMFVQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp73hbvp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 18:04:01 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354bc535546so5741602a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 10:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772647441; x=1773252241; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6K2GYPaT0CXFc6s+49BofuLoHb7MJAM3YjniV/PTVb8=;
        b=TiSnlxiktLRH9e0uxpdDawxCPma+NausxuX3EJN8ThPbQQsiylvocnCQge2FevFttp
         s5IswcoCp/gZzFN/izb4Df4c8x/OD174QALh0mwz+SVaedwMIC9G0pufGE+zIsjm7OU4
         MAW6VaNnWgjgNFvcgMqVsXFOmYfZL4ce+KbIHwWb301mS/gqAXPuMeElqaejl4v9OTt7
         G3h1g9twz+7zxD5Z6RQjoynXAYSUGJAINpugdxUbMvKXGqy5DL39b8BZFNIHaEGz0Oy4
         4XpW/JUDnfEllPFhTMHUbEal9fTv2V3q41C2kXPkqfiT+UyIhm1teiBlZmKy74Pqq1JG
         Tg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772647441; x=1773252241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6K2GYPaT0CXFc6s+49BofuLoHb7MJAM3YjniV/PTVb8=;
        b=mWGP/CS1J1/3vcchUAbRsiFetiajeAgTvXTfnvlAvBMuespu2Rp67DAHJHQWqnC+/j
         Dbxy5dtqaxSYdrO2Eh/8W1hnO/9C8pQs226MoxZMUzNxr5Mpczfje897f3BtYLR+3XtB
         ppd7oXYYHRcNE04F99nBSEN6dtU9I/sg9CQJdets7cFni1sphN4ZEKJjLZc5roogRl8j
         WOuptWtEslB60wgnzZfx7NfkLUX9oFFsaBeD5jfMesfbQVaMwhpiMAkSDw4qFoBPzwD6
         KEZtWQANST3Y0cpPqO1hMdiSVyTEaqlfqaRNFaqX8denFLWX1cuW31kZcYHezHuYyI+t
         5GJA==
X-Forwarded-Encrypted: i=1; AJvYcCW3ZcxYcqFVbLKKYb1fm3j53PvjHvBr7jHJlAMYZC6r0en2qs/C798j8cuWnA5H/0UPaDVTQwF9hEVhTiD6XwzG@lists.infradead.org
X-Gm-Message-State: AOJu0YwThPBVekL0RR69xVlE4nbLsWpjmq18W3P3KKhC/FkrUtaFjhth
	drRWrog5OINm0mGld0rHCsldAAG6IUt6oKOWWPTeFYP2pAbDds52eRsTBSHA99U6W2bYe8c6No2
	QyW5U8qULx62nsKD5Cfw+27H+sg7emEBHMRN8SPdDWeNF7hzUlm98dc0CldSQyWfgc74kC2qBFw
	xPig==
X-Gm-Gg: ATEYQzwgSMM1FI+aIupM4XtifL1vn1I/kFeaxKlp/qwY8RPL2o6mhTzMuGJ+XT72/mp
	uX13EG+nrzLdlUzFNywNyAQN9ucRPutNSko+kmL5V8AM5wox60ecuLrnDClZKReEp4IdP0VBBsR
	3qSvrQxYpwiqWAJOJ5YkhIVWAcmh+BEMbQCL+CdcKhFtp639i1Oy2sO6JeoQisBQMlsNR/AkkWx
	KQCRCjsY3DFjtoukpHyXSg6IivCbW1AcjrO5DskEJPTZj1JjdJgOb/0mSgH6+GdMBsIFLWlnjz9
	MCAoVUV4WQHAXfUTYTo+IwwTErKEp8nNOhMKAR6z/GHb9OHRN2DWZ78PDxP4LZpYLamgGLIFkG+
	kfQBszmBjhl8dch7dQyPeytDBEr8KdZw41XPsajW/uZFR6fOCKlcaMdgs3w==
X-Received: by 2002:a17:90a:c2cc:b0:34c:35ce:3c5f with SMTP id 98e67ed59e1d1-359a69a2776mr2352336a91.5.1772647441142;
        Wed, 04 Mar 2026 10:04:01 -0800 (PST)
X-Received: by 2002:a17:90a:c2cc:b0:34c:35ce:3c5f with SMTP id 98e67ed59e1d1-359a69a2776mr2352313a91.5.1772647440632;
        Wed, 04 Mar 2026 10:04:00 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359a8f22062sm1080606a91.1.2026.03.04.10.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:04:00 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 23:33:04 +0530
Subject: [PATCH v20 04/10] firmware: psci: Introduce command-based reset in
 psci_sys_reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-arm-psci-system_reset2-vendor-reboots-v20-4-cf7d346b8372@oss.qualcomm.com>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
In-Reply-To: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772647398; l=4337;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=AmJ/4s4g3aYrMbA4gYXXe4kt530xNpdozBMOFvrv/ik=;
 b=PjZRL0pismwX2J7LSY8RYJf4oRN9Cgr6rxdBO9Kub43Gke8+/H2QuB/RnbSvXRgPxUMIJ1JCK
 g0qm1UeINtEBiRYrjScfhqXYtH4z8Of/X/mu89uj6JPBnVbU+Byt2jf
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: 60J4fOfCYp6OdPPUIWu-kwmNatpIQrWH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NyBTYWx0ZWRfX82ojY+AQNYmh
 gcdycehajczL2fpZ/QOuPEmIdvEFo9kFN0Dx434x+4+jqzLfOLlGJzSuZmkMkzWVY4VEh3B79/q
 6pDLblGbhIiO69k4J8M+kw1wPLSgXn6JEeN1TU/5oNcw9i1cwHzmVCUvMXsS2fXYHLIu+EeYQmB
 f8dGi+Tx4YXDh13m17eItEMeIcfsp2khai2Q4Gu7Lwj83W/DTMzvlHmQvcGXyvbQI7TnwC0MYOH
 8HUKTAQkSK1Gp61OC3r9NQ/YjIhHkCgRmx+Y/eeLXF8EQGNiKtKXYYjThFy8/ADTKDuc3fGt5OO
 vgKuI8emckPPi2NUM3PH1FxKGm8RubHrgBvDSCCNjR6VnNGVphvb5FVyPIzu6PMpdZue/EZTTBl
 RqHvP1ua2x0v1OBIjxJYQjfFYhBPAgd9XNS+dKMMjLDlmCqCBiDxMvpM8FCgTwxcNABQZIB6xft
 1H1HpzlxUIYQq7xapdQ==
X-Proofpoint-ORIG-GUID: 60J4fOfCYp6OdPPUIWu-kwmNatpIQrWH
X-Authority-Analysis: v=2.4 cv=BpWQAIX5 c=1 sm=1 tr=0 ts=69a87411 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=eczEI0HPkUfQIoTEgvMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_180404_584960_0F4E5D1E 
X-CRM114-Status: GOOD (  24.05  )
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
set. In kernel panic path, psci_reset command is ignored.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/firmware/psci/psci.c | 45 ++++++++++++++++++++++++++++++++++++++++++--
 include/linux/psci.h         |  2 ++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index 38ca190d4a22d6e7e0f06420e8478a2b0ec2fe6f..ae6f7a0aead913d740070080d4b2a3da15b29485 100644
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
@@ -80,6 +89,28 @@ static u32 psci_cpu_suspend_feature;
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
+
 static inline bool psci_has_ext_power_state(void)
 {
 	return psci_cpu_suspend_feature &
@@ -309,14 +340,24 @@ static int get_set_conduit_method(const struct device_node *np)
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


