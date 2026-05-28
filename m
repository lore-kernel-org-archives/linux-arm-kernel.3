Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12078CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 05:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/tAvDfBZY4caNpdNLD3RtS2Pph9k/Hgin/a4k+F0Cw=; b=0yKvZqp/oTPfAksUddpNsMeU28
	9FehmVvFJpzCOD52pU6XHuVsuM8Q7W7t3Z1r/PLqoQLF5atlnP2Geg2xl7ALrkwVHQ9Ke3z4iBDxv
	43yVacP2e8IS+83kDwmlnAopql4LWXkiMUx4djgxvYVFcp+0GNrqYGWIrVkqBCwDjUpVrsMEU+yHK
	L+52YyrQWwr3eOsUvpoRjc7Zuz710H+XzRJ+jpOXucUXphhxYrHaXf9WXGEiHaUnQh5OHLhXj0u1q
	rUwyIKkN3FZtghumu3bK2E4ABaUiYsq8YpfwscQzGtkjDMPNSYUmf1v2sQyTMRyMuIn6n+ctpd6Ih
	YJEsNj0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSTjN-00000005AjK-377t;
	Thu, 28 May 2026 05:56:33 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSTjK-00000005Aim-2tUu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 05:56:32 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-304ddfcf72cso8422eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 22:56:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779947790; cv=none;
        d=google.com; s=arc-20240605;
        b=NWKDPAokqXTip5FtW3o/AD0bss3aYicCNBqIKiB55KmVfvUZdaYAQYLxWP/1HTfhhT
         LkGrRwQfbO+Npz7aavpFVU/t1+PzZmvJFEe8a58sDPDe7r/YIy0XojLTAGg3wqB+wojf
         dM8T6yOSvLgU2vNsu4SkpcRC/GP6aPb/Nuy2GuAKgJ3PsrMbFE6/c2DlegGmsJAub+M0
         fkX9h1tu/ULB3bgaPXJti4gvcaYcpBNQ5ntRvTUME5yUSxYxC95tM8wE5Fb0o92hjgyW
         A6u12maFyo1VOuwIOJh4z9quNkTOxd4IbIXFLviueUt2AWGmiszLvXO5IGUpP3apYO3y
         aB/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9/tAvDfBZY4caNpdNLD3RtS2Pph9k/Hgin/a4k+F0Cw=;
        fh=fTvYmew2SbdVLOyM2rwB3sJpIon4YnxmFW6uT9x59/k=;
        b=iZ9OYM3g6pmfJv7ixwPdP8vkbOvrWtUPzVzFAyOI4wxGcdt9WxwjsnhonptM98PV7H
         EXizSVsI3ruo2hJOj8wISGGdlLk0Wm7zhHteILst6vE//9fiMdgsrUwvSf8wjgL5Q9Q3
         upmEsfy0/noDbhw/1QpZUFSeRCwHWipdXzbClDmOj/MbpSmjnClkdfNqZlzHPETd3GsW
         8QWffOVVLiGNL19EPZ973HUrXqB1G4QboMhzSJSFW014b6nNpUaMzznOswpZDra4Nekl
         PIPWjAfurMTp92irabGcKT5DMgfNLO+L9xScOttlH4Q0DEbe1gwYR29gcHSgERbsLEfq
         yJGw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779947790; x=1780552590; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/tAvDfBZY4caNpdNLD3RtS2Pph9k/Hgin/a4k+F0Cw=;
        b=WTjHvfhgg9RrFEIBQWl2/DjyMId+QIvGU7GyAMnOdT4NmCyoUMDTz1/HIMDlmB1QFf
         fkts+16DkQ+7GTCiHavKUFWplx6C6fCEjDJT+oyZkTMqt2G5XjvuRTmq3OGrYxz8vPnW
         UjZCWpt/vDeSZq6IQq9GUvVwvhQ7kbVr1t2YCpthJCbOfqJTVJqfA7JUoWgvix0GiZh5
         R88JZ1KxQOLylS07bSF3wYWJqHPTNnrx8I3ZVmbMEEpRzTlrTecNEzmtGvlVjnfXyXAy
         lnBTiIhVkb1tfCoeCKIxet5gkLbGUkTA+u67Jk1ffi/r6Qf7uMgfWG7Iy5n8lXsTri04
         aHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779947790; x=1780552590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9/tAvDfBZY4caNpdNLD3RtS2Pph9k/Hgin/a4k+F0Cw=;
        b=l6N0ECWNvKUeFL3ddR91eFZvDn3HluDi5jB779KRMMv9otOSvcYF0g8kdOrp5epBGe
         IYVMBlE2mtodBzIXMwNupT38TDEu/NhlpzYhasLTlbWcArX6LtrWK/+AFJHOBGGxsPlA
         c0dcuHkKi5Zqib82xiuOT0FwvsGIqupS8s4Ftr4zXzdbhaDA4lLmJygoZ28ISNHMosbV
         qFDJhhbLsZbuhRCzf6U/ohaHxAXX9Uc6ZJw2Ch5irfiTaxflDMCrqB0TfdPauV88Gu74
         9xeekRbG3QLa5qB0GuWgJhcgbs/ZCP5SzGnHWRF0/vLBLos1kwv5dgJ4lj1bihAX8R28
         i9UQ==
