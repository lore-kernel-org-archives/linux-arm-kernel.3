Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD1BCA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 12:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wzHVXOlpL8P0KxdHBzTscGH9M3Bx5tZKzJ9lOMnN8No=; b=xLfQYYpyTJmUKeaoL9OwG2v7E1
	lP2ciiS4sTo6chU7a3Z5oUyC0zgViJzZvrJV6Gz7JemoCBFtdLeFVzIW97bcx+Go3zUkts/4HKLxj
	zXmU7vuIPyD592Md4/wSM0P6NZp/BshWJy4a8KBN/naaoJ7NeDMM23v7A1wWVB6fk3EBgPm0Jalji
	60dWpk4KivClQTWyZA+zWtwuB/KS+l4l3jzhnwn+2SsusOzwtvXEBNoB+NSZng93HBvTrTFFWw/ZK
	ueUykA6ttdIvIL8oUrFl14lBpdMMHGJMuQ11TnNrs1eJww6kcDWDJLibWImdUpBDQ+4O9GleZhVzL
	NbhwacSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCybw-0000000DThY-1LAZ;
	Sat, 03 Oct 2026 12:13:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCybu-0000000DTh9-372G
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 12:13:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C8D1260D8D;
	Sat,  3 Oct 2026 12:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC7121F0089B;
	Sat,  3 Oct 2026 12:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791029581;
	bh=wzHVXOlpL8P0KxdHBzTscGH9M3Bx5tZKzJ9lOMnN8No=;
	h=From:To:Cc:Subject:Date;
	b=QZKtuU8mfq+l1E9m3whBms9hSug5FdrJ9dJadN10rUo6B969r14OuEgmLr+/cbwVm
	 BwgvFpAZiXOZUAwtNiOJVesqLerg9ruphzOXEBIE4hAgLGh+XMWHwBomXjaf6IPtzv
	 z5zGViC81FGe3tMhXaFowIMSQF39n8gY49t0dUxF8ktTxP98LO1T/air9XPb+9bFQJ
	 8pduGKip+tPQ9/t+5v+aB02kgKNn7mQV0YVrae94Nt+SX6DBdVVJ+KSEVDQEsnvNQn
	 h/39yZur/M6+2KQX/HvNQTl32Oa2t9cXVa5xNryYh835IRenuQos7QfWPC2sCRWHnr
	 /Z1UGygZaliWQ==
From: Sasha Levin <sashal@kernel.org>
To: James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Gavin Shan <gshan@redhat.com>
Cc: Sasha Levin <sashal@kernel.org>,
	"kernelci.org bot" <bot@kernelci.org>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] arm_mpam: make the mon_sel guard conditional only
Date: Sat,  3 Oct 2026 08:12:48 -0400
Message-ID: <20261003121251.3942666-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
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
 drivers/resctrl/mpam_internal.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index ee7c3953a9b6c..be1795b29aca2 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -203,9 +203,10 @@ static inline int mpam_mon_sel_lock_init(struct device *dev,
 	return devm_mutex_init(dev, &msc->mon_sel_mutex);
 }
 
-DEFINE_GUARD(mon_sel, struct mpam_msc *,
-	     mpam_mon_sel_lock(_T), mpam_mon_sel_unlock(_T));
-DEFINE_GUARD_COND(mon_sel, _lock, mpam_mon_sel_lock(_T), _RET);
+DEFINE_CLASS(mon_sel_lock, struct mpam_msc *,
+	     _T ? mpam_mon_sel_unlock(_T) : (void)0,
+	     mpam_mon_sel_lock(msc) ? msc : NULL, struct mpam_msc *msc);
+DEFINE_CLASS_IS_COND_GUARD(mon_sel_lock);
 
 /* Bits for mpam features bitmaps */
 enum mpam_device_features {
-- 
2.53.0


