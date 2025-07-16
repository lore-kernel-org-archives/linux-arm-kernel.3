Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC783C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 18:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XqYy+Dz+71twI0him0hUjZk/6GLWJWbYmCSfdczxwFc=; b=f3769NtmpzKVpQLscg7OJc87eQ
	BpzamqbTgNVUT2pufBwSoFYhSv/KIAuyiq/le5H/iTxC7xoRjLt9QlMSBvH/NOOMhGMLN8SMWo6KC
	P0mXCWWKxWSgY8k5mC5q/XVYFoYw0mA6m2mlf5faxGDXPI8VtdsStkn+5s2pFsxHRK4/7x35JzjUr
	vrIZLrFghMY12pJ4YCbsPWlWK2koSnCLLJu18Nj6oj4n5J0BAh4iMXJA9krbvQcMeAF64adC9kXBD
	YhA5AVgL6/l3g8Rlouv7oiOM/8DpdHlGSOYARS6yAEO805qGL2nQ1FQf3qo5MwAt59ULqbzxs/fTL
	wbrzu12g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc6oQ-00000008OMP-3eoH;
	Wed, 16 Jul 2025 18:25:02 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc6l0-00000008Ncv-2Ftq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 18:21:31 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-23dd9ae5aacso20535ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 11:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752690089; x=1753294889; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XqYy+Dz+71twI0him0hUjZk/6GLWJWbYmCSfdczxwFc=;
        b=WoR6uBMg2Br4gsf4dkDW5iq57RZOacPZNPW3JOPAi4O5+Evutuf3qxabBgIoKh25Mo
         5TuiHCbZJ7HvqS9JFpKVsbx2N9mCFrFz5HBlKQxg4Ubp/zCHG58tjOe/uowEZK0L5r2a
         mm9VZRHNL8gDPHUrJ+TLV4SX7AskkqI9eO9ZwocP4+owAiWdEnO96XFjB7FhbMddmxg6
         O+v8tbqe4sxQG1fWau+ZtgcfsMQjkr7LKKKq93PGTo0xHFmcEQaUZwBFF0HABjLvbYPD
         XJB/J78AWbxSO5+cmFPuITXolcb8Ym6TbcAoudM7yA5LBbe+IDbTNd3S3MQxS+FhpEYY
         n29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752690089; x=1753294889;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XqYy+Dz+71twI0him0hUjZk/6GLWJWbYmCSfdczxwFc=;
        b=aGpKO2cDUwjAiao7dXp/WfdFsT7KP9XirMqFZK6o4KVqK/QP29CVYp75BSDHA6aSp5
         C3LvEtjutidzLU4tpR40R+WBEpRasJLbTjtGV5Mv4SVZgVSuX5c1TZs9it3xh8u9OpwC
         Zejpg1q8F4iNrPqNoXGsVvHotKerZyY7kfOSDbKp/tNnjUWOmpsA36a/vRzseos9o/wr
         UFUDfRtSt3gw3n8YUdeS7wT+hItR70sIdl1//oHIyt8UY7tLfkOwnGvLM4ex2o8dnCTt
         lr+lLHvfJAYTqtrnSCqdxDkVqy7VMidyl9gG87hUALb71ZpVdu128uHWvbNtOZeUuUdg
         gw2w==
X-Forwarded-Encrypted: i=1; AJvYcCWFTn+7tr3OTil8PxZya+N62dowNgiImxeXS2dvklj9VGKhSMtd6LSfLRDS23Xny5Gn7vekawr1LXEqMmdYigh4@lists.infradead.org
X-Gm-Message-State: AOJu0YxOFch0xip9Gp+sv26RqN5HNpxmhKJEcbJhmwgOZPzXHpi+eFA8
	r2or+1HdqGQeU2JdUqF/UtoPdQ7jBGsMQa9YAOONiFYAFaAYose4TrtY3WjYJoyQ9A==
X-Gm-Gg: ASbGncsBTqdmFY1uLfFuWZg4tsrM+Lwdtl0QynuLjcmb4phhWAXprIZAoA0hmMMDMqL
	PI5BqK02zh+Mb+eyinT4n1N4XrLtpDgULvQhuLVhJ0zLPeDknktS5nwl+zBpNMdLu8jkdHz3VoS
	UA9WMg13EHVaBcc0FUCbKhCDFqVkjDRXz0ozD+IjF6GuNrJ5U8YGrvzm+s22Hgc8PbCM9PTKNU8
	/PGhJCqQXCKSBnz3VCrbPdz5tFQ3RonJzFrEygmYrEFS7xbBUEN0YdxO1z71unSe1ielayZTC2U
	K+QMeJ1Y7eq9FWomFO4LeHzAdejewTdm8b6lZ3k+gkIjlIaj+j0SnBQITpaTUR+/XcrbY7tQRTk
	Y55mI+5bJlro+j1rfwfqKytBpJt3dqzntOfhhnTC+PeRvhEjImb2LtTGCD/nDNDw=
