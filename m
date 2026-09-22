Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA40C98304
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 20:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uyRungl+NqmtYNgL/8dH71XCYpq6TtSAT/snP5PAQEU=; b=dOqCPgAbuilENjqe92b1giRqjJ
	Fhc2y7E8Yi/unKZ0ZDEE2C2EKP6mCwo2QrSiVnzp5etO61NUvc/gtjg4TgYEELGbDT5d26+dVgajY
	Kby4MVBzLuF+t2OT6EEE8dkAcMoaNjPITSc1mDPppMypVM3QKoK0sVxcj1Mot49mibLU8Z/VskoMo
	f28DVbuCU10j/pgZLtirBQtayBG3gTQaWvu9nOMjt08ehop5uZhPYI8h1ob322Q0HVMrTqlBF+Va6
	qUQY9Hg41PHsm6lbOhILH2nUr/h1FsRkopzEjf63Ok+33b7N5SwlPURuhF0jiNaE5RNJ03/3VNEU8
	9SScv21Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96jd-00000006UgY-24sq;
	Tue, 22 Sep 2026 20:05:01 +0000
Received: from mail-dl2-x27.google.com ([2607:f8b0:4864:38::27])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96jX-00000006UYU-1Vn4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 20:04:57 +0000
Received: by mail-dl2-x27.google.com with SMTP id a92af1059eb24-144d8be360cso8384c88.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 13:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790107493; x=1790712293; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uyRungl+NqmtYNgL/8dH71XCYpq6TtSAT/snP5PAQEU=;
        b=a+9SmTsUg/5qPa/J9GbpuNt3rP8vBNFy5Ve8LoCOTXn/CW0pUE1z2p14G+Eo83oMTH
         bn3Rccz0rMAPa9I3GCBTSsoNtSFDX8vt+b6fVu9cgS8XB4zKE64VC+lDDW93RYJcHiNX
         09PDoDMz9fsEKCFYIUAJSB/XCfStE9+/rY4Cewmmpdbi0DppGTRu0K/X5vs8rLKKSZPd
         B+3qugQHGmVqEuNVqMbz1wsik4TIOP1Q2UHrLGCeKLQHP2YuV9hxkgri5OGx+klyE1Yn
         4KqLBcROqJKqvwV1IOUsPvfGZByQfbK5xwelHNymDOcqLWmYulFn4bEIGN6ZzNt91Czb
         AOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107493; x=1790712293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uyRungl+NqmtYNgL/8dH71XCYpq6TtSAT/snP5PAQEU=;
        b=1O+wWWKXNznIG4ZkDMc1XOeg1/DpmuPcc953grwcYlekkLGGm1EBvl7mCaFbwxxq0Z
         zp0Pz8F6wqLZ6wSSrjaXxCXEJblRDn5hTx/1ybCT84i+uU4wsaTZYPMU0aXiZr9K2/sW
         biLa17RNmYkqbVqV4kIv+r85tVtrAS/oduY0crUpeRcYlQMMnJXuvlEEHcEnqxHwERKB
         9z5EkNynLpiREjWS0tTubMwYFX/v9mlBdaehars+3UHrOdE3VWeJUwOkuBkxG5+nZgHy
         0HWjMUGuwC0TGqMaSXw+Q9gf1XQkyouyUW5BCRxy0jcHGbCU8Q+Wo9o/7LhG9sfa0D+5
         bi7A==
X-Forwarded-Encrypted: i=1; AKwUvBwSvWX0nvwqT0ob6nS2czfsKv/3P8quen6uV+04WbX6Smt38bLXLJZIVUz37YUwR7T0evHosrbtcHTCNdfoGxK3@lists.infradead.org
X-Gm-Message-State: AFuF++l7qOAB3PAESsgqPQKQEb2oxhjoa5S2g/K+vqqyCRXGDzSOYB6I
	90w/yrJMFQWZ+wODcbWgrrjpK6n17GQNK3GLPWJT3pPmRbkWomOHZ7DXjTPHjUKxqNg=
X-Gm-Gg: AYBFou3Y7yQGxKiEVxJRC+QKRQZ8c/v052AkGX2c3woWkaKTkyZT8JJBZE8PZzeAgEm
	urnq73JcCSvVq+JbHSdw4aJBKynpw0zM9M7xiPkSJZErA+4tqnnzeApSTQ7o6urYiEfQaXZ5Hta
	U3BvQujPqYfc8/t9NgJGqGASdh+Ikg6CflrQn3uC2OSwEUZON1OnGvfyLVrRs7LzOEfOmMYQmo4
	F6mmr/S82EAXE5SOVlhmOHL5Cli0A95xEuFL36K8Rae6VvrNL1RhNE2kjibBUOHPEJPh+7JoBw6
	CnYcLziAizXwucKkcKpUgtmJcshzwpCqfT0QAmCvkoEY0/7QFePBV/7G1+6hRyngyxaLQiJjK8f
	D3+Fv4FGMvJ+xvFYGarX2OMTL0TKDMk3vnB9soE5sRAvm53cJ+o2KH1TZ1E+dTlRF/pi3qsRLJi
	3Dwd+txhTSqUF7RVGh31ovsJMN/fjbuVvMv9c4XEbp/bA3RjDErRi2bFYVR/s1v+NyN2e2eyuPv
	M07W98z7Sjj53V+WHuBDxHTjDgmGv/AmbPefxZSv+xt68pPmtmmsQEU2YzE5M2vQ7v52qU=
