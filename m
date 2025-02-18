Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B00C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 13:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CadJhOiuOL+bA49PAWirsjDCGJLOFaxwmiT2F0EYUzM=; b=LwGly/u5+CXbESOkpk9vHYa7Rw
	MjVrKb3dIhxzMfRYY8oP4jLuSTI2Smukbr91/MmLWfWtX+SQ6ub4y6F4u0YxOKHoRuHiRWjQMUMuK
	sPo69eCxdlXNWNLfn7yfh278CJrKTI0y7tQsadzo9HXKkGRteANEsIG7iK/Z52/+FeMhB2Ym4hrBH
	FZQhqzz0H5YoV38ago8z348+15PxXX3+9kkUd2wnPAtVycFF8uOhtimN5Syr3IuAXklWPQdYVqhUT
	VmBWR3LFJTTG1loy6T8CSTFnmlC/T6ezgj4a0fTgpgC4JPN9C9myMAidunVsz4PMfolFhBi7BUio8
	XPzsVv4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkNgV-00000008KTh-1CdN;
	Tue, 18 Feb 2025 13:30:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkNds-00000008JqK-1KJC;
	Tue, 18 Feb 2025 13:28:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AF724A40C18;
	Tue, 18 Feb 2025 13:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B20C4CEE2;
	Tue, 18 Feb 2025 13:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739885283;
	bh=WUKim6I0GIa7OB0lKVP3eWVJgzUnm9e3oqomWqD2WwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QRkY5wkhLUTZa8Vgk9CcWZJea74bEM97C45lbFLORkAUB5t+VRmdEfU71ySeA/yxW
	 5NMqAIX9A0mbShZ+R0dswW7gak2vOJLFcxXy6KrkdB5sPzBqsEpf3AzkIGxXnIhi1j
	 jMtH7ZgyYxe6ZU5hCKKLmDtFA4fD/bK+9C7rBVuEwPMl03ASmv8RMDMtUK75L5AGBj
	 gSoA+Q3PlsZPfztif70R0TpNPtuuu2NmOTlfjkyJlRXepDS0ZzSBdQ9hWCbfFthAl9
	 QZaaiqQDwFbj7B/EIHbZFOtv1qiyrmUw8WSerUvHwo6E8JULcreHVOo51tozIV+s6t
	 eXpiL0Mo+Wqbw==
Date: Tue, 18 Feb 2025 13:27:56 +0000
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH net-next v4 13/16] net: airoha: Introduce Airoha NPU
 support
Message-ID: <20250218132756.GU1615191@kernel.org>
References: <20250213-airoha-en7581-flowtable-offload-v4-0-b69ca16d74db@kernel.org>
 <20250213-airoha-en7581-flowtable-offload-v4-13-b69ca16d74db@kernel.org>
 <20250217183854.GP1615191@kernel.org>
 <Z7OMv-7UBVtKaEFb@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7OMv-7UBVtKaEFb@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_052804_420733_6D957FB6 
X-CRM114-Status: GOOD (  15.83  )
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

On Mon, Feb 17, 2025 at 08:23:43PM +0100, Lorenzo Bianconi wrote:

...

> > > +	err = devm_request_irq(dev, irq, airoha_npu_mbox_handler,
> > > +			       IRQF_SHARED, "airoha-npu-mbox", npu);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(npu->cores); i++) {
> > > +		struct airoha_npu_core *core = &npu->cores[i];
> > > +
> > > +		spin_lock_init(&core->lock);
> > > +		core->npu = npu;
> > > +
> > > +		irq = platform_get_irq(pdev, i + 1);
> > > +		if (irq < 0)
> > > +			return err;

...

> > Should this return irq rather than err?
> 
> are you referring to devm_request_irq()?
> 
> https://elixir.bootlin.com/linux/v6.13.2/source/include/linux/interrupt.h#L215
> https://elixir.bootlin.com/linux/v6.13.2/source/kernel/irq/devres.c#L52
> 
> I guess it returns 0 on success and a negative value in case of error.

Hi Lorenzo,

Sorry, somehow I completely messed-up trimming context and managed to make
things utterly confusing.

I've trimmed things again, and it is the platform_get_irq() call
not far above this line that I'm referring to. It assigns the
return value of a function to irq, tests irq, but returns err.

It is one of (at least) two calls to platform_get_irq() in airoha_npu_probe().


