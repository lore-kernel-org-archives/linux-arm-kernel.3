Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A182CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 13:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oiB5teETNAJO+fDl6KAzGRJpV3WpZWrKa7655moiG8g=; b=y7Q4p9j0ghhJN3Kwt6/nGiZKkg
	c+dpR5kIgRRW8wuVXRFKclI1GbEHpRkz8KTmm+vYByDRtIPPccEzZ5yEg4ZF4KUzUu6D9TrIf4RCn
	C6G8kG/PEDIKXO1D7GFgAS/oVgBaRj4GZxn3nxMg5n5PokcANzY7io49hVK0reLBV4y67EX8DtRI6
	cSmdLFuAHIlkd8w/WoY1ueSHqz70S83RPs8vvZ++ndn2KKNQrbqG2GAccrMpuRHVjVVLJCt48UPKS
	MKrOn25ghl9tlidQxp6SAwriwxrETdxRguZN9MtHhU2RrHWnMNFMtcUNxO+F1ftj9Z+sK8OZHZ4c5
	VynGMy6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ35R-00000007oHB-1d40;
	Thu, 21 May 2026 13:05:17 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ35O-00000007oGG-428k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 13:05:16 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48feb029961so34761425e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 06:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779368712; x=1779973512; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oiB5teETNAJO+fDl6KAzGRJpV3WpZWrKa7655moiG8g=;
        b=weNlZZDmhvAkLcP12hgAFbW6iPI+BQOO+cMY/bEUqcjZCK/JlfLaaw4dRIII0d2Elg
         H1qdhXtqu+977QhyA6T9EqcHcQYx6LxGrmgGjd6vPUfAQUxxF6uzopMGotKL+xWF03AD
         tN0GJoXI+m2UETpFFJp3u5EzeDOJJYjgkrY2nWg9oLsVFclKm/RoT+KnmiP2X8cTNI/F
         cEBjZQXyj4CE4ah/CjJXN5IpaaMFo/2GGxxU/h/8IeM+zP/mHa3dyGmgCrRcV3u1bv4H
         q9ibmuoRVktnk/IteWL35y5wx9xT3lZyg+iSywaW0DVDdYEx4KGoHfgNkYA/wDYfJPIN
         KdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368712; x=1779973512;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oiB5teETNAJO+fDl6KAzGRJpV3WpZWrKa7655moiG8g=;
        b=Lq+6IlGCJi5DmjWH9lQv3WSEKTf1vQekrlSEsHOACqhgTz/RSvpGWw1dOafgUk1rtm
         uJjb5O6/vSpUd+qHPFjUqNP0pdWPYKbcPTazHIOexViGMZDNOtG2a8Ty1yU+m1DKifuo
         PmPRlB8FOlMXjiiqkrVoIlE9VztHyrTrsGiIitBuV7zhRoXjzlwTKf+M1V8Ath8OKfMr
         Wn+0kW10hx+U9Nl948xdzk93eOrwUuce2UOh1iWL0LKP/9VqRijkXviM5Y8sUlVJbAbr
         3izJ72CqCq8gnzyGaTPtEQf1J2xC57ufXJixYXObTULQfNI7LKl2qqVCKokG32N6asG5
         Evnw==
X-Gm-Message-State: AOJu0YzsgvEaEOH3cmjuqs3ViJGF1InFovPLFWouXB8zZM639t0ivav9
	t4txVYnS3yTdTGhkRs9d6kfdECcoTNhM0U0tRjKlMFEqnHShwH2cQ3041InBWiV0vWlYtXQnYkP
	B5SGNXleAnGCNazIX8+B/G7IMQtfmgBWM3VGk+xlwv8l1PaOt/lAgnooQOGSMcxIoSyU9xpH0OB
	7wdML2SjBgGzuAhZlcSiGB+7hfi8AOY3x8H96/0Mdva+DkqG8Nhas2yPAuNpReVMXagQ==
X-Received: from wmqo22.prod.google.com ([2002:a05:600c:4fd6:b0:48e:5bb9:e1a4])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:34c9:b0:48f:eb8b:9980 with SMTP id 5b1f17b1804b1-490360e8403mr44838825e9.30.1779368711854;
 Thu, 21 May 2026 06:05:11 -0700 (PDT)
Date: Thu, 21 May 2026 13:05:03 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.669.g59709faab0-goog
Message-ID: <20260521130503.4103369-1-smostafa@google.com>
Subject: [PATCH] irqchip/gic-v4: Harden against bogus command line
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: maz@kernel.org, tglx@kernel.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_060515_007052_3FF834D5 
X-CRM114-Status: GOOD (  12.66  )
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

When accidentally setting =E2=80=9Ckvm-arm.vgic_v4_enable=3D1=E2=80=9D on t=
he wrong
setup that has no MSI controller device tree node (it exists but
not used) and GICv4, it caused a panic as =E2=80=9Cgic_domain=E2=80=9D is N=
ULL and
the kernel attempted to access its ops.

Originally, I hit this on an older kernel, but was able to reproduce
it on upstream with Qemu by hacking this unreasonable setup.

[   33.145536] Unable to handle kernel NULL pointer dereference at virtual =
address 0000000000000028
[   33.145658] Mem abort info:
[   33.145751]   ESR =3D 0x0000000096000006
...
[   33.154057] CPU: 1 UID: 0 PID: 295 Comm: lkvm-static Not tainted 7.1.0-r=
c4-ge3f15ad3970e #5 PREEMPT
[   33.156922] Hardware name: linux,dummy-virt (DT)
[   33.158780] pstate: 81402005 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=
=3D--)
[   33.160340] pc : __irq_domain_instantiate+0x1d4/0x578
[   33.162602] lr : __irq_domain_instantiate+0x1cc/0x578

Add a hardening check to avoid the NULL access, and fail the VM
creation in that case.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/irqchip/irq-gic-v4.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v4.c b/drivers/irqchip/irq-gic-v4.c
index 8455b4a5fbb0..7e39f7eae85f 100644
--- a/drivers/irqchip/irq-gic-v4.c
+++ b/drivers/irqchip/irq-gic-v4.c
@@ -159,6 +159,9 @@ int its_alloc_vcpu_irqs(struct its_vm *vm)
 {
 	int vpe_base_irq, i;
=20
+	if (!gic_domain)
+		return -EINVAL;
+
 	vm->fwnode =3D irq_domain_alloc_named_id_fwnode("GICv4-vpe",
 						      task_pid_nr(current));
 	if (!vm->fwnode)
--=20
2.54.0.669.g59709faab0-goog


