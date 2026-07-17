Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EB8C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 15:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=upJ/Sz4s90QYZsqxnOwkFAGLL7mfnLMLMnUCKkDp/Xo=; b=AyXnkPbrddfEa1MknlBfEjlVwS
	3mpNooxCnEDf8QaZJhJmSQQCz5KShGPK/2B0GcCV6yLsSLIYE87gU+Pl71Xakk9MUR1XmfauZg9ZN
	qVr0WIEkm76NPfljkDQePBlHdyu9pqQX1iFau9ZflWfFojEBAF5N3XnHYnB+bYbafqd/qrt4ORx9n
	Bc6+7oKmaptImIrZQZIUsRA8crK209zzj5mlLaH5Lx8RwRoCc6BpyMlc8zGo7cLe5kLgxlqXO81ys
	ui8r2KEhq2E9AfUqQ8FEoZtfag0dqSxvL+n91N6iItd8ImmSP5ED8FrG8QVJ7fCd90qZSZ5cF74wI
	aIecnF3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkk7Y-00000002YIC-2v1B;
	Fri, 17 Jul 2026 15:05:00 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkk7V-00000002YH1-0dgE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 15:04:58 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47f633e6058so616972f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784300695; x=1784905495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=upJ/Sz4s90QYZsqxnOwkFAGLL7mfnLMLMnUCKkDp/Xo=;
        b=cFbRTzdJNL5k9qxeG+Fy3mW0vxS8RqeFhmfK15ZnWfO7y30xh31ZN107KnXo8YlMU1
         7XWoi7zgRqtBZXLCLRdA2sDzL8lV7UcOFsz8CZ0AIBKmAakS9+kuyj60XC3bBvVUZKVu
         KAlPbOvYQxXBWHKJHFL6bgqMDpg71y0ZlOG6R/fydvtzWrInfaMrGJht+NPTQ5cv4QNo
         OWk6Dp0Y2ZxYotsBBLa/7tZv9q2xmCxAt0JXQPv1OlugPYl8czTqU1ru++Ml6oOULBlC
         dCTIufsFrHQ0JGcvzFdSJpNZJhwRZhXfcxK/rD6LkqvZeaHoiicvkxnfL3fsgqleBXgD
         1XkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784300695; x=1784905495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=upJ/Sz4s90QYZsqxnOwkFAGLL7mfnLMLMnUCKkDp/Xo=;
        b=KNhC0WQBr2HfVSIC201cdXPcIrFUr50ffkXaJwQgXFX9hliCyQFm7/f2kipSaQfwtP
         Lsjmp2UhgnkfjuLmBBzSiUHodBiQRVXTHuLwIr2LHd1rGJi2Rljibync9SnIFPHdAl/e
         7MsHKFPClPyg3QV5GH7VrYjRKf5UtR5V+dI0v6AVwP87Gb4/mSRQWVDmg+OWC312yHvF
         2P7jnMURTI1He9b6s4MgZYjqGZ/+sDgT2C0bNRVZDA2Nkz+baAOKchCQ9PRd5sKgI8T1
         Ir2hq9OkBb33oMHCTxg1eGLeYL54mu+AUxdxL1+hH0ctEAQuexe/uBfpCG/vLli9nuiU
         eLwg==
X-Forwarded-Encrypted: i=1; AHgh+RrnuODXyP+9A0lQNoFZ7Z8WUHeG6B3yfYx8FiVfqoAJp+LoAPXLfV+a5HCkiCEJb9jFZtOKxIYORBxw3f7VkkEm@lists.infradead.org
X-Gm-Message-State: AOJu0YwsNedOee4InIgI0jXbkGU5lxAPGwnLhLUCzyOzMWHPLuO5puU1
	x0GYBrbdpVZePHpCMqlWvKKt0XkMK3n5CoekW/NYEmAjPn1x+iSUT0I=
