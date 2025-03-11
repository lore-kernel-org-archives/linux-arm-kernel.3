Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C421C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 23:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zy4H9Jv5YfvsQEUnC9uG0DhMz5JfwXq9yCcEHqiTgoA=; b=QZoUXXw50ayN4vOHelW2aA+RIL
	ErpMKVvLShKp/oARGiLwuMQd8MjzpY65t1CA5MfBuq/hDfc3FYyl865TwjHRiVWvFIH5jcKdHKpap
	syUDwiMTSQstB2x8UlotkphUFG06KYdk2dEVY4t8ajVWs6FnS3L1G8+tqnJ1cTT1zJjSLzarS6Wxy
	+8AOW73Z6cKjiYCsaE9VHMCPRPU3k8z7OtUbHwgUdSr0VHxXc4tE+4xtbkMZ05cLOtVuji2g/wQCZ
	yWiZJHyOxP3LvtFGNwHwTGAQE0t6y12DdgvTrqmmxGW/fpRK9Kp/VgRe8jecZJZXxQt1508J7wAKG
	DFkv4ViA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts9IQ-00000007D1A-3hJK;
	Tue, 11 Mar 2025 23:46:02 +0000
Received: from mail.netfilter.org ([217.70.190.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts9Gl-00000007Cmc-0Wyg;
	Tue, 11 Mar 2025 23:44:20 +0000
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 9867D60290; Wed, 12 Mar 2025 00:44:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1741736651;
	bh=Zy4H9Jv5YfvsQEUnC9uG0DhMz5JfwXq9yCcEHqiTgoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a8t80WlrGYFY9oyQX3S86Ogn9ifXUjpMtYaXir/VnMuMWejrcyWrdT2MZ2UFI6Eo2
	 7qsNBbeB+KiWFpXrYGzzrRPMPsPm3M/LE12BTGeObmLfV4xGfxMKOeVnfXLuHs+f6I
	 oco67Tvuc79DAy4t/JCmw6SPfqMP3FXgCoQq7/pPe7BYJioQ8AdiXx+unSbnybDzHx
	 TlZi4UML/13y3h+GZLEerM6BAPXU/DTqIQuGm8Mqm5U0dLr+7C4n8OXD6BORAgjHeq
	 NKgQoBT0DPvWcs+M0oaprv6llWWPVxh4HtE3mjNtRrcPSzk1R77u3S9f2rILyP8arN
	 I70Z8bqQRkyaw==
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id F13DD60281;
	Wed, 12 Mar 2025 00:44:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1741736648;
	bh=Zy4H9Jv5YfvsQEUnC9uG0DhMz5JfwXq9yCcEHqiTgoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kLBL1Hzar1cmkrQuKybLF66CTNES1VcZwNNIMmceAZVUWG5+PeM/BvDuffpu85yec
	 wSCdNGmitWR2/y3qO93O7m5UoYNKtgV+UMNE3RSCZLEtC3QrrCx5Ui7dzYI58OpWlx
	 NwubfakCqFL6Je9par6JdWhDjcNJFmritUaP6eC06ocENmPzpiec0y8GuyB+7RNRpX
	 yhqSCf2339YL33+0nTwjf5i1QZ20gGgH7fTS6Lw5NjdHN+qVQ+1exZ2T3tciJq/8kh
	 KqPz2aZ2hTBXT2boxpytoDg2qPdtF3KzUcG9KrRXHFunP2n1vk46/9Q2OKi2SN/ESu
	 yNF8SeDIdPDXQ==
Date: Wed, 12 Mar 2025 00:44:04 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Eric Woudstra <ericwouds@gmail.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Roopa Prabhu <roopa@nvidia.com>, Ivan Vecera <ivecera@redhat.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Simon Horman <horms@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, bridge@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Ahmed Zaki <ahmed.zaki@intel.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH v9 nf 00/15] bridge-fastpath and related improvements
Message-ID: <Z9DKxOnxr1fSv0On@calendula>
References: <20250305102949.16370-1-ericwouds@gmail.com>
 <897ade0e-a4d0-47d0-8bf7-e5888ef45a61@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <897ade0e-a4d0-47d0-8bf7-e5888ef45a61@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_164419_604519_568B1A14 
X-CRM114-Status: GOOD (  23.45  )
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

Hi,

On Tue, Mar 11, 2025 at 09:22:35AM +0100, Eric Woudstra wrote:
> 
> 
> On 3/5/25 11:29 AM, Eric Woudstra wrote:
> > This patchset makes it possible to set up a software fastpath between
> > bridged interfaces. One patch adds the flow rule for the hardware
> > fastpath. This creates the possibility to have a hardware offloaded
> > fastpath between bridged interfaces. More patches are added to solve
> > issues found with the existing code.
> 
> 
> > Changes in v9:
> > - No changes, resend to netfilter
> 
> Hi Pablo,
> 
> I've changed tag [net-next] to [nf], hopefully you can have a look at
> this patch-set. But, after some days, I was in doubt if this way I have
> brought it to your attention. Perhaps I need to do something different
> to ask the netfilter maintainer have a look at it?

Apologies, this maintainance service is best effort.

I am also going to be very busy until April to complete a few more
deliverables, I cannot afford more cancelled projects. I will try to
collect what is left for net-next and wait for the next merge window.

Therefore, I suggest you start with a much smaller series with a
carefully selected subset including preparatory patches. I suggest you
start with the software enhancements only. Please, add datapath tests.

As for the hardware offload part, I have a board that I received 4.5
ago years as a engineering sample that maybe I can use to test this,
but no idea, really.

You are a passer-by (ahem, "contributor"), this will get merged
upstream at some point and we will have to maintain all this new code
without your help maybe ... (people change bussiness units...), I have
to understand what is going on here. The throughput available is
limited, I am afraid we can only go _slow and careful_.

Thanks.

P.S: You work is important, very important, but maybe there is no need
to Cc so many mailing lists and people, maybe netdev@,
netfilter-devel@ and bridge@ is sufficient.

