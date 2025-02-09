Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B21C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 23:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8r8GqE7AcCzw/ZhoiEBDX6FoohFVz6Qw8VfxhrWWFOM=; b=3xbsMm83B+ocjoiHLfHZcfpEbm
	GBjkGxOgunFX7i8FMxGBN8RwSkvMb6DQ5xodQrB5lW8w5WSuWVK22PDZUaWsvqyl1JHf3lNoq24sG
	14AYs2aFNPkTT7vpfTx1htvjSnFUbqlbRY694lUz/XUTlBvp5/x+6wG3Dzy/tXv/ZV8d/g9BBtBb8
	fpMo7YDUs6VyyDajHM7koEpKzeryYMH6M0FahDR/42wAykvrssN/PcmL4eiH5TQHttm0p2JYyOMYl
	1hLpgSOD4fd7OIuoG0jBeA7DKB1PCj3gzy0/1LS3brch0uK1P2QrVGD6HEHlubdyigr0XtEWNucla
	QEnI9Ktw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thGxW-0000000Fmxs-23Vx;
	Sun, 09 Feb 2025 23:43:30 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thGw7-0000000FmrN-3G2b
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 23:42:04 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21f72fac367so98735ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Feb 2025 15:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739144523; x=1739749323; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8r8GqE7AcCzw/ZhoiEBDX6FoohFVz6Qw8VfxhrWWFOM=;
        b=quLgJxkPeBAnQQ3MLb1qAhqh3RbsK4OllSvyqGU6YYsH0sRADEERGBTcoergNgIZl9
         b9zybbQ1VfPZH19OEE7Uz3NyK0rO04/qQMVrEqBT2H8tcDssroPaKhV2ETJtxkH5Mv3e
         fIWNsE/E1QsgGoMn2wnfqmqKFCZN4MKHVW2+2nemtnWlJ5u7j3WWnFOluOGovf646WSl
         KRlW4hUZCKSvwc2z54ezf9YiC+vI3jsqEos4axDY2gCTBRkK3GNlM4omIk411/qpFOWK
         JQ1nl82sM4PVQe8PG2P7kJszOjwHu4R/133wOIo1GMSoLICtFdEUEhAndLUJxx5qHXnA
         p6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739144523; x=1739749323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8r8GqE7AcCzw/ZhoiEBDX6FoohFVz6Qw8VfxhrWWFOM=;
        b=sSmyYVDByH/AYoo2xwgiBQy92CrvtPZSvItqPUqmN1BapEm3djrvDvLSWcTLjsF55G
         FaNE0tESciibY4DrFfnt6vB+Xu2nPWCPjGV1nQgo5ax40tUa1dBs/SvlDSESJFA8sbSL
         5HK0tBza7l4LiTYZmKSDK07s2FXVbqV8vGQ8D70ymFLKtzfwzFEXxjoCvQAPQwWQU6Xd
         mIV32c+GYsH5SfgDCDRUHiUNOfGeGOSzaGbfizOdduTBcL71xjPtixLv4rNj+vCB7UEl
         f+MBcZYD9IVpPQSC6yORThkfOWEeWlCXRqKf5/oB0Q6yjE/h6uaIP6m6UaujTn283nsg
         1B1Q==
X-Forwarded-Encrypted: i=1; AJvYcCX+gCT6F7PIRpHFWoV6xgBRRk/I6terwRUCxKHk3fAlJGdAGEQJHHMMH9AVfJG3ZEbjD5xziD8uvAeiwBRKMB8j@lists.infradead.org
X-Gm-Message-State: AOJu0YzXtVPib2jYv3LQYA0d62W+eoXs6W0KIAnvYyWjEMJuEOCm2Lm4
	HAmkcbI+Of1P+uvh8WKyTONi3A2ld7brkwE/VpgpcyYID0nxiMMWm/svR6LXHA==
