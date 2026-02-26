Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808E6FD8FE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 17:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwTJv9LGSAlffYlkadnvjA+g9OCfZ1CRMJttWHSXLMM=; b=GH71rN94DN9KrabQRXLl7yZ3du
	6nsdyBg0ycneV8AwgYbb0u82gBETtsrt7dXogH60MNf2HVqdkPKWMZ9EGkAFqkP1QMG9gD70Dyh+C
	SipaEOjz0pX+R1CwZvR3lWnhcRzrXfpqJuLhNZ6e3xdMPb8dygOsufIrminNnCMN/SEe6cobaaQnP
	bhs8ycyQU5NP/ikR92LbhbP8VJQZUXOEUOZjSIH24q6WgG6rN79m0Id3II1WUMiT2sb1KFY8UIrK8
	kPtTG0sDB7WPA5LUM9v2pZlRkEUxe6gfPfTEi/+LmhbuH0XO3tw9OJtaxWm47GSXwvLgRYYYm++rv
	oDWB1knA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfQB-00000006sgr-0lxl;
	Thu, 26 Feb 2026 17:45:07 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfQ8-00000006sgJ-3F1X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 17:45:05 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-65f73225f45so2053742a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 09:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772127902; x=1772732702; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lwTJv9LGSAlffYlkadnvjA+g9OCfZ1CRMJttWHSXLMM=;
        b=iEscL5IDVRV/v28Pv3Ca3+iPxc8UMUoc1El617NavFIcxZZMp9HZlhalF+HGel2Mkm
         wVWI6TtLitCQk/rHsqDlXUq4hCoUPU0FOw/PEmTn5bXM3n6AjbOI2gL9rlsmBONPcr55
         ypN5mkkG7GtMM8JiQhNG9DiBAw4kMThoACjIMIEUtzLwnPPMVYaRmECaMRHSzsJbxNgv
         eZ3++qfCCgyr3x1loC45el0HChA026K6AxLPU68h+VpUmuWIRbzRqvOGkLmAF5FGeR6Y
         WuV5unumD3k9l77EgXkdFeTK9iK/fHMtag5URk9Hu2imVumlLaX+a5u4fnefNGYuSk4G
         THGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772127902; x=1772732702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwTJv9LGSAlffYlkadnvjA+g9OCfZ1CRMJttWHSXLMM=;
        b=SeyeeugFeEP3rwT/3rgEKDC5wMBOhtwZIe2UKmANSWIBi4BxO+WWxcPj3JJWqrqKXb
         cCqCCGi095aihB8EMd6BTrJtOTJtzi0QaQ5T4BwYpKJmJTsS3EtbiM2VJrx/O4HBQ7LE
         8Y89VawZho7e0a4GiXUTaG7fTI0nxJuV7NumfmCQnDZ1lcBeVlaQCDF4hORqsjWv3rT/
         6fvg7b16joAEfR08QAkFZrDE2yt85f8F3SHklqVeQeomDJ82IYY7DM4bY0/FDrQ4iaKp
         khHg/bs869/PE3EkSlstvvNA9dZ+IuDAy3wjRV9aPQMU00d4Ux4FxifeueXJlGHVmMyE
         Pdwg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ7agHaYCgei2/M+e6Xbh76SkGASHdz8UUWymieUzGUKBdQYKw+SCbZ7hb88myeSR88KAjHBICtn8NF/DqSVfu@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb7MKvsG8sYlXrtDnymI9ORtRyp/BMEnSsEzDuyGyyqUPqYyr0
	iOCo27Gyx51NM8WMLyd63T7OlScfJbeCV/u3dHowigMido4jVHug6rQr
