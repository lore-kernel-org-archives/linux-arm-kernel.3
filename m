Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB07C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 14:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJhuQ7RdzX4335yHFkIwjS6KGL5adc0rcojL7oXLCRo=; b=zhYdVxv37pidTpYjzjEq9MIA1a
	pKsEMgrabL0UKI4laBZu0jzj22ahI7AIOym7To7zRz/0HeFl6jOa7CjeZGbnn8hRYXIUwuY/JhoYT
	rOPAFLo317/gOWtF7Tf5xP2WU3AS9z2AXubRhvflzVoV/qYBOohlTukv7jmNCtYWDYGIwuH5sUzYJ
	A4WRGyh4IdCwR+cGPHrsWqtjkgBL4irL7qjlmPElWPHWUG1i7Fz7EfBAFs88RKzkG73BOYy6kI8ML
	sYKdwhMB2girb6rjhIksza5G/21CkfxN1br497ItUdj0Z9RRvbzV2tjXZlZ/prEPYB+E/Qx3759dk
	WpYZyxtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOd3L-00000004Kr0-1Cfo;
	Mon, 09 Jun 2025 14:00:43 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOcxe-00000004JDb-0fbp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 13:54:51 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7c597760323so460086285a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 06:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1749477287; x=1750082087; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TJhuQ7RdzX4335yHFkIwjS6KGL5adc0rcojL7oXLCRo=;
        b=DqkQN8RHNUqhdvprlE2g1fnVcUKqe3ZQyay9Iqu/XroWXtWOONvTFEhCtkxFrRBb6K
         /5A7LsrB6DiYttfyByW1o3cis9kVc7MbGgY+tiQtkWyGScBPbmEemIcBbYttprw/WCQA
         i+jpQa1TFz/DLIiMhqt9X7jJlQyIBU2hjnLEIAQxpSMRwXv63tLROhMxhz+teVmJlatV
         G34FsqazA+JUtHx833/Ujh86STXI36jGUgGihfwuXJhyxkv181L/gxO6AIqEB94YtYe0
         rjhfFkbPeDvDv7svqaSMXCp76+m7yMsDMlDDpwh03OVA5dBLbynNF5wTWOqQtKHJrZv6
         /xcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749477287; x=1750082087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJhuQ7RdzX4335yHFkIwjS6KGL5adc0rcojL7oXLCRo=;
        b=wM8ZHHQq3eR4KoBrYwpfVUP6v0sHXG6UTxkUVGx2bAPSWD2ICC1l1VhLPG1G7pGVzF
         7wlvaLDtGgDC671hG3hE9RXF1is8JZmdc1peGwlqI4IcVCAcdd7gWFjK92cEe1/v+yva
         jTaPT/EcroE9LH2WadWBaqicCOee0dv0leaeTbse4/71tkESMOdL5FjE53sHrM5mN+6G
         RY2n3muIbwju+L5/OgLv15GiUYeSQuNwDpcGLfzcTRX6K4ZihnoFvMjUuXizoB82Bq6L
         H/xnCjPIylB+R/P7o0GzwIRdiDGGkhQ5IOqmpULAdayR24/g9ZKSkAkguXgB9zNCsX6r
         PfUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaAYqYPFvrPW6QGCgxUTV7pU7Ut8J7CaFabexyXkBE1ROl7FcNIy7Z0x3sQPrhoyF3sbsOFOJe2VGsltbM6SeN@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp8Qiphho2GI/Puj9Wu3eJWdVKacVGfzpIuRgKDcy0ssW6O45R
	sI0/ILYC8LCpwCINaXPc92k23WnEm4ZHJ5j1VvHGHzAFmjLjst1wgrk8lQNybeGUSQ==
X-Gm-Gg: ASbGncvLKFYyTCbEZUHRHgl74bcJAaXL1aHigMO6o3p/Chw/9vyC0mLZ39Ux8LUkCHc
	Z5P61tRPEMWgxq6mJe5IVyJhXH/dm88dE6uRpFb+NDx4pOvwa62I9XhCqMmpfZCkjHNI7JBma4/
	N+M/6wZwkCdXN4dRFqyp6eC1PB65wX7F7CBMIhs641gxqEa6tLoPyclh0SMALssTr/81tYRsqjJ
	PetfUtqR/kt2l8+6X6XhKXrTkkLvhVsrCxsskQIOgGcGAu1Tjsyzfcvph97e6OSH8WGLfcpnzsh
	qVuA8amUmu01rS/lXD2Rd3cNGHmrnv8auUsB2SMuMdz+3/K4lsCs24IPaQB7rHuBePnKK5kvgXR
	fLlvB
X-Google-Smtp-Source: AGHT+IFmfPwn0la8Bjg0x9fgItMpfqDL+xE2KxSEQfR+WeIFu+KstQKcIkZH8uGDncVhKeEIwi22SA==
X-Received: by 2002:a05:620a:178c:b0:7c5:962b:e87c with SMTP id af79cd13be357-7d2298ce851mr2069583185a.44.1749477287608;
        Mon, 09 Jun 2025 06:54:47 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d25a535794sm545282185a.26.2025.06.09.06.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 06:54:47 -0700 (PDT)
Date: Mon, 9 Jun 2025 09:54:45 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Shawn Guo <shawnguo2@yeah.net>, Peter Chen <peter.chen@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: i.MX kernel hangup caused by chipidea USB gadget driver
Message-ID: <c7bfdfec-bc49-4ce5-8dd9-7a69d8e24ceb@rowland.harvard.edu>
References: <aEZxmlHmjeWcXiF3@dragon>
 <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_065450_460899_7D4DEDFE 
X-CRM114-Status: GOOD (  23.42  )
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

On Mon, Jun 09, 2025 at 07:53:22PM +0800, Xu Yang wrote:
> Hi Shawn,
> 
> Thanks for your reports!
> 
> On Mon, Jun 09, 2025 at 01:31:06PM +0800, Shawn Guo wrote:
> > Hi Xu, Peter,
> > 
> > I'm seeing a kernel hangup on imx8mm-evk board.  It happens when:
> > 
> >  - USB gadget is enabled as Ethernet
> >  - There is data transfer over USB Ethernet
> >  - Device is going in/out suspend

> During the scp process, the usb host won't put usb device to suspend state.
> In current design, then the ether driver doesn't know the system has
> suspended after echo mem. The root cause is that ether driver is still tring
> to queue usb request after usb controller has suspended where usb clock is off,
> then the system hang.
> 
> With the above changes, I think the ether driver will fail to eth_start_xmit() 
> at an ealier stage, so the issue can't be triggered.
> 
> I think the ether driver needs call gether_suspend() accordingly, to do this,
> the controller driver need explicitly call suspend() function when it's going
> to be suspended. Could you check whether below patch fix the issue?

The situation is more complicated than this.

In general, a USB gadget cannot allow itself to be suspended while the 
USB bus it is connected to remains active.  Not unless it can be set to 
wake up when a USB packet arrives, and even that probably won't work 
because the wakeup sequence would take too long and the USB transfer 
would time out on the host.

The best way to fix this problem is for the gadget to disconnect itself 
from the USB bus whenever it goes into suspend, and to reconnect when it 
resumes.

Alan Stern

