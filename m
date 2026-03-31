Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0C510F92EB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 19:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0vp80+hf4c4RR3uobfIupDKZm6+jp2Pff53XYKiU32o=; b=kEUHi6hegesmNSt1TgkrkxZvCx
	rF3dCyGIJ71zLJEfcbo4n1hKDOSF9peG3S3jyFpBOg/cdBX1hUOVOyjFk6En2AtiKS02WFGdxiIV8
	UhG624+v16QXIUFSD3ht9a8MhXmdQfY/PCzafALJ38HoOY2Q1vUCA2Rd65IjGIV3HdO2oXf+8CjWG
	9T9NsClydwTVD30a379SPTbJNbiB4tUyrjO69H/2J+SKZiUZ3TEN8I0jrBmb33EfPOvKRmJKpo3gk
	wUgtai9R/l44GjhLMQZZRdJ8xuFrKOsRxCxyAJMak4h1XM3/W60N27VvdqYEEzL0wfT6YTPjKE7dY
	nnKWwOXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7eKt-0000000DRu2-0EFD;
	Tue, 31 Mar 2026 19:01:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7eKr-0000000DRtr-2LWD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 19:01:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 953F060138;
	Tue, 31 Mar 2026 19:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14EDEC19423;
	Tue, 31 Mar 2026 19:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774983668;
	bh=SwrpfwNcoOScq1B0/gz7R0Ml2sFtOOebgapbWsaQjCw=;
	h=From:To:Cc:Subject:Date:From;
	b=FXGzM2LL9pd5DI98Af8ILNoiCZ3Qe8jaDpY73+fXW2KCfPhEYerlgbC12OOfxCj6d
	 iGJJrIvY3hTSQ/TVldtj88ym/jJFIk6TUzfR4Vm5GZqlf3KTFHviIsrzN7UgevZvtj
	 E59SB/SHkKEzyRvp+4j3pAlSHmGc8FyVjKG4anbYc38w2fnUTkNwR7+f6G/aWvhuS5
	 037OCQYbsKabEpTgh4JDaWXGHQFxmnvObExyekIjKGSW3D55p2ase8S9XFGwQkzVGK
	 3wBBxaA4drKHamuVndrCmVvrj+f2921MKNRv3t+iUWOUJbQQXJ0jSd3rOlTU/qpQGM
	 c/wil/L4kfweg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Christian Schrrefl <chrisi.schrefl@gmail.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	=?UTF-8?q?Fabian=20Gr=C3=BCnbichler?= <debian@fabian.gruenbichler.email>
Cc: Rudraksha Gupta <guptarud@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: arm `rustdoc` Rust 1.85.0-only build error
Date: Tue, 31 Mar 2026 21:00:53 +0200
Message-ID: <20260331190053.482607-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi Christian, Russell, arm, Fabian,

For Rust 1.85.0, for arm32, for the `rustdoc` target (i.e. all those
combined), I am seeing:

      RUSTDOC   .../1.85.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/lib.rs
    error: target feature `fp-armv8` cannot be toggled with `#[target_feature]`: Rust ties `fp-armv8` to `neon`
        --> .../1.85.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/../../stdarch/crates/core_arch/src/arm_shared/neon/generated.rs:7538:48
         |
    7538 | #[cfg_attr(target_arch = "arm", target_feature(enable = "fp-armv8,v8"))]
         |                                                ^^^^^^^^^^^^^^^^^^^^^

The issue is [1], was introduced in Rust 1.85.0 and was fixed already in
Rust 1.85.1 [2]:

  Link: https://github.com/rust-lang/rust/issues/137366 [1]
  Link: https://github.com/rust-lang/rust/pull/137632 [2]

It is unfortunate since our minimum is going to be 1.85.0 since that is
what Debian Stable has (even if patches may be on top) -- I generally
test the latest patch versions for each minor, but I noticed this since
I also test the actual minimum, and I am bumping it to 1.85.0.

To be clear, it is likely almost no one actually cares about this, since
nobody complained yet, and this can easily be fixed using the already
released Rust 1.85.1.

By the way, what is Debian's policy on upstream Rust patch versions?

Thanks!

Cheers,
Miguel

