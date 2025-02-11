Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC12C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 16:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPuoFgyUqShqiHXq7m4WJY26nDOJr72a7sYiaqDAkZ8=; b=30R23R5LMjwVY6NY4KkiZzSJcK
	hcmPzIJ3nZUa+POD+I2wyAgD/4hyFg3lRwsaAmrIIJ+2iyX6yGcdIM+0z9Aq5wL45u5QHLCKydhfr
	AN7y7hUbMAymx/7P/h+QAcrnQN1sVyIsrc7dXs3UAXWYAI3zl5x24J55yjsnSKKCgZVvb9hZWnGZo
	wMrqMpACy76iuuFpunVlzeZ6t/jGBcNMo4XbzIcRwDpeLhrV4wnCLZ5xTjji+HJ0xMjkywVDeEQDg
	4+ZAJhTaubOAn/5wAU7Tr+yRxJmXNRdeHWLJ3KNCser2VjmV3vGvN7gmWOmVDuou0ofQYmvTpVjdw
	pNAjNNBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thtQO-00000004Zve-320q;
	Tue, 11 Feb 2025 16:47:52 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsya-00000004TZE-1W2k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 16:19:09 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3d146357fb2so184865ab.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 08:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739290747; x=1739895547; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPuoFgyUqShqiHXq7m4WJY26nDOJr72a7sYiaqDAkZ8=;
        b=4HfZquNnsYULBXwcyQMyEpTuHgk156sXqN63kim1NfLA5vxKUFZk4W3H54W/QxucBf
         M8QNZh5kfg0PpEcAmMkRNHVrKTqTsM13kgd1Tew4sHOaJhbHPcce7/manf8wX8HLwX0M
         GgIvtjVpowW0sV8a+tOb3dwHUiktlnKHyoo0zqOrERluB2jS6nB+RqgYCQdxL3TENibz
         QRRcY5iiBHmel9nku30RC8xoieYF+uTMjcfk4gYQUS8xcVUNa5ES/JFXkzZwLxYhP/U1
         0GR0RorWZVZy3rdAWaGdLciQUFRYuqN1yARObSLOotH5dGmq4AJS0rTtg5UkG1j0qGk2
         g6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739290747; x=1739895547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPuoFgyUqShqiHXq7m4WJY26nDOJr72a7sYiaqDAkZ8=;
        b=cp9kIZFoIExVE3gKTno1INRb4FEvYcHyUoAWSRqVfUvDsSBbju6xVm66wq5m0HNe0V
         5RZdgHa5Ep2NXBgbjHKffy8kPTes35H9D3sOfOqqvkIV2A7BvCd/jgd5nGLhgMCAZxs1
         B7bUfp8TiaFbOzSn2Dw45lNDNvKdgbfMUUtA/6rAU/+s8nMkukfBLS2OZIHDGA27agJ0
         VxH7PkAVtwMHIdfp6QBhF0HYud5nhawSpmtIeGInwtNH1sPHAmpfW4GPsCktlujE9juS
         EOJ5IwwmAARO+I4S5jUgQZbKKejMvsj0u2c9+MT5e9soM4oDx3RGWR067MVbZ3+RG85M
         QSfg==
X-Forwarded-Encrypted: i=1; AJvYcCUt/nHiiZS0nzkIWzdGo7I89eV4T4YKlb9JPODLT36CJgBv4DnkvW0DgsJIXfSbY1r6CCeyYNgepUkZXRZpHF8+@lists.infradead.org
X-Gm-Message-State: AOJu0YwoK+pVFKxwQ0CfMu/Dsdmsocm4xp+ZN96yHyQw5FvtF7naAO7/
	U3QhP9feWrXV5BTQS2TXffJWl9dkYnBD6J1yEaeyizGRKckDs1gq0FcXXF4CWgbhHUTgWaSqgZf
	pn4WsFpKbtHQSoqckzdgBDnjJGxtFy7pDdmOb
X-Gm-Gg: ASbGncuG8lVJSdGsClURMTbdTRa5fTJHQE7Zi2ZlLbcl8SucjoM3zPMqNOD4ubGv1rK
	xDyZFEQ5h4ivSxMXqxq+I7bAz/Iqsg4CRqKPJGZN/xQNtCvz5fBWU3t0yIATR4pwLOY6euaxSGg
	KVsennrNCFbS65ou+scLWlX7i4
X-Google-Smtp-Source: AGHT+IGBRJUYM7eB7GRcv7zbcCLNqRmCzTZKJzAh5FAel3+2vWVb9N+g6mOuPoRoTCDTrgVk0gX8MyeGCqZ63HpU/Co=
X-Received: by 2002:a05:6e02:1848:b0:3a7:df79:71b3 with SMTP id
 e9e14a558f8ab-3d171e30ba1mr3350285ab.19.1739290746485; Tue, 11 Feb 2025
 08:19:06 -0800 (PST)
