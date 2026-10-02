Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF59CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRPrTGUlYlRMvJF+ftPXWXm2emGl+fkBUfXA6bf3Pvw=; b=R48S2ab96J5A4N5T7X+hglKCpo
	A6yF10KhXlr2Ll6VWmi1M4t0aJdRRZm2qdCSSnnJP5z6GcFj+TSbWkmV9rZp61nF8aCxP8M9HRC8m
	cVYE53uC7dsDWA3gEihmLSD9awhh8aTeiEcnujwZlBhXdapPnMdJgMhFAyUJbBDOQH8UNL5rmtLcL
	CUMTTKxYcBGc4Mvbo9hSAjTSSE4SsCpYudv6KRwv6E1JG/supb5PH8UmEWPlysPFh8B70XtDY9xXn
	OaVDljFpnl1F4G/zECSYuePA8boOheZjS+wjsqQKfG37PDWAO9kXsNioQl8cTmEJtI5Eu07YrKsdn
	EjuOiGDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZN3-0000000B6oE-2IF8;
	Fri, 02 Oct 2026 09:16:01 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZN0-0000000B6mw-3AYT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:16:00 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48af929e59dso2722006f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 02:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932556; x=1791537356; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jRPrTGUlYlRMvJF+ftPXWXm2emGl+fkBUfXA6bf3Pvw=;
        b=Ms9hZIU8/0fMUfeQa1BTMsgTVAtb6A9cE5CSRtZPRAxOi8D7VT6ZFJL7E9q2bINHZx
         aEM+7vU2jgFqDtl2YdQj+yErjV+BHxV9IfdIag9I6szym7PmW/bm5RCIDWWGCTAY4toQ
         eOMTY8nxr9subrdglFaOcvrFjWRitQhNVwuwbAI+lnlPp+rEFTeZ3GrVjPNUSQVFq8qQ
         zpXL2zZ4JzXQo75B/G8szG2TQGVPbxhgcF2W/Fbw8BlZsA30OosB/m242SA5+w9noUj6
         eM6R1bxgXipsPc85wMdF8Ip41cS31gZ9EavWTOu9AA2vkTE7W2CtgS4dpUOYI6xhF151
         Aotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932556; x=1791537356;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jRPrTGUlYlRMvJF+ftPXWXm2emGl+fkBUfXA6bf3Pvw=;
        b=xbEmB35tPd6e+wgbl45EVOBzxePz8BKrYYnzAPgzDNZqCSKzBlES/9Acm7BrBbSPBq
         470EkVLy/nbRo4YJsmvq5ne0af8j+cE4Xj+5OtOO+39PVVDoRBbguudk3eu3ytvGzVyy
         iL7ItuGzuab4aSAJD+yMcfYogVqA/BDHhunTOb+xnSCE8dxq7G2s1+HgefzW50p8OFYq
         OYrwHOUK4sqolp8kY8zL10Bg69KXcEtIKFbuq1fM/L+m3J6MVuxL/T90d1idiMXZ4y8T
         v8Nm07bHej+BMKj6jYGfVf3z5iIB6wP33qAgOE/EeHXu4c1ra74PXG5JMIwRArUyhHMc
         d11A==
X-Forwarded-Encrypted: i=1; AKwUvBwf6gB1cm2z0tZVTO8aqxDI0YnVDMXSN/VAvWEIrpOyf5EnQrHISOONSRjEreOO/7y+iEFZ0YMh1yqnxWk4zfUv@lists.infradead.org
X-Gm-Message-State: AFq9FYIw7aRjcKqTF7NBSYeNSo6fVY/BD4L2G45GzdZOpcbPz21543T1
	aLQIrCirLEEF5u8oo0PHTIvOFEEvL/gK4xAYkRfW/PYW7FcjOufuzuvi
X-Gm-Gg: AYBFou1ysmMVSwWnMGAg7VEylNB+86+3+o+39rj83eVGOgGGxmww/AKag+xsKWk/QNC
	dJaNp9kbqH13nTNsQ0rNUcyHZLQTWsF/hsFPb6Zz6KE1UI+Al6sjoHvKI5HfW5gq1lZx8xyS8uG
	tv3KP/irJQutAOcmXrjdk2cHDVkM42aSq+kDExwyyb/WkZlalw4os7fWH2jw0ReS7aNZqaMQf/4
	i55HHCiWIRx5lf72WpP4vvDU9RWRDmDgZjrfDNInK+EY0mJ5c+qN8TAHaMhlJhjj96RaWfG5SDN
	b0iIQeaSDRiAENJGCMhrCLPW5FF00XqDkGxbjBEvHm5+eBiaApvxXmqpQ9uogkyPkqZD3tJ5b6r
	Q+LS18XK+JO2nyW8F1RgINPt7CGk8in7SGiK3CLHcxB6S14HZLvTyyIvfej64EjU02mr9EO0huV
	7oETKUT2PCVErnTGnhNH6NaOnA+Yv/HM5t2ICdxrRydM4QSQWzZudPu8pXU6wbdUqRF6yAT9ecE
	aACQLQHm6RkkSQwNIh8WTSjQYygO/eksZPhmnvkNhwlmTChoD8GYYGHZtUxlufYvaDrQOe9YVTJ
	s6NB/sD5ak+A5M0bQ7hE1EliQjv/av6qQkYc2dsqfALfdZ0SEH+iSDaRpoD5CpZPGMWpns86iyq
	CqNHJSWkHCpHUqzU+TFdGielXd0uPWsYC5wNYb4edRSaQhCltLQ2cr/mpMN/25JLxEMIHarBgQF
	GmsbBv
X-Received: by 2002:a05:6000:4809:b0:48a:fcec:2a29 with SMTP id ffacd0b85a97d-48b1273b029mr4027458f8f.20.1790932555893;
        Fri, 02 Oct 2026 02:15:55 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f89c3sm3966667f8f.34.2026.10.02.02.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:15:55 -0700 (PDT)
Date: Fri, 2 Oct 2026 11:15:52 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Billy Tsai <billy_tsai@aspeedtech.com>, Jonathan Cameron
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen
 <ryan_chen@aspeedtech.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: iio: adc: Add syscon property for
 multi-SCU SoCs
Message-ID: <20261002111552.000049d3@gmail.com>
In-Reply-To: <20261002-succinct-voracious-orangutan-fdac5e@quoll>
References: <20261001-ast27xx-adc-upstream-v2-0-2f9c15cc0064@aspeedtech.com>
	<20261001-ast27xx-adc-upstream-v2-1-2f9c15cc0064@aspeedtech.com>
	<20261002-succinct-voracious-orangutan-fdac5e@quoll>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_021558_814754_BF8143B0 
X-CRM114-Status: GOOD (  17.63  )
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

On Fri, 2 Oct 2026 11:03:33 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Thu, Oct 01, 2026 at 05:50:36PM +0800, Billy Tsai wrote:
> > The ADC's reference-voltage trimming data lives in a System Control
> > Unit (SCU) register. SoCs with a single SCU instance let the driver
> > locate it without any additional information, but SoCs such as AST2700
> > that expose more than one SCU node need an explicit phandle to
> > disambiguate which one holds the trimming data.
> > 
> > Add an "aspeed,trim-syscon" phandle property, and require it for the
> > AST2700 compatibles since they are the first multi-SCU SoCs supported
> > by this driver.
> > 
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> > Assisted-by: Claude:claude-sonnet-5  
> 
> Your SoB is the last one.
> 

And the Assisted-by should have just "LLM" instead of "Claude:claude-sonnet-5".

-- 
Kind regards,
Joshua Crofts

