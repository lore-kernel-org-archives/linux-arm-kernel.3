Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AD9CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 08:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCcyB5LFRmVcSIROxmyKJG5EejU8FPAzcsI/5iDjdGU=; b=bP2MRyAIDyAnejNGAOBYBq3fID
	LwDBYGSvO/F7GnUPSDPI19yvtO28FAcTNZpxcMzh6akGXAY3+q17Z0qd4pOVKebhLisDYbRAyw8Mg
	29ce8FqrIA8M0k+0qYQ4LKVZ9dFejDL3W7+wYs1IKmaK6ei6Qc1bQcHLM4Ow1PXGwvuyF0BDulP8v
	ZK6pqW/0ifQGOQtkUkvgW+xaA8sYJkI8UQ3CrHQTlinVMwkC/Hd3jGOTsfCVlPUmBVM+vdN67rYpi
	RqBviBbkHyifuAiJBFzk745D98jLolwP2d4sSt+McoFAeF85BLPZcKqwSq2BZ4r+L2vChhaV70aq3
	tem+f0pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyfr-000000076rj-3Man;
	Thu, 21 May 2026 08:22:35 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyfo-000000076qF-3X1c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 08:22:34 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-490229aa522so23986685e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 01:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779351751; x=1779956551; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iCcyB5LFRmVcSIROxmyKJG5EejU8FPAzcsI/5iDjdGU=;
        b=izR40d9KzMgIqWJ3JanY+dhXe3sWVxB8+NHznKaQpj2mbG50XLM9OSL26LdHFS6k5M
         tKVrH55eaeMMH0GGy5bLENIkqJzGQZLq7x1bdez2ZjhEoMYO9OGWPq1wkuYAouZaplzl
         4D/7zgB8Kn+qHTSkSngopUVyWHkOulq9mBCj9G1WZ/y6QoFq8ekHbMa067nF4+YL44yD
         ChNMXBDBuLbS70e2Vr0R89HUGrv4cRN9ia3RhGo0BiX4SfQh29eA6o9xYtlni8Kr4O/Y
         xq2wgYLyAJ4nY8p7KbwI7lTtfA5+sFke9LdmhOEHvnv6AblOprzWvQFrHoPINvoAcG/u
         U8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779351751; x=1779956551;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iCcyB5LFRmVcSIROxmyKJG5EejU8FPAzcsI/5iDjdGU=;
        b=F8XW1jKLWfbJWWSM2hyPoK8eiviA1+kZlTE3aeO04CizrbLEkOStL8NVfFddkQYOiL
         qnLIZkUEhzYsUkk3qgZObR8ma3p+w0fd3HIQBZg0nwDfxf1UalGo6bMuMsI9mxHCXMpt
         /Pyd3LmaB+VDRhPPEE2seo+3ymbSfm1KyI5whl/fF+6UfGxjgsK4SiPIiGkmb2pRvvhe
         Z2LEFx3AhlHNGB8qViB6/1/qrQrtLcsP83u0K0TdRe5aAO9mEdr5WzpBsWt8q4euux1q
         00zuwJJglL0Qd+ezat8IAQCsOeFEpIIagVMOau2rqLkvRc7dc3X7+XkQdAMCzAwpPcnm
         6bEQ==
X-Forwarded-Encrypted: i=1; AFNElJ9zTzI3f1Kdgy3Xa241FGjRZCBhXVuC8iuTQECRKgDEn2poJ6OsGUE0Pa/hWRKaCCuLg3WBGKsxJdRIYMKb9aTT@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5166w3qvgk7/LxqXhDnOBaDnd6Ge/mZgKMjE2O+jxr4wFsAIN
	s5/3PTyDay3iDHCEUBKIc8bOW7rQABGD0gX+udvt7DEk6K8ts/O2PbEf
