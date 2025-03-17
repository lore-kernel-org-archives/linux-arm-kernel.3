Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CCCC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 20:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPw3TFfm/EQs678rXRiI+0tQ+PNuTJxxB9O9ZmA54lI=; b=vy44+Gon9r7HMYN+i4FON2p8lI
	wexoFzExrKJhPugQNJgqdRuB9XI/G7zdvxYbqjbEUjYU+Fnn1C2Mm/NbhuYhyM1/MH9WKachCfz2r
	ijCT1nXrRg1JM9j221BQ7RzQ6vImsrnawX7+2zROM1NE7YKxuFJspnV2SRB3HGEyZ6KSQwYiiDC+y
	pFIBPTfue5r714EaUIlbIImIF6c3j+FyhzZ/qctelVLtI4i6UNgNrjkZGC2mq0lfg7LE8HdH+nUUH
	a53LE6fzOuMbO4M8M9nkvjmvsLbV4Bkt5SkmnDirjSqtvLY4Iz1Y+KWB1DGZlzI1HA7qkovBWS9f1
	wFbgocRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuHPI-00000003x88-05Ua;
	Mon, 17 Mar 2025 20:49:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuHNb-00000003wgi-0klf;
	Mon, 17 Mar 2025 20:48:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 864305C571A;
	Mon, 17 Mar 2025 20:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A50DC4CEED;
	Mon, 17 Mar 2025 20:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742244490;
	bh=8pdTXWSW1pT+VXM+eBfg/U6FahxzWexs17ihcIHPMJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EhM8veCqfacvRpt+f0Tvr+Tb69xlnreFzyM3CYm4DK4T3+uPl9ru59UEfXTq0ebK0
	 CFqn/N9smSOGJjxnJp8Q7S4i7UImh1Net50w71WOgCOAVzz2OpwFsYRLV+agzk6Z1C
	 3LTvtiRUgukYDcBgUBk5iLbCljivyEw6ZCgak1vig2/flA/wQErtA9Pu1GdpMbJYyz
	 RElF6rdsfJrE/Kj0PJIhJnwP2Q/Uv03S9bGrKUxd3bkKaSRkFnXF6f1oMA2fvj+RKm
	 mxOb9rT8SCANLJJFg+gkynqiThXDC7UvCVYwLN6XBKjkV7uOvLG7zGq8p2g2kCvRgV
	 qUsnEfHJIxt6w==
Date: Mon, 17 Mar 2025 17:48:07 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	guoren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	linux-riscv@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 00/11] perf: Support multiple system call tables in
 the build
Message-ID: <Z9iKhwoj1GXvH4c9@x1>
References: <20250308003209.234114-1-irogers@google.com>
 <Z9KFLGpenwOP32q3@google.com>
 <Z9M24AJzui9lFbGo@x1>
 <Z9M9-YhDJg3NgiUy@x1>
 <Z9NEX3j_1RUvaFI0@x1>
 <Z9PCjQ8PhOadVGQ8@google.com>
 <Z9RjHpEJGWtj8PAM@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z9RjHpEJGWtj8PAM@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_134811_369683_42096B8E 
X-CRM114-Status: GOOD (  15.45  )
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

On Fri, Mar 14, 2025 at 02:10:54PM -0300, Arnaldo Carvalho de Melo wrote:
> On Thu, Mar 13, 2025 at 10:45:49PM -0700, Namhyung Kim wrote:
> > On Thu, Mar 13, 2025 at 05:47:27PM -0300, Arnaldo Carvalho de Melo wrote:
> > > On Thu, Mar 13, 2025 at 05:20:09PM -0300, Arnaldo Carvalho de Melo wrote:
> > > > Still building, but noticed this on x86_64:
> > > > 
> > > > 105: perf trace enum augmentation tests                              : FAILED!
> > > > 106: perf trace BTF general tests                                    : FAILED!
> > > > 107: perf trace exit race                                            : Ok
> > > > 108: perf trace record and replay                                    : FAILED!
> > > > 
> > > > 
> > > > The first doesn´t help that much with verbose mode, haven't checked if
> > > > before this series it was failing :-\
> > > > 
> > > > root@x1:~# perf test -vvv 105
> > > > 105: perf trace enum augmentation tests:
> > > > --- start ---
> > > > test child forked, pid 19411
> > > > Checking if vmlinux exists
> > > > Tracing syscall landlock_add_rule
> > > > ---- end(-1) ----
> > > > 105: perf trace enum augmentation tests                              : FAILED!
> > > > root@x1:~#

This one is now ok:

     0.004 ( 0.000 ms): perf/200342 landlock_add_rule(ruleset_fd: 11, rule_type: LANDLOCK_RULE_NET_PORT, rule_attr: 0x7ffd649bd0d0, flags: 45) = -1 EINVAL (Invalid argument)
root@number:~# perf test enum
105: perf trace enum augmentation tests                              : Ok
root@number:~#

now looking at:

root@number:~# perf test -vvvvvvvvv 106
106: perf trace BTF general tests:
--- start ---
test child forked, pid 200467
Checking if vmlinux BTF exists
Testing perf trace's string augmentation
String augmentation test failed
---- end(-1) ----
106: perf trace BTF general tests                                    : FAILED!
root@number:~#

No clue from the test, reading its source code now to see where it is
failing to try and reproduce the problem.

- Arnaldo

