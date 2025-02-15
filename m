Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF54C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 02:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AlsOGf7IVfiuJuWsz4rHg+FclrcKaAc+bMOJnywnodY=; b=iRcnTkKYX+niCd9Nv3E7tklGMR
	h3pKAGdisBH5r8Kbe1ohHXX+j7cV2WPO6Q53Szt/rCeE6yEAqXrJTe38fo0i8ZjUA0tZQN1JB9LjG
	AYao32xW3r8cvlU/WkGAE5XRRuXfk0jw1YRz5NUIkTyhsU7gH0kLgu4UnhyhlqOhLl+dgoUuFIGFB
	Na/AkzZ3Ftvob2D0YAuWHKYohzP+AX9mkCNlL7Z6hqs+dWA0lN9WIqUbZ+6VPw/FX2qJUkFQb7/fg
	sVbK8Dm13E5z/DXuVDZ6KvJFSdp1+3Ojjy5ygI/DmWvOT0RcMQWzeDs122sxzQKorfw7zEjB7g3r4
	JVRX5Nng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj82B-0000000Gr1e-2TDe;
	Sat, 15 Feb 2025 02:35:59 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj80j-0000000GqtY-3cue
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 02:34:31 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-220e0575f5bso70955ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 18:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739586868; x=1740191668; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AlsOGf7IVfiuJuWsz4rHg+FclrcKaAc+bMOJnywnodY=;
        b=Ck67rOwn8NmsZp8bcvAMup0O5n7/R3jWpAZ8nGjbypPjMelE+HNn/AHqxW6NJ93EO+
         I8e8ocsf1PFeUo3RjhjrzzlF7g+mgj+NYiZ9Vm3cUQ7yRujy1EBelk42iSM1QoiqHwEF
         G2fGCkIdgzTXomqktL7dpuh7f7O9thwT6We4t4Q0muPxA0uvxWjBLnnySo8lCW+EPzoO
         7tYQAJNCJerFnfVB3HsWak4F2GhmwQzGxzKvuYoO4XNWMxjh6pqKxl93pbpCstObS4/k
         lnX5HVX7aGEshomeRvFkBCT9TirOZlAg9dAH1UaVY745B1qW4hmQDak0Bzloe6APo09/
         Ha8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739586868; x=1740191668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlsOGf7IVfiuJuWsz4rHg+FclrcKaAc+bMOJnywnodY=;
        b=wjrwBXSDA5HUC9Fe8dO7RDi7sWrSw462vJMc9hDEKuXaZO1Vw7DkN0c2Qp33HD2cbW
         lnJgIp/vDpG3sQ9kbQDtSR9kFRBqVWnanwlPUIX8sfi2yrfCOKU5h33hlcfApEaU/x9m
         0gx16Q9aUfobCUaHLaguNgg+p4/sFtcBGNJxJcMwDa6x5M0pmrLhQfpmJbCmn4uW/NrH
         tnXDm7gc8Yvfb3sI68ZrND+hdHb9SVkeDxRA/CI60S2JS0r1+oPAJGU/66zkGw9qQiFK
         DgOZF1B62KwHz4JXuwXBti2EFXX+ezZ8/rnzrXco1M7gC/x7+SqmRd5uoBD8EWgJBK1E
         4bhA==
X-Forwarded-Encrypted: i=1; AJvYcCVn8wIdCMhzPgn+1poFrimyXYrzVY5FXA+YHFagJ6JjM2uVbCIAYXMSX/cwBQjOtCGit79YaJI6CQwuROs0erAl@lists.infradead.org
X-Gm-Message-State: AOJu0Yxgpmi7EpRP08Dyb0BiYn0Q9GcPzxxly2NMtaFEkeDRkKc+GCzQ
	0VOh2PmrS3VTnp6T83iX8hHug0DUYg5kyAT4bMsI/Won5o/bDRJgfoXMorrQZw==
X-Gm-Gg: ASbGncumidfoOqDHL/sCeEptMevXhP/5nLZqwdQz8FSOi+lxv0UOQI3e6iMGurZEr0v
	UCdkO9ydiwCdRMqok2PJtTTpZwP22rMiAXIv6iInwNKxoV14y3Z+Oq22HwhV534Bd3p0vPTXZEj
	xhPOInIXwGr3PgfVy9WL3PijUrzeyejjWgdcBI7PsFU4z6EiynJO3BAz6B4ht8mEz9OCzS7W0eH
	GPCbn/GXc0OiWci9CP552XHEBAtRxKsrmGzEcn5+tXeKxd/XAiCzsj7l7u6n8euZ7oUu5iJXe8Q
	aYQ2J5mtSfOtIHbWlTcyfVFajwNJrmHda0XNoohe991l7XbCFWlO3Q==
