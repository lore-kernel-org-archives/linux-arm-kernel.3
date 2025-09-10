Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A89CCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 02:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Zq5bRXPASwFPnL5PIYe8E/njNrgmCfUJsprDEgNmIk=; b=s7lr+Q3yF497eeq8nOkzQwsBjV
	37o2bh3MjFlQnopO9LAd/+ThHrFkuR9kpFh7JSV1aUnAMNVSf5Z7LHPkNXV0VjDPl8MwoQ3S8WZ9U
	Apg0uYYhjB55pW1YycnD+9zoHfAYyN9fakox5oU0I3VxA3DtQ7374zRP7l28vRxH1VDVHd+OtH3bD
	SGb17eS2wOns32N9Q0RqaDAQVfW7yd0+N/6f8e1rVBdOrEGmHBLqY7C3iOs50hB4pxu+GImhFppT7
	x5F/C9VJS4aU4CaE8HGmj8nlgxeGIDQ1M5X7QubFZFJft4oMcnIu6UBTR6LygqJkeSx1fFY9tdFQq
	sWJU9Bcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAGI-0000000BbN8-0zkQ;
	Wed, 10 Sep 2025 02:08:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAGH-0000000BbMN-0cNH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 02:08:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8AF4360230;
	Wed, 10 Sep 2025 02:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F02FC4CEF4;
	Wed, 10 Sep 2025 02:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757470120;
	bh=oXLn8INDpdCoJrpkQGlJIpgFhY/DdHeBq7FxlLPN/QA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GITImNdl8yjBYTBk+yQX/0uVI7ltS4/7XTrkNfaxIJHXYKft1RXu9SwcEiy/Sy5bs
	 6bdVpM6Gwf1mjLTdS9K5NE+Pl3DXTqFkPbfYd/R8q3fgo815ac2nao1ORqBMwNhGqk
	 3dwdifNPSWhqoyBB6unLZ9lZyRslZOtg+2nqu+DKJqgRNTyMkHjgM2bGZEBNxdC5EX
	 7B4lT+XR/2wik9T6Wd+0XsIhMwuaQrVeDpewcB22N9NtIDUSCnIbZrXtJIotOauMI7
	 BaAxguReXGE32lMgS9CzrOu9nkoeXk+eP2fJqReOyu5th/roU2pO5hMyPxGJlBHxA5
	 kk5KMFM0JGx6w==
Date: Tue, 9 Sep 2025 21:08:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org,
	Valentin Caron <valentin.caron@foss.st.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/9] dt-bindings: pincfg-node: Add property
 "skew-delay-direction"
Message-ID: <175747011863.3632305.14159900534334210899.robh@kernel.org>
References: <20250905135547.934729-1-antonio.borneo@foss.st.com>
 <20250905135547.934729-3-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905135547.934729-3-antonio.borneo@foss.st.com>
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


On Fri, 05 Sep 2025 15:55:40 +0200, Antonio Borneo wrote:
> Add the property "skew-delay-direction" to specify on which pin's
> direction (either input, output or both) the value of the generic
> property 'skew-delay' applies.
> For backward compatibility, 'skew-delay' applies on both input and
> output directions when the new property is not present or has
> value '0'.
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  .../devicetree/bindings/pinctrl/pincfg-node.yaml    | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


