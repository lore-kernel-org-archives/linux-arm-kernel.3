Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFEBD149CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 18:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btD6HhlsAeHAJoAwZLHjLityk10871a47/U2BOYPoPU=; b=HG3vonxGNs7qIPLmf4++N/tN3S
	T6fI1cFdH/TYenesDG7NdBcaT93QQbHl2fvRsWaXyF/4K/d1De04hIW6HEW3DEWNvHextjCSyCPc/
	p+oHHOUeP5EzzjBGqoNx+am4OYrWFOsG/gJyq727m6F33PN/fcGMMjRnc5cRdUYAu0oJ6bTkWVcch
	7keXUdAqhmHDfrsuOXMgpfOPwC/rrEqTiljlcxz/O7YRuCQp9L9RgeND9hul56KlITe+xZ/iMhKGv
	NToWa3Z/CesjU0Va42idysUyfXeAMYm8s4NxYTAgWQ8SJdyow7vYvd+TPSRY29mvBkhh1ETK+X/1G
	UQuvI8NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OzL-00000004mxK-3adD;
	Fri, 25 Oct 2024 18:24:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OBx-00000004caC-14Ir
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:33:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C51C339;
	Fri, 25 Oct 2024 10:34:09 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E83D03F71E;
	Fri, 25 Oct 2024 10:33:38 -0700 (PDT)
Date: Fri, 25 Oct 2024 18:33:30 +0100
From: Leo Yan <leo.yan@arm.com>
To: Graham Woodward <graham.woodward@arm.com>
Cc: acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
	jolsa@kernel.org, irogers@google.com, james.clark@linaro.org,
	mike.leach@linaro.org, leo.yan@linux.dev,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, nd@arm.com
Subject: Re: [PATCH v1 0/4] perf arm-spe: Allow synthesizing of branch
Message-ID: <20241025173330.GD359792@e132581.arm.com>
References: <20241025143009.25419-1-graham.woodward@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025143009.25419-1-graham.woodward@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_103341_463363_F0B65EDE 
X-CRM114-Status: UNSURE (   9.08  )
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

On Fri, Oct 25, 2024 at 03:30:05PM +0100, Graham Woodward wrote:
> 
> Currently the --itrace=b will only show branch-misses but this change
> allows perf to synthesize branches as well.
> 
> The change also incorporates the ability to display the target
> addresses when specifying the addr field if the instruction is a branch.

Tested for this series:

  # perf record -e arm_spe_0/branch_filter=1,load_filter=1/u \
      -- ./false_sharing.exe 1

  # perf script --itrace=i10ib  -F,+addr,+flags
    false_sharing.e  880532 [005] 1852579.389533:          1                                    branch:   jmp                       ffff91beb224     ffff91beb220 __GI___tunables_init+0x40 (/usr/lib/aarch64-linux-gnu/ld-2.31.so)
    false_sharing.e  880532 [005] 1852579.389538:          1                                    branch:   jmp                       ffff91bec318     ffff91bec314 _dl_next_ld_env_entry+0x24 (/usr/lib/aarch64-linux-gnu/ld-2.31.so)
    false_sharing.e  880532 [005] 1852579.389620:          1                                    branch:   jmp                       ffff91be0f14     ffff91be0f10 _dl_new_object+0x168 (/usr/lib/aarch64-linux-gnu/ld-2.31.so)
    false_sharing.e  880532 [005] 1852579.389802:          1                                    branch:   jmp                       ffff91be2cf0     ffff91be2cec _dl_map_object_deps+0x3f4 (/usr/lib/aarch64-linux-gnu/ld-2.31.so)
    false_sharing.e  880532 [005] 1852579.389802:         10                              instructions:   jmp                       ffff91be2cf0     ffff91be2cec _dl_map_object_deps+0x3f4 (/usr/lib/aarch64-linux-gnu/ld-2.31.so)
    false_sharing.e  880532 [005] 1852579.389824:          1                                    branch:   br miss                   ffff91bee4e4     ffff91bee4e0 strcmp+0xa0 (/usr/lib/aarch64-linux-gnu/ld-2.31.so)
    false_sharing.e  880532 [005] 1852579.389849:          1                                    branch:   jmp                       ffff91be1868     ffff91be1880 _dl_relocate_object+0x4a8 (/usr/lib/aarch64-linux-gnu/ld-2.31.so)
    false_sharing.e  880532 [005] 1852579.389858:          1                                    branch:   jmp                       ffff91be1868     ffff91be1880 _dl_relocate_object+0x4a8 (/usr/lib/aarch64-linux-gnu/ld-2.31.so)
    false_sharing.e  880532 [005] 1852579.389861:          1                                    branch:   jmp                       ffff91be1c20     ffff91be1bcc _dl_relocate_object+0x7f4 (/usr/lib/aarch64-linux-gnu/ld-2.31.so)
    false_sharing.e  880532 [005] 1852579.389875:         10                              instructions:                                        0     ffff91bdfe38 _dl_lookup_symbol_x+0x58 (/usr/lib/aarch64-linux-gnu/ld-2.31.so)
    false_sharing.e  880532 [005] 1852579.389876:          1                                    branch:   jmp                       ffff91bdf3a8     ffff91bdf434 do_lookup_x+0x114 (/usr/lib/aarch64-linux-gnu/ld-2.31.so)
    false_sharing.e  880532 [005] 1852579.389879:          1                                    branch:   jmp                       ffff91be18ec     ffff91be18e8 _dl_relocate_object+0x510 (/usr/lib/aarch64-linux-gnu/ld-2.31.so)
    false_sharing.e  880532 [005] 1852579.389886:          1                                    branch:   jmp                       ffff91bee440     ffff91bdf2dc check_match+0x154 (/usr/lib/aarch64-linux-gnu/ld-2.31.so)
    false_sharing.e  880532 [005] 1852579.389890:          1                                    branch:   jmp                       ffff91bdfed4     ffff91bdfed0 _dl_lookup_symbol_x+0xf0 (/usr/lib/aarch64-linux-gnu/ld-2.31.so)
    false_sharing.e  880532 [005] 1852579.389893:         10                              instructions:                                        0     ffff91be1974 _dl_relocate_object+0x59c (/usr/lib/aarch64-linux-gnu/ld-2.31.so)
    false_sharing.e  880532 [005] 1852579.389894:          1                                    branch:   jmp                       ffff91bdf3f4     ffff91bdf3f0 do_lookup_x+0xd0 (/usr/lib/aarch64-linux-gnu/ld-2.31.so)
    false_sharing.e  880532 [005] 1852579.389906:          1                                    branch:   jmp                       ffff91bdfea4     ffff91bdfe90 _dl_lookup_symbol_x+0xb0 (/usr/lib/aarch64-linux-gnu/ld-2.31.so)

  # perf test "Check Arm SPE"
  114: Check Arm SPE trace data recording and synthesized samples      : Ok
  115: Check Arm SPE doesn't hang when there are forks                 : Ok

Tested-by: Leo Yan <leo.yan@arm.com>

