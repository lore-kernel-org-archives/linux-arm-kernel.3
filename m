Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774B3C83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 09:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNfQTV7B3oSxpshS66kWT9Q7EFeqRmmFv5pnApUcJw0=; b=VzDWpAHnWCB+L2tnhAtgdEE48c
	rWUljOtvSB/Jcoco1mDkPcgGia0CDUCXGol7r41/7uSanBAiuZmvfAwEMb3VDRFR3IGsgbBgdF/8x
	sZBo5+AUwRFBZjR7atfDZe9dDnF2+XBObRovvDaLEBm6zjTJSEigQAnydk16j08RnIRvZ+AbidjbC
	Fxg5os7gBbIAqLyu6Y+BWgpKYq34vqJU7EeNfaqw2jLmrYJU2SuqZyNMMA+tMe8Cy8QdQP+NGPJRY
	eXTN44BqX2htLRCitVcCYXkxwdzE5yd81Sic9ih2OoNV0TFLX4Qb2swPJHT98hcj1892s9MPfspad
	9bJ2HX3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRYY-00000008CGj-1ioE;
	Wed, 09 Jul 2025 09:57:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPVT-00000007qiM-0t21
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 07:46:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6EA6E433A4;
	Wed,  9 Jul 2025 07:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B652AC4CEF1;
	Wed,  9 Jul 2025 07:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752047178;
	bh=Wwooc6QvI3kYRhEkAEkhHkOtrspGXOlhQ25M+ckDh6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q39oaTT7JgmUspVLiFLnfUlaaB++PVEVePT5m2vVkkxes5HC4AjSnH30DyNAhn+F+
	 KF8uoSwT2ve62Rwl7HPcULJmMQM9Y0y6MSw0EAWE1aa3/XyApqvQNlaoe7Fsgqj6W0
	 hllNHbLHaSD229VQ5LW+5Maxddp4pAOpmIzWUHGqE5tMm8mZCtwxriCwRmVOrulx1e
	 P5MZJOpDla8VM5U4qfeJtbH6mCob0YljtHCKLLVbLQ3qIKd/z/O0FvGH4Gx/PtI707
	 gaNqzHnTMNEbBom9LXZJH8c5JlnD69aVb0mYhl3SFWPRpRtKv9GRABXpv4l9AoaWAK
	 V/TGZSWy/x12g==
Date: Wed, 9 Jul 2025 09:46:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, horms@kernel.org, 
	jacob.e.keller@intel.com, u.kleine-koenig@baylibre.com, hkallweit1@gmail.com, 
	BMC-SW@aspeedtech.com
Subject: Re: [net-next v4 1/4] dt-bindings: net: ftgmac100: Add resets
 property
Message-ID: <20250709-simple-blue-chinchilla-164051@krzk-bin>
References: <20250709070809.2560688-1-jacky_chou@aspeedtech.com>
 <20250709070809.2560688-2-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250709070809.2560688-2-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_004620_552732_C4C76AA8 
X-CRM114-Status: UNSURE (   9.20  )
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

On Wed, Jul 09, 2025 at 03:08:06PM +0800, Jacky Chou wrote:
> In Aspeed AST2600 design, the MAC internal delay on MAC register cannot
> fully reset the RMII interfaces, it may cause the RMII incompletely.
> Therefore, we need to add resets property to do SoC-level reset line to
> reset the whole MAC function that includes ftgmac, RGMII and RMII.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  .../bindings/net/faraday,ftgmac100.yaml       | 21 ++++++++++++++++---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


