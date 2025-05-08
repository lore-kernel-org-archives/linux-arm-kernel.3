Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12D2C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 10:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Dt6fILG0823sTCQVUZRbrKoEDN8bmv7wajBdn4+1Hc=; b=sqSNkmOmq+J8/VGsKSop1bPrCk
	IJrYP5hkhspxS4pZNcnRz9BGyDPliuvYFB9VcEVD2KC0JkGYFWYdA1qWOgs+bgYZ8yVvaWemUCMuh
	kJK8akCb6dnt4aDoGy8ubIwWCl4zzvnXEVqhkDdCy7HKVPWXA08M+4n46QmGmM5gW+1uwRDfmhJrF
	stkbp/bRGYOsiIf9tZ36O87hu0lC9tvhweu+M5ceJZBSWfliEiAazr422UBnQDywSSiQew30TJ6To
	Oc56rmxWpu+laaHoS6pZZWGCq3LMVkeb0xLZn2FmfTu/NIbtKlgN87Thx/M8aJTj6gkLqwFdiT+w1
	X3p2cONw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCyAw-00000000LLT-2m9D;
	Thu, 08 May 2025 10:08:22 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCy8x-00000000Kw2-0LxZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 10:06:21 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e7569ccf04cso817810276.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 03:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746698778; x=1747303578; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0Dt6fILG0823sTCQVUZRbrKoEDN8bmv7wajBdn4+1Hc=;
        b=mPM4nU9RUBT7aEnfKuxuFfD7P2WuqVT7zin0RBV0OQ5/Sd0SpHl5jDkRFIcwo54Y9n
         Wax43keVqnaYNqREz6ED3N8b4aXqIt3Apr+390Mt5DUnPMLBPRKYIxIHQRqFX0yW0hvQ
         PTerW0ZDvzhTdfawoFtwlpjkwvQ1FDYCA43haJKYBJif75jT8tke1HwRLFDsGWTIHfoq
         7GPA6XwRRc36S9LwYIc2vCs1jt9iC3D2r04wGEU25wGgMyVixfgWyZSgJmqnlZHr/1w7
         wxKZSZI7M9fmQZLC0xBb3Xwy+jdC6uzwchnr7Se7rpZSqEyig4EAFTFl9r7cQ94JJad7
         lP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746698778; x=1747303578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Dt6fILG0823sTCQVUZRbrKoEDN8bmv7wajBdn4+1Hc=;
        b=JRy8n+lQnuUdRdSaWZQPHkPNHMSVGa5xQ4Ng7OmLFzHe2axBnxBNKOFUyuJ2aUGjKV
         l4IgHofbrTCQBRrHwrvQ2a8oS0rsTn//W1QlcGB0WuIbHNydqrNnFGYX7g3uNwVFfRHH
         tBEJ7sd1vTaQ+b/PSiLi3VxZjls0T1BvuIaIk7f23thfEmzFVB8YLOk4dFuUK/IrbZmt
         CDxuOGah0fIoZJY8vuQaf3HL9dfJkVbvJ8EWj0wmbtKzBapcD3WKKX2MJfewsZcgwyjf
         yAU6sNWqleeXGiv9i92Jn8g7FE4NbQxxJP5aNVIezKWA7SQdL51SlmpR/DhSJ8rPdfjL
         99RA==
X-Forwarded-Encrypted: i=1; AJvYcCW0MnsCDW5Jp0MOE754ZTpD1sQmXHPdgm6fdAljMYCyMvdBc/jSPGIaulB3AWiu+JwsqybXk/fLAB8inn8uz10/@lists.infradead.org
X-Gm-Message-State: AOJu0YzrXo7UGJfCL60l6Ehl/u6ah9tzSQx17tTMucvZhBck0ouUun00
	ycZ05A7Zz2fzqz59nCB3QHzb1wnNQ08ZzH0wAU3KNQ+o98XrwrK2zZL2CtsfMAH2Uto9bAUB/0u
	nGheLoxt3GShL2SoVMvcWDja04L/2X5g1jozHEQ==
X-Gm-Gg: ASbGncvi6ptR4m3Upcgkza0W8896h5SCg388yLr4YChIRODVloPMMbODnK1L1TnL88r
	oU7hfXCp6DklQMt7aagqy455uwcKKTTsYhb63mj7xofedVR03Zq/RAGqUpqa/TzpE/FPiEli+Pi
	oQaYeupKAFku1FmOluP35oiMw=
X-Google-Smtp-Source: AGHT+IFLG8pqmlzvCqduNnPSERGgsArPUvpsmnVAsVQdb2qKBzJ4ictnEHeRy8JSqGPAm9xU4RfpdLw3POTBQQleFHg=
X-Received: by 2002:a05:6902:238a:b0:e6b:8025:a9d2 with SMTP id
 3f1490d57ef6-e78ef6612d3mr3061543276.24.1746698778096; Thu, 08 May 2025
 03:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
 <20250417142513.312939-8-ulf.hansson@linaro.org> <aBuJD1izaMqKUJ_s@stanley.mountain>
In-Reply-To: <aBuJD1izaMqKUJ_s@stanley.mountain>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 8 May 2025 12:05:42 +0200
X-Gm-Features: ATxdqUFYpoIU6GGp0joDEQyexOZbHsuxgOGeWCwXDFxBwA4ofoG0Bbeb0aHcVlg
Message-ID: <CAPDyKFrxzg2V5qjcnXQ=SyudkW4-nmSWG-8TkMOim+sSWKfboA@mail.gmail.com>
Subject: Re: [PATCH 07/11] pmdomain: core: Export a common ->sync_state()
 helper for genpd providers
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>, 
	Peng Fan <peng.fan@oss.nxp.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Johan Hovold <johan@kernel.org>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_030619_117220_2FD8FBFF 
X-CRM114-Status: GOOD (  13.55  )
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

On Wed, 7 May 2025 at 18:23, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Thu, Apr 17, 2025 at 04:25:05PM +0200, Ulf Hansson wrote:
> > +void of_genpd_sync_state(struct device *dev)
> > +{
> > +     struct device_node *np = dev->of_node;
> > +     struct generic_pm_domain *genpd;
> > +
> > +     if (!np)
> > +             return;
> > +
> > +     mutex_lock(&gpd_list_lock);
> > +     list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
> > +             if (genpd->provider == &np->fwnode) {
>
> Presumably this would be "== of_fwnode_handle(np)) {" as well...

Yes, in fact there are a whole bunch of them in genpd. I am making
preparatory patch to change all of them.

>
> regards,
> dan carpenter

Thanks for reviewing!

Kind regards
Uffe

