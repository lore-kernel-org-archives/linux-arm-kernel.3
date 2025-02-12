Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6020C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 00:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCwfyYi1ERCLYwWL3nEBTwQUfcF/iNsggpwmlENg3KQ=; b=WuJQc8dEL149vVp5OqRctJtbRF
	39nwTeSyozl2qYfnzVaDte1lnPyfOFK+kWCr4l9ILGjqCYVG7usxMISRQ3eRcWVJbjal5ewXXLcXw
	SEQBQDerKnESTLNeie7/Sx2UAKZEASTf+tdL3oQUj1OODYrEgDJKhqp1n2igQhq5uRAdCRtL41I3L
	0nspZSkQeaS0hvnzcGqIEv4LlnXi30w3JDJA6KhVd3kV81MLcw3wieOvAXuUzuZIa7XzzlmFcYSYR
	7Tf2DcyT0UtWciTII5gIIIBdw4KR2hHJZWqicFtVdFUI1kJ/Qz3LYNaVN+XurElSMT0GoiVOXEH5R
	Yn54le5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti156-00000005mSV-1pC7;
	Wed, 12 Feb 2025 00:58:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti0yP-00000005lC4-2oAp;
	Wed, 12 Feb 2025 00:51:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 973EF5C5919;
	Wed, 12 Feb 2025 00:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27CB6C4CEDD;
	Wed, 12 Feb 2025 00:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739321488;
	bh=VeoIbDzVqmui1/kOCFxZmx+bZMjORYTB/ZUjr6uj000=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JUB7Aohh8OSwM4X4zNkrv438iwEU1mi2ELXa0huB/spNm8QxIkJp3gKXh0SGbCK8h
	 2MHgJtvccSGNKvEdwMdeJHa9UBflrJt7K1rorXUNEe+y0wWJQ7CO0s6ZAurel3SV2V
	 SqG7/ik9FaPMIpafcWwSrHmiNamvEOotmY3eF5EVTOHRXpamxVfz6JvY/CiRvAEtW+
	 6SEHhXuKpAmIpaHuk+WAxeFU0rkXGmCv77SX3z5sCOz49r5+YZ7FQoQjI02KHgQ2Gi
	 uQ41LPAefhAU/j+M69sGd40dgFI0BjkARyN126PM0Lxp5Oij3ZQaOCk+Lo7CC+Yhz1
	 i2i1c16fgfoVA==
Date: Tue, 11 Feb 2025 16:51:27 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Eric Woudstra <ericwouds@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "Frank Wunderlich"
 <frank-w@public-files.de>, Daniel Golle <daniel@makrotopia.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 net-next] net: ethernet: mtk_ppe_offload: Allow QinQ
Message-ID: <20250211165127.3282acb0@kernel.org>
In-Reply-To: <20250209110936.241487-1-ericwouds@gmail.com>
References: <20250209110936.241487-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_165129_759081_082DCADF 
X-CRM114-Status: UNSURE (   9.70  )
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

On Sun,  9 Feb 2025 12:09:36 +0100 Eric Woudstra wrote:
> This patch adds QinQ support to mtk_flow_offload_replace().
> 
> Only PPPoE-in-Q (as before) and Q-in-Q are allowed. A combination
> of PPPoE and Q-in-Q is not allowed.

AFAIU the standard asks for outer tag in Q-in-Q to be ETH_P_8021AD,
but you still check:

> 			    act->vlan.proto != htons(ETH_P_8021Q))
> 				return -EOPNOTSUPP;

If this is a HW limitation I think you should document that more
clearly in the commit message. If you can fix it, I think you should..
-- 
pw-bot: cr

