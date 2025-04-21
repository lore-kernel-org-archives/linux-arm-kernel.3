Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E649C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 14:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHRKLKa57WaRcw3gsgSapFs5eoq+g/y962Gr8FAxtJ4=; b=zyQtdsnM2khHuXtNGFCnTiUbdS
	VtGIomdn/vQ6KTubECPXYOdozLMhIyCn10tIBKc7aSt3LqutwtgIb3vyjxDV/BVrTcenTVkoXFnvY
	lKprzLyY5OudWQzB3W9Am0SwtvlvGJ8Js7w8KPC5u6pgDpK5nf5ntPCThuTKrTdQzx+mPt5BFsuA0
	UOQ0WnathbfGy2H0HyTlhy4j0bS1/byRLfciJyr9R9XOKd4IrQhdUFZNbiksQ4UZaStWYKa9SmMv9
	h/kt26oj1b1aI1UyjokrHVRuleNWDAA0Ma6BzIGkNEgDPeZUDCdTBD7Zcxw28M3FArP5gNXIQxaUP
	yxBKcwoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6s66-00000004Rs0-1OvP;
	Mon, 21 Apr 2025 14:26:10 +0000
Received: from mx-rz-2.rrze.uni-erlangen.de ([2001:638:a000:1025::15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6s39-00000004RPY-3viV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 14:23:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1745245384; bh=dHRKLKa57WaRcw3gsgSapFs5eoq+g/y962Gr8FAxtJ4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From:To:CC:
	 Subject;
	b=orBiie4cvNrHVv1JbBWkrpOyYmyGmifj9slSFQzZ0sJetOlRXTDNVGexBpdHSLlCj
	 cIRmDtYCELKKpt25P9o50N7Y+j9jsWe+aLzGb7aUsWJA9N64p44PwD8KSuAJ4OjZJB
	 XZ/ImmqlxC4T3CkcYfAZJBcM3JIzvolN8AqEG1ESQtwmvQXdXlF0t9Lnu4dsv8XVMd
	 dOj+KKY125Rtr8bCcieX7+VlKdKSQWGglObQaut+Mmr0zxuF1dr3qH1s8G40zgEohX
	 itn/AJJ+UntW48id29kZH/dXMJJNuSAKYM4NQG3NbSOJdhyEJRv3pYs07IFq2UTGT0
	 zumuzse94SOdg==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-2.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4Zh6zD2qDxzPjmG;
	Mon, 21 Apr 2025 16:23:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at boeck5.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:3600:7e00:5b67:6b9c:caeb:75c
Received: from localhost (unknown [IPv6:2001:9e8:3600:7e00:5b67:6b9c:caeb:75c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX1+yS0Gm16sXrv8zOrS9nARAtw0fhZkEU8I=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4Zh6yw2GKwzPjsn;
	Mon, 21 Apr 2025 16:22:48 +0200 (CEST)
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
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
 henriette.herzog@rub.de
Subject: Re: [PATCH bpf-next v2 05/11] bpf, arm64, powerpc: Add
 bpf_jit_bypass_spec_v1/v4()
In-Reply-To: <202504212142.V3yjAcaI-lkp@intel.com> (kernel test robot's
	message of "Mon, 21 Apr 2025 21:17:56 +0800")
References: <20250421091802.3234859-6-luis.gerhorst@fau.de>
	<202504212142.V3yjAcaI-lkp@intel.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Mon, 21 Apr 2025 16:22:47 +0200
Message-ID: <87r01lzj9k.fsf@fau.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_072308_120204_D5460A99 
X-CRM114-Status: UNSURE (   7.21  )
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

kernel test robot <lkp@intel.com> writes:

> All warnings (new ones prefixed by >>):
>
>>> kernel/bpf/core.c:3037:13: warning: no previous prototype for 'bpf_jit_bypass_spec_v1' [-Wmissing-prototypes]
>     3037 | bool __weak bpf_jit_bypass_spec_v1(void)
>          |             ^~~~~~~~~~~~~~~~~~~~~~
>>> kernel/bpf/core.c:3042:13: warning: no previous prototype for 'bpf_jit_bypass_spec_v4' [-Wmissing-prototypes]
>     3042 | bool __weak bpf_jit_bypass_spec_v4(void)
>          |             ^~~~~~~~~~~~~~~~~~~~~~

That's because the prototypes in include/linux/bpf.h were in the #ifdef
CONFIG_BPF_SYSCALL. I fixed this for v3 by moving the prototypes out of
the ifdef.

