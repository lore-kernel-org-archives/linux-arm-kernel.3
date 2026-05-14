Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9CBCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 15:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkPjqCzei1qs4lsLRpPYWOszzEiBZY+5+KZ0A6n4vY0=; b=alkRDq/8V69zQXYRmQvE3quaPO
	IzOj8c8fiUBAkdh56XsZp9/dUAouBjWCL0Xce1Wu/CN89Xi8z5QLgQD04MR58CVRR0ckvLLGrMJNT
	4NFFNTgE3XAM+qKl5UTot73POVpnMNj3rG/1uDWcB15ohMkwNc0Kokq2ZjwlMh4eU2o7N1CblsBxt
	9d+fLAbTxs8sE4n34R+bkm5fci7WWR5aB1L4487tBcdcgR1nfG86l/LkGAzcambMzrcigqjQxx4Ss
	DQlEvqRpB1ONsxKrFrWqewwrN5mXOz3FZ6O+qV/AKEJOMQequ2I6hOjfm3fkynpBxEhcyKQd/uOli
	y6xhkYKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXhs-00000005qe8-1pUq;
	Thu, 14 May 2026 15:10:36 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXhR-00000005qDe-18mE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 15:10:10 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-134a84f0aa7so98513c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 08:10:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778771408; cv=none;
        d=google.com; s=arc-20240605;
        b=N7RedqUBZ4aazmWc4erpMw7+O50ry82R5r2LZ5zXFtHrMOD1unW5KeH6CxDwrPTr3A
         wRXd5LtFTerAowEcCYqg7HoerXy2EXvI2GDiLmamw+d5WhesTGVRT6oP7hrBojRMWJJH
         nuzSjjHkLlZPAflElzzkZS+FgnehjBAaKiMmZSfFKNsuKiLzAmFDWVKEE6I5+JcsOlWJ
         lF/2w8tnPwxpzo+i9AzC+S8P450+LVG2ctf4soe8W8jdznuILToi2xl4x6kxqCf34HKW
         2ZupRZuykvEHTKTogSGgsuXa+v3OybiCtff085kNSby25RoGDHWMaSG6jEppY4DnCnpV
         uKDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RkPjqCzei1qs4lsLRpPYWOszzEiBZY+5+KZ0A6n4vY0=;
        fh=tTHzWeJkIt0G0RtGz7yZuTNPG81hHMUWpchIct5v7go=;
        b=YT4pUpCoPrr//05dpnQjaYB+mRpNZB1HufijRQgCZUFNjgxi6yvItDx7Q7hMKZ1gGI
         Lc3HVWnP66NGr8sWPP9yPLnDeapMx6hbJlYJxAWqHGWyAt1zyBpgI4Mu4HGwrSt1ED2g
         eLL3HfdVk9JCYmq69IW4TBkBJEYh02BnPyj93PkLrAzmLBoGjKReQQ++A1g1LbR8Z+gL
         wxz7cOA2TM+L+K1hwWE+RQnUaZZePgHQEJf9nluPw0B5FBrz1RBTPBJ4zR0Nxatov3jk
         9uUBxknfIEmInCG5Uir2OxGIY1ZG+lp/IcfYjE8OhiRQBT1x1cVj9cwWq6UFrUV6HhRd
         ZiqA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778771408; x=1779376208; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkPjqCzei1qs4lsLRpPYWOszzEiBZY+5+KZ0A6n4vY0=;
        b=SbEZ4wa7PuUNZdtMA1odmW/P3TGu6lgrLbhDa81ETVoewu302BR3+2F4IG+n7NXGxb
         t7kcCCfS8b0uoXpooa1GShTuOrVBtT54L3zkBdo7u+8u5NwwS2Qu3KSw6bttna6R/bK7
         W0IuP2SzzJwzNdMZsK104dC9uT3Oe4SQltH83t9CCiT70zr03Tug4rI0i88ap/Jq+ISU
         dibqTanjrQFMHtkCpZoWJ9mt6Il2Sz6uQNLeJG2I3LBca0dE/A5lPQCvYQUhUt/Tx0lE
         lgLmhYfz00Lqu76RI8Z5v/PKFWy8Kz3gfunYtAWeqpvPtb74/lV6Ol42Uo0iUfAMF2KN
         GWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778771408; x=1779376208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RkPjqCzei1qs4lsLRpPYWOszzEiBZY+5+KZ0A6n4vY0=;
        b=DsnpwdJBVUj12lpM8akx42JUhzXTDLvrJH16Jxnu2VTNULUrwOVyKE8or6l9SDIpGO
         8AjDOb3J4eixr7JKKlgmhvqab7Nt8mz+Mu1FQjlHQ6+S/7I+DgySEe5jPmlYLdjqYRcg
         un6giRUAUHEFCLKRY1E8s3iboCfV90sS+gteGF/lPrcEixT6G7CoXxizeaky8FwfbIEO
         KffS7c40I0go6vpqixcZV1QHMrqLzcmmLpfuRWzyYxCUXFlJQROUejJsPdVVQxx/QdkS
         5swtnSnYP36yZ2H64Id9aoupTXIY5BkmGG/UAD+MvIVuqq321nbbNG3KQAnBxuGiauFG
         qg3w==
