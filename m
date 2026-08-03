Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AB1C5518E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 09:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BMf292AZeOlCNbfbdHJJYz8+230HZxidGqGvw+WCW6M=; b=m6/7Q8VnqvMCgeSlTVNsZ24q0V
	newshQB3XrEzuVlNWR7QU2+pSkmRdmx7rWGBxwYm7/iwdQv2qQ3o1yvLjHWg1myvFfg4ZUtQPNOht
	cOmTn7cnLqKDSKU9EqWy7UdHxZNGak8oH9ReWVu+5oUzwSqGnFTfErkyZOEx8m1UNO5QOZy/KCKS+
	Nt07mbmS5pN7tRQ8yqhtWsONGPt91zaEXCn+zUB590GLrO88OiLa9YPNSpvDm5HMalJZCjo+VZ1hG
	o821VoGZWXB18hQhFlNZpr900UKFKUssJq7Zq54C71peGxagFBgIRZeG++ykdGhfueqTFedEdFnfq
	/18epKRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpFA-0000000GjnI-0UOi;
	Mon, 03 Aug 2026 09:46:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpF7-0000000GjlH-1j2Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 09:45:58 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736EwIg005487
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Aug 2026 09:45:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BMf292AZeOlCNbfbdHJJYz8+230HZxidGqGvw+WCW6M=; b=fgzCke40gnRS4arn
	f9EwwqN6SB3k1PoNe0aMjz9vMUA0BE24rlR6kj6GGgmT2Wpf8Cyz4zz1fWdxXsML
	zPolrcIt3Y2deLVuUlcokcNJDMN24RmuVBSh+UnWXQH2KbNw6+YQ542FcJNDdXP8
	odgTF2e5YSA/5jo2KCZTIIQEyXo14eJG65UbRE1uIhNfwULznEpv88JBwCo5W+2C
	i2M+0ELnZ8yLr4dGDL6Ke2wI0JSiD7JwV/O35FPPxJtx5mO1boNy5bwi31jqCLG5
	UK9lVtVcSJizltAXIpGCbNoFF25agggUKY4NB/Mk0r3Nuu39FQscxEqY5/M4lS9h
	9MJGKA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnj78vuu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:45:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e7621655eso5930334a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 02:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785750355; x=1786355155; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BMf292AZeOlCNbfbdHJJYz8+230HZxidGqGvw+WCW6M=;
        b=U0zoHYHuYFBmOdirY7uxcyI9MP0g6EjM6RtRmyax2Z8tMaOKsgqsmofXb4wjNvs+kB
         3Z5qctGNI6IItkluT9xapDteWBOx2Q/aCJvrbST6Z/yWor8tG+A+O0KaIiUb3vL1ZqMi
         udwj2tbmLSLM43psZvxnd/d362l4jxvywsvpvWbykPEWnyx+HCQy+fmdBZRacOxt4Try
         go/swWNyZ9OS+/JzXi0uoOywbfUNeysuvAzskpCWXNSqfPKEXlSRsnntIHh6t9/TxIjH
         5rD0pJCJToEvA8ipaeSeVy957NEhwzIsiZFHHQwU8+N0rHwZfyLs9rWOeDUirvRpRzP/
         W3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750355; x=1786355155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMf292AZeOlCNbfbdHJJYz8+230HZxidGqGvw+WCW6M=;
        b=PwX3q7H9Mkmm44RO6ojlbbFsG3Z8AvjxM0mvNkpvWIxgMHA3r7iLCQb16pG6rIvVC7
         z7Dw8Eivc0Y5gL+5cDF38ipC1FUU6cMovfUibjJbWBuS1bzdpCBUJJvm/dYRy7nenOwo
         hemU+tKVg2ed5wAPD+emh00hVx8jwl8imbWLIYrtp8dBPxc0VGuAz17k/rk73HQtfPGl
         AZa3d2UEEn1PwlCCdVSkU8CpxNhq6gibt7DdMGS7JYpSoU73YHPpckY7dvsr/mTDshef
         ix9U2nNvK+GuJeauEIdr6jkQUb5omFBpNokzeXYCP6hnv0rkTlrDfgEBqbGCjzphCtwZ
         rXAw==
