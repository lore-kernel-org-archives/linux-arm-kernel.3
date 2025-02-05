Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1E5C02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 14:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zn1OZ0/xC5hWSYyFfGAzueY2AGtYBGt8AuLFCHG10t8=; b=a+fFwaVQejV76INQ94WH4SrHWB
	xOsEryi/MTQhpdhMNJx7w3Gt+TFCnIlkuAB+/ZEweG1j0iixm5MAIwp/Iw5PZqNfY97xEOCnkpEDi
	3SKFIb01Xq7EYgIPnV79BL32r3EinEFRXsGhqHnDGRCfNxIssd32YPOPQC5W3mPDQVKKOdHsZEaeo
	AAqE97gIIuw0F/fw+4OK6hh4aUcrJgtKhNlj7KciYk498OqG/vYtx5ZvVzGEDMWm8UhyZ4i+KHhea
	+1MUSrdVKUsgzEt3437rT0Gi63XV4E0Q0WLyGimm391LRTswPrqQZXgwvsqyUvQqwBFSTuMifMkKt
	EHcHKc8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgOX-00000003XVY-3Iib;
	Wed, 05 Feb 2025 14:28:49 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgIx-00000003Wc9-2wCw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 14:23:07 +0000
Message-ID: <f728a006-e588-4eab-b667-b1ff7dfd66c5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738765376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zn1OZ0/xC5hWSYyFfGAzueY2AGtYBGt8AuLFCHG10t8=;
	b=eg4nZJbO0xpeG0pLWlbhMOe6AYAiwdcu4kYoQMdLWO+eZdJ3lFgi+Jpg3kpYb/i14hvLjJ
	/+NqrmVuZeacszL66SFSgoFSCyY+PoN4hFtdoc0HT7vGRqjXutkQ+JV8tyyG3jBtPypA32
	7MoUOedOYpMYKM+fZ/PdUpF9Kz9lHl0=
Date: Wed, 5 Feb 2025 22:22:00 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] net: stmmac: Allow zero for [tr]x_fifo_size
To: Jakub Kicinski <kuba@kernel.org>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Steven Price <steven.price@arm.com>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, Petr Tesarik <petr@tesarici.cz>,
 Serge Semin <fancer.lancer@gmail.com>, Xi Ruoyao <xry111@xry111.site>
References: <20250203093419.25804-1-steven.price@arm.com>
 <Z6CckJtOo-vMrGWy@shell.armlinux.org.uk>
 <811ea27c-c1c3-454a-b3d9-fa4cd6d57e44@arm.com>
 <Z6Clkh44QgdNJu_O@shell.armlinux.org.uk> <20250203142342.145af901@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250203142342.145af901@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_062305_338162_582CD091 
X-CRM114-Status: UNSURE (   8.52  )
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


在 2/4/25 06:23, Jakub Kicinski 写道:
> On Mon, 3 Feb 2025 11:16:34 +0000 Russell King (Oracle) wrote:
>>> I've no opinion whether the original series "had value" - I'm just
>>> trying to fix the breakage that entailed. My first attempt at a patch
>>> was indeed a (partial) revert, but Andrew was keen to find a better
>>> solution[1].
>> There are two ways to fix the breakage - either revert the original
>> patches (which if they have little value now would be the sensible
>> approach IMHO)
> +1, I also vote revert FWIW

+1, same here.


For a driver that runs on so much hardware, we need to act

cautiously. A crucial prerequisite is that code changes must

never cause some hardware to malfunction. I was too simplistic

in my thinking when reviewing this before, and I sincerely

apologize for that.


Steven, thank you for your tests, Let's revert it.


Thanks,

Yanteng


