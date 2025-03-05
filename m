Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3792C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 02:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5z84S7ivlAglfpSb9aQUB0kkxZR6u53+OItBvQZoAMI=; b=JKJXt0afv0DqQZc9J1NIQrs9s7
	4BWuvkTEabz+aieeQLZ/LAL6tyDhZ/sUrTvYLUjK7d3uj5YDXtg4xXAg4Q8S1m2aLi8GjBfgTWHyC
	q+a6X3uVfhfLbhAzhMrY/WnIVkkQf/qInSwIwGLxRyt/P0Su/I6/pWdVBjxpjz7yzI/HehV1sd/Ru
	/8KLH5N0F/Wetp8CDfN+HQg/7/kQnujV8D6jr6AcQT5WtlWMmzp/qnSttHui7KxscWPWeqyExuCPH
	8OfosA5msQPonE+M0euWb/+h6cLcDPjcR/RZw7HqO7/YF/TumzjWr5er6kaciw61joA4TD3lA/kJ/
	5VtfDc0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpe3U-00000006lXJ-2yPl;
	Wed, 05 Mar 2025 02:00:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpe1u-00000006lCW-1gNf;
	Wed, 05 Mar 2025 01:58:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8609CA458F1;
	Wed,  5 Mar 2025 01:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964B6C4CEE5;
	Wed,  5 Mar 2025 01:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741139917;
	bh=faPPTc6fEqFkFFgMOn0XiUUr2KwsjokpKxnGBmLUfb4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BaX8Oa727DhaBLVOvWypoECVFTTcmn6+Wx3yBzMVT6rm7vhjZLt3VJHewLq0r1Y4c
	 QtFWcquZ/i9LIVonDQaO3cuQsC5t8rWZ1W03jRgIwZFiJ+ZgRtIboC7S2URCj+UaEo
	 dvOVJCsvqim32rLbUhnX4DbVsM0mu9cAMoqTBdzKDS2a/yHoUY5EQtdmsMVHlEpgQK
	 Dy/83nzSNqk8XVhbipHuO+T5mHBrMDcHuS6UfPgDmRcx6gpNHqdfle3WBOdIoeMZOA
	 RyTkq0EAcgIT1eAq7dLfE1itPJlInCwUB/hRAzzwJWV7xN1kpSHVYrr7JFKSeCj/uU
	 AVTFBSIxa/cvQ==
Date: Tue, 4 Mar 2025 17:58:34 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Eric Woudstra <ericwouds@gmail.com>
Cc: Michal Ostrowski <mostrows@earthlink.net>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef
 Kadlecsik <kadlec@netfilter.org>, Jiri Pirko <jiri@resnulli.us>, Ivan
 Vecera <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>, Nikolay
 Aleksandrov <razor@blackwall.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Kuniyuki Iwashima
 <kuniyu@amazon.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Ahmed Zaki <ahmed.zaki@intel.com>, Alexander Lobakin
 <aleksander.lobakin@intel.com>, Vladimir Oltean <olteanv@gmail.com>, "Frank
 Wunderlich" <frank-w@public-files.de>, Daniel Golle
 <daniel@makrotopia.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, bridge@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-hardening@vger.kernel.org, Kees Cook <kees@kernel.org>, "Gustavo A.
 R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v8 net-next 00/15] bridge-fastpath and related
 improvements
Message-ID: <20250304175834.4306c670@kernel.org>
In-Reply-To: <20250228201533.23836-1-ericwouds@gmail.com>
References: <20250228201533.23836-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_175838_513606_A1F40945 
X-CRM114-Status: UNSURE (   9.60  )
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

On Fri, 28 Feb 2025 21:15:18 +0100 Eric Woudstra wrote:
> This patchset makes it possible to set up a software fastpath between
> bridged interfaces. One patch adds the flow rule for the hardware
> fastpath. This creates the possibility to have a hardware offloaded
> fastpath between bridged interfaces. More patches are added to solve
> issues found with the existing code.

For some reason this series didn't get ingested by patchwork correctly.
Instead of reposting for net-next maybe lets use this opportunity to
resend to netfilter instead? Looks like we have some acks from Nik but
none from Pablo.
-- 
pw-bot: cr

