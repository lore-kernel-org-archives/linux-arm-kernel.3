Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE2CCCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 21:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G6yIFXNNGtlBNo2NTkhhQcOawJu2qdqGFdJlKW6VHgI=; b=0ccVDHbkyn0E9DRv9efSMYG7eH
	4KRxKKlSu2iWuLBEo+0Sp2ssCSg5QwadvDDkViL55BLAs6yVA1lYucy0IxYVpVT6LSZfS9KiA+hu/
	57VzH3koLENDZQzBD5stI+MikUXpW3v6EDIHevUrFMeGnDiNQA1IfFXE93v/5mnsES6Frh1tAIYqH
	mBO8N9FQE6GQ/W4vRJRRFFlO/p8YFBTOQvLNC909lNKKHsLxskoKVts7y5viFXkS1Kvd1KZndf6co
	JjMeLD0qf/c4cCbb7ZhPNS4htT0mb+96KHMq5T0XNw3fm8sO+fluz/s7DmVZj+RxBwxjBzgn4euBU
	FdjxldSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHqLf-00000003TWp-0vPy;
	Sat, 08 Nov 2025 21:19:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHqLc-00000003TV5-12Xb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 21:19:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 90DC1446BB;
	Sat,  8 Nov 2025 21:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A6F3C19424;
	Sat,  8 Nov 2025 21:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762636787;
	bh=jCZQZvHhcMirptJpnvRkq9bH40aTwahZMO8Q0GKOqg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RPDhFwLC2W0sd4IUXzNGgASWzHtinEBoRcHRQckl6o3vJUFnssylAvYpTdwEZ2Bna
	 KAuQkk5riDP4ZM5rKsWJvM3W94856vFSyfkOHtY3zQWmMVviQJ9PnukfqIXU9PnKIe
	 hRYzNWu6/o67vtrD2w47u8QHTwKHsLMGvoWIBcek+HNN24lLuC7WngDPcKuXooLw9f
	 EM8QDcUGpqwzmfilyxsQNT62xiMZsqNO1PeJ2idXR5gKASG32N9zTNlQkou9rIAQ4z
	 AwnRk1Qjq7jnRhaw+UGMamJ5KPyhRHiZirz9N+MHTilNtjh4rayeR7D9PZWKV+UyII
	 UmnZg/XmxHZXg==
Date: Sat, 8 Nov 2025 22:15:50 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	J =?iso-8859-1?Q?=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	Tom Rini <trini@konsulko.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/7] scripts/make_fit: Move dtb processing into a
 function
Message-ID: <aQ-zBvQ9obaWRMYG@levanger>
References: <20251006230205.521341-1-sjg@chromium.org>
 <20251006230205.521341-4-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006230205.521341-4-sjg@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_131948_304575_DE3ACE8E 
X-CRM114-Status: UNSURE (   8.52  )
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

On Mon, Oct 06, 2025 at 05:01:54PM -0600, Simon Glass wrote:
> Since build_fit() is getting quite long, move the dtb processing into a
> separate function.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