X-Gm-Gg: AfdE7clAqgtI/2dKfsp/fFU12qLoaYF5XWKC3pRzwqVB5Srp0juoRgOW/rQ2/vwdN9+
	WuK1XbZ6KD7f3H+iiMyih68oOHozbxfaB5K1BPj9SjZARpvOzLzAy4w/pOsrRTS30QLCiqQi0hm
	PYqKHTMbEh7peTlCYVgciJL5MtQ+GCCWMtXeEXjTNhJZFUhbg9P7RG8mHi05CF6AOyHyfJugjo9
	olYV+VPZDYPaZz4X9soUlM9wVXGfVBZOwfEFtFxAckYB6pfRS4bBXZ1/qcqZMXhW9E9B/Toixfd
	GjMTYgVKtJq6mxSq0aDYYP8G/NtL1GLSyCghmaR13o6+T9eK42ga1JGkZ4+9CPAYnjv8kvDn9/O
	pMg2qW5uWjiyI6azEGr4r4WGScIoEUNZ2cs+idAgHtmUKC2YYvUMRSbSSJO6MLau8wpw/a09bDa
	Y0Q7TVQA8n4WQLs/74UL47uKBM0zAQtprpZEGmUTX1y97UUlWXBkW2/3TMACHe6y6IquUkn8C1H
	A==
X-Received: by 2002:adf:e19a:0:b0:474:5a38:f650 with SMTP id ffacd0b85a97d-47f622fce0emr4011373f8f.3.1784300694425;
        Fri, 17 Jul 2026 08:04:54 -0700 (PDT)
