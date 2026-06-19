Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEEFCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 13:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FozTM/GYLgmwFNfDI2cHx+3emSRhaWbZEhFRJAOgStI=; b=0v7Hd6bEPtUry8nrLWlzgTMRA5
	SugdzN/Y8GFMtBPRjMDZD1CJieK44nyR0zzDCYjPkbKnO9sNiQwjI1q+r+XPlk0PwNzRE7PCXQ7IV
	OAVUFoS2taO7/toBRwMIpMWMMz7gXTM/7Z/mjVnXbgIBQz8wFGJ1zsPuv+39S1frdQL0mmGJy+3A+
	vdsq++68hia8Zyr+NcYq4Z6RoiklGByDTc4V/pxohr3+RvWBPRrDCxXaHm1kVMRAckLydcwGpoNqP
	ndko8FBBzWbT3WYN/Yx8NBk6Hi0aD4l+bzP0mx3EskNHWf45KIp2wmts08WpZtJuOaYjKZVKojNhk
	mK7PjrBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZeI-00000002VVj-2cYf;
	Fri, 19 Jun 2026 13:52:46 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZeF-00000002VVN-3jTn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 13:52:45 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C844A140011E;
	Fri, 19 Jun 2026 09:52:40 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 19 Jun 2026 09:52:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781877160;
	 x=1781963560; bh=FozTM/GYLgmwFNfDI2cHx+3emSRhaWbZEhFRJAOgStI=; b=
	iKTunirmvI+4OklbO9Zulczl2+ZYCzHU+p5OkSx2JU3IINDiOLSyVobI9Rj2MIJH
	lXKHpWc/xbQoMkpNRuBAR3kiaGNqo68cPsfkgOFp1Gy6RBAwfGH8km+R4dUMVZLU
	ViFl5dvJNFWr7f5rey2qW8Jw8XoWcozYqJNmkzPKojJThjPrMz6zOGOe0nTuUFfR
	9hHlCJ75ZnSf+UKwrEcdBDutFknBXaDCcNEnpad06efjnnzOKd/fnoR5uOvk4zeY
	HVgJXeB6S3wp0eL4ZpS9Ho3IxqLoPWA6RJ7/5V6ylvUWlDdH8gzkPa4fzQhOozmx
	a6H/JhBRUg7OEaJlnzuFaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781877160; x=
	1781963560; bh=FozTM/GYLgmwFNfDI2cHx+3emSRhaWbZEhFRJAOgStI=; b=e
	rH7FzlMvCnz/C+lRZXTIw0i6XLi7PIwyX4uD0KYPSIGernYG6GhW1pAJCiRmTVqJ
	/LmqR/6equVAmCcPwJDTu9Q/9drzC9OxxZqUQHIfMUzhW0yGV2CL0PhlTSXawdhM
	eJaPi1227CeNooKpRb4s2s52GchO/M4eZJ1V83KU9Vb/xaJPPr/p2G3Q4Zpp25or
	+d26U1k57F3ZSTOKkILwDruWGibMuB5v+kyGegT8jnYUvH36TjGz0yfZz5W9e4DM
	KUN3zMdhiSLRcb5WjymqF58xW6cHRlzObOJY0en5C5NfEKV0oLtwIVLEUNXafg91
	ftvEeGyLcLOJOdaIo6etw==
X-ME-Sender: <xms:qEk1au_4iskxCmB0yLtLCzX6eozZrFZvlcoaUcStIl6EUopRa6RQag>
    <xme:qEk1apiLtUWDfR4dNBU8idL-KxPm44pp1eyyB9ssZf4QKgxGw1FF2uUSbem2kgl0o
    qbIrRc1JjUZ7nq1cfme4ohG-1t_c-6rqtkimGOdNbo-h-M90ZjMc6Q>
