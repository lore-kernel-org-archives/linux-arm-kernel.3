Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956F4C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 22:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RIamoPjwg48ZZC5Sh2bLQXIBfW0utIiRcjouU0t3hJI=; b=tRydop1Civ6S32S/Lo90sAeZDd
	I+uBaVHuQ2VCDY1dcssDc0/zaXtbAVtU+5GHibTCp6G3Nf/xTboD+00u/CpFfy71voJfSuBSFBy8I
	L6ElU8pZE+SzQblhb0yl8rqQtELza0pTkwrqwiHil1zSEo3KHr1gVAggjYcR+8GqElyLDjiAJhu+U
	KrqF92Q7KpwDlndr5wLHU0aiyzwRa7iukrfKP9sKUQC460aWnSS8QzhvoOomf6NZ4hmTvc+QWkbUI
	3R6dhu+N+aHrQjFesn/XumsOfaDdUkV0uqy262T/NAZzStE5EcsSAfD8JrvS0JwaG8A1FY5fNrwE2
	f/rvXUyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiL1Q-000000090WE-1l1Z;
	Wed, 12 Feb 2025 22:15:56 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiKzy-000000090FB-25nM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 22:14:27 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-219f6ca9a81so7895ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 14:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739398465; x=1740003265; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RIamoPjwg48ZZC5Sh2bLQXIBfW0utIiRcjouU0t3hJI=;
        b=gTVTYSfFJddONwZRsaAjv9qlLQWPrgsZos9iHiCf1zaFPJXPIRvSCTy3iQEiV0diND
         E13zySMONZKTOFMa7zeLj9mVNNzXgdUnYDfFZti0BvSJ3E4IOe1qR+HdkR/jWZPJcmLe
         ClmVqr2Bx4GjB3sd4y7QANyM+s4jvAB8kSb7hF0hRJcGFepDVPhqmT4cQDdzCtXoCiFt
         pONXwV2vS/7/5FoyZ2NQlEcTGZn4miUvSmIOVyihOghi4FPDGMmWCuGIPgJVN1HkcIQV
         UjQZ+B4cnfe8VEG7LUx8fOgqy6uDPkpC1X2sF3olxUDgbxrQ0zvl/JhUI7HOvoR1df8i
         W4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739398465; x=1740003265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIamoPjwg48ZZC5Sh2bLQXIBfW0utIiRcjouU0t3hJI=;
        b=hDRWEu9sAdzsZ3dDQiLyCbWc1IxflBXAbATlEesIu1HFeuY8OeAPl8w9u5hK8ltbq6
         bdfYgb+aPJZcgd+PSgJaZ8sObuE0rFPVAqIAnUrBA7AzRe7CCIZnzlqo9Yc/N5ggUB0r
         ho4heQpD0G/d+kabsX7lDQ6NDg44WiIibURnhSgK8PDO/H67gy/9/X5/JYHHBZz8jTIL
         IoL1FYsde7vtb/a/gE0/NSQxvhOTZXgd706ri1lQGDTm3sOXurV/uDsj/2gH5PkfeE0g
         5PG4TOecJs8T/87SqYlQDofL433HlV0VRUpcZd8B1KtQYIFC4XltbFMN0KTE+lOwEkOi
         i9eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsIlllA0TJO17EXO6gxqcvSG+OHY3K1srMJ14aYtFD5yvk9KreOjW4s5DpNx8XzS6TByK5nI4mqWShdiM+HVoF@lists.infradead.org
X-Gm-Message-State: AOJu0YzVwosDUkKxlCgRMuhax2ixhYJGTWzSBY8TXzhj2LiAXWcbqfoN
	CFWn4o9Dauni28sBoX2O0KOocvqw5s9l0u+Es3O3ARNnJ4bCozbgi9yH2ckCJg==
X-Gm-Gg: ASbGncs7dhv0oigO4DONVPlz+8NG+5qZsubg4ECQNkxgkifgn1WTjZg05Qk9Bh0l66+
	d8Op/a2hukv7MPzDsjAgjG2iDU9M/IRqSa8Ki5Coc/q+cFrbcUXqhigwPUMnrls04NwvShU8E0b
	pEf8z0eT78sBFheXXjYXXbPfyu0qQTlU8lmAsyrnSC1Ghn3RUJTYJW+aZ6y3Sj2eqUSkIaADA7P
	gLgRi0blDOGeZLnjDhKEwrvPRBvIlKeoBzA/eWrdSewYIXDSHUaPvrZXlA/0/zFLUh/xK/4oW89
	rksM46aU370F4sQDukiktYD27uiHXN4D6zrmhCb/H4GHM0iojYSOmw==
X-Google-Smtp-Source: AGHT+IHoHezTdxvkJ/1VIrDh3oYzMtm6RGlYCwXFrwTeWP7zj3QgqCDHMbHI4+dadLOhjZf0y9DdCw==
X-Received: by 2002:a17:902:f550:b0:21c:e29:b20d with SMTP id d9443c01a7336-220d555da00mr178295ad.3.1739398464924;
        Wed, 12 Feb 2025 14:14:24 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048ae7f8fsm11770742b3a.71.2025.02.12.14.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 14:14:24 -0800 (PST)
Date: Wed, 12 Feb 2025 22:14:19 +0000
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
Message-ID: <Z60dO2sV6VIVNE6t@google.com>
References: <cover.1738888641.git.yepeilin@google.com>
 <d03d8c3305e311c6cb29924119b5eecae8370bbc.1738888641.git.yepeilin@google.com>
 <CAADnVQ+L0h8qXfYkC3+ORyQkXFJ2MgO8FDHr_Ha0QMAtS_ujag@mail.gmail.com>
 <Z6gRHDLfA7cjnlSn@google.com>
 <CAADnVQLkHA9LGv99k2TZOJEGUU=dw=q6nVurJ=aoh0v6cFS6zQ@mail.gmail.com>
 <Z6qC303CzfUMN8nV@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6qC303CzfUMN8nV@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_141426_537989_7FDFDA5C 
X-CRM114-Status: GOOD (  15.12  )
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

On Mon, Feb 10, 2025 at 10:51:11PM +0000, Peilin Ye wrote:
> > >   #define BPF_LOAD_ACQ   0x10
> > >   #define BPF_STORE_REL  0x20
> > 
> > why not 1 and 2 ?
> 
> I just realized that we can't do 1 and 2 because BPF_ADD | BPF_FETCH
> also equals 1.
> 
> > All other bits are reserved and the verifier will make sure they're zero
> 
> IOW, we can't tell if imm<4-7> is reserved or BPF_ADD (0x00).  What
> would you suggest?  Maybe:
> 
>   #define BPF_ATOMIC_LD_ST 0x10
> 
>   #define BPF_LOAD_ACQ      0x1
>   #define BPF_STORE_REL     0x2
> 
> ?

Or, how about reusing 0xb in imm<4-7>:

  #define BPF_ATOMIC_LD_ST 0xb0

  #define BPF_LOAD_ACQ      0x1
  #define BPF_STORE_REL     0x2

0xb is BPF_MOV in BPFArithOp<>, and we'll never need it for BPF_ATOMIC.
Instead of moving values between registers, we now "move" values from/to
the memory - if I can think of it that way.

- - -
Or, do we want to start to use the remaining bits of the imm field (i.e.
imm<8-31>) ?

Thanks,
Peilin Ye


