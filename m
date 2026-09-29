Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF27CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 15:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+edsoFX5PqL65dJFkIJ/uSxWsDbol4HH9AaqaASjRno=; b=3YEdkObDsOMogEQum9iZvaIks5
	4zpGYgxMbr71W5eALdRwBYBj2D8W3x5oV1xpDVZLZBMBJCePPJlir4Uv52IeWXSSVsztWxj45cTVB
	eqm6KVDesoGPUjGSwGfUhkwtx9iME12Y19d7ejSWgtAN26aZDOpJctUPabDYza1zvHZk/3OntuDYK
	B5L9RIfDDBYDGomqtvr3b53+F8XLX13HBnc5hK9NVOa2QXqMDxSysfuA+iwWV9QNHVWlG3OgggQ6m
	ugI88HeMtPhn1QHmTpY1Rj1dsEku34aXKiI5ZXSsFgh7c5Cn1bxKWmi5wdxxeiRy6WC1QjJAhNTSO
	mxKOl5AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZNT-00000003scb-1YTH;
	Tue, 29 Sep 2026 15:04:19 +0000
Received: from mail-yx2-x0c.google.com ([2607:f8b0:4864:41::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZNM-00000003sZk-3T8N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 15:04:13 +0000
Received: by mail-yx2-x0c.google.com with SMTP id 00721157ae682-8ab445ac183so8333397b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 08:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790694251; x=1791299051; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+edsoFX5PqL65dJFkIJ/uSxWsDbol4HH9AaqaASjRno=;
        b=j6SR/0jsIj9GMTVOt9NaIWLsZqmBvyZzI5DRNptIYyrA8ZsP/9sIdT1Wt/4++eUfnn
         4ht07xpUpeB/JG1zo+bp1KbpzdnBDQ0RWQ2Teq8aPUYTQ5y5q2s9qaRm1yv7CyrpyHpr
         9qxRHh6CJrAje712IHdx/5C8PvHU/L9uO4BRs5YvIv+pdr9B5Xj8nDZ2KZ+UtvAwmC4O
         I1MhbkQlxooemXLQRSaQQko+EneJ3NWMhWHFPLudMK3iPINMeDx3+jGo401LEoN9RWc3
         Jda/3UthWGv43uRYNgclPAFiztdBW0BSxRrpaOgln9NLqPXSDOEXks1a2stv7CtgAPQU
         gtGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790694251; x=1791299051;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+edsoFX5PqL65dJFkIJ/uSxWsDbol4HH9AaqaASjRno=;
        b=rJe2OfqmCOJjf3zKRpjryY+qhAAzHpgx+1QQHH/qp3hx3dXRVubxcALw3W3zS0hOR8
         13HUDbpvsPUcIQw43WTU99Ws0CcdCzW84wvjA5gO3bmDVIEKUM4pbm2fPjSGcYY6DhwA
         5ydb2k7oSgghWi6wupgBmuYXurMEHohLCTaSW50ixe5rW5pMjdPnM31hDtTLaUgOxNb1
         Sv6sXUmFcCkAD9H577TeHuHBt9Inbr+PafPeFclRmTucmM85IiOjKwyQ6pAG/sPN1Oa4
         WrhEINGV9P2t7DQIgNXHbrj2MpGPUo5AM5t6Xg0WPGLPG6fUxGtXL/U8Yw4AnnH730wq
         chJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwa3XmH3wqEJBbxZk0TFOvrCsAkKgUvcO5Q9fdE6LHPXxVzTzpIf2FGyHs0ioUeHg91GZ89RgGgZrDu5Z8W75aC@lists.infradead.org
X-Gm-Message-State: AFq9FYKA/uYEQX3HlzaXIUvtYmWBgj9gLL7+UFcnn/Pjyp/CiJL/gHq7
	mD3+3CgUtPZ5jBDizz9+rHkkjVMOFdN7WnvA4R75Cf7aGG4mlA+OQtrYAIKzZn7t
X-Gm-Gg: AYBFou01saiMPMwow8DqXMBy8LpnqiuNwwkAF82zt+5QpMjC8g1cCpSbEXfQbYgbVg1
	WsjKsMlAz+6QAcB/9YMyp13jokGhmamdtSEdzVp5S98KNdZXnpzrLQ8Q6PYGgZCNIdJw6H9vi1r
	HwIf09+/URIZvcj197J/vvHmgTPYqxIvNxjTuylAN/28z3GofLHyz/txHkHt2eVhi0KDx8FJRtw
	d796AG0soK6nZVpWm37Lr93rvASshtWJIlm+swZHQql4BJ+3q+8MoxAiW+tgupGKRf2isimRgd4
	aX3BiUgYcnpnc8zR3WMWDlNfqTof1DRyNaKbx8uv3S0ko8bJYyQcR+pHNj6xeOCA6lHngO5DVBb
	f/9xWETqMDst7tXZIX6ZJ48QK4vV7+W33q00MC+5a9PUDbuYtAoDmHlHXsaP4MBZe3W2Q/5zYXR
	Tio//cwfVALcKDsApBI4QMfSahv3wjrtD5brVHqFvnm9jQ7GzmAqes8FDNd0rGV52tXw==
X-Received: by 2002:a05:690c:e3e8:b0:841:e9e4:8ab9 with SMTP id 00721157ae682-8a64949ac2dmr92204867b3.25.1790694251364;
        Tue, 29 Sep 2026 08:04:11 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ab40a699b9sm9871467b3.43.2026.09.29.08.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:04:09 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Tue, 29 Sep 2026 10:04:05 -0500
Subject: [PATCH RESEND] usb: mtu3: don't run gadget completion callbacks
 with interrupts disabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-usb-mtu3-gadget-completion-callback-fix-v1-1-8b75b48fab96@gmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790694249; l=3859;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=ctXSxhL8cB96oM2LlBR4kk7hbE12PJXfiPWlYJLZFo0=;
 b=yw9LSE1i8GiNOL28F+XSvLaDLH7wn1idNjPtWu+r9QdBnFtrnSjo5+Rv8f6OF2gtorNSDOtWI
 rwGwjhX4Z1JB8caumEIvOiFYMI3N524g6ZrHKXJhw00Al65rItA0TYm
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_080412_901692_EB3FAB63 
X-CRM114-Status: GOOD (  17.95  )
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

mtu3_irq() is a threaded handler, so it runs in process context, but it
takes mtu->lock with spin_lock_irqsave(). mtu3_req_complete() then drops
the lock with a plain spin_unlock() around
usb_gadget_giveback_request(), which leaves hardware interrupts disabled
across the gadget function's completion callback.

That breaks any callback that reaches netif_rx(). Since the threaded
handler is in neither hardirq nor softirq context, netif_rx() takes its
local_bh_disable()/local_bh_enable() path, and enabling softirqs with
interrupts disabled is not allowed:

  WARNING: kernel/softirq.c:430 at __local_bh_enable_ip+0x17c/0x188
    __local_bh_enable_ip
    netif_rx
    rx_complete [u_ether]
    usb_gadget_giveback_request
    mtu3_req_complete
    mtu3_qmu_isr
    mtu3_irq
    irq_thread_fn

With CONFIG_TRACE_IRQFLAGS, __local_bh_enable_ip() ends with an
unconditional local_irq_enable(), so the plain spin_lock() re-taking
mtu->lock afterwards runs with interrupts on and is recorded
SOFTIRQ-ON-W, while mtu3_gadget_queue() takes the same lock from a
softirq (ncm's tx hrtimer), and lockdep follows up with an inconsistent
lock state report naming mtu->lock.

The locking was right when mtu3_irq() was a hardirq handler. It stopped
being right when the handler became threaded without a primary handler;
dwc3 hit the same thing the same way and fixed it in the controller
driver, in commit 84918a89d6ef ("usb: dwc3: gadget: Let the interrupt
handler disable bottom halves.").

mtu->lock is never taken in hardirq context: the only handler is
threaded and has no primary handler, so disabling softirqs is enough.
Take it with spin_lock_bh() in mtu3_irq(). The completion callback then
runs with interrupts enabled and softirqs disabled, which is the context
netif_rx() expects. The other sites keep spin_lock_irqsave(), which is
strictly stronger and still correct; several of them really can be
reached from softirq context.

Both reports need lockdep to be seen, but the context violation is real:
netif_rx() wants either hardirq/softirq context or interrupts enabled,
and mtu3 gives it neither. The fallout on a PROVE_LOCKING kernel is not
cosmetic either - copying a 21 MB file over USB ethernet hung and reset
this board repeatedly before this change. Once interrupts have been
left enabled while the thread holds mtu->lock, the tx hrtimer softirq on
the same CPU spins on it forever, which is the "CPU0: lock(&mtu->lock);
<Interrupt> lock(&mtu->lock);" scenario lockdep names. The same copy is
reliable after it.

Fixes: 13118959cb1a ("usb: mtu3: register mtu3_irq by threaded irq")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/usb/mtu3/mtu3_core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index a40bf5bad2d5..ed0e426645fd 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -790,10 +790,9 @@ static irqreturn_t mtu3_u2_common_isr(struct mtu3 *mtu)
 static irqreturn_t mtu3_irq(int irq, void *data)
 {
 	struct mtu3 *mtu = (struct mtu3 *)data;
-	unsigned long flags;
 	u32 level1;
 
-	spin_lock_irqsave(&mtu->lock, flags);
+	spin_lock_bh(&mtu->lock);
 
 	/* U3D_LV1ISR is RU */
 	level1 = mtu3_readl(mtu->mac_base, U3D_LV1ISR);
@@ -814,7 +813,7 @@ static irqreturn_t mtu3_irq(int irq, void *data)
 	if (level1 & QMU_INTR)
 		mtu3_qmu_isr(mtu);
 
-	spin_unlock_irqrestore(&mtu->lock, flags);
+	spin_unlock_bh(&mtu->lock);
 
 	return IRQ_HANDLED;
 }

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260913-usb-mtu3-gadget-completion-callback-fix-d334f7e99a17

Best regards,
--
Ryan Brue <ryanbrue.dev@gmail.com>
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