X-Google-Smtp-Source: AGHT+IGlMcCW/yVhugE6YAY332fyg5msAyrVkd1WM6bK1ZITZ1zHK/NiN+y5Y44tdPQTE58o+NEh5Q==
X-Received: by 2002:a17:903:3b8e:b0:231:ddc9:7b82 with SMTP id d9443c01a7336-23e2ffdd014mr186685ad.13.1752690088747;
        Wed, 16 Jul 2025 11:21:28 -0700 (PDT)
Received: from google.com (135.228.125.34.bc.googleusercontent.com. [34.125.228.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31ca786eac1sm1153352a91.48.2025.07.16.11.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 11:21:27 -0700 (PDT)
Date: Wed, 16 Jul 2025 18:21:21 +0000
From: Carlos Llamas <cmllamas@google.com>
To: =?utf-8?B?5YiY5rW354eVIChIYWl5YW4gTGl1KQ==?= <haiyan.liu@unisoc.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?utf-8?B?5ZGo5bmzIChQaW5nIFpob3UvOTAzMik=?= <Ping.Zhou1@unisoc.com>,
	=?utf-8?B?5Luj5a2Q5Li6IChaaXdlaSBEYWkp?= <Ziwei.Dai@unisoc.com>,
	=?utf-8?B?5p2o5Li95aicIChMaW5hIFlhbmcp?= <lina.yang@unisoc.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	=?utf-8?B?546L5Y+MIChTaHVhbmcgV2FuZyk=?= <shuang.wang@unisoc.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	"kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <christian@brauner.io>,
	Suren Baghdasaryan <surenb@google.com>,
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: Meet compiled kernel binaray abnormal issue while enabling
 generic kasan in kernel 6.12 with some default KBUILD_RUSTFLAGS on
Message-ID: <aHftocnJcLg64c29@google.com>
References: <4c459085b9ae42bdbf99b6014952b965@BJMBX01.spreadtrum.com>
 <202507150830.56F8U908028199@SHSPAM01.spreadtrum.com>
 <c34f4f606eb04c38b64e8f3a658cd051@BJMBX01.spreadtrum.com>
 <CANiq72=v6jkOasLiem7RXe-WUSg9PkNqrZneeMOTi1pzwXuHYg@mail.gmail.com>
 <24e87f60203c443abe7549ce5c0e9e75@BJMBX01.spreadtrum.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24e87f60203c443abe7549ce5c0e9e75@BJMBX01.spreadtrum.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_112130_581730_3982EE7B 
X-CRM114-Status: GOOD (  21.20  )
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

On Wed, Jul 16, 2025 at 07:01:29AM +0000, 刘海燕 (Haiyan Liu) wrote:
> 
> 
> > -----邮件原件-----
> > 发件人: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> > 发送时间: 2025年7月16日 1:51
> > 收件人: 刘海燕 (Haiyan Liu) <haiyan.liu@unisoc.com>
> > 抄送: Miguel Ojeda <ojeda@kernel.org>; 周平 (Ping Zhou/9032) <Ping.Zhou1@unisoc.com>; 代子为 (Ziwei Dai)
> > <Ziwei.Dai@unisoc.com>; 杨丽娜 (Lina Yang) <lina.yang@unisoc.com>; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org; rust-for-linux@vger.kernel.org; 王双 (Shuang Wang) <shuang.wang@unisoc.com>; Andrey Ryabinin
> > <ryabinin.a.a@gmail.com>; Alexander Potapenko <glider@google.com>; Andrey Konovalov <andreyknvl@gmail.com>; Dmitry Vyukov
> > <dvyukov@google.com>; Vincenzo Frascino <vincenzo.frascino@arm.com>; kasan-dev@googlegroups.com; Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org>; Arve Hjønnevåg <arve@android.com>; Todd Kjos <tkjos@android.com>; Martijn Coenen
> > <maco@android.com>; Joel Fernandes <joelagnelf@nvidia.com>; Christian Brauner <christian@brauner.io>; Carlos Llamas
> > <cmllamas@google.com>; Suren Baghdasaryan <surenb@google.com>; Jamie Cunliffe <Jamie.Cunliffe@arm.com>; Catalin Marinas
> > <catalin.marinas@arm.com>
> > 主题: Re: Meet compiled kernel binaray abnormal issue while enabling generic kasan in kernel 6.12 with some default KBUILD_RUSTFLAGS
> > on
> > 
> > 
> > 注意: 这封邮件来自于外部。除非你确定邮件内容安全，否则不要点击任何链接和附件。
> > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender
> > and know the content is safe.
> > 
> > 
> > 
> > On Tue, Jul 15, 2025 at 11:41 AM 刘海燕 (Haiyan Liu) <haiyan.liu@unisoc.com> wrote:
> > >
> > > The commit changes the fragment and diff is:
> > 
> > An Android engineer should know how to handle that, but if you are reporting upstream, it is best to try to reproduce the issue with the
> > upstream kernels (e.g. arm64 is not in 6.6.y) and provide the full kernel config used.
> > 
> > > Only two rust-related global variables in fmr.rs and layout.rs have this issue. Their asan.module_ctor complied binaries are wrong.
> > 
> > I am not sure what you mean by `fmr.rs`. As for `layout.rs`, that is in the `kernel` crate in 6.12.y -- isn't there a single `asan.module_ctor`
> > per TU? Which object file are you referring to? I get the pair for my `rust/kernel.o`.
> 
>   NSX:FFFFFFC0800A7C94|F800865E  asan.module_ctor:   str     x30,[x18],#0x8   ; x30,[x18],#8
>    NSX:FFFFFFC0800A7C98|F81F0FFE                      str     x30,[sp,#-0x10]!   ; x30,[sp,#-16]!
>    NSX:FFFFFFC0800A7C9C|F00240A0                      adrp    x0,0xFFFFFFC0848BE000
>    NSX:FFFFFFC0800A7CA0|911D8000                      add     x0,x0,#0x760     ; x0,x0,#1888
>    NSX:FFFFFFC0800A7CA4|52803D61                      mov     w1,#0x1EB        ; w1,#491
>    NSX:FFFFFFC0800A7CA8|94233816                      bl      0xFFFFFFC080975D00   ; __asan_register_globals
>    NSX:FFFFFFC0800A7CAC|F84107FE                      ldr     x30,[sp],#0x10   ; x30,[sp],#16
>    NSX:FFFFFFC0800A7CB0|D50323BF                      autiasp
>    NSX:FFFFFFC0800A7CB4|D65F03C0                      ret
> The first __asan_global struct value is 
>  ENAXI:FFFFFFC0848BE760|>FFFFFFC082EDB180 000000000000005F ........_.......
>  ENAXI:FFFFFFC0848BE770| 0000000000000080 FFFFFFC0836DC431 ........1.m.....
>  ENAXI:FFFFFFC0848BE780| FFFFFFC082EEC780 0000000000000000 ................
>  ENAXI:FFFFFFC0848BE790| 0000000000000000 FFFFFFFFFFFFFFFF ................
> The address of the global is 0xFFFFFFC082EDB180 which value is '/proc/self/cwd/prebuilts/rust/linux-x86/1.82.0/lib/rustlib/src/rust/library/core/src/num/fmt.rs' and its viewinfo is 'vmlinux\Global\__unnamed_357'
> The original size of the global is 0x5F
> The name of the global is kmalloc-2k
> The module name of the global is 'core.27758904ccee4c80-cgu.o'
> 
>    NSX:FFFFFFC0800A7D4C|F800865E  asan.mod.:str     x30,[x18],#0x8   ; x30,[x18],#8
>    NSX:FFFFFFC0800A7D50|F81F0FFE            str     x30,[sp,#-0x10]!   ; x30,[sp,#-16]!
>    NSX:FFFFFFC0800A7D54|F00240E0            adrp    x0,0xFFFFFFC0848C6000
>    NSX:FFFFFFC0800A7D58|912E8000            add     x0,x0,#0xBA0     ; x0,x0,#2976
>    NSX:FFFFFFC0800A7D5C|52800961            mov     w1,#0x4B         ; w1,#75
>    NSX:FFFFFFC0800A7D60|942337E8            bl      0xFFFFFFC080975D00   ; __asan_register_globals
>    NSX:FFFFFFC0800A7D64|F84107FE            ldr     x30,[sp],#0x10   ; x30,[sp],#16
>    NSX:FFFFFFC0800A7D68|D50323BF            autiasp
>    NSX:FFFFFFC0800A7D6C|D65F03C0            ret
> The second __asan_global struct value is 
>    NSD:FFFFFFC0848C6BA0|>FFFFFFC082EECA80 0000000000000020 ........ .......
>    NSD:FFFFFFC0848C6BB0| 0000000000000040 FFFFFFC0836DC431 @.......1.m.....
>    NSD:FFFFFFC0848C6BC0| FFFFFFC082EEDA80 0000000000000000 ................
>    NSD:FFFFFFC0848C6BD0| 0000000000000000 FFFFFFFFFFFFFFFF ................
> The address of the global is 0xFFFFFFC082EECA80 which value is 0 and its viewinfo is '<&usize_as_core::f..vmlinux\kernel_9a6cb9fd7c8dfd66_cgu\<&usize_as_core::fmt::Debug>::{vtable}'
> The original size of the global is 0x20
> The name of the global is kmalloc-2k
> The module name of the global is 'kernel.9a6cb9fd7c8dfd66-cgu.o'
> 
> > Cheers,
> > Miguel

We have KASAN builds with android16-6.12 and haven't seen this issue.
Can you share your entire config file, so we can try to reproduce?

Cc: Alice Ryhl <aliceryhl@google.com>
Cc: Matthew Maurer <mmaurer@google.com>

Alice, Matthew, have you seen this before?

--
Carlos Llamas

