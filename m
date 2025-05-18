Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FD1C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 18:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cs3cB3RHEhPEb5x0MVvObkLAWIDcBbEagjqIMecWybo=; b=p0xe/rFFxpTvihLUnFR7a4PhvR
	zkbWnArTSar0iKmB1Y4JRGMoEjcEcfcb1W7uCjs0xvExNlnsZq5J4ivBEJi+ZLTAMIDZtI5z8fMkx
	QYFWTGT1swXKAqyI/a8FSZd34SdjK/vXGw4mfD/gQCaHTamNMdiWpMqSvIu+TslbduWKz2Ro7RkCl
	7Oh2lFFK2p75jnNyVLF2nOelcCnqRWroBofSSaohbFLrkWyJ+OTWdKrJfaCKW2XGQtxi0Eg3ILWkP
	iYIl6jHSDpJHK/xCcvx7Hkn1amQUvjIfNpNtuxyy5iIAaPzJzjV1UI+gom7chlZyly/iBXtkUvfJo
	xxDI2E8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGjAr-00000007RNX-2csx;
	Sun, 18 May 2025 18:55:49 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGj8s-00000007RHw-0ARJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 18:53:47 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747594423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cs3cB3RHEhPEb5x0MVvObkLAWIDcBbEagjqIMecWybo=;
	b=WIgXN/bdOwb7KcCajgbmGHfAkJ0O8ts2wo03AHvHhIs3VdConAkTxq5qCEow5Wu7sJFjSc
	j1pU9KKZeSDdOB/cxu95XmohzIQXA1u96RiJ5ask0J4S+0zzF/vs9y8pSxhP/6esJeusUb
	P2Yz7jpqJqAHT2F1+chtjA+HlYWIdKH/2pV6x0JNnNLN2gTCLujrlnRUSFhaTQI7rcCMpK
	9gclG52XF8IAaiYXQPln/CCRK++79Waw0mProUgk0x7orBaT3wAxZFYSadJeLYuQw0wc49
	LNfebdAdhwb+W2e0xasH1b8jya1c6hQEFX9taGv5w2caJMRolgK+5MigeLEF2w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747594423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cs3cB3RHEhPEb5x0MVvObkLAWIDcBbEagjqIMecWybo=;
	b=p7c7XeTTE4uPpxZwi8SD926jrjL4/GEJSWxFF+EBUPcV21eGOQIQ6HbkQ30YOqmTphs6V7
	OLKUxb9lrFpuERAw==
To: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Sascha Bischoff
 <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>
Subject: Re: [PATCH v2 5/5] irqchip/gic-v3-its: Use allocation size from the
 prepare call
In-Reply-To: <20250513163144.2215824-6-maz@kernel.org>
References: <20250513163144.2215824-1-maz@kernel.org>
 <20250513163144.2215824-6-maz@kernel.org>
Date: Sun, 18 May 2025 20:53:42 +0200
Message-ID: <8734d1iwcp.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_115346_231505_1E7FBC95 
X-CRM114-Status: UNSURE (   8.37  )
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

On Tue, May 13 2025 at 17:31, Marc Zyngier wrote:

> Now that .msi_prepare() gets called at the right time and not
> with semi-random parameters, remove the ugly hack that tried
> to fix up the number of allocated vectors.
>
> It is now correct by construction.

FWIW, while looking at something related, it occured to me that with
this change you can enable MSI_FLAG_PCI_MSIX_ALLOC_DYN now on GIC ITS.

Thanks,

        tglx