MIME-Version: 1.0
References: <20250210165108.95894-1-irogers@google.com> <20250210165108.95894-4-irogers@google.com>
 <07c5c3ad-5a6d-4eda-95f2-ed16e7504d4c@app.fastmail.com>
In-Reply-To: <07c5c3ad-5a6d-4eda-95f2-ed16e7504d4c@app.fastmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 11 Feb 2025 08:18:54 -0800
X-Gm-Features: AWEUYZnsI21FqO05tMc19ZFoLQwRQjxl2-W2xUAqGcaU1HeGa3Km7KpVudfKIf8
Message-ID: <CAP-5=fV0AVEp1uEtKjAqOmwqKSRuUzTwrXnBiqc=Lopfj4hBSA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250211_081908_390506_491A46D1 
X-CRM114-Status: GOOD (  33.33  )
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

On Mon, Feb 10, 2025 at 11:48=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> On Mon, Feb 10, 2025, at 17:51, Ian Rogers wrote:
> > The syscalltbl held entries of system call name and number pairs,
> > generated from a native syscalltbl at start up. As there are gaps in
> > the system call number there is a notion of index into the
> > table. Going forward we want the system call table to be identifiable
> > by a machine type, for example, i386 vs x86-64. Change the interface
> > to the syscalltbl so (1) a (currently unused machine type of EM_HOST)
> > is passed (2) the index to syscall number and system call name mapping
> > is computed at build time.
> >
> > Two tables are used for this, an array of system call number to name,
> > an array of system call numbers sorted by the system call name. The
> > sorted array doesn't store strings in part to save memory and
> > relocations. The index notion is carried forward and is an index into
> > the sorted array of system call numbers, the data structures are
> > opaque (held only in syscalltbl.c), and so the number of indices for a
> > machine type is exposed as a new API.
> >
> > The arrays are computed in the syscalltbl.sh script and so no start-up
> > time computation and storage is necessary.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > Reviewed-by: Howard Chu <howardchu95@gmail.com>
>
> Your changes look fine to me, but I noticed one part that may
> be wrong before and after your patch:
>
> >
> > -const int syscalltbl_native_max_id =3D SYSCALLTBL_MAX_ID;
> > -static const char *const *syscalltbl_native =3D syscalltbl;
> > +const char *syscalltbl__name(int e_machine __maybe_unused, int id)
> > +{
> > +     if (id >=3D 0 && id <=3D (int)ARRAY_SIZE(syscall_num_to_name))
> > +             return syscall_num_to_name[id];
> > +     return NULL;
> > +}
>
> The syscall numbers on mips (and previously on ia64) are offset by
> a large number depending on the ABI (o32/n32/n64). I assume what
> we want here is to have the small numbers without the offset in
> syscall_num_to_name[], but that requires adding the offset during
> the lookup. Can you check if this is handled correctly?

Thanks Arnd! I agree the tables are large and can be sparse, they'll
also be full of relocations. MIPS doesn't look like an outlier to me
here:
```
#if defined(ALL_SYSCALLTBL) || defined(__mips__)
static const char *const syscall_num_to_name_EM_MIPS[] =3D {
       [0] =3D "read",
       [1] =3D "write",
       [2] =3D "open",
...
        [465] =3D "listxattrat",
        [466] =3D "removexattrat",
};
```
For contrast x86:
```
#if defined(ALL_SYSCALLTBL) || defined(__i386__) || defined(__x86_64__)
static const char *const syscall_num_to_name_EM_386[] =3D {
        [0] =3D "restart_syscall",
        [1] =3D "exit",
        [2] =3D "fork",
...
        [464] =3D "getxattrat",
        [465] =3D "listxattrat",
        [466] =3D "removexattrat",
};
```
Looking through the tables I see alpha having the highest number
syscall with 572 being mseal.

I don't think this is great but in the current code (on x86-64) we
have in arch/x86/include/generated/asm/syscalls_64.h:
```
static const char *const syscalltbl[] =3D {
       [0] =3D "read",
       [1] =3D "write",
       [2] =3D "open",
...
        [465] =3D "listxattrat",
        [466] =3D "removexattrat",
};
#define SYSCALLTBL_MAX_ID 466
```
So the change is carrying forward a bad behavior, the table is still
only around 4kb. We could be more aggressive in compressing the
strings and pointers, for example how we compress the perf events and
metrics. I think it is getting out-of-scope here as that logic is
written in python, with the aid of lots of dictionaries, whilst this
code is currently a shell script. It becomes more of an issue if we
enable all of the tables in the build at once.

Thanks,
Ian

