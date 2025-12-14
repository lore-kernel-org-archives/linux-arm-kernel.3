Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDC0D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 22:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KjAX9BwHMKKij7juX6bUJ6ljY0qmCqGMvx0RKdMtTs4=; b=gkmvdN6HcVX567RcIUc5q+btA1
	pg49xrJDT3PSho9soP2y7OlWba5br2nTWS4LFXeKa3G5Tq/QLGMZRhllqdz9KsCobYa1AUNt7+Uo8
	G2Klc+1UYGajUIEnNhxaSjyHKQlY5tas8eMOOJg52rRDN2yYG/05L701zjOGD1nvmvQ3RqcxfWEWL
	VfbsRzlT+0aQ0VT9V+taGbGggnVh7eSpkxtKLWOEo4Vw6poxI53lWCPp8JI0adPkst7C2j3v4rzsZ
	tWPoH5lv5tfT4GZxZr4jDQs3SjhJIu2SAU+bz7G0dSsPcbgdJGsPXbq6ZRvigcgcKSQXWQjK1glR8
	c/vMOnjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUuL9-00000002mKB-0l6g;
	Sun, 14 Dec 2025 22:13:19 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUuL5-00000002mJk-1IfU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 22:13:17 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 483BBEC05A7;
	Sun, 14 Dec 2025 17:13:10 -0500 (EST)
Received: from phl-imap-18 ([10.202.2.89])
  by phl-compute-01.internal (MEProxy); Sun, 14 Dec 2025 17:13:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jmay.us; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1765750390; x=1765836790; bh=KjAX9BwHMK
	Kij7juX6bUJ6ljY0qmCqGMvx0RKdMtTs4=; b=T+DHlsC1/XTZO3nPUG28FbjmIj
	fxCeRazFmSvu7CsUgKagpbDIViOn+IYSCMXr9bCGe+GRn/eMC+cA5RMH9xXCU/A1
	AfX4JoOb5rm5g/j0ib36FFowcsP5kutI6zPM/l8WyY8JTE3+UT6nQdTKQFAJaY8I
	5XVKqVWC0cZ6c02vsyJ8/QWv+1Z1J6rqirailWeE6DQJT3Z2TM9vDXTuWWzCBFOo
	nWZ2JxGrzDXabilUaZNExv4EWeNFERy9Ryidv3utkTftnj9Usb7t4GcCFkK3ERtq
	GTMO+5focUVs1En9WDNxGxF0BdKdXQDGSQCwMdnRgma3+YTvYbOoPPwwX0wQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1765750390; x=1765836790; bh=KjAX9BwHMKKij7juX6bUJ6ljY0qm
	CqGMvx0RKdMtTs4=; b=agiaXigBV0Wu3rUwm4viIjI08h0/lns7Z9UHV0gSVE33
	1MdPKDrzEjWFNVtGwSxOEPXi4YQX7bobRANmIC6nwr+T09L2vxhJUdiLy8IoIXMl
	T+syP/qDYp5lP/MXMw4Vq0h8BjNsYuOj9H8CMMIHfdyoZ58abdZ5Sp8qujI2ZrZq
	Kg7Xgy7AMWQ9DNTrzWsOvsbmUM/58NmqsEXvS5Xfbkd5w7Bwt9Bci894sWFM0ors
	V+8cE19I36N/iOToCTiu7mCicST3W4PSDqyW4saDhP3TMHXTag7czzSQLvwhkv7g
	G0DL0h7oiyBToPZatSl2hzaVM6kfUhK/adeenUiq3w==
