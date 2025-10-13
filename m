Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB22CCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 14:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/0I4Gz31qHQ3E4TALYeDQRCDADMqJRa6g6F6Sm8prs=; b=QrVOoPYkUmoLqI/fx6xXFOTSaD
	i6zMCDdtsSxVQKvSAqLu6V1Q8aVQSC8vJncD0lDcRYR86CiVu3hE4kkNOvd/G1VVEz//RwHShIzVV
	jt2fJ9XUZwOP++LvTQer0TDtflDS0NvT84EWu5YrXhHpiLninT9gJw6Q17OKviG7qYXZZpC/YrU17
	ODhbElhhbNY4fVo1gKnqlW7J3X+1vVQGTjPjeZJk/bMTzGKECr1KN2a6xHsA66AT6Cx6VkCE08nik
	UsXQhwYQB50kguHcR4K7yA8hvVVzgm+zqNbvhkBNVPdH17ZqiEhP0SEj35FZgmGfcg1Q/UkdHbgcu
	Eibpgv/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Jpq-0000000DUKJ-0zuf;
	Mon, 13 Oct 2025 14:47:38 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Jpn-0000000DUJ8-2NvH;
	Mon, 13 Oct 2025 14:47:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=h/0I4Gz31qHQ3E4TALYeDQRCDADMqJRa6g6F6Sm8prs=; b=DYMaXNjlsbANWTv0AE3/heGvlF
	rGXQ8kVxIbg7/0mh53pcGzAFidCW0DW3NOU1h+vJh8yCWpKDfW1TCEOgjF22yw+gWvlUHxIuYuKRz
	9svkkzJmRxCtpC6NNhl7lKYvNjIDXlhuLryE2vulm7nqbndRY/KLstzV21Gcup9Ua4fA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v8Jpe-00AnRB-S6; Mon, 13 Oct 2025 16:47:26 +0200
Date: Mon, 13 Oct 2025 16:47:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: airoha: Add get_link ethtool callback
Message-ID: <79e75adf-6cbd-4ec6-9473-591fbdf4248c@lunn.ch>
References: <20251013-airoha-ethtool-improvements-v1-0-fdd1c6fc9be1@kernel.org>
 <20251013-airoha-ethtool-improvements-v1-2-fdd1c6fc9be1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-airoha-ethtool-improvements-v1-2-fdd1c6fc9be1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_074735_603220_C6CCE3BF 
X-CRM114-Status: UNSURE (   5.70  )
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

On Mon, Oct 13, 2025 at 04:29:42PM +0200, Lorenzo Bianconi wrote:
> Set get_link ethtool callback to ethtool_op_get_link routine.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

