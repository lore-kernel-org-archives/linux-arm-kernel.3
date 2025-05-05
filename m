Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C4AC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 18:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+rx5YkRQB2m3RpX0Dkv55899VOEaYs/uah1PbfJoNU=; b=wkPUjXZ5DoIHpMMYbx/wnxZeSk
	8p3PKRbF3hlNSNtBWjafMXZcGqOwosJIkjJGfPDD+MYy6VM7CQZPGCzPZbDDu4Ejh9j1UZG+oq2ee
	gc8lH9jlMmllNB/9czNXAPOgmuVc06dQ0nxccloV3t/sdiywM1YSXqOs9Wn6w6HlNl+Mxzo5GxRM/
	zthcblkwsiYL2f/qGYR66330hUkLgzrmWAbj0Y5V5f4HGnyNwoftc67t2NBifksVJ997+KvvYCo/h
	GkT0THeynD/Z5XgDsEGX33GpmnCjsMFu1QN0gWLjFInyq2+n15ykMZowRnBg3FAXrA2oENjuFv0kw
	HFcTWOAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC0dw-00000008Ifl-2LhW;
	Mon, 05 May 2025 18:34:20 +0000
Received: from mx-rz-1.rrze.uni-erlangen.de ([131.188.11.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC0bw-00000008IRe-2EMT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 18:32:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1746469919; bh=G+rx5YkRQB2m3RpX0Dkv55899VOEaYs/uah1PbfJoNU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From:To:CC:
	 Subject;
	b=yW8pmccQZmfxN/uiui/GsNvYsuT03rI5l+mrjcdBr8Ba/sIQtV3vWyU7uepeyBqlU
	 Fv991SaO8f4A9H4Cs8LHYsaEcvP8iZRw+qZ9sYJmOzltJQexukPzSArDcZ7Rduh3cl
	 evsmAIf4OEVEGBDNIzUEWaCy2Dle4rlovBLNzZrCCWl+KbdfPIlLdK+eGkIvjVfNue
	 0ddGuOxWrA9BnMQxJI7zuSyzVSkw0f+S3FI4ONcmlBPsDt0TG7nyCgq44GGWwq9YLH
	 DV6JcUf0p1lcLcmIG/I/jjQJ6fj+56LZ4DZ+Ie6WbrtZmmetbjEfZhii7Gc6WQWMla
	 S8vi6tD+TLzsg==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-1.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4Zrqqy6XMDz8sgT;
	Mon,  5 May 2025 20:31:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at boeck1.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:360f:4200:9271:67e3:d4db:9352
Received: from localhost (unknown [IPv6:2001:9e8:360f:4200:9271:67e3:d4db:9352])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX18Yw8S/8gEWPxucUMHgztU2l/wqL20Lctk=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4Zrqqv4bwgz8t5P;
	Mon,  5 May 2025 20:31:55 +0200 (CEST)
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
  Henriette Herzog <henriette.herzog@rub.de>,  Saket Kumar Bhaskar
 <skb99@linux.ibm.com>,  Cupertino Miranda <cupertino.miranda@oracle.com>,
  Jiayuan Chen <mrpre@163.com>,  Matan Shachnai <m.shachnai@gmail.com>,
  Dimitar Kanaliev <dimitar.kanaliev@siteground.com>,  Shung-Hsi Yu
 <shung-hsi.yu@suse.com>,  Daniel Xu <dxu@dxuuu.xyz>,  bpf@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org,  linux-kselftest@vger.kernel.org,
  Maximilian Ott <ott@cs.fau.de>,  Milan Stephan <milan.stephan@fau.de>
Subject: Re: [PATCH bpf-next v3 02/11] bpf: Move insn if/else into
 do_check_insn()
In-Reply-To: <15294d369d94cf005c9aa722967e5ddb1fa8cee3.camel@gmail.com>
	(Eduard Zingerman's message of "Thu, 01 May 2025 11:22:53 -0700")
References: <20250501073603.1402960-1-luis.gerhorst@fau.de>
	<20250501073603.1402960-3-luis.gerhorst@fau.de>
	<15294d369d94cf005c9aa722967e5ddb1fa8cee3.camel@gmail.com>
User-Agent: mu4e 1.12.8; emacs 30.1
Date: Mon, 05 May 2025 20:31:54 +0200
Message-ID: <87tt5yhpt1.fsf@fau.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_113216_718871_52BF2E80 
X-CRM114-Status: UNSURE (   8.85  )
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

Eduard Zingerman <eddyz87@gmail.com> writes:

> On Thu, 2025-05-01 at 09:35 +0200, Luis Gerhorst wrote:
> 
>> +		dst_reg_type = cur_regs(env)[insn->dst_reg].type;
>
> Implicitly relying on `insn == &env->prog->insnsi[env->cur_idx]`
> is weird. Still think that `insn` parameter should be dropped and
> computed inside this function instead.
>
>> +				return -EINVAL;
>> +			}
>> +process_bpf_exit_full:
>
> Nit: since we are refactoring I'd extract this as a function instead of goto.

Both done, thanks again for the review and testing!

