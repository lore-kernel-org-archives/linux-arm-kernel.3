Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90264C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 16:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjITccKn52YoXHvMNHp0xjqzTUP9bb6Gv+c2QtvOV0Q=; b=cLhRrDlyRFaZiTV4Hrba99N/82
	zz6K2+k/j6zHkno8rhAImod6jgWVXBEK0Mg07+NPXyISdLIQYLzFi3VaXpScFxInlxNY6ZBU/+VIH
	tGVLyFICoCJDYpxDHQtwoN2lELqJTCAb2L+MahrKHyIBNNb9GdDwdfjTyv5sQ68bXz48IqBiXjUU7
	MDlUs1dYGC+C6H/QwgtNvk9Y5JLMa4TlQp09//s1e7xEauOfK1Hq2Sq+dwgQCba72moC2lOFec1a9
	Pa9JkRjrGQ0jkti56qwwVj6ppRuvtINiLzxB9QTaVnR0h453sOh1w0LbdIYs8cAqYbJBHuLDE8RUv
	qiW823Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAXFM-0000000GEeX-2nWY;
	Thu, 01 May 2025 16:58:52 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAXDR-0000000GEIg-2PtH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 16:56:54 +0000
Received: by mail-ed1-x543.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso1799643a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 09:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746118611; x=1746723411; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pjITccKn52YoXHvMNHp0xjqzTUP9bb6Gv+c2QtvOV0Q=;
        b=JuU8mgqFr/iwmkk2MMFUWIkZQs4U7h/BegCSlsbpaXNvpe+0pO2wlCDVkJq5WvSxss
         la9N20508qaJxZlBOv7o5kFKpZ8csYqA4bqYGr1VpuCHrSUPrmhCfvvCECxMwXuZplz3
         pahp0E4QdMBsFaxdGeLAQl/3KESPsE5kkoBOTcdqcp+UKMEgIMIsR0ClO+kvXbqhfpGB
         GBN3wIYUk7RXHk2zjZWgJUm88eVyeSg6GoRAm2LWnizKnzyVhOcxKNuaIcMemrP/CYLc
         QHtIJ2iQKRQNjK2KvGtMx6UqL6y4lTStTczWNsnC50I9OnoRFu6Kv39Qwvc2ZauymXSd
         wrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746118611; x=1746723411;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pjITccKn52YoXHvMNHp0xjqzTUP9bb6Gv+c2QtvOV0Q=;
        b=I3aaqN8DTKO55gss+HuBBxdxtVRIMwWo2Q3AOfcNTcWu7gc+7nZv2Dg8MDSUL6Ckjo
         +M3hkmlYK5viGe49xyCYxruecVXnlLZVgDH1PZ3z49qOcp56vhE866NQoZXgEjSfvNVG
         4mxPRLIKe6WqyU60O/o2iNJIQibw7fJL24ISnuniMXjWQGCucFUoxuaqzGBoShh8o83D
         ous7Uq+euv9QUQcqIGJRekAfPrNdx+tULhP4QjT88niAwlUVITx3Ww1FUa771K/DGeXu
         +M9LNDPUYUQeJHofbqpMG9QuyxJM0W2uiuEZ9xoJBL5oOrO48JPr1KETVU/B7FqhWYmo
         B2gg==
X-Forwarded-Encrypted: i=1; AJvYcCUc/pt0b5CUWIiaW3Na2BKtOAw7Gxu7Wgs6OunYOA8GPmkQLb5+SH8DInaPyAlX2pFZKVHHcWquiO71rMPkNusX@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2om79tDRr3GsDfUgYL8tihQNzayrvKkUzOj9cOx7PC19NFzUN
	3uVWyoZ2RjHecBlYwA5LUEc6zyt4INUy2/A2Uzt7BWQ87gibzZrl6NU2i0Mu8lXV5por/3Knd4u
	cUf7Wv6bKQviyR5UW1HognzD2YkpnrdZx
X-Gm-Gg: ASbGnculr7dcXGKE30OMhVJYDa3KkkQMDVtbOks0svmXUrjluVNzhRNSY3hO3l4U38+
	ke1a6aDa7Bbw1V2t4dFjg2mTsTgD3szx1HguHHabk0NHK8PGjXz8OdV8E+ciIGGW+9D2p6zWRvw
	X8By6UbbZfmNvku2V0oxbh0XM39MltiZuU1Juv24r77vX4VxONqTirFw==
X-Google-Smtp-Source: AGHT+IECEidvEo999oYKJS7UCLAVVBM0myFbAJ15E7tPIRmjavdQpBC/5/8mZ8iIClrt0F8kscmSCXQGalHJ9fnIAF0=
X-Received: by 2002:a05:6402:524c:b0:5e6:de5:312f with SMTP id
 4fb4d7f45d1cf-5f913507c6dmr3187305a12.23.1746118610475; Thu, 01 May 2025
 09:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250501073603.1402960-1-luis.gerhorst@fau.de> <20250501073603.1402960-2-luis.gerhorst@fau.de>
In-Reply-To: <20250501073603.1402960-2-luis.gerhorst@fau.de>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Thu, 1 May 2025 18:56:13 +0200
X-Gm-Features: ATxdqUF2nyzuV4YsC3PXg7l3hGhLYkWnuNMDOdnMHwkg3TmNkQsrDO9p2L0Wm2o
Message-ID: <CAP01T742Td_U8=fs4DDrxWSdQcXEpGE=T6+WfJqBw_bqpXhb+g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 01/11] selftests/bpf: Fix caps for __xlated/jited_unpriv
To: Luis Gerhorst <luis.gerhorst@fau.de>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Henriette Herzog <henriette.herzog@rub.de>, Saket Kumar Bhaskar <skb99@linux.ibm.com>, 
	Cupertino Miranda <cupertino.miranda@oracle.com>, Jiayuan Chen <mrpre@163.com>, 
	Matan Shachnai <m.shachnai@gmail.com>, Dimitar Kanaliev <dimitar.kanaliev@siteground.com>, 
	Shung-Hsi Yu <shung-hsi.yu@suse.com>, Daniel Xu <dxu@dxuuu.xyz>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_095653_611002_11BCDB73 
X-CRM114-Status: GOOD (  12.58  )
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

On Thu, 1 May 2025 at 09:39, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
>
> Currently, __xlated_unpriv and __jited_unpriv do not work because the
> BPF syscall will overwrite info.jited_prog_len and info.xlated_prog_len
> with 0 if the process is not bpf_capable(). This bug was not noticed
> before, because there is no test that actually uses
> __xlated_unpriv/__jited_unpriv.
>
> To resolve this, simply restore the capabilities earlier (but still
> after loading the program). Adding this here unconditionally is fine
> because the function first checks that the capabilities were initialized
> before attempting to restore them.
>
> This will be important later when we add tests that check whether a
> speculation barrier was inserted in the correct location.
>
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Fixes: 9c9f73391310 ("selftests/bpf: allow checking xlated programs in verifier_* tests")
> Fixes: 7d743e4c759c ("selftests/bpf: __jited test tag to check disassembly after jit")
> ---

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

