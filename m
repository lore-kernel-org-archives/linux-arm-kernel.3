Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F521090247
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 16:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uks/f97JENhrvnsThvZhzUZdvgjh3JvnUSmJzAdelLo=; b=LFB1hfKAAJ/Qm+hC1uRijC1rZO
	sp1a+DH1RVxBsGUcOe0UVIllu5M/3foNjAMl1h+uSSM4YfiCzHVZmylb3ZpOo6FtIhAAPxxAwaGBN
	W+6po7Xte3dh8Pk/2MJfRQi9BYN/Kpc9h75erqZ+hBd4N8Bow8t8VSIIL5y0qMyxUZPP84yDwkJBH
	3KyqoE6u50HDa2Hlzk4YrLZBDebVBrsGw5QWZhsxqT8LjgiX3tlfST4kzn5mBbUz8OduMAefMBuGS
	iKjn7TZXK8hRUS4iQjwMWhUad+uCnoJw/PJrbfnVQDNNYUdn+OQm+sF09+R1Pao2sWFPLIIpkdfUQ
	ku9NermQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Fnn-0000000B17s-1TZI;
	Thu, 19 Mar 2026 16:00:51 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Fni-0000000B13f-0YSI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 16:00:47 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43b40003d13so728093f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 09:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773936044; x=1774540844; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uks/f97JENhrvnsThvZhzUZdvgjh3JvnUSmJzAdelLo=;
        b=brskXXXsSYPAsEu0fwW/gG+W9N/VvVDBuugCJ0W/3pKOQn7i73qy6PwxWoKsg/8Ruz
         MfnPrXowiPrzCr5cvCpQP4M0c39NOwX8khvzSk5ow8mM3OHtpPlmA735xhXl5wdynU/e
         OlDDYEO7FT9+zD1ZD7cxgNvxTuV7c+xB3kyurGBbaeQUwwAUfHBuMuxBXQtCHLhV6bjT
         Y9kiATaukR24ydzx10PcBSja0gBW6hD5eKQUY44S3sC9lkPnjOv41Nw6X9ERmYKrT56t
         wGMCZtzj4QvRNGLSGEzJI/MrIA03k41dsVo5uecL95YMcBmd23c2EM0Ufo8scVIPdJA4
         C8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773936044; x=1774540844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uks/f97JENhrvnsThvZhzUZdvgjh3JvnUSmJzAdelLo=;
        b=AER9POpT9j5J43WeS4HLJoM1mZqPqn95zz5LFFkM7SqWRySMKk3dryldS5oWb42RG0
         xVFo/+zJIHKZD+LE7Vqo5P8j92cx4Qhom2ClVgT0WxETvFOgNekr1DX6OwnIHavP9L8r
         NoHUVRXLgt1AMcABn0RgtEaZVF0klEApjD/u3D0p39CU59X/6tvMenEGuCkx1ZEr+RjR
         Z+EWjFOZx5I0cyR4/O3vf0F5v7V1sg+xVOywjvG/M4gI0uNW/BABddmMD92XwNI2BIcK
         WOVQAYNP/qCC3kACbrKG4MJ7778KCkMl4z/8SbJzhnrFawNH8q4ymXHp3uEpL3AEgc+K
         PEvg==
X-Forwarded-Encrypted: i=1; AJvYcCWAhUabaCw6t55vX9e4ySzDMTGrv04A9VBgL2qt0UuRx1cNgmJ25p2YG2435i1/aVwncORcC5JwVe9LoMORv58H@lists.infradead.org
X-Gm-Message-State: AOJu0YyijpFHG2XJ/HXa+LvlezkRpsXLIq1imTsGrl+oMFEmpGdPFc2h
	4uKCHIDnF7rwElwHRUtE3KxIFgyJ28fGXQm0zHbK/Gnfl5sCh+5bZxix
X-Gm-Gg: ATEYQzz17cQeT4R/2GqQbQVnLrXvUGEZZpn/xbaPOiGgLBxc363YKmMXlUNqF6vC+TQ
	yUo5zIB4o/mQ/uiMFEhD1GFLGSi7tzxLiFXMdciRyKI5pNy97tkyUVUt7i1hLEOuIur4txeCY4S
	mNuS4JgLtEh5/gQnO/oClTEOqN7Qoef8Vo/X63Ddjbc/uRO/4ciaNEFpnYOIqE4pb7uiyXIjpJ2
	WI1sJkXA3EtTGhlAIKxO+qptpb2FkPzIVV9t1pcFYiqwZzupzR4z0ieirJw+PdJUe8CncqhLfbf
	LybBaCHmN/kF+Hswx4ONTR0BFWkIy+Rb/PX6gpBcK7qNOjDohHw0Iqu1llowdLAGiv+WPgCJgtp
	H6JI72wb5tpEX+Pc7+C3R322d3KHwzZ3AQozxma75aLxt2SQRZgZ4elbDWhAjoBcT5xcGammPNC
	BN/nwVaGhycrueWNiZjJ6WlCIPEo/DU+c9M74OW8yn+rS1rvKTwfbNwGCcCUSKC6txJ/qTHA54q
	fBFjD4LCh5Ar9sHNR41EUqJqC9SR/F5CEiA/PwEtibPVkU=
X-Received: by 2002:a5d:5f82:0:b0:43b:45d1:f44f with SMTP id ffacd0b85a97d-43b527c89fbmr14188968f8f.41.1773936043147;
        Thu, 19 Mar 2026 09:00:43 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5189964esm16332268f8f.29.2026.03.19.09.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 09:00:42 -0700 (PDT)
Date: Thu, 19 Mar 2026 17:00:40 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 03/11] arm64: dts: freescale: imx8mm-var-som: Update
 FEC support with MaxLinear PHY
Message-ID: <abwdqN23q9Kx4V-D@Lord-Beerus.station>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
 <24d31e0ca71c9b2dcb64d39117a8501d85cf945f.1772898346.git.stefano.radaelli21@gmail.com>
 <abQzAM1cxsFJoTJ-@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abQzAM1cxsFJoTJ-@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_090046_218006_429F3FBF 
X-CRM114-Status: GOOD (  12.35  )
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

Hi Frank

On Fri, Mar 13, 2026 at 11:53:36AM -0400, Frank Li wrote:
> On Sat, Mar 07, 2026 at 04:54:39PM +0100, Stefano Radaelli wrote:
> 
> Any enet referent to this gpio node, otherwise can't guarantee device
> probe order, maybe enet driver probe before gpio. rst is critcial signal.
> 

Thanks for pointing this out.

That was just a leftover GPIO hog and not actually used on i.MX8MM.
It will be removed in the next revision.

Best regards,
Stefano

