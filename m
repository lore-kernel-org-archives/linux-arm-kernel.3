Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CA1D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 08:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/1xM64eNmtfDB9IWS+P0GPHbGqJKCBbdMnZ2WoCg8E=; b=zvsD8booGE87U2yTIwHreJwAGQ
	Z1/4r2YRWqr2IUfHduDccIAuBVlOYRvmskBWYXDiP0Ras1nx0ZrF4f+/mZGqzcyDwut07+zlD43E+
	eDJr9keFAwsnJAbTVYoHt+5bzv2PlrpLTdnXiIWgb+wZZtStMPDGrJbPz1eHIUlskJ9YNHTf6bBxM
	Fv71PJ+XrCJ7sBk6xOcfMIqiOA4G4ya0o8Rk8npcaPajRGHpbJWr6ZIursOb0FCT/KpHqUWy56hPi
	+BGSaRLB+uiXpLlg48tvpDHy93lzC8UVzUmZ7WQFHblngB8/MAPizLXcn1/NmE2lV0/5vxqcQuHlR
	VqZMql5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vStJe-0000000E0Sm-47uv;
	Tue, 09 Dec 2025 08:43:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vStJc-0000000E0SP-1LQw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 08:43:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=h/1xM64eNmtfDB9IWS+P0GPHbGqJKCBbdMnZ2WoCg8E=; b=dgTsz7KXimi/pT5lvt4tqwHCzg
	WOn59npkXYnX82twzxBTjEsmVgk2+Cv0CQwS9nopPCyVxfNo7xdSHP+sM9tgHyV+TG8oC83aRx+7Q
	fBeVr28rx+6hwUN3BfW4bw7rH4VtTyRf5Y1aaGNt7K501iWgKW1fY2JzBCsxEAl9eB5U9//6SvFBu
	7Bzdt2ROq/REctAViWjbPm4SFVS4ZwSaEf+UpMpMogQIOXX5kD2HLHKQxJTh+933acsrKZUvk2XGp
	GV1vfuQgTZs5dMabF9xo15TFnE633g9PkW+ZKvUait4UOeU14W3fUIfskjhLTVLjVvWUsm3n+K57a
	2/bCdKHQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49852)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vStJY-000000000Br-42Cp;
	Tue, 09 Dec 2025 08:43:21 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vStJX-000000005sR-1Cq1;
	Tue, 09 Dec 2025 08:43:19 +0000
Date: Tue, 9 Dec 2025 08:43:19 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, torvalds@linux-foundation.org,
	viro@zeniv.linux.org.uk, will@kernel.org
Subject: Re: [PATCH 1/3] ARM: allow __do_kernel_fault() to report execution
 of memory faults
Message-ID: <aTfhJ1yN5fB3T-De@shell.armlinux.org.uk>
References: <E1vSaS6-00000000Ni7-1FDb@rmk-PC.armlinux.org.uk>
 <20251209040223.25069-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209040223.25069-1-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_004324_379736_AFB959BB 
X-CRM114-Status: GOOD (  19.46  )
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

On Tue, Dec 09, 2025 at 12:02:23PM +0800, Xie Yuanbin wrote:
> On Mon, 08 Dec 2025 12:34:54 +0000, Russell King wrote:
> > diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
> > index 2bc828a1940c..f0884bf91dfa 100644
> > --- a/arch/arm/mm/fault.c
> > +++ b/arch/arm/mm/fault.c
> > @@ -162,6 +162,8 @@ __do_kernel_fault(struct mm_struct *mm, unsigned long addr, unsigned int fsr,
> >  	 */
> >  	if (addr < PAGE_SIZE) {
> >  		msg = "NULL pointer dereference";
> > +	} else if (is_permission_fault(fsr) && fsr & FSR_LNX_PF) {
> > +		msg = "execution of memory";
> >  	} else {
> >  		if (is_translation_fault(fsr) &&
> >  		    kfence_handle_page_fault(addr, is_write_fault(fsr), regs))
> 
> This patch caused a compilation error, is_permission_fault() is not
> defined. Fixed with:

Thanks - as you've guessed I have some other patches on top of this
which move the is_xxx_fault() into fault.h.

However, for the sake of this series, my preferred fix is to group
all the is_xxx_fault() inline functions together as the first patch
of this series:

8<===
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [PATCH] ARM: group is_permission_fault() with is_translation_fault()

Group is_permission_fault() with is_translation_fault(), which is
needed to use is_permission_fault() in __do_kernel_fault(). As
this is static inline, there is no need for this to be under
CONFIG_MMU.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm/mm/fault.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index 2bc828a1940c..f87f353e5a8b 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -128,6 +128,19 @@ static inline bool is_translation_fault(unsigned int fsr)
 	return false;
 }
 
+static inline bool is_permission_fault(unsigned int fsr)
+{
+	int fs = fsr_fs(fsr);
+#ifdef CONFIG_ARM_LPAE
+	if ((fs & FS_MMU_NOLL_MASK) == FS_PERM_NOLL)
+		return true;
+#else
+	if (fs == FS_L1_PERM || fs == FS_L2_PERM)
+		return true;
+#endif
+	return false;
+}
+
 static void die_kernel_fault(const char *msg, struct mm_struct *mm,
 			     unsigned long addr, unsigned int fsr,
 			     struct pt_regs *regs)
@@ -225,19 +238,6 @@ void do_bad_area(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 }
 
 #ifdef CONFIG_MMU
-static inline bool is_permission_fault(unsigned int fsr)
-{
-	int fs = fsr_fs(fsr);
-#ifdef CONFIG_ARM_LPAE
-	if ((fs & FS_MMU_NOLL_MASK) == FS_PERM_NOLL)
-		return true;
-#else
-	if (fs == FS_L1_PERM || fs == FS_L2_PERM)
-		return true;
-#endif
-	return false;
-}
-
 #ifdef CONFIG_CPU_TTBR0_PAN
 static inline bool ttbr0_usermode_access_allowed(struct pt_regs *regs)
 {
-- 
2.47.3

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

