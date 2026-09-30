Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0417ECA5FBB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 07:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3G3ceyW26tN5FPIC2tk9DLejAJ+HGX06qzLwQTysr4=; b=j75nNS37PVMTC5wjlJIVj+QXgo
	XiKWd9r5N/wBLxK+50idndbBOnyC5s2j2BgiB7ueWHk2cjfn9/HcCBcwXjZ3sW1HLZmiJLUbDRtrZ
	c92+DD9P7cKZYIvHOIcCpVc1pr/5UedQVZHQJrO7zk39StCCr+SNqW080v61RwGSXm6b1gARS7iX0
	OpYDcRgQOlggIPDXPG4tQjI5jJQWZM5nY+EDFXuBcYSinLWlZsKVO1ywEp20NDuxOsju4F7qpWA1N
	Ak8ZXj46VZ5kphetSeGwZjyGHTusGa31hcCSCXs4hnQenNQVTyeocIpcrDZTUG1s/V6mGvkM4Qjp2
	QVeTG1Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBom1-00000005HDB-0Bxo;
	Wed, 30 Sep 2026 07:30:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBolz-00000005HD4-2ipf
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 07:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=V3G3ceyW26tN5FPIC2tk9DLejAJ+HGX06qzLwQTysr4=; b=kwfX5hraPjliMgon/Jb541aCKL
	GEWsRIq0boG5MJpMNUzrdk/AvzYmuS78jeDQpA9HYr08Qr3pmZCzUxWQ+DWstAQLLfVUhqQF0dxiM
	3/IHk2XHzpBI1hRPBsoRXYfhcaDqOx5Pod8QEjWa0Ho5eNfdWw1PPmaBJCqxvu/UMFClRSCPvkBYF
	Qz0Yno5kDP6Mb9bSOSdj4ip3Ue3p/u87DpbUmzJYytbTxlpaSy48ukkGKicQKJyw7Zmpt6UvUmxq0
	M/OL1wKa3qkfT65IibQ5+ZgVeYetyY0FJqmTBdo/aqkPkdwRbCv9Ca8G0jf9UaJhIvbrfyJ+NCRqm
	wjjCPx0w==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBolw-00000003TRS-19xw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 07:30:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5BEDC1A1084;
	Wed, 30 Sep 2026 07:30:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2CD8760749;
	Wed, 30 Sep 2026 07:30:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 00423103294FD;
	Wed, 30 Sep 2026 09:30:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790753431; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=V3G3ceyW26tN5FPIC2tk9DLejAJ+HGX06qzLwQTysr4=;
	b=f/gUxUXolvh8eWiue5bAu55n1GQNeRg8u+QkBZ30JkUoTYKnkfAonnsM1S3a7LM3TggjrK
	YRJT6G3l5J+Iw1wKtT38rsVACAZSMWr3cWXBZHa5TvJTwz+bOVwuWyaDSUqrqY79Y3iIR/
	meA7OAzqcsUwn7iHNpZZw/b/l+mKRfQTmmBn9Ae8BXcSYn17OmHc+iTg6Ink3j/OVT9O5r
	VQqRIiXMxZ9pg3ShPw+dqSd2NF4PyKbzBdQYpWuUrq26g0x9Gxs1BA2pMMcWoXTHh8BsQR
	rtZC4LvbCMSprTkWmi7psnD8QWqPjJvhCxpYnuAleSIzVgwlH28b1N3DwXDOHw==
Message-ID: <c19df0e5-7edc-4e68-aa4e-36753066e945@bootlin.com>
Date: Wed, 30 Sep 2026 09:30:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: Don't set or get RSS
 parameters when not supported
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev-bot+sashiko@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 horms@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, nb@tipi-net.de, jitendra.vegiraju@broadcom.com,
 thomas.petazzoni@bootlin.com, alexis.lothore@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, pbrobinson@gmail.com
References: <20260928145043.1228968-3-maxime.chevallier@bootlin.com>
 <179067171307.434549.1093187286398187440@kernel.org>
 <71adb267-2dd9-4225-91e5-19848a87eb49@bootlin.com>
 <20260929180928.546f23af@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260929180928.546f23af@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_083036_618851_3C237D65 
X-CRM114-Status: GOOD (  12.43  )
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

Hi Jakub,

On 9/30/26 03:09, Jakub Kicinski wrote:
> On Tue, 29 Sep 2026 10:57:10 +0200 Maxime Chevallier wrote:
>>>> @@ -943,6 +949,9 @@ static int stmmac_get_rxfh(struct net_device *dev,
>>>>  	struct stmmac_priv *priv = netdev_priv(dev);
>>>>  	int i;
>>>>  
>>>> +	if (!stmmac_rss_is_supported(priv))
>>>> +		return -EOPNOTSUPP;
>>>> +  
>>>
>>> [Severity: Medium]
>>> Does this -EOPNOTSUPP break namespace-wide ETHTOOL_MSG_RSS_GET dumps?  
>>
>> This was reported by Nicolai already, and other drivers report -EOPNOTSUPP
>> here.
>>
>> If we address that, I'd say we do that in the RSS ethnl code.
> 
> Let's get this in the same series, cause I'm not 100% convinced.
> My instinct is that returning 0 size for indir table and key
> would be correct and less hairy for the core to handle.
> All pieces of RSS are optional so returning 0 size for everything
> should be equivalent to having no RSS.

Ok no problem, I'll also give it a test on mvpp2 as well then.

Thanks,

Maxime

