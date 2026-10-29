Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC0D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 12:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HwW/b560;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=RDi9sqvQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9LtYTlF4nmZX0qyti0J6LbKRcdJci5QGUwvdH4bCuSg=; b=HwW/b560zBJ45eahBj7p1mf9Gu
	IW+pHxWQSrVADqqZmwJwVMb6rQiU8I0ud+2UvXc4S93qzfECC/7BAaLFhu1IvkEo7p1IbWu4aGCTC
	bYeBrEjvH641RLFV7fFHl+d52n3YixYRF3+3NgZ4plmMkU28mSZsH2t/kbuxVBnnH7wEqdwkk1LPP
	kq/CaCPpbhIgLqisImZZuBZabfGOOf/M5Wch2QTAzrgtAuXnf0asaSvXCdt0BasUowSgO7lKNsUN5
	kaZJwOxeVMBoi607sawGuVAOVS25fGq9t70SrAYzT6o9uZdf1hlSfGBlfjKIczqGAItYcc8tpIuLV
	af3BtZwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPNh-00000009B0S-2Ahk;
	Thu, 29 Oct 2026 12:37:21 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPN7-00000009AQI-1KHk;
	Thu, 29 Oct 2026 12:36:48 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9LtYTlF4nmZX0qyti0J6LbKRcdJci5QGUwvdH4bCuSg=;
	b=RDi9sqvQcqUUiXoJvYPkjsWO3kL7JyvV/wAgS2GQ4J7Kxr4nmZZQYZahupS82jwtpiewQV9/q
	7vDwE3uxIQeHUF/yqp0k9IJcCmDectsntLoK6cAMnyVj7FnLCJFkIJaI1b9OoZv5ID4eP7O+fWq
	rAcoKrXBIimdTsdw4quHXxY=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4jFkJ114b0znTV7;
	Thu, 29 Oct 2026 20:36:49 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id C2EC54056C;
	Thu, 29 Oct 2026 20:36:42 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 20:36:41 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <reinette.chatre@intel.com>, <james.morse@arm.com>, <ben.horgan@arm.com>,
	<fenghuay@nvidia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>, <zengheng4@huawei.com>,
	<gshan@redhat.com>, <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 06/19] resctrl: Remove the L3 monitor event names
Date: Thu, 29 Oct 2026 20:35:58 +0800
Message-ID: <20261029123611.1108424-7-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029123611.1108424-1-ruanjinjie@huawei.com>
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_053645_542666_F1EC2029 
X-CRM114-Status: UNSURE (   7.56  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Every user has moved to the resource-agnostic monitor
event names. So remove the old ones.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 include/linux/resctrl_types.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
index 8679cbe589ec..d0e56de038f0 100644
--- a/include/linux/resctrl_types.h
+++ b/include/linux/resctrl_types.h
@@ -71,10 +71,4 @@ enum resctrl_event_id {
 #define QOS_NUM_MBM_EVENTS	(QOS_MBM_LOCAL_EVENT_ID - QOS_MBM_TOTAL_EVENT_ID + 1)
 #define MBM_STATE_IDX(evt)	((evt) - QOS_MBM_TOTAL_EVENT_ID)
 
-/* Old names, kept until every architecture has been converted. */
-#define QOS_L3_OCCUP_EVENT_ID		QOS_OCCUP_EVENT_ID
-#define QOS_L3_MBM_TOTAL_EVENT_ID	QOS_MBM_TOTAL_EVENT_ID
-#define QOS_L3_MBM_LOCAL_EVENT_ID	QOS_MBM_LOCAL_EVENT_ID
-#define QOS_NUM_L3_MBM_EVENTS		QOS_NUM_MBM_EVENTS
-
 #endif /* __LINUX_RESCTRL_TYPES_H */
-- 
2.34.1


