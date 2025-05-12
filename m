Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1C8C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 16:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JmNM1qr8paaatXiculJ5HFFWSqjMdY6Pe+6AalpRTVI=; b=EYAi68oSirLecdjp9saT6/epIo
	W9GsD4xkJH0oKjYIalflU0yBke/sgekuYkGXZJPwFufJSMOQv6/uJHuoExl1TCInFgm1j20Y+Lpxk
	JFtvnj+tA42vTwAVX2zwWyTLb0QKPAxoyyd3+2uxHnBeccuRdRwfYyVsg8Q1s1yNB3Sh/VSnXX/47
	SQt+G0ldD8MR59orq6uzDM/7s+uNfyuIaO8VfLewu6xlocgpcT2pmWUyBOaxgCauxO/eVrMjfgAKY
	2urNjgU+csn0aFF1wAT9JZyTF9+uHbBosTMURKoa2vsb4jVorbu0nuGhoV/sPz0qNbpkyEld4PBWZ
	4nuIrd4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEWKo-0000000A6ys-13Su;
	Mon, 12 May 2025 16:48:58 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEW4V-0000000A3Vr-1NMp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 16:32:08 +0000
Message-ID: <76961134-0676-4ec5-b5e1-5a9693bff268@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747067523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JmNM1qr8paaatXiculJ5HFFWSqjMdY6Pe+6AalpRTVI=;
	b=wA4CXoJ3Ta2nrePmKsSMlFl45w4ah+sYkf90mdblqcv0w7R7YfJTu4FFoj6O+va9Nbua8V
	zJxlAWuM58jZjnzKgoGyEB8k0EzZ+hhfJ36dqnkC00BVGWfxGzckTK+coS29mkNyVtkbD/
	8yCOMdAmcCPjUDvV1EJyctB+tXS/UFI=
Date: Mon, 12 May 2025 17:31:57 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: stmmac: convert to ndo_hwtstamp_get() and
 ndo_hwtstamp_set()
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Furong Xu <0x1207@gmail.com>
References: <20250512143607.595490-1-vladimir.oltean@nxp.com>
 <2ca5f592-74d3-41ff-8282-4359cb5ec171@linux.dev>
 <20250512155846.vbmc3wrvpidbzxqc@skbuf>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250512155846.vbmc3wrvpidbzxqc@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_093207_559165_BF43A635 
X-CRM114-Status: GOOD (  13.24  )
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

On 12/05/2025 16:58, Vladimir Oltean wrote:
> On Mon, May 12, 2025 at 04:50:35PM +0100, Vadim Fedorenko wrote:
>> On 12/05/2025 15:36, Vladimir Oltean wrote:
>>> New timestamping API was introduced in commit 66f7223039c0 ("net: add
>>> NDOs for configuring hardware timestamping") from kernel v6.6. It is
>>> time to convert the stmmac driver to the new API, so that the
>>> ndo_eth_ioctl() path can be removed completely.
>>
>> The conversion to the new API looks good, but stmmac_ioctl() isn't
>> removed keeping ndo_eth_ioctl() path in place. Did I miss something in
>> the patch?
> 
> I was never intending with this work to remove ndo_eth_ioctl()
> completely, but instead to completely remove the timestamping
> configuration path that goes through ndo_eth_ioctl(). I apologize for
> any false marketing and I will be more explicit about this in further
> patches.

Got it. The patch itself looks good:
Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>

