Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3869ECCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 08:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7O1I1Qi0fk79HabBdttOYeCAWTnXiIVAA2lWXhHyaro=; b=w+s2GrrWOC5V3OslLas7BoX95l
	e1KmX3i+lBTOfNVkzOgqQ3lEY/c2nPC1oD0lcU1Kwrmtk1kkzmtm/R6n5pG6ZDdA531G7WNqxGn4E
	XnKfqNCNCLGZrIEHR6yM7Ee3cGg98s12POtX7DNVAmiR4OG7dTnMvv8BWAptXMoFvUtmS1u2wOQnl
	RWgRqJbNYLYzwrso+O+q9CV1hy6Xfrzid64ZxZ4FnzeCp9LJouN6XN7Elo+Qdnl3ZUUsxnm/JYNi3
	5KPFo6YrkOrZfutRaSA0edYPIqAouQwftkDnTndTgAzYJwAatWZDknTd4ChYLOdzmDwJ3Iab2N1P9
	3X8yKU6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Plk-00000003UAL-1Lqy;
	Wed, 08 Oct 2025 08:43:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Pli-00000003U9v-0RoN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 08:43:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BCE5440DA;
	Wed,  8 Oct 2025 08:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E1F0C4CEF9;
	Wed,  8 Oct 2025 08:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759913009;
	bh=8OIe0p1Hm72TWcZ007AOZ5v4Wu/FbHR/ip6j0BQUFzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GGC93WONLn2hBON0l0RHXZ0oOiPOzZXazbIFXUy3uzdG0uLQYRXZvHQkSBb8FBgGt
	 eA+xBTRVHfzDMB0xssKDbYwjQ6B/9sF74n4fYbfaTI9arfSxuk72+PdeD1/cPSMvMb
	 FYB4a8dU0+8I16AMgfMhXkUgGz16aAPN4M2WrGJJ+I1KSnuDv1+VnBIP37vPmh1xdi
	 GVhgE3RUOnYrdZpF3QfbSUcSThVlb3CLTYyf2SXUu80LNYOyu3oQhoemzfp6Q1nSn6
	 m5DFa0/pjzXrSOtH6Xv+2fQiII94sM/164+ouIDVI9yA9kjqIsOJDQuLoaUqv6Gqyx
	 jB9wcsgEsgsUA==
Date: Wed, 8 Oct 2025 09:43:24 +0100
From: Will Deacon <will@kernel.org>
To: Li Mengchen <mengchenli64@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: kgdb: Ensure atomic single-step execution
Message-ID: <aOYkLOz9enrTaVVk@willie-the-truck>
References: <1756972043-12854-1-git-send-email-mengchenli64@gmail.com>
 <aNPiUbdRhaRklebF@J2N7QTR9R3>
 <CAEkTZs2x4RzUbYWXO=B1ZGtxycbryNT4YbROH2k_k+0L_B6Erg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEkTZs2x4RzUbYWXO=B1ZGtxycbryNT4YbROH2k_k+0L_B6Erg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_014330_161449_77750F54 
X-CRM114-Status: GOOD (  10.76  )
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

On Wed, Oct 08, 2025 at 09:01:22AM +0800, Li Mengchen wrote:
>    I am writing to address a persistent issue in the community’s code related
>    to single-step tracing, which has remained unresolved for over a decade.
>    The code I have provided has been extensively tested and proven to work
>    across multiple hardware platforms and kernel versions, from 3.10 to the
>    latest releases. Its correctness and effectiveness are not up for debate.

Ha! You're joking, right?

If you're not willing to discuss the details of your patch then I guess
I can just delete it instead. If you change your mind, please respond
to Mark's comments, thanks.

Will

