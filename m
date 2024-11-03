Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02C0D11195
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 23:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqrmyOrMkUisSS/7wnUxXcbbjxv9cvVzVieLvZU6oPg=; b=PsEn4SVBhstuVGCbLQllgM2mPH
	1E2wwVDNr1DuhXc+rJk8fIDAzm3gf/baJjR2XY5arB6IH/qZaGBTjAjKpJfzOiiPuemSxMaHMyvHn
	H//obZmhEaHCuaYkSC//apT4i4tWy8Ik9ZKFw6w6vFVc16BkaaJmuWCLjXY7+NZuu/19B6RIcl22O
	/1rxKNGxde606EkyHxyeeWyV/qrq4Yj2CGcHYOF4NPJ+qY/VkOdy34eDujbCcaBYHszKF3QwW0B/C
	Gb5+WRcM8hSvFs7FkZnRHsn6HOR/ef4eSyrH+FxVfiE5YM5SQCjGG74gnDEMInnxZJw/uj4+Vhpcr
	AY16I82w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7jgj-0000000CE5H-07gv;
	Sun, 03 Nov 2024 23:07:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7jDT-0000000CA3V-1xdA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 22:37:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2E906A41EFF;
	Sun,  3 Nov 2024 22:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9141AC4CECD;
	Sun,  3 Nov 2024 22:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730673422;
	bh=+AjUBFt5j6m3B0+mWVqTIMhl2EPw0N3fO6V9nqSUA60=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MbsuCkgu9kr268BuJV+Zt2b4eKxqKdluo1s3J9P5rYyMtB7h77R2WjWvMY71VtQI1
	 sdXAKM+8MIuMItBGwc8QUUf2eQwTT/urbs8FN2eWTnAobMeVIoKxkjCoyy0pUEtiSD
	 /OOiUgtEzLCNUxI6glqFxPzMELSCD2R4pkrBZ3jMwkJ7eVr//X1UcBN8zW4QGvfp6X
	 RkP+UKL5WyMdmO9Fs2x6MdvoyJNaqvxUF1Q3FVWD5McPrGA2+WMTGAOGLXENEEkMjx
	 ZNPPBzLzNT12Q4Z34zNSY9EM6lMvbz/1UdqiMXJyisohRjTGRmnkvSfj6xDCZvoFYI
	 g2jzwy2Dg2mzg==
Date: Sun, 3 Nov 2024 14:37:00 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: <radhey.shyam.pandey@amd.com>, <andrew+netdev@lunn.ch>,
 <davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>,
 <michal.simek@amd.com>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <git@amd.com>, <harini.katakam@amd.com>
Subject: Re: [PATCH net 2/2] net: xilinx: axienet: Check if Tx queue enabled
Message-ID: <20241103143700.3ce70273@kernel.org>
In-Reply-To: <20241030062533.2527042-3-suraj.gupta2@amd.com>
References: <20241030062533.2527042-1-suraj.gupta2@amd.com>
	<20241030062533.2527042-3-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_143703_631195_4E4B1F6E 
X-CRM114-Status: UNSURE (   8.30  )
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

On Wed, 30 Oct 2024 11:55:33 +0530 Suraj Gupta wrote:
> Check return value of netif_txq_maybe_stop() in transmit
> direction and start dma engine only if queue is enabled.

The first patch makes sense, let me apply that one.
But this one I don't understand - what is the problem you're trying 
to fix? netif_txq_maybe_stop() tries to stop the queue if the *next*
packet may not fit in the queue. The currently processed packet is
assumed to have already been queued.

