Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B062BC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 10:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ce0GIrbVfPWC7H8gy4FhbwT9KDZQbFbYWNbCLDBescY=; b=hF3akjZCmiNFNiIkNkrpC1SN5E
	mVLANA8w/A88F2Ozh1DvzRa2HSZWJwnYxxq6M1CX31a4ph6Mn2hCRPB5+cEubkfPG/MSQSKABNBSm
	71eRRPong3dp0h+t/7fwrPhf+HV04mbAZYlAjLbSOxQrsz0relHHE6Tt5qqLjQ/Fs0EQAEjgx9Tn9
	u8lQvVSWUuLukSjNJWIleTsUVvD+b6O7P5yhYbpdsaHeUstRJt0iwu2OuuDanJoHUVMyY08uy2FGN
	g+G36PKjWfCN3XAMC924L6szfDCxQYvAq782A6wSFfCrOpxgGNQg9p9myK0bcZBWGn0bEjD4Df/6P
	97pwSlCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8dDF-00000001tSO-10gA;
	Sat, 26 Apr 2025 10:56:49 +0000
Received: from mx-rz-3.rrze.uni-erlangen.de ([2001:638:a000:1025::16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8dBM-00000001tJL-00er
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 10:54:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1745664879; bh=Ce0GIrbVfPWC7H8gy4FhbwT9KDZQbFbYWNbCLDBescY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From:To:CC:
	 Subject;
	b=Y0zaE4Y9YZ0haQY9H50iAWqNCuovbbuQ7R25J9ew8C6QDDjBdXmPhnIaOdR7ckEuH
	 hMAoEYrWTjho84BJUjxwmy7qHUKTALqbu6vYKqX3ZIP53Pwa6YbZdN+9x+tPs0fk4U
	 natPf1ZcLG1WRhbeqA9mqq1aEEdOv0vcx5Z0DaGjT9mfjq16B6QFaHno2/nd1hTofx
	 rTDA7W35vkIwtud31kdGsJcLA+DWKpLTCbcA1quyi48iUmZ5ou3M6AeUJJHiEr2Xxh
	 yEo7p6HlwHUqb/6Cf5O9+SNrdyGEH9llvJd66rQ2B3AKpu8llaYHx+Pb9+kfW/s/nV
	 X9PcK+83aAJUg==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-3.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4Zl66Q6ybQz1yN6;
	Sat, 26 Apr 2025 12:54:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at boeck2.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:361b:dc00:c019:e67c:3dc8:e824
Received: from localhost (unknown [IPv6:2001:9e8:361b:dc00:c019:e67c:3dc8:e824])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX19VP6nuyGgC1ZFJikQ/3jfzd/7EixAh4QE=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4Zl66M4BX7z1xys;
	Sat, 26 Apr 2025 12:54:35 +0200 (CEST)
From: Luis Gerhorst <luis.gerhorst@fau.de>
To: kernel test robot <lkp@intel.com>
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
 Lysenko <mykolal@fb.com>,  Shuah Khan <skhan@linuxfoundation.org>,
  Henriette Herzog <henriette.herzog@rub.de>,  Saket Kumar Bhaskar
 <skb99@linux.ibm.com>,  Cupertino Miranda <cupertino.miranda@oracle.com>,
  Jiayuan Chen <mrpre@163.com>,  Matan Shachnai <m.shachnai@gmail.com>,
  oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 06/11] bpf, arm64, powerpc: Change nospec to
 include v1 barrier
In-Reply-To: <202504220035.SoGveGpj-lkp@intel.com> (kernel test robot's
	message of "Tue, 22 Apr 2025 00:24:41 +0800")
References: <20250421091802.3234859-7-luis.gerhorst@fau.de>
	<202504220035.SoGveGpj-lkp@intel.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Sat, 26 Apr 2025 12:54:35 +0200
Message-ID: <874iyb6vmc.fsf@fau.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_035452_500067_5328650D 
X-CRM114-Status: GOOD (  14.81  )
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

kernel test robot <lkp@intel.com> writes:

> All errors (new ones prefixed by >>):
>
>    arch/powerpc/net/bpf_jit_comp64.c: In function 'bpf_jit_build_body':
>>> arch/powerpc/net/bpf_jit_comp64.c:814:4: error: a label can only be part of a statement and a declaration is not a statement
>      814 |    bool sync_emitted = false;
>          |    ^~~~
>>> arch/powerpc/net/bpf_jit_comp64.c:815:4: error: expected expression before 'bool'
>      815 |    bool ori31_emitted = false;
>          |    ^~~~
>>> arch/powerpc/net/bpf_jit_comp64.c:833:6: error: 'ori31_emitted' undeclared (first use in this function)
>      833 |      ori31_emitted = true;
>          |      ^~~~~~~~~~~~~
>    arch/powerpc/net/bpf_jit_comp64.c:833:6: note: each undeclared identifier is reported only once for each function it appears in

Fixed this for v3. For the other archs, the patches also don't add
declarations in a switch/case.

I also checked that there are no new W=2 warnings for the touched C
files on x86 with the vmtest bpf config.

I have not checked that all files that include a touched header don't
have new warnings. When doing -j $(nproc) the diff does not work and
with -j 1 it takes forever (e.g., because bpf.h is touched). If you
think this is required just let me know (and if you have a tip on how to
do it more quickly that would be great too).