X-Forwarded-Encrypted: i=1; AHgh+RrKAC2OYCdzF+JeP62RJa4ZKXfCYsnfZWgq+71/wkt4VhXH6oaOnnGuO/LXkGL4TWPXVEp466Hq6VwiyZqKkw61@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8qujxw4FqOKSy0+rK/mSAdc4YoEG/HTGOwoP+SM03RQWmvtx1
	xtPC4YRcTshsYweSh8aFAklDZrmnMcC4JqC6XH3zkUbch5ezl4jiBM8dY5Jh91x+deCp3xBJo9p
	Th+vLCQgaPLNhamCzkYpaFNPAi3VD+xDOelVirKluil933g0w6Y3SAGepH9eEx9dtgxQ79obR8K
	VDBw==
X-Gm-Gg: AR+sD12lckmP+s3vEGyE+IePKvVEeAN5i0nQghVEUb//D4r6qm7Qe2X5ghv9D+XP9Gs
	HG7koexYIbRIcQphgU9IjoQEXMVyBFJWuQlM+4iQPRPmrqQxzNaDnmsYV91dKJMqaWz6v91c6TA
	zgsXZuG8z6JnlSG6kMX63DDTCid284sAInZoXhcCxcgF0S1FQuQ7z6Jn9bPsTbO4Cp7+2RdkIEs
	tZHJqZp2sVmgl3aet+I0fEpJ+xnzXwYKjKwI9ah4vbRcXHfTra06kJwiYov9SWAqvdAKr/NJQYR
	PO8paZbzLABbKnZutlZgz2+1KMQRdUpWoVCgAmkbVUS6SvKwVg46Uhf8Z3xYp/kmdX5kzFkE8Bq
	jZRXGtvJ1ZfDVT0uJqSc3rmrSb7Q3F4bFl6Cb
X-Received: by 2002:a17:90b:2750:b0:38e:2c8f:a01a with SMTP id 98e67ed59e1d1-38fbc42c3a1mr7726862a91.11.1785750354998;
        Mon, 03 Aug 2026 02:45:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2750:b0:38e:2c8f:a01a with SMTP id 98e67ed59e1d1-38fbc42c3a1mr7726841a91.11.1785750354407;
        Mon, 03 Aug 2026 02:45:54 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2be6c8csm3660671a91.13.2026.08.03.02.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:45:54 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 15:13:38 +0530
Subject: [PATCH v24 07/12] mfd: core: Add firmware-node support to MFD
 cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm-psci-system_reset2-vendor-reboots-v24-7-889281373870@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
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
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785750274; l=7933;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=YF09NFBv8XV2mwwiWYdQirwqkhH8XmGEPACV2jstcps=;
 b=iWxDeilK2zVkbE2E9xjCYxx29tooW1BOq49KVaULUzqDdvX/jStMSvMhIwd2nOaQew8OoeMcI
 lKpd/Cq9ECPCTsZ1UmShciKwCIG6nToGM9niWP3D+6sLmE/kCk2I2ku
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: j_oq2fwjnzusvWgGDs1TQogMqm0oEVbe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfX58VjbiblBP8W
 ++YMb6cLrZR4yoSfsWFYvwq4QUSt5QM8AYM2JsCam0Tjv9X/Gq1YbH01NtuojAmdqg+C/gkjuIG
 kBoKd7G+o3XYShgdNEbT9jwjVnAtrT0byhd3cU0TwdxrKVIRJIeUzJMallXHjC7KZEeKSTWaUc+
 sfh3ZK4J6Jn/c4MJHRNYVT7FL+QXtzj8sZMwhohmVUIpBiXk/I9joXNKphcjXXr+HI/Vy8WNTzs
 N/nd0VNLGryTU7CzkbQkNnp7CLWNc70b0z+KIJDaGo/qbgKzMlw2BhCzh6xUBOwVvVvE7VY/Ufy
 M2C6m6hOx8ek4vzQr+0/XlVTgTdXfXXGWc+TKsCf/PIFN+n/FAObDNcYI38KWhlxiKyoExXV8UG
 BkGIgp7KcLK+NoAS7/LBoIsiRT/rnGGC/uKXByFsc+piK1/y55c6uPWvr9of/VCEO20c/7Bo+Lj
 mSm0Kncnn8w1B8VwOag==
