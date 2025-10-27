Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FD9CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 20:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/jgPYWC0V1D8IWJvZFoe28znSAzn2itXE/nwEWLtiQ=; b=hTNm/PSt4aAHyipD1Qk+IPDYLG
	A4B8u2/51VOxMOBaaDTBjyMNZAllwG4FhxcAV3faC57oW/mk1TjsGqFU9AxyY/uvEmosKgvFkLbst
	+CWygFrXPV+bj+x44EWjGRuQRQLYiUpBFe9prGDWUN7DqSii40t9h0CJnMC4RKBPnZvXlwwWKWozG
	JwrQW3mJlBJCVxhQyxX4BAsb6IRptImiJVWPeTyvX8sKQdcwY4eUA4dnjqQgn38+P8gVF4gmlZk/D
	Z0qD7mM3uHOHlGoVkjOJvBA0QlvhMSqWTK1e9nIkTG/ulRbhqM7McnHpjMTAs4ssyFtuuw89BbLuf
	JfdKBjoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDTak-0000000EiWR-1m9D;
	Mon, 27 Oct 2025 20:13:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDTai-0000000EiW6-3zm7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 20:13:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D030848B38
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 20:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF477C116D0
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 20:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761595999;
	bh=7/jgPYWC0V1D8IWJvZFoe28znSAzn2itXE/nwEWLtiQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tw5k8+RRR8ZQWGB85VYzWf2Wi58LdQQOsk1Wd6HUWngGMEl3xHQQJ+6QMEnaIqyjE
	 hwq+u9XOBdXqtLS1aSDdxiMwMIgByssijVT+USX9/Zm4rKR3bw++NOg5WdUIl+kM+E
	 j6sh6H4aYiKT/EyPhuYAvwLCadoZzOlRFiWbZQZKl3eFz+is5npDUZT7ZerlpYPO9f
	 QwhlCyG5YN6UWxOfBnsK1VxGWtD3RO24J4/QNZEMqBkgfeibbDqjzFf4GA8n9onp3+
	 fKXGM4DZFNJwJyYXnRSLvTFEXN7NdjFiTrAuuoO2f9tfqnujndf+H2tDbrE1WrzoW5
	 nmJlPR4bI4x4Q==
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-44d9d7aacc5so807076b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 13:13:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWMwcroS/ZVGCibbdfg5ZPIX2zB62tW9baZDWAbrnXFykVS6IOXPEHWh4Op22x5c9xC9dMpm8vT/hmHcAyoaSOH@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4j7Ex5sDmkhow6dzARNWH0LaBtAPuW66onOHYebFct0+xsW92
	iedVPGyVqeDsb7/V5YapK00LVG5yfmp/hoz9Wajue+gIIxSmuATJ1j40uXdpqJkvyYgOD+7v/ch
	SzJeRQwYQiq+vDQSjdQrcQCS3kOF8hwQ=
X-Google-Smtp-Source: AGHT+IFzhgtS06rA+RZsyYcTHjt7tKv3IPYAqJiI30Zg7pVKVf7PdFA1QapVHBr8NekG6KSfuz58bzGzmJpR6s1c8PI=
X-Received: by 2002:a05:6808:8919:10b0:44f:6df7:cf42 with SMTP id
 5614622812f47-44f6df7d022mr64955b6e.64.1761595999030; Mon, 27 Oct 2025
 13:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20251017061606.455701-1-ankur.a.arora@oracle.com>
 <20251017061606.455701-8-ankur.a.arora@oracle.com> <874irkun26.fsf@oracle.com>
In-Reply-To: <874irkun26.fsf@oracle.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 27 Oct 2025 21:13:07 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gHbOKN_3gVufY-Uv5yNuFsZ7vGdJgm8VMWJMq8EJJ5iA@mail.gmail.com>
X-Gm-Features: AWmQ_bnp6ii4CmrVCoy6tewQvRu5JbQ235PW681sgNQsgSfTn4C6zcDylVx5kw8
Message-ID: <CAJZ5v0gHbOKN_3gVufY-Uv5yNuFsZ7vGdJgm8VMWJMq8EJJ5iA@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] cpuidle/poll_state: Poll via smp_cond_load_relaxed_timeout()
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	bpf@vger.kernel.org, arnd@arndb.de, catalin.marinas@arm.com, will@kernel.org, 
	peterz@infradead.org, akpm@linux-foundation.org, mark.rutland@arm.com, 
	harisokn@amazon.com, cl@gentwo.org, ast@kernel.org, memxor@gmail.com, 
	zhenglifeng1@huawei.com, xueshuai@linux.alibaba.com, 
	joao.m.martins@oracle.com, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_131321_034055_95AD438B 
X-CRM114-Status: UNSURE (   9.92  )
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

On Mon, Oct 27, 2025 at 9:07=E2=80=AFPM Ankur Arora <ankur.a.arora@oracle.c=
om> wrote:
>
>
> Hi Rafael, Daniel,
>
> Could you take a look at the proposed smp_cond_load_relaxed_timeout()
> interface and how it's used here and see if that looks fine to you?

Well, can you please resend this with a CC to linux-pm?

I believe others on that list may be interested in it too.

Thanks!

