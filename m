Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC42C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 06:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAtRoMW47q6eWngfmkGzhbl2Om3dflePIieHts+FOBI=; b=x2zotgydNJrceM8vV/YBoqg8FE
	MiwQDVBeXaYkHteqryQE3JBhNMwtCbZD9DHPtuDFNroUt2s+58oUUmUzlP8IDGqH3pt5qfPlNw8TN
	yMJC7LT1JGUvrOXf+vnifdzDcy6lI2FDPFlKhntk6gOtmhyJU3IiiMU1fwtcYR2BjEpxJ/mBtIvKv
	CUHR+8I+df+ZKrXYSUIBxT5A46d2MpK0vz0aElfpkZna4U5i9zX3Y3rrthezRmffY1G0GVJvbg7Gp
	3XOBtSWCfYLAG8k4npMcfIWjheeFuMftbW7ymVSWDwdJBBMa1Hd950ttfRrOKTlHVW7DWncLtLXNO
	Mx7/gGrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCl2-00000001Mnv-1ih1;
	Mon, 14 Jul 2025 06:33:48 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCP0-00000001ILa-3CiE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 06:11:03 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3a4e713e05bso1698968f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 23:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752473460; x=1753078260; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DAtRoMW47q6eWngfmkGzhbl2Om3dflePIieHts+FOBI=;
        b=qke6VoXyGwndbgcARfWPpfbO/f5PXZlN4S7cBAHPXMR1n7KV/K3AIJLs9rstnTAaR7
         9uqhvyblVFbi+V+wr8D/luh7TacuweY2MA5fFyFGtIQbLFCGkBcA9jaz3LCMnGLZAA4d
         LIRgJyigqGOxW51wzmZt4/qZMzjc/vtw5t1mrRoJ7+w/6J13Ir3XoHf5v0NcnaYo6Q+O
         ujAePWybFJMpz+lfDjaaOU22Y2fRFx6aXHzjbwOoBpf1zmebm3zH5YQIp/mIfwf6mTfo
         oormvT5FnnLTYTF4RVkqdudhXcuNrCxuRYthDAP7xKqrtnGPcOMY5h0i7zYZ9vOuxExv
         Zh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752473460; x=1753078260;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DAtRoMW47q6eWngfmkGzhbl2Om3dflePIieHts+FOBI=;
        b=LFv297tA7nBncK7Gwm8wZ94rn6XkFfTRiV/Lcm7bOigPHknZnVWep2xFOQQ3Q2kien
         sSsMrRQpfVLVBAsBUuv6U/g/08rb0oaXtT+E57EFP5wzHjJKzHMJHNCSPYuT/HeXlhPY
         ZtHBE5iWjoQ32e6bCKm0cEivvTk715pASoa/cmYCuDZSjhFdEGl0qxQ3cL6pqp0IQ/uk
         CV1/8BmIDJyhNHO+yu4OQKEGSzwHe7shpHPxAtbSeNNMFRm8EpTOAERX+KGNsB1lzaF5
         bICTUNmj4zCZnmrVSljp1VPcSZQ9EgRqJRi7H2w1LiJN1DT/52tVR7l6E4UJSROKOKhL
         sNhg==
X-Gm-Message-State: AOJu0YyNWgamM78thRt+TUfF69i42npW7cikkkDt8tHvrNf8zYmfMlWR
	slmI8egeqdoXPf/vPWXvaNh2ljSS92U5rz43pmi/zfYMjzeF+Tql4F4GlhY+qIe1wgJNWME91A=
	=
X-Google-Smtp-Source: AGHT+IFsCLtHJL4bZduQByJdBWFSePt0ZVoqPC5acNqYECl/7QLB3y/VpTPIitmJ3C2pFikEet6/1z+u
X-Received: from wmbay17.prod.google.com ([2002:a05:600c:1e11:b0:450:cd94:c302])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:240a:b0:3a5:8a68:b839
 with SMTP id ffacd0b85a97d-3b5f2e26c14mr9849725f8f.45.1752473460616; Sun, 13
 Jul 2025 23:11:00 -0700 (PDT)
