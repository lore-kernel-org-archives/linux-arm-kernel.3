Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A79C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 09:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lm6ot2bmZKY4yplCPn3FScSqX5mEiwAZVgVtm575nD8=; b=U3VA3V+53kL9xuoVLBvSOP0kze
	nURuqsQ29mCFyo3z29MxVKYuG8iYh25wErsRBy+sxr0aCOTECPPruzM0omnwoVIBn+461YiWW1m9H
	9SKickFGg/7XwY1tRoREbjKIdljSviYEx3466sRVB0m2ErFBcyuXS4xrtsR2/8Rx0gL9lTqz4HYHh
	HGmrtuXiIxRBxgst7+FBfYBpZ44mgVfp27Om0pG3DNiUJB5NnpXZKFU0g1SUQ/V48tlXOdiJSxjVG
	Bdi3oS+KuDILtjHcDV9auUz3ohSDdLmtoBxlg7zPypKa8XEGWxqDgScwqxdE5uYH1PK60dBs4uYTl
	hNfyXzFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgBs-0000000BmVS-3spx;
	Wed, 19 Feb 2025 09:16:24 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfjY-0000000BcuN-2fDC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 08:47:09 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2fc3fa00323so8365310a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 00:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739954828; x=1740559628; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lm6ot2bmZKY4yplCPn3FScSqX5mEiwAZVgVtm575nD8=;
        b=QkQoXUWKRsze6vpsHDIhFBd8F1Oo9i1f5piTW1CfBwFVEVlqFJYlDtIt167YkDZ04q
         tin5bskM7Tae3nXcbrKrtyoBSv4VBOZwSyz6Gux01N9i9Z+Zde35iiyFxIFQQlbhIWVz
         KpsW8AQcvNC392w5AlcJJHnbVkVc/1j6LQY3gX1wH+xXV+EY+kd6nNKA67p8MuytUvaL
         3L71VpiQ6w3WzurTFbK0e6hm6/FBnHSzXTBqBFytS9QA7L2c8hMOT6V6Gr8b3CrkYh16
         q3I/QpVxg9lHEg9jz/KJaQ4yzTLKYxSWyJLZdDbSVxEhMm6RgRp1ySt3ID2I0QU9MzQo
         vZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739954828; x=1740559628;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lm6ot2bmZKY4yplCPn3FScSqX5mEiwAZVgVtm575nD8=;
        b=EAIgZjnZrKIgG/JSbR3UrpDzODISeIs64Oem5xmMzzTnW+aNW0zXq/Axl1sevGFpAN
         J5A3RSekprfeOraDYSb7G1H631StOBkjio66WTBj34k33GtokDzgy5XTDC5/1Pmmf/s0
         fJmaqUQKG9XrVC+wNWUPXVTtUEWMCihsLLqdj0WjWsQxBCeA/fI5n5X/2x4bfvWIocjk
         OyGiEXilhW0GKkhg3Pw6Q7ThiMUDl2a5kWh1tSTh0l0r4gMR1NcQpCOwG3/8NRCCAPol
         L3qI7rwqSCFz1lVeMt7lOx1VZgOVf35r5/fAMUiCPFe7/mnljHcjuc/ayhtuBCAJKWgR
         dSRA==
X-Forwarded-Encrypted: i=1; AJvYcCUoGTt6bNNvUhJEgr8DiucvkJMqMq7rRuLa76KxFsi3Gxpn32RkSwFxN2N9qbYvbSJGmx88SeBn7ZgxB7N7LsXa@lists.infradead.org
X-Gm-Message-State: AOJu0YxQpWcJgqiRv/UrgWz0ScT8jClQ6e3tOlmgPuhGsIoAdgb7YGhi
	exCexemkejJ5Clovtrf+fHpYic3rdJu1Nt0keXX+iPP9BjBTLqtNVgAi3QjGn1O/Ik7Aqump4NH
	8GglkF8cw9a1iyWymxXDRRhkXcXc=
X-Gm-Gg: ASbGncuUF+FWo/yXEXGpYY6/W3pjPymPzzeyq+0jVCOnQ5HuS/93eOZuiCPvsH14rdD
	5flTmYQY7c2mjHX2yW9Kr1Frt/Se6DhteomBzZX0ednhS+Tgj4a+RMEm1+vZNQ6xcax3sqtqh38
	UQJD+0M3iX01dWee37++oRnF1MHu5VHBk=
X-Google-Smtp-Source: AGHT+IG+metsRNLMCZZs47flBptl1mN2HTXJMmlH3rhFkejJqD6kI7GKh4odcp79LiYNjAbxr0qV1WFbSYqoQepjiGU=
X-Received: by 2002:a17:90a:ea17:b0:2fa:d95:4501 with SMTP id
 98e67ed59e1d1-2fc40f21c67mr30436208a91.18.1739954827668; Wed, 19 Feb 2025
 00:47:07 -0800 (PST)
MIME-Version: 1.0
References: <20250218085712.66690-1-daniel.baluta@nxp.com> <20250218085712.66690-6-daniel.baluta@nxp.com>
 <50c7055a676fb7f1bf27cb33a914df641c56dd15.camel@pengutronix.de>
In-Reply-To: <50c7055a676fb7f1bf27cb33a914df641c56dd15.camel@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 19 Feb 2025 10:46:55 +0200
X-Gm-Features: AWEUYZlhtQ6N4279fN6OqZAxKAvbZZ0SsWRbMIXuyMNnTZ9yjwFgBR8L58MeFwg
Message-ID: <CAEnQRZCSL2ieQQFoHHpRwR5XfErZCm8nDMpr6rBVBWXiFKbm1A@mail.gmail.com>
Subject: Re: [PATCH 5/5] imx_dsp_rproc: Use reset controller API to control
 the DSP
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, shawnguo@kernel.org, mathieu.poirier@linaro.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, andersson@kernel.org, 
	linux-remoteproc@vger.kernel.org, iuliana.prodan@nxp.com, 
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, Frank.Li@nxp.com, 
	krzk@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_004708_673615_06CD8BBB 
X-CRM114-Status: GOOD (  10.90  )
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

> > +     case IMX_RPROC_RESET_CONTROLLER:
> > +             priv->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
>
> Is this optional on purpose? There is no mention of it in the commit
> message. Where is this resets property documented in the dt-bindings?

For this particular case on imx8mp the reset control shouldn't be optional
because the DSP won't really start without it.

I was thinking for future boards that might have a reset but which is
is not mandatory.

Will document the resets in v2.

