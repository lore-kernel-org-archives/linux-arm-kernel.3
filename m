Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A4EC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 22:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bEB+wipqpxDExoX7XkJyi7zxDfuglvJ+HC5Ljm+PuFY=; b=eo3p6+epoQgLUKUnNFmzYzr4q+
	TwUvg9aXSTpD6tVsUSmLkuqJKk2/6Z1ZpK3q15+bie4cBj7EdWV07qrXL2FQLxCuJMB4d4CgFeAfO
	K+sjmqxLfwSFdEY/RgvsTfodTRW3qR1RBYL/mM+MG9Q51Tn1pdzFXReEnLrrxbyWITvA0a2dX2y9t
	HaxedNsYlmchzgk3lmGM6kcJ3m2D9nZ2IRfUwXwIaIhTWafW8+BFHcUK7I06AfFCPCc0B+R3ZDJd4
	GSEBL28RHQ8wiHdWDieTZtFMzhi8TAyjoA2Gb4deYI0fSYq6u40tI42irh6DcLvY+ku2nQrHQz+/R
	gSZ+VXmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj3ym-0000000GMtN-0i0E;
	Fri, 14 Feb 2025 22:16:12 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj3x9-0000000GMcP-0Pwk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 22:14:32 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5de4d3bbc76so4090236a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 14:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739571269; x=1740176069; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bEB+wipqpxDExoX7XkJyi7zxDfuglvJ+HC5Ljm+PuFY=;
        b=OX3amnoKSeMOctXEYBjobVvPAqbuuRERn28rzbDlY1nVC1U4/gvtx5ss4vIImC0KPZ
         KVD0bT7J+a3bpNGyj2PPRwu9tkevWfbD6FqR9PZEcSWV1Z7T2R+fUF6xmOZJx/bYQl2G
         kYI4tprMl8RLmHYOZa1Dwk1cy0KUVde+U6E6iQwBoZ4scX0XfgkmlLJTURlQrRQ5FgZG
         r8vYCpy848jM5x0A6voYCsykEbC2Hs7ZArqdK67v8crIcMNIMliKeEEAQOeA+jLOzOU/
         M90xIuW/eN2dLydGQGMqUdAQ11k23Uxiz0d3fqBG/R5qH5fvE4IlROaJ2XsDxQrldmVe
         8VxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739571269; x=1740176069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEB+wipqpxDExoX7XkJyi7zxDfuglvJ+HC5Ljm+PuFY=;
        b=VKX+aRDraCkQ9mTT6squ/YEgyLJKQdacewJfnGVzq45300E55KU6zR5i39WGK1C4Dp
         yaFiwxLUX/2wY6W1W9zP42Df22LGkNtHe+URKyGqk9ipcftdmhz3y18BHO4XWbK+n5e9
         ay7uflggFgIxA/sM8nqDhKrjAl9g/1m+Cwk43QWZ8HwTOVLJJ81CjKa8i3W1/zvGYMop
         urqIGM4EicffjuDuLyMlHO6gjewa18hx2np6WylNn6ll8uh2E7awSP1zeOyeoy+JJI3O
         oM9YEU1WepD2V+5r7HW8dfStte9C8pX0R/4UiAOM8tCs3KyjVCl/tNWnTBeHOz1epodF
         JmcA==
X-Forwarded-Encrypted: i=1; AJvYcCX09NqWzabvAoB21zlST373qxMOJuWr8MHunJcSsIDgqULxVhOn1x2KFOZXk5qbO0sZT/JOgk8KTEBx/8n4RndH@lists.infradead.org
X-Gm-Message-State: AOJu0YztKXVk7c5Dj0qSiKkfoZOAIzBd/FnjJWN/nnrEAqYPyvGA2m+y
	VW2SvzKx+3Wd8RTWJ1/EbbURjXoqFhLWmvmR1vi1e9oxb9bdLDg4
X-Gm-Gg: ASbGncunoz+/KtDvHacXCjOiI3XOSOrwsVGdkG1pgoOlT5CoGgeRJteQf57yzsTgZ25
	L/lgsOZNK6aNM+POcibcfAHgtA/aIvN7w20klL0s1i/I1Ctq/0K+8zfAi5rNzbsa8IodvkfDAdu
	ynOglg91XTs0qJkIKA5oQEcgY6wRGCIQwpFHagRpA98E9ecm1Hp8TS4aayKObECRGMgF2csFlw+
	/5PS2oRnzNI+k65BS/gINJFbqlt7M0mv4YgebA3x871+cPpIpKacOLISOlU2pgEbDljnqk5q0wy
	QgePHIe0pgQ+aWpRgzaaV/b7lZmnDszR7MLt
X-Google-Smtp-Source: AGHT+IGhKMUt6pQQ2eEdpEq9Kp47Mlkh7KYX18Dx2znHH1AwQvYGHh0IRemg9M7NamftnrBLcT9VIw==
X-Received: by 2002:a05:6402:5210:b0:5de:dc08:9cc5 with SMTP id 4fb4d7f45d1cf-5e0360a1fb6mr766609a12.7.1739571269178;
        Fri, 14 Feb 2025 14:14:29 -0800 (PST)
Received: from krava (ip-94-113-247-30.net.vodafone.cz. [94.113.247.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c46b3sm3547034a12.21.2025.02.14.14.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 14:14:28 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 14 Feb 2025 23:14:26 +0100
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, bpf <bpf@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Zheng Yejian <zhengyejian1@huawei.com>,
	Martin Kelly <martin.kelly@crowdstrike.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>
Subject: Re: [PATCH v3 4/6] scripts/sorttable: Zero out weak functions in
 mcount_loc table
Message-ID: <Z6_AQmaUWAekeB5B@krava>
References: <20250213162047.306074881@goodmis.org>
 <20250213162145.986887092@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213162145.986887092@goodmis.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_141431_136372_4C753105 
X-CRM114-Status: GOOD (  14.96  )
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

On Thu, Feb 13, 2025 at 11:20:51AM -0500, Steven Rostedt wrote:

SNIP

> +static int cmp_funcs(const void *A, const void *B)
> +{
> +	const struct func_info *a = A;
> +	const struct func_info *b = B;
> +
> +	if (a->addr < b->addr)
> +		return -1;
> +	return a->addr > b->addr;
> +}
> +
> +static int parse_symbols(const char *fname)
> +{
> +	FILE *fp;
> +	char addr_str[20]; /* Only need 17, but round up to next int size */
> +	char size_str[20];
> +	char type;
> +
> +	fp = fopen(fname, "r");
> +	if (!fp) {
> +		perror(fname);
> +		return -1;
> +	}
> +
> +	while (fscanf(fp, "%16s %16s %c %*s\n", addr_str, size_str, &type) == 3) {
> +		uint64_t addr;
> +		uint64_t size;
> +
> +		/* Only care about functions */
> +		if (type != 't' && type != 'T')
> +			continue;

hi,
I think we need the 'W' check in here [1]

jirka


[1] https://lore.kernel.org/bpf/20250103071409.47db1479@batman.local.home/

