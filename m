Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2879CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 08:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wplAzzEOm+Q0aPWW11dYgrqvd6iKQve3ErEDf2HUUMo=; b=w04icemBWEWK1XB7a06Kuo26Rk
	SUIU/OGJhl+yJv0/wKZ/zABOxr6nJ1jA4O10Di47eajdazUTwv9TTgBggWj4F61XXRNIxunGrVG2z
	vmT7uueu/1eWICuL3+Vs8K+RwqFoapGknhPh56Nia/5vcq27SfnXXay5RsNDlOyjsq54ZijeEFO9X
	YStHUR6CKuEHkkwuxeXRQcZtqsc9m5yUXaulrWKkDYhBoENrpyTb6obwK0zbNWxVLEb/3XONRU0Lf
	b9mMybamQkPFi6h05Cpu0H2pPy8HbosCqu6oaVW/e1x7+3zGk5DzQHThQEE8uoP7cwVJM3yd2aj+H
	Ek4wA8IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oM-0000000An8a-1iha;
	Fri, 26 Jun 2026 08:21:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oI-0000000An4U-4ARB;
	Fri, 26 Jun 2026 08:21:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8306342A91;
	Fri, 26 Jun 2026 08:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE0C1F00A3D;
	Fri, 26 Jun 2026 08:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462074;
	bh=wplAzzEOm+Q0aPWW11dYgrqvd6iKQve3ErEDf2HUUMo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=EZC15R2pBfNIFs+6rNdwmk9jGSf+WvK+9KJt09+nK428GCipOT/5kpz/PdSAOO1X7
	 +3IhCzrKGed9ZgatfgLQfuHqxn09xGLHyOqbGUsEJrAPzdOx/g11diX3oZ1b7fiBeg
	 7pZhSn30yIO3XjwIdUAJGFIRcRozxroD6Oe7z1JO0za+TopjVP8RWYwKdNjlS6ISIQ
	 ovP7Hl1jhB2b7xBzCgHx8V2v7/0H0a5hbbI8M3AQs7ATgJsoWRZLex4hhvsYzfv/uz
	 gw/EOH7s4FxzBBa4RDMTF7I/hZ5AkETfNvj3WPJtj2JySlsDNeuOzv64uUofVexJAa
	 cSRnp7C94e8yA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9ABD739389E8;
	Fri, 26 Jun 2026 08:21:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 1/7] perf unwind: Refactor get_entries to allow dynamic
 libdw/libunwind selection
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178246206150.3816447.6305387305041749998.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:21:01 +0000
References: <20260513233151.572332-2-irogers@google.com>
In-Reply-To: <20260513233151.572332-2-irogers@google.com>
To: Ian Rogers <irogers@google.com>
Cc: linux-riscv@lists.infradead.org, acme@kernel.org, adrian.hunter@intel.com,
 dapeng1.mi@linux.intel.com, james.clark@linaro.org, namhyung@kernel.org,
 florian.fainelli@broadcom.com, guanli.oerv@isrc.iscas.ac.cn,
 9erthalion6@gmail.com, alex@ghiti.fr, alexander.shishkin@linux.intel.com,
 andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, atrajeev@linux.ibm.com,
 howardchu95@gmail.com, john.g.garry@oracle.com, jolsa@kernel.org,
 leo.yan@linux.dev, libunwind-devel@nongnu.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, mingo@redhat.com, palmer@dabbelt.com,
 peterz@infradead.org, pjw@kernel.org, shimin.guo@skydio.com,
 tglozar@redhat.com, tmricht@linux.ibm.com, will@kernel.org
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

Hello:

This series was applied to riscv/linux.git (fixes)
by Arnaldo Carvalho de Melo <acme@redhat.com>:

On Wed, 13 May 2026 16:31:45 -0700 you wrote:
> Currently, both libdw and libunwind define 'unwind__get_entries'. This
> causes a duplicate symbol build failure when both are compiled into
> perf.
> 
> This commit refactors the DWARF unwind post-processing to be
> configurable at runtime via the .perfconfig file option
> 'unwind.style', or using the argument '--unwind-style' in the commands
> 'perf report', 'perf script' and 'perf inject', in a similar manner to
> the addr2line or the disassembler style.
> 
> [...]

Here is the summary with links:
  - [v5,1/7] perf unwind: Refactor get_entries to allow dynamic libdw/libunwind selection
    (no matching commit)
  - [v5,2/7] tools build: Deduplicate test-libunwind for different architectures
    https://git.kernel.org/riscv/c/6d13d53be9dd
  - [v5,3/7] perf build: Be more programmatic when setting up libunwind variables
    https://git.kernel.org/riscv/c/444508cd7c7b
  - [v5,4/7] perf unwind-libunwind: Make libunwind register reading cross platform
    (no matching commit)
  - [v5,5/7] perf unwind-libunwind: Move flush/finish access out of local
    https://git.kernel.org/riscv/c/2723e9f8b5cf
  - [v5,6/7] perf unwind-libunwind: Remove libunwind-local
    (no matching commit)
  - [v5,7/7] perf unwind-libunwind: Add RISC-V libunwind support
    https://git.kernel.org/riscv/c/834c557167a9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



