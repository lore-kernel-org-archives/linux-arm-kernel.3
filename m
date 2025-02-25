Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAB3C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 00:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sURLs9wtqv4Ma4fwiaciN3XSWn5AusSRiSrh/nmppKs=; b=L4lrTkwvMkMx37FPjvFlQ+kxS7
	0sS3iQNkppd0SmK5BwK+mbGQ9BlVhGDnUPjhpwT2bPo1j0Yrkr9oXAygqZJ5LEZCeR9mVFVnWMbkT
	7fG5AbZ8ZbIbLnSTSYfgULfO+nZeliD95687/gPLxJ2f04QRi22oyege2aJAgOqzzq0Sf3XZnmZOt
	wR7CyoaaNlhoClUjCfohdy9gNLl7aO0Chb0S+tIx0IyuDVvO9IjV+rfiQvmJNS9Y7B2bFDbbVJ0Gb
	/WFW1hTDM3fDNJNB27uSwahCZmhmfauUyRaOQY4QCw6Z5rtVBXo/4YKHlkkj/uwnkvqoaxObntsho
	WFB8f4FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmic5-0000000FbMq-1gJA;
	Tue, 25 Feb 2025 00:15:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmiaZ-0000000FbHP-2n6a
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Feb 2025 00:14:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sURLs9wtqv4Ma4fwiaciN3XSWn5AusSRiSrh/nmppKs=; b=oCZnUg6tCYd8HlzX6qkecCDE49
	Zj4W7vYtd63x2mrUWbriguMUEyvaIJQpCAEvauNveUoOOq8+C2g6+irf9+iq6g8MxcvhD3KPaOVAw
	vh+4lHYFXcByc3D1JaiRr5YfBEm2hRCZD1HdVNZOhdKyAk/QrFIM5zJIz/Mm3GkhBX91JPyRqc/sR
	QwsOq3XRg9fr6Ich7B9xJ591ywi6tHfIfD1zOwakvRvV1u4ifKfJCTaVgb1GdGIRGw4wWiAibBqSH
	S/ZDX4jVqaG6992RUrNN0n89E9r6c6qPtPpT47Wu2ZABihvOXzWD4ODwsnKTyydUf5ms6HzwyYAU/
	nNQJGMvQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmiaW-00000003GHm-16t9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 00:14:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EE2805C5510
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 00:13:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D35DC4CEEC
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 00:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740442450;
	bh=RrjZywtok7pmqjRXq+52Mw3aIZaqlkmt827OKazuRN8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JSXg4Hv3hAgWNZiLAcLwodBsvL355TD9HhBuHHgJxH64OhFw6QwjwpJi5/sRd2hnE
	 bacx8UiqoRurkn5hnZjOe9ZkV3pcMJ1r5E1GbmEO0RuOgK9gKQFFWy8OEA2R/3C/Zz
	 OsxVw8lNacqv2tIViGLMII/Tr1Pgfmky/feOJfXW3L76HFNGzBUJl5VvF+7tABbW4l
	 SOkj6z6zrqAIe+S+ZkMZpcZcC1RQ59Ovi9r76EZme/hVAUn60+35VQzQEIKbJTIcVg
	 tEniDvRB761XJK2VrxWbzz9ZrIH1WnT36lmUUlgsGcjut7uRal2T2dKXPi/CvX5F87
	 82qwpNiXaZuUw==
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-855a5aa9360so372984239f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 16:14:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUFuHHoStHq+2wO1aGtReq+eu0hsnSAn7jMvY8TvbmNRFgQuuzRRYhzvWTCwLYcy6T26P2tLSbE+4Pqw7/b7oxX@lists.infradead.org
X-Gm-Message-State: AOJu0YxfUrKQ5cglwzRT4WtqLc1vsrB+mW5o4K5de9XGImOJTpKIH8Gy
	CEZyUf0n8c2/lIkrCd+HF/YGrV04HbRUFCR1OZHcTbeyVm0EuiWzZKvT4xJtXpmtAaSRDBpvU5s
	fbUZr7/Ea3sU+Voc0HYg18JoW3Uc=
X-Google-Smtp-Source: AGHT+IEGfSMvQhcmxe+D0QwBwqdzpgzsf7C3s6D4Gjai2KF9IRKGDa/39Olkwm6B0VNAodvYcGSMocV0IYhoCmStwQE=
X-Received: by 2002:a05:6e02:148e:b0:3d2:b7b6:e80d with SMTP id
 e9e14a558f8ab-3d2fc0c54a4mr18692795ab.3.1740442449607; Mon, 24 Feb 2025
 16:14:09 -0800 (PST)