X-Forwarded-Encrypted: i=1; AFNElJ/n39ToUs2Rcl5knXG2WUvh2L+M+SxIU+St8JT/j4CkkDduvkqzcGfgGZ4RCI2Kyq9jgz7z/80101edrqVP1yXi@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzy/HjLinCLoZQLiQx8kUP5xky2hcOc/3hLFltl8ymBpX8By9O
	t3SVBvh6EfhmpBT11KegBjd8tjhx0IAn5/mA8pCbYnSZBpcoc4Jquv0NkognEbJ4b8WQUeV9eLT
	L2nGd87esXU/zcTybtKvE7nurExoWq2Y=
X-Gm-Gg: Acq92OHKfKlqVxJKTpMEZocpQTMPWpzP4WbYoulVDPFnesAwJtNI3A27GsvbNcSeVAO
	+SKkpaN0x9U6OVK5yMJJxHY9EnYjbAUh8WZyF//9MFaUXgMB4htU0oH59/FOOCYJO36M+3sKD6M
	AOjm4PyRX8KiwticwkK0FcJ33gDC2uQFNsMMnAHwTZ2oYJt3HyU1H0POjTcPslVD2G6bGCKoRnO
	98hdGlfPUttrbW6dX7Tq+eF95KlYl3siI8cJb4U9hgdnV6SRqgOdh69kyHFz/EEeN+RMfPX0n5U
	xlTEZoDCff1+5aeIsO+tgB5NGT/LqmCegzRXKt5XzV9JjpDjKF9qTFxFBSMSL32A70V1SyWc6Sp
	+gyav8Zut1vGobExp1Nd5Y0E=
X-Received: by 2002:a05:7300:2150:b0:2d1:9b35:4f03 with SMTP id
 5a478bee46e88-30119a739camr2362416eec.5.1778771408152; Thu, 14 May 2026
 08:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260511-arm-avoid-rust-with-kasan-v1-1-24d55f4a900b@kernel.org>
 <agGRnHVTLiwobb9W@google.com> <20260511090943.GA1029560@ax162>
 <CANiq72nm_3KM4gMnb0x34oJk1+_8XrUz-43zwW58Mr1UHG8qtQ@mail.gmail.com> <20260514123539.GA1781775@ax162>
In-Reply-To: <20260514123539.GA1781775@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 14 May 2026 17:09:55 +0200
X-Gm-Features: AVHnY4K4FPfnCtiB6KX494dgF2K9qH9aUDHSKjAUM2cHs1-ctz9GH5wRqeeAVhY
Message-ID: <CANiq72nZ5hW545-k1jpjR=tbEuKigm3fBcVhuuafCmoYPZzq7Q@mail.gmail.com>
Subject: Re: [PATCH] ARM: Do not select HAVE_RUST when KASAN is enabled
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Russell King <linux@armlinux.org.uk>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Christian Schrrefl <chrisi.schrefl@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_081009_337388_40FC6C93 
X-CRM114-Status: GOOD (  12.45  )
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

On Thu, May 14, 2026 at 2:35=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> FWIW, I think Russell has been away dealing with personal stuff
> recently:
>
>   https://lore.kernel.org/aeDSTIS9-TDSihbX@shell.armlinux.org.uk/
>
> So I doubt he would fight you taking it, given that it is Rust related.
> I am rather selfishly motivated to have it picked up and merged because
> I have to remember to pass KCONFIG_ALLCONFIG=3D<(echo CONFIG_RUST=3Dn) ev=
ery
> time that I have to test arm allmodconfig. But don't feel rushed to pick
> it up if you want to wait for a formal agreement on the path forward.

Thanks for the context -- in that case, yeah, I will apply it to avoid
you (and others) further trouble.

If someone shouts I can take it out.

Cheers,
Miguel

