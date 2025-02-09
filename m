Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3726C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 02:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aPYRBH8N0cFSlMms6AVV4eSsR5UK0yhiANnm0hFSLXo=; b=Q427zRrTXRgwdHkLbyG98xiQ7+
	FQqJl+51zmkNZJk83k3QokLvKVNa1tcnW3kLXPVAn9rrDuKn/yiRW9GKIcWeaGdh2b9F+iiAD/2Fq
	8JkKYJcXPNrjkZbzeH15BC1z9U79NbNPnylqxVA5ok0KdzahbG/uLR1rSCUuJP2ZPE/iNhD2CqESK
	nPMU71Gss1W8nARfWAflciuNwWfkRNkATnmK0eCbuO3CnObB02XLQkvG2yUDS/SJNe+SeLTSG2R4A
	5VVtHHjLv5goHHzV30wzJebD46XwDY1/NtE2LsLXqg8ZRQmitB6UuI9RTlLEjWA2NgOZl5EqSqcdo
	kcJbZ6VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgwy9-0000000DuXG-3xRb;
	Sun, 09 Feb 2025 02:22:49 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgwwl-0000000DuR0-3sEm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 02:21:25 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2163affd184so96825ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Feb 2025 18:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739067682; x=1739672482; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aPYRBH8N0cFSlMms6AVV4eSsR5UK0yhiANnm0hFSLXo=;
        b=iiX1lgcJ3VNV+OLM9wp+c1rO3NNaxx6Ii+Ch5ruo/sNZxFHhTD+XK1kP8W7dmOG3Mh
         9c9LWB5YKYJgr1tEXkTMdzarx1tgIVoISk/AIG3sJoLazLffeh6Kkb8QMQfY24Ghurin
         zNi3scHpCc9E3D5MDBbQNMFk0geXN/PIWFBg9sN5IRpdYKyZBYD+2YR3waGi2nZE4CZ/
         A0FV2oN5VITGpPuWT3pzI5D0J5MmcZDKwn6hyfKDNIZc9Gn+VZTELcxF5VSZjyNFvXzn
         IPn/78CZRXupYRutPN1ErQ3EES/t0v1zITyzww9k3T/R/oG6LXs+6PEDAUyKvH1rbGlC
         vLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739067682; x=1739672482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPYRBH8N0cFSlMms6AVV4eSsR5UK0yhiANnm0hFSLXo=;
        b=HaRGrhl5BpPo0w70npFMa9wd0NNl+8vnUOG9sX63sAz9rdkIRO5Hxdbb/iMMMqpvbk
         0Iq3kJhHGW+vsin7w3Ko0ddpfG7O/u68xxFBDvFXVrvvGaZrttBa98Gbz7UL0s9P50jb
         BY6zYb93xR5uTM6Tu2ih5IpXV92jO4bvghgPgJgkxRI7YL/Zn7qU1Y7FQ9ajwk/ruCQj
         NkSivg0H9yAL4+9yObKjBiK4NK53ApAqCwNw9o6u7sJWtq7KXeSlyVzJD/qPm76MAlRc
         45R3cZQVNdb9Vre/RSOmgWMFNPNoQ7qBNHOnXjexG7YE+Ktfiv9my4MLzhFGwOthxNva
         eTmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwkiy4MFpXBxU0cOubXXq7nE0/K2AMsYC8nLZrp6S/yt62r/p0Eu1cNPeY8oBEwUmcqUsCTK3FZQ9T0Iqih/ao@lists.infradead.org
X-Gm-Message-State: AOJu0YxdW76TQGOewbxR7MckaEIDOZEdnmSLgNXPtMRkAEVylf6YpT6P
	nOBcNe9Y+uqu9puamHWtBoh4Cem6/vhYzjKb4dCIikgOuGT87lpWyrc6B418Cw==
