Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327F1C71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 00:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkeJvvdmsVwijabIeMHoTRZQ2efXfNOq8ZkrZ12WLLw=; b=Ql90ua8J/5IqiVTrK0C4N54f57
	rf0LmHHsThWA7kDhkRE9Ie2v5df/vFdIkWuyuKEe2lNoD90+fJZ9j+MsQPuI3oM/UjFUyrrrOZObi
	c0JEq6szfsUxRq5KcxRwaVyt6V6ypKZ+q0bj3ZMdfzeXl5vd6tjZqCFGJMYGzhKXNap6bGuOpjFja
	bHoNYBHCCgI/YvjcQ0p+dBNt7r1Kd3vWGiQmfUeUwOPZttGDkVuneHXrOI+o88+hxxKdiwsDrKt2y
	jL62dXtJAStuOlUJpqLzkyW1jum62IySGVdBcJgApp1Bh+twDVsAAvUKP3rYoFeLiCIBw3w/ViO0Z
	rFwbR8SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPsDi-0000000EwpX-1CnJ;
	Fri, 13 Jun 2025 00:24:34 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPkr5-0000000DxjP-17Ur
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 16:32:44 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6fad4e6d949so7470796d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 09:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1749745962; x=1750350762; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fkeJvvdmsVwijabIeMHoTRZQ2efXfNOq8ZkrZ12WLLw=;
        b=IG3BNL5Gd+OdpiAhbK3drcdx6LvmF4VWF9rhyXH7Xxom0q5fp9qd9TwotmU7TREljk
         oqghWlo1Z1WeqsKkmCJahKt2JaqucsUea05VaGxC3eH8Vio5/kDwGfY7M3ae2b+gUzf3
         gpIQEIlY9P8A+rN6HsTtnFFjoE1WApZ8sbQTeWv5BvgN4vqe8aMiicFiGxpcsW5YUQ3W
         8SdhHXLw+l64p4tIhfcEHITyCYi6oRv5NX/2tYXu3sH57ZbBgC2cToIZj5LrUYDN1rHp
         gmwa4hjrKvGMNCjDnuGd/X8BAfPyD63NUSUvMxQhQkAJVLYTi8yA8zlKyZl+KBOwHS3a
         CReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749745962; x=1750350762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkeJvvdmsVwijabIeMHoTRZQ2efXfNOq8ZkrZ12WLLw=;
        b=GKkQ7W9Z1c/zZD+NJgEtZzJBVxtKoGRDwn50uAWLODp3Xy7Tp8yEdIQRq88wrjdSak
         yVfQvNwJShzSTld2JF25G4XTLAQd3sv6f7aHzg3keT3LmU68zHbQleddQiv9mR0sADk7
         4N4Ucq1D/vPAapyQvqJ8zkh0M7FCwOTqk38+oGGqfjTPgjXOeGSVUJtdzAHeHJ68grPb
         9wc3KU1AUBALqw5kFCFu0HifJMH+82wWWijf4rkV1nOxbdblX+BuuUXPhvQoA4K6edQJ
         Ksw50SGpN+eaqRcTuZQq08qKUP1680ycAkgZbrfQhlUG4QTxgDv/DFL1TGY6MzzCCqjn
         UEnw==
X-Forwarded-Encrypted: i=1; AJvYcCV5UVT3dZ6eVZ/5mFUaubFZffmJJSHu8BR0gaE3Tzo1nXcEsCXBegt/LlUatrEH10GOJXKO37KRUPmI6NuHBuHc@lists.infradead.org
X-Gm-Message-State: AOJu0YxR6NaLoL23dSb4jGrhe19NnLSrICsYu1oAlSx//wca5nZLyoCY
	8NHd1xG1+MqknNcrwmyJAXW0OVDCtn5A/kbRbVsQftnpSkrpYfcL16mNZh7NSGCCZg==
