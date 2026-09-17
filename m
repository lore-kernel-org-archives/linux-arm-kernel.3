Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32DEC982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTDf8OaqeURgLMZ5E+W4mtiF63QZY3UkbGUJHnDdviI=; b=eGB6kTZ5jxru5djhvfTbnVA3F0
	Kdx7dgBXagD5VnS1AzHXIfV+v+CNoNV4YdMiypsdTiHxWd6xQMNYd9llQOb0n2A/OGEjUXgHnyaM2
	l+z0EtC4zKPQBPhVAjgYpCHnfMJn+4OKtjMeJjQmvetVTHxXOwTw4rP1a0kKrOq1dCc0w7w1PgBaG
	bDOizlUghRgfAYB7FbYPz9D34znpbAO7rWRABncnbVbftoIMHw5ADQo8ggDCi2snNaNluGr9rYqRO
	chlz48/Bvu2fJ3QFQnDgIN4l3/IHoqAWj8ddA/+Wok8XqlylCT9kfAiPsv4FGybdj+SLJBoklXMit
	3M3RB03g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EUC-0000000BmcI-2Koo;
	Thu, 17 Sep 2026 15:57:20 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EU9-0000000BmaH-0vee
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:57:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6B4B0C5CD7B;
	Thu, 17 Sep 2026 15:57:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E8E9460580;
	Thu, 17 Sep 2026 15:57:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 93FC111C7B064;
	Thu, 17 Sep 2026 17:57:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789660630; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ZTDf8OaqeURgLMZ5E+W4mtiF63QZY3UkbGUJHnDdviI=;
	b=paun6XS5Aa9eJQnGmxIRzXfeJlkaE4A483QIplkcNV7R5hp21OPfaI3+6zrq34NqxcAkvi
	3TqBGWME9WLNnUXeCcrIw2eriPYueyAfq4FW6RFAhZjAI/PFy4YApsteu87IVD/UqxU25i
	ckLkWvN1n+Yu5Otscq8IgYw2CjqLShDM216p4aQ9ghNblLehpYoUERkcX+LE+ylXvF/MFE
	bf9CSw0gIESSUIV7kSixB1WezuN7ZKvx49STCl+LzJJ3g5B2Do28l/7XujP4BTJ0SW8HRi
	DZ1Chg2OuOvJ2Hm9mDFAqznKw1+c5gULQUsBo7kIlgpRmWjt8zXBQoYTYxB8NA==
Message-ID: <b521308c-34b8-40dc-831a-757a163902d6@bootlin.com>
Date: Thu, 17 Sep 2026 17:57:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: fix the invalid VID programmed by VLAN
 perfect filtering
To: Linkui Xiao <xiaolinkui@126.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Linkui Xiao <xiaolinkui@kylinos.cn>, stable@vger.kernel.org
References: <20260917122245.1338365-1-xiaolinkui@126.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260917122245.1338365-1-xiaolinkui@126.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_085717_429740_1D39E6C7 
X-CRM114-Status: GOOD (  11.02  )
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

Hi,

+Ovidiu

On 9/17/26 14:22, Linkui Xiao wrote:
> From: Linkui Xiao <xiaolinkui@kylinos.cn>
> 
> for_each_set_bit() leaves its iterator equal to the bitmap size once the
> loop terminates, so the 'vid' read after the loop in stmmac_vlan_update()
> is always VLAN_N_VID (4096) and never the last VLAN ID that was found.
> 
> Cores that do not support VLAN hash filtering (dma_cap.vlhash == 0) fall
> back to the single VID perfect match filter and hand that value straight
> to the MAC. vlan_update_hash() therefore programs MAC_VLAN_Tag with
> VID 4096, a value that can never match an incoming 802.1Q tag, so the
> perfect filter ends up discarding all VLAN tagged traffic. Both
> stmmac_test_vlanfilt_perfect() and stmmac_test_dvlanfilt_perfect() walk
> this path and fail as a result.
> 
> Remember the VID while iterating so that the last active VLAN ID is the
> one passed to the perfect match filter. When hash filtering is available
> 'hash' is non-zero as soon as at least one VID is active, so
> vlan_update_hash() keeps ignoring 'pmatch' and nothing changes there.
> 
> Fixes: c7ab0b8088d7 ("net: stmmac: Fallback to VLAN Perfect filtering if HASH is not available")
> Cc: stable@vger.kernel.org
> Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>

Thank you for proposing this fix, however this code is currently being removed :

https://lore.kernel.org/r/20260908164309.59282-1-ovidiu.panait.rb@renesas.com

So no need for this patch :)

Maxime


