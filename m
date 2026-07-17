Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7ADC44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 15:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tk8lVGnRUzd3xxkm+i4v8VOVuBwgnyAk7LAw5MNlK7s=; b=htLCTWk8CLk9zeXCXZg/GYNIGL
	cga1IcGQ3qpj+LdGAql9yRVdbeX++efVEmplc+7tD/KG7mAndhLxGdZF16AK8s2MnAA0kKGxVgqZt
	RmeVLVh7fbcRGeiGResUr128oUKn195oEenh73nhRt0xlK9V1Zu3/bgGXA3oOI2xBLnVassl5KvoP
	Rjtv7WjmmX4CUjedfvGMr2sACOYqrnIOBZHcJ2Ac/b3t1QcT9nP3ZcwYKnVJHY3PN1yBnZcEiVden
	4aQ7OoDRVaXZ8tOofB1qdFULDUgsKLrdTwQWdLnMGQaakbB1NOAqZrf7IzfsKNIdoDo7mjuqLr04U
	M1x/PhUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkka-00000002e4P-2lKo;
	Fri, 17 Jul 2026 15:45:20 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkkX-00000002e2c-17DG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 15:45:18 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-47de008b020so1335665f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784303115; x=1784907915; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tk8lVGnRUzd3xxkm+i4v8VOVuBwgnyAk7LAw5MNlK7s=;
        b=HGBfFqtLqqt2OHhL6ZXxZYNOx6KQXHQrocn0qkVDQN1ABxF4us7/1RSGooG4suvq5I
         tFGvtB0Q+lSPsTUirAkldD5ikYjIAoCZ6e/hxeyVG7Qb/UPEbqqxWLs8gQ1j8r01iBJ8
         mWn+P5QM1j/2hFdRyw1fn7pEuoboO6vi3glN3yPiuSw/GoFGiq4nH71/VO7BdqETOx8w
         TY6vChlO1BURunPpgC1q8FzAUCUk91+2vGkkuO48ToaFrIgOArF4KM8wYMDgMEaxVms9
         bSMOUPD7QEqVi+1c19+lcrUbOWeC4QW3yFuqCu+LEfpFwTKgl5WODr9GgGjVfYKawo0o
         FrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784303115; x=1784907915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tk8lVGnRUzd3xxkm+i4v8VOVuBwgnyAk7LAw5MNlK7s=;
        b=eJ3C3ZedB+L5QkbkluBPE4i1mBcQcyEazaZBn/msjLpFnre7lMgCx39bSlCm21BYLy
         620lAL3+b7UfNPFzkFviGFngoTsnNIE0srtS4qoK3gFY6YW89/vc+ZbNn3OXgbc54IPT
         ivYNs2abXvyViG9l51I6PMm53p7i2RehJxxCtgHQHR2UqlmYFcK6U5SrRq78p5Effdxc
         W/wUbsEoOx2uoUiIbx05VqwDzRJsx6QI58mSxjtaPwmbQAnJkZd/pJPtSIcz68j3K2ba
         sRfL6PqpBBNGY11wLscDaUrbnQ4WGI4JDr8QEJ265vs/eso+v2/Yp3D/eMOk9Tdk8FY+
         6eQA==
X-Forwarded-Encrypted: i=1; AHgh+Rq4QNzKJ9Ani13PIeg/iRYawMyy90cWzh2ychPcZCikg1tciOPBaEa9JdzkxP139DJNmzitYWCSAH3NCHwGEiDR@lists.infradead.org
X-Gm-Message-State: AOJu0YyWkpzDKotOBzFw+BxVKs4WE3O0/nLNjKRKM+hHtu+uHKiU+DQg
	mgYbBOgf4JXnmxoq5CpybIhuuU2eF+Ssaw+TNEThMd/LoCelRZjD87g=
X-Gm-Gg: AfdE7clL9ouJcQ6uAB5WBiIIjyHkHUN+ONg+Z0CB8ZTjV97SIqVVZ6mIR8bj0k7VvYK
	LmKq//PEhtK16DHLWFQ0KKlvu9CzFckeZcT9cvrvC640Z1NMkZg36aTJRVR4fA84vg40PkBfhZk
	Uy4dULlAsMw4jnd8hg7hXgaKcQ9LQmArsjNnDZYA1eFnKjoaw0VxqgLByPPrRqN2viIdVwEWuKX
	sELfCZxwfWFhbAtD/DVn5+dqmXLjNvXFYEDgAFNT1QYFajy+tqO6lG6+SsFdWeIG+9s3V5JU70N
	J/Ev5v/i8HGP2xz+03NQZjjMdNXDrTvO3baOpchyqwZv9n0UO/p8Wo59BWyhy+93BbA1IT15ESC
	R+cwBznhC6d86VEVIDTdEDseRdlOmftaaW2kZBavatWPKusXLU4yltVoNxtOPxxg9RUfeT9TgQ7
	tobp/gcvkcn+yVTHukqFQvvh5k18m+vxbmSnMisN+qeOwXBFNVzWeFF0HBZLvvlBI=
X-Received: by 2002:a05:6000:250e:b0:47f:4834:99cd with SMTP id ffacd0b85a97d-47f5a66292bmr10529100f8f.26.1784303115040;
        Fri, 17 Jul 2026 08:45:15 -0700 (PDT)
Received: from localhost.localdomain ([151.43.147.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e49500sm4629130f8f.2.2026.07.17.08.45.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 17 Jul 2026 08:45:14 -0700 (PDT)
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
Subject: [PATCH v4] media: rkvdec: fix clk reference leak on unbind
Date: Fri, 17 Jul 2026 17:45:05 +0200
Message-ID: <20260717154505.83935-1-pavone.lawyer@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_084517_347008_9C1A8356 
X-CRM114-Status: GOOD (  27.43  )
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
Changes in v4:
 - No functional change. Resent as its own thread (no In-Reply-To on v2),
   per Nicolas's note that a new version should be its own thread for
   patchwork tracking. Same diff and same commit message as v3.

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
Link to v3: https://lore.kernel.org/all/20260717150440.77079-1-pavone.lawyer@gmail.com/
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


