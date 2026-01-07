Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F00CF6C00
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 08:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6R5YZXnAQ2jLJpBkyeX/V5VN7/gW0xtPNeUE+gg5Fs=; b=J2lQeJB4mQiiJywP4k7mxAa04V
	Rhw3xqI8yYj/t8sTsBKmkB2fxvSpD6G+p7u36TYUhh1nGH/2cA3+TxWGM2V+/Dp1W8n3Lk1cz+RXJ
	BS3XzSRMZZpvnOADF75v6OoOrsn+QLTPz+ybTqX/7yd6pEmJpafJzHheFT4YZMJj3OHbcSHMeBBQO
	buXHY6sJcQXWnrKzZyfXwiK2Pee0kp5XHYhWVniopMTAt+p1CeI3JI/BZFROBB+8vq7JxCTGv2g4w
	dLs0dtcwLmLe6P02/D0n/crWnsfc8BWilKcphu7D0MlF7cSEYhspxQ1g7lfXc35loS6eqIzWEy8CA
	K8bsJd9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdP7G-0000000ERcL-2Mc2;
	Wed, 07 Jan 2026 08:42:06 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdP7D-0000000ERbu-0fat
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 08:42:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D135FC1EC95;
	Wed,  7 Jan 2026 08:41:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E323A606F8;
	Wed,  7 Jan 2026 08:42:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9889103C84BF;
	Wed,  7 Jan 2026 09:41:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767775320; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=S6R5YZXnAQ2jLJpBkyeX/V5VN7/gW0xtPNeUE+gg5Fs=;
	b=zuEF6uCZEW7MAHhZSfYimtePz4dneRVkvsfmd0IFWnS95yRuVQsF9TBXvExxudranQSWB0
	SEkKGmgO6eJIuzbaMi7rV2Bgj/T539Lq0xtJvJt3inSLgNdG/vmh9fb6z2MIgIVQ8YG0um
	wbs1nXmajdpv8IGBU+ehdoe933Tei5wVDoYE8HOesWiJIgx5yszMDQkZ5TVfx5bOShcDMI
	Ad+LaOiIgVvuEC3oP4YDclRNs26m4kVsPb2HREsmVyLc9inzlc7c4DbAFOh4o+mXthR07g
	Kp2VsNImixkFYhhdmICTMZ6Nzfqqxnup8SZiu5NnpQ57KFLXGOo/4VN9ufdKfw==
Message-ID: <0b5a9cb4-3d35-4650-b482-29b3c780ed1a@bootlin.com>
Date: Wed, 7 Jan 2026 09:41:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/9] net: stmmac: dwmac4: fix PTP message type
 field extraction
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
 <E1vdDiA-00000002E1W-2X6U@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vdDiA-00000002E1W-2X6U@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_004203_344009_3141D096 
X-CRM114-Status: UNSURE (   9.38  )
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



On 06/01/2026 21:31, Russell King (Oracle) wrote:
> In dwmac4_wrback_get_rx_status(), the code extracts the PTP message
> type from receive descriptor 1 using the dwmac enhanced descriptor
> definitions:
> 
> 	message_type = (rdes1 & ERDES4_MSG_TYPE_MASK) >> 8;
> 
> This is defined as:
> 
>  #define ERDES4_MSG_TYPE_MASK            GENMASK(11, 8)
> 
> The correct definition is RDES1_PTP_MSG_TYPE_MASK, which is also
> defined as:
> 
>  #define RDES1_PTP_MSG_TYPE_MASK         GENMASK(11, 8)
> 
> Use the correct definition, converting to use FIELD_GET() to extract
> it without needing an open-coded shift right that is dependent on the
> mask definition.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

