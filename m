Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DDEE8B397
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 04:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCf4lzrMziBndOsmo8GuusOdBN8cx0cDMD3sdQZPXW0=; b=dTUogtfFU0phumgSKbS+XIgFyb
	n17/IIHQwNr1C9EPZk+jtoSJE0gx4Z1m9ffCtMZTDTltfPBe0ut0SRLBqL4IHhverdlYkZBOGVmHJ
	pZGjHzsuhpCUDoB6V1BCrN6A1/Ga7uGbhzrPSXteyRk8QKHZhodsCTQfzKIiTEv3aIYr7AEqFUpJM
	6LHxvEmSfxSBxoy5e9R3hNAphZUl0sV/YLKAAs+52l57AycSWRx7PbPCIAoyDJb3y6C7BlzHLdARq
	Z8gHEDGd8M3eYw7HfGItajvbJslxVTT3Wo02TG770i8t5TDbJKpLFsF9NWO8Y2tmJSOj1q8ofbuYF
	+0x72Mtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnU7T-00000007sgu-2wen;
	Wed, 04 Feb 2026 04:03:59 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnU7S-00000007sga-0RE3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 04:03:59 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-8c70ab3b5fcso863431585a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 20:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770177837; x=1770782637; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kCf4lzrMziBndOsmo8GuusOdBN8cx0cDMD3sdQZPXW0=;
        b=LVqaxekKCX4mJs565QFis56ZVfw+d+nAY5Ln9MRrKe/L/Z+S6bxh16bpKuYqrDZkdX
         jPAdtRhXYhrshHx+K2bUYSiHwzgvRpWA0vwSDSa6s/jt6bNNXVNGMNDEvgvk60sPGjV6
         Ruf+ZkFd5rKDmSzlly/gWPwdpSIFliS+b0akxHav/1RfNCaOeOxYumptqDHlEEiOpfNP
         BmpIREQAXs/o5HSBx7xD3P2eLRsSAtcuEk78k0v3GROEOqJEYlliGRFzzHHkRHXgoSgJ
         cWrIuBWBv4Ije4N+MKSfz3nfbQWLpSBhs4KTRIWkFj5uekbGK0HRwZgmX9mrGZgXsAuf
         QvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770177837; x=1770782637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCf4lzrMziBndOsmo8GuusOdBN8cx0cDMD3sdQZPXW0=;
        b=DA2lhgMnAzt6KBK2KDI4TCkyNQA7FQkqiNgl3zHVxBnO+9KpSbL6xN7/58XCxsV4eC
         JVe1S2vYdO9mJBo9+yumgJXWeVxyvk6zpieokaxO1aPKpL2KCx8vTjFlUBJ+aBJsM5OT
         K6fTeziPvMuUqoNkN60IkYOzVcGLBd0baYiv7qfbapjUbXD8SQZmlEa3Y064MAKOqGXn
         u6TFUQ4Zu2mqhPlQMuRtjIoSjQZ0HE31zwhP82FrhqWe4gm24PQNVErdlBbdeg532CVM
         hyNfAyWgtyZnzzYZx3xksVidWU36OYqY81w6u13Y+dhDCCqHtVCcmsRjQ+lVID/6x/Vi
         VEfg==
X-Forwarded-Encrypted: i=1; AJvYcCVkpB0l4vb9j3/m2EErAcjlkHFy/M+VWR+0VUdHL+hfBiH7WkrxOVWI9hQ7pGomHA/T/PVxBo9ufUaX/GYQOqG/@lists.infradead.org
X-Gm-Message-State: AOJu0YzuNU1Fq1U7+lo16NPKR0zj0NnJSNBKOttfttAYTi4nyHyI5Oni
	iGSL3TFreNaqle2j1ogND8+CTSwG4PKHTRF6r6E8gagsxEiEjyYIe9B9
X-Gm-Gg: AZuq6aLc1WzBydN3WCppVyRjhQoQ9AqwUrhRs+e61mUMvIRhRc1ZJQhIEdq5PnMXFpc
	evExfO29QtuLldTI61ZE6O6ych/nqhHbS68ZiF+Kenhggds8Vq4vB3n2dlRvuOdUVPtKCv5Y566
	m+EcI42GZeseX2LOy0FYwpQniku43/F/QbfPYiVcQMQhbNEv2hp2mMqw/qcxLP5FPZHyYAQuDpg
	XbHhe/4ZwmJGVkFnuVX1e32Ii3ZMY2aLFBEqxh/Oi2KkCdwn4sJtOhfkg0ISRlky6J1s9NiWoWm
	VWo1L48Sv02mMOc4V4bbyrfpOp4HULflcve4haSBnWjMnKgx2g9sCfBPhcOwgmS5qqTzYUF7pM3
	s9KiucJfcHDZEljcQykiAKox6jYISKAvIZb8KanGzHZYony9sdAIxTHTbW6dKKo6uKykiIUhrM3
	rAZoBmIfnLmhPKGVi+cQQO
X-Received: by 2002:a05:7301:7003:b0:2b7:32fe:4bbb with SMTP id 5a478bee46e88-2b832895197mr603971eec.11.1770171121283;
        Tue, 03 Feb 2026 18:12:01 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832fafc2fsm746589eec.24.2026.02.03.18.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 18:12:00 -0800 (PST)
Date: Wed, 4 Feb 2026 10:11:36 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yanteng Si <siyanteng@cqsoftware.com.cn>, 
	Yao Zi <ziyao@disroot.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Zhi Li <lizhi2@eswincomputing.com>, 
	Boon Khai Ng <boon.khai.ng@altera.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v4 1/3] dt-bindings: net: Add support for
 Spacemit K3 dwmac
Message-ID: <aYKqh7SmoHO83Avr@inochi.infowork>
References: <20260130022705.1059214-1-inochiama@gmail.com>
 <20260130022705.1059214-2-inochiama@gmail.com>
 <aYIyuulFADU_j3V0@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYIyuulFADU_j3V0@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_200358_147447_4EA60CDB 
X-CRM114-Status: GOOD (  14.84  )
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

On Tue, Feb 03, 2026 at 05:39:06PM +0000, Russell King (Oracle) wrote:
> On Fri, Jan 30, 2026 at 10:27:02AM +0800, Inochi Amaoto wrote:
> > +  clocks:
> > +    items:
> > +      - description: GMAC main clock
> 
> If you know what this is in terms of dwmac databook clock terms, it
> would be helpful to use it here. I suspect "application clock" would
> probably summarise it, that being the clock for the bus interfaces
> that dwmac provides to the host.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

That's a good point, In fact, I have no dwmac databook now. So if you
think it is fine, I will change this description to the "application
clock". Thanks.

Regards,
Inochi

