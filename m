Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11126C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 00:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCw6Dt3slKkxmbR6KL74m3SMvxMIomnJTYsCAq+YeBg=; b=Qo6UJkpcrtVO6upCXuOOjj5mIR
	gm/Bgi0vaLylhOQ05A4/DD+DgwI4TgT9zBXQHVMuxy3neUkc89vylCKOeYqCrFsvDdGvZ0QJli/81
	00YUZ/zzCT9W+1gJo+1dPNuwAYLwZwtGrq1/xSr2wqomBUqCtYMrEfyNq6nkVPpAhp+r39nC+jtne
	z8B9IFJiVhWFVsFH0Tyhmx1PQpiP2URwr5GjXE9S04wDo5gZ6pes2DNgfs9lelMtenpDfYr7JiF0C
	zSNMXV08zTcYusVXAPbTSTvzw/1CN+/NA1dtE/CONKXj20Qyf2OmIKfQ5u15rVe+JiiAJIAnc7Lgs
	2njHQHbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u71aT-00000005TRZ-0maR;
	Tue, 22 Apr 2025 00:34:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u71Yc-00000005THU-3jNg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 00:32:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F34BC6116E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 00:31:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0687C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 00:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745281933;
	bh=iCw6Dt3slKkxmbR6KL74m3SMvxMIomnJTYsCAq+YeBg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=msHJv8ojdvklSGKAN+h24sVK1+CKXsEjLe0nT/NMXSqc4ytGw95ks0WccZjBBaj+Q
	 A+khtAeSICUYY83qGO+smNsp6O/lZZe7lshRfeknFfdiWv0HCCf/ataTspOl6BDJJx
	 h4ysDE88Pq+QT1Re3rey8ZsGFcTAPAnTg6zomY7mw9sl8MWkr4L2k3kv9hxvBg7OIV
	 Zl1d8wYhFcYsajdw+dweGScy7WzweCLkMo7a0O6qGXwxLRgKasG7w2faC5kNo41vj7
	 bRCvLxN/ha3FBcg9hEq3mDZwZZhbaWVGvYD4LtDkj/ZGk/Ry0U/zhoNHGbWrXypfha
	 BFvo1ypR8sn8g==
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-476b89782c3so53972241cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 17:32:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV0Qi/FICEe8J30lqkgTGyDcu+ca1zMFtCwBKRIj/DjptNcs1VpUU4zt//akDC+G15UNvvYI3LQ+bB0u3pjo9zN@lists.infradead.org
X-Gm-Message-State: AOJu0YwSHr0STSdNyTNM6p9bDiDn4b6EP83deIk8nBV0zb70RMEbky+P
	IdIacygIGfhqR+s2tYxF0vBYa1vlnbeXzyDyqIpbHCegr0QI2qs9N6SwTillxHHu94zhDmPM4k6
	AEUpA+iGfxU4duxetiqUdODf0Hf0=
X-Google-Smtp-Source: AGHT+IGaL+oVXQ+0FqVmw9bQumaSFF+4x9KoZGhd6tnMCmCAgtcpexZZgw6KB9L19Vn+Vxy54SDS7aSUKuKUDl3eZG8=
X-Received: by 2002:a05:622a:13d1:b0:476:8288:955f with SMTP id
 d75a77b69052e-47aec3541fdmr256753991cf.8.1745281933032; Mon, 21 Apr 2025
 17:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250412010940.1686376-1-dylanbhatch@google.com> <20250412010940.1686376-2-dylanbhatch@google.com>
In-Reply-To: <20250412010940.1686376-2-dylanbhatch@google.com>
From: Song Liu <song@kernel.org>
Date: Mon, 21 Apr 2025 17:32:01 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4=dr1Zq5to-JVqHsvaKcg4V2MbJf7i_C=erfAG1XuD6w@mail.gmail.com>
X-Gm-Features: ATxdqUHiMCb3QBWfl3iq-hKAxCkLsWmEI2O_8MQLyC5Njubt0SDDzPTeNGE0enc
Message-ID: <CAPhsuW4=dr1Zq5to-JVqHsvaKcg4V2MbJf7i_C=erfAG1XuD6w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: patching: Rename aarch64_insn_copy to text_poke.
To: Dylan Hatch <dylanbhatch@google.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Apr 11, 2025 at 6:10=E2=80=AFPM Dylan Hatch <dylanbhatch@google.com=
> wrote:
>
> Match the name and signature of the equivalent in the x86 text-poke API.
> Making the src pointer const also allows this function to be
> interchangeable with memcpy().
>
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

Acked-by: Song Liu <song@kernel.org>