MIME-Version: 1.0
References: <CAPhsuW6dxPtgqZaHrZEVhQXwm2+sETreZnGybZXVKYKfG9H6tg@mail.gmail.com>
 <20250214193400.j4hp45jlufihv5eh@jpoimboe> <CAPhsuW6q+yhn0pGQb0K+RhXHYDkjEgomZ2pu3P_MEeX+xNRe0g@mail.gmail.com>
 <20250214232342.5m3hveygqb2qafpp@jpoimboe> <CAPhsuW48h11yLuU7uHuPgYNCzwaxVKG+TaGOZeT7fR60+brTwA@mail.gmail.com>
 <20250218063702.e2qrpjk4ylhnk5s7@jpoimboe> <CAPhsuW5ZauBrSz11cvVtG5qQBfNmbcwPgMf=BScHtyZfHvK4FQ@mail.gmail.com>
 <20250218184059.iysrvtaoah6e4bu4@jpoimboe> <CAPhsuW4pd8gEiRNj920kO8c4JuEWoXT=MhFK-nWvJZ9QseefaQ@mail.gmail.com>
 <CAPhsuW57xpR1YZqENvDr0vNZGVrq4+LUzPRA-wZipurTTy7MmA@mail.gmail.com>
 <20250220182221.vdmmnoyvc2do5mnn@jpoimboe> <CAPhsuW53DK2vFH-BZeUYN-eythX3NQEbcxrYf6jvBDtDmctRgw@mail.gmail.com>
In-Reply-To: <CAPhsuW53DK2vFH-BZeUYN-eythX3NQEbcxrYf6jvBDtDmctRgw@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Mon, 24 Feb 2025 16:13:58 -0800
X-Gmail-Original-Message-ID: <CAPhsuW5Codoe2NViZJRE4JjM2Qc_v-qPzKZ1vOyr+9Oi0CxpAQ@mail.gmail.com>
X-Gm-Features: AWEUYZlhFxBXD7xdQSvghIzbkdQB4xbhvgY6aZ3jRtXIkzKgZAdiM9UvB5WldRw
Message-ID: <CAPhsuW5Codoe2NViZJRE4JjM2Qc_v-qPzKZ1vOyr+9Oi0CxpAQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Puranjay Mohan <puranjay@kernel.org>, Weinan Liu <wnliu@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Indu Bhagat <indu.bhagat@oracle.com>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev, 
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_001416_800901_A8F8BBC2 
X-CRM114-Status: GOOD (  23.45  )
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

On Thu, Feb 20, 2025 at 10:33=E2=80=AFAM Song Liu <song@kernel.org> wrote:
>
>
> On Thu, Feb 20, 2025 at 10:22=E2=80=AFAM Josh Poimboeuf <jpoimboe@kernel.=
org> wrote:
>>
>> On Wed, Feb 19, 2025 at 08:50:09PM -0800, Song Liu wrote:
>> > Indu, is this behavior (symbols with same name are not in
>> > sorted order from readelf -s) expected? Or is this a bug?
>> > I am using this gcc:
>> >
>> > $ gcc --version
>> > gcc (GCC) 14.2.1 20240801 (Red Hat 14.2.1-1)
>> > Copyright (C) 2024 Free Software Foundation, Inc.
>> > This is free software; see the source for copying conditions.  There i=
s NO
>> > warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PUR=
POSE.
>>
>> Are you using different binutils versions as well?
>
>
> I am using binutil 2.41, for both gcc -11 and gcc-14.
>
>>
>> It sounds like a linker "issue" to me.  I'm not sure if it qualifies as
>> a bug, the linker might be free to layout symbols how it wishes.
>
>
> We can probably handle that in kpatch-build.

OK, something like the following gets the proper sympos for
gcc-14 built kernel.

Thanks,
Song


diff --git i/kpatch-build/lookup.c w/kpatch-build/lookup.c
index bd2b732de910..87ac127184c5 100644
--- i/kpatch-build/lookup.c
+++ w/kpatch-build/lookup.c
@@ -479,13 +479,10 @@ static bool lookup_local_symbol(struct
lookup_table *table,
        struct object_symbol *sym;
        unsigned long sympos =3D 0;
        int i, in_file =3D 0;
+       bool found =3D false;

        memset(result, 0, sizeof(*result));
        for_each_obj_symbol(i, sym, table) {
-               if (sym->bind =3D=3D STB_LOCAL && !strcmp(sym->name,
-                                       lookup_sym->name))
-                       sympos++;
-
                if (lookup_sym->lookup_table_file_sym =3D=3D sym) {
                        in_file =3D 1;
                        continue;
@@ -499,20 +496,29 @@ static bool lookup_local_symbol(struct
lookup_table *table,

                if (sym->bind =3D=3D STB_LOCAL && !strcmp(sym->name,
                                        lookup_sym->name)) {
-                       if (result->objname)
+                       if (found)
                                ERROR("duplicate local symbol found for %s"=
,
                                                lookup_sym->name);

                        result->objname         =3D table->objname;
                        result->addr            =3D sym->addr;
                        result->size            =3D sym->size;
-                       result->sympos          =3D sympos;
                        result->global          =3D false;
                        result->exported        =3D false;
+                       found =3D true;
                }
        }
+       if (!found)
+               return false;

-       return !!result->objname;
+       for_each_obj_symbol(i, sym, table) {
+               if (sym->bind =3D=3D STB_LOCAL &&
+                   !strcmp(sym->name, lookup_sym->name) &&
+                   sym->addr < result->addr)
+                       sympos++;
+       }
+       result->sympos =3D sympos;
+       return true;
 }

 static bool lookup_exported_symbol(struct lookup_table *table, char *name,

