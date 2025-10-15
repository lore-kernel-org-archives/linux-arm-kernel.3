Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF16BCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 16:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4ZMHbMoFb9si/A9769lQGBOD/7c3ZzHe/wqHs4wxRE=; b=tSyknJZFFlwBihMnlevZi4K0xR
	fzWUmN1LZQulZZGQe7RBowKjVsRTFIIJ0JAVCV7gd1mxEzuRFqV++tXFSZqSCxujTURjF7lHJaTju
	SmG2OMcyzGH59pWe7vbJ9QiOXs5Zgw+qniG/E3JsZbzk21IAkoKnkXr+wSyzB8dZHUs/wiVkDJO+h
	IPJR8k4WymWMzv9v0ubK+T/EDigqOEhiQkchIH/ctUrhyYobxQIi78dcO5fQ4FZg8NHdmDw8aWSIb
	cEjeZOJR5CLovvGXrgP5MHLPhMbjgctvJgNie8LBDO6zxl2+wiRhv8mc0kHAnXk3bbnIEYQ/ML0bE
	jX3Xmk0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v941F-00000002DLD-2PSl;
	Wed, 15 Oct 2025 16:06:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v941E-00000002DKx-3gw8;
	Wed, 15 Oct 2025 16:06:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4CA4A6268F;
	Wed, 15 Oct 2025 16:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF48C4CEF8;
	Wed, 15 Oct 2025 16:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760544388;
	bh=36wvgkxUgybT9jKiuwNVYIkH5W5KCOcXkZLMXlDzl+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qrUZlyqlHM+ceh+6TbjjLe8o7OLqVAsL1FLCSLbF79Kuk14YlGoiQfpSa3zJMk7z9
	 mdduyflt2UDbyEqRo0MrsLBp9L2hAT2VBL/h8AlyxpwZQS+zVyKnD5AbSVsmWaPYoT
	 poF7qz0b5wqzlBscxlHiDdlOvmjRmQeTjqseyfCPYP4DbeOkdY5reImgLzrhIamJPE
	 kFBu/xvyaReOKMbm+mTZLILCmYjiXQKD/sFBGQtTi/+ubbVstuBFOJFx/u2rLN453B
	 WNyRA9U+eS4zaAxjB044Ra8hztNvlUAMToj6VOERb0pahcp5X6HfMIcmciojKsRJak
	 0AQLPs0E3BwNA==
Date: Wed, 15 Oct 2025 17:06:23 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 02/12] net: airoha: ppe: Dynamically allocate
 foe_check_time array in airoha_ppe struct
Message-ID: <aO_Gf4sYHi6BoKCr@horms.kernel.org>
References: <20251015-an7583-eth-support-v1-0-064855f05923@kernel.org>
 <20251015-an7583-eth-support-v1-2-064855f05923@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-an7583-eth-support-v1-2-064855f05923@kernel.org>
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

On Wed, Oct 15, 2025 at 09:15:02AM +0200, Lorenzo Bianconi wrote:
> This is a preliminary patch to properly enable PPE support for AN7583
> SoC.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


