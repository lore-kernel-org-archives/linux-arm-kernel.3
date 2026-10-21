Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2F5606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 15:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VZjwBHmS;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AotBcnoi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5CRmc5lAViuSw2eMUXLr8sP6YVEevy9FEYxV4LYZv9k=; b=VZjwBHmSQIOPRjPvR6cxQN5Z0t
	VmxhYiHa6RRDYYEm1clcRuzbJ6U6TrpFxCEQqYewh4Pp1NOYLzjK9pl7WzlHa55Urt536l7GOCsQw
	kz4Y7TuNBafD7jq5oy8h5PqqdD3OVc6DDfggkvgyjEJ6y2CMaRaS/7GfBbebXZcFJtPXf3+lgwAKM
	V8o9TMyYV8//anbSMRyskxL52JD5o2NrcjXMKhnWYgnP0EzcVazxd3kGkDl78StFXD0ShOjuLsbPQ
	33XSunPkPIkd68r1U82lU4SdKxH32ymmt/7Moxim0bYHU+ZnKXDODk96YE1cmNajLxSpSdXVBrOKg
	yltccURw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYGh-0000000CGWl-0fAB;
	Wed, 21 Oct 2026 15:30:19 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYGe-0000000CGVo-0GZ9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 15:30:17 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso632148f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 08:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792596614; x=1793201414; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5CRmc5lAViuSw2eMUXLr8sP6YVEevy9FEYxV4LYZv9k=;
        b=AotBcnoiZO9QN7RCcpPq1bTeb8xEOXrAIkDBAdXRJktjQ3fLbZsARr7rc+Kxb7iYcV
         7MPWIpa4mKA8CitGa4Nsk5yWYx+d7fluvCiO8gwsxits/ALjdpVl7VabfKb6CU3q0v4K
         f2hueLasRE13+v1PyiT73fTSBvVuIkX9glWOury1Fajif8NvHAB4N7KtCmgY2t/bTOBG
         5BMkj2fKtF3y1qHsmd5zD29Q8C8XYXsexVczzPfA+5S24PY++SEO06pKh9tMo4JWUbMx
         CNvhUFLauyXzmlrpFgKS1X1KgoR09V7djrqU9xba9YEPU+T5f43Pg5RemeJshuxosMKM
         8EAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792596614; x=1793201414;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5CRmc5lAViuSw2eMUXLr8sP6YVEevy9FEYxV4LYZv9k=;
        b=yiiXGnJRejHMN4t2HNKgr/2Mx/HG/aq/Q6G49OkxP0HFv0z1kmcmTfh6ApXkcL5sR8
         pozd1MtZDmE4C6XaYDAer0UuOv3OBhUHkPqWuJ3OGrvUxRKaZBR5RSdzWKcv8kecTkRe
         Ext4mVD8Xsx4s41ViY7d0i2CQNrhyy0sZGelW8YdcwQUvFnnYCjVaLxP/6e4s+SLI0jH
         nWoC/+fhI5o14qdJPFKnDXjNw6DpQnX+aukQNieRaBAinhzZnfa8K11o0rA8rltbPN3+
         WywqDFqweMGLTWqvsZxjiqU/iRf9k3Nh/uvYTHgaIlhvmKHZ2EScS72m37WGqkoN7e/g
         T6uw==
X-Forwarded-Encrypted: i=1; AKwUvBwRJVMt3D7zAnO1p9fCUNRxSaSOi3G+y/nKmh9tFrgcTSh5rmy6QQddZo7C8EJB5JjvD49Ye+qv1NWIAKD+HXkm@lists.infradead.org
X-Gm-Message-State: AFq9FYJRTvZTAMpqxChAaS7ZTVLzfwcOJvioaqROQ/1Tk3ejNLHJkVOd
	nluDSlKGvDuIhf+2yAoDu25YEjXDplxjlDzbCX0x228Z7MQ3bmXG8vNa
X-Gm-Gg: AYBFou3vD1wysufha/vYG2yfBmDvmZ7u0mmX8dySOL5hs94NekK4pac3sdFBxQJKMhl
	+oVTVI4ONd7y6yY/8i3CJedXyr085zaqJFWVsfBPf/tOO6mRi0W9TO50lOil/XOxktj2483d0OD
	wWU4DX0K4x+k1fg7uNEMmTopb7EU/noOcDDauDsKr773M9OyGlgLQBc4DG7zqWU+N/ODcB5iv/S
	lpAFeIeRimxg0Saqzucxn6XQpdyIRqryIM/fI15N/n3Xu4geFWZyzG4/4u1WDH+SFbkUroVH6Y0
	Ms+QBTft5Qp6TZuHoASBNo9hysZ4X6g9hq5OxworH1/PhtqSObiuZTHbl2Yz01gVYm7qT37VSyK
	2fslAbRNYS/q72c7banF1/89soDZG6LlmVbM+BoseMldV6UM5xNZor4EoA0mQ012gKl1IkKhUTF
	CBBksz17UJETW4g4/QWprvz1BP54RB9tFrekMorCh/OUgE+TMhwDi98IesjM4UX8QXgpxSku3OJ
	20J3Ztizd/Paq5rmTw2RBPDY7lHMrwDRvZIxwERAKJ89d7ZctVuTRmpnEM8OhPSxFSEEVRs3us7
	JGU7yAcWcgIunF40K72shC2Jq2vIX6kp5V6LCBkU+SznRZomKkRBcg4=
X-Received: by 2002:a05:6000:1623:b0:48c:4553:790b with SMTP id ffacd0b85a97d-48e264e4b62mr3988627f8f.48.1792596613403;
        Wed, 21 Oct 2026 08:30:13 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258358c1sm6370102f8f.43.2026.10.21.08.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:30:12 -0700 (PDT)
Date: Wed, 21 Oct 2026 17:30:11 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: connector: Add Toradex camera
 connector
Message-ID: <6uiccieqybi7rmdpf2bjgfppjdgpzt6sollr2y7ygex4ofssbh@anwfmi6qbyxp>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
 <20261001-verdin-imx8mp-hmp-camera-ready-v2-3-7d1343ecd3ec@toradex.com>
 <20261002-prepaid-retired-3d2c9cbc035e@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-prepaid-retired-3d2c9cbc035e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_083016_116361_993B0059 
X-CRM114-Status: GOOD (  13.97  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 02, 2026 at 06:05:24PM +0100, Conor Dooley wrote:
> On Thu, Oct 01, 2026 at 01:44:11PM +0200, Ernest Van Hoecke wrote:
> > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > [...]
> > +  "#gpio-cells":
> > +    const: 2
> > +
> > +  gpio-map:
> > +    minItems: 1
> > +    maxItems: 4
> > +
> > +  gpio-map-mask:
> > +    items:
> > +      - const: 0xffffffff
> > +      - const: 0
> > +
> > +  gpio-map-pass-thru:
> > +    items:
> > +      - const: 0
> > +      - const: 0xffffffff
> 
> These seem incredibly wide for something with only 4 gpios?
> 
> Thanks,
> Conor.
> 

Hi Conor,

Thanks for the chat at ELC and clarifying what was said here on the
list.

Regarding these masks and their width, they are indeed wide but they
determine what to match against, and we have no reason to match anything
except the exact number.

This was previously shortly discussed here, and clarified by Rob:
https://lore.kernel.org/all/20260918192012.GA1465432-robh@kernel.org/

I'll be sending a v3 of this with only the camera patches soon.

Kind regards,
Ernest


