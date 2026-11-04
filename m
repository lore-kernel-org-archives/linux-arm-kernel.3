Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F89606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 19:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C5kAxZjJ;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=grj8sXve
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZcNOKAF+btuKJx3uZSf5CmZcmaTrqP39Exdfb20KUT8=; b=C5kAxZjJwTLGTw
	cPEapbBr2ijx9iTbaj0QPjGDCScWeu1Q03R5NgTjU4pT6OLjEFVTW7bxUnpNjMaOSypMkd6DhL4Rt
	Us3Hf76cwd3hEBj4IO9UKetzX1R5CDyEDWS97Mu/ZqgamhyPpi4F0G+4CxQ2NiJCEA+QW42cfqoJk
	Rq/7BkvOetb4nCz+xcV0j7HQm9EW5mYYgLxAwDFB2IF7YFFhYDPYyAzslR6gFtdbQGhWoMKxBfYcU
	dr9cDsPO1Y4C4/09AxsOedgcsBiQYPEaQD4F2c1u0DO7QmygNhj/j49P3jKn3PNLpBhfDHf1tuNUp
	qgjX3bxN7haiuC6B/cwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgHZ-00000006WAg-03S9;
	Wed, 04 Nov 2026 19:04:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgHV-00000006WA1-455s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 19:04:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F18351650;
	Wed,  4 Nov 2026 11:04:17 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 595593F673;
	Wed,  4 Nov 2026 11:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793819061; bh=e2/cEutB6rP6H6O7LKfGlCjcwtFZrdduOluWtjmZmwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=grj8sXve4ropMy7ygQPr2l6wjWitIEPyVLFfoW9Tu3DIk8YJl/gFHn2IoMuw8iKVj
	 87zso7OeaDaUNTYLa+241oL835Zu/mTCsfAql26dP0WpCynBURr3nSRGfqU9MWLZK4
	 lEB7Jvb8UpNbLv4Is68eGeg7Blz86t2SaSvT7+ck=
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org,
	Wei Wang <wvw@google.com>
Cc: broonie@kernel.org,
	mark.rutland@arm.com,
	rafael@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wei.vince.wang@gmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: suspend: Save and restore TPIDR2_EL0 across CPU suspend
Date: Wed,  4 Nov 2026 19:04:11 +0000
Message-ID: <179381905166.1379866.18383747064499399879.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103175941.1349818-1-wvw@google.com>
References: <20261103175941.1349818-1-wvw@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_110422_044148_97BD50CC 
X-CRM114-Status: UNSURE (   8.61  )
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

On Tue, 03 Nov 2026 17:59:41 +0000, Wei Wang wrote:
> TPIDR2_EL0 is a live EL0 register on systems with SME, but
> cpu_do_suspend()/cpu_do_resume() don't preserve it. Its value is
> UNKNOWN after a warm reset, so the task that initiates suspend can
> return to userspace with a corrupted TPIDR2_EL0.
> 
> Save and restore it alongside TPIDR_EL0 and TPIDRRO_EL0. The new slot
> fits in existing padding, so sizeof(struct cpu_suspend_ctx) is
> unchanged.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: suspend: Save and restore TPIDR2_EL0 across CPU suspend
      https://git.kernel.org/arm64/c/beeec0404622

