Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DEAC02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 00:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEzrHrdt0goZW6xuyG7hCMqy+oltKW4CxtAbZ+3uSb8=; b=NstIsG8fAt9n4G5ySJYDAqJZ81
	1tknbn+fPwQShHsBlMAk0ruM2kpugQtdodICACMQHzV52TR2hZvZ/1jSKiKkDSokiXK3GHouSxqTE
	oMz0f403DbfkeZV1a6nNHWZEnH2s6eFFfVeSiMH7HXAkxGuNA7zVmy0yi6cK9W2O70EH2pJm0qtM3
	vtEu/LG05wIqH20evR0ZJ9PBqTIcbsHTqvXPMLCsHYmgawFKhDHPXAYfdi96jObmHsewx9KZY8gXT
	rB0Hm2WsiUfarnkwMNa/R/SC9pQGP31Tj8WcLBxKibNJ57AelP6drooDqut70pQv0LyP6oZByo0rQ
	2fmL5c4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf6rF-0000000Gxee-2uhR;
	Tue, 04 Feb 2025 00:32:05 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf6pt-0000000GxW8-3vZJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 00:30:43 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-219f6ca9a81so18575ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 16:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738629040; x=1739233840; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vEzrHrdt0goZW6xuyG7hCMqy+oltKW4CxtAbZ+3uSb8=;
        b=02XKgHUcyrbUb6gwbnUO+XAQwXrm2VPmINfXu+i7/uX22bCv5MjEkztoFreD7HzqIA
         3nN6qJ7zMq4DGuCIoRhKPnTdZGyTkpkttP9lXI3gEglhld0HsPYYMedCc0ykPA/Q8FfE
         6vcxvrfbZCrPV3bIv7Z8/Ra7nq+EBXAW/rD7PiXPwn3cqMkv/f37MEUpVdSvDlXStOwj
         j+wFwkwbHL3SWbZnPrzaTwragCOAGz8Rk6TBXOitTDwXcKzynMphWCs+wPBO0E3VG0U0
         eu/2Pp92I/A99sBvXJcYTkeKDzS/cz+aYjSRNaICUmmi4ntK+BttL1uNmFllj3KJzKzU
         lgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738629040; x=1739233840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEzrHrdt0goZW6xuyG7hCMqy+oltKW4CxtAbZ+3uSb8=;
        b=qq7DfV/mhA3EU708R7XE3yMqh5z1QOwbMHdXZ5lBrdv20k+tGNbk5x1MM8y+jA2dW0
         1OGALqWbKbZMh1o99p6sXT65EuQAs5+1UikQkCOb9SFDFvOdgl7Me+gWX9PPVWTczevb
         L0v7CsnwV73KGNY5foOdO23fioNKFH8CXtaO46cTshjE6Xr0B8IEfh7faxFffYvUyVy6
         ltMx3KYAu5dvfpYNASBfZoebIi+mpzAIaxh2W8J7qVQ1hzB3BD6iByNRZxmmC3U4yTc5
         ZRr2SLXxHOfvdsjN2cxDD9xgrtt38DDJEXBiDaXitNCU/P+6b+hBgkfBtcmGYSj2/4rK
         R7JA==
X-Forwarded-Encrypted: i=1; AJvYcCWK4rM+0B/PSqL1CZ1fFy38T3NEOcV6ACnGzxHaUeOkinMGR6nGtRPY7cvg1R1W9HtrzcqQbiIXZ7f2LRxZ/VhE@lists.infradead.org
X-Gm-Message-State: AOJu0YxejjiyOtgzBJ4Am9+qKlS1hkLV4wI5WcIWKDsc/OK3sXJ5BIkx
	JEgwk+0A/RIG1eNbSleftwlsjyAQKfcPfJSiEkokFmDZqh+vHieimnvnVTG2QQ==
X-Gm-Gg: ASbGncusVI9jRXsw5WEiOYTBwrCn25e1TGbIHYuqfPRcCjvLU77S0PMw+2NPuwMHdJb
	zRXnkofgu64E0+MhQMn0UodAZOHc4D834CiU3PeSrTvmR28epouJgK9OV82pO7e1BQseGcMoQZp
	D11paVkER0Ej7Zmxr66PCUSNTZnE6mmG69+zDXvK+LuKQecXrP32pKRrcvOCb9lDe+y+RU11QyW
	Uzzx3fOvWZdEWIyrKCcXZz9+tDtm2kdZw4UDIqRKwCF3INPC1RyyID8/KTR/7sdTR+JqY+2RjjJ
	qZjcpwI9m9o0uAv26uhvhSn6gsDhCpVQj2433jtB16Nu4bb2HLvxqqE=
X-Google-Smtp-Source: AGHT+IHikxLNTW3iYhv8Z5ZOqr8vWjwaYU1u/+FyXYyb6zbBw/ySBIpLXMurmcvACGA5bpuElmc2/w==
X-Received: by 2002:a17:902:eb8d:b0:21d:dbe3:fc48 with SMTP id d9443c01a7336-21f005bb8b2mr1164915ad.28.1738629040175;
        Mon, 03 Feb 2025 16:30:40 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3334694sm82930165ad.257.2025.02.03.16.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 16:30:39 -0800 (PST)
Date: Tue, 4 Feb 2025 00:30:34 +0000
From: Peilin Ye <yepeilin@google.com>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bpf@ietf.org,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	David Vernet <void@manifault.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Quentin Monnet <qmo@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>,
	Neel Natu <neelnatu@google.com>,
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v1 7/8] selftests/bpf: Add selftests for
 load-acquire and store-release instructions
Message-ID: <Z6Ffquq8IORjCqrI@google.com>
References: <cover.1737763916.git.yepeilin@google.com>
 <3f2de7c6e5d2def7bdfb091347c1dacea0915974.1737763916.git.yepeilin@google.com>
 <131a817f7f2749e78e527a251ca7971588cf62f8.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <131a817f7f2749e78e527a251ca7971588cf62f8.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_163041_978537_AD4AB244 
X-CRM114-Status: GOOD (  15.41  )
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

Hi Eduard,

One more question (for my understanding):

On Tue, Jan 28, 2025 at 05:06:03PM -0800, Eduard Zingerman wrote:
> On Sat, 2025-01-25 at 02:19 +0000, Peilin Ye wrote:
> > --- a/tools/testing/selftests/bpf/progs/arena_atomics.c
> > +++ b/tools/testing/selftests/bpf/progs/arena_atomics.c
> [...]
> 
> > +SEC("raw_tp/sys_enter")
> > +int load_acquire(const void *ctx)
> > +{
> > +	if (pid != (bpf_get_current_pid_tgid() >> 32))
> > +		return 0;
> 
> Nit: This check is not needed, since bpf_prog_test_run_opts() is used
>      to run the tests.

Could you explain a bit more why it's not needed?

I read commit 0f4feacc9155 ("selftests/bpf: Adding pid filtering for
atomics test") which added those 'pid' checks to atomics/ tests.  The
commit message [1] says the purpose was to "make atomics test able to
run in parallel with other tests", which I couldn't understand.

How using bpf_prog_test_run_opts() makes those 'pid' checks unnecessary?

[1] https://lore.kernel.org/bpf/20211006185619.364369-11-fallentree@fb.com/#r

Thanks,
Peilin Ye


