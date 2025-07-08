Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B066AC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 14:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CnnP8IY4ndOIsOhIi3GP64s7hZE3Sd2LW8evv6lRi/0=; b=rNW0ZMtddxbOvBaNc36hkiXk4h
	lf+YELAb6Yy8D7LlIZNdFbGvNMfNUvm1Ja+6PMll4pUn9iapYsnftDaYcnOyVbvESWMjykMc8d+xr
	8+3GRr8QaLv15x3ZYXrmwXZrxzTA47eHdFlX9IiPB8lu99dhfohRHIDHYdegWWCp94bqO836a40Sq
	M+b+b5CXjXwgUUGgqJmRWpNJUFBwVucOx9Po/3NWidM8XTYgGOLkxQN6yCVDZcDqUuVZZpttaihee
	/tPDhxIZOliFVXU/2YwBXPr3X7lLCB9ytuTXfkXDyVuKh/hqgDttYTpKRc3PazuWg4oGDTc7vKY2u
	o9w7rbog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ9dv-00000005f73-3BNS;
	Tue, 08 Jul 2025 14:49:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ9Ye-00000005e3s-1la2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 14:44:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 08BCF45563;
	Tue,  8 Jul 2025 14:44:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6353C4CEF7;
	Tue,  8 Jul 2025 14:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751985871;
	bh=xUN611eNoj7nUPC/lCktog0OhbWYrAFXP31VIxYfj+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L9rx2/5teGXaMGn3tbGYbR7Q9FFiSHKatXEcnbsAgIchsDVRPKctSuLzrJYClyuBS
	 fJjKJmbFUTyjnF5Mdrq1999Zh0dINJxlJJX2o4/I9rwCpJexsNzbcByahGeC6KniKO
	 NS2ilc8AngakhAiJUWYcFBJmykJtqMzib3sURROdiLNjfHHIkph+JHSTdKv6HKRFmt
	 3Lem5Pkjr6QxsauOp340+Fv66nmLkgfhueFqmznIKYB4gQ3NLcC4L+tsWrHuynvOce
	 S3vwx30UmEzSDuOgTHxRZm4AGzPL30+T72m+ymcNfqr/IiAV1YL8j9xP3XwEuiTTI1
	 hMzzKOqNFeX/g==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Breno Leitao <leitao@debian.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	leo.yan@arm.com,
	kernel-team@meta.com,
	mark.rutland@arm.com
Subject: Re: [PATCH 0/8] arm64: set VMAP_STACK by default
Date: Tue,  8 Jul 2025 15:44:21 +0100
Message-Id: <175197847112.1372868.7723953963847724709.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250707-arm64_vmap-v1-0-8de98ca0f91c@debian.org>
References: <20250707-arm64_vmap-v1-0-8de98ca0f91c@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_074432_479494_0D52B84B 
X-CRM114-Status: UNSURE (   9.77  )
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

On Mon, 07 Jul 2025 09:01:00 -0700, Breno Leitao wrote:
> This patchset select VMAP_STACK on arm64 by default, and cleans up the
> code by removing all associated CONFIG_VMAP_STACK conditionals.
> 
> This is a suggestion from Will Deacon from another discussion[1].
> 
> With VMAP_STACK now always enabled on arm64, the code can be
> significantly simplified, reducing complexity and potential for
> misconfiguration.
> 
> [...]

Applied to arm64 (for-next/vmap-stack), thanks!

[1/8] arm64: Enable VMAP_STACK support
      https://git.kernel.org/arm64/c/ef6861b8e6dd
[2/8] arm64: efi: Remove CONFIG_VMAP_STACK check
      https://git.kernel.org/arm64/c/63829521a8e8
[3/8] arm64: Remove CONFIG_VMAP_STACK conditionals from THREAD_SHIFT and THREAD_ALIGN
      https://git.kernel.org/arm64/c/0909c719c17b
[4/8] arm64: remove CONFIG_VMAP_STACK conditionals from irq stack setup
      https://git.kernel.org/arm64/c/c4a5699d5cef
[5/8] arm64: remove CONFIG_VMAP_STACK conditionals from traps overflow stack
      https://git.kernel.org/arm64/c/e5692bba1e66
[6/8] arm64: remove CONFIG_VMAP_STACK checks from stacktrace overflow logic
      https://git.kernel.org/arm64/c/907cb5cd8efd
[7/8] arm64: remove CONFIG_VMAP_STACK checks from SDEI stack handling
      https://git.kernel.org/arm64/c/3e72b9e9f01a
[8/8] arm64: remove CONFIG_VMAP_STACK checks from entry code
      https://git.kernel.org/arm64/c/9d1869f0f537

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