X-ME-Sender: <xms:dTY_aTDitbpKVZnondivAeobIDEv8N2qwJC8247-JLeWvRg8zKO6IQ>
    <xme:dTY_aUVCd-jZwWbUVSeUkhgVWy3tku91BiUVB8fmsrK-MAXI1ACY5YW4UQefuE0Ve
    88RRPeAXYJ597LWh5MjWvJBCJRWQ2wMN3Rx0-jFi2l9vrvRTL-V1Gc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefhedtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepofggfffhvfevkffutgfgsehtjeertdertd
    dtnecuhfhrohhmpedflfhovghlucforgihfdcuoehjohgvlhdqlhhinhhugiesjhhmrgih
    rdhusheqnecuggftrfgrthhtvghrnhepvdehfeeiuedvvefggfdtudetvdegfeettdehve
    dtveetiedtveejgeevveejgeevnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjohgvlhdqlh
    hinhhugiesjhhmrgihrdhushdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphho
    uhhtpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprh
    gtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtohepfihilhhlsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehjrghmvghsrdgtlhgrrhhksehlihhnrghrohdroh
    hrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhn
    fhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:dTY_aQG6hKSmhz2iilzgFD_xr-lC4G5dj9wvU4bmrfJABiBtpIVf0A>
    <xmx:djY_aa1CLShKACpUIj8tvwCLnk0pivrvmcYOWmxIylsQ3bDGDjnyQA>
    <xmx:djY_aaOOvneSHBFR3KOI1qehMj6uXlJINiFFFwk9XT_KWg2EdavtHQ>
    <xmx:djY_aR6HiQx2q5fGeV0Ub53Pyo7o31wyRa-hI3OAN1LFPYz_jRqVyw>
    <xmx:djY_aYIje0gGgTJvs8bhOJpdPFBNeN4Z-MBGpVEHzadV85VZnDVx45HA>
Feedback-ID: i86164869:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DD1B015C008C; Sun, 14 Dec 2025 17:13:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sun, 14 Dec 2025 14:12:49 -0800
From: "Joel May" <joel-linux@jmay.us>
To: catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, james.clark@linaro.org,
 arnd@arndb.de
Message-Id: <b2651f20-6f3a-49f5-9cd8-3fb028b2cab5@app.fastmail.com>
Subject: [PATCH] arm64: perf: fix syscalltbl path base
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_141315_762528_A48EC5C6 
X-CRM114-Status: GOOD (  12.25  )
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

From: Joel May <joel-linux@jmay.us>

A fix for the Perf build process was introduced in commit bfb713ea53c74
("perf tools: Fix arm64 build by generating unistd_64.h"), which generates
the unistd_64.h header as necessary.  This fix works fine in some
scenarios.

My problem is when building Perf from tools/perf with SRCARCH=arm64, the
path used in scripts/Makefile.asm-headers is relative to tools/perf
instead of root directory.  This results in the build failing like so.
This snippet is a simplified repro of the problem, see the link to the
TrueNAS SCALE build script to see the problem in context.

  jmay@debian13-aarch64:/mnt/linux/linux-vanilla/tools/perf$ ARCH=arm64 SRCARCH=arm64 make -j1
  ...
  make[4]: *** No rule to make target '/mnt/linux/linux-vanilla/tools/perf/libperf/arch/arm64/include/generated/uapi/asm/unistd_64.h'.  Stop.
  make[3]: *** [Makefile:108: uapi-asm-generic] Error 2
  make[2]: *** [Makefile.perf:972: /mnt/linux/linux-vanilla/tools/perf/libperf/libperf.a] Error 2

The problem is that scripts/Makefile.asm-headers is including a relative
syscalltbl path from arch/arm64/kernel/Makefile.syscalls.  The syscalltbl
path needs to be based on the srctree root.

Fixes: 7fe33e9f662c0 ("arm64: convert unistd_32.h to syscall.tbl format")
Fixes: bfb713ea53c74 ("perf tools: Fix arm64 build by generating unistd_64.h")
Link: https://github.com/truenas/linux/commit/91377b555a57dfa75364d7da85b5e21e41e81625#diff-831a0e8e3eaa7a5ca92599e58771b8a6b2c4bd7533f627e33138873995aac61eR147
Signed-off-by: Joel May <joel-linux@jmay.us>
---
 arch/arm64/kernel/Makefile.syscalls | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/Makefile.syscalls b/arch/arm64/kernel/Makefile.syscalls
index 0542a718871a..958f2335ec1b 100644
--- a/arch/arm64/kernel/Makefile.syscalls
+++ b/arch/arm64/kernel/Makefile.syscalls
@@ -3,4 +3,4 @@
 syscall_abis_32 +=
 syscall_abis_64 += renameat rlimit memfd_secret
 
-syscalltbl = arch/arm64/tools/syscall_%.tbl
+syscalltbl = $(srctree)/arch/arm64/tools/syscall_%.tbl

base-commit: edde060637b92607f3522252c03d64ad06369933
-- 
2.34.1


