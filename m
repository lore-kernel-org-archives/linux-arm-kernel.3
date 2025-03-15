Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2DFC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 08:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KnAUZ9wnADDd/J6Z+y4qbTn/E10Mg7M2sjiLjv1pVXs=; b=YAp3cYVokXRciyFIcOBrVNmAAb
	vze5LzGK/rj5UnRWl5/1rJid8CwFs5MJAEprDcJLqqm/n6y9qoUkXEjYN6rCMFTYcX39LWM2+Cdam
	atJmdiAlhQAq38d0OYVm4u8hxDf9280MzQljCnL3kA0IYo2BzFUTo27jr7Uj0mDDpcfOSSwSxzRHc
	LjJ1f4DqzPwjvQQSwNWzizRQ7LSNB8TDdwjEUpH12EeJ13Qxa2KFbB4uvBMjVpncRX5VR+cCTJ4o4
	OkdRqwp3UD/8Qp60zbFZCvwXd2w2Opg95quyNNRHd35iK+algjNbmriOLg6VUR7g02DdIkRz1YGJO
	v4CyH8kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttMYl-0000000Fzz5-45MG;
	Sat, 15 Mar 2025 08:07:55 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttMX5-0000000FznK-10xp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 08:06:12 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-223959039f4so60688875ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 01:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742025970; x=1742630770; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KnAUZ9wnADDd/J6Z+y4qbTn/E10Mg7M2sjiLjv1pVXs=;
        b=IEKfKHTGSeMfrYVW5sl5OXImHLd+qkLsVIUTASYV+yP42tYynA2gOH2kr1995caZma
         FiKX3kVj1JWPK0vV1b7q2r+FpAJy1cW8OdEqlGN+iwcQY0NZLNF6Lpqtd2EZdC+Ow/ph
         UXClZZpP8cFkZ0wh6JjmQsSoSebN6oaXHIY+aRvRXhUujeRWa7depOGeI4K/QbYDernZ
         35IA4drVNkSXIcv9MDXmmrsWkrgSTF05H7iFlYh1szo8Zczzzxc+DkBz60Epsn/LJDn+
         vhFUWeW2mcJZ+d17AN1edwDJmnfR8aqQtzs0KZ3LjcG8qD1a0F7gvlr58NYyNsFbS/t8
         Vl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742025970; x=1742630770;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KnAUZ9wnADDd/J6Z+y4qbTn/E10Mg7M2sjiLjv1pVXs=;
        b=hHxwKGQqIb1YwLpyG6MMl2OU7WmRMqcTh5wHe8Rj1Ft4BeYHAN1aht/NRRxtvGJrUi
         mg6v4cGny6cEx68TyCRqGAf6xvFVB4j8CqKZ2HHGrKQlIRloyrtd+a51tZt0upkiPjAu
         rtQqavWEiaELEicxB5fif5ZvAhJiFgVz+7EXCxhxV7Am1j20vjQdZ6AqJXZapmFeNOTv
         EIx0gQIHMYnSy25ePxSOryqEO4uv5RIw+u5N95be8zb+aX07kz48lZQS7wZxFIn6fnUY
         XMMVDKElJrsny/9PCG2VaiZ2ufi4gzX3itFIr15bwGopQJd9tP3jDUI4cqphyfeX72T4
         Z6AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxZ64Vao9wtLnPGntXzG2FJub7sJpmQ52JSlx25hI7Z76fxzdHxrgMwRH8P7u9o9VwPv1Fxisr9KLj8fThxePC@lists.infradead.org
X-Gm-Message-State: AOJu0YwKTwzTJTaN7U/Jf6cgTb14sFC1bIJxr34Uu+fEpXyFhGHH/iwl
	TKc6D4UlMMr1nM0AS75fKK3sxYZ398lURLwQM7mF4sE0shUrIOIi
X-Gm-Gg: ASbGncuRrZDA0pZGGJuh5VYimjkBUzIHlU+g5LmiOCSy5hnsOJIqCg6wDQBMIuVKc1u
	6uRAHOhn41K5LMDbZRrFNqlBNM538slOcdj0VPRacaGLoeLwQJVmyIBCpAgq7b1ZTOYG1l0q0f5
	VEcbwYQVIFG7OeQx7u+c0VDN2XCCkniAac3dpaLfQSYCbwe5xtQgkNBMi/fptNtmK4c2qyfSbMr
	G8//d45xt6SbmTnekkZKs/4u6GLfsDmtB/f0Bo4bFMZSo6Qf8+aEq0tlVTr5TOwunt35lv3N9/S
	Pfg7zEcsNfHVvxEHinU6f+eHm7vu7OEwh/t6DRnHqbwrgnwjR7I=
X-Google-Smtp-Source: AGHT+IF5en4QKMgNNQsnpb5bVapdvySxgKqbFwNsEVlqfpqV1XchMWc3wIfTVYjTbMqNNkcnfGZ7tQ==
X-Received: by 2002:a05:6a20:9c8d:b0:1f3:2a83:7548 with SMTP id adf61e73a8af0-1f5c13c9108mr7253771637.38.1742025970286;
        Sat, 15 Mar 2025 01:06:10 -0700 (PDT)
Received: from [192.168.0.56] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9cd03bsm3832109a12.8.2025.03.15.01.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 01:06:09 -0700 (PDT)
Message-ID: <785b4531ce3b44a84059a4feb4ba458c68fce719.camel@gmail.com>
Subject: Re: [PATCH bpf-next 02/11] bpf: Return -EFAULT on misconfigurations
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
 <henriette.herzog@rub.de>, Cupertino Miranda
 <cupertino.miranda@oracle.com>,  Matan Shachnai <m.shachnai@gmail.com>,
 Dimitar Kanaliev <dimitar.kanaliev@siteground.com>, Shung-Hsi Yu	
 <shung-hsi.yu@suse.com>, Daniel Xu <dxu@dxuuu.xyz>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, George Guo	
 <guodongtai@kylinos.cn>, WANG Xuerui <git@xen0n.name>, Tiezhu Yang	
 <yangtiezhu@loongson.cn>
Cc: Maximilian Ott <ott@cs.fau.de>, Milan Stephan <milan.stephan@fau.de>
Date: Sat, 15 Mar 2025 01:06:05 -0700
In-Reply-To: <20250313172127.1098195-3-luis.gerhorst@fau.de>
References: <20250313172127.1098195-1-luis.gerhorst@fau.de>
	 <20250313172127.1098195-3-luis.gerhorst@fau.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_010611_280745_4E89805D 
X-CRM114-Status: UNSURE (   7.62  )
X-CRM114-Notice: Please train this message.
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

On Thu, 2025-03-13 at 18:21 +0100, Luis Gerhorst wrote:
> Mark these cases as non-recoverable to later prevent them from being
> cought when they occur during speculative path verification.
>=20
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Acked-by: Henriette Herzog <henriette.herzog@rub.de>
> Cc: Maximilian Ott <ott@cs.fau.de>
> Cc: Milan Stephan <milan.stephan@fau.de>
> ---

The only pace I'm aware of that might act upon specific error code
from verifier syscall is libbpf. Looking through libbpf code, it seems
that this change does not interfere with libbpf.

Reviewed-by: Eduard Zingerman <eddyz87@gmail.com>

[...]


