Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871E7C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 22:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCbufsqovhRdxKI/Wo+sxDQep3MCh6y6M1Tif6pvFv0=; b=XBsE85NUikLDcKBwR3IL7FsM3/
	HG2ArW5BVtQ1HYRDZDtPUp6F90MLAEW/r+Uis9HzXeWlnTRZc32bDxD1nK2jzjPQVn7wpm8nzDJYy
	UENlsFBvbV502+4ZoibYRTXhTGOQco8i6z9mKKfGsVoyZPKMUOZVJhxjRIsu3zcxUniQc698BwNBr
	Dg1boCtFcXfeN3r8mCGT4z8PrxDWnMPIbFteUs8UPXva4aO0N+TpFCA2+UGpEl7agwHRBFmXImtSy
	ox4ktVQPVd9vxGdMlyY2gTznpTwEctzbke1WCW8jS1moUEaohTdIWJB3Zq58N6W8fkotKdBMXSw3U
	8u2UTzrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4SbL-00000003lKa-1NWe;
	Mon, 14 Apr 2025 22:48:27 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4SXz-00000003kpj-1djO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 22:45:00 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22928d629faso47405325ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 15:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744670698; x=1745275498; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qCbufsqovhRdxKI/Wo+sxDQep3MCh6y6M1Tif6pvFv0=;
        b=fuDpcHSNnUMshWHy2GApDqB+pBLHYb6jlJPL+Uk8DmlTuSUOe2StOLL9MwwgpyV1yK
         8V5FAZOC7HstX1bmDBj2wcPK7PTHyw16vhESaV0Md9OOQ3WkJmKh7wWx2Ff5aHZE1bPd
         2X/SenmmHAP8R8jEvp+c+z5tu7xGGLn9gETFm/QE3lUIhnJANwQ92vqf3pD0JKU+u9xL
         6lFkSsPnogB6O3xitblgkQIirrTGeiXzsfeY/UmAmpY2swVid3PVlj7DKEuD8oQZ4Woz
         Bomcs20o2214+DodHyJ3QfkL6Z3EJ1Lq0+GgC3kHcCOCt1soIpMO4WiFDoI3t1zrwWkT
         cnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744670698; x=1745275498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCbufsqovhRdxKI/Wo+sxDQep3MCh6y6M1Tif6pvFv0=;
        b=UeCM9MkTEyRJ8Vaz5qwMfpeaAXSbl942YFFp9iHmGwfkju6abZlvKER7M+LSt9VRcO
         dCTjGse65SkyYu05Ui3tZ9WHu8+6MxM3pvw2zotZJMtyLCQ4Cli7wAnfUfSh5UD76IVK
         W9M6kf4eUOtMj35yGLUw+I8eT18f3P6BOCC9QFNEzuhjZjWYeWUReYxyfllVqIxGJAur
         A0j+Dp8d0Tprohs+kp9HLF5lSs5HNz+IxQts7moY+1ppBJhcqjP5ElTdMPtoUpkMdKaI
         f6CnORpL3mUfdpCzdISFxtzUo7PEsWe/LqFNnZALLYl0tZBcH9HfJnA1hKy4Uwf1INIM
         XXwA==
X-Forwarded-Encrypted: i=1; AJvYcCU8foikdS59xsyHvOJ6rueACqhi/XTyPo6rISrL09eWq0xC+ngZJwkq64pm5aowU2z/NL6yUPtLDIyzIYPyt/Rx@lists.infradead.org
X-Gm-Message-State: AOJu0YxhUr8TJTO2m9dYPzKEMuJnE//p6LKAcNxuIIPxc9LyGg+2z+lo
	01bwhy9DD9vI0hKLey0IIx44IEJxbbTzUnlAPUlGeJ17IduPtQPKWSJIloII
X-Gm-Gg: ASbGnctqMCGjXeDkiSk6WshXjFBOaPoPv02e7ruNTjIsmVnrCGXREc5mmwwjtxv6Kgy
	77NDMfbax1qIbxTKbN3KajncovDKLUWvLf05t0o6zaMICOKsJ1gA7c3ZkBzNQ1Rdw3XrqtqHJcO
	X9TEZDIDYpucpapVHwmouhjanxU/lxTgoehTyAVXw+RpAzSbd1CuXSHwHBC2T8AHIQxmxBNUchv
	p19tKxZrd4r1h/wkI6E/6U8LGQR1sB/pGeijBDpI1qjXRUEtZZC5R49nMgruRvmOTdJVjZPVdwh
	S9He7s8x9L2d6BvMybJAzSIsQqhbr6LCAjT5WmEahhbMnLX3rhQ=
X-Google-Smtp-Source: AGHT+IGWOQk/MY4RrJwds2DUYwvDvZppCoo869G7JJk+fcUnDOZsIWUfuBx0HTAue14NQURwioU/rA==
X-Received: by 2002:a17:902:ebc2:b0:220:e63c:5b13 with SMTP id d9443c01a7336-22bea4fd043mr193492195ad.46.1744670698007;
        Mon, 14 Apr 2025 15:44:58 -0700 (PDT)
Received: from hiago-nb ([2804:1b3:a7c3:a964:131b:ff00:5ee5:94c5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c62c3sm7400010b3a.52.2025.04.14.15.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 15:44:57 -0700 (PDT)
Date: Mon, 14 Apr 2025 19:44:52 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [REGRESSION] Kernel reboots unexpectdely on i.MX8X when
 Cortex-M4 is running and it was started by U-Boot bootaux
Message-ID: <20250414224452.gk4ccniqtumfbjth@hiago-nb>
References: <20250404141713.ac2ntcsjsf7epdfa@hiago-nb>
 <20250411125024.i2pib4hyeq4g6ffw@hiago-nb>
 <PAXPR04MB8459ED6CE869173D4051257088B62@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250411162328.y2kchvdb4v4xi2lj@hiago-nb>
 <PAXPR04MB8459ED33238AA790252E730988B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459ED33238AA790252E730988B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_154459_426780_BEE4DCE2 
X-CRM114-Status: GOOD (  19.28  )
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

Hi Peng,

On Mon, Apr 14, 2025 at 06:09:49AM +0000, Peng Fan wrote:
> 
> In your case, m4 is in same scu partition as a53, so m4
> power domain is manageable(owned) by Linux.
> 
> However to m4 earlyboot(kicked by bootloader),
> if you not wanna linux to handle m4, use scu_rm
> to create a separate partition in u-boot.
> If you wanna linux to handle m4, but not wanna linux
> to shutdown the pd in kernel boot, imx_rproc.c
> needs to be built in, and need to add a clock entry
> or use clock optional api in imx_rproc.c .
> 
> Current imx_rproc.c needs a clock entry to probe pass.
> 
> I think in your case, this driver not probe pass, so the
> M4 pd still get powered off.

This was correct, indeed. I was not able to find exactly where the
cortex-m4 clock is defined, so I added a clk_dummy to the imx8x-cm4
remoteproc node and now it works, the code continues to run and I can
control the m4 with Linux. Thanks!

One thing that I noticed is I cannot make the RPMsg work with this
devicetree node, even tought I assigned the correct memory-regions
(vdev0buffer, vdev0ring0...). Also tested with the rpmsg-lite from the
linux-imx. Is this supposed to work with RPMsg as well?

> 
> 
> Regards,
> Peng.
>

Hiago