X-Gm-Gg: ASbGncskuORSxFGX1aneXejsJz4tAAqpLCVzQDUT2vfTsLQO5Jrz+FuozkhoiLxTxzY
	LJAESKXM9m7W0ljhRL7CN1q40BD04giuyUTlRBPgtpKkVt5XcgsWl607gBNCrl81Yd/k7HJrXSX
	G7KfXnOXGF1uJ6w9K5B54oAkxvBAkyrJbqF5qYVYb3UvJVEIZ4YkR+b100Q3PsmOs4JS+7JID57
	ZqSH9kFsCMMzESpPVK2L5NJ5woPeFbgKHIR6pYM3eyZGGf9Z+pJUzWXECEBP9Vko/oOfMcuhk5U
	qkU0XKNiwPKorxy3iorqWHyVD3Lz9aJQeOrZJ+z6dvpXtlSObfUMUroHp795X+bvUKo/QU5Yz2G
	dJWyk0Nb0cgfhrkxjSOuz6zoETn2XFaCWqCdIZcWvYDqenT5GgS+E9Xb3P2tE3GAn9g==
X-Google-Smtp-Source: AGHT+IFC9KA/n/atHkM073sYRCJBPxFjJEGbEOsc2M3UC84+uSQh0I6MJSO3LgA8GA/2X4nXpy0OXg==
X-Received: by 2002:a05:6214:d61:b0:6fa:fbb4:6404 with SMTP id 6a1803df08f44-6fb3d22ea01mr5217326d6.5.1749745961307;
        Thu, 12 Jun 2025 09:32:41 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-28.harvard-secure.wrls.harvard.edu. [65.112.8.28])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35c31604sm11819416d6.75.2025.06.12.09.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 09:32:40 -0700 (PDT)
Date: Thu, 12 Jun 2025 12:32:38 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mihai.Sain@microchip.com
Cc: gregkh@linuxfoundation.org, Nicolas.Ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ohci-at91: Use dynamic device name for OHCI HCD
 creation
Message-ID: <6a3cf972-3c2d-429b-9504-5fd449334348@rowland.harvard.edu>
References: <20250611075414.4239-2-mihai.sain@microchip.com>
 <afaf4c79-ccec-46ad-889c-e8347454c065@rowland.harvard.edu>
 <PH3PPF37F43E35DF7E5350AEBBB079073748274A@PH3PPF37F43E35D.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH3PPF37F43E35DF7E5350AEBBB079073748274A@PH3PPF37F43E35D.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_093243_304011_329DF2C2 
X-CRM114-Status: GOOD (  21.77  )
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

On Thu, Jun 12, 2025 at 10:33:09AM +0000, Mihai.Sain@microchip.com wrote:
> Hi Alan,
> 
> I'm sorry, I'm replying using Outlook web.
> 
> On Wed, Jun 11, 2025 at 10:54:15AM +0300, Mihai Sain wrote:
> > Use the dynamic device name instead of the hardcoded string "at91"
> > when creating the OHCI host controller driver.
> > This ensures that the device name is more flexible
> > and correctly reflects the actual device in the system.
> > This will be in sync with ehci at91 driver.
> >
> > [root@sam9x75eb ~]$ dmesg | grep usb
> > [    1.464487] usb usb1: Manufacturer: Linux 6.16.0-rc1 ehci_hcd
> > [    1.470210] usb usb1: SerialNumber: 700000.usb-ehci
> > [    1.595683] usb usb2: Manufacturer: Linux 6.16.0-rc1 ohci_hcd
> > [    1.601406] usb usb2: SerialNumber: 600000.usb-ohci
> >
> > [root@sam9x75eb ~]$ cat /proc/iomem | grep usb
> > 00600000-006fffff : 600000.usb-ohci usb-ohci@600000
> > 00700000-007fffff : 700000.usb-ehci usb-ehci@700000
> 
> Are these two outputs supposed to make some sort of point?  It would be
> better to have a before-and-after comparison, so we can see what the
> effect of the patch is.
> 
> Before this patch the SerialNumber print from ohci driver, was looking like this:
> 
> [    1.601406] usb usb2: SerialNumber: at91
> 
> I thought it was a good ideea to align this print with the one from ehci drive
Okay, good.  Yes, that is worth doing.

Please include this information in the patch description and resubmit.

Alan Stern

