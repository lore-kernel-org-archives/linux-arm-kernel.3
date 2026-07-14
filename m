Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EF5C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 17:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8s7l/m7UGxkZIIDkB6Sh24bMViJas+fhJLKeQf2TBPU=; b=Sri7hCSyGJkmU6A+1bDT2WcYo2
	CiYJbeSZTgWDUNOkHub/Cd+HtcinkCD+2WWk2RpToGlldr/q0B8lc8/H8De6opCevmw9g4h7T/sNA
	hcDG7TPoL8vMrZWaf4O0zfsKMoQrhlOe7p84eGnAMtkUa2mblkd/oDTHm8/kWs96Cs3dUtvt8hFSt
	0R99OQroBb87l4c7ETtzWn7cjH7M5U50lwc8q6Yz7l1ULSXsu8wyrtZhyu5ZkMD8DHlk+kFzcxVt7
	kDdTKvYdGFnhC1KLSL5YDfdCYelO6WdvzWmzkegmQ3fx519HYw8MKnuebfI2DijBe98AgyqGiszeI
	LgDQXG2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjglp-0000000Ck3y-0gMw;
	Tue, 14 Jul 2026 17:18:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgll-0000000Ck2K-1nfh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 17:18:12 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG7A8B1091430
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 17:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8s7l/m7UGxkZIIDkB6Sh24bMViJas+fhJLKeQf2TBPU=; b=MwdR8/XzC7jmZcmC
	T62ytHmTWUJFu8YBB7JXFSNibli9m1pMFh0YKAV/hkv/PrBhi9ZP9PaGmJe5Oogv
	bqBQuAG0tx5XqSW30+Pjmk+oHl41zBOhxoL5EPH8QF2mhMlM6+qqLT48Ei17fCX+
	I3hmssAVq/R3aqwNx6/Yd5jMCC6tU5ZxHxe3cIcoriAXqtROLSDDS87F2/xZO1GV
	ZaUzc1HWd6blOoEFpCn3M/Jyhe2nrJ8xjYMJaZKPaBd4wf/lgvknGLqLi5yHJDhQ
	gNrwYALaUa6KJVEsvUogQi9DFwMq+PcJq56xIoKwFSLrcBsg00P6yp/crTTfnF9T
	PO+BUA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgudjauh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 17:18:07 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848551b54f5so8790278b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 10:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049486; x=1784654286; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8s7l/m7UGxkZIIDkB6Sh24bMViJas+fhJLKeQf2TBPU=;
        b=KVIsW7kiCP65K/ISBa4fLbRudt3MbP4bihVj3ndMzVdHECklzSFKoUjCPvmW9ZXubV
         sSnNl/VCsRwvrXtFxiWuLo3AoOYHKk5MGdlwvvczxPAcMDbh0xC1xOn8uwyVjRLYXT7k
         hJ5TPkU95zC3qjtMgpn8IGsURzCClt0JBllfGeLfR+FO+ibwl6JCCcyU5wQ1Gj2GbcZX
         IHM9Ql68swdfaLVjmbMPsrsfl9HXPZLdKLBr/TkHAsuos8SlHqpSuU2QWNu0ULctj61E
         3YPlibkcztsIRSVqPWZPSVmcbwp2vQcpKqj1CkEoEaqkthGeHhVSJx1IPcknn3gM+Y7I
         ipFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049486; x=1784654286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8s7l/m7UGxkZIIDkB6Sh24bMViJas+fhJLKeQf2TBPU=;
        b=iM2X2YKM65yL/pBfttm3c387UUThkYrtBbKUHO8HKbnMf40gpgkxRUecxHRlYc+F2N
         v4PsOJ7OiFAQwpg1leKeDnj0QcNH9OQ+MUS4+5ouFVkyw+oXMAp6FS/nw9VjjDu0LkSi
         tQ1PLCDpDjpOqzK/zEZO35T0A1tk4EQAdEGj+eUP6K5wLCv4acC3Hmo15TSR5hBC1Qi1
         iZojyl7hWIFRObVtihm/+9Sbfq18EmWmDMs4sMfh0NPf9ZWqHe4LOxooVS44i/t5/dqg
         4H+vmLgjwd9I+tLsN+YWewJ7E+EQNL3lQZiGKchoVe7VmONnzOGQl/gs+U7Z4kpH+q8l
         OXsA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7oc7ilCZ1CFzvdu6kWqreKXmkvfJaARXtLftkBH0zXbisTcirtS1+VXhvAczH/nXnhXaHzAaX4zgMFaPmDp0H@lists.infradead.org
