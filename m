Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3424BC982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 18:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcGY65hS+6BY3CDr/NBRDjfgtOdWVX7qh93GVRRkDmU=; b=d+McFtmrwwAxwBP483M1HmLhyN
	8L4JIqtu7g9KgwFhkE7XDri3IFYSdq36rqbpnEwxdL8AjhVQ93xMaGA2JWBRh9L9HFdGcRfyAvIij
	kyQAIaOGhZvSjJ9fUr3UjFPQowMjYLFoIXWbtCyc8cgbaT4HpOohIzZdX42BAplaauLo45e2zrpn5
	PGtE61ewXPiFt7UpqVf50SqUL6QcImw5lM5Fmwj7gnlg6TIPoJna3jNDHFQTgNa2jowJC9YJITyQf
	MzQMmUssapeaQN/vduPcM49igRo8XUOqvktZGHqw9cHRRLdT+nyahqPEyn89LHi/asJGNA5hhwxCO
	RPwiDvXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ix5-000000039R2-3yU3;
	Mon, 21 Sep 2026 18:41:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ix2-000000039Qb-2ZxM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 18:41:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 112C360008;
	Mon, 21 Sep 2026 18:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ACB31F000FF;
	Mon, 21 Sep 2026 18:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790016075;
	bh=qcGY65hS+6BY3CDr/NBRDjfgtOdWVX7qh93GVRRkDmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QU+QQFzwL2DzW81MiDQ21qaNETIZnN3LdiRsJ9XVYMQ7ujd4MhD0UDWdWcIIllIp+
	 7J7eoTHRSPfDu5xKz1fo2PeUb+bFLiy5f6THkYrua7NOgEyAmX5icuMeJSpnDq8xrx
	 g2dKUDtLRsLfZ636SdjsD14KqUGI8U94YjrUDnA84LvwyX34YE9rc7wVXlKADGS+U+
	 WP8I2nzLRlBKMPmfC1uBt5A5Y6BOPNK1+jRpoUtOte0hmYLMtPVgUIhyWtlHoqD9wI
	 d2hr+5yIE6JABNsXeD85oNbR7RgK+EO1J8ffhVIgNtm6hIN9CuATryz6k8WZ7v5zsu
	 lRHXe2SRtaaOA==
Date: Mon, 21 Sep 2026 13:41:13 -0500
From: Rob Herring <robh@kernel.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	John Stultz <john.stultz@linaro.org>,
	Moritz Fischer <moritz.fischer@ettus.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Andre Draszik <andre.draszik@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, mfd@lists.linux.dev,
	Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v25 05/10] dt-bindings: arm: Document reboot mode magic
Message-ID: <20260921184113.GA1250850-robh@kernel.org>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-5-4aaf5c09b5c2@oss.qualcomm.com>
 <20260918220634.GA2441717-robh@kernel.org>
 <0e6877df-0306-474f-bc25-aa7d3fd2f53c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e6877df-0306-474f-bc25-aa7d3fd2f53c@oss.qualcomm.com>
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

On Mon, Sep 21, 2026 at 03:59:22PM +0530, Shivendra Pratap wrote:
> 
> 
> On 9/19/2026 3:36 AM, Rob Herring wrote:
> > > +            minimum: 0x80000000
> > > +          - description:
> > > +              arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
> > > +            $ref: /schemas/types.yaml#/definitions/uint32
> > Drop. Types are per property, not per item.
> 
> Ack.
> 
> > > +          - description: arg3 (cookie_lo in 3-cell form)
> > > +            $ref: /schemas/types.yaml#/definitions/uint32
> > Drop.
> 
> something like this?
> 
>   items:
>     - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
>       minimum: 0x80000000
>     - description: arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
>     - description: arg3 (cookie_lo in 3-cell form)

Yes.

Rob

