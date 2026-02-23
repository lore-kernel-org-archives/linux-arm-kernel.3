Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFB4EC1113
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 17:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TnVHpG1pM7+8453V13/DR9FHBaLiU1vQtsumlSKyIo0=; b=ldRVKThAAIC7MVt+jUH9g2DjJE
	ACsveg4Vid0ZC0GEClqubIcyt/0/tLu0xmSMsILurw16Xo9p7prGbCMcu5hLyCAcOb/r5sq2200hT
	x7l6QyJv1mHKI1w8zibgoEdMIenpl6oX4hFBa3IM8btZ92NrAu7s5i8Hi0vWw6iwMimjVArRRfJu7
	Oa5wO0h9sdPWf9RUWxzLODNk/04x6ZWTVmbyknf3nuDxqdlJJG92KDx/YSAyu/UN+X8tZO0G3CfXI
	b8EJXp/qDDArspXLuJq1zg77QMOp2LTfZQk7eONSkaS+fIVJX2dJ1aqb6xix9sHeX2+zyXgSXcthS
	7vwvvbGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZtn-00000000nfv-3nn6;
	Mon, 23 Feb 2026 17:39:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZtm-00000000ney-2V0h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 17:39:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 775F543803;
	Mon, 23 Feb 2026 17:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C1EC116C6;
	Mon, 23 Feb 2026 17:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771868349;
	bh=qW9i6zN1CY6w+IeHjsOXHWptGUB6blB9XwWVVi+sh1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wxu/8cLigHMnzGFEcQNnYenuwJd9vXt+eU8fmhzNlvcNnWrR33idDVrz8YJ8qZ8gt
	 sit1aDhavzpGKZqmNzq7HrFUWgnp//z5HMvlNmHq8AAmtREXxi/elr3TceAnwnrcFF
	 /VevfSQhsH97GE1xcZsAEsNDV3hU/XGigy72iojdrO6PZE0hz2XRYC6EPcqziISq0b
	 WoNh1FD+F1e4PMqDpcJH25ffCZfGGLuIdULPOL5bv9eKCVJYY1onKNieis/qq02d7O
	 EirCDVRx0nMQ95In+KE2frbAoqPyNyw1fg3rxYnsgH+xItEIIHvriReHMjGt7chd2S
	 DsV6MQiziaDmA==
Date: Mon, 23 Feb 2026 17:39:03 +0000
From: Simon Horman <horms@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, danishanwar@ti.com,
	rogerq@kernel.org, mwalle@kernel.org, nm@ti.com, v-singh1@ti.com,
	vadim.fedorenko@linux.dev, matthias.schiffer@ew.tq-group.com,
	vigneshr@ti.com, m-malladi@ti.com, jacob.e.keller@intel.com,
	stable@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH net 0/3] Fix Unbalanced IRQ Enable for CPSW and ICSSG
Message-ID: <aZyQt_K7z6OdjP-K@horms.kernel.org>
References: <20260220041431.372610-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220041431.372610-1-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_093910_652043_3F177525 
X-CRM114-Status: GOOD (  16.52  )
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

On Fri, Feb 20, 2026 at 09:41:56AM +0530, Siddharth Vadapalli wrote:
> Hello,
> 
> This series fixes the warning:
>     Unbalanced enable for IRQ ...
> for the CPSW and ICSSG drivers.
> 
> Under heavy traffic and in an SMP environment the warning shows up after
> a relatively long time. The issue occurs due to the order in which the
> variable 'irq_disabled' is set and the function disable_irq_nosync() is
> invoked.
> 
> I have examined other drivers and they follow the right order which is
> to invoke disable_irq_nosync() before setting 'irq_disabled' (or its
> equivalent variable).
> 
> The first patch is for the CPSW driver and it has two Fixes tags since
> the code change associated with the fix is for a recent commit while
> the incorrect order was first introduced by a much older commit.
> 
> The second and third patches are for the ICSSG driver. Although they
> are both for the same driver and could be squashed, I chose to split
> them since they fix different commits and need to be backported as
> Fixes for the respective commits.

For the series,

Reviewed-by: Simon Horman <horms@kernel.org>

...


