Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075A0CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 16:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NXuUtB3CCXhL8r1+lAD105SNTsTgZT7Ex3o2hArVMWY=; b=NE8joQ41ib3MmeNLqioIDvT7Uz
	dEqarlGBugEKzuDGSux75bBuFe9z4Gs1P5zTTq6t4jocOER1Bs7HRIn3frY/TASbQnCngaJhGL+y5
	UxQ86okSaAfTH9l/qjAuUzrV8T3zj/UM1zyNT7pZoioDqPkzioik+R2Phx5IVEPMbVuait3BdE9mx
	tHSATBCAPF5onQHnmED6bKbbTFEfEjo5IV/IOgULtqANJ46iXfeFdb5ZObm04HXgLzo7sWMVixjMQ
	iY2cA0c4uUTQxKSSOyMEEzz1CzmRPHjSgOUTUc2azQxJap2TmVpAQ2GkE7VgDf9ODxDPuECPQaPlO
	ZIBvWcIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpxF-0000000HMG0-2zZo;
	Tue, 12 May 2026 16:27:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpxD-0000000HMFJ-2BsO
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 May 2026 16:27:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NXuUtB3CCXhL8r1+lAD105SNTsTgZT7Ex3o2hArVMWY=; b=gHmRM592BEf6Dk/Pl14Plve7Ph
	9MEXpjTo4GMS8u5A7SljtgoLPyWuFXnsVOgVlLSQ2QjxGSFxVrvMZ/iZXAYHKaHCn1g6A1DhIXojE
	0hrx3S9lRhFwS7nsVfsa3USJeJphFfzvQ5tu9FiTdbeI5GncZp0LF/m2MxBMD3wH2ksq2iTwH2+Bx
	12deSfg2BvuI74IOn7VkvasjdFX2OP2uAjlL8KCHReo+fn7gpv04gzc2LFqWilLzw66h8DLnAGaMs
	MWuam+LxcNgja6oRjYZPO21cvo5WfNEWCsotHD2wdjwabeFK6gLmW6X0JQJcBLrp+SYdvVEhhdgF2
	ddYsnMbA==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpx9-0000000FKGf-0hHo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 16:27:29 +0000
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4gFMRx3mj1zHnGdH;
	Wed, 13 May 2026 00:26:53 +0800 (CST)
Received: from mscpeml500003.china.huawei.com (unknown [7.188.49.51])
	by mail.maildlp.com (Postfix) with ESMTPS id A5D4E4058E;
	Wed, 13 May 2026 00:27:01 +0800 (CST)
Received: from localhost.localdomain (10.123.66.205) by
 mscpeml500003.china.huawei.com (7.188.49.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 12 May 2026 19:27:01 +0300
From: Fedorov Nikita <fedorov.nikita@h-partners.com>
To: <1234567weewee457@gmail.com>
CC: <fedorov.nikita@h-partners.com>, <stepanov.anatoly@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arch@vger.kernel.org>, <linux-mm@kvack.org>,
	<virtualization@lists.linux.dev>
Subject: [PATCH v3] locking/hqlock_core: restore missing call in contention detection logic
Date: Wed, 13 May 2026 00:25:03 +0800
Message-ID: <20260512162503.1843025-2-fedorov.nikita@h-partners.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512162503.1843025-1-fedorov.nikita@h-partners.com>
References: <20260512144908.610907-1-1234567weewee457@gmail.com>
 <20260512162503.1843025-1-fedorov.nikita@h-partners.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.123.66.205]
X-ClientProxiedBy: mscpeml500003.china.huawei.com (7.188.49.51) To
 mscpeml500003.china.huawei.com (7.188.49.51)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_172727_681525_1272E86C 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

A call was accidentally dropped while splitting the hqspinlock patch series.
It did not break the system functionality,
but caused the lock to stay in QSPINLOCK mode.

Restore the missing call.

Sorry for missing this in the previous posting. I rechecked the whole path after fixing.

Signed-off-by: Nikita Fedorov <fedorov.nikita@h-partners.com>
---
 kernel/locking/hqlock_core.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/locking/hqlock_core.h b/kernel/locking/hqlock_core.h
index 74f92ac3d8ad..226a0bb9a667 100644
--- a/kernel/locking/hqlock_core.h
+++ b/kernel/locking/hqlock_core.h
@@ -580,6 +580,8 @@ static inline void hqlock_clear_tail_handoff(struct qspinlock *lock, u32 val,
 
 		hqlock_handoff(lock, node, next, tail, handoff_info);
 	} else {
+		update_counters_qspinlock(qnode);
+
 		if ((val & _Q_TAIL_MASK) == tail) {
 			if (low_contention_try_clear_tail(lock, val, node))
 				return;
-- 
2.34.1


