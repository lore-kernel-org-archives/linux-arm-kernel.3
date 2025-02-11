Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CB7C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 17:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/wQ94efDGzeP+hPazDVZ0s87mMmIX0OkL74nPRKdj5c=; b=bocFOIiIHm+rWF9d73TblxzMws
	Y4OAYntxxyiWXEck0eN5xdfSRkukV4MeyGy9cnclftfqjx0QkEA2NqGHEBXOJiWEjpuWUsNdLm/i3
	7r9Ww53JNrd46B/vWXfuHPaGMSOEDnZLSk3ZA9tsUqrm/I+55tDNcp479pqh7HS2J+BXGLi9pM2fE
	UMvhLNyHYzzVBEaUVGihz1ltYVFYy5fX+ihKb0ySvVhwyK7gd2fZ2ZTTjvclyAIRI7KY9wna4kShA
	D1sKcOPYqkVnNjX1bK4trmmwFB5dAqXN2ZXypHorEDUvYxXNHLEedMd7+wtCVb1GQ57VhpVngCZ6Q
	tYnCOX+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thuHs-00000004ijX-1jxI;
	Tue, 11 Feb 2025 17:43:08 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thu7n-00000004h8C-00Rj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 17:32:44 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3d147331fb5so1025ab.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 09:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739295162; x=1739899962; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wQ94efDGzeP+hPazDVZ0s87mMmIX0OkL74nPRKdj5c=;
        b=PWQx27xBmR2gCdVRzILTtHraT6SQp+Atm9K+raQ0zLSMuXE5lNFmYaQFzQChZEr5/E
         7nKYd4tVS4oCYCZgrND47cFzbM3Q0NdzWJcX6GxdzMJ5kUTkdYq0WDtSYl2lbcKL8KdE
         acVhiGAeSWFqKJPk5UrmqQPfN6hAmNd735kSJf4Cc8Ql57JqH4ohMYxsSNFb3GOL2Yob
         dEuzhmkiT8i2ZA/YzN4JJnDLk5459z+ye1iHIB73fn/6q5Yk8q08Fxjc9rIv6KSGAkle
         X6BQbRcZFkROpKPc6SdVqDkQSpp07aDGzutUg6F4YTUMGAbCzKxO0nXp/ChEOsso1NME
         IcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739295162; x=1739899962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wQ94efDGzeP+hPazDVZ0s87mMmIX0OkL74nPRKdj5c=;
        b=NJvgtIfgqblJf85Bdrcb3Y9wTxywMWEeWA/xnkWpY3E7wrAZTtmh7XYaRiDvt5Lbvl
         24eAnGLo3+bZ0uiUnt26QVr2jamDUxaO0kBxEbRAzlt2ZRJwUKEcOJ+ZXJxuts8l6ujZ
         XUa4ls/QrkopIfruV4lJG4GyL7WEO549lb1Y8mwSaw/rgn64Xc1cSNszGs51Fl8g0aZd
         dZ6SvMWOhbCGk/QTUqP69FXoUgrDEiW2Y45qiUGc9JMs+Xro2JLKQWy8z7qWDvHPZ/n1
         q+EeYKXSrAAvvSrH2U8NEohb7zv3PrAHUqY956ElFbKcTLq+VkbIIcKgbWeKyPeqTqgm
         zrTA==
X-Forwarded-Encrypted: i=1; AJvYcCWapwzU+7w3/efQx3Y8il7Pqd+uGNhJpniGYpiVGNzsUa9heGqeGLtDS480OBBEBj8nPBkbem0aZlej+L4NilBn@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0ukr3jgeFP+5KwF3Oj+dmX2i0fxCvc0AIsQtlHDdivytQSobt
	4YHAhUSPIpqyn5Nl9swWBb35LyqpmYq5Byy3RMhLdN0sGDeSN8G3wadOSfW6berH0TfPYecfOrC
	gxKq+BjS2a0gpbpXG/er9++AqE3XRgSpXFUAK
X-Gm-Gg: ASbGncsFIYndfzlH3bTvOSxw+Q7zpQmZ6p2BzUPbzRldhWJwy7pNMdr41FzC+chROj3
	ecsECm62XE9WBGDf4qBBdaWEiC6FNsay+gUj6/auQPKtc22kkixGdw1LMtFEOd+ZeskkWD96wi5
	YVTVDOWKGL1RFj0iu2cyzu7P/H
