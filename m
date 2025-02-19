Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0698C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 16:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ATP4p4UlgNOvnzmUO8LGNDojzAprJLUFGASv+dUIMf4=; b=hVdiz2pcm97m7c5J1rTLDohv4+
	BO6aTYSphZJzNgMTS1Qyrn9DE9hb0jytqRTcuqenNdVZVRhuqGko5GxNn/+tHJcYWdKMSe0cK06Rg
	FA5Dv0khitVlIxpo0GelGI3YMdTbtGmSydHCATRnrn+XdYcVLr1PLfBXY3vMs8PV2ajmjPyeIAjN7
	IVcpoGsrW+2WdJRnEgE41E5+QoivSH7nKD8Xs5GU3OcIsC/d/lSURXgr8Dy0FFiTHoV3O1CSMHRKS
	kRF0wix4mRjUHBZWa2bv8I0Vyl9RSAUmTYl7ZZx7W62yvRoZ6zRXigkd++LbxV/kDHFd3VrnrgezB
	5quqqLKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkmto-0000000Do41-3Csg;
	Wed, 19 Feb 2025 16:26:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkltj-0000000DWFu-3rlx
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 19 Feb 2025 15:22:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ATP4p4UlgNOvnzmUO8LGNDojzAprJLUFGASv+dUIMf4=; b=THR+UetLlqUlKCBPmhWBaUUioY
	yXJ7ZDABVNhz9H4b4QNUdWakN8swVdHXVq2vIn8W+bdBB2Qtw4Zt/POWluMXFbei4AqxUNhE737u6
	CdldGAsy1lXn7PMdrF1FGngzX9rOndJ5yLbDNz/98VhfjtzZspwOuiSB+JFh8TXNuLgCRr0cSbQRe
	HYAwiO5eSYkEEy0zsOhSMFPjrPdAwF9XJrUxB3Uzb9xilEioj6YCYpQOI18KFwzMwjOO6oEHXMhWy
	3RF8p4uSwJ7rLrbBhuaHA1wxYFXuc6cNIiuCNamWhlyuQv3LAknoqJZ5piPF1FwS0DG0KQX3rVA61
	urWHvgKA==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkltg-00000002FFJ-1vBz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 15:22:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7EBA0A42A25;
	Wed, 19 Feb 2025 15:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 871CBC4CED1;
	Wed, 19 Feb 2025 15:21:56 +0000 (UTC)
Date: Wed, 19 Feb 2025 10:22:20 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, bpf <bpf@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, Masami
 Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas
 Schier <nicolas@fjasle.eu>, Zheng Yejian <zhengyejian1@huawei.com>, Martin
 Kelly <martin.kelly@crowdstrike.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>
Subject: Re: [PATCH v4 0/6] scripts/sorttable: ftrace: Remove place holders
 for weak functions in available_filter_functions
Message-ID: <20250219102220.3b79ec5e@gandalf.local.home>
In-Reply-To: <20250218145836.7740B3b-hca@linux.ibm.com>
References: <20250217153401.022858448@goodmis.org>
	<20250218145836.7740B3b-hca@linux.ibm.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_152200_883773_B9543A29 
X-CRM114-Status: GOOD (  20.35  )
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

On Tue, 18 Feb 2025 15:58:36 +0100
Heiko Carstens <hca@linux.ibm.com> wrote:

> Hi Steven,
> 
> > This series removes the place holder __ftrace_invalid_address___ from
> > the available_filter_functions file.
> > 
> > The rewriting of the sorttable.c code to make it more manageable
> > has already been merged:
> > 
> >   https://git.kernel.org/torvalds/c/c0e75905caf368e19aab585d20151500e750de89
> > 
> > Now this is only for getting rid of the ftrace invalid function place holders.  
> 
> Since you asked me to test this on s390: seems to work with
> HAVE_BUILDTIME_MCOUNT_SORT enabled; the ftrace selftests still
> work as before.

Great!

I'm guessing by just adding the support in s390 with what is upstream as
well as what is in my for-next would work? You can just add that for the
next merge window then.

Expect this code to be in linux-next later this week.

-- Steve