X-Gm-Gg: ASbGncu9kAaG+pD6UiIaB6fz0/u7bo2gumiIZKO6gQRYvHIhwdRgGL92urXKtoosoBM
	T9zKJDnKRTb4WxP/z5wQvojnseLnRtISqbEnolnDABQPfTvWFMwIdtbKoHHbUIN5+ZG5y0mE50f
	RuuLyQ5DEIgJjvH6TVXloUhg14noVTdKf3aws6jsdhuoSsxkRG0jVKr2c5iWd6nLwKdoKt4NLcj
	no2nlY5uV6OjoMzI4eWjFGBqWLTbDHamzSHaqs71wuJUpmW7jb3oRgSY7rlh6nBnisxGREnqZqS
	cnN7WjHYP/jBcJ2wo6P292Q4aRvqyUWIh8jrW0e4QeoYQSBzsEMSUw==
X-Google-Smtp-Source: AGHT+IEowLr0ODuJvhhRX0k3wQ9ChkhKhAElhUwga2QcQJLk+imc7mKSniosyKtNBmFd0SxXKu92Ag==
X-Received: by 2002:a17:903:144b:b0:21f:3e29:9cd4 with SMTP id d9443c01a7336-21f69e53acdmr2101805ad.20.1739067681888;
        Sat, 08 Feb 2025 18:21:21 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048c15baesm5148861b3a.121.2025.02.08.18.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 18:21:21 -0800 (PST)
Date: Sun, 9 Feb 2025 02:21:16 +0000
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
Message-ID: <Z6gRHDLfA7cjnlSn@google.com>
References: <cover.1738888641.git.yepeilin@google.com>
 <d03d8c3305e311c6cb29924119b5eecae8370bbc.1738888641.git.yepeilin@google.com>
 <CAADnVQ+L0h8qXfYkC3+ORyQkXFJ2MgO8FDHr_Ha0QMAtS_ujag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAADnVQ+L0h8qXfYkC3+ORyQkXFJ2MgO8FDHr_Ha0QMAtS_ujag@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_182123_984686_B6614F8E 
X-CRM114-Status: GOOD (  24.74  )
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

Hi Alexei,

On Sat, Feb 08, 2025 at 01:30:46PM -0800, Alexei Starovoitov wrote:
> > Introduce BPF instructions with load-acquire and store-release
> > semantics, as discussed in [1].  The following new flags are defined:
> >
> >   BPF_ATOMIC_LOAD         0x10
> >   BPF_ATOMIC_STORE        0x20
> >   BPF_ATOMIC_TYPE(imm)    ((imm) & 0xf0)
> >
> >   BPF_RELAXED        0x0
> >   BPF_ACQUIRE        0x1
> >   BPF_RELEASE        0x2
> >   BPF_ACQ_REL        0x3
> >   BPF_SEQ_CST        0x4
> 
> I still don't like this.
> 
> Earlier you said:
> 
> > If yes, I think we either:
> >
> >  (a) add more flags to imm<4-7>: maybe LOAD_SEQ_CST (0x3) and
> >      STORE_SEQ_CST (0x6); need to skip OR (0x4) and AND (0x5) used by
> >      RMW atomics
> >  (b) specify memorder in imm<0-3>
> >
> > I chose (b) for fewer "What would be a good numerical value so that RMW
> > atomics won't need to use it in imm<4-7>?" questions to answer.
> >
> > If we're having dedicated fields for memorder, I think it's better to
> > define all possible values once and for all, just so that e.g. 0x2 will
> > always mean RELEASE in a memorder field.  Initially I defined all six of
> > them [2], then Yonghong suggested dropping CONSUME [3].
> 
> I don't think we should be defining "all possible values",
> since these are the values that llvm and C model supports,
> but do we have any plans to support anything bug ld_acq/st_rel ?
> I haven't heard anything.
> What even the meaning of BPF_ATOMIC_LOAD | BPF_ACQ_REL ?
> 
> What does the verifier suppose to do? reject for now? and then what?
> Map to what insn?
> 
> These values might imply that bpf infra is supposed to map all the values
> to cpu instructions, but that's not what we're doing here.
> We're only dealing with two specific instructions.
> We're not defining a memory model for all future new instructions.

Got it!  In v3, I'll change it back to:

  #define BPF_LOAD_ACQ   0x10
  #define BPF_STORE_REL  0x20

Thanks,
Peilin Ye