X-Google-Smtp-Source: AGHT+IGfipWS3lePNyfw2OAnUDFzBPOd2RcLjMRS5BFNs2D/0kpSqL2ZxDnM8Wu4sQ+j1giPIanbUA==
X-Received: by 2002:a17:902:e883:b0:215:7152:36e4 with SMTP id d9443c01a7336-22106004f44mr574015ad.27.1739586867956;
        Fri, 14 Feb 2025 18:34:27 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d556d66fsm35562035ad.180.2025.02.14.18.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 18:34:27 -0800 (PST)
Date: Sat, 15 Feb 2025 02:34:22 +0000
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
Message-ID: <Z6_9LgfOMeR18HGe@google.com>
References: <cover.1738888641.git.yepeilin@google.com>
 <d03d8c3305e311c6cb29924119b5eecae8370bbc.1738888641.git.yepeilin@google.com>
 <CAADnVQ+L0h8qXfYkC3+ORyQkXFJ2MgO8FDHr_Ha0QMAtS_ujag@mail.gmail.com>
 <Z6gRHDLfA7cjnlSn@google.com>
 <CAADnVQLkHA9LGv99k2TZOJEGUU=dw=q6nVurJ=aoh0v6cFS6zQ@mail.gmail.com>
 <Z6qC303CzfUMN8nV@google.com>
 <Z60dO2sV6VIVNE6t@google.com>
 <CAADnVQ+OyoBPOJk6dcUFozTt0RD-o-hHdR4Dgy+dK2r0uHyC7Q@mail.gmail.com>
 <Z63aX0Tv_zdw8LOQ@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z63aX0Tv_zdw8LOQ@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_183429_926948_FD67B4DF 
X-CRM114-Status: GOOD (  15.22  )
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

> On Wed, Feb 12, 2025 at 09:55:43PM -0800, Alexei Starovoitov wrote:
> > How about:
> > #define BPF_LOAD_ACQ 2
> > #define BPF_STORE_REL 3
> > 
> > and only use them with BPF_MOV like
> > 
> > imm = BPF_MOV | BPF_LOAD_ACQ - is actual load acquire
> > imm = BPF_MOV | BPF_STORE_REL - release

Based on everything discussed, should we proceed with the above
suggestion?  Specifically:

  #define BPF_LD_ST     BPF_MOV /* 0xb0 */

  #define BPF_LOAD_ACQ  0x2
  #define BPF_STORE_REL 0x3

(And document that BPF_LD_ST cannot be used together with BPF_FETCH.)
So that:

  1. We avoid "aliasing" with BPF_SUB or BPF_MUL at all.

  2. If we need to add cmpwait_relaxed, we can then expand imm<4-7> to
     e.g. imm<4-11> and do something similar to:

     XCHG             0x0e0 | FETCH
     CMPXCHG          0x0f0 | FETCH
    +CMPWAIT_RELAXED  0x100

     So that <asm/cmpxchg.h> operations can "stay together".

  3. In the hypothetical scenario where we need seq_cst loads/stores, we
     add new flags to imm<0-3>.

Though considering that:

  * BPF_FETCH doesn't apply to loads/stores, and
  * BPF_LOAD_ACQ and BPF_STORE_REL don't apply to RMW operatons
  * We only have 15 numbers for imm<0-3> flags

I do think it makes sense to define BPF_LOAD_ACQ and BPF_STORE_REL as 1
and 2 (instead of 2 and 3).  With proper documentation I believe it'll
be clear that load/store and RMW are separate categories, with different
ways of using imm<0-3> (or, different imm<0-3> "namespace"s).  That
said, I'm happy to do either 2 and 3, or 1 and 2.

I'll start making changes for v3 and the LLVM PR, according to the
description above (with BPF_LOAD_ACQ=2, BPF_STORE_REL=3).  Please advise
me of any further concerns.

Thanks,
Peilin Ye


