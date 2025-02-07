Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49082C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 21:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6XMDBGWHjm28kopyGkEygbqgRtjfyapFQf4AL4yI3g=; b=dKviatPDJMQL8W8h7RSyyHWJSB
	8OT60vz5Xv3KF7znQnZwPONO9eXMbm9E7jYFKJU0dhC153qwb9D1wElfy2ZlkzuUBt3F2akXCo+Ey
	tQulFu2ppGldRFOgQwAapSRiuKffL+fBwQflMufVz0ddt5t0rNvfiR936+IgeYvyWoHzN+Gty1LmE
	gBl8WnswsVQEuXraBizyxguWUlBvfYYvN10Ot3SzqU0MW0f2QgTRpVu5O2xAeJTu0SY4bipFXHJZF
	ZqG15AyHFq2yYUh1HvQkDsdkJiNCn9C6yu1IBdvD+cf+EaNpYFjTCXkUqGJX73Ozlte9PrJ4+ImDm
	UE3z96TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVqJ-0000000BCM3-0agl;
	Fri, 07 Feb 2025 21:24:55 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVou-0000000BCCi-0brW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 21:23:29 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21625b4f978so35605ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 13:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738963406; x=1739568206; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6XMDBGWHjm28kopyGkEygbqgRtjfyapFQf4AL4yI3g=;
        b=XxQQfYzrbGBdIRuvJsYb9rXOnefCTAcdPBfd5sO9tx0QJ+LxF5YwD4+cewnAXmJW60
         WZyZpoANB2hPhuyJEiycAoOyad3UluYFJuXMumNjgcYZlDSnCFs1PSP3qoLamJjPaaJz
         HVpEX/zMakpJtX6z4HnCdXmd7fO1ac/4XwylqIGT5+JeC3GtyDFxl5uYRiUikJk1d+/P
         Rq2LJfB5Rg3mWKQhkCMJXFHkK/ioMJQavi5d6uHuG5S3oqi7Rv8gyT6LexANaFaIG7lU
         BgXrpH0mg3wirjf8CzeAjBfjKjuLLXt24ACDLuI7sTLVNMTAq++IqwbT2NYyTsxWYcHS
         fpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738963406; x=1739568206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6XMDBGWHjm28kopyGkEygbqgRtjfyapFQf4AL4yI3g=;
        b=T5rEMi3XrZxzB5Tr7VEegdzcWHsmIctprVDDtzlJOkeQv98Tbk+vmWd8m7IEvKdpm9
         aqo0CnwEIDqNxOgoy4uhc6FpY0Mz+Px4EK18eJ12xkThbMZAr/Se18rsrwXGEUmOoM/6
         UzIyeNOTifiIScrfGS1lmzbIAt770b2TfU4+yVvoZcC/h5pL61q0vrtDtm2sY20tdill
         Tg81T6mI4jG65wCYMB51/ddz/Eq3izRK5rlUE6ugsFqcuiNpVYq2/qRlSxw1qrNJ3qDP
         S4rTGCMcgG9e5a3r7319wg0L3VK/jw0C/WTRcMY9oENA5YBB0GaNQKR/Wob3J0RpMvu5
         XkUg==
X-Forwarded-Encrypted: i=1; AJvYcCXyZrk1uvcxUaNlhJst3+jWZkROalN4bJ7/KSavDvhOApbg43v145xRtsP9RosEEGP9p/xwIUtS70biP3M0nSk8@lists.infradead.org
X-Gm-Message-State: AOJu0YxTyEY4FFAAkVgRftotxJSQdB0CI2oHzplG22yGcfi/hym8M93V
	C8RUJOUu0yho/X9ZPiGPQo+pKc35mK6yhhHYyhoJxpDMjsBrXzQlYr0CrUk8nw==
X-Gm-Gg: ASbGncs5y8v+8KNjMRZmCtsAhXltqex9KttFQeVRKZE0epmnZSwUm94pSVTvWXfeRfo
	lFWMOl/EKhZ0EgkYhbkVdxTOXg8unq8jLhVyaOi8a6kevH2rJhjzyC2zy3jexoLWMBHoNLrFwgD
	7D47ruS4qLbfo5qlaIgACpHdcjxEgMGqwjKdTNRcKqRixmjtB8fElC0mg87MJ6VhJCD111KQytL
	Vil6V83oanethWHoUwsgb0L/Yn3ykVgGQKuBVX6b69Ss3wdW8jjH4TSM5U44WdfQzF+x4kBMUiH
	PvG6LQgRyxx4PJBSWEgZIv2SqPbpZK2zWjOVVgpBWGNc8KVYaA77aA==
X-Google-Smtp-Source: AGHT+IHso8RJPb+vtNaFlFpohsHAMYbmR3QFQJHAAenGlRgMQKXQ54uhWmZuUpEKK6ELwZyS2450Bw==
X-Received: by 2002:a17:903:3348:b0:216:201e:1b63 with SMTP id d9443c01a7336-21f69f35c2dmr461955ad.11.1738963406326;
        Fri, 07 Feb 2025 13:23:26 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048bf1504sm3593423b3a.108.2025.02.07.13.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:23:25 -0800 (PST)
Date: Fri, 7 Feb 2025 21:23:20 +0000
From: Peilin Ye <yepeilin@google.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bpf@ietf.org,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	David Vernet <void@manifault.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Quentin Monnet <qmo@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Yingchi Long <longyingchi24s@ict.ac.cn>,
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>,
	Neel Natu <neelnatu@google.com>,
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 4/9] bpf: Introduce load-acquire and
 store-release instructions
Message-ID: <Z6Z5yLETaJ38TvqR@google.com>
References: <cover.1738888641.git.yepeilin@google.com>
 <d03d8c3305e311c6cb29924119b5eecae8370bbc.1738888641.git.yepeilin@google.com>
 <cff3dc9eaa592dbe634e336eb83f9bb47dd9705a.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cff3dc9eaa592dbe634e336eb83f9bb47dd9705a.camel@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_132328_186024_279087B5 
X-CRM114-Status: GOOD (  14.69  )
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

Hi Ilya,

On Fri, Feb 07, 2025 at 12:28:43PM +0100, Ilya Leoshkevich wrote:
> Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>

Thanks!

> s390x has a strong memory model, and the regular load and store
> instructions are atomic as long as operand addresses are aligned.

I see.

> IIUC the verifier already enforces this unless BPF_F_ANY_ALIGNMENT
> is set, in which case whoever loaded the program is responsible for the
> consequences: memory accesses that happen to be unaligned would
> not trigger an exception, but they would not be atomic either.

The verifier rejects misaligned BPF_ATOMIC instructions since commit
ca36960211eb ("bpf: allow xadd only on aligned memory"), even if
BPF_F_ANY_ALIGNMENT is set - so this patch makes the verifier reject
misaligned load-acquires and store-releases, too, to keep the behaviour
consistent:

Specifically, check_atomic_load() calls check_load_mem() (and
check_atomic_store() calls check_store_reg()) with the
@strict_alignment_once argument equals true.  See also selftests
load_acquire_misaligned() and store_release_misaligned() in PATCH 8/9.

> So I can implement the new instructions as normal loads/stores after
> this series is merged.

That would be great!

Thanks,
Peilin Ye