X-Gm-Gg: ASbGncvSRlSpSOk/ZvorOKPYBptRjmXFYRWjmENdX1Iy7LrwnwbJofIY9zXIl663u+g
	eFyq8hsF8eGnz+SXpQeX5E9kwWmnCDgqXes0vZd6PjSaBvw7mYwzlsWUA6DcuLIH/pi9fhHQgLp
	M+MVAAu4tSNnwQIiHxnH2dl0GoHME5nntiyv7uXo/pdBwXR1+GguaSz1LPt9qS+rSe3cV5mHBly
	QyQ749hsMhtBYClGTJJqk74b+V3vbPNl7jmi3wiW2Ac2etlLulcZfDzn5K0ggTvscrOrYoekd4y
	5mbXcK8n3squgFz+UOlBrDfusmjRWxuqM43CiAgKFAWsYCds/p2MEA==
X-Google-Smtp-Source: AGHT+IGWHtUanwi++EymoxyoPMciInVawa1/VM+FGRotgFZ32k+cNoaAFIfQ4hVKBEquC6xHERYLiQ==
X-Received: by 2002:a17:903:2406:b0:21f:2ded:bfc5 with SMTP id d9443c01a7336-21f69e53a84mr2650125ad.28.1739144522571;
        Sun, 09 Feb 2025 15:42:02 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51af64c1dsm6573311a12.52.2025.02.09.15.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 15:42:02 -0800 (PST)
Date: Sun, 9 Feb 2025 23:41:56 +0000
From: Peilin Ye <yepeilin@google.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf <bpf@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	bpf@ietf.org, Xu Kuohai <xukuohai@huaweicloud.com>,
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
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Quentin Monnet <qmo@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Yingchi Long <longyingchi24s@ict.ac.cn>,
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>,
	Neel Natu <neelnatu@google.com>,
	Benjamin Segall <bsegall@google.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 4/9] bpf: Introduce load-acquire and
 store-release instructions
Message-ID: <Z6k9RELOQxp67rIn@google.com>
References: <cover.1738888641.git.yepeilin@google.com>
 <d03d8c3305e311c6cb29924119b5eecae8370bbc.1738888641.git.yepeilin@google.com>
 <CAADnVQ+L0h8qXfYkC3+ORyQkXFJ2MgO8FDHr_Ha0QMAtS_ujag@mail.gmail.com>
 <Z6gRHDLfA7cjnlSn@google.com>
 <CAADnVQLkHA9LGv99k2TZOJEGUU=dw=q6nVurJ=aoh0v6cFS6zQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAADnVQLkHA9LGv99k2TZOJEGUU=dw=q6nVurJ=aoh0v6cFS6zQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_154203_835292_C6888A0A 
X-CRM114-Status: GOOD (  17.39  )
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

On Sat, Feb 08, 2025 at 07:46:54PM -0800, Alexei Starovoitov wrote:
> > > These values might imply that bpf infra is supposed to map all the values
> > > to cpu instructions, but that's not what we're doing here.
> > > We're only dealing with two specific instructions.
> > > We're not defining a memory model for all future new instructions.
> >
> > Got it!  In v3, I'll change it back to:
> >
> >   #define BPF_LOAD_ACQ   0x10
> >   #define BPF_STORE_REL  0x20
> 
> why not 1 and 2 ?
> All other bits are reserved and the verifier will make sure they're zero,
> so when/if we need to extend it then it wouldn't matter whether
> lower 4 bits are reserved or other bits.
> Say, we decide to support cmpwait_relaxed as a new insn.
> It can take the value 3 and arm64 JIT will map it to ldxr+wfe+...
> 
> Then with this new load_acq and cmpwait_relaxed we can efficiently
> implement both smp_cond_load_relaxed and smp_cond_load_acquire.

Ah, I see.  When you suggested "LOAD_ACQ=1 and STORE_REL=2" earlier, I
didn't realize you meant 1 and 2 in imm<0-3>.

Thanks,
Peilin Ye


