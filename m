Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C46ACD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 11:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzXXcPatHUTECkq22Qox7RnVgD274dLeIoFpGjG0hKI=; b=oJHUXrZP8gpBNDxdYVrBUclQrT
	mfhdR5I4w2daxUGi1p2JVFHgf2ZrRJnaxVn++sBQNjbEH5Jbi0g7jsq20DQ+sN7xAWn0tdf7DJBEy
	kGt1vnEWMl5JV2CFBHf7+Jp+xwR3UwWQ8oM2jcjuJLW+sV0Ah1JVQm32+px3+6t43AAS3zdh5EhiU
	SzlyQZTdJa2kSIufh2s0qLe9oq7Wn7JuITavqllSX477bgKhEMWHsb5tZ5fUiPzyYY0WbNWei92OJ
	QcvaGsvxEFT6CyeaQdnnhwWvJjSi49Sx9fmiWswBMEF5uKcoZZe4NF7Ksci3Go8ujBNyZwanCW1Pq
	vUIJ7HXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqq7-00000008DAQ-1DxN;
	Fri, 15 May 2026 11:36:23 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqq5-00000008D9X-1GbD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 11:36:22 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso61180015e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 04:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778844979; x=1779449779; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yzXXcPatHUTECkq22Qox7RnVgD274dLeIoFpGjG0hKI=;
        b=Mdyc365pTD6y7duPumelYPqUdDeBNqRVfbJg9jXoxE2CXDgmdoxeRj43gxl2px6GnZ
         YHaU8XS13fKzkyuRfeLKHu9hzGhMateWB+zo3wbuic37nE+kQbVPOz4GYhoxQlJGx87U
         CNJJYkwbGXKvk6h5YSjCSIP5OKDGWu8hPuOTRYwhDU9XBcIlhFEOkzFZNKIQLcN+55vR
         WT7kJ3B0zpEk825jU9Ok9RR/k/I2jgB3uCLOWkyRbPhfckCHnSlUWRLZXYaJhz9t5PO5
         TB8+2ITqNwGQy4liZd0BKLiV6qoArErx0SqwI5S/MT9L3LlKy6LR1yRl/tmtQHJwQpw3
         RKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844979; x=1779449779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzXXcPatHUTECkq22Qox7RnVgD274dLeIoFpGjG0hKI=;
        b=bggWEeMkSZrXFCmuHw5risGcw1ic1BKxE8ZQ1s+AMyfayrJYLENqo+NpkHo0TrJJ3c
         xHL9CLTs3A8KhN1Hc9dP0ZZEW6T5k2/X3iicMvtyBHyY1nZyCJH6Yel4iRvso3AHmHg6
         p/nEF8nvSlMeD52ExYDnlUtBkcbV88opOk9ygQpnme1EPHF5gHeSX531JHyjQdlwj1e0
         0vb30o5Te+a73hsQBEmxnvNPqCV67fKqbo8IqJdfhb4mtgkRMomJ4/IfLuJ2h3ul88Sv
         wU5+lQBKKbpM8VdLnPvlcZp8DneYlJ+f9BK4SU+BUXWeGwEQiI6Ih012SRS75rzacWw/
         EHrw==
X-Forwarded-Encrypted: i=1; AFNElJ/ZAWXbHoDKqowiLUHb8mv7jQyr1rgseZRUvZKqIlF6QhRQssSm2McHPgQ0HzBRbzQzvY417notvAKju/HsV6ns@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgv6iJhC4IyLOaB1A7oGyqCnBpDVbHsPNPfQGsoPk+jV42lrIi
	moNwQZCBqkGLWZCRctH1BOwnZWw1zAUFwoxbcDo/uC7vytMK1UyXyGKW
X-Gm-Gg: Acq92OFiFDCVERYqag5d059Ej/Lg4Gt4qoAUuNUT1tzrZs7FSqZa9d/eXODGRTH5dtD
	aLdppiTygkzOkbaI5h7LQDciDI0ZAr7uXiIV18asIj/4HpW33kB91iHSNi+U1MkhnKKN3IR1sDU
	tIDjmRh83Orrt1WZHCCaoxrJlECz5xDHPhbbFX13ZZwOY/637fwDQa088D3QZAAWALHxxHz+rNK
	zuiP5j/d9l6TOgeHZj3M3ELQspk0huNrK8zFe82mAY9Pjj9VmHqYbA9+yoad44MAtTn9oUpv0+G
	kMybt7J1untg3ZcK9AIrjp23SXuuYqYX6TLDHSHD0wws5GLiLy5hD/aoGu8mYrSEthxnG+ZL3lC
	E/UxzyJhMMMV/6tZouuybbYS5Syj4MLDAHld9g+XnQM3RXiVpL5Fs5vQ72ZpoyRUYXojnITV2aC
	Cdiygu4qtPldktl5m4P7g=
X-Received: by 2002:a05:600d:8:b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-48fe61f7a92mr51272135e9.22.1778844979216;
        Fri, 15 May 2026 04:36:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53804aesm52347505e9.15.2026.05.15.04.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:36:18 -0700 (PDT)
Date: Fri, 15 May 2026 14:36:15 +0300
From: Dan Carpenter <error27@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Fix OOB in scmi_power_name_get()
Message-ID: <agcFL0oFbx2GEgPJ@stanley.mountain>
References: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
 <agb1Q6mrGyDwFdmO@stanley.mountain>
 <CAMuHMdXreO-6xQ+e88AKQ_vSiwMPMnx=t8h5JChBAtuV4UDMEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXreO-6xQ+e88AKQ_vSiwMPMnx=t8h5JChBAtuV4UDMEw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_043621_346840_B61E8846 
X-CRM114-Status: GOOD (  20.88  )
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

On Fri, May 15, 2026 at 01:29:27PM +0200, Geert Uytterhoeven wrote:
> Hi Dan,
> 
> On Fri, 15 May 2026 at 12:28, Dan Carpenter <error27@gmail.com> wrote:
> > On Fri, May 15, 2026 at 11:59:15AM +0200, Geert Uytterhoeven wrote:
> > > scmi_power_name_get() does not validate the domain number passed by the
> > > external caller, which may lead to an out-of-bounds access.
> >
> > Is an external caller an out of tree caller?  So far as I can see this
> 
> I meant a caller outside drivers/firmware/arm_scmi/.
> 
> > is only called by scmi_pm_domain_probe().
> >
> >         scmi_pd->name = power_ops->name_get(ph, i);
> >
> > where i < num_domains.
> 
> You are right. But this seems to be only API implementation in
> drivers/firmware/arm_scmi/ that does not validate the passed domain
> number.

I don't have a problem with the patch but I don't think it should have
a Fixes tag.

regards,
dan carpenter


