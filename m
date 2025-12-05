Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1088D2CE01
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 01:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jX6uRiZlwiDJ2yrSvaAmgyo6yVY8RzM8gMgteA7ltd8=; b=Z5wgkHoOyzEL5yjI8lSEtRgtZa
	dTLFnz+J+EmzPphkIOEWHoHMVeiJw2AlI8FPDoHiRComieiPhY/Z8KPVQd9elJJWhNO3+cmDkRor1
	lNyjUJigRg5pX1Sp5cR3FJdGPvQlIfSiqky5Wi6RjDnZxSypSb9qCHUjlEiypwyx1qX+XY6a6swRf
	D4JyGxd6QKNyvHNe9L5a8QktDcJ6yZfWgmUVDo0uJ0y8voCyCYrFRIh2hCkZyFM1f3fVMzf88USzX
	ip6rnOMWRfenl6OrLMVeTVdN2DklRUfLv1XEFe6aHoJbFjqxmMorfA6rLufqWKolrNJH0VTR9Fpev
	1JjokZsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRKzB-00000008soj-3g0I;
	Fri, 05 Dec 2025 01:51:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRKz9-00000008soH-0lR9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 01:51:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E67A8415F6;
	Fri,  5 Dec 2025 01:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A4DC4CEFB;
	Fri,  5 Dec 2025 01:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764899509;
	bh=sKh7ACLjMjQtVuiTyjntM342EI8O9YcjrBWtL5K0Ou8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dvCRUhE4cHp8jX4hjL7MrcKx+G/eDwKRqqbfP+yt0xwK282dAeQVkVLguW4qM3Kwe
	 tNZe0rV1mcebu3UjlH00h3WRgBdW88mLIaTeeyitTIRxe2KQotLBhn/NRvy9PoY9PO
	 YfrvVQssy3G6KbMQPjo8mDMGVUp2nTAhq2O9oT/L/FukZ6WDXvjGBx9fv4Lw0fSvhc
	 jFKYbTr0icmubOJPfqii/uQKXL/XLPuZKytqgPp7pGN4DPrQIxLEepuCLasHQPCzTS
	 q/IN+5MbpRe4CDrswQSV5wXN9+QuBTTydwNwXxnWygCZN2LHdPJihzmJxZP9o5Pkk4
	 Q/+LngI7aVRdA==
Date: Thu, 4 Dec 2025 17:51:48 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: 2694439648@qq.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 hailong.fan@siengine.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, inux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] net: stmmac: Modify the judgment condition of
 "tx_avail" from 1 to 2
Message-ID: <20251204175148.5a5cc065@kernel.org>
In-Reply-To: <tencent_639FC431D959DA3E8FC007985FC88EA5A90A@qq.com>
References: <tencent_639FC431D959DA3E8FC007985FC88EA5A90A@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_175151_246409_56BA0737 
X-CRM114-Status: UNSURE (   7.60  )
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

On Wed,  3 Dec 2025 09:31:52 +0800 2694439648@qq.com wrote:
> -	if (unlikely(stmmac_tx_avail(priv, queue) <= (MAX_SKB_FRAGS + 1))) {
> +	if (unlikely(stmmac_tx_avail(priv, queue) <= (MAX_SKB_FRAGS + 2))) {

Please add a constant for "(MAX_SKB_FRAGS + 2)" and a comment next to
it explaining why the literal 2 is used.

