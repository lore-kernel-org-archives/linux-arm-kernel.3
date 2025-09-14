Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B32FCAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 12:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XzitEMhuyn3awzPo2ebuyIpUU8Id0dDSX6YSKZOv+ZU=; b=PMp3D6ZC7osxJo7YY6hyC1jACh
	iMP6HHHfwdfQt61NZq8fd7jq1ew1I3B3rkvtuWCCX56jG+Wk83QQucflmUAXTzCB6CVeD96EDJOoZ
	sPBlHY+nEO7e5cO3qNh4Cx6olHd4aTonR0wdu3TsSQt7h8fvnp9MvUgsBF10rY1apcFMrO6bOk0ui
	VfwaOcNBXQIWLMQkVvT/nbZSlULBEBWPmd4sqZnqB88YkOOFmGVjHmLOL7lWBuTArYw8A1NTob/bD
	XfMz7BrDf9EKdsYagW0yyuo0SsJiOMAc4ogY97oYS3QdE/rgCSWUlkw7NzdXiLJHxqNorjQOXc4Gn
	s/xlBQ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlxy-00000001ALQ-0FcD;
	Sun, 14 Sep 2025 12:36:26 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlxw-00000001AKG-0zYC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 12:36:25 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-627b85e4c0fso5309365a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 05:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757853382; x=1758458182; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XzitEMhuyn3awzPo2ebuyIpUU8Id0dDSX6YSKZOv+ZU=;
        b=rPd5c0QkmIt1ngWHHXkndfJ+q6oUl7Z5kDfxguAxaZIWJcYRaNUzioJF9xW+8vgSN4
         +dUiPpk7BcjfiyVfhs6vCEELjUPXde9XmFbqbHUUFd3gn84clnT4KbPJ/zxT5yBaDCMz
         xsMhdDmZKuKoK+lMrumKg2hfsRJjeXtrH1nWRbEzs6lK6cjtm1Ix9eZ33gd9mrO+eayQ
         SDMMm1RBF7nSdFqD3P/D7hP/7EGRNz97JS9lz7bXV4NFHvaz7VZWNYX/tACyJj15uDy/
         KqjbQXiANm+KXhKqrVaBMTD9zrZiG19U8Suz8rpo1999T1o+js6vlmVyHhEyLBxJFnXm
         h9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757853382; x=1758458182;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XzitEMhuyn3awzPo2ebuyIpUU8Id0dDSX6YSKZOv+ZU=;
        b=YJ8GMBgivehHrG105PtmCqok+h/kCaG5tuuIU9VJEVb9EhB6/7qorMB5PIx4zoWHtc
         KQuA/iRb4piq+raaykOB0amxhtJNsNUXvEvoDDTZ4d8tg4GslpQA6vVDA58G5+W9/86T
         FNsEsHhWLwr/utOJxLgyCsJNLKjXweAiKpwpyER/oULGiavWrhKbow2Oa3nGcLziajJR
         OsWU+cU9QZUR0fx/shs3S7MtVoiUwhODAP1wslvntExd84oa/M9swPyqZc4PZMh79xwG
         tNqwfGVo7iuyLoEuTTIs2rZEqpH+ZWZMLMKE1kDAoYNYJu/fPpVobADDFnFGEc5aeRKS
         gONw==
X-Forwarded-Encrypted: i=1; AJvYcCW0pXqZoezaaQBNiS0WPVyQ1rpCMwC8y9GJO2UakzZZa5H9oMwxAENKY0xYd7n47D+HQQs2grfK/8ZQYVmSlEDi@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf7Rug/mHR0H5aIPqvRJKWglNYL9PRToZXLSok+IOfrTOuGmrU
	qAwSwP9BT3M60rx/GXprdjek3tkF28vIaItJmMrHLEStDKltD+CumjsQI8EQRCyy97MYpPSsJC2
	9G/hbhDdDgnGtXTf8GVcAwZz0Fwr9pJvLFh5Tb1qm5g==