X-Google-Smtp-Source: AGHT+IFx7gQLpljuW0IlQHJkC2sPOgwjKNSe/p6Gvj27OoKy/WP45l1TbYOsmf4dkw4zbjr78o/5BoHNMYA6pqf60WY=
X-Received: by 2002:a92:c848:0:b0:3d1:7959:1793 with SMTP id
 e9e14a558f8ab-3d179591827mr1211895ab.25.1739295161966; Tue, 11 Feb 2025
 09:32:41 -0800 (PST)
MIME-Version: 1.0
References: <20250210165108.95894-1-irogers@google.com> <20250210165108.95894-4-irogers@google.com>
 <07c5c3ad-5a6d-4eda-95f2-ed16e7504d4c@app.fastmail.com> <CAP-5=fV0AVEp1uEtKjAqOmwqKSRuUzTwrXnBiqc=Lopfj4hBSA@mail.gmail.com>
 <8ed7dfb2-1e4d-4aa4-a04b-0397a89365d1@app.fastmail.com>
In-Reply-To: <8ed7dfb2-1e4d-4aa4-a04b-0397a89365d1@app.fastmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 11 Feb 2025 09:32:30 -0800
X-Gm-Features: AWEUYZkcknJc_ecEWZmGNLleCOMX5hjRpYX4QmTXwPuP9BwndmjrpXk_kZmIMOQ
Message-ID: <CAP-5=fWjJbg_q3xN0iytcqdBzSuRX+PD7CKp9+rHvFxB1VYxhw@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] perf syscalltbl: Remove struct syscalltbl
To: Arnd Bergmann <arnd@arndb.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, guoren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_093243_044005_65BE6344 
X-CRM114-Status: GOOD (  25.88  )
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

On Tue, Feb 11, 2025 at 8:34=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Tue, Feb 11, 2025, at 17:18, Ian Rogers wrote:
> > On Mon, Feb 10, 2025 at 11:48=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> =
wrote:
>
> >> The syscall numbers on mips (and previously on ia64) are offset by
> >> a large number depending on the ABI (o32/n32/n64). I assume what
> >> we want here is to have the small numbers without the offset in
> >> syscall_num_to_name[], but that requires adding the offset during
> >> the lookup. Can you check if this is handled correctly?
> >
> > Thanks Arnd! I agree the tables are large and can be sparse, they'll
> > also be full of relocations. MIPS doesn't look like an outlier to me
> > here:
>
> Sorry, I should have been clearer what I meant, see
> arch/mips/include/uapi/asm/unistd.h:
>
> #if _MIPS_SIM =3D=3D _MIPS_SIM_NABI32
> #define __NR_Linux      6000
> #include <asm/unistd_n32.h>
> #endif
>
> and
> arch/mips/include/generated/uapi/asm/unistd_n32.h
>
> #define __NR_read (__NR_Linux + 0)
> #define __NR_write (__NR_Linux + 1)
> #define __NR_open (__NR_Linux + 2)
>
> These offsets are 4000/5000/6000 respectively.
>
> > ```
> > #if defined(ALL_SYSCALLTBL) || defined(__mips__)
> > static const char *const syscall_num_to_name_EM_MIPS[] =3D {
> >        [0] =3D "read",
> >        [1] =3D "write",
> >        [2] =3D "open",
> > ...
> >         [465] =3D "listxattrat",
> >         [466] =3D "removexattrat",
> > };
>
> This means the array is not sparse, but the numbers
> here do not match the syscall number argument register.
>
> The question is whether tracing on mips adds the same
> per-ABI offset again, or if it tries and fails to look
> up index 6002 for 'open'.

Thanks for clarifying. I believe it will use 6002 and be broken. I
believe that'd be true without these changes too. I'm not testing on
MIPS so it'd be nice to have a fix targeted at making it work. Ideally
we wouldn't use __NR_Linux and instead fudge the id/system call number
based on e_machine/e_flags. I think it is follow on work, especially
because I don't find MIPS a very motivating use-case.

Thanks,
Ian

