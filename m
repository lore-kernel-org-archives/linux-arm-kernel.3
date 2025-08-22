Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C55BCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3pEDtGn+7gZi8FOI+t5NNyX+51dGnpiTQ5cjQ8BcDv8=; b=ydb5ufGDAnTuKbPh9F7FE2Cygk
	KRpWVLLp8SjlavAI8ks7/y8JAeuFgoIci+RbdV5nJEVnM7MOlV/xztgdvixC7YRmTGE6Kr9Dn7bjA
	UYX6Ki3nCdOOKof6VJVokyCV5K/+bTuIxw0yH6TZ7maRt3Ps39qzpfo5iqgfjums6Xw6TDWsC9cT+
	+wb++7rU6QuHX1OBaLsPVA2qEZHtEDq7OM9yxN+ZQlkVgLJme1Ws2OpCeg95OjqqfHObpE3J5Ypl3
	KhmX+0ddzu44td6n2LG+qksFUYYDyaid6kuhSYJbBf3am7CyUmTKTDQsKb0FRVBybCsEW672/l1Ej
	t9wbQqWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphnn-000000041pr-0w0z;
	Sat, 23 Aug 2025 06:32:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upT3y-00000002t0v-1Fqu;
	Fri, 22 Aug 2025 14:48:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF42D4461D;
	Fri, 22 Aug 2025 14:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87789C4CEED;
	Fri, 22 Aug 2025 14:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755874097;
	bh=n4JvEFi7K9Gnd4LcwTA0bUtIPMP+X5TsCejUHnwhR34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BgQ4QtKN0Hrlp+tukqXWm1mhlAR7cmdX5V73Oyrmx/LUNmbGl7mcWKEc8K0JS3PnU
	 cZsf1QxRdJYiqT/ljbvr2pdN3lqlaBFwrmaXY9/OTYKDRaFBEdkm4ee6gxhixeeX3Y
	 SbwaSRu6YR6PW3QOwwIcYj+KxYEYIRorQUlLaTQ6f7ycze9l1TJ9fTVgauCJF6SrLR
	 0kpHfu5WZqx4qRoy2M7MnF6/fC8KBVd7adWJ05/3hqBP4BhXQBTsHdseuAcO8dbQhs
	 F5aNMKlX91su9yhj4W+inDZWQhuaIbLsWKeu6rBkRVK3GFyFhOzoxotW3hqt0BRZcM
	 hud/qTNt6vaEQ==
Date: Fri, 22 Aug 2025 09:48:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Simona Vetter <simona@ffwll.ch>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>, devicetree@vger.kernel.org,
	Arnaud Vrac <avrac@freebox.fr>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	David Airlie <airlied@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>, Robert Foss <rfoss@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, Jonas Karlman <jonas@kwiboo.se>,
	Conor Dooley <conor+dt@kernel.org>,
	Pierre-Hugues Husson <phhusson@freebox.fr>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: ingenic,jz4780-hdmi: Add
 missing clock-names
Message-ID: <175587409204.3789906.17191769934979803832.robh@kernel.org>
References: <20250820-dt-bindings-display-v2-0-91e2ccba3d4e@linaro.org>
 <20250820-dt-bindings-display-v2-1-91e2ccba3d4e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-dt-bindings-display-v2-1-91e2ccba3d4e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_074818_356686_0CCB58FB 
X-CRM114-Status: UNSURE (   9.55  )
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


On Wed, 20 Aug 2025 16:17:36 +0200, Krzysztof Kozlowski wrote:
> The binding references synopsys,dw-hdmi.yaml schema which defines both
> 'clocks' and 'clock-names' with variable length, therefore we need here
> also same constraint for 'clock-names' as for 'clocks'.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml        | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks!


