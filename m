Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E268CEF99CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 19:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIcgBf4il0LuIs6XpFks2/eruz3alvNX/BPhA2+Hhxg=; b=aXvjGiXtjx0jfHyRfIM03AsgX+
	48F6b0oDGm6rusZYDgH2zu51Qf3HoQ6z78MxnXXUnG2z0/SyiDsDAuX1oW9gPSBB2hXhE2v88QL5T
	B+G3uLtXr9bMD9iuh3CsBoBoFNY926osZuKY3Ca1lk+ajJeTrghDOdJj+UyUMPl/W/h9bqozhl3bC
	6U+zSF+H3eb2vQ/LY3noyGk7wRN29nDGGUZZXYVYG8Q87ZVV+3TAFU8dbNYbr5KfOMuxcHZFtKoKH
	RTDxjpADjxnEFQUqEzoJ0idvL3PWqrn8CIyCRTsXGx84PK4gLC0xglQCbgM5ofchsDiz9iOZxOPkH
	UoPyHUTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqyf4-00000003q5J-0wPD;
	Fri, 13 Feb 2026 19:17:06 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqyf2-00000003q4r-06px
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 19:17:05 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-65a1974d3dfso2069838a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 11:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1771010221; x=1771615021; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIcgBf4il0LuIs6XpFks2/eruz3alvNX/BPhA2+Hhxg=;
        b=TfHo3RwwEAWgxaPJ05/49WIJit2MzJAbYKgtY1tBr6llxq3vldHN5hXc6A0wNV7Y6J
         VERsTh6yVSudKXEsuEK8j0WXUqWsGJ3foxlnDVBvAbDjGLojxioJuKtHOiKucIy41Lcp
         KiK7g6/uzX4b7WouJeA7e9+sCLCsXzdBu/a9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771010221; x=1771615021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uIcgBf4il0LuIs6XpFks2/eruz3alvNX/BPhA2+Hhxg=;
        b=w7guucfuBafJy2Lc4qVNysLh3bRs/3UlABjbTSnXyvuyEUeXaUWf4lGM+D/sg69Wks
         FCJyz9bsNKVFdQApJnxTyg6ymUQhK3fh8g0jQ5gv7ArNNH1zsCSj+CwhS5/JtSVBInO9
         cuhhT26cDQaY3BYAckz8EwcrzM+H7sNaEiEmD2ansQ1y+6BIuoNT5sXeJMGYQpMg/JPi
         m6SztM35E2KtIUtFUW1vQT5J/HihegO3CztZEWoSyZtO5k1Rvz+Xo3N/nLPdHDpap3de
         9Oe/1D8AaXONht/D8pykRnj3wfNLX50YMv2gDsr1JdbPv74tlSD4cxtjWUF1sV00rbap
         a4pA==
X-Forwarded-Encrypted: i=1; AJvYcCVblblDN1ZQKvLgceueyOyKoZwIAjI/N493wnL6/1cRHWPSRn4WebPzTeFOYDcA23X0yEgj9iChOnw9/qRiHBao@lists.infradead.org
X-Gm-Message-State: AOJu0YyFas+Rmp0DPcIVOztRv4hta5ge301ZZPgkXRRW5CJ+0VHRK7au
	MXNwpWoev6dnsDbxRVduSTy9ABwJWFOGu1PA1doZKlR5R+gQbUrxSrueBIcvvPeHzXSv1Qt6Q/z
	0Utg8Sfg=
X-Gm-Gg: AZuq6aIp0WIHNXW/MV2Cse75dIw4l/gbUL8jmH0trdh7wdWDU4t+Ri/wom6UKnLINSj
	ml2tOy5KllanOMXYbSvB6DZcVsk98+cTpbPEs3lHyRSEoyX44U5Hr1bQ4HGCazS9eioqGNjf39R
	VGxlb9OHz78dljzEfQUTetGsgGschu4e5ZdH3H0nsUEnFusG2WAliLhOyjQdkDUKxvnuJQ4D4BD
	bUSW3Rzk6MiV3M/CYBtZ+icnp1P2+lrOry9mv8HxwzlAvh7kfNXVnO5uXPp40jjTOukgQri/vUm
	5WwPXYYuYOX/MFPIHobfyizwlGqhW7qZ/Qlkk+nK1cdzejmXjs6Edd2NwOAa7O94sho5KQ3W42A
	JIkwIUT0rwFpo5ipHKcTiosrBdpUT5mAr3Bc1a2at3iRSfkdvNXSolyv77/yNUCsOE85SCyNP2R
	Av4si+7eySPzxLRoE5YQJspt8uxt6y8we25MlXCi3xQY7MoVWiZua569FtUiMWgEBt8chMtoLZ
X-Received: by 2002:a05:6402:51d4:b0:65b:a76d:6fe5 with SMTP id 4fb4d7f45d1cf-65bad13e623mr2008023a12.30.1771010221293;
        Fri, 13 Feb 2026 11:17:01 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3e39bfsm957567a12.22.2026.02.13.11.17.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 11:17:00 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-65a25c3a86eso2077099a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 11:17:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWhO29d4kAbW2agQjWYqg/ZKQsmMbKxCqySCBpWKDGAjpwpq25AjDA4DDL55m4PxkR3vnaTsL97SaBIt1H2Dh8m@lists.infradead.org
X-Received: by 2002:a17:907:968c:b0:b88:38e9:8f89 with SMTP id
 a640c23a62f3a-b8fac8bc5eamr207154266b.0.1771010220381; Fri, 13 Feb 2026
 11:17:00 -0800 (PST)
MIME-Version: 1.0
References: <20260213-arm-memset64-cleanup-v1-1-644a9735eeec@linutronix.de>
In-Reply-To: <20260213-arm-memset64-cleanup-v1-1-644a9735eeec@linutronix.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 13 Feb 2026 11:16:44 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh+w2jR1Et5EvAt3Jn8dn5cwr2BHcb=n0qNK2Bv5Xh-Eg@mail.gmail.com>
X-Gm-Features: AZwV_QjYnNtK9BhO3HcpHg9LrAlf4ausThmn8559IcIuqlBXApNWVOsq-6f9FG8
Message-ID: <CAHk-=wh+w2jR1Et5EvAt3Jn8dn5cwr2BHcb=n0qNK2Bv5Xh-Eg@mail.gmail.com>
Subject: Re: [PATCH] ARM: clean up the memset64() C wrapper
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_111704_081202_9FC41812 
X-CRM114-Status: GOOD (  12.65  )
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

On Thu, 12 Feb 2026 at 23:39, Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> The current logic to split the 64-bit argument into its 32-bit halves is
> byte-order specific and a bit clunky. Use a union instead which is
> easier to read and works in all cases.
>
> GCC still generates the same machine code.
>
> While at it, rename the arguments of the __memset64() prototype to
> actually reflect their semantics.

I'll just apply this directly since I suggested this change, and I'm
doing some architecture patches - like your alpha fix for a missing
argument - and pulls right now anyway.

               Linus

