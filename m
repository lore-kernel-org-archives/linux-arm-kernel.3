Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383AAC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 06:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEjRrrhKGba3tAjU8EN/hoGC1slSv2vkn6NtFzJIEiI=; b=ztwNvh1fOvPUKNeMpkW/A/ewhc
	GpwYuzS8s4bFBP8EREfod/k/V2SLUBxhYyxrxwNuWkslmWhvcJ4H7ud2qldTon+IzxOafncfsJqKA
	8erfar7vWunEZls/DfTAQCwegfkLI+sgdJ7WxzCAwFz1B6ET92/KOPDSIkEYEm+4y6Dl58YnRmwAi
	jhFEllU7i6XY3C0Ppmq9hdADXF16RgEOMJ72vrdIGxViT697BDo2DlVvs7Osf1X5NmQUoWqqMV45A
	78tqhdnHr+HuimNiiOyOSbXeli5WnsS4sj0GxRkbfLoLABc3IZKnx88keMX9qwywde3u918PJ0qE2
	R0WtIgww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF5aJ-0000000E9qf-0VlN;
	Wed, 14 May 2025 06:27:19 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF5Y9-0000000E9eW-12uQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 06:25:14 +0000
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso1207883166b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 23:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747203903; x=1747808703; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vEjRrrhKGba3tAjU8EN/hoGC1slSv2vkn6NtFzJIEiI=;
        b=Zjrzbj0SvlPUyb/9VK/7jzW+BOlHupQ++QwPtC4fpClksn31+MeJiM6iHMpP2Z68dS
         SbyDeQDjw/2U4ysoX0hfIOVOJRE4iOF8IDrglzFnulnzzac+j1t2UAEh3BBzK9hfnwUR
         wKyDqRCED5qGRBzPaDiDdZT/niza4NU1gp717QFzK3OGaQL/lN/ExJYPJJyIczhfBd+T
         sHr+OnUwXsfY0lEWbevz6PLod8X2ixBdIbfihvGXhmW2EX6t0562Xj3NlhPvhPWbN31G
         52j/71c5hIsmY8YHBGCKMbLadTnT72X4T/Z//9kuKqpix4oSHPCmZQnPFEKrcarHJio3
         GZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747203903; x=1747808703;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEjRrrhKGba3tAjU8EN/hoGC1slSv2vkn6NtFzJIEiI=;
        b=Zb0hnBH/TRFYeOaJcLRv2M307VxiA6+nDsJqnvuv0KlchQlovEYPFLqus3gOtWQMfL
         x2hWL5DVvBZHx/Hjv+IpSaZhfA8gU4L6hKUPPZEL/Wd13MgqBAP2Ee2CWUtfmRmHcxK7
         w/T+8mqShtnXpNIZTZ6LdsyCKH5e48s55AfiFAoHZep+a3MD7zYdOFGq9jONuFVIT88k
         nQ72ebKckfbPzcf3gQ9Juk2ElL9HZ6uYFLQH6PkneNfW46Fr3udcP82Q+NTLGHRZF4dm
         47tBbBcmznVNRjhiUXqgbwOkCu7G7749spVgBSVH5zxyRygQ7HTVMrCjJS5DezCl3Avq
         tiug==
X-Forwarded-Encrypted: i=1; AJvYcCVPw+LCVIoQ/3PGPANBrfZlsPRa+9entKGLQ6imzrk7itV4mlFpz4q2eLmTJuVH7V4PNb69SJbbrMt1+BdVUxkO@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2qjQ3R27McOjLWWOc7VeTcEdG9c7h49tXyyeTmCkq9hhUZCQ6
	+s9ZZ6ijXYTdtiXjq8YdBP96O+VdyN4pMkyKcnmhNmTe7f5J8yWeHBr3tRWNRRgzglMd9c5qofn
	45ph5solGpBTCWH1LYcFeo9lHTgE=
X-Gm-Gg: ASbGncvh/QvSQigOlljWuXyY1ALPQK4a8voTsxi+7fsN3Lckh0X7f32IFm+PjLmAZ1s
	bnhXDiI3K4uxWWoxmo2GgiZvHDOIJFqo6tNRPrOwVZTUuw5XxgVcbq0C05/Xc8ri2a7sswCgfDt
	f5PNzkCi7FJGjf0oda6bhJj96UQ8PweG8=
X-Google-Smtp-Source: AGHT+IGp26N/Qy84kSU01eK/5Do0fYdJsM4es4PrHHge+o69giKbvBU1ENd/2FnoaAbJwMTNlGTDVz9olNhPboIJDFk=
X-Received: by 2002:a17:907:60cf:b0:ad2:39f2:3a9a with SMTP id
 a640c23a62f3a-ad4f7292c9amr203602266b.42.1747203903305; Tue, 13 May 2025
 23:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250501073603.1402960-1-luis.gerhorst@fau.de> <20250501073603.1402960-10-luis.gerhorst@fau.de>
In-Reply-To: <20250501073603.1402960-10-luis.gerhorst@fau.de>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Wed, 14 May 2025 02:24:27 -0400
X-Gm-Features: AX0GCFtu2D5_c8Hbz8VwjEw3nJ68h3pprbAnRl5y5vgEzz8EGiuxhoCH3nu-9uw
Message-ID: <CAP01T74DY4+n28oWZMS0Sh2FwYYxyMbTLxp8cf+OZ62AS7nOPg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 09/11] selftests/bpf: Add test for Spectre v1 mitigation
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
X-CRM114-CacheID: sfid-20250513_232505_288495_E19E07FD 
X-CRM114-Status: UNSURE (   8.82  )
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

On Thu, 1 May 2025 at 04:03, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
>
> This is based on the gadget from the description of commit 9183671af6db
> ("bpf: Fix leakage under speculation on mispredicted branches").
>
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> ---

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

