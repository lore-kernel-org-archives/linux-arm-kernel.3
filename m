Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B651BD29FB8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 09:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wggt6wmbTUXS4x4tV46Izk+39B3cnS2JlZr7SjlMcMc=; b=Uw895f0PjScCB9BY2yZlpiGnhv
	T31nN6/Vrj5jyvkLvtL5WuH/xLMqew/flgskYqfFfRsIVUZ5PEJaem9lC8RNZM5w2FNNS7D/Q6KBT
	irfMruWoRVhkRsvqNU5lx0chCXbaRxckQbBRfeQ6Q3xZa1Oc6EubKnqES2YaV9mzpxVAu8FJ0LHhe
	KX3iWCs2nAOncjLR/l99jSy6lv9R9/+E6Ky5y+Aj2yk60Mp/WnkG6Pw+UR8DUvT1elJD76Vq/EJ1M
	VaKiEAJBVd/m+Sir4sQzKTjmLx20iE2m3UaOcMpQip77gdSLU0U5nQjiiQ3lCALAHUuETupaKeMtm
	prXr33rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bvO-00000002OEd-1b9N;
	Wed, 06 Nov 2024 09:02:02 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8btd-00000002NkP-1f5O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:00:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE518FF813;
	Wed,  6 Nov 2024 09:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730883607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wggt6wmbTUXS4x4tV46Izk+39B3cnS2JlZr7SjlMcMc=;
	b=NYBVGt3DiBgndrXBPVl9Dcp0UOdXQJi5EvQ7PonofETdX7a6LslGUKmGWg+JmEXFg6J1pD
	FyR/lcVrtOyxtFwamRmxUJPyyXfEYmdmwAfbKnh7KsDC1h0/7yLzOOjj2gpMp95dhRwz/y
	U00g0SRdXOhgEJZq0rGu8T3aXByEJhDW4hW+nXBF++jjIDN1ts8qCm53sryCTfxOQX8Yq2
	dKuII9OUOqM0Vzu43RL7eym79sijjZAbCZPdwdHf4gJ5f/K/SxfiWEdk9cHrJbVbD47voo
	Bwd3eAwpnG8PM+1m1aaL299H0EEnmxVWwlHcJWN8H4iRMAF+3tiDYbYvwJhVow==
Date: Wed, 6 Nov 2024 10:00:04 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Richard
 Cochran <richardcochran@gmail.com>, Alexis =?UTF-8?B?TG90aG9yw6k=?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 0/9] Support external snapshots on dwmac1000
Message-ID: <20241106100004.50ff4bb2@fedora.home>
In-Reply-To: <20241105182050.2839f1e7@kernel.org>
References: <20241104170251.2202270-1-maxime.chevallier@bootlin.com>
	<20241105182050.2839f1e7@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_010013_712788_A06782AC 
X-CRM114-Status: UNSURE (   7.24  )
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

On Tue, 5 Nov 2024 18:20:50 -0800
Jakub Kicinski <kuba@kernel.org> wrote:

> On Mon,  4 Nov 2024 18:02:40 +0100 Maxime Chevallier wrote:
> >   net: stmmac: Only update the auto-discovered PTP clock features  
> 
> Minor conflict in the context on this one, please respin.

Sure thing, I'll respin right away.

Thanks,

Maxime

