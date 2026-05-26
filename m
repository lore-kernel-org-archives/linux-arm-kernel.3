Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4D8CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 12:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=acvmgNPS7kuyE45pt1syfWlXH/w85mKYitCTw47nvPc=; b=n9HysUQIpZr/mHi0dabsO1VBKp
	/yhA4tTOI4TUKcwJnf2wDRT2oMx3nxVLxtQZ2zCDE2/jOBPabV51SeuzEfPHbpLvShQGlUU4hRqIF
	p9oNViqfbJ1vwmQqJTwiuhRfyjZjzJVyHH8LajBurnEnoqSXKe/VKsyM/jWzaijgtwGMOZcOtDD/4
	Z6N+LvWizoZG2ts8+mvNFqRywtNkJV/7tyNYtHKQPwQ5rFYMnPRM7StDXE/pVDwqL1rtMVNjSVNX0
	OwhTTqsoPiXj3S3tQmEy+fl2pJLTbvz1xEtl2r9mZOAD5vP9P2jr5Z7n942BFKiwh56a6uxz8TFzu
	zPeP50DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrHp-00000001ylU-1fW1;
	Tue, 26 May 2026 12:53:33 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrHn-00000001ykY-0pMQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 12:53:32 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-44dad1b938fso6277203f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 05:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779800009; x=1780404809; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=acvmgNPS7kuyE45pt1syfWlXH/w85mKYitCTw47nvPc=;
        b=g86gA3JdcoZyuzJQIAyzAHJi2ZXepMY8GTyBoAy2YUsDCiIkEdKSzHD+zVynTXnnn/
         +hXy0N70GuSHc23TsfxFMEjUQtMaexSJJU2Dn9bWkqdwQmISi0IgVtH1OHTPdZYwlGsk
         7LOAfiVbFuSR6fEKLzvoYl5FTWA+f7ZxNti+ViLeXIQNYrfZ2aFm4ak5emuHx7PDSp33
         6TyVRc6qZuXS/2oTobFFR6sd+1JZGa06y85E6sSKa6vFubIVyAe6AD4psOwn0YfkrGgm
         kSBEjCoXpNjoqspl5HTpvYEuCHt5mWWe3d77+VW2HNRhTB0xZATafGy4foon+qLZIn+k
         qbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779800009; x=1780404809;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acvmgNPS7kuyE45pt1syfWlXH/w85mKYitCTw47nvPc=;
        b=SCsXtxuJ2MqSvWTcTVmz0SvH95JrFwEGdxx6DReHIIvM0HPUt/GsxexO52FVtRDZMG
         NtsJE91F5uih5fs6aFuXdNvOg+/5P6e7zq9H8EoP2W34hB4xvqzyQiCnCtL1E/LWmonR
         wnq7VqgDv2sxxH9B0tl4ErV6XtGtUl5hGXjlxwK8ITiH0v6qq0lUO3vu1u3h8++jZh5k
         Ut0aG4haPuer56OQYc9C2ecHtQvd+6bRIb84N6/hX/eSjB2cFVjEqAj3+EUCCTMXgawg
         Iberi7OYVdHi8LcAsjKB5gK8Gf9dw8JFhedFLZkq+M+i4aXx1oNUoplw4xjErC62oXkH
         sr+g==
X-Gm-Message-State: AOJu0Yw5PB2m/049czBEGxZFpbCpr2zj1/qZ3/qiePiqCtKm0Qb603AL
	5lafTwRugIDgTx/G3WY4cHNjyggMcUH3fRWSlzBGafHjkN0StjlfIJZB/yzTOfwCPvecOfcsJtT
	N5Kvcxeib7jWBsGT91xBL7smebCdce+xxp5lHCGZr9foCpm5e8WXGX1y2B+3qEmEOf3LQ8XweSk
	uzkrHqHy40chLvd67NVMMQNF+y7JBH/1/WbkEDFb7V9l9oMvLaKRFsmd/3nC+8HTPdMw==
X-Received: from wrme2.prod.google.com ([2002:adf:e382:0:b0:44e:14c6:8605])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2411:b0:43d:775b:c9bd with SMTP id ffacd0b85a97d-45eb38a167amr31151264f8f.10.1779800008357;
 Tue, 26 May 2026 05:53:28 -0700 (PDT)
Date: Tue, 26 May 2026 12:53:17 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260526125317.3672297-1-smostafa@google.com>
Subject: [PATCH v3] irqchip/gic-v4: Don't advertise VLPIs if no ITS is probed
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: maz@kernel.org, tglx@kernel.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_055331_241530_78A594E2 
X-CRM114-Status: GOOD (  12.51  )
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
Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
v3: Reword subject based on Marc feedback.
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


