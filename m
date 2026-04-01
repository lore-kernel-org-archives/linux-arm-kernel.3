Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B65D35177
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 12:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o+W6wxejuhQWu+8gkrXK9GhcqdkTUJi7B+7n+/aOO8w=; b=JUkw1CYNWkd9LLFULjHaqTv0Xo
	/3HnivskEjy7dQRdFdlFRdJLWGR/XvngjcaWV2VjNCD84QVb4nSPVClUw0YCFTQ9dL5NSSyTCYh+Z
	WTCohZDZ4pWdKKPjLBgkNLMP6enQ8Nq9fzBa19zfUunUZD5aM5x1j4ICwrQ9e15iwzxFaiUg53Rdm
	VmpjpJRQzkrYuhAYe0cqAde45w7+dFd3Ud/+4gR3D6ra5LwPsoXR9D5F8HZ/zfy8XjIoI4D8jA4W1
	B0/O1VQD9GQfokNDVVTTcfhD/0P29Uq1Gi0FyNyFWhlwfmSNr51QmM2NRbVbY47XBUF84zZ8g9rJN
	sG2ojGUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7unD-0000000FAfg-21wu;
	Wed, 01 Apr 2026 12:35:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7uIT-0000000Ennh-0mTZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 12:03:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FB6360125;
	Wed,  1 Apr 2026 12:03:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF52CC4CEF7;
	Wed,  1 Apr 2026 12:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775045024;
	bh=hCs3gNjx+jcXSRozFFYMPzrJYE5HyYdfubfGLgAk+s8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Zz3yXk85z+ao70V4KUJhdaAwcRYYpiW9NcE9wlBqutL0QtAJm3hh92OBa+hjnmUCD
	 W33ZYpHndN8R8lRTjhMdD3xNvBNHE5ceMkHknh6OHWirwXmQl3QKvsGfhqQg9V1msl
	 NKq0SYnU3zvDHeO2JrXVbzvpLnHqdLiZ6g5fMeF9fa7iHwJ5tnyiX4c+AITPo9it7d
	 RRCwXHv+uoVkx4aiGa3bsYbFyTbA9hLQHhSdfqOVeFlj0LXsZ6dVGLSmg1usXIi6jS
	 S/VCNy0QgVsKftYl80SQvrv6yAfP2EnTD2w0d6Gc8dSvCoNUrauoqpOkjCpzS4PlVP
	 2HGdl52tBqHYA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id D03F0F40076;
	Wed,  1 Apr 2026 08:03:42 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Wed, 01 Apr 2026 08:03:42 -0400
X-ME-Sender: <xms:ngnNaZew9n3oO_T4gpuqodYV61O69qIRzRfLBeCIEaN1KRV2QYJnnw>
    <xme:ngnNaSCuc91kCAbgI70eyCaXE_QbgaHCOfakieo6F9ywNFNV6jOWHaotycb16GkAh
    42wWGKbt2zJQgRSRJsH1nJPeoIa2dxHi-iAXJTZJPBta7m7KuGp_bA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeftdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcuuehi
    vghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpeekvdffkefhgfegveekfedtieffhfelgeetiedvieffhfekfeeikeetueegteet
    teenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrugdomhgvshhmthhprghuthhhphgvrhhs
    ohhnrghlihhthidqudeijedthedttdejledqfeefvdduieegudehqdgrrhgusgeppehkvg
    hrnhgvlhdrohhrghesfihorhhkohhfrghrugdrtghomhdpnhgspghrtghpthhtohepudef
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehkvghrnhgvlhdqthgvrghmsegrnh
    gurhhoihgurdgtohhmpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghr
    mhdrtghomhdprhgtphhtthhopehmrghrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprh
    gtphhtthhopegrrhgusgdoghhithesghhoohhglhgvrdgtohhmpdhrtghpthhtoheptghm
    lhhlrghmrghssehgohhoghhlvgdrtghomhdprhgtphhtthhopehsrghmihhtohhlvhgrnh
    gvnhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepshgvrghnjhgtsehgohhoghhlvgdr
    tghomhdprhgtphhtthhopeifihhllhhmtghvihgtkhgvrhesghhoohhglhgvrdgtohhmpd
    hrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:ngnNaTdtZD2b1koNUV8Sso6dxU7WASN8T8ZQKnEKWy16A48-MCCG7Q>
    <xmx:ngnNaWvNgzi93JclnfMD8cfwbZADrUNsoVnr8wNhlTxgcTxnaf-4NA>
    <xmx:ngnNafKLFkHFXeR4eiYn9Y3cFtSrsgzgmr2nEgL6HIWtTv-VMgGjTQ>
    <xmx:ngnNaaZP5J6-abYSW4yZILL-NTXEX21-zhaeF3zQOW53q6QXOq2vPQ>
    <xmx:ngnNaSlVTVhxco218T8XnSqITbDl0WyHDNlq_QeUfEIvG1Q_h87FX3W_>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AC5C8700065; Wed,  1 Apr 2026 08:03:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Anx-CxvWeZ1g
Date: Wed, 01 Apr 2026 14:03:22 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Will Deacon" <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 "Ard Biesheuvel" <ardb+git@google.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>
Cc: kernel-team@android.com, linux-hardening@vger.kernel.org,
 "Mark Rutland" <mark.rutland@arm.com>, "Carlos Llamas" <cmllamas@google.com>,
 "Sami Tolvanen" <samitolvanen@google.com>,
 "Sean Christopherson" <seanjc@google.com>, "Kees Cook" <kees@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Will McVicker" <willmcvicker@google.com>
Message-Id: <2b0b9c69-650c-46bb-8579-4af85c17b8ab@app.fastmail.com>
In-Reply-To: <177503506493.2514486.12265333685036392947.b4-ty@kernel.org>
References: <20260331110422.301901-2-ardb+git@google.com>
 <177503506493.2514486.12265333685036392947.b4-ty@kernel.org>
Subject: Re: [PATCH v8] arm64: Use static call trampolines when kCFI is enabled
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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


On Wed, 1 Apr 2026, at 12:03, Will Deacon wrote:
> On Tue, 31 Mar 2026 13:04:23 +0200, Ard Biesheuvel wrote:
>> Implement arm64 support for the 'unoptimized' static call variety, which
>> routes all calls through a trampoline that performs a tail call to the
>> chosen function, and wire it up for use when kCFI is enabled. This works
>> around an issue with kCFI and generic static calls, where the prototypes
>> of default handlers such as __static_call_nop() and __static_call_ret0()
>> don't match the expected prototype of the call site, resulting in kCFI
>> false positives [0].
>> 
>> [...]
>
> Applied to arm64 (for-next/fixes), thanks!
>
> [1/1] arm64: Use static call trampolines when kCFI is enabled
>       https://git.kernel.org/arm64/c/e70c2335f889
>

Thanks,

I just spotted that the function name gets stringified twice inadvertently.

E.g., the assembler may see

.quad "__static_call_return0"

rather than the intended

.quad __static_call_return0

The assembler does not seem to care, and still emits an ABS64 relocation against the correct symbol, but it is definitely unintentional.

I can send a follow-up fix if you prefer, or you could just tweak the patch in place:

--- a/arch/arm64/include/asm/static_call.h
+++ b/arch/arm64/include/asm/static_call.h
@@ -16,7 +16,7 @@
            "   .popsection                                     \n" \
            "   .pushsection .rodata, \"a\"                     \n" \
            "   .align  3                                       \n" \
-           "1: .quad   " #target "                             \n" \
+           "1: .quad   " target "                              \n" \
            "   .popsection                                     \n")
 


