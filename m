Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9430ACD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 00:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vp7Jio/vsZh3XQA/CyPcX2F0P26k8s8Df1lXL0etR6U=; b=DjmlJ6VvXy9+I6h6DEOMqEw6ZC
	xznVowR0RgZ7byT2z9lPhLAS/lpXVm00sDs9XUDcopq88sfalpt4Ku7QfM4atGtdILxUdI8eqihB0
	pwT/xrxS9Qlr3y56tdp4fQhFX7RyU7t/p4USzUTX+/Gtyf0KPa1yO3dehUfqFoN7XRU0tB46tJocD
	eYSvQYZLM8443zrdF7IoPzPiLB4e0Z7mlPYLxehN58c0SqHlsN83IfdWWYuC//4YQJq22ts6gT0lA
	Lf4iYlUolgdjhVSpbGEt/n+xlH1rd3iwFIyvqqRGM5KeomrvxtoN7mEZpxbJyUfmw4mRPlsC/6T0a
	h2JuG+Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRfRK-00000000gUr-3Q7N;
	Tue, 26 May 2026 00:14:34 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRfRH-00000000gU9-1McZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 00:14:32 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-6324ee4040cso3472838137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 17:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779754469; x=1780359269; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vp7Jio/vsZh3XQA/CyPcX2F0P26k8s8Df1lXL0etR6U=;
        b=CNi6iDZC/tXvilNvj9VMY22k2ICrEK+ouc4F2mB9bD+/sg2ks7n5JJA681/3xuocLs
         iRK0ZB2V00x/tteHxdG/TT2E40PY7EhrU8i1gh26laLt291hkww/jSQ2XHR1eMvNhk7e
         tu4maodREHtD00JTMUpwKh4FjnCVo6pleEATtTyLJWFNvMn/ooBlLzJ1IlDtNomOy2fM
         kYGy0rF5g5mjR46cyktV2I4PHek9nH3v+535vNpmdwFuq5gxdTrR7dL2IwdkAlB1Ancs
         woM5fE2a4b6L4og/aSHGkCbxgFp4s+/5Rodfys7QT7vMFrWe3AC8FJ3EamvEcUtUcRoz
         49dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779754469; x=1780359269;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vp7Jio/vsZh3XQA/CyPcX2F0P26k8s8Df1lXL0etR6U=;
        b=QQPSlZvu//dqnDQy1Kx30p1GkJnSLI7PKIxuCYnBxJ/MXDi612SLwzXH+qPMQ/+yLw
         XvZ3mxLsT3i8UoV8vfjXI9Ya9mor4tA1sndrpjEQqvT1qeGi50H4d3mhPEkRrU53yZQe
         8FWWMxoDi8/N/ocLhHjvMtEO9VcvKWKnQbEFQj/tJS2zR3R63470KHpbcagflEWacJ82
         pgsxYPMspaAghpYm+cBOxccRIdusmd40oegHIQzggkY/2e+/YslJuWsFwLfNuH/5Cs04
         JAGbK7Z8P6DyAY0f2kxQXS7+9DthGSZOUm0leFgZ2ar2228DmZ2QwXJYHSNUCnfsSGyD
         Y67g==
X-Forwarded-Encrypted: i=1; AFNElJ+BekVDKTQhhkqE769SyBw0a0ORnWvKrVahs11sd2lOIRkV5bJfS1423VTa09zPRsMFDNMXiP+yJzWppBDE7Sns@lists.infradead.org
X-Gm-Message-State: AOJu0YzoqB6WrKJwSrAR1jEMWS8Y0ZGgWDPbpbu0QdANdQLSy2vaxQZA
	N05OnwPMiK4V+fMKAuGeFanqEZ4yUNhGqAE9eNCy2laQYHzg8eD4kvoW5uI62CXos/PkndQhpjJ
	LzNkdTSOl1Q==
X-Gm-Gg: Acq92OHnQBUtQcR3CHjBa6LmEth01fwfZTDDoDzmfzAGucPUvXMxFOkTgSSCEEqy6QY
	kl5gS+WXmTF6+4n+CC++UhhDlK/sv42mnFOwuntxMmSHQdNYHWFZnTA8vS2paachlE4Lp1hVPu9
	ZpdTD6UyjYo4uDyiLMiTEJoT16QN3cqyNkGNuW9+yYkOjk3zytC7PQVkwnR1P4e5k+gOn0+rdY2
	11i7kL7/HHIpMO1y8KCrtUAeIsWTqyU7/aJhDARH0esCCJ4qcm5KYkI9DguNFVftf0Nc9FmdJI+
	V7qiBCbJlSVBxiIZSJi2M3JzGpX1R8Utuwz7Js0zqRfGPl0NRRUSDn7bR3mC19oV2uRcE7uq0QS
	oD3rQxKzWs9U1It5dDB1SpvBETi3ZfZPwB2BvpI6R8Y/yxVsBLKIE3cPSfj8a4CZtpm2tGxur0y
	3twnh/1c6DJchl8u8c30s=
X-Received: by 2002:a05:6102:1494:b0:631:3b92:9dcc with SMTP id ada2fe7eead31-67c8398e867mr7695261137.27.1779754469441;
        Mon, 25 May 2026 17:14:29 -0700 (PDT)
Received: from acer-e1 ([2804:7f0:7542:d224:a24e:4c0b:adf1:58f4])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96173b6d3a4sm12075526241.12.2026.05.25.17.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 17:14:29 -0700 (PDT)
Date: Mon, 25 May 2026 21:14:23 -0300
From: Ronaldo Nunez <rnunez@baylibre.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: linux-pwm@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pwm: imx27: Fix variable truncation in .apply()
Message-ID: <ahTl3xm1qkDPYxVv@acer-e1>
References: <20260522191348.6227-1-rnunez@baylibre.com>
 <ahHV_GIwdWvTu-ms@monoceros>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ahHV_GIwdWvTu-ms@monoceros>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_171431_385795_6337EF07 
X-CRM114-Status: GOOD (  11.93  )
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

Hi Uwe,

On Sat, May 23, 2026 at 06:55:40PM +0200, Uwe Kleine-König wrote:
> . I haven't made up my mind if I create another pull request to get the
> patches from the pwm/fixes branch into 7.1. If not, it will go into
> 7.2-rc1.

Sounds good, thanks.

> Sashiko found a few more issues in the imx27 driver, would you like to
> address these, too?

Yes, I'm already taking a look on those issues.

Best,
Ronaldo

