Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98573C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 15:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NM2S1Q42b15aXVJKX75peJvXAR4lZmt0uA+gclfAVgo=; b=jL3+Fdsy4mXMjSEBmdbz05b/wi
	Bd7C44CX741TrRnQMas6e5W7IJxhrgkt+Y89Z4UhFB9sPKP4btMCLuq46WhJvBOHfsR02gkPIztrK
	ZKmh9edbMcK9k4C9DAQ4CyOp7UWoEhk6VhYTdI/GV6HP4zfUvxrCmZ5kUjnfy7N9zmRnBxNsz7wR1
	/MVjMWHaJfTuAkg7M4ysy7o5c70uvV+flrilhkigh6WlJuExALc/Id2cYtUwhH7/T+PjuKr8eGv+n
	U1xs66gEjl0N7gIntwO79s+Cvh3NG9s7aAMG8/+0Cs+qL52dEL8s3IW6uDEZUr8v/UWy0ebFhdkN5
	hlzBlyeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2rwy-00000004Ai7-10gt;
	Sat, 05 Sep 2026 15:05:00 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2rwv-00000004AhC-2Fy5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 15:04:58 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843971bdd0so220067f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 08:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788620695; x=1789225495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NM2S1Q42b15aXVJKX75peJvXAR4lZmt0uA+gclfAVgo=;
        b=c9K/dnLcsRXMyU/8t32O3l102R2sKTjS5ZmOtBhQ/K1ralnGH7E5RoJ2iol7Vttjfn
         4P+qwnPrFD6aBYZFyiQwc30RhqxPrqob6vgzQUmuoVIxiByvstJO+IGfkGwmOHyh0NMs
         524TeBtqsHjEqdv6Aq0ND3qwPNHePpgY2CtfEA+rk4QZ7f5hN+Y8yTRYd+0XWVNzHjy+
         bAUJslrKfGVPHM7sRj1OwhWaUtz4tk9b2LAOhSOwwV2LD0b4feej8BSkRnwtkFxO8ByM
         EcHd1WOV1gAXRbVSyPua03snuxUXnYZ422yH0ifqMXXfPzBNRO4z424EjKud8Vkb+n1K
         8qzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788620695; x=1789225495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NM2S1Q42b15aXVJKX75peJvXAR4lZmt0uA+gclfAVgo=;
        b=f/M45auyCReuEWdzt/l4fMRD76SsvzKYXgTPEVMjAyoATHXKPpRl2OHsPWg5g9ZLgi
         D9FtFNGPPmQArl3ZifDfD02Lfu/edOcQqlJXGCeJ82ILt6Dh2XcG8xiQjitrqIvZqTtR
         F5e6V5B5l9zo2E3fiMd0ImhoztmaKEJKg/uDlgEakaIgMN2G3tCwGfSbJcJ46oBVfqAk
         KP3+MOX8c5kfRm3H/847KXIBIaUEb8GwGUGXXGVJAMaI3iUQ+zWTgKlOSjUgilfdlRaM
         hTg3a3Ar3dpXlNoIctPCMLF8kUs+7oZYOQyq/V1E8zZ+0Phs4oZJ4evZmXRHrNcXLgwZ
         YuVg==
X-Forwarded-Encrypted: i=1; AKwUvBzs3KvDcuy/fQtaU0t12G4ny+D3UxZeCqwmipDxjdbZqJaqN98jzriYzT/8tHZ4jlBHD/asyu3A382OG47YPcax@lists.infradead.org
X-Gm-Message-State: AFuF++nTkcRbKqIWhDwiFD1wgdACETJ/8IjVUbqBg8D8fMZTRabTujPk
	oTeedza/V5Eokgn/4GR4m2KgBACEZ99/zhsGNzzDVl6MQPUKr5DtkBS8
