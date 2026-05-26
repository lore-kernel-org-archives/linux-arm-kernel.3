Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6737CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 11:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O7rx7KyPWyATkNYQBTFfTCI2vUcCFRxmTiO8Ep3+9hI=; b=Ylc5Mq2ZifV4Ae2rgM6kfn7tSJ
	0yuIomxS8wytOaTypH+rOlOItgHLAfjt/hl8djMKctAeGo6s/1aRdoEApJFHMiB9ae03RoysaOvGc
	QOV6pdcwf2QAn55lPkXyohIshjVQMr/NpdJROQ4hKANzCQjeUPCo5XV0ggxBbtbLId7IkogXa5Ll0
	U7ZqYm4g5NSOeWjC4xQE2uF6FIHd2nrm/mxWUPm+LR9zjk+BZfQxN+xjxnZknSXVwPNw6SdCPbJkE
	XMSUhfHugb52rD/mALtnWLYXVLeRqrWqzX77xXiRNAm9nDlHQO95j56BTNuc0RQ1I/+oniFneEqaU
	gWoI93gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpvX-00000001muK-07Uw;
	Tue, 26 May 2026 11:26:27 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpvT-00000001mtQ-3Pg2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 11:26:25 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48fe40b61a3so68263055e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 04:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779794782; x=1780399582; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O7rx7KyPWyATkNYQBTFfTCI2vUcCFRxmTiO8Ep3+9hI=;
        b=pc/q8g1flzUhc2mSUTflnqMPgE1WnqHsK7mTsTNfXBayV0uSrzwHZ02QXEDMCZbT08
         SUc0KNQsWFuHZstJ8CtvE1gcGZaRO/srVu8sABXhNH/lKkRlS0m+Y8EVtEWfzfJ4jzr+
         FcRlUjF3YAAANcUaapQmmW6y9YD3nBZ91dp5UevwJ3NWugeRR3MyXRX0yUhJ7n5TEYzK
         zmPGDD53dQx/QUr/CGEc+KKBNHzt5Ec/je6zmQZrtHpWB2iqF1NeU0orOB7oEVtrstpu
         5VtIClcwSRwExPCVHLpRDSyv4IetrXn7VxW33QWUdhYpTxwBjwjFD13757bx5owzI1K9
         /qGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779794782; x=1780399582;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7rx7KyPWyATkNYQBTFfTCI2vUcCFRxmTiO8Ep3+9hI=;
        b=hI/e+B3oZyNY19rUkZGyTJprRAefppr0LTmbeAhrMKvS8FTwVm7fFpOH2Oii45jDco
         7c2ACg02WoRcES4GK5pkCcHp11T1o8gFvwNAqKTrGrY8NLDskmsFc9j03muyYtKoGCUX
         KlIW6HHlFt6GZnGha3ZuIxpZQmHrYJ5DJTidrTrTscCW2mtodoA3HtLmC0Gk9uLCrTdx
         iK0Y3KOXU75b0QrPVYpXF7FnCm69hMtqe082UgpRZ9A0+pgPtLixrzpbBWzLpg+WFbYk
         7hi0kHEoobI6AoxnW8pyBBPhG6E4cKcxXXY135/+1QM+Z3iXrQkU3yEFt02qB0htlPSX
         6v8g==
X-Gm-Message-State: AOJu0YwJwljm30N5SrsrIF3yCh9epQlYD6Q9XmU7NVKKrNI7/5/pgIpj
	nQ/EIJbZLEJxIDw3wk1HzvCfewId/zPeaF4SYY4oA7AiG307qpaCwtJ4btxmcyF4rfdMmZx4thb
	hko29Sxxg7X8/HSVMR+vx47go+XLVvIH18HDXjb4j9/61JkEYJLqhfEpCYwsWNcFpu5R6BJ5RB6
	GLNkF+eqMKPOEIrEn/uc9hDpy6hqJ8h6+XX+4ZTlLwe3pTI3Tr9wrPBpuqTwd6Rec9GA==
X-Received: from wmco1.prod.google.com ([2002:a05:600c:a301:b0:490:6868:7565])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:35c8:b0:490:45bb:8dd9 with SMTP id 5b1f17b1804b1-49045bb8efdmr318834875e9.8.1779794781467;
 Tue, 26 May 2026 04:26:21 -0700 (PDT)
Date: Tue, 26 May 2026 11:26:18 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260526112618.3629321-1-smostafa@google.com>
Subject: [PATCH v2] irqchip/gic-v4: Harden against bogus command line
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: maz@kernel.org, tglx@kernel.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_042623_885241_959617FB 
X-CRM114-Status: GOOD (  12.55  )
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

Set vLPI support to false at init time if the host has no ITS, so it
propagates properly to kvm_vgic_global_state.has_gicv4.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>

---
v2: Fix the issue at construction as Marc suggested.
---
 drivers/irqchip/irq-gic-v3-its.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-=
its.c
index 291d7668cc8d..d02cb9c17c0b 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -5837,6 +5837,7 @@ int __init its_init(struct fwnode_handle *handle, str=
uct rdists *rdists,
 		its_acpi_probe();
=20
 	if (list_empty(&its_nodes)) {
+		rdists->has_vlpis =3D false;
 		pr_warn("ITS: No ITS available, not enabling LPIs\n");
 		return -ENXIO;
 	}
--=20
2.54.0.746.g67dd491aae-goog


