Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69286CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 17:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AEwo4MAtXfHhC/yEWJTYYWISTgdb20g3+/oxORWHNec=; b=I8kBDuUi2XkLGDXetW0geUND/N
	ArgGdorZC9z7zgafdhJbkOjNQZlZ9dr/abOl1EsRCf4BXMxFvP3JDY6ugbtCCQWXOTvhOj6PE5B6I
	VcIahENVz0Gv+uobmaD6IEx9zi3Oz6WDfXAdPLTsduxQQkUfNIQKZjC1TK6im8J/NX4c/m1iPkYd0
	mFWsjpm5yqyDiVoW3AAEWhbHrNNe0PRjVQFqepv/uyQStrUKeS3cus4sbG0SX250HK68Fj9cfmPIS
	l6s+TNk/LrrJQ6MOmjXr0oMTybMU0l/LXaDZuq51T+bDCaD+5ifr7JW8Fj2Ajy3j1goNeGIOS1uI6
	sjRjvBpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOfd6-0000000D9Cj-1xAe;
	Sun, 17 May 2026 17:50:20 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOfd3-0000000D9CE-3JfB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 17:50:18 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-8b7dccd6fe4so16344326d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 10:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779040216; x=1779645016; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AEwo4MAtXfHhC/yEWJTYYWISTgdb20g3+/oxORWHNec=;
        b=HI3UJ4JH8Z0WEMiXknQ16i4FWB9HcDPj3uYoY2FEY4tHJlGT2yx2ZRMHec5S80vUMk
         HjpYEoDXspMYgnqp5PgGr9LO24ZbRTIxRGOdMiynuWMFb2BWvtvdVQUyfhoHHMB3Pnjz
         nS0XVpedDjTrQl5/YBCHD+uF8mw+k9AL5HsuYNKZGi1SaNVbX5mtFu8gKAUe7eofU9/G
         U39ChUFd1/yMjUazjKTO6vMu75vXt9aCj214hVMcTC76w0uhdffStsgCapAcJYtWnrmV
         go9MudXjhi52mn6iPAoZI6DAJ4hZve2i5vJUkP/SEyD/1x07p2FTvTJN6HIfgRYgdnEK
         JIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779040216; x=1779645016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEwo4MAtXfHhC/yEWJTYYWISTgdb20g3+/oxORWHNec=;
        b=XI141bfGHMf1fk240XGLJkyqEwDS4rUR+sZdwPfCWFd8NDWc7r9RPjIrVwUtrXBIwX
         iHkTxgsNuFW7ThvNLSizAjXrbwmGU64wXMuhobtAQiXu1fXVIAi4uwuJW05U2VNpYoVu
         y6QSxRbeZmukCD2hUFLr33yJBB9RUZTMxvAKzC1gzAcOPG3r7XXE3MegpMGpcrCCdE3D
         nqmLbYBfLGK2WGQ+iEdQI0g4jUzTA4CzAMmc0kqrJvaq8iixF0UDSlbiNM7GgUjbghVH
         BJGUj1ge9mGhrXu8i3ryCZsODb0XkTSaEdLogVm+xXYpSXvDaQ42H9ifsgXZP5Ks+byt
         2uow==
X-Forwarded-Encrypted: i=1; AFNElJ+eESi+mBU0ukR7bdWxE1iFjbkp8PEPmHPz/tkCJJSulxM/QUdQoMjsAshqi0QD13DTqCRimxzZVW7Av6z/mnfE@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt9wfvXJwi5u+5vl5FFshqQu4d/gjU5lHnYRc4wf7vZUxA7YFn
	VzYmCDumrpMffswEONc7f2T8OUQWbUH6Bl4HPyZXrcO2JVzL39eatpWK
X-Gm-Gg: Acq92OE7KeaZ7dC9rswJ6hO8WEQfIo9CNYAIgLAnVPMXXPh4YwI5RjeW+c7GwH08BXr
	p+M7YI49CGkz20GomAOGIsGX3bJZtHArV1xnp62bSlE9+bFrDecoukoB9pxpNK7+RmzXWX2cAwZ
	qWlTiq2hPCN39Cax98V3TbtO33Q5sB3hc9QpQWD6G8rgisTZARG5Zfb+kI3GcW1IXEdDH+j4AgR
	29ARH/k+SR9tLL0IgIyAOne99YfITAoMMitq0DZPY+wjNe25NP7zxt5+8YV6RY87eAmV1R8nYCI
	bob4Z8lSv6D0KOu0NfjGdDi9/3fV8uYbUyjMTBtGnLysjByHHnelT9Cxt0Gwe2bdN0MlAebLBxn
	r+fiF1LQqVhd0weK+IH3wNIfkqIZUqCRSaSesrmDlRUbi1uK2O/SRddcohhVYwWqVZVPFRUJZIv
	8OLZY/a1tBNgddYYBFc+TuniBGA1RCR5vH1dR4n6hBs9h3bBsHJ/TXCIcdHKEKISgwebrSKkb9K
	Vlo6zieLgYqd/oSA4IdgG/6OYoORLoLo8nqSmL72kgSCr6Unv74cA==
