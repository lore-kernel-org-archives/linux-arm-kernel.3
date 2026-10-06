Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E196CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYZusaEHeQJp9+PNNGappmpwDZuJKs0VI2BXqV5hxv4=; b=FAnAjRlVYaswMNXgpdnsEU5h4k
	HhQtdwivNHE8ACOyMiv1Kr2QYUMkmtbL8Ijo0sLJKOjQl7wtAWNFgkdo1czfCfB/LiOInwj0LJUIM
	sAmUgKyMO+vnPCooQdWqvKH66rlerRrwVx+7kgNJ7/7WIueLTVz+/j9GgURaUiBLMBkKVettD50dp
	mLbsqHj46cwBmdCoWwoDsJbMY5A0Or5nZ+8B5BS6BO9Pd//gqiDntnX8JFHEqwIzzWEuE/8VdRI0m
	19aHU72HxFApAb0L4fnIUa7xXUiAYDRVgFwTf1LoJMKD/5CVN0C4cp1nksHLqibPXrGra5FMp1UM7
	s6LpeDqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2iI-00000000YmK-1l2l;
	Tue, 06 Oct 2026 10:48:02 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2iE-00000000Yk9-1P3c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:48:01 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-917a9f42283so32832796d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 03:47:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791283677; cv=none;
        d=google.com; s=arc-20260327;
        b=nP9Bn/inlTUtUeSc6NRXUk49tl0hgulxPktqPzY3nRCk2J3dtPJ7DO4AvOKTVp7SQz
         ztM1laKdMHwPtWVVSHeDcf2qitekxAieFJlUWRVl6X55W1+5AIksm9DROHAfoIkafj26
         G8oetPLuTIqdQCfz79zeIG5wY1D/lBuOcxf6kcoihJdwM6z7Xwe2QLSedM7izk9J1QkF
         ujx8UWPHGVpmGW66QfAIW7JAjRmx9X2M0Dsrljy5g/Hn0rkDVPuxaIi1XgIVNkp3kjjH
         mpoP0M7SII+/Dk11YDDb1VBt9e9Qo3h3JyWCIBpD9zQ/FmBmqlKa81WOSi8JfjROtkTZ
         +fYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SYZusaEHeQJp9+PNNGappmpwDZuJKs0VI2BXqV5hxv4=;
        fh=ojRVZ/KO3KtF4Kh15A9Q/wOGIoFa+osWcEN2UOlRZnE=;
        b=S04PqFmYgZgUAXmYVdRa5G1JzQFL3w/NmRUFpz3NXl2Oo0Oe4E3W+4qOytoDDQs0aX
         2Wd7Fu9xpyDN3ITfd7W5DYoZ0Fz9zy4i47e1f4perdGFyc1krUZfp5UfUWKy8jW4eob5
         BtubmVghgdWYlbhN8NOonw53WyOmKb7y2h7ScTlZTWqsU91STaIMIFf0eD15ojjynuNN
         s2Bay+k0aOeSI5dGEsu7gbcgdVad0HNKFH7HC9YNm4DJzVEoxIqWIliIptIT/+iT9ih6
         YHBsWI18htLOVFKTXc/JuZHBt8UDA6Q2PoCnr3faPOfJWSWbXbXSqQH6LLxkBbtilPxq
         VU8w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791283677; x=1791888477; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SYZusaEHeQJp9+PNNGappmpwDZuJKs0VI2BXqV5hxv4=;
        b=Ge4Ix7kOP/dmKY+AKNxddKN07y+eBtkoHuDirdtf+Tre3VYFT/uEO4lhFZNreZ9UHH
         NO/wvRzf0nTfSW9zl9NBsZdfr32ooLwjkxkUNbs2gu4BhBVHtSAaF7Buc8VElvcIm6kJ
         zHU/gudH6FwSO4jXIUtP16nQt2iWZfu14jC9OfYJk/2v3M1vnOEDOknvQdayzJHMuFQs
         p/Uj5oR9eIXzE5vzFLBGeFwSyB3Y8O7QMuiguPdMTWR/KVGy/Jb4Peoy4tGtFO38dxhX
         jaZmh/1VlrASJha6t2kGfGklENT4/LHwH7Y2D/UdxdcOrlpJwtpoTGG7eUCHOCcOLxJn
         PUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791283677; x=1791888477;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SYZusaEHeQJp9+PNNGappmpwDZuJKs0VI2BXqV5hxv4=;
        b=Ve0WQokMkMWiTX4TAmSBHjWXus3aQihl3SO24562HaWmCPxSBtYp8BPnFWLcFnrZKD
         jHwWI9U95nL1VEORUjVx+yhJf6jiPsebJ0UMT+RR0nAYYoDIqZJ8JhafJx+xWZC9ihqc
         p956Ud5/+VIszKrH7LHjLWr3c0juBcjv8vDstDVYSqpUjEUj6wI/+/wNOB646QR8WGdE
         0/+JK4WymQ4lOPnRomURmsFXYhIzDCPx0IIj/JrB+FYVaD4zKEG6Ov0eekVULgtK9ZpU
         WUjYLH4E5902+8/+lqEQaDt3SmxW4w+hZQw/B1i2Hfm2UqUabcDY0GrejABheGAmztkV
         7Psw==
