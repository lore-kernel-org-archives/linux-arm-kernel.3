Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E2EC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 22:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvC11TDh5RWBWPLxa7ORV/+ShfE7ZB4C79Xpi2o9TqM=; b=EDxyGjBszu9Y8FRT0CTE+427hq
	CbbZle+6rWwCuocj2wmcEtl6rQKfMerKGDezyEc0EXdCztQwBOqz2OhP9YI7TliLZTAqYjs7I6OmL
	di5XojfPJFsOOvHFXdjXfIcaOFaqGYul1xlaFFpnn3JJgoBKkCq8FpXrfMRUGwJ33LQFBAQ5jzpbf
	gQohw1LBP0ff0lu+1weh04XWNV0gaEDWTnwUup4d0BRs/4MO/Z/7W8u5N4vRtY+Vf7W3swMbPojBC
	/p/okR6BpeWPiGsXBSUlB0HWP3oMOfgxLl8udoXMZDysRByOqY4LV2y1L0d6Gk6s02tw2sMA7qHnW
	quiOIh+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAc7B-0000000HTCR-3gUk;
	Thu, 01 May 2025 22:10:45 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAc40-0000000HRQy-0GtS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 22:07:29 +0000
Received: by mail-ed1-x542.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso2517556a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 15:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746137247; x=1746742047; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HvC11TDh5RWBWPLxa7ORV/+ShfE7ZB4C79Xpi2o9TqM=;
        b=DrJXP2cL/y77fXPKxY/J08GrXZ0Qxd2r/AQoJqkBDl21eCSMz2LAKk7fgg8RL0U/+o
         THvNLHYrDIRNEMl8RGjT1lTmK6DMr+J6oWw5woL+n/tTFZDWeKo0gPAOuuekSwj2RbVd
         C56kcHPaVlb8trkGkWKWY9SngSLUuKKK++BiiYca9OkYPYjFq+rB93S4cqVlenD2zvDT
         Oi/P2nvNNwQ/YjaExxiTkTemqS+kQzOYcC7csb8SPSIwU3qwuFaOd1AIFLSFp3yP0u2U
         4qxlPeLvBHTHoqcgpU0LhjF0LZtlkAxoh8m/NtT8zRuUxg6J2Aa34WNwKesMWtZ/TFSO
         exvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746137247; x=1746742047;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HvC11TDh5RWBWPLxa7ORV/+ShfE7ZB4C79Xpi2o9TqM=;
        b=XVy11xRSunZD/4JITARTpGGmajnSTQYz8TwRFOP1T//4D82y+d8CB8Nu6pqq6gGuOw
         75hpVmQKMtBbg1pSTUbf+Xfz3PutrKbdSrPNdtNRvqAharoqKS/VXOgZokAz4C7BsSJT
         c2NMul8Zc0IR4ojoJ3G4Fil9h4PHQnFMZES1d3qEgUT4KeOiXokVLmUj5KECpq7ORkOz
         M96lN58DNnq4nesJvAjeX/yPkDIG1gNILxOOvpN2XhcyX1O1FHcYXl77QO3DQMlzyWJU
         E5Szq2q8dARPGlTWhs4DXo4vUDUlKnIsljxl2flP+NQ7hnvJmMZtuZ98erpnlPeN1khR
         wuUQ==
X-Forwarded-Encrypted: i=1; AJvYcCURiWDYxtPMkPEXTW6zJPzmbf3AyCa2bTQvU8I3nqatKSe1V30XPa/HVe+mIBwblvqx313u6OSxa8bqoQjiTwuZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwhtgCsYwP68L48aVF5I1Yg3TaA2AkBPnLEfRY4aitSvSf0Nn5+
	OikERFuHK9eF00nzWNnakigfb0V3o9usStYTZTOUXYPmh1CrQDfRSjf3NGyG4gex3u7HPbB/Y0x
	vuGiFCWmd9+2OvJdeH393uY13Mno=
X-Gm-Gg: ASbGncuhtrnVVDoBVHI3vYcNrup+/AHHrWQTTlctE4+cebFizwn/U9N6pd6dHiXed2f
	ZkO9LjrD229VfRKsXv+387QOFvBmOlSWDzb1z/XJyew9TBDdQ+dUoxzqQGX56LVvlannvdg1yVF
	yZbbQzYhKjdCLmYycZ4bRs/aXTe2ehQpqnW8pBJ+KRkTM=
X-Google-Smtp-Source: AGHT+IG1lU56iqWpifKIgMMmYrNdr1ioTH6+OP6AGYVsnjqNRlojuMU0G4Vpeu63oJvn/WKU5CN6RH1ZoN5Nh1W7fAQ=
X-Received: by 2002:a05:6402:3589:b0:5f8:30c2:862d with SMTP id
 4fb4d7f45d1cf-5fa78040187mr334068a12.13.1746137246565; Thu, 01 May 2025
 15:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250501073603.1402960-1-luis.gerhorst@fau.de> <20250501073603.1402960-4-luis.gerhorst@fau.de>
In-Reply-To: <20250501073603.1402960-4-luis.gerhorst@fau.de>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Fri, 2 May 2025 00:06:50 +0200
X-Gm-Features: ATxdqUGg7YCCKDNPYyxZKyCdlBGugnXkLd2V8xrmgc9OhDJov6fHaQiLQWWlX40
Message-ID: <CAP01T76-_PadE-BViz4bQQYQHFCNJS0Txs065w99dEcxrP3kMA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 03/11] bpf: Return -EFAULT on misconfigurations
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
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, 
	Maximilian Ott <ott@cs.fau.de>, Milan Stephan <milan.stephan@fau.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_150728_101687_B8D66FFD 
X-CRM114-Status: GOOD (  10.07  )
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

On Thu, 1 May 2025 at 09:48, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
>
> Mark these cases as non-recoverable to later prevent them from being
> caught when they occur during speculative path verification.
>
> Eduard writes [1]:
>
>   The only pace I'm aware of that might act upon specific error code
>   from verifier syscall is libbpf. Looking through libbpf code, it seems
>   that this change does not interfere with libbpf.
>
> [1] https://lore.kernel.org/all/785b4531ce3b44a84059a4feb4ba458c68fce719.camel@gmail.com/
>
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Reviewed-by: Eduard Zingerman <eddyz87@gmail.com>
> Acked-by: Henriette Herzog <henriette.herzog@rub.de>
> Cc: Maximilian Ott <ott@cs.fau.de>
> Cc: Milan Stephan <milan.stephan@fau.de>
> ---

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

