Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D65C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 17:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rpVzYJiD4uvUrnHrs1i+rq74dWRX/dxoOQRnlJsTbJc=; b=l0B1rCe5ntsd1ljVwUDDRf5D4x
	gg36iuSrXieSSQbrKT0daAb3rXcdoOVmh2XPQVYz7YHOwmInsl7is0K871erHD29+rGI+6lMmczr6
	Eh/39FzdxmeN1snnZ9yyNzURS9M6qVuqkk3L/OC1SSZlY8K6kmcWJQsEGsifpP9brV2WM3xUUNHGN
	DrM58TSrpph31VKZn0skdF8GJ9G0EfO8PtcVK4Cc88Xhcnq6EcI3MkaJD5ehi4sp9pJ5xGyqHADC+
	by9mtyWkoZpSav9NPts0lTDhGdxZlXbLH9YRq/mzUjx1NnB7Kc6MCGObZmrgWQ8i3u+iOCJ6Ayl7I
	cxgj7Mzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wecce-000000000Bj-48kv;
	Tue, 30 Jun 2026 17:51:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weccb-000000000Bb-2eXw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 17:51:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 593B5600BB;
	Tue, 30 Jun 2026 17:51:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAFF11F000E9;
	Tue, 30 Jun 2026 17:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782841904;
	bh=rpVzYJiD4uvUrnHrs1i+rq74dWRX/dxoOQRnlJsTbJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HJCQ722MxU+MHC23BSrdoiEHDRw9Ql9TrNC02wM9iluQIfFS2pL7HTm4DMoIfgXor
	 sZPsO5fe+UCnhgLboo8vr0TxYlvWoSm+8RdtT2FaMnWx7JPw0TX2lNogNtAM5ZteTw
	 1kPr6vuoJgOVYliMJqn+WxyV5po2NSC7PUY1wPojHU/iIW2U9UbFEofK+nGj/7RIjd
	 3DSwICjJtI0nh+5j6ehuYBM+m0cJZgkyxCrI7fDAXrV/x7GCwCEd9pXhsyxB0HIQJu
	 iSdfJvxZ1SPFEXVsbW8oYXCvLLbzRKpZuZq4gN4PrBGSb4ybV8zVkVSfUroRrLgIN0
	 CwPpm9MKm8V3Q==
Date: Tue, 30 Jun 2026 12:51:43 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: yc_hsieh@aspeedtech.com, Corey Minyard <corey@minyard.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	openipmi-developer@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH 3/4] dt-bindings: ipmi: Add optional LPC properties to
 ASPEED BT devices
Message-ID: <20260630175143.GA4129206-robh@kernel.org>
References: <20260629-aspeed-bt-bmc-multichannel-v1-0-fc23ee337f7a@aspeedtech.com>
 <20260629-aspeed-bt-bmc-multichannel-v1-3-fc23ee337f7a@aspeedtech.com>
 <35a8e3b3-7725-4d1b-8667-84e6fa24b2ca@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35a8e3b3-7725-4d1b-8667-84e6fa24b2ca@kernel.org>
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

On Tue, Jun 30, 2026 at 08:11:34AM +0200, Krzysztof Kozlowski wrote:
> On 29/06/2026 08:49, Yu-Che Hsieh via B4 Relay wrote:
> > From: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
> > 
> > Allocating IO and IRQ resources to LPC devices is in-theory an operation
> > 
> > for the host, however ASPEED systems describe these resources through
> > 
> > BMC-internal configuration, as already supported by the ASPEED KCS BMC
> 
> What
> 
> is
> 
> with
> 
> this
> 
> line breaks?

I've seen Codex do this... It amazes me how hard it is to get it to 
write properly formatted commit messages and then not forget how to 
write them.

Rob