X-Received: by 2002:a05:7022:3a08:b0:143:4710:a84e with SMTP id a92af1059eb24-144f9186b23mr505519c88.15.1790107493262;
        Tue, 22 Sep 2026 13:04:53 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:c016:77a6:d382:7611])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983c5a1sm852614c88.7.2026.09.22.13.04.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 13:04:52 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Yue Hu <huyue2@coolpad.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sandeep Dhavale <dhavale@google.com>,
	Will Shiu <will.shiu@mediatek.com>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Will Shiu <Will.Shiu@mediatek.com>
Subject: [PATCH 6.1.y] erofs: Fix detection of atomic context
Date: Tue, 22 Sep 2026 16:04:36 -0400
Message-ID: <20260922200448.27724-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_130455_479123_4738515A 
X-CRM114-Status: GOOD (  19.38  )
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

From: Sandeep Dhavale <dhavale@google.com>

[ Upstream commit 12d0a24afd9ea58e581ea64d64e066f2027b28d9 ]

Current check for atomic context is not sufficient as
z_erofs_decompressqueue_endio can be called under rcu lock
from blk_mq_flush_plug_list(). See the stacktrace [1]

In such case we should hand off the decompression work for async
processing rather than trying to do sync decompression in current
context. Patch fixes the detection by checking for
rcu_read_lock_any_held() and while at it use more appropriate
!in_task() check than in_atomic().

Background: Historically erofs would always schedule a kworker for
decompression which would incur the scheduling cost regardless of
the context. But z_erofs_decompressqueue_endio() may not always
be in atomic context and we could actually benefit from doing the
decompression in z_erofs_decompressqueue_endio() if we are in
thread context, for example when running with dm-verity.
This optimization was later added in patch [2] which has shown
improvement in performance benchmarks.

==============================================
[1] Problem stacktrace
[name:core&]BUG: sleeping function called from invalid context at kernel/locking/mutex.c:291
[name:core&]in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 1615, name: CpuMonitorServi
[name:core&]preempt_count: 0, expected: 0
[name:core&]RCU nest depth: 1, expected: 0
CPU: 7 PID: 1615 Comm: CpuMonitorServi Tainted: G S      W  OE      6.1.25-android14-5-maybe-dirty-mainline #1
Hardware name: MT6897 (DT)
Call trace:
 dump_backtrace+0x108/0x15c
 show_stack+0x20/0x30
 dump_stack_lvl+0x6c/0x8c
 dump_stack+0x20/0x48
 __might_resched+0x1fc/0x308
 __might_sleep+0x50/0x88
 mutex_lock+0x2c/0x110
 z_erofs_decompress_queue+0x11c/0xc10
 z_erofs_decompress_kickoff+0x110/0x1a4
 z_erofs_decompressqueue_endio+0x154/0x180
 bio_endio+0x1b0/0x1d8
 __dm_io_complete+0x22c/0x280
 clone_endio+0xe4/0x280
 bio_endio+0x1b0/0x1d8
 blk_update_request+0x138/0x3a4
 blk_mq_plug_issue_direct+0xd4/0x19c
 blk_mq_flush_plug_list+0x2b0/0x354
 __blk_flush_plug+0x110/0x160
 blk_finish_plug+0x30/0x4c
 read_pages+0x2fc/0x370
 page_cache_ra_unbounded+0xa4/0x23c
 page_cache_ra_order+0x290/0x320
 do_sync_mmap_readahead+0x108/0x2c0
 filemap_fault+0x19c/0x52c
 __do_fault+0xc4/0x114
 handle_mm_fault+0x5b4/0x1168
 do_page_fault+0x338/0x4b4
 do_translation_fault+0x40/0x60
 do_mem_abort+0x60/0xc8
 el0_da+0x4c/0xe0
 el0t_64_sync_handler+0xd4/0xfc
 el0t_64_sync+0x1a0/0x1a4

[2] Link: https://lore.kernel.org/all/20210317035448.13921-1-huangjianan@oppo.com/

Reported-by: Will Shiu <Will.Shiu@mediatek.com>
Suggested-by: Gao Xiang <xiang@kernel.org>
Signed-off-by: Sandeep Dhavale <dhavale@google.com>
Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Link: https://lore.kernel.org/r/20230621220848.3379029-1-dhavale@google.com
Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>

[ Backport to 6.1.y: the source change is unchanged; only its location
  in z_erofs_decompress_kickoff() differs. ]
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and EROFS maintainers,

I am continuing backporting CVE fixes still missing from 6.1.y.
This fix is inherited by v6.6 and every later mainline release, but 6.1.y
still has the affected code. The target-specific adjustment is described
in the bracketed note above.

Could you please queue it for 6.1.y?

Thanks,
Artem Dinaburg

CVE: CVE-2023-53231

Build: This patch was included in an x86_64 allmodconfig and
CONFIG_WERROR=y build.
It produced vmlinux and modules with no new warnings or errors.

AI assistance: An LLM helped find, adapt, and validate this
backport; I reviewed the patch and test output.

 fs/erofs/zdata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index 66c323cbdd73e1..49b7c77488415a 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -1271,7 +1271,7 @@ static void z_erofs_decompress_kickoff(struct z_erofs_decompressqueue *io,
 	if (atomic_add_return(bios, &io->pending_bios))
 		return;
 	/* Use workqueue and sync decompression for atomic contexts only */
-	if (in_atomic() || irqs_disabled()) {
+	if (!in_task() || irqs_disabled() || rcu_read_lock_any_held()) {
 		queue_work(z_erofs_workqueue, &io->u.work);
 		/* enable sync decompression for readahead */
 		if (sbi->opt.sync_decompress == EROFS_SYNC_DECOMPRESS_AUTO)
-- 
2.39.5


