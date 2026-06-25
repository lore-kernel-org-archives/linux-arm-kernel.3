Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88892CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 09:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7XIr/SVC6sMz8goU/VKpbT2rVvzknx033F8HOJiudg=; b=kfMHLzQvc1AN17aM+e8HDs9f04
	pd7fmDUntST0P8E7q89cpLtKlPk0RYDBSIkA1JZggT2Z1bvN2Bc74yKeUjL/BUnts3iGdoLAi7DUt
	BFkOk1jPLh7X2Cf+85rWdJup3hWXkb8WnyLFNTbmD3LzM7hmJ7R4h2+NoihHySjITXVBkUsdX9DPf
	25/i68sHXz6pgpx1nW2IvzwD8XFXeGR/5TEiCIWZhX9X9Ay5579HS1HBaSgPY34eueHsvV7vKfjRG
	3ElQAkEbMRmmxAFhjfEXd0sdYgiT/DZ7jatm9xba8wS5Y5QHWWgRH/ldXKqzClIZmW1m0aunNy51d
	wp62KcrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcga4-00000008vMf-00bR;
	Thu, 25 Jun 2026 09:41:08 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcga2-00000008vM3-0PKX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 09:41:07 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-30bc806fcf8so2506347eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 02:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782380464; x=1782985264; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l7XIr/SVC6sMz8goU/VKpbT2rVvzknx033F8HOJiudg=;
        b=PldeJ3dU04OEMJmKwXPIU5g0vSur6OFQTmLrbjiYRV1C2AD3oh8NNqQIvmfoqxqIUT
         z6+U9asLUfv1APR383UEq37GRT7KJxr458H29BSlk1qOXJoZlOL++rr3515z5MDVxlF5
         wQ+pKwF14/viT1pIXK3Y2Hd/I9OLN0/X9NlzFEHTJflJY3so7ke0WnUpw0s/hngfw82Q
         8nInlWwcuBaf0Fr18rGzDLlNlfghA1SBfQyE44Eqt0ff+6e2D1QdZ18pgS1h1NPNvo5q
         Z2t0OwLTleT1FCd1ucp+isNt662PZTKOy5vb60/xjDwws3bNNDUzwv4TD7rhBkTDtngY
         P6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380464; x=1782985264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l7XIr/SVC6sMz8goU/VKpbT2rVvzknx033F8HOJiudg=;
        b=YZM1nc44Vn68xA7TkCcVZ8mh3rxdRq5588DyCjtKvc5s3TtpXzrj45b8LEdlE8hROy
         KoGjtG1Hv1equOOWvDN9rvt+H7ibQROLalMt5x3yA/a+EjWxIVe8n+JU9AGoIokw+egb
         VQF+R4v4KFPGm1bCtw7Xc6VAqAAXV4Ti/fW7vCLlO4O7b2QlheGcWv86YjkGz2PuwFuW
         JcB4m2+vL+kKZUODNkP9kpVhGqEIJeRfNhna4eTVY6meGZXWsXnUuKfM1ay6OZilRqKh
         bpeB+ukS1koa2d+ppELXxN6lRiAaClyb1cDFfuvnFIdV5j0qMX4fjrlGZ5brfGRcn2em
         fgrw==
X-Forwarded-Encrypted: i=1; AHgh+RqLN/+P+eBeJIftw9Pu126l1bbWPCHBwD0+4aWtnDPquzul2wRJBroLSDfmhB3BWkI2wxrLbxE8kQPzezEZ+N3F@lists.infradead.org
X-Gm-Message-State: AOJu0YxgM4MXw6dje0DHvefymFz+ex1OuBXQ7bVIc9uo4tawQ6eYctfm
	Wpn1DMj2iVWBBu24mm/DWfHOO5MsqQQRVUPRWCITvau/1SXCT/3Kzdti8b/MRNiD0Qa1m/ueezv
	6N9Uh
X-Gm-Gg: AfdE7cmORtBek9QZuujDwQYH30wevYxVykiVHE418XKH8l8Tenq7xTako523iUciAnd
	92BFafn7dcAviyxX4WR7e2z4PjweAJtXofUEvV0IJZAWr9pO/O4Fgdlv1m7FRPQD/z6Eut4P0MK
	ulGsfZQ+D/yfsYq2kwMOVhjXFJEKnMmY5D43Gi0rbYdrgdsVxDqYiXUyLtdOLHYma+jT7ACTJ4a
	q0TC0H6tKVFq7wxn+mRci3fD7t1cvQZ13EWP39lfOgZFllmVizCUl3TzODScJzdB5GvfjHP70KU
	WCjD2V0IxAjmFFAAsjaX6s5cA8yQEd6ckvVlmocOr+6nFF4lY2Pxy/XSJCwV3QCYqGfFm+H45z9
	BGUr99GT5lGpWJUny+GWGAq7AlXKtzvr4VNV1rmwqAjfJbwnJFlReS+WYL+DN4HggLlL4Zc+qb2
	FXoDf7eMNpJ8Fd
X-Received: by 2002:a05:7301:9f01:b0:2ea:b85c:153d with SMTP id 5a478bee46e88-30c84d435f3mr1984449eec.27.1782380463873;
        Thu, 25 Jun 2026 02:41:03 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52eed6sm6731893eec.9.2026.06.25.02.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:41:03 -0700 (PDT)
Date: Thu, 25 Jun 2026 15:11:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: st: spear13xx: Drop unused/incorrect usbh0_id
 and usbh1_id
Message-ID: <eckh7zm6qgtnlo6itbq6w5s5hvss2b6pbp23lyoaqpfzixghvb@skswhqwiwoy7>
References: <20260625091355.107054-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625091355.107054-2-krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_024106_148133_1110BE87 
X-CRM114-Status: GOOD (  10.90  )
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

On 25-06-26, 11:13, Krzysztof Kozlowski wrote:
> "usbh0_id" and "usbh1_id" properties were never documented and never
> used by Linux drivers, thus should be safe to drop to fix dtbs_check
> warnings like:
> 
>   st/spear1310-evb.dtb: usb@e4800000 (st,spear600-ehci): Unevaluated properties are not allowed ('usbh0_id' was unexpected)
>   st/spear1310-evb.dtb: usb@e5800000 (st,spear600-ehci): Unevaluated properties are not allowed ('usbh1_id' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm/boot/dts/st/spear13xx.dtsi | 4 ----
>  1 file changed, 4 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

