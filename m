Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B12C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 08:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8g3BGN/mHpuPfK1H4SEVNvXxea99G16e6oOkBugydQ=; b=2pTyoUZXpFO4A0cN9j6ZUb8Jpi
	PvIkkJPu3f0u0vFLPfUvfJe3Rm1TO80afCV11ijxo29oOHHDLDJ9HzoXfpTfTbcAQ5Jdk39LKDuUc
	C9w9e2Mm3qmXeYCIZnZXvOGMHjnr5JnE3v6se0OTaM+dGjWnajRLY0wS4bHIU5O0JxZ+GbFhw7rzG
	MJpUAKeTJYyq9tayU+UqDxJkg5j8JjGhgrw1z9UahndK0v/07BslqirCn1QO5IDuuP6ih8iAU5ddx
	D7JoiYGFQg3Q3rQZr1FltVc7uHGGqC7f0QMEAchF3oHtiIMCfQoAK/eFpsXq8x8DzFVMU4lbOeFgG
	Ebnd2now==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRyf-000000055mg-0iTe;
	Tue, 18 Mar 2025 08:07:09 +0000
Received: from mx-rz-3.rrze.uni-erlangen.de ([2001:638:a000:1025::16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRrS-0000000548A-0ffG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 07:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1742284770; bh=T8g3BGN/mHpuPfK1H4SEVNvXxea99G16e6oOkBugydQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From:To:CC:
	 Subject;
	b=keevS7WotUTlE4uv/uI0BB9M4xxOkfuah7+yI24TqsIPktTPJvCGGObVIIW6jeZKP
	 w/bt5U30Oj42lmLjgCWzHND/darszlQnzkm2TfzKKC+5r8+zbw9gW/2+jMj1r8WoJN
	 GWRd9JqWh62APoSyejo2Ue2ELzZ0R2JZChH0j3j5Gac6QGaEneNPA6B1S4KPi+9Ymt
	 yq1OYftJSwHLFuepJ7+09KW9dPLsPrN4xGbBORAPBGx98UMms/frWVgz3oxRkMuf8t
	 uCDu2K54M6rBVztc9Rrz/SOMocwXb+IlFyT1Lw80YIgT51+KovX1JWNEK+/fOk+RjO
	 cQLLlEgHw199w==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-3.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4ZH44K5yb4z1xqh;
	Tue, 18 Mar 2025 08:59:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at boeck4.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2a02:8071:7900:bc0:c583:a400:7f8d:5e80
Received: from localhost (unknown [IPv6:2a02:8071:7900:bc0:c583:a400:7f8d:5e80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX1/njMYOnHzLTANywgVWOWsVTWqW358Unx4=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4ZH44G1Xjqz1yjk;
	Tue, 18 Mar 2025 08:59:26 +0100 (CET)
From: Luis Gerhorst <luis.gerhorst@fau.de>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,  Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>,  Martin
 KaFai Lau <martin.lau@linux.dev>,  Song Liu <song@kernel.org>,  Yonghong
 Song <yonghong.song@linux.dev>,  John Fastabend
 <john.fastabend@gmail.com>,  KP Singh <kpsingh@kernel.org>,  Stanislav
 Fomichev <sdf@fomichev.me>,  Hao Luo <haoluo@google.com>,  Jiri Olsa
 <jolsa@kernel.org>,  Puranjay Mohan <puranjay@kernel.org>,  Xu Kuohai
 <xukuohai@huaweicloud.com>,  Catalin Marinas <catalin.marinas@arm.com>,
  Will Deacon <will@kernel.org>,  Hari Bathini <hbathini@linux.ibm.com>,
  Christophe Leroy <christophe.leroy@csgroup.eu>,  Naveen N Rao
 <naveen@kernel.org>,  Madhavan Srinivasan <maddy@linux.ibm.com>,  Michael
 Ellerman <mpe@ellerman.id.au>,  Nicholas Piggin <npiggin@gmail.com>,
  Mykola Lysenko <mykolal@fb.com>,  Shuah Khan <shuah@kernel.org>,
  Henriette Herzog <henriette.herzog@rub.de>,  Cupertino Miranda
 <cupertino.miranda@oracle.com>,  Matan Shachnai <m.shachnai@gmail.com>,
  Dimitar Kanaliev <dimitar.kanaliev@siteground.com>,  Shung-Hsi Yu
 <shung-hsi.yu@suse.com>,  Daniel Xu <dxu@dxuuu.xyz>,  bpf@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org,  linux-kselftest@vger.kernel.org,  George
 Guo <guodongtai@kylinos.cn>,  WANG Xuerui <git@xen0n.name>,  Tiezhu Yang
 <yangtiezhu@loongson.cn>,  Maximilian Ott <ott@cs.fau.de>,  Milan Stephan
 <milan.stephan@fau.de>
Subject: Re: [PATCH bpf-next 09/11] bpf: Return PTR_ERR from push_stack()
In-Reply-To: <9083b52fd4a2d7a5a0473e858042c277c883f8b0.camel@gmail.com>
	(Eduard Zingerman's message of "Mon, 17 Mar 2025 02:19:08 -0700")
References: <20250313172127.1098195-1-luis.gerhorst@fau.de>
	<20250313174149.1113165-1-luis.gerhorst@fau.de>
	<20250313174149.1113165-4-luis.gerhorst@fau.de>
	<9083b52fd4a2d7a5a0473e858042c277c883f8b0.camel@gmail.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Tue, 18 Mar 2025 08:59:24 +0100
Message-ID: <87r02uu5ur.fsf@fau.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_005942_630558_EE23F5EB 
X-CRM114-Status: GOOD (  12.86  )
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

Eduard Zingerman <eddyz87@gmail.com> writes:

> Could you please point me to a location, where exact error code
> returned by updated push_stack() matters?
> I checked push_stack() callgraph (in the attachment), but can't find
> anything.

Only with the final patch 11 ("bpf: Fall back to nospec for spec path
verification") applied, the error code should matter. Then, the error
code either matches `state->speculative &&
error_recoverable_with_nospec(err)` in do_check() if it was EINVAL (in
this case we heuristically avoided nested speculative path verification
but have to add a nospec), or we continue to raise the error (e.g.,
ENOMEM) from do_check().

Or is your question on this part from the commit message of patch 9?

  This changes the sanitization-case to returning -ENOMEM. However, this
  is more fitting as -EFAULT would indicate a verifier-internal bug.

This was referring to the sanitize_speculative_path() calls in
check_cond_jmp_op(). For that case, the error should also only be used
in do_check() with patch 11 applied. However, regarding this, EFAULT and
ENOMEM are treated the same (they both don't satisfy
error_recoverable_with_nospec()), therefore this change is primarily
made to not complicate the code.

I just became aware that there is some special handling of EFAULT as
discussed in c7a897843224 ("bpf: don't leave partial mangled prog in
jit_subprogs error path"). I will have look into this in detail to make
sure changing push_stack() from EFAULT to ENOMEM is OK.

Hope this answers your question.

Adding some of these details to v2 won't hurt I guess.

