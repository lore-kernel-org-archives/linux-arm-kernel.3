Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5453CFF60EE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 09:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=25UsXVOMiOy8Ukhj+maOqCoAane+gpYY6MAQhsl3cng=; b=vvamHU94vDZH0PbSgEXFoV12kp
	T95EmzuRFrMHprG2D1JzK+wqNpnkwd3PEtSap8bMzeBiMd7BmH1vf4xXC4fI2Njzsw6Cbef7dSjyi
	KUKu9IQgZumz+IpIJwzPB/PGODen5cl9Yiceb1Sazlm/gAXx+fAAmRMDqIz6/kAHjRwpcmcnZ4XvE
	aeo/FOcXMZfxjoc9zOw8nwU8gqkBtoWm/BZV85Xf9Cusle3UtGow3okCAx6bvVlunH585CVh7H2V2
	pPWZpuhh2KzkBcSUHCUx1KX8tZKmWRxIen0SFkAFkHJkb6cNQJQK3wwXo49c0n8OVL1RJAlsQilGa
	yKTLUeBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Uzr-0000000CeKx-3RlZ;
	Tue, 31 Mar 2026 09:02:51 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Uzp-0000000CeK5-46hp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 09:02:51 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso54554475e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 02:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774947768; x=1775552568; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=25UsXVOMiOy8Ukhj+maOqCoAane+gpYY6MAQhsl3cng=;
        b=qjyxdK1Nbi0chGJL1uYGjTHuU6bd0nirJpyPU+iXNa3XgG5qDANnWkPAYQrelaxBsq
         cuRM020mBiBGmmHs2QGyMnmT0Kulm/EIYTrZVVEq+y0GokKfR68VRICPBElaeLZiR1Vc
         EqAZvkM6+ry5gwCL9t3X4FvAuDOpMfgFlXsm0hZwYWtvn6cHQGOE9zJHiMGb5gi5uiGr
         Q3vIbEjE3apmkx2Fm+cxzwLeYhqs6u1Tax6McOZfXzbLo/6rx5TyLEFovo1vqly64N4p
         /HUbgjLsbRSbCcV6FtyvXs/LcTghiDpW5Re94MiQB+fcbYOU8gFHSrO+YMYWBTRDmSXn
         WxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774947768; x=1775552568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25UsXVOMiOy8Ukhj+maOqCoAane+gpYY6MAQhsl3cng=;
        b=DsH6vaVSJEo4rW7xXJiOc5QzlfghicqR+P6zgVHWR9TlyDh7qZMUwTPlozuG+D91QM
         hWXiBroSK/KN0HvUPW0izPuFaFJ+RnplVpTXMwDBg6HHVVxkVox6LVTk/K5dxJCBbZS2
         6K8hCfoIpawNvr3YCloMq/tp8YrgTKMcJ4CBLxHXlgP/vHLt7L4KsPIzLnDmGbdUTT6Z
         NJldQu1YgCKbQnlco06hyKjSeGKhV2b40UL8rDgdagye70Yee28ooB6fUNXVHRO0VfUW
         kVijp68wOba/vlZpCZ/ZK7k6jVLZB4Qh+k49vTj9IDB46uPiuWWYiCohu4nm3QYulDQA
         SHnw==
X-Forwarded-Encrypted: i=1; AJvYcCXHU6yYa/xFGkM0/nSADGVSU11JVGKkqEUdvwkcmLGXeJgxoSGt4OjjubyQ9djJw72UvoS/LPv8ex1+oRAiCDP5@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj5wdJPNNY2KcI620QgFmVquRIrRSduPDLcoIcMenTNJn4Bp/l
	oL8rnHMJdtE3tLV4s8+8RL1zsrDhIoj3aiN10Md3V6xsyr5fJMF2iO6Z
X-Gm-Gg: ATEYQzxcUdYsivYFETA2oLAVbiDWqjq7n4r1fr+4JOIY8zDsuzp1YY5gImMZMjlaQf+
	9cj4Y+MTopNeaCiIWcAMvVnRTamc0KhBxLHDsIx2rkScnBh/3nDeDQhUNRyfAunfTS+R33FC0UK
	M4NyUKLwD8+PXvJCrx0gDNGbXBAjhIpzK8hCSiuEL5m0ZwH+7ZKCricMbOAxdu+rAXSU8IO6XI+
	/7leLHzbQO81P261BXSNWL47HI2V2i+d4RuyoYgVAIY9WEcN/40E8zoMW4+XDIn261JO7E6VPYi
	TQz25BimOKoYcwAs88LiHFenQoaV+R+s+mmyLkBTF6wO2cn/VUv7h2G3P5h1RHEv1/Oc8ReONAp
	ulFKuKUkm3OniaSgGbgzOu4mPWVsU2GhT1bH9YCx790XkRY4tdEvmvACnnmH11a9bMFLMpB5TM4
	bz+U3hxF7em67PyDRRd4V1hNiR32GwjzCf5rGpmFQ6kVXufW//3fQ7s7FQXwswBE6hPDkRYnSvb
	6Poh+ClGpaLvqp8aSTpxajvWk8x55Mjecqn7spQuWY=
X-Received: by 2002:a05:600c:3b24:b0:483:6a8d:b2f9 with SMTP id 5b1f17b1804b1-48727d5a329mr283719915e9.5.1774947767403;
        Tue, 31 Mar 2026 02:02:47 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80140esm19733365e9.4.2026.03.31.02.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:02:47 -0700 (PDT)
Date: Tue, 31 Mar 2026 11:02:44 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx91-var-dart-sonata: add RGB select
 supply for PCA6408
Message-ID: <acuNtMwKMy8ka2j2@Lord-Beerus.station>
References: <20260327163243.17334-1-stefano.r@variscite.com>
 <aca1jdx0DjmmHqFk@lizhi-Precision-Tower-5810>
 <aca7ckVY9ure8Cwe@Lord-Beerus.station>
 <acbPUTPpGIJoqTn3@lizhi-Precision-Tower-5810>
 <acoxJ3KUVHqIR1yQ@Lord-Beerus.station>
 <acqLWgY1_G7e0qOI@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acqLWgY1_G7e0qOI@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_020250_019668_05878833 
X-CRM114-Status: GOOD (  14.20  )
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

On Mon, Mar 30, 2026 at 10:40:26AM -0400, Frank Li wrote:
> > Yes, it is exactly the second case!
> > It's just an EN pin, that enables a buffer to route RGB signals used on
> > the DART-MX91 som only.
> > That's why I think regulator is the right way for this case.
> 
> Okay, it'd better to emphrase it in commit message because _SEL is miss
> leasing.
> 

Thank you Frank,
I'm sending new version with correct commit message.

Best Regards,
Stefano

