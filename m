Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DC0C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 02:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0fZk7cw47NM3PZyeQotTKEsd6zLI7x4WIDlkM2CwcM=; b=PHRFbFeYJtKTx24Eq1gcOSho4e
	cXQlF0dV+w/0tIE5gMBIeaBqe/xys620DwtDXGNphvDa1LlDdsKOwDSeP2V4qIPhBu0Gh9uZXJCne
	enejPy2H2jrqhBVSnDymClKdPKDtAQiM3fNM/kkikXQA50h7i0HRxNJpe9ylN18rwSR/s17wUYaKx
	brQ0QkM+Vwv/CLe1I8P3paUkiww/Ym3bd/si3OZTJoQL4Pa5opd/u+FRbrXqYLBVl+mfz5wHx9cgM
	mxQtj34a/NLwsjuDpQEGav+RmNzhtJioKMv/lfnMCqGOCzo35wdUJaHxDKI/0EAoNPhBp/WoGL4ar
	wWA3Mq6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn5Qw-0000000FN5p-17NL;
	Fri, 24 Jul 2026 02:14:42 +0000
Received: from m16.mail.126.com ([117.135.210.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn5Qh-0000000FMxu-2ocT;
	Fri, 24 Jul 2026 02:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=R0
	fZk7cw47NM3PZyeQotTKEsd6zLI7x4WIDlkM2CwcM=; b=e4V5LBZgUcm5oq799U
	7a3h6abrPnRrCCVAvummdZRPY8PbC0JeoIi/jMUsu3oBmHVz0vsso+pLxULG/D1v
	xCoCVPqs72DWoIg/AsQRHgzlMviTeGpOYmqNBW1jHGynpeFYHGo6XiuVKyQ4sbm/
	oxpAlt6fWlzkbCvbLcBdYsNNA=
Received: from song-MS-7D48.. (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSkvCgDnr+wRymJqH7z4DA--.34972S4;
	Fri, 24 Jul 2026 10:12:43 +0800 (CST)
From: Song Chen <chensong_2000@126.com>
To: arnd@arndb.de,
	kees@kernel.org,
	clm@fb.com,
	dsterba@suse.com,
	linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	guoren@kernel.org,
	kernel@xen0n.name,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	gor@linux.ibm.com,
	borntraeger@linux.ibm.com,
	agordeev@linux.ibm.com,
	svens@linux.ibm.com,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	jpoimboe@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Song Chen <chensong_2000@126.com>
Subject: [RFC PATCH v2 2/3] btrfs: Allow error injection on btrfs_data_csum_ok
Date: Fri, 24 Jul 2026 10:12:28 +0800
Message-ID: <20260724021229.47302-3-chensong_2000@126.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724021229.47302-1-chensong_2000@126.com>
References: <20260724021229.47302-1-chensong_2000@126.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PSkvCgDnr+wRymJqH7z4DA--.34972S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFWfZr4kWFykJw4xJFWrXwb_yoW8Xw4fpr
	WUGw1ruFWDXr97Wrs7Gay09ryFg3yDWa10gFnxZw4YywsIkw1FqrZay3WxGa48KrZrX343
	Z3Z0gw17ZF1DAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07USeH9UUUUU=
X-Originating-IP: [221.238.56.48]
X-CM-SenderInfo: xfkh02prqjsjqqqqqiyswou0bp/xtbBpRvra2piyhtNggAA3o
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_191428_085624_34CC110C 
X-CRM114-Status: UNSURE (   7.49  )
X-CRM114-Notice: Please train this message.
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

btrfs_data_csum_ok validates the checksum of a data block
after a read I/O completes. A mismatch between the on-disk
checksum and the one computed from the read data indicates
silent data corruption, which can be caused by bit flips due
to DRAM errors, storage media degradation, or bus transmission
faults.

Testing the error handling path that responds to such
corruption, including any warning output and uspace
notification, normally requires reproducing the hardware
fault, which is not always feasible.

Mark btrfs_data_csum_ok with ALLOW_ERROR_INJECTION so that
the fail_function infrastructure can override its return value
to false, simulating a checksum mismatch without requiring
actual data corruption. This enables validation of the full
error detection and reporting path in a controlled environment.

Usage:
        cd /sys/kernel/debug/fail_function
        echo btrfs_data_csum_ok > inject
        echo 0 > btrfs_data_csum_ok/retval
        echo 100 > probability
        echo N > times

Signed-off-by: Song Chen <chensong_2000@126.com>
---
 fs/btrfs/inode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 906d5c21ebc4..6be3e920b954 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -3574,6 +3574,7 @@ bool btrfs_data_csum_ok(struct btrfs_bio *bbio, struct btrfs_device *dev,
 		memzero_page(phys_to_page(paddrs[i]), offset_in_page(paddrs[i]), step);
 	return false;
 }
+ALLOW_ERROR_INJECTION(btrfs_data_csum_ok, FALSE);
 
 /*
  * Perform a delayed iput on @inode.
-- 
2.43.0


