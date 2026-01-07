Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762A0CF6C1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 09:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BEdNlkEF+V3ZVxV9iTH2XUM+56WQ6cgNcIhMWG/iqaQ=; b=VtjicGKSDLWOMHEYydp395e3cd
	e0w8QurPLMsOfGL/ptWA/oY0rAPd4wE4f7RqpASzSyP8ruvA3DsyE6+kpHK9ixRZaBQfXlytu0Zjq
	CKlyEFH9rrNz9WIywpGUkpzWTbA5WqndYgl6uRTvRkHvhZCbygyVJ4JZliRkt547ZT2MsritOaQc3
	meqGGkqo11xnFwLIsy/Fd2GQ+naOLqHphEEElTrwXBURUagAaLBA9hRibPZ61zKjRCuw49KuV0+zQ
	y9pCCU9HB07jDCAkaCiExpAECN1olg4Je41T877EeMpOLDXghWxNO7Jvk0JCyCdjJx8rrqtivJAC5
	306748PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdPqL-0000000EWlV-3jaX;
	Wed, 07 Jan 2026 09:28:41 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdPqI-0000000EWke-3rLT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 09:28:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1C3494E41FC4;
	Wed,  7 Jan 2026 09:28:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DE3C9606F8;
	Wed,  7 Jan 2026 09:28:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B4985103C86EC;
	Wed,  7 Jan 2026 10:28:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767778116; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=BEdNlkEF+V3ZVxV9iTH2XUM+56WQ6cgNcIhMWG/iqaQ=;
	b=ewBilwLcIsdlR/rISBOifhW9NG3hWv/rqiNaL1s1Hx/KJBA7QLNO2DBxaa3u+7jRM9tPuJ
	3kkp96dTDeQ4j76e9zUtCvmYBXhW6vxT/R1aBuSWiRK6dIzoooOniOVArr81TuXqrs9sbD
	q6ia7XtQsjgD1b51QhUUfzbPRt65YTk1cDANUKyzIxFBpohKVnKHzyHZH5HvhkqwV7Cnij
	uYLM9Jcm5xIfLh4PF1E4cEEjkx5/933XTa8KjuQlVgyCPQ3IzKFzuQ3hNzW4SZi9K8LFX+
	rYziEn9zmmxehRkVCGMSYfyPF8LQr8VqswYNr4H31tSMbU5lP5z5L7g9kXIFAg==
Message-ID: <4bf4ec53-c972-4009-b827-5083e080f32f@bootlin.com>
Date: Wed, 7 Jan 2026 10:28:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 4/9] net: stmmac: descs: fix buffer 1 off-by-one
 error
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aV1w9yxPwL990yZJ@shell.armlinux.org.uk>
 <E1vdDiF-00000002E1d-30rR@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <E1vdDiF-00000002E1d-30rR@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_012839_093592_6B92183A 
X-CRM114-Status: UNSURE (   9.18  )
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

Hi Russell,

On 06/01/2026 21:31, Russell King (Oracle) wrote:
> norm_set_tx_desc_len_on_ring() incorrectly tests the buffer length,
> leading to a length of 2048 being squeezed into a bitfield covering
> bits 10:0 - which results in the buffer 1 size being zero.
> 
> If this field is zero, buffer 1 is ignored, and thus is equivalent
> to transmitting a zero length buffer.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Should it be a fix ? I've tried to trigger the bug without success, this
seems to be fairly specific so I'm OK with it going to net-next.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


