Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A8EC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 15:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJMJTA83WH07DjPioIXnI5GHGg29vRTdXy8ees4Pv1s=; b=g0V4a6GVgFcRY+a4WdNM5NZJIG
	iwYnglgvoZ53zAh2R8UC5YL4uarxPgoNk7TnV8+BM0yMxXw+YCftxky7MPyXqnZWURkYQMAJfKfPX
	0idc/rTj6hGzHSxFhi7eGqGxeRidQfcZEirTa1S4QktiP+20hM6zhXw29x/x+rdiD5XdftgBtkNKZ
	V677pZuJj8WVx1n3m7OI28xn7t05w58iWk31fY0wLBqNjBM1Wf97QNAUuGP9ZvFDakwDDsUhb2ia9
	A54tAsuQ1h/5sFNz1QG+XpavoYV7Y704KgWL03rn2eHAErL9by53NDZP1aj5Gq1KT0L9SrVoG4EOs
	pZ5WFJrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQr1-0000000AXaN-003M;
	Thu, 17 Jul 2025 15:49:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQKT-0000000AUK9-0zHR
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Jul 2025 15:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kJMJTA83WH07DjPioIXnI5GHGg29vRTdXy8ees4Pv1s=; b=OrluL2WTBEPdsqtYZ4GNGmhSH4
	TbUKb3ZMUH93u352Vtb3OmRYkLbIBjIbcLqdYHptXXGLK79fTN8XCEG1UBhxcXHQLUkE3mX5pBuC4
	nv2Z807OsClUQdx7BlCO/AzurOriXwt6KZJGrqkRlroXINy6zIiWXNQt3d20g43NwNw8Yudkw6Gv6
	+MBKk954SGoXdHCblQgPwkk2AbJOvJhVFzWncGOX1ykK8BG5UoX0GcaaQXI5CYUmQ1q6Ib/mDEbNA
	4/6Uhf1l3w3lsengauv+YBJZQ8Tvd8FxOBKWANS8L7OEHC/9tKHW0lMlWqw1FiPRpmklN7a4FVaxp
	jbtR7p8A==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQKQ-0000000AIRn-0U5c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 15:15:24 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso927324f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 08:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1752765320; x=1753370120; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJMJTA83WH07DjPioIXnI5GHGg29vRTdXy8ees4Pv1s=;
        b=Noe4chwnTGYD9hc+gElmvGoI/ApeBn+yeJIriGo3ROlH9DFXJRyXYXOo3dG8JTzfUc
         K8WoMsR2QfzoTO1BIiuSfM1bIbTjJ0bFGp05oDzqFBeom6HivDNaHin+xSRjfd8php8B
         +JiaGqtL3bAOQzMGkp9xQfbu3PGhZP+Gj9YoO+SXJlXWFgOMvUUD3pAVrc5jh9K2oyfI
         OfwMTLSQpUkCrViKPUCG2Qa50HWdfEBDN7t2BmEkjVTmNvKS/ZJIpUsnb405lAUVzEQj
         WuhRGkvWW5jPGkTSGGnKuC91oPfjX7eIr0oVn7KmC5C+xtt+TMuGwqcg1xdVgV49M5A3
         yWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752765320; x=1753370120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJMJTA83WH07DjPioIXnI5GHGg29vRTdXy8ees4Pv1s=;
        b=L9hs47h0gaKNNDS5kRqFZAyeLh17XsP20t3JmG4zDrUUyDyYLjZXSgEvl+rnZoxoAD
         IYZBy8WLdO/WMYuxK1AsseExPekkubtY4SuYQOohJYKYfRmcJFAftTRtSTkOJRWeaB75
         NZxgIuxerUyRxjZQb7zvOMCpoDVeR+z8/DtrlAS4u6IrBGYAOh7yPyV19p/K6ZZVAB0r
         CN1mQ1R09p33N3QdGL7TucjBM2W0NmZcWgz28LacoF9YHzmmJE9ljDBEeCs/q4+dJDyd
         LMfgEHf/kkyRv6clNRYUowfC1ChqrhYbE7wU/mN8GS4lqKZrRUP83n2JYDBBvSQ0Ptq8
         eVEA==
