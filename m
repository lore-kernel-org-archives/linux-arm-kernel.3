Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DA3E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 05:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1cOVO0SaylYhhURTaPnk/qOmR5sKtjr4wVU6mmJAdqo=; b=Pycso59nP+8yI1z4B9GXQ07/rs
	/l3I+MUJwrznkawIugQ54vyhQ4rvSaCaBOAsriR8CtgnX0hrD97ZWewXHS2OpHrkbsXpV6FyH57Tx
	JYy021nci0zvE66SvN98e5fMyXlVmvih5z3xcJ3la9mG98rjvQBwr0o0JWkXxElvEudIN/gxB+Fga
	6Dar5xs6cDb3mTJ7FPhLVpB5A87kzGiFb/nZBA90RgWOUk18RSCXB1Zpln/RUuDNHrKQTIYgJxpE7
	ks13KpK1xoVXiGQYBmQgDh0qO3HeVBSq3XGrtYIjK8hJK4VVlZXibRVcnYjJNeU6KocNsFGksxtUp
	ZjlRJiqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO8uC-00000000qSP-0Cl4;
	Thu, 19 Dec 2024 05:17:00 +0000
Received: from mx.ssi.bg ([193.238.174.39])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO8sg-00000000qKn-0ue6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 05:15:27 +0000
Received: from mx.ssi.bg (localhost [127.0.0.1])
	by mx.ssi.bg (Potsfix) with ESMTP id 2535423563;
	Thu, 19 Dec 2024 07:06:29 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ssi.bg; h=cc:cc
	:content-type:content-type:date:from:from:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=ssi;
	 bh=1cOVO0SaylYhhURTaPnk/qOmR5sKtjr4wVU6mmJAdqo=; b=6QNb3x+EUBmT
	TABz1BtAb78ANqrDJ01HMZP1kjtrkQmt0aO02df8e6EcVWtWa+w4QeP+qWRzYSG2
	HVOOV59uV2SsZ24WwCrP1ZFr9pP/v4B5TYwJM/iHeUQU+1D2XJSI8aZt0DhtMjQp
	TWJKDDkhrjC+sWHlKT5y1S5qQDFevfwlvxrAnWWtFC6wG0PzzLL6IHdBn4cJkRnQ
	HkzWXYaeZcDKJAJ4t05mNYrVaZCJ29dipGbUnR/glev2aO//HpekCu1PMVFFa28V
	q250M5yXbWcmNqdn5gJJGGafX8D9a5Ix1jsggjhXCIe5WLx3ELkVWmDzDyaSP01S
	ieK8fhby7i68zWKxV0SUh+2wm8PgLKg9o5yMj1kDdmy/F7nODzUzTirThcgA6Q+L
	lgAqcM8VYq6VZefsz7rhleFIuYe3PU1kT6WU/gSaohh+/lKgLkjuylwQaYJwt+sD
	IzB/fmt2y9wEGyqmnL8iQ5TKRErzNDNWgZGifEw6gqGRCORePB15WEOG1eZxIlW0
	wsmYjkJf0MF8gVk5UZm5Q7+N2GwOD3WmT4HxAkNThyTkg+1l7ba4g+dK8c//UBCX
	xS40AxJRSDU7kcGK1jqu+S5bbpPgJuBLghr93C4UUsxPc+mqODOmcyCztsn8FLUZ
	/h+HBBM4Q7BIMT1E4xGNf/4XZzIrAuY=
Received: from ink.ssi.bg (ink.ssi.bg [193.238.174.40])
	by mx.ssi.bg (Potsfix) with ESMTPS;
	Thu, 19 Dec 2024 07:06:28 +0200 (EET)
Received: from ja.ssi.bg (unknown [213.16.62.126])
	by ink.ssi.bg (Postfix) with ESMTPSA id 7E04615EB0;
	Thu, 19 Dec 2024 07:06:26 +0200 (EET)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by ja.ssi.bg (8.18.1/8.17.1) with ESMTP id 4BJ56GQl005317;
	Thu, 19 Dec 2024 07:06:17 +0200
Date: Thu, 19 Dec 2024 07:06:16 +0200 (EET)
From: Julian Anastasov <ja@ssi.bg>
To: David Laight <David.Laight@ACULAB.COM>
cc: "'netdev@vger.kernel.org'" <netdev@vger.kernel.org>,
        "'Naresh Kamboju'" <naresh.kamboju@linaro.org>,
        "'Dan Carpenter'" <dan.carpenter@linaro.org>,
        "'pablo@netfilter.org'" <pablo@netfilter.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "'open list'" <linux-kernel@vger.kernel.org>,
        "'lkft-triage@lists.linaro.org'" <lkft-triage@lists.linaro.org>,
        "'Linux Regressions'" <regressions@lists.linux.dev>,
        "'Linux ARM'" <linux-arm-kernel@lists.infradead.org>,
        "'netfilter-devel@vger.kernel.org'" <netfilter-devel@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>, lvs-devel@vger.kernel.org
Subject: Re: [PATCH net-next] Fix clamp() of ip_vs_conn_tab on small memory
 systems.
In-Reply-To: <5e288aa5-5374-5542-b730-f3b923ba5a36@ssi.bg>
Message-ID: <a0ebe11c-4ca2-d2f3-8e53-0d9f44bfdda0@ssi.bg>
References: <24a6bfd0811b4931b6ef40098b33c9ee@AcuMS.aculab.com> <5e288aa5-5374-5542-b730-f3b923ba5a36@ssi.bg>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_211526_412775_29E6F5BE 
X-CRM114-Status: GOOD (  11.18  )
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


	Hello,

On Tue, 17 Dec 2024, Julian Anastasov wrote:

> On Sat, 14 Dec 2024, David Laight wrote:
> 
> > The 'max_avail' value is calculated from the system memory
> > size using order_base_2().
> > order_base_2(x) is defined as '(x) ? fn(x) : 0'.
> > The compiler generates two copies of the code that follows
> > and then expands clamp(max, min, PAGE_SHIFT - 12) (11 on 32bit).
> > This triggers a compile-time assert since min is 5.
> 
> 	8 ?
> 
> > 
> > In reality a system would have to have less than 512MB memory

	Also, note that this is 512KB (practically impossible),
not 512MB. So, it can fail only on build.

Regards

--
Julian Anastasov <ja@ssi.bg>


