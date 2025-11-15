Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0797ACEB2CA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 10:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZhGFSTWU2Nki77TLqMBxYMwF/Hq7Nj2xup+lQAIdEs=; b=KPKs+NP9XeOXzqYwzjCo9bhMst
	imOPDa96sgip3IxcItyIll9OA746hmBo6iaQrhLPmSecQ8Y8FOvv68X4QpyGhbtMRwDxUOu3xiI0v
	vGIqHIxFl75qUUYjt7wMe7v1pEoqpQqguyfV5Ija25yIb/IrrBunQ1+btzFB6sVuJDLcOXcPTFwnr
	N3UEgeLxDcAH+YyyLBCxLYRGf6OaAsz/hb40TbppEtrnUCC9+SwxUbEHr9tm4WE4ev3YkP74PV3kd
	6P02BKWDe8lZI/eUFRYFX8ZnxGOUvm23BQugPm3SRogd8rSDP73290Uj1XaUk98ycGJcbrcRVJJ3G
	/RjdPW9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKD99-0000000Dgmx-3upk;
	Sat, 15 Nov 2025 10:04:43 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKD96-0000000Dgm3-3ohv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 10:04:42 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso1949166a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 02:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763201080; x=1763805880; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZhGFSTWU2Nki77TLqMBxYMwF/Hq7Nj2xup+lQAIdEs=;
        b=O53lxHJ8YZIFfGdbBjfiCWC9JH9v7KGbb9d58POdKxaB+48YyzxI46F1IeBmx0DKyJ
         Ob5JN/jOGFflR9RntfMbg1NZTbiNk8qfbzovXgrc748HIdMKl6S/ATVbg0dVhFI272v+
         +Y+YQKV4Bcx3LzotiTHr6P9EkIFl03DwW2WZcozMLbx45FPJr3Qci97L4BhcgKdiCL0Q
         uuavHPFWYzGtrZqiIk3QaVcwaKQne4x3WZJjjHl4c65My/mX+52ha9ustp34+3WrWORG
         PDpuFdNxFGLHKM7D3HF/2AHI22H7fJGgj2g+W+8dAgkCcvqZ8jQVAtaLvqbMrRjZG8aW
         i8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763201080; x=1763805880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ZhGFSTWU2Nki77TLqMBxYMwF/Hq7Nj2xup+lQAIdEs=;
        b=i7v6PaqyJ2Wz3iTEIdN/4L6dRYhgWoHNwrIHjK7fwAPnF24/fTDKXD/HvJBouT8S+k
         vVaMbakgkB9vZs7AiDqLpw5rRd9DcehiEtEuZp6XKqEXVzrzy2h0xf/RtHk1HjA0hWUt
         uRQDD/XEJOgdbBppwiaofWaXJibFzMtK9f6/uC6Vvw7P3jD5JM9JCQMws1m7hsOwGmf1
         ognBYNKG6cFpO4lFrcC5hUbSWZCmnhP0O/GUxUXwIE2wdZX1/DcctYezbk9lE3lNUaLl
         +CLv9FB1oO+eM5WfKrdgAgfRe8L89auc8+pJqb2KDy2UZSOjAlghTC9IsykFPj18fmOa
         B4Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWS2MBvcm3+xeIR8HDXstj2y1vRQJ7uLU26Vjm3nzWv1vU57oN6UVmDlMzRvobSNyxf46rduGChukLa9Gs8nJC8@lists.infradead.org
X-Gm-Message-State: AOJu0YySfOKhG+byMVt8kaTHk1KmHlnZIHVwWmbh/3iCZmQNf1rRXR25
	CaVEK9SME3eAoOxmTqY7Xqrxfbcza/Oh7cLYm7PYZjtpFS+HBhrlKOgg
X-Gm-Gg: ASbGnct/KeF0CVKYl0tRgodz/eGWbk/66w6DU/nSGllu1K++dPLH/xEFvSP0U22Kpjx
	eDUEKRORgM/3lCIka+ommvwFKINFCYHzFn4nlcYA3ZFZSb+G3E2i4Beg1swa0+nOJlfFJrnPIaW
	LqP5zpIpA8s7Kz5hB7Bj6PfYOzwNzftLth3sNXva7RH5/tPc5Ma4vdZlxLuqDRVV/YIz5Nr/dDS
	pkuoFkSEhNJ6rBLKYshYCDmcS0gAmK1czwX4ROc2oEoC1z6C/bo9ZmOYIqxtKpK+RuzKwg3ECHq
	5uB83smPd6MZykFCglTWVmadW9qhcDYHMmiQwzzjuOGiOAhgZDFnFg0JbkWq05HfjF5JKotudXw
	C1iSn76mSrdy5n3t6NJub6Pybfup9VtS2DG6+iaHv6PL8w7jWae2pHgRJeR1YTmX2cCjlAjfGQY
	9dHzIWB8kw
X-Google-Smtp-Source: AGHT+IEN9KE2hfp03GE7uhiO9j7fRJeATScAJLPGVWT9cgl5CZeCVAf71AB1h38u4dnqNvb+75Hfxg==
X-Received: by 2002:a05:7300:c3a2:b0:2a4:3593:c7dd with SMTP id 5a478bee46e88-2a4abd4a140mr2291702eec.29.1763201079996;
        Sat, 15 Nov 2025 02:04:39 -0800 (PST)
Received: from geday ([2804:7f2:800b:a121::dead:c001])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49d695821sm23290090eec.0.2025.11.15.02.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 02:04:39 -0800 (PST)
Date: Sat, 15 Nov 2025 07:04:33 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH 2/3] PCI: rockchip-host: comment danger of 5.0 GT/s speed
Message-ID: <aRhQMRjffbeCeArE@geday>
References: <cover.1763197368.git.geraldogabriel@gmail.com>
 <b04ed0deb42c914847dd28233010f9573d6b5902.1763197368.git.geraldogabriel@gmail.com>
 <c8a6d165-2cdd-cd0d-4bed-95dfa5ff30d2@manjaro.org>
 <aRhNIcGcQKp2ylqN@geday>
 <85d1543b-ea91-5f0f-59d6-e00fcf720938@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85d1543b-ea91-5f0f-59d6-e00fcf720938@manjaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_020440_965987_BDFBBB12 
X-CRM114-Status: GOOD (  15.52  )
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

On Sat, Nov 15, 2025 at 11:01:21AM +0100, Dragan Simic wrote:
> On Saturday, November 15, 2025 10:51 CET, Geraldo Nascimento <geraldogabriel@gmail.com> wrote:
> > On Sat, Nov 15, 2025 at 10:30:49AM +0100, Dragan Simic wrote:
> > > Looking good to me, thanks for this patch!  There's no need
> > > to emit warnings here, because they'd be emitted already in
> > > the rockchip_pcie_parse_dt() function.
> > > 
> > > Please feel free to include
> > > 
> > > Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> > >
> > 
> > I disagree, I think the comment stands.
> > 
> > Even if we reduce to one line, ex:
> > 
> > + May cause damage
> 
> Ah, perhaps I wasn't clear enough, so let me clarify a bit.  The
> comment you added is fine, I just referred to no need for emitting
> a warning at that point, because it would be emitted already.

OK, I get it now so I think it's time to send v2 with all that in mind
:)

Thanks,
Geraldo Nascimento

