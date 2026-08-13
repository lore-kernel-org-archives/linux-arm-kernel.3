Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6392BC5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 02:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ga93l35D89aJ2IHV9FDqwS6Op1XlfD1igClEfFwYr1A=; b=jRfcP2mk54usdTLOl3b5Pb4i/E
	F1POGjdGtqVW9QMSb1AUqHrcZCxLU8qTZ4YzLLvO9cnOokQmxN6/8m6acv+67vojiVyO5Jq/n+2wq
	tHa0fEA9PTuJn0PJ563BqpHvA/YI/I7GWwhaoVt9xYClh+PpDAzHLEHY5ffFm6ZkTPLn5OLuHr+RM
	dq/k1Di4zK7b/Sirlm+Mkh4XHkqGJJn4yMzYnPfoV6tOnUbvb3Vlas6mwj21DrbXRetu8Z/sBwrlM
	YrMaHh622CEBtZ/mXJrPDbK98Gc4R3IkMh3TDa/Z6IxuporV8S/LB1eXaQyrd3HgGHCls7AuT/7nK
	6CVsP56Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuKlC-0000000HFrW-1FQH;
	Thu, 13 Aug 2026 02:01:34 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuKl8-0000000HFr7-3GW9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 02:01:32 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38f620399a0so1618902a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 19:01:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786586490; cv=none;
        d=google.com; s=arc-20260327;
        b=iQEOFFI/3AJBh6VgQ4Tv9kYHLfITSC3LacwSZMu/7OhZAjDTekCfkq9kOhMzZSinI4
         53ho/ROgIX9lCkPv6i3fU/eCTRG39pVSC5/typnEiU2nGCgjo0xc6W43foJ1Dodn+jdF
         c8vwgG546yen92MeCBKjC7IsQjKNTcBkbeEQ1IY3+rlWylf4532yfXjWD4vzFoDolmc4
         LFxY2XUyPjDAiYf1CUgmLQzUNFbgYRg4Y+ZR+jJl2ateI03Ym/Wl5EkyELMVDyXs9XB/
         haPm3WxiGbYI9Gb4LHU1mthVHqf/VAcTWzA2y4wj8TejnEt3K/XxcF/R44pLMTlJJ5ra
         skng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ga93l35D89aJ2IHV9FDqwS6Op1XlfD1igClEfFwYr1A=;
        fh=eqkSRz7KnGmRp/ODtmf6HXx2JG5JWQJhV16Wp6yF980=;
        b=arXmdB5fNO7eckEEuiav1fjajF+uKXHVwGQkNPOriV7hA98lem1NEHrxuFv/CJZqEe
         koULvzuDu9VOmFB6i0ueQVZEToa0VPpzyGaWUZXX/TP122Hjk1uSjwuUFYwFCdZJHK/l
         AmUMyGQ26dLeh8CMS3WLOfkTIqjUqZZBK3LVeTqhfOPREJhYhq7fwSIE0U1TITVhAaZ/
         GKf6jSQSRlLwRN7r5zUpE4Mi/CRW7iPHCxN/4tR88KMZYuBrbEx7pxJn1mWiePt6RV1X
         E3F6F9yoiKuOvDC9RWYx+U+zD/yxe0eneM5SzWSr6PVQSrUYGdKIybgFrgLqsjEzB7Gp
         hF+A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786586490; x=1787191290; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ga93l35D89aJ2IHV9FDqwS6Op1XlfD1igClEfFwYr1A=;
        b=NnygX9E39U8k2pp1IyyVAbgDfOGwK4C8DUHxdi9OHeEkTbIFin9JHyx7Ozy+If0rEV
         Ch+ki18EOtLKJLL+2SN+3o8GF5upF+SZXLCcbImwWMPBSvvj/OI9KNuKtQHP1uUPMjwM
         fQR91s280/SCEofep+Ma88Rlp8+YayCNxf+8GZ3JeOXL2i8T+vjBaRpxSw2QtvTSsqVJ
         FmxNiih2yE1GZ9md5h6kqKqTk+u4pzUHezgcpbC/sXYbTKj8+eQ3zA16Cwp6Cp3n6fcl
         ZkY1WQuFgaQx9U8xxSWyFEtDl5cNlwrTV4L0asAnhpqN0Wuxr7xaABGpQoc0xWYjOIkm
         zwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786586490; x=1787191290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ga93l35D89aJ2IHV9FDqwS6Op1XlfD1igClEfFwYr1A=;
        b=F5n4h6OFzrK4iduayivkBrjN4Crz58ZHIPlzIQ365arJ8MQgNGSmwh6ALBS66Om46r
         Z9g4iiN4+F9BP/x9Kd/90qFaid4Lwsqe+pbOv+HmExMUGrpVIQC3ABEXhwI4Je2ikubp
         hOAVWH4y49hR7woEwpEfNjHwunoCuiijrUngGFlFPJUTtF9oFTiJPiBhgtCl1w4hRWIU
         OTWJHXSZ0s8dmrmINMhwn6y6FnWaZCZzohy3xpLE6x4MWeCXYcK7/rHh+rTiCcJX/QGX
         ZKolvm3JrnFn+BlifbPD+m/+fsmpFRsRilNY7OY4wIAgj4O1kcHiI84ERVjoP6/t4+gc
         g/qw==
