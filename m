Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D18C44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 19:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3YDyivCac2qwNApiX3s+EtwOjLvvZwzcM7r8yH4SCHI=; b=X7j7TmAvJQwr/cNShWLbshqeOf
	Xbqh2QKvrel16tUBeBktMvxFq0l7xcmQZvAAYoNG3dBV5sJ5SeRVBWd0uxRc3gtwb2yf2jx8V9rbN
	6//cNGPDInK5aijR0XlhQSSVGhergb3/nvpFNwrpNostmANZV8Bet6AKQ0eeNEsBTkoBsHmy4Hmro
	N/ynzkw5m5FANoIq1DzepEAx2PYVckuGYdDDC0FsJd/l42estGeJav6doB4UTwZjc/ldGuCqRj8OQ
	WE5DLAzg1+QYPRm1X2Cz8Tj9i+2YQVt9BpcCU5cH9Lb5BaqcshSTdAUBGz36+YbvjVgXLt24zBiz3
	OXJqFeGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfju2-00000007ofr-16Kk;
	Fri, 03 Jul 2026 19:50:22 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjtz-00000007oew-3LTz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 19:50:20 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-80bb578d58bso7049197b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 12:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783108219; x=1783713019; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3YDyivCac2qwNApiX3s+EtwOjLvvZwzcM7r8yH4SCHI=;
        b=WaGIZghRYtTYxR/lmZi1w1ncg4mdrNLJolZCRxbwC7ppHKASv+gYur4pjVvtjz5tYI
         fWYTrODS0HXsgVkogBI5qS1lpryPZT8Azoa6SkRC6Nw5W3bkE+J0nnkri583OWjYSV4v
         9aZyXd1iltQRcEE2KIpZIYhMVfPVq/81B6w4juZtxLtuoJtXhDjbq9QRBMRAnxRAtKT3
         YMEe2poSFBpThAzuLSrhJftQT+pPzvvOBhYq1xLnUVkwRykbJ6lMhT21kfzrtJhb2/5z
         btYNbpFHokRLyLMVs7XhsRc5zpxk477zYveKbCIvnnL/Em1LzP91YL32BSkjruU6+o1c
         Ui5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108219; x=1783713019;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3YDyivCac2qwNApiX3s+EtwOjLvvZwzcM7r8yH4SCHI=;
        b=KytV4pWAqr5dPTjtgJSqPQ6J4jfTULKrK9vDT+e9ATt3Hjz9YvGlS7iFuYy31Zk+hQ
         doqn2QKNliOxoqXUBNluqiV8zOQpeG4QDDmawMU5A7gOSb2/5eQejE4RyyT5/iwraQy1
         +75/oApoJlvt2qW6DXfREZ7lLcMqPMwa5RX5KauPgpdfgBtePNL7Mt0HcFftYh/4S0zo
         CcxaWyE7j0Ay3EMC9d+oLw2KyP/HI48XIH+KJZdqZCELDfwS/wlqO3GyjyFxj/YkakFU
         shkJzcpsOM6PNu/A/T9PoRjqvEwHTnqyHZ+9aPtzuIxT2Fb0ue0GbEb8ayccHFAIMD39
         SZUA==
X-Forwarded-Encrypted: i=1; AHgh+Ro80uvrfiYK4qyA6Ta6GqUNh4aFQxiSE+uKNRSgXy2jg1mIgug67jaCC6rtIf82rfvgk866cM+Bt/fNB57oQNq4@lists.infradead.org
X-Gm-Message-State: AOJu0YzdZCir1U1CaDn8DsZCK9VTQsJZIunx7T5v7y07Psg2lOFhRCOs
	EbebHTb+36sjDZooH65NMXU8uxmhPuCsr8nrQDtgdMT5MtK672hauTwm
X-Gm-Gg: AfdE7clk5miqKsUf3d/Pt2JhB5fG/Z+nJEQ92lby6Cy//quJ4iANS6CAEWkJcehWrNe
	djFykRuQSmFCYHepghbTqGjJ8bfLxmRiuTdQzY+RAOauDqJlT/FEGum1ulOuC3mTS9qOt0xZhdT
	eldT7GJKCu1QjEPxwnMMUCqWRrXRMKQpvu1yGI2XUJSaxf1aFKOff7LZZmh+1xTdZk3AoWSBaG/
	v0B0EgnIg2iCWxH7ARO5V1MhGZzR9T6bvNZZouT76OP8X0PVoUY2ow79TNEOfEuDYKwBgMnJxSg
	25kK63fQbecYgbBuzP1vStP7FGuKAIO+/Dr4EX/uEnvoft3lw+jOXO16rd8s2iykMpkYstfa5pR
	/bdrrEdBNJbMBYOHL/1E+m5vMbY7GbiF+yfHlqus4l6PomZDnHNRhrEqQLtzXuHtY4/AVHMOCJh
	OAxek7Rrma1TRMKuqYERbVwsk8XGCzgwW++Oc2sC2Zy11LS05XIg==
X-Received: by 2002:a05:690c:45c2:b0:80c:85b6:7650 with SMTP id 00721157ae682-8173abb42cemr6694927b3.69.1783108218436;
        Fri, 03 Jul 2026 12:50:18 -0700 (PDT)
Received: from suesslenovo ([24.176.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144b049939sm27500667b3.32.2026.07.03.12.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:50:18 -0700 (PDT)
Date: Fri, 3 Jul 2026 15:50:17 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 1/4] media: dt-bindings: allwinner,sun4i-a10-ir: add A523
 compatible
Message-ID: <akgR7N1LmqEmPSLy@suesslenovo>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
 <20260702214750.3428694-2-utilityemal77@gmail.com>
 <20260703-versed-locust-of-agility-d76fda@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-versed-locust-of-agility-d76fda@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_125019_843994_91B056CB 
X-CRM114-Status: GOOD (  25.17  )
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

On Fri, Jul 03, 2026 at 12:56:00PM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jul 02, 2026 at 05:47:47PM -0400, Justin Suess wrote:
> > The A523 (sun55i) contains a newer revision of the sunxi CIR receiver.
> > It is not backwards-compatible with the A31 programming model: the
> > control register has a pulse capture mode field (bits [7:6]) that
> > resets to a value which captures no pulses at all, and the sample
> > clock divider is now selectable via SPLCFG bits [1:0] instead of
> > being fixed at the old module clock / 64.
> > 
> > Since a kernel driving it as an A31 CIR receives nothing, add the
> > compatible as a standalone entry rather than under the
> > allwinner,sun6i-a31-ir fallback.
> > 
> > Signed-off-by: Justin Suess <utilityemal77@gmail.com>
> > ---
> >  .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml        | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
> > index 42dfe22ad5f1..06656058ce91 100644
> > --- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
> > +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
> > @@ -19,6 +19,7 @@ properties:
> >        - const: allwinner,sun4i-a10-ir
> >        - const: allwinner,sun5i-a13-ir
> >        - const: allwinner,sun6i-a31-ir
> > +      - const: allwinner,sun55i-a523-ir
> 
> I assume you are adding it in expected order that Allwinner is
> following, not just randomly at the end of any list.
>
I did it in product generation order, is that what is expected?
I know that the a523 series succeeded a31, so that's what I put for
ordering.
> Also, please change all above entries to one enum, can be the same
> commit.
> 
No problem, I'll do that for v2.  
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
>

