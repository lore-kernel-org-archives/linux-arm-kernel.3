Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3B8FB3CE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 09:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evkirLKGhh0WuOBuZT2IPb0j74uGRBwEy0ZVb1MgXNE=; b=LFKzqcgHKuHctP9Xg9Tt3A14YG
	zMCZYqkwLWW2c2OlsB3OG7jKUDEBmuB7vpq+n7wBxVNXIHtSrfGMxAMEflpCqu8RP3kFxScrz5kmA
	2i1Gr5ZB8Xo14frCmy6JLbqnyMoBnB5NbbECvi8osCn9aVX8+QyC5A05xl4VqP116Snx5G2H/ohED
	zZAjw2nZz+vTO7SOl54hCW9ZpoBYqSfCQrggUCBhLGzkm/L4cgl9h6dWrSZGQWmj8kxhvWxVHH0w0
	AfRZlALNssM+XF8qLErAx3w2CSg1o+n50Q1ffZUCs0jRMK9b6M6/TeYysGxgFBYdGQ+CM30OenDeB
	Plv3EuCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78yK-0000000Ay88-4Asa;
	Mon, 30 Mar 2026 09:31:48 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78yI-0000000Ay7j-1uSJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 09:31:48 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-486fe2024a9so30101565e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 02:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774863105; x=1775467905; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evkirLKGhh0WuOBuZT2IPb0j74uGRBwEy0ZVb1MgXNE=;
        b=id74mqM8RdKCdJagM0dQ6MhgQtG9axOs1cHNd3VgZEIsvBi3fxmn4tHO7p9VzX59rv
         uOSTLjJocrzr41/hnMskyN3/3AlReDgVVvcwM4LbJGnkivOFqVwNGEgCguELKTFhx2DB
         2CVls23H1xbauKe7qsmIjIQCSZmzU2q9H8R2XfOHSsu3dIbJCv1AgS2mfo56DgKZTbkS
         h/ar9sVKIEz28kqdHK6P8K+Nobm/4V77l/NmG78BGEugh7fFhZPtP5bB2lF6pR/mAlIU
         09Jo4sWLT4gndh81I43Gv5xX9UO2Xlkj3NG9pTX55/t1sqn1GVKIaLJH7HnSv/lo98eN
         RvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863105; x=1775467905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=evkirLKGhh0WuOBuZT2IPb0j74uGRBwEy0ZVb1MgXNE=;
        b=kSyXuHfo1/okCa2LbkWdnSngXjVrNPosT0Zwbz8EmAqNUyY0whg4MO5j5dK2Key5zZ
         OSuadnmuW0O8zvS4v1rIMzjw4/Ff4s/dd3yZaRbB/I6thYaKOgiTe0/vNxSBv+g8SodT
         v1zhVvUhXVepsY4npCbRtP2hJO4oV/4aPx5NqLnBupiXpFUNL71/xqvRkR16crvqQujC
         jyZsxaWpe77qi1BEmmQbIVIAhKolCudBQ/cIgYt52gOSpLwHeFCaqjLy3uoAAFA/Uzwr
         Q9GN6bb8XQNuRH6ZSXgET3GZKcVUsLReQICwes7GlgWyxF/CSlvL3dT/rd8OhWPaarFj
         5uJA==
X-Forwarded-Encrypted: i=1; AJvYcCXgExBIMWfX7BKlHPudsFGirssDzI5UhiImMcmyzCY4OcSUa2QUy9DXEt8jbgvPcuOmJDjclteZAdPTf7C5HxQa@lists.infradead.org
X-Gm-Message-State: AOJu0YysYkcyoHVzIwimLBQvFT8cUGdL9HAC3Bj23PZlDzn/YNURxiNg
	9KwhVVb5gRGY3ezPcAPoFmU3a3vnPCNTaGl1d7Mc8JhKKUxFUek1hhBv
