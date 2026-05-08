Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50E8CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 16:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HzwP3Am9cix1EHyX+t1xAlzk+rVx5IRrzJL77MoWOuI=; b=OW5lMrkLbyl2wBvceP8ct8WIjv
	jQOU39f/11AIDjkFefqrSaKiRuiqkXyUueJj47v2VpwINnZq8gomY3WuSPDxT3+StcwZgFfsrFr3S
	eF8atbk6mRPCwSOp2fVjmYMYXlMe0iOHgqRSE/k+ex4YmhEwMo20CO7HAhTR0yKdld0WWzv+ZlhFr
	lOB8QXx9cD6ac1M1KA3/hXHK2PmD24GYDTk8Eqfgwv2tvz+C1MTHO3uakcaib/5WWTFae3bJibwPy
	W96nTJtqUG4QyEsp644eUe6zvqHEDsjLebEllTEdw/sf6U8RyWr8C9kr4soMEDcJl9MMqtWSkdTor
	rEm6hDSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNhA-00000006wTT-23UU;
	Fri, 08 May 2026 16:04:56 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNh7-00000006wT1-3s0x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 16:04:55 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so20719445e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 09:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778256291; x=1778861091; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HzwP3Am9cix1EHyX+t1xAlzk+rVx5IRrzJL77MoWOuI=;
        b=AYAAxRdrPFjMFUB8lz9R+BLVH6rAH9sEGQzRXhwHCEw3ZEenAYGxrEVHZeZzL1E9bh
         2Xm1sc7/BCR87lrqDxWi5tBq/GCChNARS6QcV06Iv8Ht7MtG6bIdRDHyqTIIZ+z4gmmF
         FSh4glSwDBXgA2ZB0S/zpb6esSPGp+euBUf3jiaDO7cCxNkK56uHFlEJsDj8ZtfqgkRU
         kwV2bY8cLuTjGBgYuCkgh0b9VuePS1UlwgDQc8HA2y67GtS0FPZYE6R/MLhf29O2jA57
         HEGQz3W5hCF6/yLES3R8FPf3jF1QeLsCAVks/N+D7RJbQ3tAvT4RVMAIm3ZIy3YICX0M
         q7wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778256291; x=1778861091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HzwP3Am9cix1EHyX+t1xAlzk+rVx5IRrzJL77MoWOuI=;
        b=UcHum7VhX2VpVOMvmD/FH9shuTZbhOGZd8aMauOMye5vVIRxPP37qMuMW2EMsp8arh
         RJ1fF69CIW8rEWQspNFJ+Pn7jCUhNBnPCdf55AXcek5s2/ckYp4CyQnW+6XZbz/Z2uO+
         0XMzTVxmXmNuTBsOMCtB8sz2yANZpUZtw0WCADAOeopiOTpAarY8jGgA0JSeAAwELIKM
         0CGvC/e8AJa8a9TwEHiJxQoToiX8ByqLU6yfQ6nijuK1LMeIiA7jDQm3A6vJnpTZBIfp
         3SGhpcdW3Q4bMS7S93Z1LeanmkYNeYyOm2Zx+KstmxqW0X3BDq3vH14WSzE1uqOgv2E1
         2I8w==
X-Forwarded-Encrypted: i=1; AFNElJ8Ec2N9JNL0Q+BqNw0oP592rWQ0LqABJOv5oVC+qgTi59R1KKmomv52FS14/fnnqotV8dLfYrgYSrj7nthKsyh9@lists.infradead.org
X-Gm-Message-State: AOJu0YyYg23XIHCSx0GQ8WLB8H6fcEB1Nc9sU3S5VSj5Dh0kELK6qzwt
	5q+papPuJxGG6RuJG5RWQMf5Rgl98aBHvRmeukxaLnSAit4gg5dBkrva
