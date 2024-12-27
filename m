Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C35E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 00:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzRtHyaOm0QTTqWDHMJhMfG6t9/gP3cHEp5VtARcjRw=; b=sGSvzJryER81fv0p/BaKu0CV3u
	DIYuwMSqmbBD0txJ7AzLl2ThByyVr9nL5l2gUDgXKjc5Lnn2FH1C4N6k1t/7vicyRwccX55p632pd
	xhMxT5UkphmweGwxYMu/R8y1Zlz6VQ82yTFSuo34q+PxuXLjsUlSIgH1cfSk4zETQyinmCkW3gdQB
	gKzEGTk3zeSXaXZPKJm669NJMP549JMky6EygkVOXvcZWIq9OIHohbgS26iyBOBw4yZAwYBtkf8NR
	KC/1xDV5/Y838IFiNbLDNvBDKchebWr0yFIsGTQFOllDa1U6MmK+acuFtpqJXHHwudtAvpvj/IbLW
	Cch+hiug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQy7j-0000000GjCh-0gsK;
	Fri, 27 Dec 2024 00:22:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQy6X-0000000Gj4Q-1UNS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 00:21:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9983C5C5C43;
	Fri, 27 Dec 2024 00:20:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F8BC4CED1;
	Fri, 27 Dec 2024 00:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735258884;
	bh=V+mEXywVZORhR/Oo9rUvOuzREKEsXU0AY7F4F3pTwqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K2bEfUTxtAQs9/IabqOCB/3DdE9qH5kyf8/IxbZrt/wWnsOZRxcr3Gm5bJrdxF+B1
	 4OjADb+vbdD5fQNyKb2pgp0Sfvl5/6rU+Vp3CDHEHfZZkHIBfqZYipKrOJsfvfcWd7
	 qtawQvg+4zSlRyunuJEYwtik4bHNUziSm91mLdEXfmSf7QPeF2ToRLUIQOcsm22fAY
	 zE4iIHpZCcU72hyxTXLiG0X1XZ217TFqaLTyDa5RLxmCmrbFJ+3ut767ksmk/xq17s
	 VL/JN/8rEKIC0aPdKrXm1GIVwzuW+1NbnUJnxhUeN01bprgLYaHPwGd4Yo4D47HJi3
	 o3E2ij1vo4/Cw==
Date: Fri, 27 Dec 2024 01:21:19 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: git@amd.com, michal.simek@amd.com, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	radhey.shyam.pandey@amd.com, srinivas.goud@amd.com, shubhrajyoti.datta@amd.com, 
	manikantaguntupalli09@gmail.com
Subject: Re: [PATCH V2 0/2] Add atomic transfer support to i2c-xiic
Message-ID: <bmgnnolg2nfvidfyccxhvb3lpesopcnsv52kkmyguqk2kaajxd@jdblobvwgl4c>
References: <20241210095242.1982770-1-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210095242.1982770-1-manikanta.guntupalli@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_162125_447515_BD7AF14C 
X-CRM114-Status: UNSURE (   9.62  )
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

Hi Manikanta,

On Tue, Dec 10, 2024 at 03:22:40PM +0530, Manikanta Guntupalli wrote:
> This patch series adds atomic transfer support to the i2c-xiic
> controller.
> ---
> Changes for V2:
> Remove NULL checks for tx_msg and rx_msg, as __xiic_start_xfer() already
> has checks.
> 
> Manikanta Guntupalli (2):
>   i2c: xiic: Relocate xiic_i2c_runtime_suspend and
>     xiic_i2c_runtime_resume to facilitate atomic mode
>   i2c: xiic: Add atomic transfer support

these look similar to other work you did earlier. Looks fine to
me I'm not delaying any further and I pushed it in i2c/i2c-host.

Thanks Michal for looking into it.

Andi