X-Forwarded-Encrypted: i=1; AKwUvBwqqONyHQuwdYyX1yj2iS0odxqxPEgwKFPJApu4hcC8/frtaVohV0q6LtAiqGBCmqaFMnXOuSrq8zZHnyWOcajT@lists.infradead.org
X-Gm-Message-State: AFq9FYL+2E3jtEL4TlorC8vCxFrq2FuFQ1sdL4GClk2Goy91urSwmmxV
	ImJ9tM/90T+XujVEd2xMLHSQ1LAyqtykA0UOSLh86tSkvbIfsMDh/Y8RQ4TIT3+dFBVlRq69tAQ
	uutg9easFjy/TMPNSAKQ+yT/RAlQUjLQ=
X-Gm-Gg: AYBFou2IdjBdjWOjaVczt4glP9R1GJzvjm+p/48jCxOSrmHZjutJWOrOK9tmKnS55eE
	4Uh9mf1siVPoC2jHW9ZT9Wrr5CbDm90ZiQbFyl9hXDXrDYZF/JUvc++uUxqCvnFpWe7wrH+eo2G
	uVIZ981aUCvTVnsDJGZ/FT+uNb8ZQg8uXfx3dpKzz7hwGP9bGQ+uJr78E0XaeX+rZe1ChUr2aj4
	HWQc87ApmO+BV9ejFgNY8Ubb1pZX47QbTt4AjPIGw9aNXwi644Ajc0XetcrUL1x975apMD7XIJh
	v5xpJ69ViJjWDnzY9y3+Uqy4x4Qblt/bmvmVc9qbtBFRJ8Xtwe0H03zg1HjsqSBYbrRZPjeF5Xz
	vAv1Y1X31
X-Received: by 2002:ad4:5fc9:0:b0:912:435f:1a8b with SMTP id
 6a1803df08f44-9198b7a05f0mr16247936d6.22.1791283676856; Tue, 06 Oct 2026
 03:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <20261006102937.10972-1-ansuelsmth@gmail.com> <asTRQ6d0-NYOeHqX@parshuram>
In-Reply-To: <asTRQ6d0-NYOeHqX@parshuram>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 6 Oct 2026 12:47:44 +0200
X-Gm-Features: AclHuK9fa-eKez1qMwGkLA8zpyrdQxMIu76X1IlFgkWsR3UIRNVxdiubkFU4NSU
Message-ID: <CA+_ehUw8fQHGef_L7YPQEf-wwuzP9km=G64Ty3+AkvM=fkNJ4Q@mail.gmail.com>
Subject: Re: [PATCH v14 0/3] airoha: an7581: USB support
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_034758_395853_1327A9D2 
X-CRM114-Status: GOOD (  18.89  )
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

Il giorno mar 6 ott 2026 alle ore 12:45 Vinod Koul <vkoul@kernel.org>
ha scritto:
>
> On 06-10-26, 12:29, Christian Marangi wrote:
> > This is a major rework of the old v2 series.
> >
> > The SoC always support USB 2.0 but for USB 3.0 it needs additional
> > configuration for the Serdes port. Such port can be either configured
> > for USB usage or for PCIe lines or HSGMII and these are configured
> > in the SCU space.
> >
> > The previous implementation of a dedicated SSR driver was too
> > complex and fragile for the simple task of configuring a register
> > hence it was dropped and the handling is entirely in the PHY driver.
> >
> > Everything was reducted to the dt-bindings to describe the Serdes line.
> >
> > Also the property for the PHY are renamed to a more suitable name and
> > everything is now mandatory to simplify the implementation.
> > (the PHY are always present and active on the SoC)
>
> I get build failure:
>
> drivers/phy/airoha/phy-an7581-usb.c:7:10: fatal error: dt-bindings/soc/airoha,scu-ssr.h: No such file or directory
>     7 | #include <dt-bindings/soc/airoha,scu-ssr.h>
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>

This header is present in linux-next

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/dt-bindings/soc/airoha,scu-ssr.h
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/include/dt-bindings/soc/airoha,scu-ssr.h?id=11952173d8a180ac05641775f80bd6946327478f

Introduced by a clk series.

