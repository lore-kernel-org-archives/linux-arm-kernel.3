Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C5AD41D42
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 00:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sSy2edxmtXKc+543Ncg0L7eL3GjF7Af4fPBOTmvVjUk=; b=CpSxpu+4k2s/YvneshGV8U9rT8
	dDgJXWfV+LIfIqRIk+mnpKe4ghKJFhzQw4xThaVQ7SY24oDo1wHcNZpOBJTNhDZYRioxgom+7J6CQ
	Zfb+aBDHAxiJfeBLX2pRjIa3g/YjzH0hPEr30E+kIJdZwRGbvqnOfP1ptkwayDMUidF09wRoga4cA
	zRKCWmy4xqyH7oud3LtoT9F+fDOFzuVBGBU2lETJbcxnjr+S7/kK73yZQ74GD8auGqpOATjar28MK
	/A347lYJw2YIWDfGxGo8UZ4a0I8Pd6qBiUm6wsAYb1h3hksf5kd2/VNmhB2FaKL3jkmytUxwmiWrp
	Q7E4J4EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAej5-00000001jds-1GYY;
	Tue, 12 Nov 2024 00:25:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAeVs-00000001i0g-2d3o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 00:12:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 367615C578F;
	Tue, 12 Nov 2024 00:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACB5FC4CECF;
	Tue, 12 Nov 2024 00:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731370327;
	bh=F6KtVDx7kefgsDbbvSvre0SI4ek2HJre6EpkN5nZLpw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FYtWjqgoyYor2KQxuCduFyVPGGug7Lae6Zmq//DBd3J775HaM3IaD89LNwlzGfzg8
	 OTbdTKXJNxQ7RyTm/Uf3WjPXmMeT5O+324PbmckBkAIr+vu3Hisv/RQ+px6riH/ew9
	 EvzwcyclN8+IzKBkfEDqUbK5gE4mrRnEDF5MObJoeQoQxwuk1cOoO6ls0My5yu96wx
	 AslbCPGQqKPkw4swgS1D4SPmEY0D2GeJvPbvqytMxbsfghFSySvHDlc7/qImqc3ZgG
	 frjtrVU+2NYAa3e1d2JYggboGUkn5HZd4Q36XxubIDtQnn2ie3QdpX7feyV1rmruUu
	 dFA/HxKRYepAQ==
Date: Mon, 11 Nov 2024 16:12:05 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Richard
 Cochran <richardcochran@gmail.com>, Alexis =?UTF-8?B?TG90aG9yw6k=?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 4/9] net: stmmac: Introduce dwmac1000
 ptp_clock_info and operations
Message-ID: <20241111161205.25c53c62@kernel.org>
In-Reply-To: <20241106090331.56519-5-maxime.chevallier@bootlin.com>
References: <20241106090331.56519-1-maxime.chevallier@bootlin.com>
	<20241106090331.56519-5-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_161208_738738_3F8F6531 
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

On Wed,  6 Nov 2024 10:03:25 +0100 Maxime Chevallier wrote:
> +		mutex_unlock(&priv->aux_ts_lock);
> +
> +		/* wait for auxts fifo clear to finish */
> +		ret = readl_poll_timeout(ptpaddr + PTP_TCR, tcr_val,
> +					 !(tcr_val & GMAC_PTP_TCR_ATSFC),
> +					 10, 10000);

Is there a good reason to wait for the flush to complete outside of 
the mutex? 

