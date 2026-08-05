Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6198C55184
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 01:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwEqJjP6qpqAoyV5UkMA9yWLjup70ridbNsRQ1s0408=; b=UqIAz49cvn5yp1LsFHQtX0w+i9
	UFJudFiH2O6zsiK+mXYTuylzngneHVIR1c39h74fW6fY+4FKRqkQmLK0vxT7sEBEnkR1UQBYLEYMJ
	DwVOGfM/xHi67WUDcfeghSYOZnN3QeubEBe1cIK0jVERtVrm1C/o2cDOReR+RJBhL99WBCld/9EVQ
	QVAk8l/hzNDSMT+Zufacps4J6rBV4ulaO9nhFHXDt3oR3y7PuaFGUnNmg25EZWm04SFSvB37KK+DY
	hAJRNtFW/law3pZsUUa+OS+xipvEGAi4XjuqjUsxkbFV/I4g8BCZgJjxHqQvJUgpUebOHOGttNV3V
	XIaJ9lLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrQJb-0000000339B-1EUW;
	Wed, 05 Aug 2026 01:21:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrQJa-0000000338v-2N9R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 01:21:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD7E660A60;
	Wed,  5 Aug 2026 01:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9261D1F000E9;
	Wed,  5 Aug 2026 01:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785892861;
	bh=MwEqJjP6qpqAoyV5UkMA9yWLjup70ridbNsRQ1s0408=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=aQnWmplcN6wREYS2ZQmrQyrcLqRtNJ13jdzeqUWgDNpuP7FEzilSjwTeMD3Xw/vgJ
	 fRaKcPmNaQES11ku3W37bAVI3S8+lfpM8iBiD7LZ98cf6Nh03X3PJMaOFGUhvl5SWd
	 pqulPglq4nZzW2pKVGX7wJ4S9UXCyySGJGknZKxpDl7Ib+EDEgOF9rnrvEuuTT1oOP
	 aHNzVn005c8SG0fms/lOE5Vxk7r6LDZqfQf/fXUphPR4Fm316rTVjCiwzWbiUvbO/b
	 wICh5FFhpDqnV/y7XfzeDq2KvqeuiJIh6mWuSYjpEPmz/zRBfIM5Iq51lLqIxGE7x1
	 /zdi0GvsHFMFQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 197DA3926666;
	Wed,  5 Aug 2026 01:20:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 net] net: microchip: vcap api: Fix possible memory leak
 in
 vcap_decode_rule()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178589282164.3863162.1616529385793132402.git-patchwork-notify@kernel.org>
Date: Wed, 05 Aug 2026 01:20:21 +0000
References: <20260801055507.47534-1-nihaal@cse.iitm.ac.in>
In-Reply-To: <20260801055507.47534-1-nihaal@cse.iitm.ac.in>
To: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Cc: Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
 UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, nathan@kernel.org,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, joe@dama.to,
 horatiu.vultur@microchip.com, stable@vger.kernel.org
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat,  1 Aug 2026 11:25:05 +0530 you wrote:
> The memory allocated for struct vcap_rule_internal, keyfields and
> actionfields inside vcap_dup_rule() are not freed in some of the error
> paths in vcap_decode_rule(). Fix that by calling vcap_free_rule().
> 
> Compile tested only. Issue found using a prototype static analysis tool
> built on top of the LLVM compiler infrastructure.
> 
> [...]

Here is the summary with links:
  - [v3,net] net: microchip: vcap api: Fix possible memory leak in vcap_decode_rule()
    https://git.kernel.org/netdev/net-next/c/30ce0cb576b6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



