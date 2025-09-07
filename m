Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB1CCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 09:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+OoHx1KZAfeh6/rLeHYhB77BvXa2PC3bwAFxBVLXr0=; b=kH7VNAd0OUxoLRuojOzgII4/uU
	ypfffl+hj1lWxjaca6kK9cqH6aEE6pdQBYPgQ02Zl8AClpZ5vqwE15yX7ztXey+HgwQSu7tEoHN8F
	CTIwVv4NTllLnurxfcOu4uasraBuHrZEJ14YOBeEvYAGk0pVmvyx1qxhsp+JOeA0JI2Ya9RSbCRCx
	InufB4pWC3+xHAhylV8mG6RQng/39otkjUiKdlyT+n+q0zit5CK/giyYqzWW36+4AE5IVTxjZ9Wr7
	9gzzElFug6Y05dxrmgbDHDWbUI1yk5GL1tCRi59CPQkKQQV46FEVXF9mUcQ07BRbDZ3fZZkb2nxml
	fnc79K3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvC55-0000000AWSZ-3cAn;
	Sun, 07 Sep 2025 09:53:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvBxf-0000000AU7j-0LFB;
	Sun, 07 Sep 2025 09:45:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7CC71601F6;
	Sun,  7 Sep 2025 09:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FE08C4CEF0;
	Sun,  7 Sep 2025 09:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757238326;
	bh=Wj1dGLxR4qgsTZ0aZBldBZFaPGiNLGjozuSVRrz3bP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S3AL4c9PHdg6Qii9YNc10lqtSsTHGRv9Qh51rLh2bXdntVpsumkK0cF/JYkj9SGSW
	 rnb9xA4t2Sf9NolQlYvbOBhfl8HHB2m+N73yWXxmXbvOTsOIJXE2dDfgv94YkLP9bx
	 naah1RuzOQEK6cpwV13Bt6yUG3ru8LiIDXKAHf50TgJ2MDwZ3lfu7SFXhapgvvIuEs
	 Qo6nfN4Et7v5XXcAqT7+vCTx/RBqd8IbBHzs6uDHRvzdIfjw7yLYOibnV/D26ue1ku
	 qU+6H1crWor1wPug98flICsKczSjibNsPBAKBiUpNDnvOz3RsGKKjY+WqARkmhAnFi
	 9dpx61eOemTRQ==
Date: Sun, 7 Sep 2025 11:45:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Ran Wang <ran.wang_1@nxp.com>, Peter Chen <peter.chen@nxp.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 01/22] dt-bindings: usb: Add Apple dwc3
Message-ID: <20250907-benevolent-dogfish-from-wonderland-be2eac@kuoka>
References: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
 <20250906-atcphy-6-17-v2-1-52c348623ef6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250906-atcphy-6-17-v2-1-52c348623ef6@kernel.org>
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

On Sat, Sep 06, 2025 at 03:43:14PM +0000, Sven Peter wrote:
> Apple Silicon uses Synopsys DesignWare dwc3 based USB controllers for
> their Type-C ports.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