X-Received: by 2002:a05:6214:4288:b0:8ac:a82c:1c43 with SMTP id 6a1803df08f44-8ca0f8fe1dcmr198672686d6.41.1779040215896;
        Sun, 17 May 2026 10:50:15 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca3609784bsm28551436d6.16.2026.05.17.10.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 10:50:15 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: arm64: vgic-its: reject restored DTE with out-of-range num_eventid_bits
Date: Sun, 17 May 2026 13:49:55 -0400
Message-ID: <20260517174955.273004-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_105017_845357_9094D3C0 
X-CRM114-Status: GOOD (  14.32  )
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

Userspace can trigger a host-side denial of service via
KVM_DEV_ARM_ITS_RESTORE_TABLES. A Device Table Entry whose Size
field encodes num_eventid_bits > VITS_TYPER_IDBITS reaches
scan_its_table() with a sign-extended ~18 EiB length, where the
loop holds the per-ITS mutex and never calls cond_resched(),
pinning a host CPU for a time linear in registered guest memslot
size. The accessor is any process that can open /dev/kvm and
create a VM. The same out-of-range value also disables a
subsequent live bounds check on EventID, as described below.

The MAPD command handler already rejects this case in the live
path:

  if (valid && num_eventid_bits > VITS_TYPER_IDBITS)
          return E_ITS_MAPD_ITTSIZE_OOR;

vgic_its_restore_dte() reconstructs num_eventid_bits from the DTE
Size field but does not apply the same cap, so userspace can
install device state that the live MAPD path is documented to
reject. The restored value is stored in dev->num_eventid_bits and
is then used by vgic_its_restore_itt():

  size_t max_size = BIT_ULL(dev->num_eventid_bits) * ite_esz;
  ret = scan_its_table(its, base, max_size, ite_esz, ...);

scan_its_table() takes the size as int and assigns it to
unsigned long in the callee:

  static int scan_its_table(struct vgic_its *its, gpa_t base,
                            int size, u32 esz, ...)
  {
          unsigned long len = size;

For num_eventid_bits = 28 the size_t value 0x80000000 truncates to
INT_MIN as int and sign-extends to ~18 EiB as unsigned long. The
scan loop then walks the registered guest memslot one ite_esz at
a time with the per-ITS mutex held and no cond_resched(). In a
QEMU TCG arm64 guest at EL2 on v7.1-rc1, with an empty ITT, the
ioctl returned -EFAULT after about 14 seconds with a 256 MiB
memslot and about 56 seconds with a 1 GiB memslot (linear in
memslot size). The per-iteration cost on native arm64 KVM
hardware will differ; the loop shape, and so the linear scaling,
will not.

The same out-of-range num_eventid_bits also disables the live
vgic_its_check_event_id() bounds check, because event_id is u32
and BIT_ULL(32) is unreachable in that comparison, leaving
subsequent MAPI/MAPTI handling without an effective EventID cap.

Mirror the MAPD cap in vgic_its_restore_dte() before allocating
the device, so out-of-range restored DTEs are rejected with
-EINVAL up front rather than triggering the int-truncated scan or
installing a device whose num_eventid_bits silently disables the
live bounds check. Sizes within [1, VITS_TYPER_IDBITS] are
unaffected.

Fixes: 57a9a117154c ("KVM: arm64: vgic-its: Device table save/restore")
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 arch/arm64/kvm/vgic/vgic-its.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 2ea9f1c7ebcd0..a5dcf9a6a2854 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -2307,6 +2307,15 @@ static int vgic_its_restore_dte(struct vgic_its *its, u32 id,
 	/* dte entry is valid */
 	offset = (entry & KVM_ITS_DTE_NEXT_MASK) >> KVM_ITS_DTE_NEXT_SHIFT;
 
+	/*
+	 * The MAPD command rejects this case; mirror the cap here so a
+	 * restored DTE cannot install an out-of-range num_eventid_bits
+	 * that vgic_its_restore_itt() would then convert into a
+	 * sign-extended scan_its_table() length.
+	 */
+	if (num_eventid_bits > VITS_TYPER_IDBITS)
+		return -EINVAL;
+
 	if (!vgic_its_check_id(its, baser, id, NULL))
 		return -EINVAL;
 
-- 
2.53.0


