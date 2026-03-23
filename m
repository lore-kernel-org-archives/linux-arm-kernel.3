Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DC9D58CC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 03:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6L7OuggG1xx/psBeZawamh6lKLmj+yBN2DAvG0qZTM4=; b=jiDSqDi5V8nzzx2MLGeAd3yf/V
	cOGJQzmvCtMGCRtaLNs+EL4i268MNosmH8VSMyVFb5QX1dQEHYpTVjuS7e5V38yk1sL9Tyu5w9oHT
	d0BFIGsEX2oA6BrUg/AjMqACgy/SDt/8oUrVSDP/lDM/8ANKcHe9z41t0CrDCSjVHV2LTc8YKf6mG
	kkBoSuTVX+gem7jP0rxmtM7qMqUCzOl1/e0ZbaLO6fZoXE14x1dF5bgF2Q91wlVQTnkHua1FdXXny
	gebi4u33GHr38TgP8uixsEcKzW4pHxc8Ih/xrXAd7iX7O7Olaa7868OLTKqBuWwKovzs/vfg0el3y
	ZIrVcpjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Vun-0000000Fx1A-2Lfr;
	Mon, 23 Mar 2026 03:25:17 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Vuk-0000000Fx0D-1vQm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 03:25:16 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-128eb45835cso135606c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 20:25:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774236313; cv=none;
        d=google.com; s=arc-20240605;
        b=iLqiLMsU/yf5Qtc7iLDOUg3CC+JjLV/7lu2n9mhfrhCRUZNXoIBZyl69rNy9xl6Fee
         KncYhEOp2m+FyJtL1X0GT33lZ187NJsb0gpvv+WVqcu8cOhAN3qmCqrCB3ccpKVUNSzo
         ZmbXenlnDSM31js9Q0DkIh38dsLYFp5O7gOGHEMNLTIL4mvUvHzHDTUK0fJuFlKTkHb0
         i6IfFO6Lhr1sxFbA5E0GsJJ+uLF7Q4NxR+gI3YGfI4rah7gNHsOEMc5m/uNsszWsQAZC
         JAKpi3ELKoizPh0uCcsKhxAGEYoHmj0nyag9NbhNoUwloDu8jJvJalYRt5dMFialBu2o
         MZOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6L7OuggG1xx/psBeZawamh6lKLmj+yBN2DAvG0qZTM4=;
        fh=FwD+RJdAdzQvpWNkIDzBV0NHZVd4tZgBQxKndKUtn4I=;
        b=j4bfy9ou0hpmyIohWoz0IfVYQ/6Wkvu13J2wEblqBK4MOLpKtp+bh7ux7TLOj+kBGU
         Qi13DyB3SWAr2xt4dwkG0bgy9uzMXiKnVxVmWU6muVpszRNi0tqh2PMdeC4dEBd7gdLE
         TnLWqRDVvmxABzmP4xBzRJybgQTOQ4DD+XKX9MSuaHL67wsgKSKp31bU8Jp6QrV6WlOb
         zFnpnQK3zbSeEiSLLqmr4SOCFHbj89Wy6FOTQmb/QIycLRd3OEbFds5WczcVwC0qA6cz
         P6v3T4BNVRWdfgRFFMRkxTULIY6hCFg0qEoN+whnOYoLBX5WXzhcS4voYzxBInRDx67L
         Gbww==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774236313; x=1774841113; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6L7OuggG1xx/psBeZawamh6lKLmj+yBN2DAvG0qZTM4=;
        b=i5UyboPVogYILmaHNZjtVSBYlVRamx8heVv6zdW6G/ratSEUAreeS/6NYa6gk2r4pJ
         WYKDDGWYbWvnwSzm0i838DA4EfYm3DTc6483Tp4yVIyt+0oY1Mzl6x0TpSvQesjO9wuS
         roGapH4Ioq19xGlC95LPJj8uo67T+YP91Ae0StCy+xCQInPTxt1uOSNd7/CgZwNXL/y0
         eYiYJ9yn3O8XHDqsqfK1c/NM9EiFjzO1DaOG1Tz0tk6Z1ABAOnBIQpL2L30pRbToxuzh
         Q9rS+YjB+0ODwwacs/cnn9h1QvACefS2DIhKX14QHErgdE65oiZBHl9B8yUh+2wCULbq
         f8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774236313; x=1774841113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6L7OuggG1xx/psBeZawamh6lKLmj+yBN2DAvG0qZTM4=;
        b=bfuYraRy63JGG/8eDa/L3N3aZ67NykoydvHx5C7OvVQGTj7Lkomv1XVRxw9Gmo3dK9
         qWaJMbRh2QF7D77jS5IvQzMlhOGM2cSljWhomahOZPFcg+mdJq/f4OgKAWxgfzFHJsqA
         yb11iXCNLV0PfQZGdTlsaSFUGM8BJavMZ02gRbaF0s3pxljM/x4M0dJ98s07lZKqCp4a
         VoHxF2/OeIXdKA0m/N8DcG4RRqWUFxCcP78em6x9mgtbXowD4HZVjqLCTT5OxCc7zXeW
         5L683rOUp87nOOymWxGGSj2bCQX9qThBxItLrQCk/1tapcIkVbffk/8mCljELtmRoefx
         I7/w==