X-Forwarded-Encrypted: i=1; AHgh+Rre7k65VxMl9crkNRUnXh4cuaWlXivP5iFIWiPotzu0tVOz8zvlm4FKqaD0QnTXeSt59kdMGXGRux8w0qFTS4qc@lists.infradead.org
X-Gm-Message-State: AOJu0YwxmovC5A5fUSSGAuAJUUBYJV3ITsEOfbN6RF5iBLRrgMEOeeH0
	KAvn779eC4FHAi1lChp7l9njvpwPiAvS7HgWNp3/AyP0RZblGFe/cWdiX519/9IuwR8L2h3SfqC
	WKgBlLOArmVnQOdUUvtMyDj7ATbsscuI=
X-Gm-Gg: AR+sD13FgOu3RajFo0avbOC+C8TvS/vR+xz6Yy9neRXyjSi3Ponis4pPNkVF4pjs7oo
	ndSbX99WYn0kgieaRgn9LkPAW+5P4K7a2tuiSevxb9/NH24Kf15ovrHiTxB22juq4IgmRHk0J+D
	nuZfWP6oCjtt8eLH7i3JZstH69CJ0wXfWijDlMhOQJXm81Uksaxrv7w+FG/13X9eRlAo7FsekFg
	e089ntGK1K8RDxWZ8bTynw4tugvqAdWUM/BBEEth2/99vIImWZwoAe3ptZUfrtrauDC7i7XCytF
	jPxU9d0/QuUdue1/43AJbsP+CCfZi2I506x0vf6hV+ZQBlc+kQs/6+X2iSE9WFv71YAniTjEcJC
	SUA9HvTjra+m8A98pr44hP0JjL1FGoDpkIOrFFmIsk9kQBItO3O31cG9G
X-Received: by 2002:a17:90b:2246:b0:38d:dfd1:7c1 with SMTP id
 98e67ed59e1d1-3931dfdcc9emr2607429a91.2.1786586489664; Wed, 12 Aug 2026
 19:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260811034715.6034-1-phucduc.bui@gmail.com> <81a38486-d4d8-4ca2-8d22-d3d178c17665@lunn.ch>
 <CAABR9nF4q=eyUbzmo6-Co7NfVcg_bufHnffy8Ho4ZehHFZpqJg@mail.gmail.com> <017b2a0a-0092-4958-b554-45139db50cfd@lunn.ch>
In-Reply-To: <017b2a0a-0092-4958-b554-45139db50cfd@lunn.ch>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 13 Aug 2026 09:01:18 +0700
X-Gm-Features: AUfX_mz6vikeDAWQkBfvSuo0tedoVTQ282pGLuo_TeMhsfWXN6Hkhq6AgPX6zzg
Message-ID: <CAABR9nHApFe45RCcXoHDiNh6yqnyVLxgD=oFmpYohQ=QT9=wfA@mail.gmail.com>
Subject: Re: [PATCH] net: xilinx: axienet: Propagate errors from optional IRQ lookup
To: Andrew Lunn <andrew@lunn.ch>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Michal Simek <michal.simek@amd.com>, linux-arm-msm@vger.kernel.org, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_190130_823110_78D47539 
X-CRM114-Status: GOOD (  13.76  )
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

Hi Andrew,

Thanks for the feedback.

> > lp->eth_irq is assigned from platform_get_irq_optional(), which returns=
 a
> > positive IRQ number on success or a negative error code on failure.
> > Therefore, a value of 0 is not possible here, so changing <=3D 0  to  <=
 0
> > is directly related to the error handling described in the commit messa=
ge.
>
> I think this is a separate change. You can then reference the
> documentation, and its example:
>
> https://elixir.bootlin.com/linux/v7.1.8/source/drivers/base/platform.c#L2=
70
>

I=E2=80=99ll split this change into a separate commit.

Best regards,
Phuc

