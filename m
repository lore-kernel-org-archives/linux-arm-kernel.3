Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8033CC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 08:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dE9rRwZnG7wy+FNbCUDTd+rt4SiIbzZl8SrVSqhT7tg=; b=IcP+qAAIQTcnS1yKQMkREJ81IH
	bvAYDtq6bUIxH1IfVDGrrgoTdQVKOOf5nf7KPFX4C96lfYe8hqDeDs9KTcppJkKIT0p1avvg+NWi2
	OqCc3zGzsKa9Q1yiMqmI+PSk8WuKkwRlTO34ssEf3aLoscgDhPvGzIBYPz5wo7u0Mg3vmRxqdaWo3
	kG+KbeIf8b72wq8ArK9fWd3+sw+LBYpx/xMqfs+SghG1uh/qT/VrdsZ/IAXY26+YnnUNN2tF8L2N7
	5NBvJiYpi8SDI0DtjUPAJ8vFYQd8tUJKRol0mA4YC0/UjbxEiRGIBt6xETixoFM+GwZtV7y8VnxF/
	37lGDULg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rWA-00000008Stb-0IjN;
	Tue, 08 Sep 2026 08:49:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rW8-00000008StD-2wmn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 08:49:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0504E418E8;
	Tue,  8 Sep 2026 08:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F871F00A3A;
	Tue,  8 Sep 2026 08:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788857363;
	bh=dE9rRwZnG7wy+FNbCUDTd+rt4SiIbzZl8SrVSqhT7tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Za0qhaVToEDzllqVbChCSLXE5WB1iKgz+ynDZftVHGC/BPnKP8euNN8pErhFxlaLu
	 cHEky/zmqJKTEoHFGUbQ6esxUJqHuT0+Qb67FHr+ZAZojYH6qEOd5aKLg2oCTlpOAT
	 qro2T8ioUiSyW4eq3M7P+UDt6yPwgrTPasLZsl4HJkn3kibpWQepVGDtqshknZw64d
	 QyY6QeByxDFVpPJXmAOw6oOijNO9CtPKUnHQkJk+ZVmp6NhI8pVc91xXr6XcWOSgpZ
	 AO+7tS6hP6g8CFhaj/1KcwJs6mKoLXjIlpUTfzRu9cCqxcajolDa2NAicthKxyuwH2
	 hMENyrzZnIz0Q==
Date: Tue, 8 Sep 2026 09:49:19 +0100
From: Simon Horman <horms@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: netdev-bot+sashiko@kernel.org, radhey.shyam.pandey@amd.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com,
	andre.przywara@arm.com, hancock@sedsystems.ca,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 2/3] net: xilinx: axienet: Handle optional
 IRQ return value correctly
Message-ID: <20260908084919.GM40544@horms.kernel.org>
References: <20260903073252.339250-3-phucduc.bui@gmail.com>
 <178880965410.219967.16945994924537630103@kernel.org>
 <CAABR9nHd-S-3MgTAZk=JMCDEkHjuHqwsE_9h+14tXdhvWdn_SQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAABR9nHd-S-3MgTAZk=JMCDEkHjuHqwsE_9h+14tXdhvWdn_SQ@mail.gmail.com>
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

On Tue, Sep 08, 2026 at 09:32:32AM +0700, Bui Duc Phuc wrote:
> > Critical: 0 · High: 0 · Medium: 1 (1) · Low: 0
> >
> > - [Medium] net: xilinx: axienet: Handle optional IRQ return value
> >   correctly — the patch carries a `Fixes: 522856cefaf0` tag and a…
> >
> 
> OK, agreed, I'll drop the Fixes tag in this case, since this is a
> no-op cleanup rather than an actual behavior fix.

Thanks, with that addressed this looks good to me.

Reviewed-by: Simon Horman <horms@kernel.org>

-- 
pw-bot: changes-requested