X-Forwarded-Encrypted: i=1; AJvYcCUH2gw6mv1wMfkVo0vzNAikoGJ9xLTquudGqbFnPJEYUCqEGpOymR5CcFPQDXLtxBLMc11pFYVWXxzUGpeSeqPG@lists.infradead.org
X-Gm-Message-State: AOJu0YwphgdbdL0NXnxuIKJh06+qLXSQfUzmoyXI6tArP23CTUKn1BXo
	AUZ4/2ilf/6+3XthX0jpUnfN8UteCO1J4qBMM0gxxJPyrRVJe8HHt+/3tazA87oY4qh0dk/wMVI
	FdmxDTjskgyhmMBHOkhK6MsnaM7kTYkM=
X-Gm-Gg: ATEYQzyfN4YOPBPgqjbAY/t41ZceFazTsCMbmf+tfmqkIhENSwUlD7eN4whB2Tv/1hj
	QsnuaYlwYvaCilyR7G5IpGXD0j1ZLdwCdFHLOg+9DXpqthp7iD/sVqO658QPQrgGdnWnmUVcDCd
	UfhqhI2DrFmukUO+uecX/+vbCjSzmwv5wA3ex3/led0M9exEtlmiF11jkdDaOoAMMhKMZPnRMOX
	AvB0wwNcww+jz/nYN2W/bx9jtQTq1atkenxYcu8mSn2Ab44kD5OnkvaYX22ZQYrotWQi+dBbRu4
	FpkagjAEQl6EcvXrzCQsiW/njW8TmEeQwPhhQeV3LMEodUUmO7ycjgomPFpTEz0Z6IjF+iq+eHZ
	jfh0ohK8G3/c8ozOjicF5iNw=
X-Received: by 2002:a05:7301:100d:b0:2be:1946:858b with SMTP id
 5a478bee46e88-2c10970d302mr2034525eec.3.1774236312928; Sun, 22 Mar 2026
 20:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <96287f3a-d245-47cf-b7cb-f821451493d3@lunn.ch>
In-Reply-To: <96287f3a-d245-47cf-b7cb-f821451493d3@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 04:24:59 +0100
X-Gm-Features: AQROBzAuhFHkGwwSKh-Ea07cCRjtb6eZEQluwHGIFmDfJPfdFW0BK0DaJf2FJhk
Message-ID: <CANiq72nwSWVDRqm0Vap5j5X5k+Q-wq8okQ9d3KUgZt6M4CpW9g@mail.gmail.com>
Subject: Re: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Andrew Lunn <andrew@lunn.ch>
Cc: Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, acourbot@nvidia.com, 
	akpm@linux-foundation.org, aliceryhl@google.com, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux@armlinux.org.uk, llvm@lists.linux.dev, 
	lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, 
	nsc@kernel.org, peterz@infradead.org, richard@nod.at, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, urezki@gmail.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_202514_505456_4C4D7F6D 
X-CRM114-Status: GOOD (  11.55  )
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

On Mon, Mar 23, 2026 at 4:04=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> Rust is already fragmented, because it does not support all
> architectures. Do we really want to make it even more fragmented by
> having some bindings only work on a subset of the subset of
> architectures?

That is not the case. The `depends on` is not about putting them on
abstractions, but on this experimental build feature, which is gated
on `EXPERT` to begin with, because it uses a fairly exotic approach
involving LLVM bitcode, which carries potential pitfalls, like the
mismatches on the target string like one of the commit messages
mentions, and possibly others.

Cheers,
Miguel

