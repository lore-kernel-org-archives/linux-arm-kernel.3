Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA01C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 21:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=14iBWL0wepR+/NLmlKQ5GYaXgIUdICdBtkY2wCSNDec=; b=Xzf0hgNV49YNADCbR5xblzbtKh
	vpIQNSGGEGU/FRPK0IszwnZvG3QNwt1zDFTGuSv95LFN/meY7p417tz6xw3ezMniA+yZshhnZIcLi
	gQPg4wgAOHD7EE4ZcVP6ulT7phMRT6x3atnINN3gbqYDQk/B5wtaOa1QRWUSNO+PfQxr+ut0jJ3gN
	U497UwqxUJ9S6e7bRiE9iEl+z4ZXvwKdo4LpYbGeaOpl2dYDzzQToZ9c+NW6cGv79licyUR5B5XTy
	Kq5M8qLh/6jRfT6p5pf8NuAOJ6Zoey12B2kKo4C7pfLFdXmtVNXQiFz3KQb6u55uAS+F5butZ86qu
	Lb6qhEiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMYwp-0000000Bqu0-0ATB;
	Tue, 03 Jun 2025 21:13:27 +0000
Received: from mx-rz-1.rrze.uni-erlangen.de ([131.188.11.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMYrB-0000000BqO5-2fTu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 21:07:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1748984854; bh=14iBWL0wepR+/NLmlKQ5GYaXgIUdICdBtkY2wCSNDec=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From:To:CC:
	 Subject;
	b=IBFvhYONv1CxQ8hzdbccA0do1pDzSADmtjNUFlQU2JzbsM12pPTYhLqvp37pahvoE
	 rrSrdmfNp3Nt5YGuMGnGjDGzELq5uRsNqxzq59EQ9Y+oEFk/5LUgAmyLeW3lTt8liJ
	 PlK98jVBngVNcPhrktkxboft4I+BIC2odUZKVqEsSrdJKgB98QfpDecgaq8hYROMWk
	 rqSxwb0QPnb1QogbfEmhDL03tC4gSOK4xXbwLWMwnOZLdU7sIjNK2N2/70zNkTHzr5
	 Ick8KcekAT4d/emYkOsQucPmA6u70cGX/m+ebNbKfXlTQlmQzIjB+icu8wvzfzGkSX
	 sHL3W5JZwzsBA==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-1.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4bBjw63sNsz8swQ;
	Tue,  3 Jun 2025 23:07:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at boeck1.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:3639:fe00:a21f:4ce4:8495:5578
Received: from localhost (unknown [IPv6:2001:9e8:3639:fe00:a21f:4ce4:8495:5578])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX19rrgm+35nUwSoCdL9l4H5ISQMck9KR3zw=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4bBjw24t9Nz8shV;
	Tue,  3 Jun 2025 23:07:30 +0200 (CEST)
From: Luis Gerhorst <luis.gerhorst@fau.de>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,  Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>,  Martin
 KaFai Lau <martin.lau@linux.dev>,  Eduard Zingerman <eddyz87@gmail.com>,
  Song Liu <song@kernel.org>,  Yonghong Song <yonghong.song@linux.dev>,
  John Fastabend <john.fastabend@gmail.com>,  KP Singh
 <kpsingh@kernel.org>,  Stanislav Fomichev <sdf@fomichev.me>,  Hao Luo
 <haoluo@google.com>,  Jiri Olsa <jolsa@kernel.org>,  Puranjay Mohan
 <puranjay@kernel.org>,  Xu Kuohai <xukuohai@huaweicloud.com>,  Catalin
 Marinas <catalin.marinas@arm.com>,  Will Deacon <will@kernel.org>,  Hari
 Bathini <hbathini@linux.ibm.com>,  Christophe Leroy
 <christophe.leroy@csgroup.eu>,  Naveen N Rao <naveen@kernel.org>,
  Madhavan Srinivasan <maddy@linux.ibm.com>,  Michael Ellerman
 <mpe@ellerman.id.au>,  Nicholas Piggin <npiggin@gmail.com>,  Mykola
 Lysenko <mykolal@fb.com>,  Shuah Khan <shuah@kernel.org>,  Henriette
 Herzog <henriette.herzog@rub.de>,  Saket Kumar Bhaskar
 <skb99@linux.ibm.com>,  Cupertino Miranda <cupertino.miranda@oracle.com>,
  Jiayuan Chen <mrpre@163.com>,  Matan Shachnai <m.shachnai@gmail.com>,
  Dimitar Kanaliev <dimitar.kanaliev@siteground.com>,  Shung-Hsi Yu
 <shung-hsi.yu@suse.com>,  Daniel Xu <dxu@dxuuu.xyz>,  bpf@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org,  linux-kselftest@vger.kernel.org,
  Maximilian Ott <ott@cs.fau.de>,  Milan Stephan <milan.stephan@fau.de>
Subject: Re: [PATCH bpf-next v3 10/11] bpf: Allow nospec-protected
 var-offset stack access
In-Reply-To: <CAP01T76HZ+s5h+_REqRFkRjjoKwnZZn9YswpSVinGicah1pGJw@mail.gmail.com>
	(Kumar Kartikeya Dwivedi's message of "Fri, 2 May 2025 02:03:12 +0200")
References: <20250501073603.1402960-1-luis.gerhorst@fau.de>
	<20250501073603.1402960-11-luis.gerhorst@fau.de>
	<CAP01T76HZ+s5h+_REqRFkRjjoKwnZZn9YswpSVinGicah1pGJw@mail.gmail.com>
User-Agent: mu4e 1.12.8; emacs 30.1
Date: Tue, 03 Jun 2025 23:07:30 +0200
Message-ID: <874iwwlejx.fsf@fau.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_140737_821150_39B32358 
X-CRM114-Status: GOOD (  10.69  )
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

Kumar Kartikeya Dwivedi <memxor@gmail.com> writes:

> Hmm, while reading related code, I noticed that sanitize_check_bounds
> returns 0 in case the type is not map_value or stack.
> It seems like it should be returning an error, cannot check right now
> but I'm pretty sure these are not the two pointer types unprivileged
> programs can access?
> So smells like a bug?

I now looked into this and as suspected it does not appear to be a bug
but only misleading code, I have sent a patch with a detailed
explanation and an assert:
https://lore.kernel.org/bpf/20250603204557.332447-1-luis.gerhorst@fau.de/T/#u

