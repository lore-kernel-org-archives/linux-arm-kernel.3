Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C2FC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 22:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXVviPivkWWCcMSckTlSTpID4xmMzWDL7GNMi8mgsK8=; b=v82j9E+myEFzoKz2PpF+xN+Oam
	vBQJV6jPlfpGpE7/nzBacvPl0K93VXtHyrNHT4VbdNjsy3P8wyJ90DGAzNml2CTEukOFWQSxTuwJZ
	74XGo24ezyaqsPOKdW06T0Y54Pb4/suk8wRNGY+3q14lKL/ehAdLXG+oFIxKgLf/0lLqF+m6cbyeD
	hV5G/XnATBa62KUJoOWnyQ0J6E4wQa8j4TzDpC2VDb7FBrEerHwBjbWo4L1O4PoMN7EH0etRCz3cr
	rHA7LGNnqKY5zgRzOQd2kjGCVHqp1zwAWZ7KTXGKBG/EKPf7QMAnWR4xk9fnb6F59L12lFSnDRm9I
	UDkoLuDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlbLU-00000006zle-2XnO;
	Fri, 21 Feb 2025 22:18:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlbK1-00000006zZr-447N;
	Fri, 21 Feb 2025 22:16:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A9EB2613B8;
	Fri, 21 Feb 2025 22:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58419C4CED6;
	Fri, 21 Feb 2025 22:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740176197;
	bh=23PN250gtc7EcFv1DIBV80PwXFQEG45j2Rg1PLeXuq0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GzwEr5aMCzrciGtwb1ZhEyOJW8Db+TpHE036ckNqvDi9H1lVL6vDRf6pqa9UEE37m
	 OPzt5/umJO+ot5TlXX1nDWFf43eeeB/G02zxCgq4vMyq1WKEqpr+7Jhqq7V46NkVEY
	 KySEk8nBdoW6NIG9nBocwv2pQ9wWrrZga5U1N1KwPJ4GZOi31suM0a72d/Z04FUkbV
	 3l1TqotCQZBOiQ7YaUfzBVdFsZ0tLCUnV/CinbmCJpaBEcSLpbK0nO0rQCLz4qwg9X
	 3oKLMiYLkx5r9arVd2Pr5yECHzifgptkL1y2yAl6N5JMxeBbpvluCtcQl5evzlc0ie
	 5kTpQB8b1Sc0g==
Date: Fri, 21 Feb 2025 14:16:35 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Felix Fietkau <nbd@nbd.name>, Sean Wang
 <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Chester A. Unal" <chester.a.unal@arinc9.com>,
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 upstream@airoha.com
Subject: Re: [PATCH net-next v6 12/15] net: airoha: Introduce Airoha NPU
 support
Message-ID: <20250221141635.4d01e792@kernel.org>
In-Reply-To: <20250221-airoha-en7581-flowtable-offload-v6-12-d593af0e9487@kernel.org>
References: <20250221-airoha-en7581-flowtable-offload-v6-0-d593af0e9487@kernel.org>
	<20250221-airoha-en7581-flowtable-offload-v6-12-d593af0e9487@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 21 Feb 2025 11:28:13 +0100 Lorenzo Bianconi wrote:
> +	addr = kzalloc(size, GFP_ATOMIC);
> +	if (!addr)
> +		return -ENOMEM;
> +
> +	memcpy(addr, p, size);

coccicheck says:

drivers/net/ethernet/airoha/airoha_npu.c:128:8-15: WARNING opportunity for kmemdup
-- 
pw-bot: cr

