Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E7F107638D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 17:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=; b=ufH6FHfllAs5UunXCRSBnLRPOg
	+pnd2Q7OxZBjbibV70B1nCPmoIrRY6IlAHSBHbgRAXTnhg5sNCocGgLiqWY6jpMVoMYQWgfrG6a7w
	UOpCAkqOG4qi29GxQwYImDi1LqH1O95BqLYwEEJggawxLPEsQnfmVZSvrpnz3AIhsP/vlxgglzGxD
	LpS/myGeqxG/KccPX1t4Q+HCC0YnWaQrOuSq6C2fyj1m4gxlWpM02TnzphsGYwuXGryV/h9u21NrR
	wGsDk/UtDSexorW9OElQD81Eb6M1BgK4NcUiOXekUcfC6M7Mktwd4shIrgVtuyIzo0gEv/TivxCbO
	cnLjN2Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zdj-0000000FspJ-0m6R;
	Wed, 01 Apr 2026 17:46:03 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zdg-0000000FsoX-3QS0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 17:46:02 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-2bda3b4318dso5598eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 10:46:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775065560; cv=none;
        d=google.com; s=arc-20240605;
        b=dmOBrqsbzgAKhLwQFp+q4Z5J0VeNsXenZcp3hOnve5uO0mHFH5JEGxRVD3lXXnrZjv
         EOLOGWJy2YI//hv3keVatujfB/94fbTVAYrtsdO7eoLykk7BfaJ3sZGIV4wEJQ4ipkgR
         pYLVL3O2mKKUgwC/bhLO8H5L0iOBy4iRSOIf7mmLjlj5xDHbpAwxoSJUMCn2He8zuOdV
         dnGjIoB248jOlnfRQ4FGAbhhwpu55iGLsgEXORyYs99bpEumiVbqnx0q0eu07y8TWDq6
         2J0sKx5UX6l9/X8NeS38tNHR4FoqSQdH5IZhCVGW2D6lJEqJSCG+2pkxnK5SYpOlPaVd
         jyEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
        fh=Qkzr0EGokZQnl/tXzYm/CJxpcPv+K/freCH97xxD2XM=;
        b=MTbDoaIrDiP23kpztLQdGDZdcmLIs7/zSYa1Xag5+WEKEhaaOlQDjrEKzxegEQssTd
         H2/c7SrRkZ4m6npOL2GOhSDqOINWsa8ZPjzmL9QRdwLoevqkCEOFQ55id1Ma4zoKUiCk
         P3ZaDGZmZ8/Qvh1dpDL5hSCq4KAKHNRmZ8YqaT6dfBT8QHTd2HoDsdQDdHn7SVggyzmt
         lQPUguEbcUvuom4FoP6PbX4YuJPW3Y++/X0kv12jzOeyVf4xG11q667Hw+O99ihzEd5H
         wiCOrAAGZCw3ith8BayvaP76lt7nSFhPRs5XTI7YRngz0RuCeSJCDg3Nm4CW1LZTE3Uz
         uMRw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775065560; x=1775670360; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
        b=Er1sJ3DoQvvVHidqEv5JK29LEsVCrhyCQDeQHToCvlQJDXUcwk/zDt9UL/AgCy82vN
         SN57bRaCSl1EXyPcHqqp6SnEtrwAIbdYlFOByMlRmFvL+jwWZ6RUFIapavVGS+bPawzt
         goVVaNLimX2uHEhutyrTAzRBmBzg9R+CNfL1o7mIJ3k4q3hAIksp4Rtg9nW8jqOoqbru
         keibLA0kSSsb0sD7p5TfBfncxmDcjlU/fQpdMXQN9KP83avX3eFmPLS5gLyFpPzGBCEz
         gnuqGDJSg/cF/Tn0vW5229ZwuxPBCHz2rjYcKYBsH5hQPnc4fFYV3jR4tq5obn+4rll1
         XL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775065560; x=1775670360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
        b=AECrGLcVGflWvPgMG1ojgyRwM9NwiY4bM75Jcox16McT9Md6Nq3iKgze7RfY74dYr+
         u7e8Rj+bM7wRoa/cB3CwA/nH4vLQweOu8CIgFOU1Ci/24q4hgZKBQkh6JxqPwNihG+rf
         A11Cjx2R9T3yJ0G1UslqzKxZHlMQOYoqhnt5nMmj8C9/WMgJV1A4vBCrF53o9f77iITI
         rZTU2ZEczcXCGlj9PhFejSeLwgkSrDsOxNSPicxGrePba6EvUoVrRo8/wFlC3C8qRQ9E
         cdBzihUTC8ECjpiINzpU3Y5LpaJKCLMO0nQAaAwqQK9DVAwdOLX0v4m/gsdf/HdxX8cp
         cIrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSjrHjv2NFUUJ3g+Wv6fJ7m3+SVS9DYPkNNC1TfNUQ7FbDHVuqhQCjBBuYfW/i9LTsCv6qXUeUGfmFVhXEJPmI@lists.infradead.org
