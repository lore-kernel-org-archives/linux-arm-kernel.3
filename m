Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749ECC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 23:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzD9w/10Tg/Dbaxqt0ZLJaS8jBU14ki/gg5wLfoid+o=; b=RX26UP9u8I5p9pRn1PQ8CRLID9
	B9H5b/KhFBPE6DbWvaO9kwLZFGsXkzRb3Th2v3hA4gChdAbPoAOiD7MH6BcLrKOMq4L8xl8hbzl03
	YxnL+8SRxLqcDXGx89wGc/eO2hArpaMuwgIlA6CG1iq++2lVcejMg7m7Qo7aXtbzCIsI48oDVOQcB
	WkOh9xQkNFK+0N1W/J5MQ7zUpPS99TeTDZJ2QYl8ggKM7yt7LP9nYnJlH/f9L1qu+Xm1Zmw1x6NPG
	VtHErDdNqvH9f43Brgli1cHjFejZ1IW1tUMehmE8n6/q83+pe7wAdc0Kzdf+RwvfB36laExrFAjJ9
	bi8HrF6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thcxB-00000001o1W-0NE7;
	Mon, 10 Feb 2025 23:12:37 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thccY-00000001jZf-1ry2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 22:51:19 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21f8c280472so21005ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 14:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739227877; x=1739832677; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kzD9w/10Tg/Dbaxqt0ZLJaS8jBU14ki/gg5wLfoid+o=;
        b=dbGbQBxhnhtQTni4JHeQlZr9kgP6aKBdYYeX2iXXrbIIw8X4ea5ar2cLhMf9B4ajv4
         U0WH64ye/cNQzHay//+MXO1FNXkX63b0ypc1jX3je9ewMndTLyaHyRiVtIvcsrCEzYLr
         z42bJDb/+Y1zEhGEF91dtQRl4Z4+EB6sPtZvSBCJSh94kds0e8HnSA4HYZXq/kUCbXf1
         E6uY2u6R30Cew9KCGZORBrPydMSyjTDQImsCnf3B+WUo2n6uyJfNCFApe7HMFl+aADNI
         yvlcg5DQ2IJweJjn1CCOWMZKo/UUgmlqU2MzpJDOgYBq7jyisaetYZmSR5Mw+968Rsd/
         iUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739227877; x=1739832677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzD9w/10Tg/Dbaxqt0ZLJaS8jBU14ki/gg5wLfoid+o=;
        b=cEphKpar4GYAH58Qpn+QIUvLlVjunlW35D9EmqX4mraIO6+01WUXwOnjKxJ+Q/F6M3
         +/c/nDfiSA6BNFCdy8lNdnhCJCwG8N1dN1clujJQgMDrn/dao1LEmTrQ4EBktMtP3x4+
         70zRei004jXNi7hlOkel+trLAv+0oh4EzZzZemvyr6CyTMCA5EgPR8xJMuIoedngAZ+0
         A7k9t3rcz2tPd1H5YaYhg9R8K4OIQJaONhHszzvjxd46YcsVTFXB6ZS7cVHBBo6NDzqe
         Bvxx59KHhytXhvxmPkkf2bJKkJnr1sddm8m2ML2cZ6Zlhpt/mX0QwHUXDuEZotP/8Zhe
         JcFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWi4Fz3sD/BVdBlmNXJV8x+Ke37N+CHrL12fq+QqfECrOla9yeymByYshTk9EuxvQs9oaAMY+A12I1qKBohqKZI@lists.infradead.org
X-Gm-Message-State: AOJu0YwM9/7olUM2AFwYg4lVRpsqEIbXGs03h2M9Wa3rMPL6HeEvhUK+
	bKVtDkXnEd0A0vjDZO43bZs/oyPgbMyk4mu/6PXhfdkt/pTzDIbV+z/XJ6ndzw==
X-Gm-Gg: ASbGncsF6tlvOgC7BCGQEGBuJK6OuWIfNhqhfKXI7oPv1fhSN/Fck8HJHhuAnee56bM
	k6kCdQFKpKYlBNuYVnyF1eL4P2SFPNOtoykCofX3sETIb/9uMjjdtWTTnXV2pHhIBtoYnorRUhN
	XH2Sp0iiMNbyiXC17P6ygbDMTFzH8pIkkkqEh5yXhFSmx8mB2iLPK2lCn+9z1gFr56ShC9oyflf
	ynkD9H9g3Pnqo0awu1p7YkRx78HfS4u/1BRFK5J9tXpQj96+PnCousOB3Wbar0LcO1YV2K35hnJ
	0LPJjmMsHOPTDsQPbhvfIW5trOZ1TmP+YxhjDdzyD3KXo5bO+xcwMQ==
X-Google-Smtp-Source: AGHT+IF3MLc1SEMp/5ggqyCFt3vZ33zwtCZnr32F33srmpgWaKSJcp4xjwvbrjeQxnAK8XCWIX7FIA==
X-Received: by 2002:a17:902:ce08:b0:212:26e:1b46 with SMTP id d9443c01a7336-21fbb511b0bmr260955ad.23.1739227876395;
        Mon, 10 Feb 2025 14:51:16 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368d8ccbsm84732645ad.255.2025.02.10.14.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:51:15 -0800 (PST)
Date: Mon, 10 Feb 2025 22:51:11 +0000
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
Message-ID: <Z6qC303CzfUMN8nV@google.com>
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
X-CRM114-CacheID: sfid-20250210_145118_486321_502724B2 
X-CRM114-Status: GOOD (  15.33  )
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

On Sat, Feb 08, 2025 at 07:46:54PM -0800, Alexei Starovoitov wrote:
> > Got it!  In v3, I'll change it back to:
> >
> >   #define BPF_LOAD_ACQ   0x10
> >   #define BPF_STORE_REL  0x20
> 
> why not 1 and 2 ?

I just realized that we can't do 1 and 2 because BPF_ADD | BPF_FETCH
also equals 1.

> All other bits are reserved and the verifier will make sure they're zero

IOW, we can't tell if imm<4-7> is reserved or BPF_ADD (0x00).  What
would you suggest?  Maybe:

  #define BPF_ATOMIC_LD_ST 0x10

  #define BPF_LOAD_ACQ      0x1
  #define BPF_STORE_REL     0x2

?

> , so when/if we need to extend it then it wouldn't matter whether
> lower 4 bits are reserved or other bits.
> Say, we decide to support cmpwait_relaxed as a new insn.
> It can take the value 3 and arm64 JIT will map it to ldxr+wfe+...
> 
> Then with this new load_acq and cmpwait_relaxed we can efficiently
> implement both smp_cond_load_relaxed and smp_cond_load_acquire.

Thanks,
Peilin Ye


