Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13962C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 12:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhQ8USlPxenG52f+etBxdWz9DV+4IdlE1eKF2Q41L/8=; b=tNz8mF26gInLI+r7zJOL5uue0R
	TNK7Q0vWljXxM/FvrlefvEYiKmM4I7DgWyFjPrUQKv7cYReIsMfGe+3GjkgZR7EIOShBbAj3CCEtS
	zkXBM2QJHoGAZFoJn9iWregn39tLj6Ar7MuEXiwA8yiG7THVTkVX3DBXi6fJa2+7ajaBCuQ+WPWOh
	xfeppVI2PpoohRTjhJZM4/7ASGFQOfXAgXjqdxSvx0maA23iaMt0r3A6PHKL2aIBApz6lZI1E969s
	m54pQ/xungLK9zxUsksF7UX+Y4NYeBoM3kSZogrhxBDP28NOBKBnknhTRao0vf3nI76cT1J7gn6XG
	MTSoqvnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYFw-0000000Azg5-0VPU;
	Thu, 13 Feb 2025 12:23:48 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYEV-0000000AzSd-3ISt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 12:22:20 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2fa18088594so173872a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 04:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739449339; x=1740054139; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhQ8USlPxenG52f+etBxdWz9DV+4IdlE1eKF2Q41L/8=;
        b=ghHB5rsSXyzoLjuyKQYm7/C3ZnmcZqj8Bo8f267MiYbURb0Yo0ZVpuNbfQjLsP864j
         /9AN41q0j8Lx/N6+3HfG0cihagahnN6JsaZEsIKejeYzmvSO4lGvZpuv2nhmlb/v1CvF
         5TsJVkPHlwQEocB47ilafD6GvrPpz5+vzA8j8ejBjF1FGK0CgQLQ1wDxbO8k7pv0m4pv
         AQrYvxvD7aWkw0uDwjf3SiRpxpF59oeyRSU1VRV6TwFCSpjEqPgeyskuR0/zjPVQJSi2
         IpyuQQphK50hoNyvLUeNz+oJIlUvKn0nevfS9D8q6NkbH9RgKe5uqqJVBIrOXgLv3+GP
         cb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739449339; x=1740054139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhQ8USlPxenG52f+etBxdWz9DV+4IdlE1eKF2Q41L/8=;
        b=qmp+1BpPBRl8zQR5KiVeTiiOwRflbSTKyGMb/CFAzP8gLx8xYurvoZL1NHH+SGkcVz
         uldkwHo60vy+n7rcnbvw341LSm3TDd3eQycFR7LhM3PeFlmCKGue8jEdjZjfTLKRkslL
         1WjGzXak9ALFxki8469MYoXHTZZyWlnf8QLrzw4YeWUCc81CAm7K1CFjLLM6M89WWfaM
         rZFnFyOL8w0NKhBvH35ncUy+bFki4Ec5KwB/U/+fUlj/EeNBwLdNcYEsPGy+edNM4qTR
         20uq1C8aVWHWQB7u93EkhFnGpLAoxvrwFF393ZBdTzTrx/wqAVKH1+BjmZFJ1lyhrrvQ
         4uqw==
X-Forwarded-Encrypted: i=1; AJvYcCXYxsBZIZ+tu4UOqD+e/KNW57ENS8GdcF2LkOyxa/zf1U741pKRuzEWkxU0Zfx8B+eLsbakbTDV+3bmNM1r9ynj@lists.infradead.org
X-Gm-Message-State: AOJu0YxfVjWodxEBNq3dJjRmm3Z94JIbrby/hPnJzMRPplaLns/Dr8kn
	VapbEcy6+lJINPDeNPzuKxCxbW9oTGstyYmDRr4ebg6ZoR/hxuQxTivwuPQgveXBjnsYBuTcF+I
	e1/eo/fwTricoXq63Vb7+GGOP4Xc=
X-Gm-Gg: ASbGncssv+0NeRt7v2ReEG13G6jvnjxi0EDgOCoJAzqjALzpuGaQbRza6ywLoiYxj5y
	TMC4Ry5XfELLqY++8NCdt/f1xy/tOOksuqe/ep6uTrF9y0JQ45oX7whHvkf9wJ4r2YJSaHmGr
X-Google-Smtp-Source: AGHT+IHmYvEzL9KGp/GiZCJityFb8+Au3r1Y0YDY9cYrjSKGnUmZw+tnh/sBiqD37rnyvyHdxym1Eq0TTuz5tYj63uE=
X-Received: by 2002:a17:90b:33cb:b0:2ea:853a:99e0 with SMTP id
 98e67ed59e1d1-2fbf5c75392mr4064811a91.5.1739449339042; Thu, 13 Feb 2025
 04:22:19 -0800 (PST)
MIME-Version: 1.0
References: <20250210163732.281786-1-ojeda@kernel.org> <20250211103333.GB8653@willie-the-truck>
In-Reply-To: <20250211103333.GB8653@willie-the-truck>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Feb 2025 13:22:06 +0100
X-Gm-Features: AWEUYZnMSt2s3upFBai0wYaA0s4vfSFiHEc-syAvZrBIXeINByCQBVsZZ4yEXKc
Message-ID: <CANiq72=n++Hb1KX5fHCN=XayfPOxgayb=sDG4AvyEnDOZqAsNA@mail.gmail.com>
Subject: Re: [PATCH] arm64: rust: clean Rust 1.85.0 warning using softfloat target
To: Will Deacon <will@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>, Ralf Jung <post@ralfj.de>, 
	Jubilee Young <workingjubilee@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_042219_822840_318D80EF 
X-CRM114-Status: UNSURE (   9.61  )
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

On Tue, Feb 11, 2025 at 11:33=E2=80=AFAM Will Deacon <will@kernel.org> wrot=
e:
>
> Patch looks fine to me, but I'll wait for Matthew to confirm that it
> works for them. I'm also fine with adding the rustc-min-version helper
> at the same time, tbh -- it's not exactly rocket science, but it would
> need an Ack from Masahiro.

Thanks Will -- happy to take it through the Rust tree for if needed
with your Ack, I have to send a couple other bits anyway for -rc3.

And, yeah, I went back and forth on whether to do the helper directly... :)

Cheers,
Miguel

