Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15C9C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 00:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1LObash4SiJzQzSayaQdpqyI0vrFPh91JJNVHX4SZoI=; b=kZyI8k6KETK1YDUJIUJfeuWdYv
	TePu73AW1xcnOdCLdaQI7hWJCg8G+DTUQtvcWAJ9xps6LYDe/60ep3VDQ74IGRXaNd3QpBUcgmeNn
	J0fLNzng/1c5Kdot0cogIHMR0S4jXAch7GaW19pQWPnY6wO64pKL8AxbEXyrYUJp/i7Nmn9ceCdxO
	AXvvhiuZD9sh9B9Cwpxhq9xND7MfmBPiMJ4nNhRW2nVxMQFfdl7L6NYwYBYi6SWCPsSJcYDaESdoN
	ip0j4ssDl04ZhOOcp+43cla4y6hYzPLlpZqUU2hwdyuWBkEp2s1438hbpF5EmHjYfmZtr9bwTiMg6
	G2UmAkiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1the2i-00000001xrn-4AMv;
	Tue, 11 Feb 2025 00:22:24 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1the0m-00000001xfZ-3HxT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 00:20:25 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21f40deb941so103811505ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 16:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739233224; x=1739838024; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1LObash4SiJzQzSayaQdpqyI0vrFPh91JJNVHX4SZoI=;
        b=XuRPRI9pPfoBWiIwXjGZzhBtfGP07AZktoYq1T4DQMOWBOdA3vq3NjMZ36RPYFGcxr
         HDYRkU3wcsoWpSjW0vaAme9XRrN358l/qbv45w0gewdzlt3GCDB6JKCbcqgsU3DV70cO
         0XyluGqqKP9QAQVLYyFEMylImGRxWWfxkpSueMt53x8DFfsfCudB5AaI6ZPXeyigKsWJ
         HzCT8nhaajtJ6t4mgch73ENWTYQs8FO/qGtwXtXFwVqPJkrvjvCjLnQ+SAcQv4eLzm29
         lRGjMt1bksRvyRXtVw0Oyk9OZwovhMNGH8EWxJBKww9/acg9RJHHznuSdLxBFaIX/FPp
         e2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739233224; x=1739838024;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1LObash4SiJzQzSayaQdpqyI0vrFPh91JJNVHX4SZoI=;
        b=JK2hFNqXiFql9KFzsv/qVnxVPB/QGFJ1RB7qpixDaCUR1ck1wV3Atos+fgy+HzhRO/
         tr/EdvLEJ/noCK791z0TvzXvl4fQrMdVAt/ihO37U4cpgbPaJKc9yu2YTUiI42glnmYZ
         1t5po4JRf34Zr45FdCOuQyYJ1nkK13Ub9qe/Aj1deEQHAEfUWERB6WhTXPOG8GezynY7
         1hBtL16HuiP5nVMm7c5ksFKgxaRyBHxC/22PsMBApdIOR2cxF3cI11ypdikyNxuTsXL/
         tCM+Au963Mm3bfzNR0eaxvD7BMrPnvN0y2YXzUlt7IS5VF1pd1Za+vjsWF0J4NapEA3r
         R1nw==
X-Forwarded-Encrypted: i=1; AJvYcCXSD2IwRp5sOwncMhlOaqUx8wS5HpimbjFBfLuo1OZl3y93hUnw1oXhlkUP1cNFOfd2HPV1H+5pwWxefujF/LUM@lists.infradead.org
X-Gm-Message-State: AOJu0YyhWpO7uRpZ/WGIlJNyqLLd+DPyvqX6Y6d9AL9JgDAQ2FXs3X2F
	v6JUHE1O1ze7gQZmbltadAxave5WOasAG7yAs5NE3mQAb3IGM9BU
