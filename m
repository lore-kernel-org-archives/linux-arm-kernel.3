Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C53CC5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 08:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uPCZE5UQS1reSBivMfqpeYb6NJuDBFdvhISL7AQJN6Y=; b=a6RmvsuYs0cAA3ci32Jnum1Sw/
	hvOrgmHR7n5/o23/nYgwZPSVrvMowjrNMS3z/HpbeJOdOj0t6bwbqypfcWP8acP7T/tXSyHE13T/Q
	H0ZjFwP2dWmQ3J76c0PdlHFXNDGtmu3tVYLqZDoQyd2ooKf1//ti2jrIhVFVPuvpVofM6ZsMnnEb9
	8bISETVn4laiEycf14zLASdqa3THi3XJIb2c+ffO39ib8EFO3q46CflEoRd923U9bCckwLeOsC4fc
	mijC/4CZdxTiV87lZ5g+HJr5tbhQhPOsw61LXS/J9N7QmvAf6wCn7XDp0r3QwrzoEqvKsl7ee7RLa
	HiY/TPmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwF39-00000007Vsa-42J6;
	Tue, 18 Aug 2026 08:19:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwF39-00000007VsR-00rw;
	Tue, 18 Aug 2026 08:19:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5864C4359D;
	Tue, 18 Aug 2026 08:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F251F000E9;
	Tue, 18 Aug 2026 08:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787041168;
	bh=uPCZE5UQS1reSBivMfqpeYb6NJuDBFdvhISL7AQJN6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sjl47PwTF/cLPjJlGU93edPoLyfmJ14vkTClpNmoHwdkcZuQ6EvIx49piTlQaxT1A
	 DRuEapnf9CTV15na0Dss8mLDfrzUDlzPzyoX8wBERTUD/3NRsWSDfjNalDLvGPaDR2
	 PKO/2Icgi0K9kT34lJnP+DkoLjmV6OhpUq3T5ol0q7QzDDxw9oRhYi6T4wi3QTZNh/
	 6uTIm9+lUTLa//UozQURz3I6dNWs0b5yBE4i0/ifJDFXu3SM4S8NJNX5iU3JNK5xij
	 KDsp+2Hh90aDjHKp+GPwmzK6ZdPEKuPMPH5QMJdshzpxesAHroAl/79DRZ8YoyoOaw
	 0ZELrQngIEf2Q==
Date: Tue, 18 Aug 2026 10:19:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-usb@vger.kernel.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Francois Choleau <francois.choleau@st.com>, 
	Christian Bruel <christian.bruel@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev <pankaj.dev@st.com>, 
	Rahul Kumar <rahul.kumar05@st.com>, Rob Herring <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 8/9] arm64: dts: st: Add USB nodes on stm32mp231
Message-ID: <20260818-brawny-ultramarine-jaguarundi-e314c3@quoll>
References: <20260816213849.1044073-1-marex@nabladev.com>
 <20260816213849.1044073-9-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260816213849.1044073-9-marex@nabladev.com>
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

On Sun, Aug 16, 2026 at 11:37:10PM +0200, Marek Vasut wrote:
>  
>  		bsec: efuse@44000000 {
> @@ -1062,9 +1119,31 @@ exti1: interrupt-controller@44220000 {
>  		};
>  
>  		syscfg: syscon@44230000 {
> -			compatible = "st,stm32mp23-syscfg", "syscon";
> +			compatible = "st,stm32mp23-syscfg", "syscon", "simple-mfd";

Obviously fails dtbs_check. Use tools, not humans, for this.

Best regards,
Krzysztof