X-ME-Proxy-Cause: dmFkZTFQUFt/7BhSYI/XwTEKSUFd5PK4AHv+bPoWdTbwmWAXwFaiVd67T6MG/znkP2pxvq
    nBazpJjCQVyS2w52XDXPIndzegEZOvzcS9n3rqr6DHRmV4ssU/7VRzDCI/bfauez6jpLPj
    jNBojBHMIKmsX9lNOwPbI/Riz9JbCZGGqjtp+0Gm5CVd+G6ps10TxqVehDFZqr3CSl5RCl
    BWQpV/6uYmEUo/HEfZPm8iCLi2iGdxy/cHBJRYjAJlHK32Gx3Rrwi2NwFK57Q9nd6aVkBp
    4XxZuwuHjvfPOjloDqyRUou3iieexynCev5UPU7Q/nBIxe07WOKYk9zI3TLCItigwpHvkp
    ex6P6IFZFiSICuyOpTaGN8ufHucnqZ1kpfINBPRAJN9wCv6+p6LU0cETpvXA5HvdUgf09G
    lbqx4ZPzHk7symrdhQabqD+RTpA68R//+D4Pd3D24AvcnY7BDUMKksZRnUr5fthrV1j3oQ
    A3OwHWXA+KdlWWeseF3SQuHm+0rvHJsZRDQDWr2G0XxAEb7wQkHsSi89my6csLo+T+EBSl
    GkMabbkeGZVJsw3qzRwrKhg1Nc9eZ+5bsJdaluyDL/bItNPBcuTWs3zwtx8i0mQLRs0jot
    CaMIZp9HLyxEZBRnIKPQb9f5NGs8IPo6df9N8o05RvscYQvLLcr/r0R8dh5g
X-ME-Proxy: <xmx:qEk1ag9UMoCZnGta0lRpb-GdBDrq0uVSx_VYsQ4FLw4IMtYgpxiXRw>
    <xmx:qEk1alQrk8SThjCYV5ieJdGiLBYHGqxlwlCneera4ujkca93lasXFA>
    <xmx:qEk1aqcjrSjCHw-hGxpeD6Cb0Jz5m1C7itMsAQgvIYi0ZSjhr1lMiQ>
    <xmx:qEk1anQ5KcDk02pM2UspYl-XPB6lG8h5woat88q-q1FIlRAG9RGNKQ>
    <xmx:qEk1avkrakdzWPb7F3M9fj-BO6i3roU2dQEBsETaKL2WxPAmX95Z4fBj>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 620891820082; Fri, 19 Jun 2026 09:52:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A0Y27BypNIT-
Date: Fri, 19 Jun 2026 15:52:20 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Will Deacon" <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Steffen Eiden" <seiden@linux.ibm.com>,
 "Andreas Grapentin" <gra@linux.ibm.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Dave Martin" <dave.martin@arm.com>, "Mark Rutland" <mark.rutland@arm.com>,
 "Marc Zyngier" <maz@kernel.org>
Message-Id: <8549526e-aff5-4448-b673-dbba7ed9065c@app.fastmail.com>
In-Reply-To: <20260619130835.5678-1-will@kernel.org>
References: <20260619130835.5678-1-will@kernel.org>
Subject: Re: [PATCH] arm64: uapi: Use __u128 instead of __uint128_t in UAPI headers
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_065244_450775_0C004B87 
X-CRM114-Status: GOOD (  13.00  )
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

On Fri, Jun 19, 2026, at 15:08, Will Deacon wrote:
> The arm64 UAPI exposes '__uint128_t' types in the members of
> 'struct user_fpsimd_state', 'struct user_pac_address_keys' and in the
> signal frame via 'struct fpsimd_context'. Since the alignment of such
> a type appears to be non-portable (16 bytes on arm64, 8 bytes on s390),
> prefer the '__u128' typedef from uapi/linux/types.h, which makes the
> alignment explicit and allows the definitions to be reused by other
> host architectures.
>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> Cc: Steffen Eiden <seiden@linux.ibm.com>
> Cc: Andreas Grapentin <gra@linux.ibm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Dave Martin <dave.martin@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

> I think it's a straightforward change, but the only thing that makes me
> pause for thought is whether there are toolchains out there which accept
> __uint128_t but not __int128. Then again, if that crops up as an issue
> we can probably just tweak the typedef we have in uapi/linux/types.h.

clang-3.1 and gcc-4.6 support both and are 15 years old, older versions
only do __uint128_t. I agree that this should be fine.

     Arnd