X-Gm-Gg: AYBFou0Z/alp5RSOr7KD/gm9FS0YsvxXxbxNlIH1cvKlyBk3aSMMxSkb44hvmoHzYlA
	jqIyK8EDWgvMWcFFl8lPNkbnSNtMmnEpYG/YoHDGketHEH8chu8ASgrdBOiwkQc56kHwaMNuL5n
	icKylkwJ8CJmHGTDAk8yZJIbJT5yyhyvgC5GkCBUX58TM76XJwf76iUD7ePqy4xK/ggkUtsIP9m
	lEmy/QFap95qIUlebs9wB+ieadVW3SndaKI3MhRZZMRHCKs7Q2kq34+XAs2yx3U85hOUqso8xTf
	fUlviLYORORwBRnv+dlL+WUlQz8eAgC4tm+fm5Wr1MJnqi4dsSDI9T09k7ULhPzV5cMbSU/T6nN
	nZ7R4LRIQO0nw3oss5/J43yr/h4osH8oCc/m5H2suhkwk0Hrwf3m+zatlGB75VrgYpbkgU9iLua
	Yty35td6stov5Rp6AKna88E2qL+E6+03Hg3N4/ieews6QgUfnvgpU1zQBeQWqwq74CBh2FAoJef
	UUIms1nyBhVwdnEyLjXgfJIl11VXlfC9oicVVZlim1wZOqs7kuLXmKCgcmPxOu/sHk=
X-Received: by 2002:a05:600c:34c5:b0:499:cef6:104c with SMTP id 5b1f17b1804b1-49cf823c012mr101940875e9.1.1788620695367;
        Sat, 05 Sep 2026 08:04:55 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B950E0061C002CD703C2CBB.dsl.pool.telekom.hu. [2001:4c4e:1b95:e00:61c0:2cd:703c:2cbb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75cd8d0sm142811705e9.2.2026.09.05.08.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:04:55 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Sidong Yang <sidong.yang@furiosa.ai>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] accel/rocket: search every core slot when looking up a scheduler
Date: Sat,  5 Sep 2026 17:04:32 +0200
Message-ID: <20260905150432.7477-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_080457_595536_4A66FAF7 
X-CRM114-Status: GOOD (  14.66  )
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

sched_to_core() walks rdev->cores[] up to rdev->num_cores, and
rocket_remove() decrements num_cores for every core it removes. Unbind a
core that is not the last one and the cores behind it fall outside the
search, so sched_to_core() returns NULL for a core that is still bound and
still running jobs. Neither caller checks the result:

  rocket_job_run():      rocket_fence_create(core), core->dev
  rocket_job_timedout(): dev_err(core->dev, "NPU job timed out")

Unbinding the middle core of the three on an RK3588 while three clients are
submitting to all of them faults twice, once from the surviving core's
job queue and once from its reset work:

  KASAN: null-ptr-deref in range [0x0000000000000220-0x0000000000000227]
  Workqueue: fdad0000.npu drm_sched_run_job_work [gpu_sched]
  pc : rocket_job_run+0x234/0x838 [rocket]
  Call trace:
   rocket_job_run+0x234/0x838 [rocket]
   drm_sched_run_job_work+0x2cc/0xad8 [gpu_sched]
   process_one_work+0x640/0x14f0

  KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
  Workqueue: rocket-reset-2 drm_sched_job_timedout [gpu_sched]
  pc : rocket_job_timedout+0xf0/0x1e0 [rocket]
  Call trace:
   rocket_job_timedout+0xf0/0x1e0 [rocket]
   drm_sched_job_timedout+0x188/0x6a0 [gpu_sched]

Both are the third core: the workqueue names are its device and its
core->index, and it was left at slot 2 while num_cores had dropped to 2.

Search all the slots that were allocated, the way find_core_for_dev() now
does. A core that is still bound is then found, and the two callers get
the pointer they already assume they have.

This does not make unbinding one core out of several safe. An open client
keeps an entity pointing at the scheduler of the core that went away:
drm_sched reports it as not ready for every job that lands on it, and the
client waits in dma_fence_default_wait for a fence that will never signal.
Stopping the NULL dereference is what belongs in a fix; the rest wants
more thought.

Reported-by: Sidong Yang <sidong.yang@furiosa.ai>
Closes: https://lore.kernel.org/dri-devel/apwUewaRnoTNXHCt@rock-5b-plus/
Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
Cc: stable@vger.kernel.org
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Assisted-by: LLM sparse checkpatch
---
 drivers/accel/rocket/rocket_job.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index 3141f210fcd1b..a6c24dfe0563a 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -283,7 +283,7 @@ static struct rocket_core *sched_to_core(struct rocket_device *rdev,
 {
 	unsigned int core;
 
-	for (core = 0; core < rdev->num_cores; core++) {
+	for (core = 0; core < rdev->max_cores; core++) {
 		if (&rdev->cores[core].sched == sched)
 			return &rdev->cores[core];
 	}

base-commit: a9f09b5ea0c3db1e2d4c0f8d3ebdd612d8aa0366
prerequisite-patch-id: 519bcdfdde80d902309c8346f749ebc4bb6b29c0
-- 
2.43.0


