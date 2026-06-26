Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B107CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 07:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iNBrekGyMQI+kIgI1pFh/0cIx/ntOCrzkyACl8RJHGA=; b=p4tzlgv/2KfjmU2oqu49Tae7XG
	2Ek3EJndWUV/lZVwjtOGPbJCLJHmK3tdbt+XoUEIWYgBNUoqy/luRD/7+c1Osmq6KYu5ZTJUF3Lff
	Lkf5IKPllrgRPtosOnKi0aBT0fE9qBCEaFGBavlJswhyAz6/as2bJJ5iy2OvbNQxvLH+ecNMjwQlF
	KcyLkrLKbdsARG2Kz6dBV89lGjXpwIK4modNF38e5TeXhnkgoElKO62lC+uAanuqHWEKKL1Nnsz4H
	jNFgnKSqW1ntFJBsnDeHo+CRlevdlWIgL6Jr2Z6NUkKt+aJffj/26pkmiTGk7CdNld9ITFp1ciIyr
	AIz7o1Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1Fi-0000000AhKi-2IBb;
	Fri, 26 Jun 2026 07:45:30 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1Ff-0000000AhIF-2VMo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 07:45:29 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=iNBrekGyMQI+kIgI1pFh/0cIx/ntOCrzkyACl8RJHGA=;
	b=1JArXj0ba6awOAuYX/oy/WQoF1qxUHF7GszWm2UxwCsRCzC0r/Nvr2MhB4uBt3DoTPkhyYY9i
	UOe9DAu0+8ntuAzn/dEklz7R9akCKOTYEgUOrahUWxyORfdKPnt5SoTy+5X22CvmuZ8cGdqL5el
	0+VgdRz588G5vJg+u9/w66M=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gmnXg2Xl3z1prLC;
	Fri, 26 Jun 2026 15:36:03 +0800 (CST)
Received: from kwepemo200010.china.huawei.com (unknown [7.202.195.178])
	by mail.maildlp.com (Postfix) with ESMTPS id DAB9E203C0;
	Fri, 26 Jun 2026 15:45:11 +0800 (CST)
Received: from huawei.com (10.44.142.85) by kwepemo200010.china.huawei.com
 (7.202.195.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Fri, 26 Jun
 2026 15:45:11 +0800
From: Qi Xi <xiqi2@huawei.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Morton
	<akpm@linux-foundation.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Yuanbin Xie <xieyuanbin1@huawei.com>, Nanyong Sun <sunnanyong@huawei.com>, Qi
 Xi <xiqi2@huawei.com>
Subject: [PATCH v3 0/2] ARM: mm: fix use-after-free in show_pte()
Date: Fri, 26 Jun 2026 15:30:46 +0800
Message-ID: <20260626073048.3595106-1-xiqi2@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.44.142.85]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemo200010.china.huawei.com (7.202.195.178)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_004528_105851_0382C11A 
X-CRM114-Status: UNSURE (   8.13  )
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

This series fixes a use-after-free in show_pte() on 32-bit ARM.

show_pte() is called from __do_user_fault() after do_page_fault() has
already released mmap_read_lock. If another thread concurrently calls
munmap(), the page table pages can be freed while show_pte() is still
walking them, causing a use-after-free.

Patch 1 fixes the main path (__do_user_fault) with mmap_read_lock().
Patch 2 protects the do_DataAbort() fallback path with
mmap_read_trylock(), which enters show_pte() only for rare FSR types
(fsr_info entries with fn=do_bad).

v3: Split into two patches.
v2: Also fix do_DataAbort() fallback path.

Qi Xi (2):
  ARM: mm: fix use-after-free in __do_user_fault() under
    CONFIG_DEBUG_USER
  ARM: mm: protect show_pte() in do_DataAbort() fallback path

 arch/arm/mm/fault.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
2.33.0


