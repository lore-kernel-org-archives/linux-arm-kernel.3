Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96692CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 08:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69yLhlBI16XoVN9bn+X224Mok/47DWhaQAjx6HzSTTc=; b=LuioLZKk2DQ0W4YbdrVsv+mPuR
	paHuD+U3PQXf4STgNva2oF6r0vVMKf3MqO6ITrmIqkeT9W5aVLG8cgRAe5BmAFdfs07Vxuia7h3lu
	xuy8mIeeoSWa8BDBNDpKxAsM8G876EqgGhFMZyu0P8WPQscACReS82QCbbo+56O9mICgRhBGAwj3x
	0vpx9i2Ls3RGB1cTG3VRRV0MXmRo1wnFVHxpsEHXSLw95cKjH6PcrnvsMKv1TP31GmuIW7zz75tAe
	D9FftzZ454aeJmTB3ltJDP77grrIiJeBPIp9rUJxkDfaLkebebquqZre6GkqDHMvQiXjzFjB/Vngh
	Y0+IdBPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJocW-0000000CiJw-4Auh;
	Mon, 04 May 2026 08:25:40 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJocO-0000000CiId-3y2j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 08:25:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=69yL
	hlBI16XoVN9bn+X224Mok/47DWhaQAjx6HzSTTc=; b=mD/zbGAP2702YJM1OPmA
	ub40M6Ut4DpN0w3RYqDDcsh29QDSXY0wM/vRVTbX0NA54uOKr4Jmry/szvORS14o
	FFBX/ozRpyki7PoKTe7eLJcKX76Y558PbSZKvcGRVuugNtLQZSvCz8eK7CkVCFGW
	43l8hbVWYFEwby8OeP8ETvg6pWyd/5ij4neBkuEu+YV5ZwfXIAdjQcieN4Cafpfy
	e2Ue3Ndw2B84JuiaKEGxUkDvY5NHyqaR1t4nt9Zcs9Zhyq/yIXq0SRhOKOQ8Xlv8
	EoMHbpxFYI++ZYwWfA7ozfIVSfLir6TYYUA9dfQdwceeuVzEyv8Xmij7TJ58tBF5
	nQ==
Received: (qmail 2102619 invoked from network); 4 May 2026 10:25:28 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 May 2026 10:25:28 +0200
X-UD-Smtp-Session: l3s3148p1@hdhNrPlQZrcujnvR
Date: Mon, 4 May 2026 10:25:27 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-i2c@vger.kernel.org, Alain Volmat <alain.volmat@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] i2c: stm32f7: Move reinit_completion() to
 stm32f7_i2c_xfer_core()
Message-ID: <afhX9z20oxSZxM6L@ninjato>
References: <20260502153218.56142-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260502153218.56142-1-marex@nabladev.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_012533_273419_B4546AEB 
X-CRM114-Status: GOOD (  15.10  )
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

On Sat, May 02, 2026 at 05:31:54PM +0200, Marek Vasut wrote:
> Currently, the driver may repeatedly call reinit_completion() during
> transfer which contains multiple messages, while another thread is
> waiting for the completion.
> 
> This happens during transfer with more than 1 message, invoked via
> stm32f7_i2c_xfer_core() -> stm32f7_i2c_xfer_msg(). After invoking the
> stm32f7_i2c_xfer_msg() to start transfer, stm32f7_i2c_xfer_core()
> calls wait_for_completion_timeout() to wait for completion of the
> transfer of all messages. When the first message transfer completes,
> the hard IRQ handler triggers, and detects transfer completion, which
> leads to stm32f7_i2c_isr_event_thread() IRQ thread being started. The
> stm32f7_i2c_isr_event_thread() calls stm32f7_i2c_xfer_msg() in case
> there are more messages.
> 
> Without this change, the second and later stm32f7_i2c_xfer_msg() would
> call reinit_completion() on the completion which is still being waited
> for in stm32f7_i2c_xfer_core(). Fix this by moving the reinit_completion()
> into stm32f7_i2c_xfer_core(), together with wait_for_completion_timeout().
> 
> Since stm32f7_i2c_xfer_core() now waits for completion of the entire
> transfer, increase the default timeout. This fixes sporadic transfer
> timeouts on STM32MP25xx during kernel boot.
> 
> Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver")
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Reworded $subject a little and applied to for-current, thanks!


