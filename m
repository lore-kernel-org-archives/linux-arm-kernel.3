Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD94C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 14:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iIbBoniHrQ8ysPUakN2ZSVqOUqWXbm4NXe1FWYc3Lms=; b=NN6YQXXW8nYb+OTCBgIlWgX1gz
	fLVvh2/Hk6BjjXGklSxCx2Rt8VDlbsU3CIu21VSZgQhmMTpZKKel0ytRsMlIBSXVd+rVbtA09CvBn
	lqr4+QNKO7U5iesO0+g2uzExGk0TZ6Jn4AuFBEY2rVAvVFneQUEVzv8II7u5qjCuqy5ZRH5R6aKGu
	cVxlD2zanjp6sn1wb34fnk6xEAIAdll5LMLJpLpHzHJqMZLmPpXvWS68OlsOokGbQZssVCQiiBvz9
	594iIV94o59o9+Pffb758oM8+qJWTt0iT8JowXegjXkvcQybZY29RntR/JzBYHhYVlr9eoR7nPxHs
	p1I731wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM5pf-00000007ZJ7-3fms;
	Mon, 02 Jun 2025 14:08:07 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM5jK-00000007Xxd-0pPa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 14:01:35 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a4fea34e07so1126048f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 07:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748872892; x=1749477692; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iIbBoniHrQ8ysPUakN2ZSVqOUqWXbm4NXe1FWYc3Lms=;
        b=I3fhUvP7qOeJi8pwSt/CLfzRhRjN8rCTSkHWW4jCWMcRO8FLGYshc6x8T9mGMUGwqv
         i2tAP7Bn0yPybGMTrT2B7v5UqI6q0ECYtFGT2HOt0aFFPL8X/F+s37uhGgMpJmczarr3
         rRCse85eR6l5y1O+EXg6xbeIJhv3OF4FSkk6Y5RW/RMLbfErKApjCGwNMdZXTL6LkvLS
         Evx08m6skOu8Emts2XvUAIXG0s4qZCB2hcX9DAB+XAdQ+cX4hnqLgn17REqOd6uzJpEP
         LCFsmegMxR2byMr2MnkQrCo5Q0h5UOoBIMb4lKmA9YBAe1Z0k5OlPt0nQId/UMbI/2lK
         4d2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748872892; x=1749477692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIbBoniHrQ8ysPUakN2ZSVqOUqWXbm4NXe1FWYc3Lms=;
        b=g/nwqhfvpEK1Hz2Ey+AcjMVbiV7C85RFo5p5YaL16s8d6fPKJ0ig8374NuJ6niyO8B
         +jcZG6TiFOU9DDOGswziDclt3Xt+oGg2cgT5ogDuOPwCByBN5ONG9UMsM+gTnxd5Begg
         QtVmE9ARG8hn0eBdTGfa9sWNr/7w96sWMjdYQC75K84FccWLrxZRckJI4syy6I/8DCl6
         skWl+gfMhZR9r226yLpOJyFtJ2lIxf4QGUI9c8JZcG03yxJKluGWCIje8vu0c3C3U8kB
         yIIE2a6LtTMkQklyWKrXNqxTA9dsy+CRnS9733cG7MkOrow93upO7M9aeJFZR2t+JfqK
         kSVA==
X-Forwarded-Encrypted: i=1; AJvYcCW0WzlXgDArrI0zOBnNt4sMhxuWVCoBo3GrKqfryWTP8zYJcOk/A+/P+47VDVqKcScryZouuDWXHZPPZs+o1Ca5@lists.infradead.org
X-Gm-Message-State: AOJu0YwcbPm476Bdt0yCBEdMR4TyEFU2Q9Wo3ZOIuuqKBI0GVKzltLdi
	fGO18sVVy+1BswhEucuTN9AnmIXQCB1w8oNZMTDbfWT4HBGWZm7YgTJLtgTCI/Y96G4=
X-Gm-Gg: ASbGncu/Ziz93quI+gDggwcYIxMYm6CaJkNTAGba34ts/RWfXdUblWLwjAItII2A4ls
	H1GHmD0wtEGK+dpDqgpqyyleiOyKime2CHvkj4RblfGiO0sFoqL+I507Opxa5BGHLwQPjZI9OkJ
	H1t4dnPMuPJCuuPIytISBi3Y+WUu2CNLGcBLZ6EpmZG5qGAVd/V19OjsIuxBvIEy2u3G8B0ZZRO
	w/QsAmrX47/wxYS9sBnlfUwzVhtxlIMIsO7zkVJJPr3gnnGP3bZV9OqpGv3WzJgA9Y2kDbt//wl
	e10Lx3TZR1/56mXq2iZCCe8WAtTVaLSi0bUXJIobAb7vadH/NEp7yj+ZRu4p93u9wO0=
X-Google-Smtp-Source: AGHT+IFcK/6ISQPxykPrncma5VHws55L2Y9hI5oNzFpiILYMm6BZyuZo0dKaVkm4FGL7w36sh5Q2lg==
X-Received: by 2002:a05:6000:2409:b0:3a4:d0dc:184d with SMTP id ffacd0b85a97d-3a4f7a3650bmr10615706f8f.27.1748872892237;
        Mon, 02 Jun 2025 07:01:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4efe5b871sm15236681f8f.13.2025.06.02.07.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 07:01:31 -0700 (PDT)
Date: Mon, 2 Jun 2025 17:01:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, s32@nxp.com,
	linaro-s32@linaro.org
Subject: Re: [PATCH 2/4] usb: chipidea: usbmisc: s32g: Add a
 REINIT_DURING_RESUME flag
Message-ID: <aD2uuP6Tx9NH7wVg@stanley.mountain>
References: <cover.1748453565.git.dan.carpenter@linaro.org>
 <b1ddbc5993b2906cf916d023fdf27b07088a9672.1748453565.git.dan.carpenter@linaro.org>
 <aDd/pNP0jt73PKtb@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDd/pNP0jt73PKtb@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_070134_264998_02472BBB 
X-CRM114-Status: GOOD (  12.19  )
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

On Wed, May 28, 2025 at 05:27:00PM -0400, Frank Li wrote:
> On Wed, May 28, 2025 at 10:57:20PM +0300, Dan Carpenter wrote:
> > From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> >
> > The s32g2 and s32g3 chips will need to re-initialize in the resume path.
> > Add a REINIT_DURING_RESUME flag which will trigger the reinitialization.
> 
> why power_lost_check() doesn't work for you?
> 

Yeah.  That looks like it should work.  Thanks.

regards,
dan carpenter