X-Proofpoint-GUID: j_oq2fwjnzusvWgGDs1TQogMqm0oEVbe
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a706354 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=2Layw8R8_bQqnRkAqW4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfX0EKkyF68C5iP
 EK1QOnabSccmusf9p4dSbCIMqwWCMOvCE66WmX1PHQxpgXimB7awfXtb29lI7gFndC3yZwiiDju
 BIUh5RHYw3FuQeq/Doepu7bXIGx5VR0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_024557_584668_CCF06154 
X-CRM114-Status: GOOD (  28.60  )
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
 drivers/mfd/mfd-core.c   | 151 +++++++++++++++++++++++++++++++++++++++++------
 include/linux/mfd/core.h |  10 ++++
 2 files changed, 142 insertions(+), 19 deletions(-)

diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index 7aa32b90cf1e..79b400535138 100644
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
@@ -134,18 +209,48 @@ static int mfd_match_of_node_to_dev(struct platform_device *pdev,
 		/* No match */
 		return -EAGAIN;
 
-allocate_of_node:
-	of_entry = kzalloc(sizeof(*of_entry), GFP_KERNEL);
-	if (!of_entry)
-		return -ENOMEM;
+	return mfd_claim_of_node_to_dev(pdev, np);
+}
 
-	of_entry->dev = &pdev->dev;
-	of_entry->np = of_node_get(np);
-	scoped_guard(mutex, &mfd_of_node_mutex)
-		list_add_tail(&of_entry->list, &mfd_of_node_list);
+static int mfd_attach_named_fwnode(struct device *parent,
+				   struct platform_device *pdev,
+				   const struct mfd_cell *cell)
+{
+	struct fwnode_handle *fwnode;
+	struct device_node *named_np;
+	int ret = 0;
 
-	device_set_node(&pdev->dev, of_fwnode_handle(np));
-	return 0;
+	/* named_fwnode is a fallback only when no OF/ACPI match and no swnode */
+	if (dev_fwnode(&pdev->dev) || cell->swnode || !cell->named_fwnode)
+		return 0;
+
+	fwnode = device_get_named_child_node(parent, cell->named_fwnode);
+	if (!fwnode)
+		return 0;
+
+	if (!fwnode_device_is_available(fwnode))
+		goto out_put;
+
+	named_np = to_of_node(fwnode);
+	if (named_np)
+		ret = mfd_claim_of_node_to_dev(pdev, named_np);
+	else
+		ret = mfd_claim_named_fwnode(pdev, fwnode);
+
+	if (ret == -EAGAIN) {
+		ret = 0;
+		goto out_put;
+	}
+
+	if (ret)
+		goto out_put;
+
+	if (!named_np)
+		device_set_node(&pdev->dev, fwnode);
+
+out_put:
+	fwnode_handle_put(fwnode);
+	return ret;
 }
 
 static int mfd_add_device(struct device *parent, int id,
@@ -224,6 +329,10 @@ static int mfd_add_device(struct device *parent, int id,
 
 	mfd_acpi_add_device(cell, pdev);
 
+	ret = mfd_attach_named_fwnode(parent, pdev, cell);
+	if (ret)
+		goto fail_alias;
+
 	if (cell->pdata_size) {
 		ret = platform_device_add_data(pdev,
 					cell->platform_data, cell->pdata_size);
@@ -295,6 +404,7 @@ static int mfd_add_device(struct device *parent, int id,
 	if (cell->swnode)
 		device_remove_software_node(&pdev->dev);
 fail_of_entry:
+	mfd_release_named_fwnode(pdev);
 	scoped_guard(mutex, &mfd_of_node_mutex) {
 		list_for_each_entry_safe(of_entry, tmp, &mfd_of_node_list, list)
 			if (of_entry->dev == &pdev->dev) {
@@ -382,7 +492,10 @@ static int mfd_remove_devices_fn(struct device *dev, void *data)
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


