Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F05C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 04:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORxEy6Z1UwG2c1EpsL1AL/4rn7l1/IPGac8D3BNCqU8=; b=T2L7hlBLYYr/dqlcUJd8Wj82Xk
	Fa6TO2fak3zS99LEfmXfhUEfDp1BYqGWShsxcFxNq5Z+VfyWBiKx7yK3TmpNlKWnh9KUHYP9byfnI
	5ay3gF8ERhtOWga5hMHcQdEOyjCzJLbAmBkLLifMwTaG/Uvn8BdW2wbE9TlIvWChpdPT14a4vDlmL
	jRrGdRtvuwK57XkeSqQXno2S0yelUPJgq8j0Z5FZ10c4nf8pqslzDhs3b+Vt3iRo0V8OyMbGIipJe
	C7P3j/YUXJyM2JjdNauJL7E/gtt/w1OFHYIgs2wD6RSxsL7u2ahoJJg4dPv4MZfc+48GpUXb7OEnH
	Kj4ecYMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPZFb-0000000C7kv-0NkB;
	Thu, 12 Jun 2025 04:09:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVOX-0000000Bjya-2Cw0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 00:02:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D242629E4;
	Thu, 12 Jun 2025 00:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7590C4CEE3;
	Thu, 12 Jun 2025 00:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749686532;
	bh=QZ/fn76hbIECH2SJNsLWkYeQQ/XFL72WxozjIyCrQXo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Rjyn+NohjKOQ7SiU6IF8v3IyU/H/Usnw4tSJgqG3xE+AjD1k7f0Ig2AYXS03qf5IR
	 x/wXVykDQhY3YAWqcFMaGU299A+AcmYsxx9QMN0lTOeUvUiuys2jH8lkkBqu5uwmZQ
	 zLmevpnwbcMgMAcyjDg0n3C2JQDsJ6JPL1YdX9UTdT9A6+x48iZCZHMn4wr9iEYzic
	 ILxaXO2VhjID8LkGbQ+vrq3w3h8PRPhSK5WzzB2LGARMUkW4dE0uDnDRHQEay5942G
	 BuRQa8Qmcc+2kqw1tPMiugEo4CavoFYgbcTYU/SZNfdZrBYwzsZCQKzQknHytUaE0V
	 9pyQ3m1EF0kLA==
Date: Wed, 11 Jun 2025 17:02:11 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: Meghana Malladi <m-malladi@ti.com>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, "David S. Miller"
 <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>
Subject: Re: [PATCH net-next] net: ti: icssg-prueth: Read firmware-names
 from device tree
Message-ID: <20250611170211.7398b083@kernel.org>
In-Reply-To: <20250610052501.3444441-1-danishanwar@ti.com>
References: <20250610052501.3444441-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 10 Jun 2025 10:55:01 +0530 MD Danish Anwar wrote:
> Refactor the way firmware names are handled for the ICSSG PRUETH driver.
> Instead of using hardcoded firmware name arrays for different modes (EMAC,
> SWITCH, HSR), the driver now reads the firmware names from the device tree
> property "firmware-name". Only the EMAC firmware names are specified in the
> device tree property. The firmware names for all other supported modes are
> generated dynamically based on the EMAC firmware names by replacing
> substrings (e.g., "eth" with "sw" or "hsr") as appropriate.

Could you include an example?

> This improves flexibility and allows firmware names to be customized via
> the device tree, reducing the need for code changes when firmware names
> change for different platforms.

You seem to be deleting the old constants. Is there no need to keep
backward compatibility with DT blobs which don't have the firmware-name
properties ?
-- 
pw-bot: cr

