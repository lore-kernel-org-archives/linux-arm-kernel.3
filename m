Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAFCC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 02:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uprm3w7QSLW+3a1cofYW+cceQk8H3e14YKGxf9c5SEc=; b=h4USmSlFDH11V6eHTeYYf4hham
	X1YK4XRp+DaS4AXba+1cLGQ6fEFfbYJcQHDNDIAjLjhW8jkiqsx+LxiA9QkzLOdwcOBAzphD0pKU8
	PaL+VwM/E4mDJmuzQuCZOK2206ETlYAJ7DugTU7SXLZSJCd5BgPQIVtxKPL1KrK0W1QTU0fzXwLww
	G3Ca3SyzlVLEZ5fWjMfDdwEW4wADIbj/9TwcGhYkOkOJPrapyY3AqrN4+stnkn2/G7/uzGCkV/p69
	TWwNS5BAIZgSvdIsH9uQLhVkwW/c8ozR419EqXV27v1Sl2IBX/cUJk/1Fq9RBpddnivEPtfvKiXIU
	7cGkPiCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpHz1-00000002tfR-07Ck;
	Tue, 04 Mar 2025 02:26:11 +0000
Received: from mail-yw1-x1143.google.com ([2607:f8b0:4864:20::1143])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpHiO-00000002rYZ-19FG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 02:09:01 +0000
Received: by mail-yw1-x1143.google.com with SMTP id 00721157ae682-6fd80f30ba5so13460187b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 18:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741054139; x=1741658939; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uprm3w7QSLW+3a1cofYW+cceQk8H3e14YKGxf9c5SEc=;
        b=NFug7SEYCd1lfKTdK88HKYLyWiV6DkiffG0HxR3QKVt/DHDZ5M943OlO+Doxy1ilzh
         HwVmhrJ2iovZtmgqDpxhlmKYg3VS2W/UA6e/CEnsu9MP2hNlsdE1n+NPkiJZ5LT3y9Nb
         LDyNz0lfxE62Pyomjp1LdLA46MPk81eZTMivlGYBLy9NQc+X9yK956N0OlACsCz8C6a+
         WUG5gMsaOF9i6/Olcoz4Ou9a7Ta2PkWJsVYVaWKVVHlrvad42YJLsbzpGGr6rC7Yp5/u
         z0EPoc7Bw8WjGx4wNnrIN0NNsmCfZvHhSOky7Kqg0++Boanc2RevJQAQg5SxPQhDkP+P
         f4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741054139; x=1741658939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uprm3w7QSLW+3a1cofYW+cceQk8H3e14YKGxf9c5SEc=;
        b=lKr4CmF921ViLuHXm1AuHP4rfrAcDyt+bkUNBhXQXH2EdyRZDSHxet7HIKztCTXQkx
         /Q65R5kCKfjqU+lHJq8XPnZMod1EicOGM/xExYeRshMW3kWwbHt+ZTx1SstJu+KXgdsG
         hmu7tO6rglF8kClEKKST2LEF6pwkgNlz28Z4LXcUnw4apFdSqV4WeIe6+yM93Utbrsac
         B0XpWp9kfMqwz1L/xBxYfMy3evPIavxS/pcHfqXf+pQtPPdO18XQiLDF9AgpZ+sSyNTX
         P9KW/oatf2F0VKrbxTxuC6PoCPMD5imHUHg40r3jwddXGlseTDd2sUE5meXx8LjNDvdp
         adpw==
X-Forwarded-Encrypted: i=1; AJvYcCXMQgm5MJj5YNMBZRHv0cuTpefNXCD6eLKn7hzeV0bHhvdszriMW/4Ok9dZ9hzdvZ4AsU9fKosO7LY1qYMkJApK@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7mx905zLyDE+PM9CyJuAL1Xi6FHu58BvNQcqIZEsGw9iBIcLY
	mjoy29uvfgCIxTFkMmvB8ukABw/7/YQBrcGWyVSP4BFRJaXdYIdKiL4mqgE/1Z3MoTzBWCzeIOT
	T+EnqaCR3bX0LMGN97MH82y8D1P4=
