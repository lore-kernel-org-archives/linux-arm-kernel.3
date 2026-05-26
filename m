Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA70CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 17:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3v7j5t9/Ei/dvkrhTWLvbnWZo0gJn6tOy3Bo7O728j8=; b=F0KQvdI+1InlqERS5lfXxPmPwL
	GVZ2K+2/8b2anQ0a8X9zEchSD3kpJt0vcw/r2DvS46UQq3zV+1cqTb/pA+ZJYlq+oZC0+XAjumGl8
	uh2sdL68I7EfNu81LnTfoJT3TIfdWzdTC+kY3MGeE28Sb8yCKnPRyJW4EGbnaO4fR+SrLdrZTzN0H
	4bYygofxt1XohLNCBoklmicWBNUUHis6x6uTSMhR54xwp3lq6dJtSumQdp6OqXIBu13gQcTknJxCB
	wbc30hryLMANndZiIljKYRhtvKZo+pLVLaUl4H6St0zDzVd5z28z3wdpL1QWhazYSU+EqCikHUVgB
	8l6N8jcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvqj-00000002lCv-1tl1;
	Tue, 26 May 2026 17:45:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvqg-00000002lC8-1ZHs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:45:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779817549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3v7j5t9/Ei/dvkrhTWLvbnWZo0gJn6tOy3Bo7O728j8=;
	b=hSQ25QGfOvgRIybp5Gh+w297IBrxQcq/95EqoWz9hiyQP9EBh9tYjs7ruGI5krqUM+lY0t
	HOSx6InyjDq+3FuMg7fBHbgRDIjslfv9urplYgqoplE058VFjGD/9wx/Rzs8vq3qcVcwl9
	Gh7zZT3ddKS6Ldw4Jyw5mdoXRS83Ftc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-Yb2aVv_FOaywY9EnfUxkrg-1; Tue, 26 May 2026 13:45:46 -0400
X-MC-Unique: Yb2aVv_FOaywY9EnfUxkrg-1
X-Mimecast-MFC-AGG-ID: Yb2aVv_FOaywY9EnfUxkrg_1779817546
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514cbe73d00so296923671cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779817546; x=1780422346;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3v7j5t9/Ei/dvkrhTWLvbnWZo0gJn6tOy3Bo7O728j8=;
        b=JndLXMgn7lX8BrN4vYRXnJNlCZG1pNRT0BJTUt6Zh3SRgSehKcuCGrp/FlpCs5sNc4
         zw9aUatNdyggA2OrgTZM+HmzLOi62oxwPp5MbL02ecBCdUZMrXZRtFrOd5hjzcFq+dTl
         lE31x69ompDa5OpwifrmE93Oi9pzIHnKwV+dEwO6Juzh1x+UdNFSufkM1gNWY3uLVMfB
         sffXh3MyQ/ivaVoeItmCH4Db+q/yORkQag+IptIEOosBpuD+QoeM+vM+OBGiXSbs5fgY
         fxFzFXUpvkQFMEP7cfROPjX31heDVrg2DqncTaJUTJeyuTzNVoECIFuaZOMaDw6MMRMt
         HDog==
X-Forwarded-Encrypted: i=1; AFNElJ+b8VU+KEic9e4mkDDzGKuNnPJ/X15QsV6Xbgvt1SzACREjcGrwTecFvhW6iHdivx+7fBkvjWYkzH9rEsTS9LE9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5C3nr/NYUKIMfYAP572E7DorAKpTAJrTq6+3pIC7OAzncEopq
	BHXCt5gAN6F1VlNOJ656sd0HGXlBxNH2pFvYyxAloEtiSUIAc9d2qUS+a3iqqmUwcSYPs0W5GlU
	XNbY8EqpwFxv3WzdZXBP1oL/P3X1Q/mDytZsK/vdSiFg6Fei77r2Emyquld67Kn6NyZ0xWaIkL7
	DN
