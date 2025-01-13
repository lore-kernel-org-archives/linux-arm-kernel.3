Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1F7C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 16:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJOghlU8ppSEsLnsa+7G654aZpvcnksHwQ+VO9d8IOI=; b=O3E3l9d5R8gJ7DwlfteLXzrsWd
	T2Dv1qdzxIUnEbGEMBDIw8iR41qn6z7rKPJJRhVgDSy0c/L+HmKqTyYsoJSXAcIpfwJOFngeKqZvM
	Xq+TlwFbT1tMWFouQhcPh0hLF2qJscss17jgRHfAN8B0sVwwNYAiTL6RCXq9dm9foh4NuUlpCa7Vb
	blmoQuJjbwCrpLGlWmSWMshksDxa3xNcCIHAGiD0VVuQmNzEcWz5q7tUOgXfJSBFTF43Sd9DL3jWs
	8zSFuHw9RgzIYEr8+NJi6wsaeVR2SVcm83HWZDbQNtdELuDu/+w+WUbUai2IohrjUusTJh05U2jg8
	YF/LVFNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNfS-00000005wf0-19Gy;
	Mon, 13 Jan 2025 16:51:58 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNcC-00000005w0z-39KV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 16:48:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NJOghlU8ppSEsLnsa+7G654aZpvcnksHwQ+VO9d8IOI=; b=aCiEXW2+MU0SobXi9dTn0RJT42
	D7mHtH5qln/3dYjZVfQMZRksLtTRuL3tfH1O3LdtTyOuQ+kIpCMZZjz5oGbolHVP0eesfubaPlUx3
	0DzvvWGuxXKaPTYEwSAOTX4WENu0EFZ8iiS/aIRQ7mqCxvnPKJbC/c5eI+47inFZZpeA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tXNby-0049kS-3R; Mon, 13 Jan 2025 17:48:22 +0100
Date: Mon, 13 Jan 2025 17:48:22 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Yanteng Si <si.yanteng@linux.dev>, Furong Xu <0x1207@gmail.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
Subject: Re: [PATCH net-next v1 1/3] net: stmmac: Switch to zero-copy in
 non-XDP RX path
Message-ID: <e9cacef2-1049-4296-92f4-85041f4b6eaf@lunn.ch>
References: <cover.1736500685.git.0x1207@gmail.com>
 <600c76e88b6510f6a4635401ec1e224b3bbb76ec.1736500685.git.0x1207@gmail.com>
 <f1062d1c-f39d-4c9e-9b50-f6ae0bcf27d5@linux.dev>
 <054ae4bf-37a8-4e4e-8631-dedded8f30f1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <054ae4bf-37a8-4e4e-8631-dedded8f30f1@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_084836_801957_EA1809A4 
X-CRM114-Status: UNSURE (   7.78  )
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

> 1. It's author's responsibility to read netdev CI output on Patchwork,
>    reviewers shouldn't copy its logs.

I somewhat disagree with that. We want the author to of already run
all the static analysers before they post code. We don't want the
mailing list abused as a CI system.

So rather than pointing out a specific problem, it can be better to
say that static analysers XZY is not happy with this patch, please run
it and fix the issues it reports.

	Andrew