X-Gm-Gg: ASbGncutCLJdz5XAGz20UdVZH/2Q41I1QuvYSqZXteN6ZqpGb5s9ThqhQ5ngJXUzXVZ
	uOST4eJSFBwfEXqQHZFVeZsr+XotUcou+LUCdjU4hp2bZ3caFBXQkrScD3TQOBuZIt2/4SleyWP
	csET15n6+TZyqJtn7ddl0vRyv3mg==
X-Google-Smtp-Source: AGHT+IGNh2K54VaqDxAbwZPq6ghZwf/0d9iTd28qnutLtwuc/n0G9myX7k8yUwefwHhFhOUKlgvRS6Iy3hX/wt2iX1c=
X-Received: by 2002:a05:690c:3506:b0:6ef:6fef:4cb6 with SMTP id
 00721157ae682-6fd49ea038fmr219227267b3.0.1741054138974; Mon, 03 Mar 2025
 18:08:58 -0800 (PST)
MIME-Version: 1.0
References: <20250303065345.229298-1-dongml2@chinatelecom.cn>
 <20250303065345.229298-4-dongml2@chinatelecom.cn> <20250303110559.5a584602@gandalf.local.home>
In-Reply-To: <20250303110559.5a584602@gandalf.local.home>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Tue, 4 Mar 2025 10:07:22 +0800
X-Gm-Features: AQ5f1JqbmerWbAPhQH3CompG0G6GUmmcqJsAR9G321CVuef2yZdxRX3kR81QiyY
Message-ID: <CADxym3ZJf3TEMwCy4JVT1gs9GP=U1n1qss3ycnuMZVyp9TfDdw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 3/4] x86: implement per-function metadata
 storage for x86
To: Steven Rostedt <rostedt@goodmis.org>
Cc: peterz@infradead.org, mark.rutland@arm.com, alexei.starovoitov@gmail.com, 
	catalin.marinas@arm.com, will@kernel.org, mhiramat@kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, yonghong.song@linux.dev, john.fastabend@gmail.com, 
	kpsingh@kernel.org, sdf@fomichev.me, jolsa@kernel.org, davem@davemloft.net, 
	dsahern@kernel.org, mathieu.desnoyers@efficios.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, samitolvanen@google.com, 
	kees@kernel.org, dongml2@chinatelecom.cn, akpm@linux-foundation.org, 
	riel@surriel.com, rppt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_180900_305473_5A45801D 
X-CRM114-Status: GOOD (  12.03  )
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

On Tue, Mar 4, 2025 at 12:05=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Mon,  3 Mar 2025 14:53:44 +0800
> Menglong Dong <menglong8.dong@gmail.com> wrote:
>
> > In the third case, we make the kernel function 32 bytes aligned, and th=
ere
> > will be 32 bytes padding before the functions. According to my testing,
> > the text size didn't increase on this case, which is weird.
> >
> > With 16-bytes padding:
> >
> > -rwxr-xr-x 1 401190688  x86-dev/vmlinux*
> > -rw-r--r-- 1    251068  x86-dev/vmlinux.a
> > -rw-r--r-- 1 851892992  x86-dev/vmlinux.o
> > -rw-r--r-- 1  12395008  x86-dev/arch/x86/boot/bzImage
> >
> > With 32-bytes padding:
> >
> > -rwxr-xr-x 1 401318128 x86-dev/vmlinux*
> > -rw-r--r-- 1    251154 x86-dev/vmlinux.a
> > -rw-r--r-- 1 853636704 x86-dev/vmlinux.o
> > -rw-r--r-- 1  12509696 x86-dev/arch/x86/boot/bzImage
>
> Use the "size" command to see the differences in sizes and not the file s=
ize.
>
> $ size vmlinux
>    text    data     bss     dec     hex filename
> 36892658        9798658 16982016        63673332        3cb93f4 vmlinux

Great! It seems that the way I tested has something wrong. I'll
compare the text size with "size" command later.

Thanks!
Menglong Dong

>
> -- Steve

