Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC709606D826
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 19:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2nWqQO7w;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UJpToFkm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Nzlx94xCXsJ45lxVe/+sVswON2gOg3rsCW8+XOQD9A0=; b=2nWqQO7wEzpMPt
	XcJBlSk1lZNWNeE34oouzuERu4bWCGz59sPfieAWFpZ/EsAMRTtN7+kDIWEJL1M0EzcPh8A+HdtR4
	XWdtFYzkzrBgnyC4Hx4LoWKz14Gscgs/sLf7BUdqtTC9NqBHOryUuitJeiSasN+6esYI6NlgU3IC6
	QNlMzqxhCF+W0+eiKZ14Sr78vmO0gkkGpFDNOmh/vIzOqjjuAf0vOkVnkebXtzGKloHsYggfCsEt0
	PpyppXUiZHL0rc9q9G/7pZehanGFGy0qfei6TpavPwe1XS7uMXaw4wxNhD3FEY/11L85v+FjpTciX
	wfFEiLwfVRDp1jlguAgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgHk-00000006WEI-0top;
	Wed, 04 Nov 2026 19:04:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgHh-00000006WDS-1CNV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 19:04:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D5D91650;
	Wed,  4 Nov 2026 11:04:29 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 479053F673;
	Wed,  4 Nov 2026 11:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793819072; bh=mxmVvekXUus81W/rKLQ1g8nPXVBK8Oe3f8XNM2lJhl0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UJpToFkmsbrCWHGQ4OO6XfuXp18FpfQiAbVggcwq5rAhdmorgcuC/SS4N3csUrCEU
	 3AuXANYl1F/ALdK6dcyc44JIptZqqvZOZG2+gClGyUBCTindQZA0PbySwWwvbztaUD
	 7Q999ciCaob6yEDdW8s3FM3byFrMdr+z39sQjy2I=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mm: validate /dev/mem mmap ranges without overflow
Date: Wed,  4 Nov 2026 19:04:23 +0000
Message-ID: <179381905165.1379866.9924392772428731758.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101171030.87343-1-zhaogongyi@bytedance.com>
References: <20261101171030.87343-1-zhaogongyi@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_110433_371145_CDFC94BF 
X-CRM114-Status: UNSURE (   8.52  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 02 Nov 2026 01:10:30 +0800, Zhao Gongyi wrote:
> An arm64 syzkaller reproducer creates a FUSE character device with
> major:minor 1:1, so opening it uses the /dev/mem file operations. It
> maps one page from offset 0xfffffffffffff000 at user address zero.
> The next openat() with a NULL pathname triggers a synchronous external
> abort (SEA, ESR 0x96000010) in strncpy_from_user() via do_getname(),
> panicking the kernel.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: mm: validate /dev/mem mmap ranges without overflow
      https://git.kernel.org/arm64/c/b0958b1397fb

