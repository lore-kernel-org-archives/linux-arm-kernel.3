Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1655CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 16:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=750rYEAHSQ0UWuveAndSH+YLhrYLDuMy4II+d7YdJQE=; b=d8zpY2zcEliITYdd0syIF3lgXX
	xBaryMNBvhEKAff3lIgFpzrGPl4W3mYj2Bw8n76ZweXvpEp0RrWec1u27NiiFjh1Gyxvk1+CjQNle
	WyXGMPqaMH2ecjY39C+NN2ipMoZoFZKkENqWgGZc1Zcuy8aW3U+WMzCMBBbrm5F0zNni1oYFLyIO+
	DGIvu1aYxHMsnJZFWyiluQ7WUnlBYF6l2rVPOPSMKPjrPp134E7CLUjEDfAKkYtMvXceXXcvlK0pq
	1Na4BF6/nAoS48UdX6JyHQUQS9O7XU/t6lp+GXTY9cM+sGeNEgrwOzIHpRMQLGccC1PJ1af5nOTHA
	RyR5NeJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Ruz-00000001Voj-2k6G;
	Wed, 24 Sep 2025 16:00:33 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Rux-00000001Vmw-0hbq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 16:00:32 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-46cbdf513d7so38269805e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 09:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758729629; x=1759334429; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=750rYEAHSQ0UWuveAndSH+YLhrYLDuMy4II+d7YdJQE=;
        b=hTm6Ujj1Kt3qUIpI5lJkDzfQHERaq3U9HEoW2KpTyR4UdMJOMhDFJ8DZ24MH5YCZao
         4KC8VmR7wuNZZg6zGdLFmgMM7lpKl7ZBkuzdK3iKztVKfMOCfGKFKuou+T7VngmeIkJY
         G/0WvJtjAx8ZuKwfczVdFXcCv4/rguaasUWhHWfh1BzgDRdFWCP7Wbl4TIWrU9kSV5Ka
         zsFqyd4meal0UwPCZCEK0IS5CQbnYanP2IyRR9Tm42LdkyZGtHu2UFhFFXzF4IxpIPOO
         NoDtedknjan7ymlUXpU6kADkuk88bkuF9iBTh8GAfs5sGGiMKyXOCsDhV/yZPp+lRT3e
         l3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758729629; x=1759334429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=750rYEAHSQ0UWuveAndSH+YLhrYLDuMy4II+d7YdJQE=;
        b=Kl0dpHsG4b3VcA/ImXlYY5ALHgf2HU+ggQtW+HZyo6KVP8BakWmKyBV+cIaE6Y+4en
         Vi9sCMmEAC9Wzn9IOdj9dfUGaPHKD79JqVCVrL1YbhltKRdSdOZGVM0t0qK0RTaxMoyv
         rqat+LIRHjnIC0MCseXDDoKr6MtjkdgTG3DcLzc8RVgiaRWWWmo86LRb8apT7sIKuf1v
         pIfOAcA+WqH+q4ddHEo+1FBHQ4+vo8AJqZY9mVhtZMqdclXZIZUFwJOSKUSRdC9eUrez
         PEJ29PgzOu3RRo/ZU66EYyP0qN3x4UMcDuCn7roZxb5YnPL3AAsxn03yRVPu7C80C3dW
         f7eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXo4h0TSF+vPBTY6WHG6OdwDzU3ScI6/aq7l9281hJYWeWywiE/XGVPVVcvX+cFW0bu33prALlHV58ZIPaI/eFm@lists.infradead.org
X-Gm-Message-State: AOJu0YzybH/KjDdixZmqENnjXlytWftm9xqkriuU2yzcTZIfZbJzm4Ab
	FkqQNjbX5kRJ7ZUd37B04xaEx/riVQ2akySowWc38I7x06w2Fwu+tdu8
X-Gm-Gg: ASbGncuBywSLjmOyaGTdHEX8UmzucBGiMqzjlRcEQG7MdFWHgMIjU8uW9Jt66e5l5j9
	JOFR99+glu11hZwMMqHlg2W3ZMRnpfKRJEL5pY1oY+fq/qUMtKncOx3bzhNTi3+y3rICYwc1Xtb
	wZDal5PnwkB7XxTDEYQrCaUDdqBIXk//3OuIYmHlKBrbDfAQAVVk6PCQ2mVWgaXOzHbFssd7jqL
	5NGVlx13nEqG3cpKnv5CPR4+UR/in/6RWCiMlC+maybS0eex7lh3txX0G9TU9oQA84BK1bEPSfo
	c7dbVOZJsz0TLD+fMSwJPXzGHrg+HF7cJ1/uQNCaVuLN7t9WUxH5nkpjeBVDOY932Q1P7Bso
X-Google-Smtp-Source: AGHT+IGS1uVQdvHmWTJ9aInOCYB0BEj+cPbPcp0L0eplHLPsYT5p2wId+q3+D0Z2kfEz6FOGX5pf3g==
X-Received: by 2002:a05:600c:1d16:b0:45d:f7cb:70f4 with SMTP id 5b1f17b1804b1-46e329bca25mr3761415e9.13.1758729629203;
        Wed, 24 Sep 2025 09:00:29 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200::31e0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee07407d33sm28837786f8f.18.2025.09.24.09.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 09:00:28 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 24 Sep 2025 18:00:26 +0200
To: Steven Rostedt <rostedt@kernel.org>
Cc: Jiri Olsa <olsajiri@gmail.com>, Florent Revest <revest@google.com>,
	Mark Rutland <mark.rutland@arm.com>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Menglong Dong <menglong8.dong@gmail.com>
Subject: Re: [PATCH 2/9] ftrace: Add register_ftrace_direct_hash function
Message-ID: <aNQVmrGCW08zF9Kp@krava>
References: <20250923215147.1571952-1-jolsa@kernel.org>
 <20250923215147.1571952-3-jolsa@kernel.org>
 <20250924050415.4aefcb91@batman.local.home>
 <aNQCDwYcG0Qo00Vg@krava>
 <20250924110703.2a0ced1b@batman.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924110703.2a0ced1b@batman.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_090031_211782_B07AD142 
X-CRM114-Status: GOOD (  13.68  )
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

On Wed, Sep 24, 2025 at 11:07:03AM -0400, Steven Rostedt wrote:
> On Wed, 24 Sep 2025 16:37:03 +0200
> Jiri Olsa <olsajiri@gmail.com> wrote:
> 
> > I have bpf changes using this that I did not post yet, but even with that
> > there's probably no reason to export this.. will remove
> 
> I'm interested in seeing these patches, as the ftrace hashes were
> supposed to be opaque from other parts of the kernel.

branch:
  https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/log/?h=bpf/tracing_multi

used in this commit:
  https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?h=bpf/tracing_multi&id=8814108949537edaae84fbeee1cbc28280590b7f

background.. it's poc code for bpf tracing-multi attachment. Most likely we will
go with Menglong change instead [1], but it could use this direct interface in a
same way for speeding up the attachment

jirka


[1] https://lore.kernel.org/bpf/20250528034712.138701-1-dongml2@chinatelecom.cn/

