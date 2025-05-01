Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBB9C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 22:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+DIhbp2zBCUUrZHkv3NTANy3q1+8YPM4ngw/q64EdRc=; b=l84120xiF73/u7iPktEwg+zeZt
	MPpYE5M0j+TkoiXe/kAkjaW6KtorW7cFAIZyodRSnUJ/KCIo+dhcAtHQ4sphf/qV4XVPqt93Ohv95
	dkGkJWjAdNef1Wv9iA5b9TcgLUjLl9gyCSHOiVMjTQ4xbFNMt6z1W5Lpd2AGWxyvTHrS6ewbqnF7e
	YUm7K7GedNrtCTjdC05j4lxfgaTfD9ILLy/f7gy7DtTranVxw5BFd/1ss2JbkcBr9sU52TMi+vgrs
	c0aDPW2Cncua9Snc8dYcObt8iNgOs+lBg3san3ZnYPZ1ZzpiLlOef0qNUY6xRfYhnkaaaq2d3t3Nt
	qfxK4udw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAcSV-000000001yF-3W8X;
	Thu, 01 May 2025 22:32:47 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAcQa-000000000wH-0Pxw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 22:30:49 +0000
Received: by mail-ed1-x543.google.com with SMTP id 4fb4d7f45d1cf-5f624291db6so2109153a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 15:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746138646; x=1746743446; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+DIhbp2zBCUUrZHkv3NTANy3q1+8YPM4ngw/q64EdRc=;
        b=cRRqaMOlwpe5bKNpyGjJvvwqElkBEkYkkaFIIQj0V+KTiO9xAUhWyjacAxFEB91jNC
         AhkHSoK6JKif0NwKK/uimtOES/5DV5WXSz14cWPbiJMwqgpFTwtd6lvSsS7xW8ODnhxw
         vLz/XAgGOgK6A5P+p2k0EhqXOf8WRNIxo2GysBHvQuCJL7FGyoNGelIBPypIeKfsoh2Y
         zK1Uju9MKPJJKjacXArDoR0hNc5eoy3dZYVRbzKEHoKPIJ9SdVlu0tuseLTW2djIr4i8
         Nhx26JpruOIv7YGcX9OhpUEWAglN8qkKXlogNeQB0rbkhBUFSFhJ07wKjX7wOzc00TOk
         xvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746138646; x=1746743446;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+DIhbp2zBCUUrZHkv3NTANy3q1+8YPM4ngw/q64EdRc=;
        b=SbCnAPUBlmyo7MNsd1qNk5Rz0jgsaboXXwfVYnDsRJdGMz4Lbeqw7am86EEfgrx4V3
         U7PjNWrAQfZm+MiRwSZKxeBAKY7Um9XZNBaNrH5jmEmlz/ewJCUd3/mAVvTObIEbsrsD
         pQlALL3ZjtPsT5+upDnSKgMkOWku4VgDKy39XQq+eXJyNZJnYyQAOa9ytrFDfSImhS8t
         KTcGKTyHSmYdpjelr18XQ5CzRdP3tf3Wmff2VNZg5u/jQ1SsRtDaw3MwHPr4ozNENYNi
         aNLnICSgkdvIZZqqnl6bxuJSV63VZFY8zE8p/M0EbNxPc7NxzKWLEsQEE4CS4vww35sl
         2+Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWjFggrgM1cMADBfVq+zo8XvegStY60m7XrYJBYZD1IexKwyk9UxAapMrVa4Fa1wcgxOUg8/wuN0HTfVKDrXFS6@lists.infradead.org
X-Gm-Message-State: AOJu0YwpSNcgk22epZpfcB+MEn+jAu9zBa3ECPgQTE0cZvbjBuN1sski
	T3oFk/FbzyUxTLCime/X5zW37nxyieTuRYm0F4UO8wkoiZ9J5oLsez+x1fo5ZyPDW+QkOEzheqa
	1oko4IGHqb/E1iVAM2AGjM1rcoEw=
X-Gm-Gg: ASbGnct0AhdKZPCv5D5iQR7qtL5qkfuxQVpS9tn5ni2bgg197wgHxMS843wt8VO5lnV
	aXES9/cCeaUZQpi1speRzwx2pYycPAvdkRYX445eLRYvKozshBcFxpg0+ILlBkv5Pl6qLcVv0Vp
	dghnrtO5qPhwje1jKtL+EcC/YeHaVSh5FY5DEf5967IjI=
X-Google-Smtp-Source: AGHT+IG09f2b7Y4uH3A4LEbmPohoiBZ1TPbF2Kj8BdJpyHWDLhgzXkdGcWvLzUMh9kLAyJv+ATRCPXiPJsNUAWmKXHo=
X-Received: by 2002:a05:6402:5192:b0:5f6:2758:149e with SMTP id
 4fb4d7f45d1cf-5fa78014527mr322827a12.11.1746138646330; Thu, 01 May 2025
 15:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250501073603.1402960-1-luis.gerhorst@fau.de> <20250501073603.1402960-8-luis.gerhorst@fau.de>
In-Reply-To: <20250501073603.1402960-8-luis.gerhorst@fau.de>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Fri, 2 May 2025 00:30:09 +0200
X-Gm-Features: ATxdqUHPJMzTDr7uGCd29q-hTjuCFiE_oOpFxHvXqTdvhmyQK0iMn3qq8We2LrU
Message-ID: <CAP01T75RR_6mC5fvD-tg+pxR8TEUHpUfU4Lqo0p+EBrkY9BVnw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 07/11] bpf: Rename sanitize_stack_spill to nospec_result
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
X-CRM114-CacheID: sfid-20250501_153048_138706_1B52FA0B 
X-CRM114-Status: UNSURE (   9.04  )
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

On Thu, 1 May 2025 at 10:02, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
>
> This is made to clarify that this flag will cause a nospec to be added
> after this insn and can therefore be relied upon to reduce speculative
> path analysis.
>
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Cc: Henriette Herzog <henriette.herzog@rub.de>
> Cc: Maximilian Ott <ott@cs.fau.de>
> Cc: Milan Stephan <milan.stephan@fau.de>
> ---

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

