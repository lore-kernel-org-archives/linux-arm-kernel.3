Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157A5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 17:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=333yUrvHkRG3UJz4DC6yymWTSQQMoVp1nOXtAD9WMA8=; b=imoO8KMUFjRbLLCt+vgEDE5yox
	p2aNU6NSXl+wcULEQnbv/pd9vCki97i2jy6jpnXcwtkYizwzlJK7ZHi5KVAwke7Lo85MmjBG3RHi/
	IFTIWPuvAP4qv3R+og3GsOS6lzt/dAslDuPgEZIlTIMS1UcWk5s2PcFVryTtg77ySqkQSW7atoGdS
	Fe7AXp6Jg6v4wtXquJ7hSHr3MARdL9j50iu11mReuZyhnWY5Ug/796GrIWnLgBwsiR8kp1LpVnL1P
	gtS8FFh3FRfODZfP/Ih6ihszvf61NUtDo7taPFer7yWsBkg+HoVAHZ5LsiioIQCUsUXHaaHWfUdUt
	PJriS0jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfLHL-00000005900-3SGg;
	Thu, 02 Jul 2026 17:32:47 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfLHJ-000000058ze-18vD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 17:32:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AB58CC4FEE7;
	Thu,  2 Jul 2026 17:32:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 30144602EE;
	Thu,  2 Jul 2026 17:32:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 64165104C958B;
	Thu,  2 Jul 2026 19:32:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783013561; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=333yUrvHkRG3UJz4DC6yymWTSQQMoVp1nOXtAD9WMA8=;
	b=QwGsMLQ+DqpF5JZ+NnixOA+M8lmYER25GoqwC0efJeFI0li+g/47xhqrpPpCeLvv327DAE
	H8HwO/7xTB7AH1gUwp11SVVjBeRshE5MhDuDpPb8c/El1c7KTm9PKcOr6qQ9nUvyp/B+9R
	tLOgnqi/DPNBZKDVb7arIdKD2Hx9Q5URaDh53087/pgZqz2FrqV/8wERH2Glm5T/Thple1
	tZWwgzwEqkxA5ot/XUWLMut4saogTMrBQx//J/c13GvTIjHdynI5qNjsM5FFtNYv0KEJ/c
	zc5/cVQcwpmIcdGov9DBCe7VYlxhX7oNK7xfiVqg7vZ5vwelkHxac1OX2CoEuQ==
Message-ID: <74b45119-46d8-42c2-afea-e0f0bc340304@bootlin.com>
Date: Thu, 2 Jul 2026 19:32:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next 06/14] net: enetc: simplify
 enetc4_set_port_speed()
To: wei.fang@oss.nxp.com, claudiu.manoil@nxp.com, vladimir.oltean@nxp.com,
 xiaoning.wang@nxp.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux@armlinux.org.uk, wei.fang@nxp.com, chleroy@kernel.org
Cc: imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
References: <20260702025714.456233-1-wei.fang@oss.nxp.com>
 <20260702025714.456233-7-wei.fang@oss.nxp.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260702025714.456233-7-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_103245_486947_EB4F4B5D 
X-CRM114-Status: UNSURE (   6.17  )
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



On 7/2/26 04:57, wei.fang@oss.nxp.com wrote:
> From: Wei Fang <wei.fang@nxp.com>
> 
> Since phylink only passes valid speed values to mac_link_up, the switch
> statement with its default fallback to SPEED_10 is unnecessary. Replace
> it with a direct call to PCR_PSPEED_VAL(). Also update PCR_PSPEED_VAL()
> to use FIELD_PREP() for proper field masking instead of an open-coded
> shift.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