X-Gm-Gg: Acq92OHZ9Qr9PmkK5OX2h6j4pokzgP1FJor7QfuIZ1bMIq8U1njnA00mwdxoHrwEmEP
	fXgstI3ktw7aZp+O1Z1QfeXCW7q+3Ozxyn4Gs+xDBIk2cGAq4QzrOZeTObltlCuG3skRuY7cxBX
	t+6dhsUOAB78bX9p9ftGRQiYhoyOv4rd2s6F3R2l8F7MwZ22+0JJcOxMNk23siPFsGJgaxpsK/H
	SVQBJqxkxePwZwR7Ta7GVaVccUooh98hy+sUNePNJTzKNm5WIeIsXuN+rzAZtLSMQVnCW3G7Vbu
	J1J7t724lWEmrB5G4ByNyt+IQyOGQzdz/56B4s3Hhdigurcb14CSzHkWUyedL7x7j2XS812H8HK
	TG/4dTkYhAfl2My9+bTlseYZFoQkFYaGLDicqGAjVKREF/th+vZazXOUf
X-Received: by 2002:a05:622a:1c10:b0:516:e033:f5a8 with SMTP id d75a77b69052e-516e033f8a8mr202373821cf.59.1779817545821;
        Tue, 26 May 2026 10:45:45 -0700 (PDT)
X-Received: by 2002:a05:622a:1c10:b0:516:e033:f5a8 with SMTP id d75a77b69052e-516e033f8a8mr202373121cf.59.1779817545155;
        Tue, 26 May 2026 10:45:45 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5170c403529sm10457421cf.10.2026.05.26.10.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:45:44 -0700 (PDT)
Date: Tue, 26 May 2026 13:45:43 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jonas Jensen <jonas.jensen@gmail.com>,
	Mike Turquette <mturquette@linaro.org>,
	"moderated list:ARM/MOXA ART SOC" <linux-arm-kernel@lists.infradead.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: moxart: fix refcount leak
Message-ID: <ahXcR-T6pyWmV1_e@redhat.com>
References: <20260520175552.537603-1-grandmaster@al2klimov.de>
 <ag41wJBhdK7-Zynb@redhat.com>
 <cb81262a-5327-41bb-9ef6-9cd91f1be0f7@al2klimov.de>
MIME-Version: 1.0
In-Reply-To: <cb81262a-5327-41bb-9ef6-9cd91f1be0f7@al2klimov.de>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iRFEwNOLzAFcT7EHp9GeAYcEqxENrYNewBvuingsEp4_1779817546
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_104550_485174_F9F50DA8 
X-CRM114-Status: GOOD (  23.80  )
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

Hi Alexander,

On Thu, May 21, 2026 at 06:16:38AM +0200, Alexander A. Klimov wrote:
> On 5/21/26 00:29, Brian Masney wrote:
> > On Wed, May 20, 2026 at 07:55:50PM +0200, Alexander A. Klimov wrote:
> > > Every value returned from of_clk_get() is supposed to be cleaned up
> > > via clk_put() once not needed anymore.
> > > The values here are used only for error checking,
> > > but weren't cleaned up until now.
> > > 
> > > Fixes: c7bb4fc16ead ("clk: add MOXA ART SoCs clock driver")
> > > Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> > > ---
> > >   drivers/clk/clk-moxart.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/clk/clk-moxart.c b/drivers/clk/clk-moxart.c
> > > index 3786a0153ad1..7e191b1481bb 100644
> > > --- a/drivers/clk/clk-moxart.c
> > > +++ b/drivers/clk/clk-moxart.c
> > > @@ -39,6 +39,7 @@ static void __init moxart_of_pll_clk_init(struct device_node *node)
> > >   		pr_err("%pOF: of_clk_get failed\n", node);
> > >   		return;
> > >   	}
> > > +	clk_put(ref_clk);
> > >   	hw = clk_hw_register_fixed_factor(NULL, name, parent_name, 0, mul, 1);
> > >   	if (IS_ERR(hw)) {
> > > @@ -83,6 +84,7 @@ static void __init moxart_of_apb_clk_init(struct device_node *node)
> > >   		pr_err("%pOF: of_clk_get failed\n", node);
> > >   		return;
> > >   	}
> > > +	clk_put(pll_clk);
> > 
> > So this immediately drops the reference to the clk after of_clk_get() is
> > called. Can we just remove these two of_clk_get() calls since they don't
> > appear to be used?
> Not if their purpose is to... idk...
> check whether device_node is a clock at all, maybe?

The clk driver already calls of_clk_get_parent_name(), and it validates
the clock-output-names is valid. The of_clk_get() validations in this driver
are redundant, unless I'm missing something.

Brian


