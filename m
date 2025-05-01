Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCB8C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 17:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqCUl1E1e2DoAqjUx3nS868gkprr/kaVWJsax4Gih78=; b=zmQurTHdv5+E0GVJXrFADMOUpE
	ol0hdXVMeH0dDUkQV524s3zekAyt0aCN9fGnls9BkOwRu0Be6Xg5i4DR+SQfDCguhTu/57+iQUEhB
	s1egPiFPCHxOqDQRXhDKjJggvLvDER69oHV2mT/SnMHXaKEJmiA9jaSqbLHse3cqyEtE9WTnZBb5e
	5t0zZ4yKaKMq8JIKYdsskRJ1sG+x4zKVqyqgDEOEBBMU4zG5Jk+m/haIiyhZX/FURaO601ACaerTx
	PGFJtTn8llgrHo+JDZUt7nn4VyaWssLC7fSptSggqN2Wu27a3C101Rw4z+EmdSD+NSTuvpa0A2iYn
	o/5wrYWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAY0b-0000000GJrs-2yPW;
	Thu, 01 May 2025 17:47:41 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAXyh-0000000GJgb-32hO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 17:45:44 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-30549dacd53so1157829a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 10:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746121542; x=1746726342; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqCUl1E1e2DoAqjUx3nS868gkprr/kaVWJsax4Gih78=;
        b=Cyt+BFeS6cu2k2pI9Ubp8bHM8P2Xyz0uwQeHM8NYgWwnonmSJOAb63XswSr2LGvHON
         IZjlAo9InO/NPMhLVyVMzmGmBFAX+lZ9aWiIt7ybOkv+UV8gahmWUkklCqliNIHzdRIB
         0gexY8MexYam+bdhCDR9l4odPDtvysyrVHBboosz/CfA9KxExDGT/uUNiBnokuBqTKs2
         o+581rPY8D/3+pXXbK7XTjUZmVJHMO3Hn40MRBWq8ANrKpfumlnI1SsXoglR05nEoAfU
         9e9ut/7P0y/q3Bj+ph07qI6JZSewZISug5tKPv/aanuuLdtQ9zMCLl12usYxIEcLB0kO
         ns4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746121542; x=1746726342;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pqCUl1E1e2DoAqjUx3nS868gkprr/kaVWJsax4Gih78=;
        b=LLwEQ8LiSTP8iylSUtxE2n0bS60drVDOCtHs87INh0Hmc6VDZKVjmjjP6JsYRqst4G
         5kR+k4JAVisv2mAUCtxfSjAfduvQyvb+p9w9L9MoeWczVETrllU7coweNuaklbYrREVc
         hwPFUpecgvE6Ki83Wy0dbzYAc8JkEomUn9Xx8dJ6MKv5iZ0+ZlcsVnbFQCLHmodBh/zz
         FRDy766yYrN8Tkq03a1N+va0MmTPk6Tz5QwV0QAIBhCNhNR4aIuTmD5H0UMogiUhASJI
         NKEyX8o0XyZzxAyp+xyaQ08q6/I3nl46KiPIMf4mMlYYlhjkaGxmRj/DQoHPeV+uvjoV
         qtAA==
X-Forwarded-Encrypted: i=1; AJvYcCUeknOUWPy3qv16DxZkGmvaytdn+B7Am5oUfa4aUsIB/AwjQGKZVyi9pN1luYG8WmUegZNKgzk7nUSQT/fXuCfS@lists.infradead.org
X-Gm-Message-State: AOJu0YyMuJk92WxWMjzPEp3Im7UjKLv0rRpIzZTcP0sShI2JwUw1bkeq
	gOTuPoLyS+r/qZWrPJp7QL5L0Az/SGy0BF3xE5djWIjHRZ2cpJx/
