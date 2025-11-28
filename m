Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D76CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 02:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWy/Ngqo6lV6R5wQucJnizY8Noe09doOmhDaVZiu4WQ=; b=FtsJKqDDw1BoKHYEQk+ITX5bKU
	WqMbOBV1yfaP4Ha5hiJ4sKdaeGr3XFpa4MxB4j6hpqCGpPLd2Ry4RdJtu/nXrZq9VAD+CIvjlxl13
	7dEOIdn+0QlZXE0pdrKmdyht17cU2Rsacbo2DBNP27TQywMEhKjOgeE3OTpW21BzyUTlIe9VnwVGF
	4AEMY8Z5IaZPgl5DG50IH9raj/T9HCYxrNten++Tjyb7kB0G9yJr9X2mfBXwTTSjsMv+A5nV4WMjm
	Lm3vRHsbeLKZjJmxA1Y22OtQfhccetLNop64rW4ECR6kMAoOYPuaeY0A0ljSAynxRj7Q8rKNvb4MV
	bxTjdCTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOo8y-0000000HSHL-3NFb;
	Fri, 28 Nov 2025 02:23:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOo8v-0000000HSGD-3aGH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 02:23:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D38CA443E3;
	Fri, 28 Nov 2025 02:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B13C7C4CEF8;
	Fri, 28 Nov 2025 02:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764296608;
	bh=FUhaRxnXxUxNE/ZyHqmZ2tKNQvfpkfg9F1oOG/YoFcE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=o5xz3475Sgzsjl/Oe2COi8lhMczVWqsmUBOyO2HdzTfuQVWJDv8p0rwFzzSIiBO6i
	 g099rBuB4qNiRmX529LpoP6hiSswuspBnaxMtdBrn063QYGgaaTyQsxLj0EPaqR6sA
	 NL72DpR95eEW5d3NYMIJfM5P+mOx+q6kQbm52o+xZLTm6sX2jgwUb5oAfCpG7OdCxq
	 NUd1zskgeQYPVyxixZaf8bFmXkrmPJ/hRrBMH2i6p3VjBkmnxU56TeUC/4z4RrHpjm
	 UgXeownzuygBq5d+w5w/0kDXHkdNKXo9T05ksFZY5qkODrxTaoNhq9BQBBsLHTnhmB
	 AOxgZSzXC0ycw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3B7133808204;
	Fri, 28 Nov 2025 02:20:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: fix rx limit check in
 stmmac_rx_zc()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176429643103.114872.3644233989627611671.git-patchwork-notify@kernel.org>
Date: Fri, 28 Nov 2025 02:20:31 +0000
References: <20251126104327.175590-1-aleksei.kodanev@bell-sw.com>
In-Reply-To: <20251126104327.175590-1-aleksei.kodanev@bell-sw.com>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, rmk+kernel@armlinux.org.uk, 0x1207@gmail.com,
 hayashi.kunihiko@socionext.com, vladimir.oltean@nxp.com,
 boon.leong.ong@intel.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, jh@henneberg-systemdesign.com,
 piotr.raczynski@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_182329_914557_FD20A7E5 
X-CRM114-Status: GOOD (  10.39  )
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

On Wed, 26 Nov 2025 10:43:27 +0000 you wrote:
> The extra "count >= limit" check in stmmac_rx_zc() is redundant and
> has no effect because the value of "count" doesn't change after the
> while condition at this point.
> 
> However, it can change after "read_again:" label:
> 
>         while (count < limit) {
>             ...
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: fix rx limit check in stmmac_rx_zc()
    https://git.kernel.org/netdev/net-next/c/8048168df56e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



