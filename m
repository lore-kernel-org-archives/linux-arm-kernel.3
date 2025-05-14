Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A482CC3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 21:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LymtCL8q0wRLYA9Oqi89Yhj+qqgH6V3m3EvonFhSdBU=; b=LbHMrwUE3ErfRBgTquNfc6TJpR
	nlDd0gJSS5MiIQ3/U4S6SUJZBoBG9LO0jNqLMTWUTnTaaw9qZYa0Rkcu3XTvazxrDstxDUI4b+nGG
	kuL7NlZp94buUKWRmSb7+13ZsVhfhIMXf5JGKgSamxXWuAE57g07/FoAh0ucCu/Nczgl7S3ZgxpkZ
	RT0R/rC2l2zyVa9c5ZMB3u9Sdl26YWdYhv81ZOd3SgGz9MCpM4FHN+cRPodjegf4EUflv08iNLi96
	dfb7lz63Tm5FacsXpkZaO4LDfbZZwO4mAmhIELBdIJ9aIVjpPCRFwQmSvPy9f96bTtc5FgPIT8TB3
	gRFe6cMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFJVL-0000000GMas-1Tux;
	Wed, 14 May 2025 21:19:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFJTK-0000000GMQ1-3Nr6;
	Wed, 14 May 2025 21:17:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 04D1C629E4;
	Wed, 14 May 2025 21:17:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9DDC4CEE3;
	Wed, 14 May 2025 21:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747257420;
	bh=XqD9mQcmolD6PXXgJ20Lz/AYkecGTq+N8Hzsb17sSuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N8XT4RXFeMXxkFHhN3G5e7D+3lR2DVv7JoPlyoJ0CDr/gZSQsN4veiaikN/aQXCUk
	 R5PdppjlHSo0+Tn10FEYSUrcIZugSoP+ge/6AUju3208V4eJlxt8c4pdXJhblvvnPB
	 A5CV6eTdz14sxq+tHjMSI6CK/rk1dKpdiW3g4PFECTlpX37rn53iU7mqRb+pLWpA1K
	 giJr4dPDJpL6JU7f3CUuByPCGFzhII/CYeL7t+VQ5oT4tFgZSkWIcVw9lLzpRs3Ko7
	 ekXrit+GrBtevtHy8Sllrbow88oCXVQHubtKMH3fSznRWXXDMeg+FvxWco6vEcvGRV
	 C2INWW2po70pg==
Date: Wed, 14 May 2025 16:16:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	DENG Qingfang <dqfext@gmail.com>, Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	linux-kernel@vger.kernel.org,
	Landen Chao <Landen.Chao@mediatek.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Frank Wunderlich <frank-w@public-files.de>,
	linux-mediatek@lists.infradead.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v1 02/14] dt-bindings: net: dsa: mediatek,mt7530: add
 dsa-port definition for mt7988
Message-ID: <174725741810.3051350.2895104132991545164.robh@kernel.org>
References: <20250511141942.10284-1-linux@fw-web.de>
 <20250511141942.10284-3-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511141942.10284-3-linux@fw-web.de>
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


On Sun, 11 May 2025 16:19:18 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add own dsa-port binding for SoC with internal switch where only phy-mode
> 'internal' is valid.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  .../bindings/net/dsa/mediatek,mt7530.yaml          | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