X-Gm-Gg: ASbGncsy2wG5ltYQ3frk5f7HackuG+799osRkCtvYnTOuGS7Ha3ul0P/I2FfysAfM51
	Qxs1gmcMmG8KEn2GxSOtJxDme7CWBnYu0yChv4Yw1CDhnfvZwzbvZv7YR4GB33TlP6JWNMjpFgo
	w7dYAjPFJTitRiZYrVB2mp+vdZaseP+ffJ6h6jCX5wfBuDW0XjHcLRjdUO3KY9l9Fn/dDP5ZlpL
	iq+udU7glghsMPaDZectYMC11jBlmokOWYR3wMzx3OOtSYWxVLOxy09VA==
X-Google-Smtp-Source: AGHT+IGLgebxMOwJM71zc3D3ToXnk7YnVzCirJGRT8ZrnA27mi4s1untjNEF1bLojbZ0S1PNlaf1GTIT/qLxGso+faQ=
X-Received: by 2002:a05:6402:84c:b0:625:ec92:9cb9 with SMTP id
 4fb4d7f45d1cf-62ed97f056amr9211931a12.6.1757853382608; Sun, 14 Sep 2025
 05:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250912141436.2347852-3-vincent.guittot@linaro.org> <20250912221817.GA1650405@bhelgaas>
In-Reply-To: <20250912221817.GA1650405@bhelgaas>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Sun, 14 Sep 2025 14:36:11 +0200
X-Gm-Features: Ac12FXyJQFQuZhjlTZQnQvt2nz8ZamVHOj5HVBPrh9aJUXB8J86pKRnbeO0Lw-0
Message-ID: <CAKfTPtCm8QLrMv6CF9KWRf__39bRnx7VOA=rf6M5zJmHL-ekgQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] pcie: s32g: Add Phy clock definition
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, 
	s32@nxp.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, Ghennadi.Procopciuc@nxp.com, 
	ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_053624_288130_2009E5CF 
X-CRM114-Status: GOOD (  20.68  )
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

On Sat, 13 Sept 2025 at 00:18, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Fri, Sep 12, 2025 at 04:14:34PM +0200, Vincent Guittot wrote:
> > From: Ciprian Costea <ciprianmarian.costea@nxp.com>
> >
> > Define the list of Clock mode supported by PCIe
> >
> > Signed-off-by: Ciprian Costea <ciprianmarian.costea@nxp.com>
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  include/linux/pcie/nxp-s32g-pcie-phy-submode.h | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >  create mode 100644 include/linux/pcie/nxp-s32g-pcie-phy-submode.h
> >
> > diff --git a/include/linux/pcie/nxp-s32g-pcie-phy-submode.h b/include/linux/pcie/nxp-s32g-pcie-phy-submode.h
> > new file mode 100644
> > index 000000000000..2b96b5fd68c0
> > --- /dev/null
> > +++ b/include/linux/pcie/nxp-s32g-pcie-phy-submode.h
> > @@ -0,0 +1,15 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/**
> > + * Copyright 2021, 2025 NXP
> > + */
> > +#ifndef NXP_S32G_PCIE_PHY_SUBMODE_H
> > +#define NXP_S32G_PCIE_PHY_SUBMODE_H
> > +
> > +enum pcie_phy_mode {
> > +     CRNS = 0, /* Common Reference Clock, No Spread Spectrum */
> > +     CRSS = 1, /* Common Reference Clock, Spread Spectrum */
> > +     SRNS = 2, /* Separate Reference Clock, No Spread Spectrum */
> > +     SRIS = 3  /* Separate Reference Clock, Independent Spread Spectrum */
> > +};
> > +
> > +#endif
>
> I doubt this belongs in include/linux/.  It looks like it should be in
> pci-s32g.c since that's the only use.

The header will be used by other driver so I didn't want to manage the
transition and a patchset which would includes drivers from different
areas