Date: Mon, 14 Jul 2025 08:08:46 +0200
In-Reply-To: <20250714060843.4029171-5-ardb+git@google.com>
Mime-Version: 1.0
References: <20250714060843.4029171-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5138; i=ardb@kernel.org;
 h=from:subject; bh=ntdr4EjVjZJfnyc3XZ20vyNdLzsBSSjtiozuNHpTjes=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIaNk3s+Lmbqczj0rvAVfRxbEdM6a85TrRHj8D0lpvTzZ/
 Fdaq652lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIk4VjL8T33FvUb59jozdqnm
 q/uqv/H1Tplbn7TcdSZ/lf6yLc3mAgz/jPUOZcXfVexgUWyuFC302nb67J1Gr/K2qWeKJ0eZ/2j hBwA=
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714060843.4029171-7-ardb+git@google.com>
Subject: [RFC PATCH 2/3] efi/test: Don't bother pseudo-testing unused EFI services
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Feng Tang <feng.tang@linux.alibaba.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	Bibo Mao <maobibo@loongson.cn>, linux-rtc@vger.kernel.org, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, x86@kernel.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_231102_805682_B67C04B7 
X-CRM114-Status: GOOD (  13.93  )
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

From: Ard Biesheuvel <ardb@kernel.org>

The EFI test module covers the get/set wakeup time EFI runtime
services, as well as GetNextHighMonoCount(). In both cases, though, it
just mindlessly exercises the API, without any functional testing.

In case of the get/set wakeup time services, this would involve setting
the wakeup time, and subsequently checking whether the system actually
wakes up at the configured time, which is difficult for obvious reasons.

In case of GetNextHighMonoCount(), this would involve performing some
kind of verification that the returned number increases monotonically
across reboots.

Given that these APIs are not used in Linux to begin with, let's not
pretend that testing them in this manner has any value, and just drop
these tests entirely, so that we can drop the APIs themselves from the
Linux EFI runtime layer.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/test/efi_test.c | 108 +-------------------
 1 file changed, 2 insertions(+), 106 deletions(-)

diff --git a/drivers/firmware/efi/test/efi_test.c b/drivers/firmware/efi/test/efi_test.c
index 77b5f7ac3e20..bb2ace902346 100644
--- a/drivers/firmware/efi/test/efi_test.c
+++ b/drivers/firmware/efi/test/efi_test.c
@@ -333,77 +333,6 @@ static long efi_runtime_set_time(unsigned long arg)
 	return status == EFI_SUCCESS ? 0 : -EINVAL;
 }
 
