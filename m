Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A84C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 20:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xqnba+FbPAocdt55zbJKS0eNdDJg5wBnEFRj1M+gDYA=; b=q83xpss/qMPN4HQY7faws0LkgI
	fp2l78oKoF7nBnUx6XU4Zo6lS7mVpty5Sgdn4dXR3DF/PF+KDXfjFHYO8vsT83miybyDdxjTHu0re
	H0d9I4VwfHo6URxGDJLJCQWbarfpVN6tFw81yDtAf2yIrGUGtZcs6aAJDwz43i61pXvtHEUWq4hrV
	nMQDQUS762DJ2Uzjfl9oFKfaehxM0OIMvHBmNKQ5Hh8Lkr30Y9HN/A1GTM5NG5WW7FaCda7X9n6fe
	2XRYNXSO1jihs2n5EGvAvYngQazmJiBjrHs7w+HcnB7B5Hl4JWZCoPXdOBUJQ0rezO4IbZcCNPe9r
	nkqbl7gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmfDU-0000000F7Qa-1a7h;
	Mon, 24 Feb 2025 20:38:16 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmf9f-0000000F6h6-2L9I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 20:34:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EDE616112C;
	Mon, 24 Feb 2025 20:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71810C4CED6;
	Mon, 24 Feb 2025 20:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740429258;
	bh=Dz1zijiLC2wKcMtXQyblBiBq7f6O6T+gxysG03w1iWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RV1Cbumd8WV24tBKgQ5qqJ8TiYzFAliX+O20CmNduxhAJakvOuDpScQfCFfPnLE75
	 0NsM+C90r2KyfKW8KyHOR/Xc7FgYWgYw9QMYRVsmh3DMZL05qWmYqMp7FcX9GY/xPu
	 +cbykTKspAKorz8aB4Y4zyF04hyVn6sQSw+LHFnk1UVYTtMJKkm1+pFbI1fVP6JKLN
	 iTDk0LUgEFxBXZVXdocEYsQEhM8ZmHkZ3+M/VT87q6hzEeJK4eZmyFP4ZEY4psp90t
	 SnMkZTXbOWYdQiI8IO4W7sYK1DcpamtMcu2eguZsEKzdWdVHvqASvuJTIltEEAx0Yj
	 nYUhMzZxfrPOw==
Date: Mon, 24 Feb 2025 14:34:16 -0600
From: Rob Herring <robh@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>, Liu Ying <victor.liu@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 04/14] dt-bindings: vendor-prefixes: add GOcontroll
Message-ID: <20250224203416.GA4048823-robh@kernel.org>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
 <20250224-initial_display-v1-4-5ccbbf613543@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224-initial_display-v1-4-5ccbbf613543@gocontroll.com>
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

On Mon, Feb 24, 2025 at 02:50:54PM +0100, Maud Spierings wrote:
> GOcontroll produces embedded linux systems and IO modules to use in
> these sytems, add its a prefix.

s/sytems/systems/
s/ a / /


> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