X-Gm-Gg: ASbGncu++O20v2Tk367v5qNnD5iGtFx9fFOPZdBY2zpLw6wDcnrrkllQsEANoMnxGQq
	DDOFgxGP7FVwPkgwYzpyeES2gDlg5P7e2na1enjCRky0bDzL43R3cpj0+mocWseSY2Cb7zU+yP6
	30DeZULkfnfSpvBHi7GPnd0zGpB3MyoPL8xYcjPg8EfBWnqfz6R7z6VBQzlelg+y2iXeBwjW0mJ
	AtDKd8QjN4DQzbHsaXG/2ylA5R2khTlXURtRnq42eTTiu+gg+9uFO8DhGx1vVMtpwdXHO9G5yg6
	38VSur/iLbae
X-Google-Smtp-Source: AGHT+IGfT4HyRk97hCaleORdR2AUGluiKet1yAikZSTi1M9AHOfW+rliwbIgZiso8b7B35AaCA7dbQ==
X-Received: by 2002:a17:903:2451:b0:21f:6c81:f77 with SMTP id d9443c01a7336-21f6c81116cmr175450705ad.23.1739233223933;
        Mon, 10 Feb 2025 16:20:23 -0800 (PST)
Received: from [192.168.0.235] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c555sm85174035ad.182.2025.02.10.16.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 16:20:23 -0800 (PST)
Message-ID: <6a87b140203461f9d56874b9e4a778febdcd47a6.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 8/9] selftests/bpf: Add selftests for
 load-acquire and store-release instructions
From: Eduard Zingerman <eddyz87@gmail.com>
To: Peilin Ye <yepeilin@google.com>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Cc: bpf@ietf.org, Xu Kuohai <xukuohai@huaweicloud.com>, David Vernet	
 <void@manifault.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann	
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau	 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song	
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh	 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo	
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet	
 <corbet@lwn.net>, "Paul E. McKenney" <paulmck@kernel.org>, Puranjay Mohan	
 <puranjay@kernel.org>, Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens
	 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Catalin Marinas	
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Quentin Monnet	
 <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan
 <shuah@kernel.org>,  Ihor Solodrai <ihor.solodrai@linux.dev>, Yingchi Long
 <longyingchi24s@ict.ac.cn>, Josh Don <joshdon@google.com>,  Barret Rhoden
 <brho@google.com>, Neel Natu <neelnatu@google.com>, Benjamin Segall
 <bsegall@google.com>, 	linux-kernel@vger.kernel.org
Date: Mon, 10 Feb 2025 16:20:18 -0800
In-Reply-To: <Z6a_UILNqVGBqnvY@google.com>
References: <cover.1738888641.git.yepeilin@google.com>
	 <3ac854ac5cc62e78fadd2a7f1af9087ec3fc7a9c.1738888641.git.yepeilin@google.com>
	 <Z6ajasn2k559SGNN@google.com> <Z6a_UILNqVGBqnvY@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_162024_825980_4EFFA723 
X-CRM114-Status: GOOD (  11.97  )
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

On Sat, 2025-02-08 at 02:20 +0000, Peilin Ye wrote:

[...]

> Sorry, that wasn't very accurate - we need to make sure there are no
> "holes" in the .addr_space.1 ELF section, e.g.:
>=20
>   /* 8-byte-aligned */
>   __u8 __arena_global load_acquire8_value =3D 0x12;
>   /* 1-byte hole, causing clang-17 to crash */
>   __u16 __arena_global load_acquire16_value =3D 0x1234;
>=20
> LLVM commit f27c4903c43b ("MC: Add .data. and .rodata. prefixes to
> MCContext section classification") fixed this issue.

This is a bit strange, from commit log it looks like LLVM-17 should
include this commit. But in any case, targeting LLVM >=3D 18 seems
reasonable to me, the main goal is to have these tests run by CI for
some compiler version.

> - - -
> For now, I think I should:
>=20
>   1. change existing #if guards to
>      "#if defined(__TARGET_ARCH_arm64) && __clang_major__ >=3D 18"
>=20
>   2. additionally, guard "__arena_global" variable definitions behind
>      "#if __clang_major >=3D 18" so that clang-17 doesn't try to compile
>      that part (then crash)
>=20
> Will fix in v3.
>=20
> Thanks,
> Peilin Ye
>=20



