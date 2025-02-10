Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A1AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 23:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52lUjiDSJtE5pfFjZXgC0f64Wn3Nt/2DnZ14fk120UY=; b=AyGjYudjTrFKtl6Gz0usKW5l/L
	o2I9UKyJc3Ya0YKBX00Y17unw1rDOCXYtst+7+9m4XUvT8gzRrtQnMq0XjjYMpce7Y9zr9W3Juq7V
	TdpU2pThjS7buhZ/tHdEyjuupIbRo7QBcoXDoQLNz0f2sykD6ww87fS9s98TzWBeZKfoaEPuqPY9o
	LQBcr6ss2GlDXeBXSt0DjQ/kjt+4gJjEWov34lsWZuItVMMzHZHqMHHe4UPZ1/tj0nYSTK00oTRO+
	3j4YRWHBp4ng8E7yC/A/bilzQiWsSQ57fb1c0Y/4lrcgv2LcSEzad+NqNGwEbj2F+1kJY4fcmLJiH
	IXW4scIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thdUN-00000001tKq-3pHR;
	Mon, 10 Feb 2025 23:46:55 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thdSy-00000001tEE-3vLf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 23:45:30 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-219f8263ae0so88986485ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 15:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739231127; x=1739835927; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=52lUjiDSJtE5pfFjZXgC0f64Wn3Nt/2DnZ14fk120UY=;
        b=LLBGVb/YnGpbWNmhN/q0P72XA1qQW8UcA236xiNI3mPJ1Qhq1swcPnlhRbgtvrNKdm
         e+JFIP0yhW11xRoCqkMfJkTDcfV83qnY5L7rqtMemeTnZ1d5PXYNz/30XizEgZUcU3X+
         EIFh/Sdb3TPi8It97pdhjQcTXZR0gbBFvVa6j1/nZMkai/OWJh//hZhJxE7hgBFN+8/j
         Es5fmEvgM3yqjYf95apuig4/ZsV7WU6ur7peWQp6EarSUz1w7aOzD87Pf1NXsnhjwps6
         wfbUYdXqtUTloTsXlpO25xmWb7h0PEM96Ubzq8Dzjw9sI/ZVWr2Ew4/VpU9Nj74z5uF7
         JxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739231127; x=1739835927;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=52lUjiDSJtE5pfFjZXgC0f64Wn3Nt/2DnZ14fk120UY=;
        b=jBoSRq4L5w1jFW/Vs1fmE2iSdXar2hb/zfklFH1lL1QsAsU8qkIFpc2J8W+++g2TAx
         xkb4ACA/+yaO/nIrH2awcQwHTh2S2bsLxj+LNoZq9XUE59rl+ic519dajFKgiZon5BtO
         pOGO/r75CoDCgBs88kaYi3MJiaYLwFn4sThf4ahMVBBJrAmahH4oXZo1c9WCzNeridDI
         d1zR2tzu//BZSNVszAcspm2g61bs/WE3+WZ/Jx7y7i6D2h1gHa1edww3VJ/USlmzQaTR
         sDwEk4YhSgDgOQwfG3W6FfOJWxQ5z1P32B0PaV3xHrieecBP0FL9JPjF0kZI2z2rI2M9
         5mkg==
X-Forwarded-Encrypted: i=1; AJvYcCVF6i9JVL5CR5SokFmiw723axSAfCJPdgk3JXywWdH0AX9lMYz5a1TlZ3ccRZ+F2f6dRBkdJACHCuVjb//XAA2r@lists.infradead.org
X-Gm-Message-State: AOJu0YyABAtfd4bGRDge2W67CApHBACkdKZYPcatUIN6fX6pXWEYt4sN
	S3pNzbB7EnqL974Jd+muQY1OYyIlQDCxByFJJBkLgJ8FtFQzcdLw
X-Gm-Gg: ASbGnctgKwoV4BMSdNXag1UTuebTF+IEgW48yEGBEZT9RRFxwoviKwDzrbxGW1r+kZr
	6i5MWnoOEY3oru/DOg2m7/xEPLvnsikPFIFh/6OcAd+eeYejLdVOCEFToFJnOrhtvL5ejdbILLQ
	3/lCklr+5gjOhdXiy96uhEPv7k7bknUtraAQU5hUF9PF0A2lSizcUiIH0MJPJYQGnLDU8/8FQZ5
	Jkt/N5V4G4yBHR/ThAIW7wX5JOsKRSkjfYnJvAXthhhUsq9Zv9vAx5DxMqJVOCxqIV88iscTMLa
	ddLnSwtsqtOp
X-Google-Smtp-Source: AGHT+IFr87HMc3rAIs7T2MJZdH+iBcNx057eedhM1fSNyi8duQq+MXuumgo05Ysb+cZouGZ01IpR+Q==
X-Received: by 2002:a05:6a00:6ca3:b0:730:9801:d3e2 with SMTP id d2e1a72fcca58-7309801e1c2mr6542542b3a.8.1739231127553;
        Mon, 10 Feb 2025 15:45:27 -0800 (PST)
Received: from [192.168.0.235] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7307c5b3a99sm4324202b3a.54.2025.02.10.15.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 15:45:27 -0800 (PST)
Message-ID: <5029add95e4dc77a3b28bb9869260af290ffc6ea.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 3/9] bpf/verifier: Factor out
 check_load_mem() and check_store_reg()
From: Eduard Zingerman <eddyz87@gmail.com>
To: Peilin Ye <yepeilin@google.com>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Cc: bpf@ietf.org, Xu Kuohai <xukuohai@huaweicloud.com>, David Vernet	
 <void@manifault.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann	
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau	 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song	
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh	 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo	
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet	
 <corbet@lwn.net>, "Paul E. McKenney" <paulmck@kernel.org>, Puranjay Mohan	
 <puranjay@kernel.org>, Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens
	 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Catalin Marinas	
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Quentin Monnet	
 <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan
 <shuah@kernel.org>,  Ihor Solodrai <ihor.solodrai@linux.dev>, Yingchi Long
 <longyingchi24s@ict.ac.cn>, Josh Don <joshdon@google.com>,  Barret Rhoden
 <brho@google.com>, Neel Natu <neelnatu@google.com>, Benjamin Segall
 <bsegall@google.com>, 	linux-kernel@vger.kernel.org
Date: Mon, 10 Feb 2025 15:45:21 -0800
In-Reply-To: <363538659933fb2e289d937d81fc8eecb284ea7b.1738888641.git.yepeilin@google.com>
References: <cover.1738888641.git.yepeilin@google.com>
	 <363538659933fb2e289d937d81fc8eecb284ea7b.1738888641.git.yepeilin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_154528_976780_530D3305 
X-CRM114-Status: UNSURE (   7.97  )
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

On Fri, 2025-02-07 at 02:05 +0000, Peilin Ye wrote:
> Extract BPF_LDX and most non-atomic BPF_STX instruction handling logic
> in do_check() into helper functions to be used later.  While we are
> here, make that comment about "reserved fields" more specific.
>=20
> Suggested-by: Eduard Zingerman <eddyz87@gmail.com>
> Signed-off-by: Peilin Ye <yepeilin@google.com>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

[...]