X-Gm-Message-State: AOJu0YyNuMyxnQB+W1/eicuvgsMQou6LQ2gMRk1UjyNvr3iUviw66ORY
	CwSvDFUIIUx55FKNzLCoVEWq1aczYPknLwKzmBrY2thJYW9aLNN2GeQmPqVVtuf2o/ciMcWo0lO
	R2wtkb3OmC9QoWVoxYxM0sU3RTD3+Z1O9w4xeZMixUK+IVWmPH6e8ZyW9+dx7y/8GtvDg1D1gnO
	Tx7g==
X-Gm-Gg: AfdE7cmUBWko1r2lfbK1bzoUVmj0TYRQzgTnUAFnvYZLMlJPE132HJQBIZ5VJn6DIFm
	YHAfmTFoKFlzlCxIRtE+60z4gHc7ldJTTDoiOx+dl/jmntWDOljxuBnKvlIMC7hwL3KJms+vaRy
	GQ0zmS+Cw5m3acK4QzUB8RH82U9WQXjuVODHOVu5p6cLFSywDk1XPbDB/swg5H1tpTVFSQOmbT0
	PnxbpG8KuznV+tVV6Cq3iicz83KRTz6jVuYLZHNyS2d6XxiEMAZTNOrxuadfGrU1Anzj6+lLH9t
	WBPPgoE1CjUvt2lcdmu1PS13Dz7RF6pvioZnI0Ae1g+pL5avgva477Audhlf+k3Hx+M6xSgVj8F
	SiTbajaoe1FktwEFAX+xQ7cWuq/+/od/Wm/sMr5Vsxng/Nns=
X-Received: by 2002:a05:6a00:8d1:b0:847:8704:1c48 with SMTP id d2e1a72fcca58-8488961992emr13510240b3a.20.1784049486323;
        Tue, 14 Jul 2026 10:18:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:8d1:b0:847:8704:1c48 with SMTP id d2e1a72fcca58-8488961992emr13510216b3a.20.1784049485746;
        Tue, 14 Jul 2026 10:18:05 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:18:05 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:36 +0530
Subject: [PATCH v23 08/13] mfd: core: Add firmware-node support to MFD
 cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-8-e7453c548c21@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=8008;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=xpBz08jTmXyusCjePfq1hVafxvJ109djGJUNB0orD+8=;
 b=KXZZ51uhN5KQpmxnw/BcJEipsOj+v1rq8O/+vuB7MR4ZBpdH4zXSPh1vcBBbaGBLatOIJ7tI3
 XDEbJayfgkMDK54Wj3oA6XDxJxXNlYM5G3JYYHiV9uKvkyjsv5yH5Ci
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: K-HMq_EVohagkf7SpIA-F0wQyqmgwbGb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX8aw7VhX+APtR
 BGY2r5vuaMclCpdvwO0UUXw311MXWFZ3bzQ7/EI1X/nTCftyox9FT6TcVaFvT+A0LJjxhH8Rj0f
 OrKgUFLs/bX9ciYe26Fg+hwsWPgJHJzx6TYQSwenc16isVla/yatzLDRKXk292cAp4hj00vLSLw
 jFBfKvmoNtFoNi/b2usgBIg/Ww6m8VWneqlPP2RcTlk+HY6yQZsH0yYIy8H/aF1/rIIG5x4DJb4
 AWA+so5CmHK2AYt7L36dL1cpXM7ZUvSxfJTz+8pLXYRFtutGHWjLyuyA6tQUiAUEeQyNxaLgE21
 dZvxZFdpUKtorx8r2FcWjawFHn9mOtjThU5scoN6KuyduZtSJyckK6ygvwjndxbbLdU+rPRXa7p
 qC8i7U9CzTp70WzblrTZ8Xna7B+JXLLOF64LEqdmqcPfSXnkK+tITCiX5+7SYzlZomz0GEMIJrO
 xyJZ4Ui8kDzbYN39GAQ==
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a566f4f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=2Layw8R8_bQqnRkAqW4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX8sxsNVizMH8z
 WtAQPPE9WK6pkHyiPCh30tg8H7qYWv4ai01kJg8/b9jVL6BneNL8Of5O6ssIglnEN81ZxSuMfSD
 Nt9+pJmq0D/wzDxeRM7oq893QBtDpig=
X-Proofpoint-ORIG-GUID: K-HMq_EVohagkf7SpIA-F0wQyqmgwbGb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_101809_640398_592D2275 
X-CRM114-Status: GOOD (  28.76  )
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

MFD core has no way to register a child device using an explicit firmware
node. This prevents drivers from registering child nodes when those nodes
do not define a compatible string. One such example is the PSCI
"reboot-mode" node, which omits a compatible string as it describes
boot-states provided by the underlying firmware.

