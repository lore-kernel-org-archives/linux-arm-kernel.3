Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D470BC44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 11:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XEVQFga+mNJxLAziks0aejJBFPUIoIq1NAMdQ57DJTg=; b=iUvA6x0UA74UzVl/WAgp+X3OnT
	FZeqhm2wpRYOuuVmUvsfJqzdh0KYwwIlLvd8o7LsQdvaLIlqip4SZ9shG8YuqwlxkCM/Kx9L6oEwy
	S4fnUXUye0QeSyssapURaY8QKErqTitrqgBPNfDFz6OSq4EHAWZLy3VlH+n2JnDRezxUoKOIIRDLh
	kP1TQxlcedwezavCL9ayj1JycYYEM/RiBXzk3sTO2VY9076+YxsDumQSUiA5kUCF+xxLbFBDR1iBZ
	0Zse8v0uKSvVqEGVwiIVRR11LInNxtr8SzwsN+kgeACcheUmdPHgv99WSSpz0dFqFbIMVrv8x6Bkm
	cb7jU1/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUyP-0000000BdHN-01Fl;
	Wed, 22 Jul 2026 11:18:49 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUyN-0000000BdH0-149g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 11:18:48 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47f6609c657so2063774f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 04:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784719125; x=1785323925; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XEVQFga+mNJxLAziks0aejJBFPUIoIq1NAMdQ57DJTg=;
        b=Y0cH42JjUFCNkEfbJXnFuOumvBj6LucYJwB94rIhYqJ/H21f9B1SbjFO9RQYxNvb2E
         bj7X7/lmL0gk3qTpadXOe6HtE2duSYsl0kwh/gs0zm2MtVUQ66+1itwNuur5dJ9mA6qS
         FbCeTFMCKvB0Nb5bLy73FUWqXcSv9ghrIWu4WVvEdWcQp0511Jrx1jvqYV3RaI4wzatY
         ETLewHIOlIXN+cC0qQDIfne9X4DxgQ38Suqj1Tt2XeOvdq2+kd0lrbscDK5QE8wefI9q
         WESXR6ymnipp03jI41ATg+uPXbWNNTf9/LHh6fDunf7EU8ctRWNDUJU84oD0qXSgYbcW
         vJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784719125; x=1785323925;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XEVQFga+mNJxLAziks0aejJBFPUIoIq1NAMdQ57DJTg=;
        b=auH3Ws6z12FyQV7anvoU7yrxakAZh8g8oq+UScCxMsmvHj99W8MGRPrzLhM4MHy0v5
         7R5amu5mE6jsZtaAgo9s0iwmK2vudLkHWmzizN4tRfXeUTfp1nB1FoPnow4gUpkUiDXF
         kUDmvtHs9P7HALtzDRVfwKwX3yVbkGFJfyM8lIEmXbOjL7t++hqSNlDVC4e2tU4uGbqn
         piUfvqmHnZ+kurpwprl/BkBkIBZao1RNzxGh50exbgzo+G9zm9rYrmjnaPxyDP+aJZjn
         k/fbjP2gjqJbKuURNAgrIZB9cBhvQBJ6Wgfvi6KGQ1L5nOO085rZhvC4Sm9xIqXVfKY8
         hl2A==
X-Forwarded-Encrypted: i=1; AHgh+RoogVzbK8BT8N0p0+oSWhuGVZUV3GE6RFw3OgpbMrzmfaEZ+rICxx9Trz0UCSYPnK+BPS7OdaN9CdYrmxB6h7WW@lists.infradead.org
X-Gm-Message-State: AOJu0YxOdbqQOnjP+Wb3zkqICyPMziW/eUGYToOYpOun1IZ5LFvntHxU
	xGmSspE9FKqWpFKAfaNQZODJtgT6o6VTPHlH7UzknPLZW091Vzsg0abS
X-Gm-Gg: AR+sD11vgjdft8oIiAItBk6kQiui6ZD4Fk+m+UR6Zo7Varv3pMChjjW8ntmmlNINHBl
	PyrlTZ2Gks9is3EkdpFjVt+cQeHSHhpEHLjpA70MP454H5n3Wy3OY5gOjcNE/NJ0zbT0qX07s+V
	U69ZSjKGXeXQtkCjc/AgxOsv9JtGS/B/tTgSvI3He10UdbK6Y+RyJsLgoYwli3GyAqsibmwAtch
	nVGtX69ftByvhPuoKDHBHEAQHRrObHQJQvIrygl1TzbU0yh5KPZlV0eid2I6GsCwFa43oieE3oa
	H+fNWqTcJI7rnGBfvCppDLguF0AyIzjxhdSzpDH+r0OGhwuYydlaUcNcbQL4VElQ84HyOxqQ4cX
	NMhaTQT+2fZW1jm1D+22o3H3OTu0U7FeEPab0zhNGpsftgthiaCtFGOCtsnG/Q3Pga1o1xmi1B5
	/8WW73gd8YXgRWWeYT50CLwQciseMMQy2lY6lZPQ7m/B3iy2bGb4xOPKRaR0dmQ0EDE3XiH9f04
	IPxlGLLuW+PzIZfEsV+7w==
X-Received: by 2002:a05:6000:400d:b0:47f:8148:3af8 with SMTP id ffacd0b85a97d-47f81483b6fmr8180062f8f.43.1784719124938;
        Wed, 22 Jul 2026 04:18:44 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c67339sm5345775f8f.31.2026.07.22.04.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 04:18:44 -0700 (PDT)
Date: Wed, 22 Jul 2026 13:18:41 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8qm-ss-dma: add LPUART4
Message-ID: <amCnETDWQuSLXcMx@Lord-Beerus.station>
References: <20260722104200.17729-1-stefano.r@variscite.com>
 <3426538.aeNJFYEL58@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3426538.aeNJFYEL58@steina-w>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_041847_300398_95617F54 
X-CRM114-Status: GOOD (  16.48  )
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

On Wed, Jul 22, 2026 at 01:11:10PM +0200, Alexander Stein wrote:
> Hi Stefano,
> 
> Am Mittwoch, 22. Juli 2026, 12:42:00 CEST schrieb Stefano Radaelli:
> > From: Stefano Radaelli <stefano.r@variscite.com>
> > 
> > Add the missing LPUART4 node to the i.MX8QM DMA subsystem description.
> > 
> > The peripheral is present in the SoC and its LPCG clock controller is
> > already described, but the UART device node is currently missing.
> > Describe its registers, interrupt, clocks, power domain and eDMA
> > channels based on the NXP downstream device tree.
> > 
> > Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> 
> Commit d879cc948e6f7 ("arm64: dts: imx8qm-ss-dma: add lpuart4 node") landed
> in next-20260721, which is essentially the same patch.
> 
> Best regards,
> Alexander
> 

Thank you Alexander,

I missed this one :D

Best regards,
Stefano

