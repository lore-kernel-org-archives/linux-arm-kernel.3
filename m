Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D31CCA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 16:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8UB6+jjpF31hb+q4x1Zq5hI5lb352r6B0Ghit+olxY=; b=V9n5m/fFe/iYAWzGSPqTFuWkEs
	/BXowgaL9hilTRpHQ4deEScmKIMHIsEPWlNaZZ7PliqAafjJfEjSD8g7D4wSKAGaTpT54SwY02PiO
	/LRNgv03auA/uYZgt10fr2qvVaKzCFBgnkyETwYlibrhK5Yep8joSxt4+Fnlex02GbqZqjwDpNw+N
	Ro0mF7/gOiC4K4fDm+6OHltzfd4N1E8naSS9QfT2lvKbxyDJ7gdiIqRsxccpy1rnXb21VUD820h/d
	ufAX/iRDo7KzURzABVfDWCz7r2hbBiMUZ8ws17rSpD94m3H9DDrsxZio7M23SUeZEsHmuMR3b76ZK
	Qh9/LoOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDWX-00000006ewt-1A4V;
	Fri, 09 Oct 2026 16:32:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDWU-00000006ewB-02OM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 16:32:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 65F2240162;
	Fri,  9 Oct 2026 16:32:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4318B1F00893;
	Fri,  9 Oct 2026 16:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791563561;
	bh=v8UB6+jjpF31hb+q4x1Zq5hI5lb352r6B0Ghit+olxY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a3m9XDKv8NyKyGJwhSs5E1Y7xeGJ8giPb8g2D37BVYZQe+v/FHxL+NB9OXxSegkcN
	 ikFwO5EaQP2Sq3LAXZeqnRB71inx5yQvqqx2luLo6kicVIhwu8NzoWSWdZMmAn5m7W
	 EuLEkdyyecO6Wm61UyTYtg8U7Kh8WjhUX2fewdhubhHWklOuAtLLZ9OcGGxIRqo92I
	 an0oP5xsjH3lDXY6WYJOrjyJ3h2uy5pYRmSY9iYuTqSURqjBt2UL0rNPrgJKv6ow08
	 aoPftfKd86VW+7hjTQAb1wmpBKLkg2xZQArWTlpFkNSKhrKJ1cmAncOQE7ilLp8ess
	 KADbSLx/KQkiA==
From: Sasha Levin <sashal@kernel.org>
To: ben.horgan@arm.com
Cc: andre.przywara@arm.com,
	bot@kernelci.org,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	james.morse@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	justinstitt@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	morbo@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	reinette.chatre@intel.com,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH v2] arm_mpam: make the mon_sel guard conditional only
Date: Fri,  9 Oct 2026 12:32:35 -0400
Message-ID: <20261009163235.3-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <7490d5e6-ac9b-4f23-b58d-60eec2882e60@arm.com>
References: <7490d5e6-ac9b-4f23-b58d-60eec2882e60@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Building arm64 allmodconfig with clang fails:

  drivers/resctrl/mpam_internal.h:207:7: error: ignoring return value
  of function declared with 'warn_unused_result' attribute
  [-Werror,-Wunused-result]
    207 |              mpam_mon_sel_lock(_T), mpam_mon_sel_unlock(_T));

mpam_mon_sel_lock() is __must_check and can fail: for an MSC accessed
through the MPAM-Fb firmware interface it returns false when called
from a context that cannot sleep. The mon_sel guard was defined with
DEFINE_GUARD(), which calls it unconditionally and discards the
result, so a guard(mon_sel) user would carry on without the lock and
release it on scope exit. The unconditional guard only exists as the
base for the conditional mon_sel_lock variant, which is the one
actually used.

Define mon_sel_lock directly as a conditional guard class instead, as
posix-timers does for lock_timer: the constructor returns NULL when
the lock cannot be taken, and the destructor only releases a lock
that was taken. ACQUIRE(mon_sel_lock, ...) works as before, including
ACQUIRE_ERR() returning -EBUSY on failure, and there is no
unconditional variant left to misuse.

Reported-by: kernelci.org bot <bot@kernelci.org>
Closes: https://d.kernelci.org/i/maestro:66f869ecbbb5b8592562ffd89f049c5ddf682547
Closes: https://d.kernelci.org/i/maestro:647269216758644837afcaac8e67d8dbe713a0e2
Fixes: 0db1715e4c9c ("arm_mpam: propagate MSC access errors for hw_probe functions")
Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Changes in v2:
- Use an if statement in the destructor, as suggested by Ben Horgan.

 drivers/resctrl/mpam_internal.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index ee7c3953a9b6c..1f86cc158100b 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -203,9 +203,10 @@ static inline int mpam_mon_sel_lock_init(struct device *dev,
 	return devm_mutex_init(dev, &msc->mon_sel_mutex);
 }
 
-DEFINE_GUARD(mon_sel, struct mpam_msc *,
-	     mpam_mon_sel_lock(_T), mpam_mon_sel_unlock(_T));
-DEFINE_GUARD_COND(mon_sel, _lock, mpam_mon_sel_lock(_T), _RET);
+DEFINE_CLASS(mon_sel_lock, struct mpam_msc *,
+	     if (_T) mpam_mon_sel_unlock(_T),
+	     mpam_mon_sel_lock(msc) ? msc : NULL, struct mpam_msc *msc);
+DEFINE_CLASS_IS_COND_GUARD(mon_sel_lock);
 
 /* Bits for mpam features bitmaps */
 enum mpam_device_features {
-- 
2.53.0