X-Gm-Gg: ATEYQzwxAnX0Y7iZdW3cEvydQFi9qvZqRRViTgic13PpdVw2Kaq6TZEH6bw3oazmrCP
	n0xaxUHIDQAj+1Mm+rOxrhV3cwk0DszRruNedcq2rJU5zI0o+wphZrxmgbaZXWjez2HvIpkBC6r
	rkP3GO+M6zt4l48DpQP1d1Dw9V8wfFmoSWPNzAlsGjxfTFGnxWXOpMcKwsEUm5822+EkX10jSL7
	Jvm2YZowpvFzJwPsv3C6e31Y5BdJor8O4+aP6VYdFa7oSPw8BVLlzT3osirM2AZwbX1Jg0qKz08
	DA5Izryt8jk8yuj0YpZVcQA83TEdMkUfVCYD12HRtrzQ2dIp0zfKn4N/PFSfqWYJTWURgA8JLgx
	moXFZihvDmqdvwWF3ipgtmqXoL2eZlKxb/KuVS494PxtoOP5s7UJJLJ/5Yrhazc759A+eWROrO3
	Nf7NrMYjQ1fojaQJ3+GypM14+P7pEfZVHs5RD8MWTm2ES3V6IF2yatRJZRZncsyEkx1r8Nfas=
X-Received: by 2002:a05:6000:2282:b0:439:b811:11de with SMTP id ffacd0b85a97d-43b9e9d5e30mr20922607f8f.7.1774863104329;
        Mon, 30 Mar 2026 02:31:44 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e9e18sm16796564f8f.9.2026.03.30.02.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:31:44 -0700 (PDT)
Date: Mon, 30 Mar 2026 10:31:42 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Demian Shulhan <demyansh@gmail.com>, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ardb@kernel.org
Subject: Re: [PATCH v3] lib/crc: arm64: add NEON accelerated CRC64-NVMe
 implementation
Message-ID: <20260330103142.193e2a98@pumpkin>
In-Reply-To: <20260329221821.GC2106@quark>
References: <20260317065425.2684093-1-demyansh@gmail.com>
	<20260329074338.1053550-1-demyansh@gmail.com>
	<20260329203829.GA2746@quark>
	<20260329225704.0eb82966@pumpkin>
	<20260329221821.GC2106@quark>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_023147_094548_94DA3AFD 
X-CRM114-Status: GOOD (  31.77  )
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

On Sun, 29 Mar 2026 15:18:21 -0700
Eric Biggers <ebiggers@kernel.org> wrote:

> On Sun, Mar 29, 2026 at 10:57:04PM +0100, David Laight wrote:
> > Final thought:
> > Is that allowing for the cost of kernel_fpu_begin()? - which I think only
> > affects the first call.
> > And the cost of the data-cache misses for the lookup table reads? - again
> > worse for the first call.  
> 
> I assume you mean kernel_neon_begin().  This is an arm64 patch.

Well, much the same.

> (I encourage you to actually read the code.  You seem to send a lot of
> speculation-heavy comments without actually reading the code.)

I have looked at the code, since I (mostly) understand the maths I can
almost work out what it is doing - but all the conversions between three
different ways of holding two 64bit values in one 128bit register really
don't help.

> Currently, the benchmark in crc_kunit just measures the throughput in a
> loop (as has been discussed before).  So no, it doesn't currently
> capture the overhead of pulling code and data into cache.  For NEON
> register use it captures only the amortized overhead.
> 
> Note that using PMULL saves having to pull the table into memory, while
> using the table is a bit less code and saves having to use kernel-mode
> NEON.  So both have their advantages and disadvantages.

Indeed - so the 128 is really a 'finger in the air' value :-)

> This patch does fall back to the table for the last 'len & ~15' bytes,
> which means the table may be needed anyway.

Nibble lookups on two separate tables (256 bytes instead of 2k) might
be almost as fast even with the tables in the cache.
The critical part of the table lookup loop should be the:
	crc = crc ^ table[crc & 0xff]
part (the rotate should get hidden in the memory read latency).
With nibble tables is becomes:
	crc = crc ^ table_lo[crc & 0xf] ^ table_hi[(crc & 0xf0) >> 4]
on any modern cpu the table lookups will happen in parallel; so it
should just add one 'xor' to the loop.
(And yes, I probably could measure it, at least in userspace on x86-64.)

> That is not the optimal way
> to do it, and it's something to address later when this is replaced with
> something similar to x86's crc-pclmul-template.S.

That is one bit I do need to grok...

	David

> 
> - Eric