Extend struct mfd_cell with a named firmware-node field to identify a
child node under the MFD parent. The node is added to the MFD child
device during registration when none is assigned by device tree, ACPI,
or software matching.

Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/mfd/mfd-core.c   | 142 ++++++++++++++++++++++++++++++++++++++++-------
 include/linux/mfd/core.h |  10 ++++
 2 files changed, 131 insertions(+), 21 deletions(-)

diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index 7aa32b90cf1e..ba9682ead2ca 100644
--- a/drivers/mfd/mfd-core.c
+++ b/drivers/mfd/mfd-core.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/acpi.h>
+#include <linux/fwnode.h>
 #include <linux/list.h>
 #include <linux/property.h>
 #include <linux/mfd/core.h>
@@ -22,6 +23,7 @@
 #include <linux/regulator/consumer.h>
 
 static LIST_HEAD(mfd_of_node_list);
+static LIST_HEAD(mfd_named_fwnode_list);
 static DEFINE_MUTEX(mfd_of_node_mutex);
 
 struct mfd_of_node_entry {
@@ -30,10 +32,91 @@ struct mfd_of_node_entry {
 	struct device_node *np;
 };
 
+struct mfd_named_fwnode_entry {
+	struct list_head list;
+	struct device *dev;
+	struct fwnode_handle *fwnode;
+};
+
 static const struct device_type mfd_dev_type = {
 	.name	= "mfd_device",
 };
 
+static int mfd_claim_named_fwnode(struct platform_device *pdev,
+				  struct fwnode_handle *fwnode)
+{
+	struct mfd_named_fwnode_entry *entry, *iter;
+
+	entry = kzalloc_obj(*entry, GFP_KERNEL);
+	if (!entry)
+		return -ENOMEM;
+
+	entry->dev = &pdev->dev;
+	entry->fwnode = fwnode_handle_get(fwnode);
+
+	scoped_guard(mutex, &mfd_of_node_mutex) {
+		list_for_each_entry(iter, &mfd_named_fwnode_list, list)
+			if (iter->fwnode == fwnode) {
+				fwnode_handle_put(entry->fwnode);
+				kfree(entry);
+				return -EAGAIN;
+			}
+
+		list_add_tail(&entry->list, &mfd_named_fwnode_list);
+	}
+
+	return 0;
+}
+
+/*
+ * Temporary MFD-local cleanup for named non-OF child fwnodes.
+ * Remove/rework this when platform core starts owning and dropping
+ * dev->fwnode references for these devices.
+ */
+static void mfd_release_named_fwnode(struct platform_device *pdev)
+{
+	struct mfd_named_fwnode_entry *entry, *tmp;
+
+	scoped_guard(mutex, &mfd_of_node_mutex) {
+		list_for_each_entry_safe(entry, tmp, &mfd_named_fwnode_list, list)
+			if (entry->dev == &pdev->dev) {
+				if (dev_fwnode(&pdev->dev) == entry->fwnode)
+					device_set_node(&pdev->dev, NULL);
+				fwnode_handle_put(entry->fwnode);
+				list_del(&entry->list);
+				kfree(entry);
+			}
+	}
+}
+
+static int mfd_claim_of_node_to_dev(struct platform_device *pdev,
+				    struct device_node *np)
+{
+	struct mfd_of_node_entry *of_entry, *iter;
+
+	of_entry = kzalloc_obj(*of_entry, GFP_KERNEL);
+	if (!of_entry)
+		return -ENOMEM;
+
+	of_entry->dev = &pdev->dev;
+	of_entry->np = of_node_get(np);
+
+	/* Skip if OF node has previously been allocated to a device */
+	scoped_guard(mutex, &mfd_of_node_mutex) {
+		list_for_each_entry(iter, &mfd_of_node_list, list)
+			if (iter->np == np) {
+				of_node_put(of_entry->np);
+				kfree(of_entry);
+				return -EAGAIN;
+			}
+
+		list_add_tail(&of_entry->list, &mfd_of_node_list);
+	}
+
+	device_set_node(&pdev->dev, of_fwnode_handle(np));
+	return 0;
+}
+
 #if IS_ENABLED(CONFIG_ACPI)
 struct match_ids_walk_data {
 	struct acpi_device_id *ids;
@@ -111,19 +194,11 @@ static int mfd_match_of_node_to_dev(struct platform_device *pdev,
 				    struct device_node *np,
 				    const struct mfd_cell *cell)
 {
-	struct mfd_of_node_entry *of_entry;
 	u64 of_node_addr;
 
-	/* Skip if OF node has previously been allocated to a device */
-	scoped_guard(mutex, &mfd_of_node_mutex) {
-		list_for_each_entry(of_entry, &mfd_of_node_list, list)
-			if (of_entry->np == np)
-				return -EAGAIN;
-	}
-
 	if (!cell->use_of_reg)
 		/* No of_reg defined - allocate first free compatible match */
-		goto allocate_of_node;
+		return mfd_claim_of_node_to_dev(pdev, np);
 
 	/* We only care about each node's first defined address */
 	if (of_property_read_reg(np, 0, &of_node_addr, NULL))
@@ -134,18 +209,7 @@ static int mfd_match_of_node_to_dev(struct platform_device *pdev,
 		/* No match */
 		return -EAGAIN;
 
-allocate_of_node:
-	of_entry = kzalloc(sizeof(*of_entry), GFP_KERNEL);
-	if (!of_entry)
-		return -ENOMEM;
-
-	of_entry->dev = &pdev->dev;
-	of_entry->np = of_node_get(np);
-	scoped_guard(mutex, &mfd_of_node_mutex)
-		list_add_tail(&of_entry->list, &mfd_of_node_list);
-
-	device_set_node(&pdev->dev, of_fwnode_handle(np));
-	return 0;
+	return mfd_claim_of_node_to_dev(pdev, np);
 }
 
 static int mfd_add_device(struct device *parent, int id,
@@ -156,6 +220,7 @@ static int mfd_add_device(struct device *parent, int id,
 	struct resource *res;
 	struct platform_device *pdev;
 	struct mfd_of_node_entry *of_entry, *tmp;
+	struct fwnode_handle *fwnode;
 	bool disabled = false;
 	int ret = -ENOMEM;
 	int platform_id;
@@ -224,6 +289,37 @@ static int mfd_add_device(struct device *parent, int id,
 
 	mfd_acpi_add_device(cell, pdev);
 
+	/* named_fwnode is a fallback only when no OF/ACPI match and no swnode */
+	if (!pdev->dev.fwnode && !cell->swnode && cell->named_fwnode) {
+		struct device_node *named_np;
+
+		fwnode = device_get_named_child_node(parent, cell->named_fwnode);
+		if (!fwnode) {
+			ret = -ENODEV;
+			goto fail_alias;
+		}
+
+		named_np = to_of_node(fwnode);
+		if (named_np) {
+			ret = mfd_claim_of_node_to_dev(pdev, named_np);
+			fwnode_handle_put(fwnode);
+			if (ret == -EAGAIN)
+				ret = -EBUSY;
+			if (ret)
+				goto fail_alias;
+		} else {
+			ret = mfd_claim_named_fwnode(pdev, fwnode);
+			if (ret) {
+				fwnode_handle_put(fwnode);
+				if (ret == -EAGAIN)
+					ret = -EBUSY;
+				goto fail_alias;
+			}
+			device_set_node(&pdev->dev, fwnode);
+			fwnode_handle_put(fwnode);
+		}
+	}
+
 	if (cell->pdata_size) {
 		ret = platform_device_add_data(pdev,
 					cell->platform_data, cell->pdata_size);
@@ -295,6 +391,7 @@ static int mfd_add_device(struct device *parent, int id,
 	if (cell->swnode)
 		device_remove_software_node(&pdev->dev);
 fail_of_entry:
+	mfd_release_named_fwnode(pdev);
 	scoped_guard(mutex, &mfd_of_node_mutex) {
 		list_for_each_entry_safe(of_entry, tmp, &mfd_of_node_list, list)
 			if (of_entry->dev == &pdev->dev) {
@@ -382,7 +479,10 @@ static int mfd_remove_devices_fn(struct device *dev, void *data)
 	regulator_bulk_unregister_supply_alias(dev, cell->parent_supplies,
 					       cell->num_parent_supplies);
 
+	get_device(&pdev->dev);
 	platform_device_unregister(pdev);
+	mfd_release_named_fwnode(pdev);
+	put_device(&pdev->dev);
 	return 0;
 }
 
diff --git a/include/linux/mfd/core.h b/include/linux/mfd/core.h
index faeea7abd688..8daa83dd31ea 100644
--- a/include/linux/mfd/core.h
+++ b/include/linux/mfd/core.h
@@ -80,6 +80,16 @@ struct mfd_cell {
 
 	/* Software node for the device. */
 	const struct software_node *swnode;
+	/*
+	 * Name of a child firmware node under the MFD parent device.
+	 *
+	 * Used only as a fallback when no firmware node is assigned to MFD
+	 * child and no software node is provided.
+	 *
+	 * For Device Tree parents, lookup is by base node name only
+	 * (the part before '@'). Unit-addresses are not matched.
+	 */
+	const char *named_fwnode;
 
 	/*
 	 * Device Tree compatible string

-- 
2.34.1


