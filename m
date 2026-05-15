Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D438BCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 22:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xI2ig96b/BTjapm4gylE7Y2++ydrNNWtVFR1HBfi2sY=; b=dkrD2TyDjU2QevFcdmdLvz/aZ4
	gAA3aQlVv1iuMw/8eHEQcIcT7AdiriYWk0OOUOAfr1bi/8yX8iLyrlIBgKN7dQfvYKVTEj9ArXFW8
	gxM00ESBu+z7bkKkyPsspOcuCZs67Uhh/OOo1grh4q8ViRMm5/RI1/W6BcnekhcQG8Xn2IVVToGFO
	8AyctJOdaTdD5M8FQp+8ahXylegfZJQdnJMUlShF0rkQ4vEuyO0ZIiJtS6oiDbrvg8rsE9/iXvyVG
	ByrqeVCUxvU6JXv1V1fsGdc3LlVRsh/W5zl2v3nRfA1C8VU9g0KX+bc24foHXuN2GnI99Bdq4wPGG
	MFV/Zgew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO1I2-00000009evV-0wh5;
	Fri, 15 May 2026 22:45:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO1I0-00000009euo-1UiF;
	Fri, 15 May 2026 22:45:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 35B3B40874;
	Fri, 15 May 2026 22:45:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C7ADC2BCB0;
	Fri, 15 May 2026 22:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778885151;
	bh=uIau35s5bIEmw6EC+X8vEmauWXOWouZDyj8O9Ysx4Hk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YD35XbkdraLWjjJF2eEmG679oOXznOFhFTUbO22eWOAv+RcE5jaOG88AVtGZOTRMP
	 IhCEyRF9n/eGWG+qyLbiD0vYaR7gMD5pEJSeUmt1O+iOsUYbnR8gBcOd1Stg1YSHmX
	 yXRFgoyiaN9FNSW9lkkzqTDFxtCsFfry5wd1kVoD4vmuoFTgCDfkOk5vGYCj8V9Ht9
	 mlE4X8XB3A/vrs4eyC5cNlE+FO2XSou29VPAn5fK5SLMop6FAPudTzfpUytVaRUhTn
	 Ohf8V7fQu3HNerYfEzmlmEN81nbzdExymFP3urjmBU6fjeihQT8UK9JT9HnIAykGqk
	 hHuzNg0wjETRQ==
Date: Fri, 15 May 2026 15:45:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Frank Wunderlich" <frank.wunderlich@linux.dev>
Cc: "Mason Chang" <mason-cw.chang@mediatek.com>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org,
 "Russell King" <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 "Andrew Lunn" <andrew+netdev@lunn.ch>, "Eric Dumazet"
 <edumazet@google.com>, linux-mediatek@lists.infradead.org, "Daniel Golle"
 <daniel@makrotopia.org>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "Paolo Abeni" <pabeni@redhat.com>, "Lorenzo Bianconi" <lorenzo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, "Felix Fietkau" <nbd@nbd.name>,
 "Frank Wunderlich" <linux@fw-web.de>
Subject: Re: [net-next v8 2/3] net: ethernet: mtk_eth_soc: Add RSS support
Message-ID: <20260515154549.307a61cd@kernel.org>
In-Reply-To: <935a73a6e458b2d4fed2e59192e725483ca62126@linux.dev>
References: <20260509190938.169290-1-linux@fw-web.de>
	<20260509190938.169290-3-linux@fw-web.de>
	<20260513185625.48e69837@kernel.org>
	<935a73a6e458b2d4fed2e59192e725483ca62126@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_154552_427887_250E896D 
X-CRM114-Status: GOOD (  11.68  )
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

On Fri, 15 May 2026 11:13:05 +0000 Frank Wunderlich wrote:
> > >  We can adjust SMP affinity with the following command:
> > >  echo [CPU bitmap num] > /proc/irq/[virtual IRQ ID]/smp_affinity,
> > >  with interrupts evenly assigned to 4 CPUs, we were able to measure
> > >  an RX throughput of 7.3Gbps using iperf3 on the MT7988. Further
> > >  optimizations will be carried out in the future.
> > >   
> > Would be great to split this up a little more for ease of review.  
> 
> you mean splitting the code into more separate patches or the commit description?

The code, seemed like it should at the very least be split into
multi-queue/napi support (mostly driver changes) vs RSS programming
and config.

