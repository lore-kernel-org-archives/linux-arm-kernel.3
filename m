Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E75C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 20:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PvFMufsCpm5w0/A74ukxIpIFr7N/PeNgt8iDsS5iuN4=; b=vAHHFBfj5IvP3ZWs5JSzatNnGM
	ctI4idJW8cd5TjvGvWU77wcH4ngejyaahGliOzXHYQMV8fqBvCCyN/SftwiWBc/WfJmcpMUdvCSOu
	Dntrtk3eWkNeuUo+KOVTFfboNMB4LwNKYawB6qQwbJhRWpEhpjaVu9cBOmakvX8pddF2jbWzYMzI+
	OuhTR8r3RncD/KkL4pTpcaAG34Mq8gg5bHscThKHCowfQHj+r/6G0X+q5hpkSHFIyxAw9+YUK95NT
	cbR2y7yDUbZbOfzEilMrcA9jghyvY0jro6Z7k9rzNzAxhQKaYclcq4fCPgZLJ58DsfJbQpQo/ST/q
	3+VY9Axg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSi8W-0000000GVXN-2ste;
	Fri, 20 Jun 2025 20:14:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSi6D-0000000GVSi-2909;
	Fri, 20 Jun 2025 20:12:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3C9425C6913;
	Fri, 20 Jun 2025 20:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27238C4CEE3;
	Fri, 20 Jun 2025 20:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750450352;
	bh=YYSRaHlyrbAaccJjfWsT2+6At5/W7em9BngvMnpBJ7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qsGqfWUBMxMbTb06I0yd5YGUxXNtIqY9C2qg9XBKc0LFsUBYSLoOZ3Edes/2KQfkW
	 vEe7G/RNEy3Izz7DzbdSWjv1k3kKZXO2EztDEvNAEA7odHtl5DES3cCNV3kZsOV3fX
	 0Bp92mmvwpdDScPjVqplz58xvHba3974/MMnECQSh3SNiIOmOh8r/HY2DZaJewleg/
	 M4kpJClZ2Qib3cnbZ6nhC+B7qTjySx46eT0XG0UvUYVlBgR+VHqZ5UDfSlhV0n3ndl
	 P7dMAKWYXSzgOyZn7nkffk2BtyMMyUbT4axml4XWX9jHbc6Oa5LrWHdlAUgLNoWG+z
	 +79zW+MBAyRCQ==
Date: Fri, 20 Jun 2025 21:12:26 +0100
From: Simon Horman <horms@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>, arinc.unal@arinc9.com
Subject: Re: [net-next v6 1/4] net: ethernet: mtk_eth_soc: support named IRQs
Message-ID: <20250620201226.GF9190@horms.kernel.org>
References: <20250619132125.78368-1-linux@fw-web.de>
 <20250619132125.78368-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619132125.78368-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_131233_588120_FB0F2608 
X-CRM114-Status: UNSURE (   8.46  )
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

On Thu, Jun 19, 2025 at 03:21:21PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add named interrupts and keep index based fallback for existing
> devicetrees.
> 
> Currently only rx and tx IRQs are defined to be used with mt7988, but
> later extended with RSS/LRO support.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: Simon Horman <horms@kernel.org>


