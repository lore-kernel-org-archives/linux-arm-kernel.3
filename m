Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1AEC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 13:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NUSuAjRqGx/M5QwIVqLGu1DFHbMG8Qa3csVgkMOVrvQ=; b=aojAVBBu0fqa8fh+a7+Bshihtr
	tq/42t5Gwv2LUNLL5LeMNOU1wpoB/h/xqPJvi+CTSyZNWzZzVWJJiPj+YY/oHQEHmERDGeGCZVC8d
	NwKXl+kKejnztOKZBrA//Ekur8jtW+L3SqGrOkgjjFsh8EKHw1ZxP6otyQHnrQSSVk9SZtwGbp7N7
	1yK48VWmPd1LrfPaVjLTAZo6HfgXZBO+Sn4kyVg7RFfZ9w893CiYnEcgSWZ2osqdY8Aav0PNQglI2
	taW86Yqoc4RO/Wft95U49pS/ZyvdCF8J+THCFXGAY3feJxqYNDSlVSAgo8J388zbclW0vI8Ijd8wC
	k/h1fddQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5OCy-00000000v63-2qyB;
	Sat, 12 Sep 2026 13:55:56 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5OCw-00000000v5h-11A4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 13:55:55 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3964e480f76so2549441a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 06:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789221353; x=1789826153; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NUSuAjRqGx/M5QwIVqLGu1DFHbMG8Qa3csVgkMOVrvQ=;
        b=K5MwFbwKouLi47tMZXP03ydPyJdA7paWOBTB2NwTpmYy2w13NxDO8yPxytDLoRZGMD
         +VDZEDC4d6cKe1StlxmLfzm2JRycRGwKpk2N/c0RqIGs7wmN9VNh3/HuLN8K4UcJN37G
         vBzqnhJngABg8EGsIO+xSyJWzcabiK2Y78wyNHZPiU2cdz3FS/AuxmmEI4ZTHAkBR4U5
         lznKJLJkL7ILRMOT7x1qN3mmerjUpf5SpPZgW/EtXtdD7ZGYglOVT5aWEva0YLwJSFAv
         fk3NLZPCzT1sTz+j1B838EEjS0N1R/dMNVlVkGp4OzNB/i/0a8ZW9zldSU/kyz6DluVi
         uiKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789221353; x=1789826153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NUSuAjRqGx/M5QwIVqLGu1DFHbMG8Qa3csVgkMOVrvQ=;
        b=FV93VHBkVB8o6XieMgvEagNKRgnOmGDWliySs0OwTe/3kv1x+b+3VqCBgfoKXAFXe/
         2rUhJQ6APhb5PI4KeSwFRApkSrZBHlvAQW/z0dzcNci6SIf6hieXN9NmgllOHQrsGYqX
         rcNZs0kQQ7nglVnjbfM3Vf32EJRTT6AeIRjWhjVqYB8+P4nXDWW3WAx/jiHC2eBPf3Ld
         0XtU67IU8ugsIwM2kumciJOcWjYt/xWwZLht3pjDRCeIPj++yKHKe5KexynzAVmKR8zj
         53BF4j9QUOo8dGUR15P+q/2lDAkk4zuNl+hg/UWhWVSPVJYD7geKDLsJrHwJdN+78UDv
         HNmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIfo5MQr8+SFeFnRXsqR3yfwLDPQDTXtOeGNl7UvS0eaZKKw2SdOz94XDxGa6b1q+u+hNe8jrzQBuH38TEjtgd@lists.infradead.org
X-Gm-Message-State: AFuF++keT0qNhd45jHyOHIaizrhJIXUpCb7/FibB1UKJMPux8Gz15jOC
	z5UUQXNR+StWyMSkRg0E+3Cu5uXGHifAgEbYc6+N9lWa0RMqeKImpe5n