X-Gm-Gg: ATEYQzxwiK0JkQYMBiXkF1/tPxmVfdcCYg12+hK2ZBL3rM3C654id1VUgPAgG7higvz
	Q/ck1Rf3QqiGYmc6a6HLGjmGyUNV8Ga7Nuj81mnOS9ZMdPEggUiZk61hYh/6O4hT9/qGSijgaFY
	RT4qXpbFng5rOP3KWx2E6JrWrjeLj/Rm3GroOF2RmBGJDxK1r+G6Wjv+EGwMPUfdPaGAlC+n11S
	C59JBe7JO5EYX+3fIKb14UYhTcBbHoh2AlHxHCZR89ScTcR5YLZdIEogCbEBqUHa9EhgPC+RSCG
	kp3cwgQLWB4O1QRFYb6DmESC4aFMl1gkeNhcgOyZkJv0+w8s8nqXLTjYVKm4T+kTsQopuBFzrKu
	oasmHCe786BAod9T3XeZz+B+dUQU4s437LNJU9hnauUP8mzEhI20DM7PSrD3QJmqF5fEFxWCNrU
	e03zdhVLNALpGUNSlnjBQoGWUfRxhSacTdBVR4JmBbp6PefM9+uJZCOn6+RuHrWwjkQQLRJRMN9
	xC9P9tE04xLqXIcXe1NoXg9XzXWUpbQ68Q5vdEAeh3MbOI=
X-Received: by 2002:a17:907:f497:b0:b83:32b7:21b0 with SMTP id a640c23a62f3a-b935b502ecamr191281066b.17.1772127901905;
        Thu, 26 Feb 2026 09:45:01 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ab13564sm81364866b.9.2026.02.26.09.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 09:45:01 -0800 (PST)
Date: Thu, 26 Feb 2026 18:44:59 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v1 06/11] arm64: dts: freescale: imx8mm-var-som: Update
 WiFi/BT configuration
Message-ID: <aaCGmyqONKj7GoOy@Lord-Beerus.station>
References: <cover.1771353301.git.stefano.r@variscite.com>
 <3e79c4d806b8b8024b71bc99c36b09a2fbb90a65.1771353301.git.stefano.r@variscite.com>
 <CAOMZO5CAb8738HdH49WcY-JPTzQ90n4Bnmyn96_3jfw47mxOug@mail.gmail.com>
 <aZTEm8nUUVcKZH0v@Lord-Beerus.station>
 <aZXqSz_OsCC64P7i@lizhi-Precision-Tower-5810>
 <aZX0WB_6qPoCYVvC@Lord-Beerus.station>
 <aZ28RtuAWcatyVAf@Lord-Beerus.station>
 <aZ4YdCIG2JIT6BQS@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ4YdCIG2JIT6BQS@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_094504_831526_63EA16ED 
X-CRM114-Status: GOOD (  19.29  )
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

Hi Frank,

On Tue, Feb 24, 2026 at 04:30:28PM -0500, Frank Li wrote:
> 
> If can't auto detected, I think keep old dts, use overlay change to new
> one.
> 
> For example, board.dtb
> 
> you can rename board.dtb to board-revA.dtb
> new board.dtb, by apply verb.dtso to board-revA.dtb.  Or you direct use
> board-revb.dtb.
> 
> If change is big, you can create new one.
> 
> Frank

Thanks for the clarification, I understand that the preferred approach
would be to keep the existing Broadcom-based DTS unchanged and add a
separate description for the IW612-based revision.

My only concern is avoiding confusion in mainline.

The Broadcom-based SOM revision is obsolete and no longer manufactured.
All currently produced VAR-SOM-MX8MM modules use the IW612 module, and
this will remain the only production hardware going forward.

I would like to avoid giving the impression that we are actively
supporting two parallel SOM revisions in mainline, while in reality
only the IW612-based hardware exists in production.

For this reason, would it be acceptable to:

  - move the Broadcom-based description into an explicitly legacy
    revision-specific DTS (kept unchanged for existing users), and
  - update the main imx8mm-var-som DTS to reflect the current
    IW612-based hardware?

This would preserve compatibility for older boards, but ensure that
the primary DTS in mainline represents the hardware that is actually
produced and aligns with the rest of the VAR-SOM family.

Thank you again for your support and your patience!

Best regards,
Stefano

