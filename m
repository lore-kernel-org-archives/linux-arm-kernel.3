Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A707EDEC0C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 04:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjuaWLMSN9u3yF5pzWS81BSi0cKzOD21LwxVNPmD3Dk=; b=ZGGcQeu+SmG9ym0z/nbmMSkenM
	+K0M555CWo3ln+UZxkU5hlBuOV4rCxJTclXQags5sTBIF5TP6qdPSyk0/MAhxJSnTPU5piVyUknEG
	rb95iLo1u8gZKD/F2ScxA8DSia8oXUhuqjDgnbrJvrFBl/TTs1lf+5wTS5JGY02FpgDP5sdywo7zn
	Vd227iHsdr0UQsHnfq0E4FcGoyIAwZQp3lLqttZNlbgiFeQJ/+Tpz26xmHc2GXJLZRy/sZdJPhl9k
	CKj+Awj0R9nqw+d8SP9+rloVRK1yQCt4IBtqVganKIUGLNPnHxQYIVxX/lTU3gVYhYlVVZ+4IwWSY
	TCggqJZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdSl-0000000GPLi-0OlQ;
	Wed, 04 Mar 2026 04:03:55 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdSf-0000000GPEc-48FD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 04:03:51 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rjuaWLMSN9u3yF5pzWS81BSi0cKzOD21LwxVNPmD3Dk=;
	b=J7u3hR0+2CUiuaKjfNsJkzRTtgL+yqvIbhqctAseyxoiRO4OAJHeeZIdKAWAHOvYJQE7afbF8
	3iw/Ojj6GUosnIiGOMz2wWGAcvFUQjtbUw0HEa63EwSeqyGy+3qVGcQoF/RjSSl57NLtqX/5ejH
	CfSyXUz9sR9mth5GxejV3OQ=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fQf6B2JjJzcbMV;
	Wed,  4 Mar 2026 11:58:26 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 77FAC40569;
	Wed,  4 Mar 2026 12:03:39 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Mar
 2026 12:03:38 +0800
From: Yifan Wu <wuyifan50@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <shuah@kernel.org>,
	<tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>, <ben.horgan@arm.com>,
	<jonathan.cameron@huawei.com>, <wuyifan50@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [RFC patch 6/9] selftests/resctrl: Add support for HiSilicon CPU detection
Date: Wed, 4 Mar 2026 12:03:31 +0800
Message-ID: <20260304040334.765860-7-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260304040334.765860-1-wuyifan50@huawei.com>
References: <20260304040334.765860-1-wuyifan50@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_200350_180388_BFEC633A 
X-CRM114-Status: GOOD (  10.65  )
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

Currently, the resctrl selftest suite only support x86 CPU vendors
(Intel, AMD and Hygon).

This commit adds support for HiSilicon CPUs detection, extending the
test coverage, and paving the way for vendor-specific implementation
adaptations on HiSilicon platform.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/resctrl.h       | 1 +
 tools/testing/selftests/resctrl/resctrl_tests.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index 75c595812e7d..0e91d9704023 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -41,6 +41,7 @@
 #define ARCH_INTEL	BIT(0)
 #define ARCH_AMD	BIT(1)
 #define ARCH_HYGON	BIT(2)
+#define ARCH_HISILICON BIT(3)
 
 #define END_OF_TESTS	1
 
diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
index 419d876a97c2..3299ae01346f 100644
--- a/tools/testing/selftests/resctrl/resctrl_tests.c
+++ b/tools/testing/selftests/resctrl/resctrl_tests.c
@@ -49,6 +49,13 @@ static DETECTION_ENTRY vendor_detection[] = {
 					{ .vendor_id = ARCH_AMD,	.arg = "AuthenticAMD" },
 					{ .vendor_id = ARCH_HYGON,	.arg = "HygonGenuine" },
 					{ .vendor_id = 0,	.arg = NULL }
+				},
+			},
+			{
+				.format = "CPU implementer\t: 0x%02x\n",
+				.vendor = (VENDOR_ENTRY[]) {
+					{ .vendor_id = ARCH_HISILICON,	.arg = 0x48 },
+					{ .vendor_id = 0,	.arg = NULL }
 				}
 			}
 		}
-- 
2.33.0


