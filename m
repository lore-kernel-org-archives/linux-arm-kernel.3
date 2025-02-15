Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC130C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 14:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=onf7Wxohqu80LWZK95MTF0O8vIf8lFZdnGGloyOzfkk=; b=W3GtVingXH/otvpQyMiOUERQSA
	116ZFVMUhfzbrgcVxd+1usMf11ND6mKKSVHg2skExxLX9N73rDEOwz7xEPLgyGaaitaadh8ysdyq+
	0jERoVpae2EqKxReWNK0oi5yh+ylHFcw8CjXzvcc5g175RlSAlJ1mg5+9jFG10cVLESmr1bXnILZP
	BQQu0oIuWj96/ZwbvBf2R/Jn8sLVnGczjdXjGVrt4J6itSoWqOQb0mvqDaTAXzAwteTaWmsRjPAIr
	+q7RhP4JbO49XywgbBgiT3beTh2VxHSK9N1nEDp0s+ZHgQ96DnjtEDTXFlcdygZMK4YQ2RD5amCUr
	0BH85RFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjIkj-00000000Bwu-3KuL;
	Sat, 15 Feb 2025 14:02:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjIjH-00000000BpT-2Hs3;
	Sat, 15 Feb 2025 14:01:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 08023A40410;
	Sat, 15 Feb 2025 13:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 822DEC4CEDF;
	Sat, 15 Feb 2025 14:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739628069;
	bh=3KZjQFG9kWj7eD82rZJTbZ9FPBolNJSFaZ87/g22y1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mdkeIjoaX5Cb1zuFkBFKRC5hh5M29XZV6OoodO/ZlM3RWcOllZD4faWThxIxKAilu
	 /iuMlnTsVOmvaUlKMWzMz5ioNFJOXsiMMall0OHQ5poQv5AalO30eE62ksKJNLys9m
	 avuff3LzCUsjxCRVh/t92j1yyH3H7FvPdXrKUOKmWJxLUey6VcZNnyDE1WeRjBfOt1
	 AAyWl08v6RedA0ScYvadnEDN2CwZ1fjFeeB+ivrxUOi3LQvWGLreBwFsweGGPCKke1
	 LDUWOLGA7xmCvobdxxd+EikL5WJC7hNXcHgTv8xCmhg8BHfFCEsi2cvputIOqUNCB7
	 SwzWhYoCaaffA==
Date: Sat, 15 Feb 2025 14:01:04 +0000
From: Simon Horman <horms@kernel.org>
To: Eric Woudstra <ericwouds@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 net-next] net: ethernet: mtk_ppe_offload: Allow QinQ
Message-ID: <20250215140104.GO1615191@kernel.org>
References: <20250209110936.241487-1-ericwouds@gmail.com>
 <20250211165127.3282acb0@kernel.org>
 <fe6509ab-c186-47c1-b004-4e17a875c5c7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe6509ab-c186-47c1-b004-4e17a875c5c7@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_060111_650472_D74A40D0 
X-CRM114-Status: GOOD (  17.96  )
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

On Wed, Feb 12, 2025 at 08:33:52PM +0100, Eric Woudstra wrote:
> 
> 
> On 2/12/25 1:51 AM, Jakub Kicinski wrote:
> > On Sun,  9 Feb 2025 12:09:36 +0100 Eric Woudstra wrote:
> >> This patch adds QinQ support to mtk_flow_offload_replace().
> >>
> >> Only PPPoE-in-Q (as before) and Q-in-Q are allowed. A combination
> >> of PPPoE and Q-in-Q is not allowed.
> > 
> > AFAIU the standard asks for outer tag in Q-in-Q to be ETH_P_8021AD,
> > but you still check:
> > 
> >> 			    act->vlan.proto != htons(ETH_P_8021Q))
> >> 				return -EOPNOTSUPP;
> > 
> > If this is a HW limitation I think you should document that more
> > clearly in the commit message. If you can fix it, I think you should..
> 
> It will be the first case. mtk_foe_entry_set_vlan() is limited to using
> only 1 fixed protocol. I'll drop the reviewed-by, amend the commit
> message and send v4.

I agree with Jakub's comment regarding the spec, and his suggested actions.
But, FWIIW, I also think that situations such as this are not uncommon in
the wild.


