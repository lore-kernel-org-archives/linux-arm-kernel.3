Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3198BC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 17:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VDeTpQ4QaePlaHR+35lToDv+5wtBgSaX0308LTxujqs=; b=l2e3gU4E5qnE4znA79ihviWufa
	vkhwQDs/dt7zc9NMc/p6dnb7CoY+J0/XBoUw5YkhfIEzRRe3570ocF/O0gXFMTBm3N7S3scj0yBBz
	FGv0nH0SHJQTVJ+Jt7qXFI2dtAjIV/Gvo8LpeuP5HnghMI7Cmk6SNNzDkcMtMl/JeKZ31jZC5qMjO
	VmrSxIO5GE2VUT6rCWsIgHILVn6KlANbkljOscHEp+atjjHN5JzBkjKP82wGE4mTmZFm9LVlp2yJI
	nmLuX30wOKNSXf5W81xLTZM9z88LJ5z9QLq7PHp1Uz+NmrCe/t33YvjW3mzDEoh7lZW2+uHXx51Tv
	29hBW6Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwfM-0000000As0h-1TPh;
	Wed, 18 Jun 2025 17:33:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvl8-0000000AjzL-2THF;
	Wed, 18 Jun 2025 16:35:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B6EF3A52440;
	Wed, 18 Jun 2025 16:35:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EAB9C4CEE7;
	Wed, 18 Jun 2025 16:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750264533;
	bh=TxFe6c1htu78AlW8pSUBk042YOu73xddSRufqG/XuNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WS+err14mKEvX/jOQ7z+Q/9qJWhYAW+QCzvtnLbtokjl7vebb6NXqf6S0Qy309PZt
	 /7XQ8RnBI5uBdAOy0iloelLIeCQSgiilX75/R0/IMwb1jt62+bJErtxLp3cfaZe/h9
	 WCVvqs3WhaEyR7LYHfbhnh7Xm2m+VHZp2lK4DPry5O+s/pwPpTZz1htzJvuzTH1quh
	 IlIn6AIcuntaqt3eULW4nzdW4L/Z7Y4l8pwSd2Cusg/wvMSZoOBg0vieFjgLaVJfxl
	 nsGWGokJDh4OF+HESnd335gCIaql6LQQB6Ac1OB16nhKHj8L6Ee/Tnvi/cbrv0YU+9
	 nukvYHw9U8Ahw==
Date: Wed, 18 Jun 2025 17:35:29 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v3 2/2] net: airoha: Differentiate hwfd buffer size
 for QDMA0 and QDMA1
Message-ID: <20250618163529.GS1699@horms.kernel.org>
References: <20250618-airoha-hw-num-desc-v3-0-18a6487cd75e@kernel.org>
 <20250618-airoha-hw-num-desc-v3-2-18a6487cd75e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618-airoha-hw-num-desc-v3-2-18a6487cd75e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_093534_691833_1AAD5A6F 
X-CRM114-Status: UNSURE (   9.29  )
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

On Wed, Jun 18, 2025 at 09:48:05AM +0200, Lorenzo Bianconi wrote:
> In oreder to reduce the required hwfd buffers queue size for QDMA1,

nit: order

> differentiate hwfd buffer size for QDMA0 and QDMA1 and use 2KB for QDMA0
> and 1KB for QDMA1.

I think this patch description could benefit from explaining the why.

> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Code changes look good to me.

...