X-Gm-Message-State: AOJu0YwaKCMIcEaalMaPsykOZWVXMRBAOHwz8/yO7nh46NuXOIhLtEN5
	yRfCNtJPHd5gnQADOZS7JQSSgYYeL1jaal5M53W7LcriiJZCMG4t/YkiRgZlPkp1WcQLPKH1ryg
	JZmWlE4ULMOoHe6deFhQ4HGba/yOpo9E=
X-Gm-Gg: ATEYQzxe+/YgaLQ2JO9sBo24bqOi1+VvtprLs3chxhk0uBKO5d1yiOLCMhkYkS7DKgH
	cY8Pv3M6OaOFuAx6jMAItq3745dDJpx83IeXBqE7yNnD1PcjVtCqk4i13LsyxTznfZAc6uf5dF8
	FvmG1Ld63KM6QlY0JyGbvgvCnPQ04iqTHpXhPWym12h+zxbzsCY4Jt0A5N1+LyWG1QLbd7qJUko
	a4qwkATls2h9EsfIqnoxpEtiaE0A16HwGS5lwP+8JfDMV+c53FVAxDImdhYYjLvFIG7YTsKfx7l
	1JPTy/1eNC+TQNMpBS0aEKr+Vop/aB8cO0oSjIQjseLq/SfI3dzX6VvnadzkqwSM61FA6eGdnDH
	xnLcKR726fJuYtW7tPIbYqVftxeW+fuQBwg==
X-Received: by 2002:a05:7301:2c05:b0:2c6:7f49:a840 with SMTP id
 5a478bee46e88-2c930798a4dmr1033595eec.1.1775065559731; Wed, 01 Apr 2026
 10:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-13-ojeda@kernel.org>
 <DHHVSX66206Y.3E7I9QUNTCJ8I@garyguo.net>
In-Reply-To: <DHHVSX66206Y.3E7I9QUNTCJ8I@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 19:45:44 +0200
X-Gm-Features: AQROBzDasvNfwm3irNcxLclKgLrVzocIHNQudR_c4deB-93-CSbalwIa-aYY_TU
Message-ID: <CANiq72=8eVKk0gqyvgWM_-VSsRZY1s2e7gx9AbAg+q0dRRYO=Q@mail.gmail.com>
Subject: Re: [PATCH 12/33] rust: macros: update `extract_if` MSRV TODO comment
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_104600_877621_F471358E 
X-CRM114-Status: GOOD (  12.67  )
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

On Wed, Apr 1, 2026 at 4:18=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> When I write the comment the intention is to enable the unstable feature =
and
> switch.

Yeah, that is what I meant as the alternative in the commit message.

I am OK with either.

(By the way, I wondered why you mentioned 1.85 in the comment, I guess
it was supposed to be 1.86 instead originally, i.e. "above" as in >
1.86)

Cheers,
Miguel