Received: from localhost.localdomain ([151.43.147.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm1735813f8f.21.2026.07.17.08.04.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 17 Jul 2026 08:04:53 -0700 (PDT)
From: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
To: jonas@kwiboo.se,
	detlev.casanova@collabora.com,
	nicolas.dufresne@collabora.com,
	hverkuil@kernel.org,
	mchehab@kernel.org
Cc: ezequiel@vanguardiasur.com.ar,
	heiko@sntech.de,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: rkvdec: fix clk reference leak on unbind
Date: Fri, 17 Jul 2026 17:04:40 +0200
Message-ID: <20260717150440.77079-1-pavone.lawyer@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260518145414.64514-1-pavone.lawyer@gmail.com>
References: <20260518145414.64514-1-pavone.lawyer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_080457_238748_4E28B1B7 
X-CRM114-Status: GOOD (  27.48  )
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

From: Jonas Karlman <jonas@kwiboo.se>

remove() calls pm_runtime_disable() before
pm_runtime_dont_use_autosuspend(), so the second call can never suspend
the device: it reaches rpm_idle(), which returns -EACCES once PM runtime
is disabled. The probe error path has had the two the other way round
since the driver was merged.

This shows up when the device is unbound while the 100ms autosuspend
window is still open, which is what an rmmod right after a decode does.
device_release_driver() calls pm_runtime_put_sync() before .remove(),
and rpm_idle() adds RPM_AUTO on its own, so that put only arms the
autosuspend timer. pm_runtime_disable() then cancels the timer, and
pm_runtime_reinit() relabels the device suspended without calling the
driver back. The clk_bulk reference taken by rkvdec_runtime_resume() is
never dropped, and a later probe does not reclaim it, so every such
unbind leaks one enable count.

Drop autosuspend first, so the callback still runs and releases the
clocks.

The PM calls also have to move ahead of rkvdec_v4l2_cleanup() rather
than just swap with each other. rkvdec_runtime_suspend() looks its state
up with dev_get_drvdata(), and v4l2_device_unregister() clears it:
struct rkvdec_dev has v4l2_device as its first member, so
&rkvdec->v4l2_dev and rkvdec are the same address and the check in
v4l2_device_disconnect() matches. That is harmless today because
pm_runtime_disable() suppresses the callback, but once the callback can
run, a suspend after the V4L2 teardown dereferences NULL. Swapping only
the two PM calls oopses on every unbind.

Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
[fsp: wrote the commit message; the diff is unchanged]
Tested-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
---
Changes in v3:
 - Rewrote the commit message, and dropped the VP9 claim from v1 and v2.
   Those said this fixed a VP9 inter-prediction bug on RK3588, green chroma
   from the second ALTREF frame onward. The bug is real, but this is not
   what fixes it, and I should have established that before sending v1.

   What happened: I took this patch out of chewitt's tree along with two
   others and tested the three as a batch. The green is fixed by "media:
   rkvdec: implement reset controls" from Alex Bee, which adds the
   reset_control handling that recovers the VDPU381 after a transient error
   (COLMV_REF_ERR_STA and friends) instead of leaving it dirty for the next
   inter frame. Randy Li's PMU idle export goes with it. This patch was the
   third one in that batch and got the credit.

   Retested this week on the same Rock 5B+ with an unpatched driver: a VP9
   Profile 0 1080p clip with alt-ref frames decodes byte-identical to the
   libvpx reference, across five rmmod/insmod cycles and after an unbind
   inside the autosuspend window. The green does not come back, because the
   reset_control work is in the tree I test on. Sorry for the review and the
   testing you spent on that basis.

 - Worth flagging separately: mainline rkvdec has no reset_control support
   at all, so the VDPU381 is never recovered after a transient error. That
   is a real gap, it is just not this patch. I can write it up properly if
   that is useful.

 - The diff is unchanged from v1 and v2. It is Jonas's 2020 commit verbatim,
   and his original one-line subject already described exactly what it does.
   The wrong story was mine, not his.

 - The subject changed with the message: "media: rkvdec: fix PM runtime
   teardown ordering in remove" in v1 and v2, "media: rkvdec: fix clk
   reference leak on unbind" here, since that is what it actually fixes.

 - What is left is measured. With a dev_info() at the top of
   rkvdec_runtime_suspend(), autosuspend_delay raised to 60s to take the
   timer out of the race, and unbind driven through sysfs:
       unpatched: 0 suspend callbacks, aclk_rkvdec0 enable_count 1 -> 2
       patched:   1 suspend callback,  enable_count 1 -> 1
   The leak survives rmmod and accumulates one per unbind. With
   autosuspend_delay=0 both orders suspend once, which is the control: the
   difference only exists inside the window.

 - Fixes: was wrong in v1 and v2. ff8c5622f9f7 has the two pm_runtime calls
   as context and only added iommu_domain_free(). cd33c830448b added remove()
   with the reversed order, and the probe error path with the right one, so
   the tag points there now.

 - Dropped Cc: stable. A clk reference leaked on unbind is not backport
   material, and the tag was only there for the VP9 claim.

 - Dropped your Reviewed-by and Tested-by from v2: they were given for a fix
   to something else.

 - Not included, happy to send as follow-ups: clearing empty_domain after
   iommu_domain_free(), and hoisting the unregisters to the top of remove()
   as you suggested on v2.

Tested on a Radxa Rock 5B+ (RK3588) on a 7.1 tree where the six calls in
rkvdec_v4l2_cleanup() are open-coded; the executed sequence is the one this
patch produces. VP9 decode stays byte-identical to libvpx, and five
rmmod/insmod cycles leave dmesg clean.

Link to v1: https://lore.kernel.org/all/20260518105413.42147-1-pavone.lawyer@gmail.com/
Link to v2: https://lore.kernel.org/all/20260518145414.64514-1-pavone.lawyer@gmail.com/
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 1d1e9bfef8e9..0ec3fca9cccc 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1869,12 +1869,13 @@ static void rkvdec_remove(struct platform_device *pdev)
 
 	cancel_delayed_work_sync(&rkvdec->watchdog_work);
 
-	rkvdec_v4l2_cleanup(rkvdec);
-	pm_runtime_disable(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
 	if (rkvdec->empty_domain)
 		iommu_domain_free(rkvdec->empty_domain);
+
+	pm_runtime_disable(&pdev->dev);
+	rkvdec_v4l2_cleanup(rkvdec);
 }
 
 #ifdef CONFIG_PM
-- 
2.54.0


