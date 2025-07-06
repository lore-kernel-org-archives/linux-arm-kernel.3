Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CFBC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 04:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1y2FRrOTA68hlJ+NjGl+jIRexDC9u6D/zy0MCfqEVY4=; b=Es+7NdJby9pr8Wt1BzR/GZUrh1
	nTucXf2U4aWbD6rYcLdjQDEmG1/6KFvocj4Ihw5aC4ngGMWFxj4AVjD+DMt7EnKFLDNSd5RK+xflG
	hgFQ0Amqib4RY4KFtuL39Dv/Zs0msIWMIfE5HET0BCP2Ooc0brY2I+R0BlkJnVbP38+GE9relg6AT
	th22QNZgC38627bvze1ihFMe/dK/Jf///M32O4fhp4YO6lTHqBNgqozQPGNW5v1G30t0xEHCo0yhR
	A8kogxPPkmrc3D1+pSHoLnBV59XJLP6eSmaVaFzb8pPO+UqXAlqMomVK9deG5t202fgUnU6uT0cLz
	bZMabsgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYHKc-0000000HOPz-3hIt;
	Sun, 06 Jul 2025 04:50:26 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYH7t-0000000HMyi-452K
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 04:37:19 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-74264d1832eso2563831b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 21:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751776637; x=1752381437; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1y2FRrOTA68hlJ+NjGl+jIRexDC9u6D/zy0MCfqEVY4=;
        b=UO8KpuCtVybizzhGseoTdbIY1J/+uuw4qtVye3jRZA4q/STijN+zVgywHEAnfY0Jxw
         tQwCJDQhCBXkiEPC9L7xrQTV7nEzuJb29sL/HbPSr/vFF+Jw3wyU81qKAFdgwGReC09/
         Gej+66ZswfE6wvIOr8z48FEvmJ6YfrlYGEBQvzkAwKMQy2uG42v9RMlAimwnMdYJgy82
         QgAVKAbsr0TRcFPIBABt01kB+c+Lg9tDELJeR40To+9V9h7VWW0S/fyBHqw/Ua/uq4rP
         izM9XVxiA2JN8KFHrwVQfOF0+jibM5Ff0yd3aIlKnXX7AerXVQeqMwoNhhE42O1/CJwz
         JPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751776637; x=1752381437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1y2FRrOTA68hlJ+NjGl+jIRexDC9u6D/zy0MCfqEVY4=;
        b=Mk4t19bpa9fLn1C5E849mZyQgu1SxMozgZmSzSgFEh0GnnxoJTHPHDxoZVdBYLwrRb
         NPmFWER5+8VN7wsb5nQLxOJhUtXWVmzSbeqMO4LGlCTqKm8Unk/cSgzEqSHj5YQAQ1ju
         oiXJOUjP/nY4QSvd5QKtplLGWO/gvlafxOZJnjfO4RyljixHgx4ywznX2Vosbu3nxRrB
         qMnplmeCciGeZ+hO1aD0SCoLFLYXQv1J/9nb6oP3NwM3Ez4wB5cMR97FoCmRn5uvAvBv
         kLO1rk445rNII5LpU6gy9f+VvcSJdbucwAbjnul6LlmWzVnO1DnMte0QpQccbl3KCeNR
         sYkw==
X-Forwarded-Encrypted: i=1; AJvYcCUi9KkNO4CYDVy8BgNDadEMUFZwnrb9b+TBLJIzkim+DD7XHPIbha2hLWGxUxWCI/pmX1J9nkEMMiWTwO6C7y9w@lists.infradead.org
X-Gm-Message-State: AOJu0YxF+dtxCjEWobd6Fdpvamqhgw3FVWRnbqKKc9KfsW2M639XZtWT
	coxTw9jdw/L5RytQ+mFHZ7K48LibuisqMsCbMEmnAfdfbF1EPNYAMNMg
X-Gm-Gg: ASbGncv6qCg1wojlCsfg++9VGVCDMWo9NsaDaH4tDqlLsp0zbpAXDu9jeIqNc+w84BZ
	Pn6JcWJrkukZFHRkODdYBLYK425P/ptTBaM0a6gyOrbYN9ztHA56NXCRx7K7duUyFadSAOIqPFa
	FNK7nqi+zu02tJPVk0iUXJKDAnNmefKAirelQlbyKc8r2KhI0mo+3/+xNRkpHsbr8UFXch5o+LM
	BOdy9gFJHI6577442pq8zzp9X5X3yc1hqmGgsE76pAM+bOBGZdCxZSZ+y71WmjZWC2FfLYmrj4c
	lUTwMNFiI8eppkUWiSxSWtVAfovd7FO34W1Ji1Bw7wNIDZIcTzCiwJ9fnJAOxOIc4JZGlajd44E
	pGBrRPFtAndFGC/a6DXo4YsAosOCVJL/mbXPOIS8=
X-Google-Smtp-Source: AGHT+IG0ByxlfHWwgJ+AcNjU2yUsaqNnzgD75XgpxrmchkB3mZY7uDwPyNr4YJZ7aw0VrdPW/p4HBw==
X-Received: by 2002:a05:6a20:7f9e:b0:220:658:855 with SMTP id adf61e73a8af0-2260a69f74amr13517414637.13.1751776637206;
        Sat, 05 Jul 2025 21:37:17 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee62b1acsm5577847a12.56.2025.07.05.21.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 21:37:16 -0700 (PDT)
Date: Sat, 5 Jul 2025 21:37:14 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>, Tao Ren <taoren@meta.com>
Subject: Re: [PATCH v2 0/9] ARM: dts: aspeed: Add Meta Darwin dts
Message-ID: <aGn9erhghE0Bpgl9@localhost.localdomain>
References: <20250706042404.138128-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250706042404.138128-1-rentao.bupt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_213718_018247_910071B9 
X-CRM114-Status: GOOD (  15.21  )
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

On Sat, Jul 05, 2025 at 09:23:50PM -0700, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> The patch series introduces the initial device tree for Meta/Facebook
> Darwin AST2600 BMC.
> 
> Patches #1, #2 and #3 fixes the DTB warnings in wedge400/fuji dts and
> ast2600-facebook-netbmc-common.dtsi.
> 
> Patches #4, #5 and #6 introduces a new BMC flash layout to be used by
> wedge400 and fuji (and later more Meta Network BMC platforms).
> 
> Patch #7 moves eMMC entries from ast2600-facebook-netbmc-common.dtsi to
> each BMC platform because eMMC was removed from future Meta Network BMC
> platforms.
> 
> Patches #8 and #9 adds Meta Darwin BMC and updates devicetree bindings.

Hi Krzysztof and Andrew,

I've fixed all the "checkpatch.pl --strict" warnings except the "new
file" warning, and I guess I can ignore the warning?

Regarding the dtb warnings, I've fixed the warnings from the individual
dts files, but there are still some warnings from aspeed-g6.dtsi. Are
these "known" warnings? Or is it because I'm using out-of-dated
dtschema (2025.6.1)? Please suggest.

Thank you very much for the review and feedback.


Cheers,

Tao