X-Gm-Gg: AYBFou1yvBxASx93GOHLMBNHXwTb6WKXlciePvxCUsiDCTYMMFd4I31ArjhZwmWciwV
	VK3BpLcOv0PqHzKQYm9rf0NIXRMrxA2gIU8EgcqkIF82iFmtpEd930nos0MYjG9YxTbIuSz0O5G
	DXutMWlYZU2Y5wUbdGYVMFk0zxNLUbemArf3tuH7oxIGur9AMAl6wqseG4SFubx+wtAX59GpMsL
	dvODpV5wkeQfab62UjnyzNEPV+W3cJ7SbVxp2aWxbaVI+clVd/25YFaxspGtoYGk/BI/7BnMJcc
	1bi41/t5TIMnPBFZPTbUIFbO0Qc5Y3umAHWwJ4JFzTTs9WLxFVAOG+ZFb1PxZwWL2gfg1gcOk5z
	0it9oeSnOrubN0mxCgbiOvtEBRWFhX09uU70OmiwFaGJCBEfQe7efuM9XXgJe0syz1rC2x21itT
	74R/yll2LHozmmPAs/S8nO4xwhoEmf6rXmiaJBHuZs0SgvjEX1z7q56Vwvz63XwxRFtI6LPOQF+
	MV3B5clXNTiSLOG
X-Received: by 2002:a17:90b:5823:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39d9c0aad8dmr16512252a91.16.1789221352785;
        Sat, 12 Sep 2026 06:55:52 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:dfd9:c41e:7c9b:c69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9afb1900sm3068760a91.0.2026.09.12.06.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 06:55:52 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	syzbot+635d160c0d4133481520@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [RFC PATCH] arm64: mm: recover from kernel-mode SEA via exception table
Date: Sat, 12 Sep 2026 20:55:46 +0700
Message-ID: <20260912135546.55977-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_065554_288093_182B545A 
X-CRM114-Status: GOOD (  14.96  )
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

do_sea() unconditionally calls die() for a synchronous external
abort taken at EL1, without ever consulting the exception table.
This is inconsistent with __do_kernel_fault(), which does check
fixup_exception() before giving up.

A SEA at EL1 is reachable and recoverable: futex's LL/SC atomic ops
(__llsc_futex_cmpxchg/__llsc_futex_atomic_*) carry
_ASM_EXTABLE_UACCESS_ERR entries, but if the user address is mapped
to Device memory (e.g. a PCI BAR obtained via sysfs "resourceN" and
mmap'd MAP_FIXED), the LDXR/STLXR pair faults with a SEA instead of
a translation fault, and the extable fixup is never reached, so the
kernel oopses instead of returning -EFAULT to userspace.

Check fixup_exception() for kernel-mode SEAs before dying, mirroring
__do_kernel_fault(). No taint is added on the recovered path since
this is a userspace-triggerable condition, not a hardware failure;
a ratelimited warning keeps a trace of it.

Reported-by: syzbot+635d160c0d4133481520@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=635d160c0d4133481520
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Sent as RFC: verified by code inspection (ESR/DFSC decode matches
the extable-carrying LL/SC futex path) but not yet reproduced under
QEMU on my end; would appreciate a look before I chase the aarch64
repro further.

 arch/arm64/mm/fault.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 0b52557652be..fe5a5c5bbc27 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -878,6 +878,18 @@ static int do_sea(unsigned long far, unsigned long esr, struct pt_regs *regs)
 		return 0;
 	}
 
+	/*
+	 * A SEA at EL1 can happen from uaccess helpers (e.g. LDXR/STLXR
+	 * on a user page mapped as Device memory, as in the futex ops)
+	 * that carry an extable fixup. Let it return -EFAULT instead of
+	 * oopsing the kernel.
+	 */
+	if (!user_mode(regs) && fixup_exception(regs, esr)) {
+		pr_warn_ratelimited("Recovered SEA at kernel uaccess, addr=%#lx, esr=%#lx\n",
+				    far, esr);
+		return 0;
+	}
+
 	if (esr & ESR_ELx_FnV) {
 		siaddr = 0;
 	} else {
-- 
2.43.0


