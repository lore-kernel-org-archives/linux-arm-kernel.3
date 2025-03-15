Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A735C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 15:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=08eKfAUvxdmkmUvYQ9Z9AT/EYdDCAc7pdtIm2LqpGzA=; b=u6RTi2g7ykAw4RPPjAPrzyhoXV
	VqeJYvBB20a1lOmLIlqUiBNRwPt4JOBkxSQyTZW6nTKy/fyRd7PYQI5Fgjf/9hArGGjGiumFPtqFD
	rO6ML3OnMHNA+ckXWFRqG0H3/wAAtMbbBn+kdb3dYBkBuhony98ymqU6BHDR9cH02dUX+mdgxgVSC
	9rDYzYT9Fn9TsK0ReBeNPJRdt1jttK+pP72MSISUHqBuBlEBJmQyVqAuVUcjxIh6SIQknhwdaxma5
	hwN1wDNPIqI705P62N0CgrF4uY4Kkgvd0wGt+tzSUGmO58YM7gtqv31FP01Lq0tVmaSWDyOg0l53Q
	9aqh+9Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttTLK-0000000GW6d-3jFR;
	Sat, 15 Mar 2025 15:22:30 +0000
Received: from mx-rz-1.rrze.uni-erlangen.de ([2001:638:a000:1025::14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttTJf-0000000GW0a-03Mx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 15:20:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1742052044; bh=08eKfAUvxdmkmUvYQ9Z9AT/EYdDCAc7pdtIm2LqpGzA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From:To:CC:
	 Subject;
	b=mznAtxiI1kJuIBGKAbfrHe6w8x8MA9DVTQPXk3d0my5iXVoXYyYABprKtB8tsWFBP
	 IkwTRc8+ap+WYBbwmrQWhSV0m9CL4aXTKUwg+EgWYk7H2Q9v6S26SmWQmn3h0tVjKP
	 PW4Hjph9jWSGlvjfSp3NqEYZMytJJebnCfFwlyQ8ItHpvN4IJwIJDGSJJj5nlIG8oB
	 f4y7PpcYRkrZFk59ynAPhYK+hN15mdRnsw+QqcsHbs4b5jq0Ljql5F3KPCtWe0TtvX
	 KOr+N2VQNrjSOSmQLSHS85rICmx9EfETv2j5XneoH+uB+VGhSTk9d7F9MyrYqRj2pR
	 UEDCDnkIFd04Q==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-1.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4ZFQ0q6mX6z8tyl;
	Sat, 15 Mar 2025 16:20:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at boeck1.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:361f:c600:5210:4b80:a502:1f98
Received: from localhost (unknown [IPv6:2001:9e8:361f:c600:5210:4b80:a502:1f98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX1/OU7HXrel01HL8JhXs/U6F2fHJ1Gpb/vM=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4ZFQ0m590Xz8sYS;
	Sat, 15 Mar 2025 16:20:40 +0100 (CET)
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
 <yangtiezhu@loongson.cn>
Subject: Re: [PATCH bpf-next 00/11] bpf: Mitigate Spectre v1 using barriers
In-Reply-To: <f6f08d64c777a6022771ab0adf96cefb6b631d75.camel@gmail.com>
	(Eduard Zingerman's message of "Fri, 14 Mar 2025 16:40:08 -0700")
References: <20250313172127.1098195-1-luis.gerhorst@fau.de>
	<f6f08d64c777a6022771ab0adf96cefb6b631d75.camel@gmail.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Sat, 15 Mar 2025 16:20:39 +0100
Message-ID: <87seneqq0o.fsf@fau.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_082047_210510_D0415891 
X-CRM114-Status: GOOD (  10.68  )
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
> I think it would be good to have some tests checking that nospec
> instructions are inserted in expected locations.
> Could you please take look at use of __xlated tag in e.g.
> tools/testing/selftests/bpf/progs/verifier_sdiv.c ?

That looks very promising, I will look into it for v2. Thanks for the
pointer.

I guess it might be worth it to add __xlated to at least on test per
nospec-related code path. If there are other rewrites at play that will
make it harder to adapt the tests when the other rewrite is ever
changed, but it might also help in catching interactions between the
other rewrites and the nospec.

Also, thanks for the review of patches 2 and 3.

