Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FCDC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 22:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k3ZJJYWLWAdknGD5xgQyF6oWUgV2YSWXzpw9ViLpMPo=; b=QaWCB/9Su1w1tLBgdQMrZedrdO
	8MOKwaoHxs6pQLi8SRo/0qkvlyxoKLW/nabkJF4kzvhr+pf0aT4F4C39SVVkw0OatfjikWe7V4ob4
	KiZu5xs/qGb6z2uxJFMThxiypBBiSbZ29wt9AVyClgMAClo1hi1c1qXWHO794qkEeKgy/3fSVQ8/m
	9aJ6393mCUxKv1tj2DZ612GiGKE6DGk8OW6ujeTDhbSm7uFjsWCXvxWy2bkw4Jrzs/z1kjI6ceDNn
	eegB0W3sWZWC0YayOGM7+urFWDsvwqrvdsXdnradQ2Xz5WyZAcI2UHL319VAL/uJDeUGnPplwHGh2
	MvJ1FfGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5sZp-000000024IG-2tvC;
	Sun, 13 Sep 2026 22:21:33 +0000
Received: from mail-oo2-x07.google.com ([2607:f8b0:4864:31::7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5sZn-000000024HV-0Xlm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 22:21:33 +0000
Received: by mail-oo2-x07.google.com with SMTP id 006d021491bc7-6b1bebb3ae8so1110684eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 15:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789338090; x=1789942890; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k3ZJJYWLWAdknGD5xgQyF6oWUgV2YSWXzpw9ViLpMPo=;
        b=ms3B6d+1Sb/7qPGSY1SyaaCK3JP+SzwhjVFl/nqv0/4IZhtRixyQQ4Pu/Aw0YI+Kvi
         MSE0Sz+3HWZ6tzkjOlg7bpYAN1c4YdG+8eohF+yVp22TcQME4x8YMJvC3Y/fT3Tq15ZX
         ic4kqSOuazjsRIl6omQ/6XwHud5EyiXbqcVnLnxjND7U7gmAs5LBxwWDNpA7eD8H7PII
         gyVMgWBD6w7fjOFnuonxOJGcVt+UzEAcRqgnvEzRieEC/x0g5NlpTaMLv0Lub900bk28
         ZnI9qaEdcB29k2a8ud+E92LTnQtbGI2vNKzanqwmfCXYNtY3C5d+8F/SWJHmndZiBWJE
         JODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789338090; x=1789942890;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=k3ZJJYWLWAdknGD5xgQyF6oWUgV2YSWXzpw9ViLpMPo=;
        b=LwUL6jQO6+s08zRC2YtFbxR9QV4PvjjEp73qeXFRqwVsvlkdsyhmZR6PrcbrsKmZC8
         2ownrYdOShZ7doNjCrkyBgmVAV2B2GWT0pXiILWkjhp2HyM8G23Da8m8bQNCK14oVzjt
         MmdjYWNgtvZetG0gOHOBUE7oZSYM/bafNpBJg1Kd/I5sAzF6Nijl7z2EWfuRx1LSrFpi
         QJiOmX3PKUH14e457+0xrUikoWf02H69CZnc+f3HdgFEpuW9Agyvp9V1wn0v7Y+1zUSM
         aBb/9RwCvbWp5qCAAqF9oBIEEbaWDyRZxzUCu66qWHfFrWriZCbySfrZ7cm6ycATY47t
         0KfA==
X-Forwarded-Encrypted: i=1; AKwUvByRlTV7TzSb8OfxVaRDqB4g6JfzvJ1VAApNWtLCYqhT+hEN1DqqLgAkPYFvVZf6dfP7+CObxPc6y3joVLGrY3N5@lists.infradead.org
X-Gm-Message-State: AFuF++lJ43moPkECEhB4zG0R/t21J9N0W9LLz/30yoKVJ6If8M03Mr7J
	A0DkQ7FN93o7O3TL6CbTMip5S/MOBImQJH7XtQyqfl91Aui7t2ilhAtZ
X-Gm-Gg: AYBFou0SKVvZt93O/fTHQSEyu9NkF4cZvzdfXL3avATF+YVtU2LcM7kjajbVsJTRR80
	XpKgo4Ye+7L1n3lRTb6vz2Kq0Mh3WKxl4a/NRVKL7ou5JYHDZRRMAae8l0BivP/2jhFpgFh5kSb
	9xL16nkNye6kSdik91c1B7V/VtQT7erRb2gUY/PzhA/w1MOfofwzNhv12wVdOjl+sWCfLz9TFBX
	aLDeYzSMEEm+GjVAqeyyS4FbsmCfYo7THH2BYU8usqp0WAw87hty7ZRAdWD/DadX63EthLUDNkj
	Nch6rOtf+YavEgvial14oinq5zQtW8/ED8+II1JNA/wpn+6Fw8GL1c1yw+1a13+Scxsd0loIaSM
	Xn1w0pki8T12yw6a3CpZl0aJOwFIK38lqW1NfoA3f4/D0GFcWucWMgX1GtO9qzWlbpTSbHo5GzU
	nO3eWS7qTZJYPjaiT+/WxhBSegojOpfzJ8DV0XO49YxyLmwK8Ixmb9AkZlNmUTmX2QsxE=
X-Received: by 2002:a05:6820:571c:20b0:6b6:4f90:a62a with SMTP id 006d021491bc7-6c0ba8280bbmr12189996eaf.11.1789338089833;
        Sun, 13 Sep 2026 15:21:29 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c342ec1ff5sm4343973eaf.14.2026.09.13.15.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 15:21:28 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 13 Sep 2026 17:21:25 -0500
Subject: [PATCH] usb: mtu3: don't run gadget completion callbacks with
 interrupts disabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-usb-mtu3-gadget-completion-callback-fix-v1-1-e3480004fe23@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNywrCMBBFf6XM2oGmEUv8FXGRxzRG0weZpAil/
 95Yl+fAPXcDphSI4d5skGgNHOapgrg0YF968oTBVYau7W6tEhILGxxzkei185TRzuMSKdcZWh2
 j0faDQ/iik/I69KSUFj3U2pKo6vPp8fwzF/Mmm3952PcDXmv8Q4sAAAA=
X-Change-ID: 20260913-usb-mtu3-gadget-completion-callback-fix-d334f7e99a17
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789338086; l=3820;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=Tg9Kq8vx6MVWyGAb8N8rORP+uP72Obd3DRFlHL5xK4Q=;
 b=YprVcQaOfoVyeaf75GeW9nCb4J5m5vEY6QpXXbHYMQMmSn3VqJ7Ey/kLrFM279kQOjoN7ouGX
 GtYBNWkV6EVCWDGlBclQanK+2Ty+CLHAizBVeQxibpvONvTk2OdAOFk
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_152131_219640_EABBCA11 
X-CRM114-Status: GOOD (  17.31  )
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