X-Gm-Gg: ASbGncsPOhHXJBnA/MJcDikyRBD1cEdPZbZNq8uJfpd0ICreDQf0aUaJ9jw5fs2rHVs
	T44B2fO4oqz9Y0w6CpoVLEu/cW+y8I25xTrpXGetxs6t1SfZtWWkuQStsMKdqjPyT+4zXxJpKbJ
	QgRR79IsNrt9IuKuX3/HCRR+6P/QGtgz+avnRVoMwfqRIlg9dKn+JrZW+fBbdyQaz0gXBPAOlxA
	5/cxbd0eSVJ4EM6uwkbe60GcuQGN+6rX3zar90qb20bt/aRjHJscfremuUfl8L68+GciQ+VFDGU
	RRhwTewFJyonLiMqSQYHhppM9hcNb5KJRUhF48EgYvdhNO0=
X-Google-Smtp-Source: AGHT+IG1DZt+WbEs1H1vBv8On6YGa9H+fvBwkfvRfEpQp1ZKcph5zdItji4Y36KqTtQ8K03Lzl8Kow==
X-Received: by 2002:a17:90b:3bce:b0:2ee:5c9b:35c0 with SMTP id 98e67ed59e1d1-30a4e1e6a93mr175707a91.9.1746121542286;
        Thu, 01 May 2025 10:45:42 -0700 (PDT)
Received: from [192.168.0.56] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a244bd4e2sm4706976a91.0.2025.05.01.10.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 10:45:41 -0700 (PDT)
Message-ID: <13fc0801bf4fd8e561cb35773a4c5f3f22d9d51f.camel@gmail.com>
Subject: Re: [PATCH bpf-next v3 01/11] selftests/bpf: Fix caps for
 __xlated/jited_unpriv
From: Eduard Zingerman <eddyz87@gmail.com>
To: Luis Gerhorst <luis.gerhorst@fau.de>, Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,  Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend	
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev	 <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>,  Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai
 <xukuohai@huaweicloud.com>, Catalin Marinas	 <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Hari Bathini	 <hbathini@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,  Naveen N Rao
 <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman	 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Mykola
 Lysenko	 <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, Henriette Herzog	
 <henriette.herzog@rub.de>, Saket Kumar Bhaskar <skb99@linux.ibm.com>, 
 Cupertino Miranda <cupertino.miranda@oracle.com>, Jiayuan Chen
 <mrpre@163.com>, Matan Shachnai <m.shachnai@gmail.com>,  Dimitar Kanaliev
 <dimitar.kanaliev@siteground.com>, Shung-Hsi Yu <shung-hsi.yu@suse.com>,
 Daniel Xu <dxu@dxuuu.xyz>, 	bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 	linux-kselftest@vger.kernel.org
Date: Thu, 01 May 2025 10:45:39 -0700
In-Reply-To: <20250501073603.1402960-2-luis.gerhorst@fau.de>
References: <20250501073603.1402960-1-luis.gerhorst@fau.de>
	 <20250501073603.1402960-2-luis.gerhorst@fau.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_104543_768243_41438B34 
X-CRM114-Status: GOOD (  11.82  )
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

On Thu, 2025-05-01 at 09:35 +0200, Luis Gerhorst wrote:
> Currently, __xlated_unpriv and __jited_unpriv do not work because the
> BPF syscall will overwrite info.jited_prog_len and info.xlated_prog_len
> with 0 if the process is not bpf_capable(). This bug was not noticed
> before, because there is no test that actually uses
> __xlated_unpriv/__jited_unpriv.
>=20
> To resolve this, simply restore the capabilities earlier (but still
> after loading the program). Adding this here unconditionally is fine
> because the function first checks that the capabilities were initialized
> before attempting to restore them.
>=20
> This will be important later when we add tests that check whether a
> speculation barrier was inserted in the correct location.
>=20
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Fixes: 9c9f73391310 ("selftests/bpf: allow checking xlated programs in ve=
rifier_* tests")
> Fixes: 7d743e4c759c ("selftests/bpf: __jited test tag to check disassembl=
y after jit")
> ---

My bad, thank you for fixing this omission.

Tested-by: Eduard Zingerman <eddyz87@gmail.com>


