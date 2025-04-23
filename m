Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89318C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 00:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWlmxqNag015p2cP0vSnW/zq2HibDR5FkrpgKq7T/2k=; b=yiS6qkQ1ajK9Ah6F9PoOV6f4l5
	/jVmZkrHvGd2Z1F/N57LMol54/BWdcsAhP8U6tanjjsXP5AldLfDdM4jAl6I3fGtDleaMAFW5OTio
	/CgGtxxlueu1LvbbU2Pa4rnzrv8UhlLsDn0RImlZS5u+FrZmtlZ1d98Jgn+iKxpQSpicUZHlPRO1H
	ImMOj3l9+29rAUkJciTocGWgx2SLY3tVEQq9PFKAylbpuq3vAeFXfN1Hox3nxdS15BmUdfRXJiWJY
	HvB7mJ55aFTzKrWIi28FGjaxupwl/muH45sifvIb2jc2eA7usfqgoXZdLAMUYk8NeXmFwKoptpTBr
	9/lFTKEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7NzV-00000008tJE-1YIj;
	Wed, 23 Apr 2025 00:29:29 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Nxd-00000008tDP-1HMB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 00:27:35 +0000
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-86d5a786c7cso2052610241.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 17:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745368051; x=1745972851; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWlmxqNag015p2cP0vSnW/zq2HibDR5FkrpgKq7T/2k=;
        b=LKR9XXoeV6kt/B5WIJx8BTRCp2MzfJmH2TUBYor9GuTVWxYze48ICHj6u17Y+mijxI
         vJAY01gF97Ef8fIenKEmc97jk7at4FdCjJ18vtTDgsvSlCqm1tlHTkpt8mQSx6eULsbT
         FwtO2gTW6NWs1tbSA09nijbzUxJNAGK94GZJa27HpkXIZFGZ3vAdnxPFBbW5cevb9CHL
         wNdFzJWfCcGmckjBLfKBJZhYfjTCsk1ccTzObzxQn+x8+RlVx2nW7VXQ6WddpCD6dpyB
         tkXYyQE0zCftFsYi9b+ij+1rD7IslOmXjoWgsnJ9UJ08sAbq6NDAjMz3eTyIZu59Zn+M
         CpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745368051; x=1745972851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWlmxqNag015p2cP0vSnW/zq2HibDR5FkrpgKq7T/2k=;
        b=pEP8TdvvPqxdIXqI5jkgF3Z7+VyHlsv+loWLftLQgwkls3XYgfZTtXyESRpb9dbVsS
         wzRw5IVf6wtQtLZNBTEP9wcPo3xBZDzrvDBONDYRfGh7/UkO3GOTu7denrecj3OmgxlD
         /HSucDiGUBwGGsqcDqduZA2D8AmUwMG+BoQATgzykukYWA6+jZ5hhNUVa1qDiH4zRz6Q
         iroUwnHiQZC0kclisGMGm1uzWvjc0g62RRffDFz1FgtkfobqZvJtY0cMe28LyeACx+Xj
         18tkJXNXB+uHpe9jrnYGl51uWE+SiA1B40y3fFEGqmOGTq32JEiwJMT5Tu7M8lltxlE8
         km6A==
X-Forwarded-Encrypted: i=1; AJvYcCX7TpDAmjdiV4ykiJdVqHFaWKnuUMPY35YC7Ai2bSyWfI1vokJyFF02arLpvSt1ud0dG7yDuiXxXLlj/h+Ymqm3@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg/ieysZdVYz//DFWDoAnRDB1U1KImSOBj8uuE2HSQw7wTSWBV
	qMGQdc1NiFQF51/B5+IYgQ0rs4PEAhRFWldmcUA24oueKpLtzIkEsDAEzBTTjgVx3n2DBylVHg8
	gl33gD+gn4uZkqv3pj+PUuJzqts6VCQueitZ0
X-Gm-Gg: ASbGncsJLEuhXUyz+IEvugK672PGGj+n866Ygl+rqXD7kBPmxKhFB6/8dSbnmggU72R
	k/sJ6UIVewR5ZYtPg7zOxEouy1fiYSvGoESua9JhY6xPsBuvtD1rALOKT1csbXOBHjH6V2BwEnD
	BL6LXLaan4/eMqWSlftEy2rh4utkRRlKOt3VSG910EPn7q/oHZK0ie
X-Google-Smtp-Source: AGHT+IHDyONnXP5kHGTU8ef5H6nBwGkC0E2Wv2qdGeM0PJ8We8AEdbOzl6IOUJnmI3YsbyK6kpxBjX+98Vl502S5GJg=
X-Received: by 2002:a05:6102:5e92:b0:4c3:64bd:5405 with SMTP id
 ada2fe7eead31-4cb800fc8bbmr10978805137.9.1745368051103; Tue, 22 Apr 2025
 17:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250412010940.1686376-1-dylanbhatch@google.com>
 <20250412010940.1686376-3-dylanbhatch@google.com> <CAPhsuW4LO9Cr8kpTeNR7nBw1FYrNrXBndYtcTEnA408GL1jT0A@mail.gmail.com>
 <CAPhsuW7z2rdNK3w9Hpwh8FXy29fSUNGKyAw0GbUqfxnfgsfg_Q@mail.gmail.com>
In-Reply-To: <CAPhsuW7z2rdNK3w9Hpwh8FXy29fSUNGKyAw0GbUqfxnfgsfg_Q@mail.gmail.com>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Tue, 22 Apr 2025 17:27:20 -0700
X-Gm-Features: ATxdqUF_aQC6WF23mfDl6QAYTZrX6z_tX0jk3VuE5MUPI5RIXkEte6wNf-I_3V4
Message-ID: <CADBMgpzrM7PMePtWaZLaaNXt6z++V0rX2VXtWK4vzdTCS=BpQA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64/module: Use text-poke API for late relocations.
To: Song Liu <song@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_172733_348904_ADD6DD7F 
X-CRM114-Status: GOOD (  18.98  )
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

On Mon, Apr 21, 2025 at 11:25=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Mon, Apr 21, 2025 at 5:35=E2=80=AFPM Song Liu <song@kernel.org> wrote:
> >
> > On Fri, Apr 11, 2025 at 6:10=E2=80=AFPM Dylan Hatch <dylanbhatch@google=
.com> wrote:
> > >
> > > To enable late module patching, livepatch modules need to be able to
> > > apply some of their relocations well after being loaded. In this
> > > scenario, use the text-poking API to allow this, even with
> > > STRICT_MODULE_RWX.
> > >
> > > This patch is largely based off commit 88fc078a7a8f6 ("x86/module: Us=
e
> > > text_poke() for late relocations").
> > >
> > > Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
>
> Could you please share how you test this?
>

For context, we enable livepatch for arm64 by porting this RFC series
(along with other internal patches) into our kernel:
https://lore.kernel.org/all/20230202074036.507249-1-madvenka@linux.microsof=
t.com/.

The way I tested this patch is: with STRICT_MODULE_RWX, load a module
and a livepatch that touches that module (in either order), and
confirm the kernel doesn't crash.

Without this patch, a crash is caused in apply_relocate_add() if both
a module and a livepatch that touches the module are both loaded. This
happens through one of two code paths:

  1. If the module is already loaded when the livepatch is applied,
through the module_init() callback.
  2. If the module is loaded after the livepatch is applied, through
prepare_coming_module().

In both scenarios, the livepatch module's text is already RX-only.

Thanks,
Dylan

