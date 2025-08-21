Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC448CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 22:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmT4+9q+WF2xuKvhWm+16FMNcdazw5pWXArjlhN4f28=; b=Waju9iDjGR/tLecFqcndbDrh/5
	KfTdVVlo3fkGwincvXWCvbP6JKKWCHJIOasv1Xl627HQ7cypXvQvghMNk1GfG0ae7RbSGyVZ0A7AX
	Mt8tBGqTmX2XZcrXZJw3NEmIY06r3+1qP6Ce5ieS3cU2ue5hxj9+XC4hiPNXct8qeytftyVfuNwp8
	oVFLvJspekCXwS1qKzgeEjvb3ErhfmsWHXQC7PqvyASNPdYWdP9D8gEfKjmXwTOeUzD7WzyMpAbe2
	aaMYIJqOWoHRzshFeaBYAsQkgTC1N2QqfwH5o09ihjXtCVXJAgIor2EZNtlgJXtyXN5kO4IDbWwPp
	ccUMZitQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDsu-00000000kfY-2Sr4;
	Thu, 21 Aug 2025 22:35:52 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7Jk-0000000HPaP-3QMQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 15:35:10 +0000
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-afcb7a3a085so192920566b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 08:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755790507; x=1756395307; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bmT4+9q+WF2xuKvhWm+16FMNcdazw5pWXArjlhN4f28=;
        b=YoODzjb5vf8qDkoTV3+CG1Gpvz4kN8CL0q4W7qE7GITNBFrqubbMJBDEuCI9J21oM0
         t6VNhaHHJt0LcljQIIPi2ycxa/Z+1dnCkRTEQcgFzkAqmeDVxNhVWO8yXC7EEb0F6SAg
         tbEnBtRkfBhrmoldNgvMrZ1ykeR2oCPtO1XxG6J5cbdsUW85zL22OEJDByXXlcTHZnG5
         bsRaRfAtj8OF4+xY5L0WjHhFY6ni4tSPUYXghjKj+ROzLKkvzdIWhCs+NJLUlnErXI7B
         pkGuWFVluuQkripVLHwP6JRNgLfdPGB5YVx61pU3O5jL5aYuUUv+4FXQjq1NaHsnVM7o
         lmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790507; x=1756395307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmT4+9q+WF2xuKvhWm+16FMNcdazw5pWXArjlhN4f28=;
        b=iJ01cA5mEINvJvaVkHDNQw/TcPat8Jcjq8UcspHxsyO7Yj9p7a4oxci+V1NhTdiFBP
         bIGs9VEy+8AN4EmNIDUF4moQjIjhVG7AQNmq7OAVwlK7GHuXAun2AIo82upSijj1hozs
         A21c7cd+KZXibLPfQqD9RJ5crYjCVyz/Nk8UfkRh9/UoAfuOpg+rXzVpohTmZnih3GbM
         rGkyvBsEr3hi0V30hUSfLr8HDf8EoMXBqhe2he0/pXUpPn9vBaQb33eN+gww66CHvw00
         mWFLH8vr8yzYu8P06JIx1Qdg+i/9SOeSNCamifq72HtCwVFVU4Xu7yd4cAD+Q8QIwSnQ
         xcMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJOMaz7Eke14xBi+MDLZ9OSyzqRXgOzpBonn7EbPBblQFXb6NJmO2760v9/rgECQ5qGVC+x8Q5x0vhVhgfJxVo@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5PiAZ54dDNDqq5ZMEs1VD7/mOsfRjfMhoqnHEM2uZ+nJndcQI
	tbeaDhSKQDGf5C3PzhW63pF0i/AzlWbqhXqEsiQ8PusKC0iMxjp1cuK5rX5LNGgOf1I=
X-Gm-Gg: ASbGncsprrf+0k+TB8tZXatkKzNxc2E+BrkNuy+begGmEubF0j/JPW5U3OlsJKPfRJb
	0FsjjxA7MYrqSoCQVToJcehBTvQ1C8Xm9hiK1/bBlc2fQg5pOB1I4Rqofd72AbG1/OJc/jn6vfX
	9FU7eaPKvFbN7m1RyEsRohnQzJ5XHA0W5T6RJ3I7Jq3P/+j5YhgM9yUQL/24c6bIUjY+e1zbFmK
	jMoswGYGwl+rAde6E5QO7GCP+po8GkaVA+E+noawkqTs8C9hO4H80MNkx3/gLtIKSOIA0WSdO1b
	zDg95QSjIBks0JLJYVfOp7XoOX98Uh2mQ7CWLSeKRg6GXlTDJ4Y1tqonn7vvPXa27xNyBstT4UW
	JJqu7rnxqwC06CK6DlKcYcpQrJlVX3uRZdohta/m6okdrxJLkikHZGDWLpaLH
X-Google-Smtp-Source: AGHT+IE6i6MAcGkPSHSM0qg6lud9wFnrIlBRLuMIlOpoA2gcWkZO7oMKz2wMyUruTfC+VDFOVZS35A==
X-Received: by 2002:a17:907:86a7:b0:af9:d7ba:4dd7 with SMTP id a640c23a62f3a-afe074c7c05mr256732966b.0.1755790507054;
        Thu, 21 Aug 2025 08:35:07 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded539d39sm399697766b.110.2025.08.21.08.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:35:06 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 21 Aug 2025 17:36:59 +0200
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Andrea della Porta <andrea.porta@suse.com>, linus.walleij@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	florian.fainelli@broadcom.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, svarbanov@suse.de,
	mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v3 2/3] pinctrl: bcm: Add STB family pin controller driver
Message-ID: <aKc9G9owEfYD-_qM@apocalypse>
References: <cover.1754922935.git.andrea.porta@suse.com>
 <bb746d2fd50ecbb9963438fae8601c2e4901a126.1754922935.git.andrea.porta@suse.com>
 <6d812c08-341f-4f7f-a9ed-4545217cb8a8@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d812c08-341f-4f7f-a9ed-4545217cb8a8@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_083508_861199_BE1793BC 
X-CRM114-Status: GOOD (  19.68  )
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

Hi Stefan,

On 11:18 Tue 19 Aug     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 11.08.25 um 16:46 schrieb Andrea della Porta:
> > From: "Ivan T. Ivanov" <iivanov@suse.de>
> > 
> > This driver provide pin muxing and configuration functionality
> > for BCM2712 SoC used by RPi5. According to [1] this chip is an
> > instance of the one used in Broadcom STB  product line.
> i'm not sure about the whole driver naming. The cover letter describe it as
> "pin control driver for BCM2712 SoC", but this patch is described as "STB
> family pin controller driver". So as a reviewer, I'm a little bit confused
> of the domain of this driver. Is it for a single SoC or really for a whole
> family of many SoCs?

It seems that this is indeed a whole family of which BCM2712 is the (first?)
incarnation. I'm not really aware whether there exist other physical
implementations but I'll amend the comment accordingly.
Please also see:
https://lore.kernel.org/lkml/d6ab66cf-09ac-4f53-9102-11f207d16db5@broadcom.com/

Many thanks,
Andrea

> 
> I'm asking because all the other BCM pinctrl drivers are mostly SoC specific
> and not really general for a product line.
> 
> In the former case, I would expect a driver name like pinctrl-bcm2712 to
> make it more clear.
> 
> Best regards