X-Forwarded-Encrypted: i=1; AJvYcCW0YoO1LV+sTm2k0PQOnAEungf3RFTk8X2+NhscMpGwjCzePpaonn8J8ZroGwpwuphdFl+bMtXiUQhuqGwhjuYG@lists.infradead.org
X-Gm-Message-State: AOJu0YwPpfdT51UPcZvViPlRCuFqLnD1DYxgCtVxThiVEk6scNiPEYNd
	w1Mvg7jUSNGbbvDTQtxcOrU/9/IfeH4z16RaiamsidTfmAURoooDelnt6V05P5Qi/oEjskvdVtJ
	MD3sn/1rTdgEFi3BtwDEZHxdwc28LfsiMRNFbE93VRw==
X-Gm-Gg: ASbGncsM92eI+2/IszEHLyLmdixy4KDWTIpzD9wox509YK6DVL64MxQ6Is7NommXjgI
	FBcgdCtjiRi5WJDkc2iX3/6Mxmyv9d5zUtoYMp2KZ9NbUNA6RmCTI+h0j5wiSKhI5ZjyoOCcdcW
	UhWh55xE/GbGHCQDnS67oAklwDdXrlpsnnD1sXoRwVGTZAV+j2k6BRdt5zJjxC6heiipJnbbkY+
	c2LqQ==
X-Google-Smtp-Source: AGHT+IH3RQURYv6RUsyjhfCjPnbq76Yt1tIeE/r4l/zRFxghwDcy4thWAtjf1Qmjm4sX2AEpW3WUl8KV2Dpd0p1Xyr0=
X-Received: by 2002:a05:6000:658:b0:3a4:eeb5:58c0 with SMTP id
 ffacd0b85a97d-3b60dd4f752mr7612559f8f.20.1752765319635; Thu, 17 Jul 2025
 08:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-vmlinux-mmap-v5-0-e8c941acc414@isovalent.com>
 <20250520-vmlinux-mmap-v5-1-e8c941acc414@isovalent.com> <g2gqhkunbu43awrofzqb4cs4sxkxg2i4eud6p4qziwrdh67q4g@mtw3d3aqfgmb>
 <CAN+4W8hsK6FMBon0-J6mAYk1yVsamYL=cHqFkj3syepxiv16Ug@mail.gmail.com> <CAADnVQ+WZsaDS-Vuc9AN7P3=xvX8TG=rY65A8wYdOARLtkt6Mw@mail.gmail.com>
In-Reply-To: <CAADnVQ+WZsaDS-Vuc9AN7P3=xvX8TG=rY65A8wYdOARLtkt6Mw@mail.gmail.com>
From: Lorenz Bauer <lmb@isovalent.com>
Date: Thu, 17 Jul 2025 16:15:07 +0100
X-Gm-Features: Ac12FXx5_43sdjKCTtLw8gtm46jTfSh3joljtt9boX2xFAkNZRIJX-9H7H7z2co
Message-ID: <CAN+4W8i+PqYDcJjWk+g63W4kdKvhFKSad61q-T=JJky5m7j79w@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 1/3] btf: allow mmap of vmlinux btf
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Breno Leitao <leitao@debian.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	linux-arch <linux-arch@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Alan Maguire <alan.maguire@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_161522_341248_3EC418F6 
X-CRM114-Status: UNSURE (   7.85  )
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

On Thu, Jul 17, 2025 at 3:49=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:

> __pa_symbol() should work for start_BTF, but would be good
> to double check with Ard that the rest stays linear.

Alexei,

This code in the arm64 setup does make me think we'll be OK.

kernel_code.start   =3D __pa_symbol(_stext);
kernel_code.end     =3D __pa_symbol(__init_begin - 1);
kernel_data.start   =3D __pa_symbol(_sdata);
kernel_data.end     =3D __pa_symbol(_end - 1);

Using these as start and end only makes sense to me if the addresses
are linear? See
https://elixir.bootlin.com/linux/v6.15.6/source/arch/arm64/kernel/setup.c#L=
217

Let me know if you want me to double check with Ard regardless.

Best
Lorenz