-static long efi_runtime_get_waketime(unsigned long arg)
-{
-	struct efi_getwakeuptime __user *getwakeuptime_user;
-	struct efi_getwakeuptime getwakeuptime;
-	efi_bool_t enabled, pending;
-	efi_status_t status;
-	efi_time_t efi_time;
-
-	getwakeuptime_user = (struct efi_getwakeuptime __user *)arg;
-	if (copy_from_user(&getwakeuptime, getwakeuptime_user,
-				sizeof(getwakeuptime)))
-		return -EFAULT;
-
-	status = efi.get_wakeup_time(
-		getwakeuptime.enabled ? (efi_bool_t *)&enabled : NULL,
-		getwakeuptime.pending ? (efi_bool_t *)&pending : NULL,
-		getwakeuptime.time ? &efi_time : NULL);
-
-	if (put_user(status, getwakeuptime.status))
-		return -EFAULT;
-
-	if (status != EFI_SUCCESS)
-		return -EINVAL;
-
-	if (getwakeuptime.enabled && put_user(enabled,
-						getwakeuptime.enabled))
-		return -EFAULT;
-
-	if (getwakeuptime.pending && put_user(pending,
-						getwakeuptime.pending))
-		return -EFAULT;
-
-	if (getwakeuptime.time) {
-		if (copy_to_user(getwakeuptime.time, &efi_time,
-				sizeof(efi_time_t)))
-			return -EFAULT;
-	}
-
-	return 0;
-}
-
-static long efi_runtime_set_waketime(unsigned long arg)
-{
-	struct efi_setwakeuptime __user *setwakeuptime_user;
-	struct efi_setwakeuptime setwakeuptime;
-	efi_bool_t enabled;
-	efi_status_t status;
-	efi_time_t efi_time;
-
-	setwakeuptime_user = (struct efi_setwakeuptime __user *)arg;
-
-	if (copy_from_user(&setwakeuptime, setwakeuptime_user,
-				sizeof(setwakeuptime)))
-		return -EFAULT;
-
-	enabled = setwakeuptime.enabled;
-	if (setwakeuptime.time) {
-		if (copy_from_user(&efi_time, setwakeuptime.time,
-					sizeof(efi_time_t)))
-			return -EFAULT;
-
-		status = efi.set_wakeup_time(enabled, &efi_time);
-	} else
-		status = efi.set_wakeup_time(enabled, NULL);
-
-	if (put_user(status, setwakeuptime.status))
-		return -EFAULT;
-
-	return status == EFI_SUCCESS ? 0 : -EINVAL;
-}
-
 static long efi_runtime_get_nextvariablename(unsigned long arg)
 {
 	struct efi_getnextvariablename __user *getnextvariablename_user;
@@ -505,37 +434,6 @@ static long efi_runtime_get_nextvariablename(unsigned long arg)
 	return rv;
 }
 
-static long efi_runtime_get_nexthighmonocount(unsigned long arg)
-{
-	struct efi_getnexthighmonotoniccount __user *getnexthighmonocount_user;
-	struct efi_getnexthighmonotoniccount getnexthighmonocount;
-	efi_status_t status;
-	u32 count;
-
-	getnexthighmonocount_user = (struct
-			efi_getnexthighmonotoniccount __user *)arg;
-
-	if (copy_from_user(&getnexthighmonocount,
-			   getnexthighmonocount_user,
-			   sizeof(getnexthighmonocount)))
-		return -EFAULT;
-
-	status = efi.get_next_high_mono_count(
-		getnexthighmonocount.high_count ? &count : NULL);
-
-	if (put_user(status, getnexthighmonocount.status))
-		return -EFAULT;
-
-	if (status != EFI_SUCCESS)
-		return -EINVAL;
-
-	if (getnexthighmonocount.high_count &&
-	    put_user(count, getnexthighmonocount.high_count))
-		return -EFAULT;
-
-	return 0;
-}
-
 static long efi_runtime_reset_system(unsigned long arg)
 {
 	struct efi_resetsystem __user *resetsystem_user;
@@ -697,16 +595,14 @@ static long efi_test_ioctl(struct file *file, unsigned int cmd,
 		return efi_runtime_set_time(arg);
 
 	case EFI_RUNTIME_GET_WAKETIME:
-		return efi_runtime_get_waketime(arg);
-
 	case EFI_RUNTIME_SET_WAKETIME:
-		return efi_runtime_set_waketime(arg);
+		return -EINVAL;
 
 	case EFI_RUNTIME_GET_NEXTVARIABLENAME:
 		return efi_runtime_get_nextvariablename(arg);
 
 	case EFI_RUNTIME_GET_NEXTHIGHMONOTONICCOUNT:
-		return efi_runtime_get_nexthighmonocount(arg);
+		return -EINVAL;
 
 	case EFI_RUNTIME_QUERY_VARIABLEINFO:
 		return efi_runtime_query_variableinfo(arg);
-- 
2.50.0.727.gbf7dc18ff4-goog


