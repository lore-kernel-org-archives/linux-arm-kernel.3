Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00F8C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 11:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=waqohNZIdoy78eS+j2mTU3wjMCyw8XXPGbriMgKELNU=; b=xQ3Lf3ZJgY5BoQ3WZ01dJCH1/U
	/6EcqwRoq+bm1fiqG9c4PUeobLFPJo4j8Y+iI8fSxqNwdFkQ3EkQVKPf2ENzLkQXWh+gMSNSfc5IL
	x7DN9xL4NXSkCwOMkJV73GmdXnZK2fFEixkkolB64VQcJI9VtGgQZOtCkCTsNBZQC5tYsN20mTctM
	sVQ0F22bR7IuKNJ6f6OPeAqSW9UNTmrO2ETx/7Tsv2QwpJDZxwd+oKmBsuZwAcKh6LS1/3gc2sz/m
	IUkHLx/k8GbhTBW0nVDsPMpdC5Um7w+WEJ6LKO3IqKO3/jzHI55mR0K8h4J3ly36Gk0RJwa9aTwg7
	L9hjM3tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uausp-000000006Ft-0mwI;
	Sun, 13 Jul 2025 11:28:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uauqS-000000006Cz-06e8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 11:26:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 580355C2BAA;
	Sun, 13 Jul 2025 11:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F75C4CEE3;
	Sun, 13 Jul 2025 11:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752405971;
	bh=c3Q8QEGiOg6VqtKooLbYt69TTUZ6bQSCAr/wJwfz/lw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QemZ5N3ij1UawecXNKJxgZVK7pgLRbRPSPE+D1jjtWX6o/7sTrYM8AaA/UP1FZ0nt
	 d/q4KZv7KCLEgAahvbj89D3L7lQytAFlTXfaSrwJT0AlZr6bfMP9SXQjRINPXsbQWw
	 f70hLEwThDFWKHbBo12MsMj7K0M6sgzMMeBoiDt6bJDZ3RjFVV7VoQpGEup6j6QobC
	 9cQVoflt7qPxyLiGI7y7UH7n3rero7ecIsvgACJOfe4xWF0fcYwOfqZpqs3om8tEQX
	 HQY8W0OYzuA/xySO3GW20m2ruYvuPzubFTgye/UadvBjSLy/+pHZHf3SkGcP95dATa
	 7/dIv/E69ZMsA==
Date: Sun, 13 Jul 2025 12:26:05 +0100
From: Will Deacon <will@kernel.org>
To: DaeRo Lee <skseofh@gmail.com>
Cc: alexandru.elisei@arm.com, james.morse@arm.com, kernel-team@android.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, qperret@google.com,
	sebastianene@google.com, sudeep.holla@arm.com,
	suzuki.poulose@arm.com, tabba@google.com
Subject: Re: [PATCH v3 08/10] KVM: arm64: Handle FFA_MEM_LEND calls from the
 host
Message-ID: <aHOXzUvGaQ1Bz3jG@willie-the-truck>
References: <CAATEi5=y6w3jziwKbrnUkWGy=RTGh=+jKdrXEnOdAiEcH=npOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAATEi5=y6w3jziwKbrnUkWGy=RTGh=+jKdrXEnOdAiEcH=npOQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_042612_108921_A16CB39E 
X-CRM114-Status: GOOD (  10.58  )
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

On Sat, Jul 12, 2025 at 10:36:24PM +0900, DaeRo Lee wrote:
> > Handle FFA_MEM_LEND calls from the host by treating them identically to
> > FFA_MEM_SHARE calls for the purposes of the host stage-2 page-table, but
> > forwarding on the original request to EL3.
> 
> I have a question about your patch.
> Does treating FFA_MEM_LEND as identical to FFA_MEM_SHARE imply that
> the host can still access the memory even after it has been lent?

Only if your TZ implementation is broken and relies on the NS hypervisor
for isolation.

Will

