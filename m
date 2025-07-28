Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF048C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 15:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qb7Rwwje7f3Tdy9vNZPriJ2y9oCcAGKpXNcg++VGf/E=; b=OSgQ6aKgXZPyBIcwFm+nZi3iMJ
	jEBiyOFK31+nf8UEn49c9CcEMGtbEFooIJ8hFmwhmNMeihgXF48XXujQrRFTDQXHiLqTP6KAeh+Ew
	SY+gw5PqbZlNFNmM1APg/6b4pRlJ6V08nqUs4yeqdhnS/p+CI0x142t8KmO6kjCri5BUW3GGmeCvm
	kJ9slzi523Pa3C35h+EfrcW8+wYW6vODgeJXYfddGY6R77bFEfZydOfkSJOQKSAB/HGmD6lDlik+l
	Ebzo8Tjd83ZufEBCCq/ZQkV3YQGOeetDQWHdfEpP0oMS7+k/sZN6OMTYmsgSR78NhSHdkPyVnYqfo
	kgJWDBeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugPti-0000000Eq96-3OQq;
	Mon, 28 Jul 2025 15:36:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugPmX-0000000EodL-3E2z;
	Mon, 28 Jul 2025 15:28:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C1AE448EC;
	Mon, 28 Jul 2025 15:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C01CEC4CEE7;
	Mon, 28 Jul 2025 15:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753716533;
	bh=lPiDGpZFpdH6itgC3rcfg1u0DDgdbAG7h3QwQTSxGz4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EmflJWGrgqbhGLWqVxqvw4Yq4qHbm+pgRuCev4GyeV1j2aAeS3HB94b6/1EGL4mIf
	 idZBrQtkA2SmHyKpO0xqzOndDVDewjc6byd+VyxNgF8b0+Etz0Ee62AnwveT+RgrQV
	 ywyTuzLoupa5h7V+5rvRd36XDA4YItPeALYBxlQF+x1P1T4weIm84/HMtU9kEpx8TX
	 WbD3UBTPLEYcf+lwWG0ro2jXtozr+K4eVCOZLDRmDf2KCbjj9iDGQveL2z95d/Ag1N
	 nJWkzVdosnzwEA839eeqx2paRzs8SuGcb5KJcpE/8jC7RNoXHegSUncLdUyHxQIyv6
	 SGrC0eVSBOI+w==
Date: Mon, 28 Jul 2025 08:28:52 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Simon Horman
 <horms@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v6 0/7] net: airoha: Introduce NPU callbacks
 for wlan offloading
Message-ID: <20250728082852.158f6829@kernel.org>
In-Reply-To: <20250727-airoha-en7581-wlan-offlaod-v6-0-6afad96ac176@kernel.org>
References: <20250727-airoha-en7581-wlan-offlaod-v6-0-6afad96ac176@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_082853_829527_D5973F08 
X-CRM114-Status: UNSURE (   9.67  )
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

On Sun, 27 Jul 2025 16:40:45 +0200 Lorenzo Bianconi wrote:
> Similar to wired traffic, EN7581 SoC allows to offload traffic to/from
> the MT76 wireless NIC configuring the NPU module via the Netfilter
> flowtable. This series introduces the necessary NPU callback used by
> the MT7996 driver in order to enable the offloading.
> MT76 support has been posted as RFC in [0] in order to show how the
> APIs are consumed.

## Form letter - net-next-closed

We have already submitted our pull request with net-next material for v6.17,
and therefore net-next is closed for new drivers, features, code refactoring
and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after Aug 11th.

RFC patches sent for review only are obviously welcome at any time.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer
pv-bot: closed