X-Gm-Gg: AeBDievJ4CgAygH47rozTB/DWjI4S4g8u5o/sZCH7sMlZdsiHqkCxuF8krnxbQBMYn/
	mX7ir70oBXNh/L9yvHvfug/nCypgHiom4m58foRgE+mkDCjM3lMk/HfRkoBmcYWwqahjL5fqlKL
	gSEf9Bz5uoGIBjrylFvm/VhuXo+aLN+pHQYgu8x8ZxgVimZKL6DauB0WnGmbNfMhV7Nk0u158aj
	2EW5kKMXDm6vsdQsOpZTADK3U0J4PCTmOYBmP37VK/3ZF59JBZSq/8K6rFjKOV+6UaiOkAwXQgG
	738GujlG9eoJUewQ6MLr3qlaxAMOYJ78mT7c8IT9jvP3y4Kb1ueJ4F6CwQ5baxf+oSIGinH7FEe
	AqFU7vi0s5pb/+UpH8m0aIbfLokIszafxTHSYTyKCQsNXLhaqO/+YFaSr4UhTwZpXNOJQynBK3X
	ZysBxRS0Hv8HxQ9sly3SRpLTZSleYj3tFOKR5cLdioms2+qd6r9yoVqhX47ss7Ks0yoNRmx/4JR
	yiZP98ao5XCglVSN0WhsYsT7HZ46+jfXprMQZuWb3uL7+KizBYvqZTtnzmZ5m4ezShm4zXZVw==
X-Received: by 2002:a05:600c:32af:b0:48a:534a:eed8 with SMTP id 5b1f17b1804b1-48e5dfcd722mr75004745e9.1.1778256291123;
        Fri, 08 May 2026 09:04:51 -0700 (PDT)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6dd35abcsm4248055e9.7.2026.05.08.09.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:04:50 -0700 (PDT)
Date: Fri, 8 May 2026 18:04:49 +0200
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, jun.li@nxp.com, 
	Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH v3 3/3] usb: dwc3: imx8mp: disable auto suspend for host
 role
Message-ID: <hsyy2owzbt7tsljktlrz5g4bnrnecznvcyy6zxt7gfyxb4xvgi@ysko6xe6h2zm>
References: <20260108081433.2119328-1-xu.yang_2@nxp.com>
 <20260108081433.2119328-3-xu.yang_2@nxp.com>
 <k2sxmwhrv3tivustfnpz54ehuufkcrcruu2uuukuyugqtqljzl@5roxndm5fn5u>
 <jjwlrgusucoacaye75uqfuh76a4jhdv3ivzjuemgusw3trwseb@mymuy62cptxp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jjwlrgusucoacaye75uqfuh76a4jhdv3ivzjuemgusw3trwseb@mymuy62cptxp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_090453_980887_E7A2068B 
X-CRM114-Status: GOOD (  22.47  )
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

Hi Xu,

On Fri, May 08, 2026 at 06:54:40PM +0800, Xu Yang wrote:
> It's strange that link->status is not DL_STATE_DORMANT or DL_STATE_NONE at
> the time which means the device core may not properly unbind consumer devices
> or handle something. The patch does a simple thing so the issue may not come
> from the patch itself.
> 
> 1639:	list_for_each_entry_safe_reverse(link, ln, &dev->links.consumers, s_node) {
> 1640:		WARN_ON(link->status != DL_STATE_DORMANT &&
> 1641:			link->status != DL_STATE_NONE);
> 1642:		__device_link_del(&link->kref);
> 1643:	}
> 
> Which kernel and dtb are you using? If it's a downstream repo, how do the USB
> controller and related DTS nodes look like?

I was using kernel version 7.1-rc2 and noticed it while working on 
sending the Aquila iMX95 upstream.
https://lore.kernel.org/all/20260506-add-aquila-imx95-v1-2-69c8ee1c5413@toradex.com/
> 
> Does the issue easily happen? Does dwc3_imx8mp_probe() eventually succeed?

I did various boot attempts with the commit reverted and couldn't 
reproduce the issue. With the commit I ran into the issue in about one 
third of all boot attempts. So most of the time dwc3_imx8mp_prove 
actually succeeds.

> 
> Could you add "#define DEBUG" in the head of drivers/base/core.c, rerun and share the log?
>
I can provide you with the data next week.
 
> Yes, if you use the new driver, I think this issue won't happen at all.
> 
So once your work is merged in the imx95.dtsi we should be fine.

> Thanks,
> Xu Yang

Best regards,

Franz