X-Gm-Gg: Acq92OF6VpwZGXX38/4Vprq0At3NJHvDjs983b4W0n98wkystihkfBKIMQjWPJhJknR
	D+PLrtkRMFAU5n+UPyGEOOfnz/H0uy8mjnXKHNcbgn+0uryAFF37/U8Ph3yT9X4HSnaQrQPfbPX
	psSyuw01vZDtjKV1k7ez9AJZ2pLNy1NsLSUP9m72PHv+bXvY5Zar6qiP73EmeDx+WRxv9BlucXp
	eOSgyJuzZQ4bFggjSP82W4NoYc2llSYEPDKJ/r/pSK6RG+ANeT90HzMCC3jh7+YI7toe3SRByrO
	DPEPqkM0QpqIinxI3Mmr7rBfCEo8KmaRSjqcvJHxyyKt0GmNLO9ZslQ9FS1oKmivZhLU3Dd0W8f
	Ah7mSq6bpM19larda9NpOSxJWqBHEYltOxl9yR795M+Fy7VhLkhGHPOYQGnMCHKdxN4R/ydSfhj
	l6nTmDkocs25nc17+TYz9mYKkQMUObYqALyjD5gHv8LIYXnYOPtW2n8BB/6SkYQa1SaaqRht7O
X-Received: by 2002:a05:600c:858c:b0:490:778:4fec with SMTP id 5b1f17b1804b1-490360f28f7mr17896195e9.33.1779351750348;
        Thu, 21 May 2026 01:22:30 -0700 (PDT)
Received: from Ansuel-XPS. (host-79-22-5-99.retail.telecomitalia.it. [79.22.5.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm9490145e9.14.2026.05.21.01.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:22:29 -0700 (PDT)
Message-ID: <6a0ec0c5.16c38fd9.2b754a.4dc3@mx.google.com>
X-Google-Original-Message-ID: <ag7Aww1CbIvhnItD@Ansuel-XPS.>
Date: Thu, 21 May 2026 10:22:27 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v8 2/5] dt-bindings: phy: Add documentation for Airoha
 AN7581 USB PHY
References: <20260520150912.11614-1-ansuelsmth@gmail.com>
 <20260520150912.11614-3-ansuelsmth@gmail.com>
 <20260521-ambrosial-abiding-lyrebird-9dc86f@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521-ambrosial-abiding-lyrebird-9dc86f@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_012232_899692_365821D0 
X-CRM114-Status: GOOD (  22.59  )
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

On Thu, May 21, 2026 at 09:44:16AM +0200, Krzysztof Kozlowski wrote:
> On Wed, May 20, 2026 at 05:09:07PM +0200, Christian Marangi wrote:
> > Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
> > for the USB controller.
> > 
> > Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> > always supported. The USB 3.0 mode is optional and depends on the Serdes
> > mode currently configured on the system for the relevant USB port.
> > 
> > To correctly calibrate, the USB 2.0 port require correct value in
> > "airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
> > selecting one of the 4 monitor clock for calibration (internal clock not
> > exposed to the system) but each port have only one of the 4 actually
> > connected in HW hence the correct value needs to be specified in DT
> > based on board and the physical port. Normally it's monitor clock 1 for
> > USB1 and monitor clock 2 for USB2.
> > 
> > To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
> > property is required with the phandle pointing to the correct Serdes port
> > provided by the SCU node.
> 
> 
> ^^^ here - required but:
>

I think I have to rephrase it. It's required if the USB3 is used/wanted. In
the other case for the USB2 phy is not needed.

I will bettet describe this in commit description and on the phys property
description.
 
> > +  phys:
> > +    items:
> > +      - description: phandle to Serdes PHY
> > +
> > +  '#phy-cells':
> > +    description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
> > +      as defined in dt-bindings/phy/phy.h.
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - airoha,usb2-monitor-clk-sel
> 
> 'phys' is not required? I think you need it to configure the serdes
> correctly, no?
> 
> > +  - '#phy-cells'
> > +
> > +additionalProperties: false
> 
> Best regards,
> Krzysztof
> 

-- 
	Ansuel