X-Forwarded-Encrypted: i=1; AFNElJ+cQ643hcQHEGCqT1tHFkA4I4iqe1qnZAW7uHh9aP9GZYveyKWfjZgVuIhP4dSZOCnOqzYDAluM6rhZwaivvJhs@lists.infradead.org
X-Gm-Message-State: AOJu0YyYe9OjIak/gCJQteaJ1FsAl0zRA/ILNTZzGaFrx5IkuRxnW2AA
	k8TsmFdQUZZp3gjEuAlewu+fLTPSrq/sj1IAmY55+UIRQoE/rPSYkk3GRGkXvmBXlcbmsfCYtgX
	JiUcaSDMTG1UUNTSK1NMCPjQaj5t2QyLGYODyacjR
X-Gm-Gg: Acq92OElvUMIpyINHucyQsGq+a6E6v90r9e1x7ur/4Fr6pVxygMDbsFpxNp4yXBlZr6
	sTVkzsVxrhmUqADUTOJbIdkG0zc0Kt1DjzVUj8jb5Bfd5TPtWIJWcqOYgJcNDWN4XJSvZMSsPoJ
	/mmbcAP/10JYJtPfK9vPyZ0XZb/w1r9bkoiyFkVGKqGewbb+UzrCxGDYgWk1Gu/JCeUTtVqpSl8
	iQlRVapR/r/rSHzkw1R5qq0wbtuQIHn0qnnHeGuM/YcA+pMP1kIltN/2hFazBug8w9fQk3RPhq4
	6MLeXWesi+QeMmvxHag0Q9ww9udEwNd56omH294y3o4dOjWR
X-Received: by 2002:a05:7300:2389:b0:2ea:b975:3db1 with SMTP id
 5a478bee46e88-304491d7957mr12069640eec.23.1779947789049; Wed, 27 May 2026
 22:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com> <CANiq72mCYOXrWM7_3jby_ZvYmspXsYVzRqhTgQiBF0bdDLAaEg@mail.gmail.com>
In-Reply-To: <CANiq72mCYOXrWM7_3jby_ZvYmspXsYVzRqhTgQiBF0bdDLAaEg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 28 May 2026 07:56:11 +0200
X-Gm-Features: AVHnY4Ie_gpq2EI8eezCf2IRezAi1N80vE8gyBvflGswgtsI7hjNkqwxua2zqnE
Message-ID: <CAH5fLghSe9tV+CJkqp5CkUPfugZ7hvMN0XHsh5kY3vs=3uQ2FQ@mail.gmail.com>
Subject: Re: [PATCH] rust: arm64: set uwtable llvm module flag for CONFIG_UNWIND_TABLES
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, stable@kernel.org, 
	Bo Ye <bo.ye@mediatek.com>, Isaac Manjarres <isaacmanjarres@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_225630_761717_6EEAF400 
X-CRM114-Status: GOOD (  18.48  )
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

On Thu, May 28, 2026 at 7:26=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, May 27, 2026 at 8:18=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Once the fix lands in rustc, this flag can be made conditional on the
> > rustc version. Note that passing the flag on a rustc with the fix
> > present has no effect.
>
> Already landed now, so if the uwtable one is enough, we could already
> do that since it will be 1.98. But since it has no effect, we can keep
> the fix as-is and do that on top too.

Ah, yes, let's just add the version check.

With regards to the frame-pointer one, it's probably a good idea to do
the same for that one. It's not necessary to fix the boot crash I
encountered, but may help with other issues such as backtraces of
ftrace.

> Added and linked both issues (i.e. `uwtable` and the `frame-pointer` one)=
 to:
>
>   https://github.com/Rust-for-Linux/linux/issues/355
>
> I have to send a fixes PR in the coming days, so I can pick this one
> up, but if arm64 will do so then:
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
>
> Thanks!
>
> Cheers,
> Miguel

