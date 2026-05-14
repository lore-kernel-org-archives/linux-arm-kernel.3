Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700B9CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 01:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CayHzfieHNXS71M+RtOpwdlI+OTMof3jJa44vM7ZcpM=; b=JpyL+7B9L+pz9E7sm91q1JTr24
	dZcg2HH3fQcJe2MSA1PPeskmfB2jR9M7Us6P2cQgATUZo1Vb9htH4U21ccD9eA4hWbGnOqgKOLHr3
	IaKL46Pom3NE6hKgprcw/dOLzj1QcHzllbxbVmB3jtM7D+maOF/w10VQcm8aNYgNUMUqRJEs3ZXJN
	H9n8M0V+6XTVp5cgTGRMyfIyqIN+UNyXOkbOkymKiAUu+BllJvuM9PxcfHf1RMJbDwro5A+aaetB+
	xvohj978s4YjH+tJ3ShGE3jnS8Et76IlZKd78U8+c7fJUODmdkIbPPtC4DV+y6R8usmMQMjFzRNCF
	clAqiTSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNLGy-00000004JVB-1GWz;
	Thu, 14 May 2026 01:54:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNLGv-00000004JUe-2fBw;
	Thu, 14 May 2026 01:53:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0199B4411F;
	Thu, 14 May 2026 01:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D38D0C19425;
	Thu, 14 May 2026 01:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778723636;
	bh=Q1VpBQM50Yn3gZ371kogckumiz1tEUSOReWT97QXvUE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Q3Ata02/VEERalLaUvFCj6TCjwaPOownTlkECTxQWB3C4NtbHWKTMnQ3gABen+7kA
	 yTprbbdgliGsfqb5MFiQpJ1umq9JhN0LxVTdse2WJxd+3hrOUDinrG1xl6t5s0boZS
	 ipI9/RadHXALChuJOgvmux9PfHu+ZAAvXgBLbsy/mpyk+sIuH8C0+fFjkEba1EJu9u
	 OMsy3pfJEPCbgD4iNEBaCxfYZ/wbYlpHPWEAFfYc3SQJQRa9fYUJ8hrIffizOiU2cn
	 0PWxTbPC0AScp7am/KaPy5dmWT5x1+R40eia7lE8FN8TZAm+KEyl89NF+GffJABT0K
	 l0t8sqHXT46TA==
Date: Wed, 13 May 2026 18:53:54 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, Frank Wunderlich
 <frank-w@public-files.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Mason Chang
 <mason-cw.chang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>
Subject: Re: [net-next v8 3/3] net: ethernet: mtk_eth_soc: Add LRO support
Message-ID: <20260513185354.31e97941@kernel.org>
In-Reply-To: <20260509190938.169290-4-linux@fw-web.de>
References: <20260509190938.169290-1-linux@fw-web.de>
	<20260509190938.169290-4-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_185357_696835_F45C5AE5 
X-CRM114-Status: UNSURE (   6.33  )
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

On Sat,  9 May 2026 21:09:32 +0200 Frank Wunderlich wrote:
> +			mtk_rx_irq_disable(eth, MTK_RX_DONE_INT(eth, MTK_HW_LRO_RING(eth, i)));
> +			napi_synchronize(&eth->rx_napi[MTK_HW_LRO_RING(eth, i)].napi);
> +			napi_disable(&eth->rx_napi[MTK_HW_LRO_RING(eth, i)].napi);

What purpose that napi_synchronize() serve?
Also we don't charge for temporary variables, maybe save that
MTK_HW_LRO_RING(eth, i) to make this slightly more readable.

