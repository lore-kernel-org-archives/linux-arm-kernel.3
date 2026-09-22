Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C74C98305
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uM6eJlIue+3ZnByR9U7PRXrgVvVnosyPWdGdGl87I7k=; b=UwS0JSlXT8j+I8j0+7ND6OO2j0
	yUdEvqEaHbCGL7tGOyLPv1EPsFrLnHjhLK9wj0kcNzRcItTtHBhaGptJhi6myY4jhudvfihT2InLL
	SzmdSyQZFlJ9ikDT3tqnTHSlC9nANFcCPMkXZZghgksbuw4Q+NpnLE1ciafF2ZZVjhIZAiHIv0DLc
	WV4YScibqzHba4lji94f159o13tqzHtX+07zNAf7im/vlFrpV9jQYrFn6jf6UpwHQ6+qdUB+2+PoL
	obA+NRe2qF/JKjaApbbfBQPdQuw2Gs8axMPWrUXLgDP3VbXXPNQtB6cMgUbqvXOm5CL3Ehq0kj5aY
	/od1OMEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vRa-00000004aHK-1sl4;
	Tue, 22 Sep 2026 08:01:38 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vRV-00000004aDT-0ImK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:01:35 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b93204449so2951415e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 01:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790064091; x=1790668891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uM6eJlIue+3ZnByR9U7PRXrgVvVnosyPWdGdGl87I7k=;
        b=ZWdBdHLYwz9Gw4GK3GXy+yzN+j+gd67XfIl+KbiCMhbS3uoXK82np6F0LAfizNwx/H
         CIvQK6LqcV28BPIig6ivfLYllpbvZYZU8IMNK5KHlRpFrjFc23e4YoTrZBKgiAYoIrjq
         lTlkw6Xj6loJM9gWSGoCHBbEhUzYvkw0YmSZwZUQrF3yFsRni9HEQFuWGUL6XBXteS7Q
         OQdmuDVb2+z6f7c/dpC/SoKTavA8WjCfL3e+6Kst+gSwjyLsEc3mDqDzgfy95PEOjTH7
         P/cDIg8EDs/eOfvaQL28L3oNcTCLkbLcKWo1XAh9uGnEHMfoF5KHpiM5creHSdf/7NiN
         hAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064091; x=1790668891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uM6eJlIue+3ZnByR9U7PRXrgVvVnosyPWdGdGl87I7k=;
        b=YoDBp3P4FEAOeK5YGne/jno8FR/WSDqR7dh96PWnq2PBIWk8YxyQHC7hVFGpkRCfaV
         /8J++l2y0lhZ4VoLlQp1sKoPIME+k5wsb24ReDPTyEtw0YqG7A0zZG4KvfF1ycTiVhmw
         TrpECRM0FoVZdcm7UW8ZZwNwaGwJOT5yP+O9scXk8ky4C4SNXYPBUOiQ1kFH+N2GYsMy
         rDx/iY/CMmFaA4c0gIlMzPTwaHO5NA+9xCvEC6sIRS/ouENnLXBwFx+bKtKWIB8qRaWl
         KFxaXwJOX3Xf3rKNBorrwE2N6TH3BCwDccYkudajetooIkqXyFg+xquk+4LBndNWG4qQ
         r+rg==
X-Forwarded-Encrypted: i=1; AKwUvByxjy7DhCAeuj5w8JpD5zaVfzEuygkJTY8bGs8ckmbhfNexmWL1YfWc8XvWfbWU/nCD6kTMtDds2KUVb/MgeMPT@lists.infradead.org
X-Gm-Message-State: AFuF++l174IQ13uJplGRzWQmzzN/MhNvSyekN/dvPS3F6oggPtBTF2gq
	jugxQ+z1fMjEeFi1RaquXCQVBWkXM9hgK/GdMkBtM11BjxY/KTiHK6DQ
X-Gm-Gg: AYBFou0OZ0dikIPwlY8C542jtv0NeijXkeIuT2bOOK/ANqV9681p3valcfQ54ffp5/y
	PyBoFCWVb9a+p8BE0JabAyvmDprMRp5Qb++/6swnkJcurIx0dkUr9+dvlKw1aUGufbAlFMH2xwg
	Z1TbP0TMdqcUrx/1YdpWqNW9VyoylwqE2PmAehRP/7CCnTnuKGshr/jefDB5MwbAIIFV24I3mMM
	15BCdKbV6hKYIGFIEMEVn24wrzAeB7PjJtPgCRet97n0IO7+QDThGYU9jOjC0UUuU331p9uJF7e
	9AG1HmhyElZSwpQLdzS3Ti6h+P4Rtba1mhY0FanaQutXps7dpBo7y9WgbY9pBs9mh961TZOVIZC
	DVBHP03rd4YxH8K9z+vPILnex2+YS5ZxKWlbnXL9uZDIZu4KjJ4PAS6psid+iZzV2qP/vfKibi7
	RrLnhQL3PQAtcyrIWeaoXUoKBfyoif9cZxxJTF4cRBtB87SgcSo1jk0joRJjqOTUWidBZR55617
	wFKqwlEZJ7KL42LRUbRd2aNjcZe3aXrvYBkug9E3mZC49IvOYcdo7VQqpgzOdA4dRHggVBwtyWX
	F3yl
X-Received: by 2002:a05:600c:1d1b:b0:49e:7cc6:ec88 with SMTP id 5b1f17b1804b1-49fc7e00555mr163235615e9.1.1790064089430;
        Tue, 22 Sep 2026 01:01:29 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B80530056971C6280202175.dsl.pool.telekom.hu. [2001:4c4e:1b80:5300:5697:1c62:8020:2175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaaf97e2sm18248625e9.2.2026.09.22.01.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:01:29 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v2 03/11] accel/rocket: search every core slot when looking up a scheduler
Date: Tue, 22 Sep 2026 10:01:06 +0200
Message-ID: <20260922080114.44662-4-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922080114.44662-1-royalnet026@gmail.com>
References: <20260922080114.44662-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_010133_232283_74DDFBB1 
X-CRM114-Status: GOOD (  16.82  )
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
Assisted-by: LLM sparse checkpatch
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
Unchanged from the standalone posting, which this series supersedes:
https://lore.kernel.org/r/20260905150432.7477-1-royalnet026@gmail.com

 drivers/accel/rocket/rocket_job.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index f404355058185..4bc4f9c8ee403 100644
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
-- 
2.43.0


