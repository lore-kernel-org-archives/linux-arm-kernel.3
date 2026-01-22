Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87530D3EE84
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 17:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghzVbDJfTcsBpXb8PT/USBa5XHlrzCqpswIw0aCtc9c=; b=RRzg2uYEPzc22wiKIPkGvxrY/F
	N9Wmu9ItEbG/aH3PDrjI/k1zGSxL9HQsG7IH5E6MdHt1KzE6zAu6krqGvtJcnC2KVuyberfnTAWay
	0jWO++VSEkWq8CQFgcgnlvb/aT148TawkHQ1phIsPHNLhINRsmU3JimGHOfKHQlcwFagV3oVBV38r
	I+CPXkoeYBFZYsna9qJwPke6P4nqQeW06A9zP4CFY3MSJQarHQoFXsqKxa817iyuFaIodzNpxtx7e
	aZAuL2tlJ/UBnhlLvAlfn/lIUUKbzbbWkyOyO/Bd/w9IDTRPWfEwRmNIPS0kq/rOUCbuIDKUaGYMK
	Vp/K1pZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viy2X-00000007WFv-293S;
	Thu, 22 Jan 2026 17:00:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viy2N-00000007WDc-0aNa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 17:00:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3705A41B58;
	Thu, 22 Jan 2026 17:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 345ABC116D0;
	Thu, 22 Jan 2026 17:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769101202;
	bh=rPpScL91nAP4eFthfPLVzCQGAbbZTdBbJLpRlIgAIZk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BoPA510QkhV5qhF+73Pqcq38YGatWYZty2SmPiwTRPHb+1pTrjsMxrd6kSgZXI4AR
	 R3yaEiUuKDCntKL25Kf43EKyeHzmxUaLJrAFKny2AtGw9JDuP5myybufUmi4vt7Wf2
	 2GiJB5Bs5OaSCGf+mYaAQ3epdUjAk3Lw5DA6Fqpo5u8HdYbssOvCfHgpcoMYHqGQ6i
	 +Mo0mILuro80Ee3FqG+ILvKhnNssZVCGGhcgMYN69U2z5Ti31dnBIF/aItAsGc49Fy
	 ZytQiebGwjrSjm+hA+ufVxsGPEmkfdSuuMHALh7B7fjH0aDRBRxuxYtpI9K42K34lM
	 Halreo3OzkHlw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Breno Leitao <leitao@debian.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	clm@fb.com
Subject: Re: [PATCH] arm64: mm: warn once for ioremap attempts on RAM mappings
Date: Thu, 22 Jan 2026 16:59:42 +0000
Message-ID: <176908082966.2054641.12981520784317252855.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222-arm64_ioremap-v1-1-30ff5f718b61@debian.org>
References: <20251222-arm64_ioremap-v1-1-30ff5f718b61@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_090003_213224_554C7AA5 
X-CRM114-Status: UNSURE (   7.75  )
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

On Mon, 22 Dec 2025 07:28:55 -0800, Breno Leitao wrote:
> Replace WARN_ON with WARN_ONCE when detecting attempts to ioremap
> RAM. This prevents log spam when a misbehaving driver repeatedly tries
> to map RAM via ioremap.
> 
> A single warning is more than enough to show the broken code path, and
> extra reports don't add extra information.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: mm: warn once for ioremap attempts on RAM mappings
      https://git.kernel.org/arm64/c/53f45f045cbe

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

