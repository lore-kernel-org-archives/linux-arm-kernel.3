Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B10FC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 21:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f527JpJGgzYKHPF758VmJ7IyFpSx+9+vZbzdff4JDwU=; b=lhl81kI36zJoD1fjV3Pk+8GGHT
	WGtw7Gz2jhZUDLJLD+mjgp4Mw37uuw0De47SJ5Febb/KKVOpZbNI3+qEyFNcjp5Jb3yJR8jFYt835
	nGNT/g8b4GAngJrRfQ0Z+t/ns36Tj0AiiKVPvpcoN921/h+mkNJBzi8WdPbBQZFRyPvaiDwNBFjK8
	maRBfoOxMfl6RG03dVcdgD1qwEjrev2dJ/UXZwXSHpYVNhoz/ifSBkgAUga4dd7USsB9z6EuFwLSJ
	rfKsBbCIYSKWu3zK/t0s3oryvgc4xr017UTVvWIq/A83ljUf+wVKLvhI2SMI58Tfa2OakhErzN0KF
	SYEKAlOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpDP6-00000002NGM-32Dy;
	Mon, 03 Mar 2025 21:32:48 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpDNV-00000002N7B-1JXY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 21:31:12 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2237a32c03aso13585ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 13:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741037468; x=1741642268; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f527JpJGgzYKHPF758VmJ7IyFpSx+9+vZbzdff4JDwU=;
        b=MQFgGB3l0D5U/4Gogh+M3DXHRCQWoJfDYu6JF5wZuOe1UOJFGiYwvBvlxqtWr7eXp8
         uYdoB3knS73wQtDY1BwzDh83f2BZgn5OSSf7BOoJgo/HTcRQKFEaqH41zNaLPpvArI2N
         RZcqy5Q9tJaXT8QnCeU6190hbrZVlOXmBzqalHh9YFDdsop+wdVA7ym7m1cKtyPUaAwR
         Bs3lBE54p8IEryuWa82gZBYgbO6/p5FZ964nWmV3unSh5r2NJqcIRt2fZEm8rEVAC1q7
         2POjr9OsNDvsDfTro3bDeT9oaHnbhTC9p6xC1xh/aQSLP0RGXrXi8dn9qKOvJ20oxZf9
         o/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741037468; x=1741642268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f527JpJGgzYKHPF758VmJ7IyFpSx+9+vZbzdff4JDwU=;
        b=X76leSX+dlScxutafqeccSdfFLrE7zNZtOLVUE/JHgyr1Ln1QUAgnW/Tzmt1ZT1Z0J
         AVeDhezMNRom18C7o/1TZG7NOAWdXcV43vWW6V5NmBbZvedralS4XoTsPGjPIQDdPQAq
         NR0dhQP0pkTA29kRZnThzfhSrmUq/H149gwx6FyX/LrO5hoOOOUG89MLgThM8IYj6slB
         2oHfrdXes8DzGRTnY1uY9Ovz3XbAkRfyzczHPejo1HFn7HgdfzbrShctFbqz7yzagA1P
         nnBRgqmWYeTXDEnDjSA+eat2XY3di3UrlxTTJNz0oDNmj1dwxUSfFub7hVur6kvyfgPj
         7taw==
X-Forwarded-Encrypted: i=1; AJvYcCU0Odo+41fQ7P5HyabRqeidk5BrDDYgawaGnxzuygAfq1FMPU0hwhkCNPxdoLx6zLFrEbMz+tONAF+qTh9FuCku@lists.infradead.org
X-Gm-Message-State: AOJu0YxgCPaYbEcvKJTMjwrKuhLqAQrPD5j97TFi/5LERUE9RUneNsQH
	U1ZL8Duad0olKohZ9DiDAXL3w4ZE4A0m/slH+gECY5XR5hZR4cpibWSpzV4Log==
X-Gm-Gg: ASbGncso98xVffu3p9ySUHtfEeF5fNP85aakgpW6GqAPN+IljpZKyon6imuolGb5gnB
	IGu0X/0IaceRHOXGKItOzJzazDuUzns7D14ilevOEU8MyeYuKsU7JP2iuvx26eX75sShtTsUMdg
	mt2+goMwFflWA4lkfgQXQsK6ytgRgHv4KndaLNJBKxt71ZyxDftypDScYGVyQVeswmDd+8LTDH7
	cg+esjWs/0duAu/opqsmdd44jWb+1AtU9K2srysUgf6na58vrThxrMEKmjtJZcIzjmQ7TuHaywM
	ot8QNRUwxNK6tTqf1kRewVa2JhrZnzMGEnG8LxIimydjGNjv/I03OIdbSNmsCoezGXmUB4yfUX+
	RRzMADgQ=
X-Google-Smtp-Source: AGHT+IGsa5e5lNXo8l+sgrOnyahKAGKg6Eqeo60aw3JI53jBef3NZl8WnVRZmXUkUHO9BTsU0giJxA==
X-Received: by 2002:a17:902:f64d:b0:21f:2828:dc82 with SMTP id d9443c01a7336-223d9dfd65cmr627755ad.2.1741037468396;
        Mon, 03 Mar 2025 13:31:08 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fb602sm82065475ad.102.2025.03.03.13.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 13:31:07 -0800 (PST)
Date: Mon, 3 Mar 2025 21:31:01 +0000
From: Peilin Ye <yepeilin@google.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf <bpf@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	bpf@ietf.org, Alexei Starovoitov <ast@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	David Vernet <void@manifault.com>,
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
Subject: Re: [PATCH bpf-next v4 10/10] bpf, docs: Update instruction-set.rst
 for load-acquire and store-release instructions
Message-ID: <Z8YflWUNESGh4pOt@google.com>
References: <cover.1740978603.git.yepeilin@google.com>
 <c835515c35ec4ed59232adc3c02e1e90aa8ed8be.1740978603.git.yepeilin@google.com>
 <CAADnVQKGF-yD6UZ8Xha-wHu+7Jzn7Xa4Xu9Rju0hL2vFknqNEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAADnVQKGF-yD6UZ8Xha-wHu+7Jzn7Xa4Xu9Rju0hL2vFknqNEw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_133109_354040_B589526E 
X-CRM114-Status: GOOD (  15.28  )
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

On Mon, Mar 03, 2025 at 11:14:47AM -0800, Alexei Starovoitov wrote:
> > Update documentation for the new load-acquire and store-release
> > instructions.  Rename existing atomic operations as "atomic
> > read-modify-write (RMW) operations".
> 
> rmw renaming looks like a churn. I don't think it adds clarity.
> 
> > Following RFC 9669, section 7.3. "Adding Instructions", create new
> > conformance groups "atomic32v2" and "atomic64v2", where:
> >
> >   * atomic32v2: includes all instructions in "atomic32", plus the new
> >                 8-bit, 16-bit and 32-bit atomic load-acquire and
> >                 store-release instructions
> >
> >   * atomic64v2: includes all instructions in "atomic64" and
> >                 "atomic32v2", plus the new 64-bit atomic load-acquire
> >                 and store-release instructions
> 
> I think it's better for new groups to include only newly added insns.
> Also we probably should add barriers to kernel/llvm and only
> then update the doc with all insns together.
> Otherwise we very quickly get to atomicv3 and v4 groups.
> Naming wise I would call these two insns plus all barriers as
> barrier32 and barrier64 groups.
> cmpwait insn should probably be there as well.

Got it, I'll drop this patch from the series for now.

Thanks,
Peilin Ye


