Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17823606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JJs73Cnq;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=DPtVCVe+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PM+1SXBE1tO8IGolYslHAuqq+HDTOKBxAOZ2o3BRaQ0=; b=JJs73Cnq7zobmg9urDhVg4syYk
	bLb7l9Lrzhq+shfDbT3IkJcJNcJiREi4Jhxt9QEZ2tjAcVALyBLBxLnWWRdnMRI97/0qJWyqNJTJG
	07ZW3idz2T9nBZZwxrF+J5tMGcZUxKTFoGayF3VO14kdt0tFkHguADHudgl4W8GCcFE7KWGDcDpM3
	y/Q01I6PkvjqZ4K55oI08nKcP4ttzfFXSXzr2FxquBeRReBFG/g4nX+HOu28l8qN6C1eOa/x7qdDH
	8TmizokBqueCtHef/RsDh7No+dBg0Czt3zmvH8lOHHwFLPtMNeSje3JgibiGD7LA586QNO/Ui1W+j
	A2bH9Cog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZpa-00000005GcC-2GkO;
	Wed, 04 Nov 2026 12:11:06 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZpY-00000005Gbn-1ZeZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:11:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=PM+1SXBE1tO8IGolYslHAuqq+HDTOKBxAOZ2o3BRaQ0=; b=DPtVCVe+pcamCzJc01XI7O4qkX
	yYweOEk5BL88jVN6149yTUKRNpjMgHL52CAErHZFrEv/+eRNPDatL2ZAn2BmumA9wYAXxfPvPIfnJ
	RazZoDmf0tVwNNPNcVy5UgOi/LJ3hpwamdFIo5kFwCvOoKe0tYBgWUboFgn97ov7IND0nVMYH9A6C
	ifQvaYbClrAq5k6AjQFw/r2ulk6HiG/J4++BpWUm6jIgbYtW7TWw4LGVQKRyww+H91BmLEy7JCGKL
	KA2swXz/S1unrolO/+TY4ic8tp/lb0+zSs27fiVp044phprOel4bGfW3h73sk7d6AWQic9psFni2x
	ETp4vWCw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xOZpS-007hWX-1p;
	Wed, 04 Nov 2026 12:10:58 +0000
Date: Wed, 4 Nov 2026 04:10:53 -0800
From: Breno Leitao <leitao@debian.org>
To: linux-btrfs@vger.kernel.org
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
	Qu Wenruo <wqu@suse.com>, linux-kernel@vger.kernel.org, boris@bur.io, jlayton@kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: btrfs: bug report: reflink racing with async compression forces
 read-only
Message-ID: <ause7k_HjzUWT3D-@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_041104_421144_BC74EC2A 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

We are seeing btrfs go read-only on arm64 production hosts (64K pages,
4K blocks, compress-force=zstd:3), on 6.16-based kernels and up, still
being reproduced in linux-next as of today:

  BTRFS warning (device nvme0n1p2): no extent map found for inode ...
  when unpinning extent range [20480, 24576), generation ...
  BTRFS: error (device nvme0n1p2 state A) in btrfs_finish_one_ordered:3200:
  errno=-2 No such entry
  BTRFS info (device nvme0n1p2 state EA): forced readonly

A quick bissection seems to point to commit 1d2fbb7f1f9e ("btrfs: allow
compression even if the range is not page aligned")

I've able to come up with a reproducer that hits the issue within
seconds with 64K pages:

	https://github.com/leitao/btrfs-reflink-async-compress

My robot identified this as the root cause, but I am not smart enough to
understand: 

A reflink into a range that is still being compressed does not wait
for it:

1. Another part of the same folio starts writeback first, which clears
   the folio's dirty tag.
2. The second filemap_fdatawrite_range() in btrfs_fdatawrite_range()
   finds folios by that tag, so btrfs_wait_ordered_range() returns
   before the async extent has an ordered extent.
3. btrfs_clone() drops or splits the extent map pinned for that extent,
   and the transaction aborts when it completes. If the clone wins the
   race instead, the compressed write lands after it and the cloned data
   is silently lost.

Thanks,
--breno

