Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10EFE9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 17:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCcdS7x3lDtrIEUvGJcyqRB9D89Wp2xuvJCS6WrEmgQ=; b=ANnyORghsGgQal8JgVATnTMLAy
	NCrqde5o27yFl6AVu81xZ+0cXdhmZdruPPUAYwsWQXyBoys8Et5XpPENsAaIMsMheSXjwLWCBAeLH
	nBSikKdbq+Qg3Bs3u+rkxO2x2LVhqRsCBuDGmyW8atVAfgNmBd3EU8CWG5f/6mKQmd6XB/9qQKcte
	0FZ6DQXaQJtENlGqOP2ctpOaPHg0zmT6xtr7NMX0a0J8AgX3TU6O9XPop380+54+XDVQbJKBAHUms
	DwvU0M0mECPkhATBGpfl6T7xsjysC0w9/BGcREubOtaD2Kvv5s+b4EOvcBehCr99nWa/WxVQ2uzBR
	7ElkkYhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vslBx-0000000AA58-3aZw;
	Wed, 18 Feb 2026 17:18:25 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vslBv-0000000AA46-31YN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 17:18:24 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-59e646a4b9eso96784e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 09:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771435101; x=1772039901; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DCcdS7x3lDtrIEUvGJcyqRB9D89Wp2xuvJCS6WrEmgQ=;
        b=m+XlaZtYntLrsfUFfUGmzE/GqE5TO9CJDYVm8hmVlQSOBrTGojt04FQtpbrwAvI0Sr
         cODy1CQw0EJiQ8rFpCmcx+yT58mRGVPRz3yJgS3e+/KYlVJMLIs8oWH1hzVE5o8B96Z4
         AAv4g4dGfzFpF3ZXYwQNdZxSpz5HZENgETX+jvER9DbekeEyUM1LBJqbKt2tG8c++/Ge
         pwq5XUrX/TNu3RfGLeWSgiMKUTiC9pixT4wrTk4cBsAJ/G6UhMGSNYxpWaqc3I+UtnLU
         GGbaAW+99lMYcwNO2myt3nLgfnX2gxRoDdd3UOwQ7OIIVH5Zcgf62XNDZ9ygj6vm5rcr
         illA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771435101; x=1772039901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCcdS7x3lDtrIEUvGJcyqRB9D89Wp2xuvJCS6WrEmgQ=;
        b=U+uhtaCqY4mpUAed8e/0+YRIpnlSPEJeUuPQpbaM8Kzl1kNEEucD2fhxuiCv0V4rrT
         pEk+BWBmw+x2BXaRW3tSEcB4j6OOvZnvKnCcAaM7VXcKz0humKUGYlpUqDeM5Br1b23H
         KXVBkhe3Cwg9gQaSa+1V8Fww9hNz70uTdBx2ECj2D3BOlCHrr2YBw6DfWPPxGwF/Tix9
         Kp32CQLgZuhsu4W4XGArxdSQ6YwxN4U6vD+wJg8MNzHiZHgcsUgTo002vaKaCof173IH
         VhMXyJr9rg2RJVSfm71mWzMimWLwPD5K8zfSzUc/JB/t3mp/+Zk02Bnb/er07QjbcsnF
         n7uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiyPgFtyr+Hm2cAyvLdK4FiecdWM3GMIhETGR7p3Y+rj3h1XnRxMGu9khKyWLPZCEnBB6xV98xvGBW1GKDxnag@lists.infradead.org
X-Gm-Message-State: AOJu0YwFfPfSEmrJKt2KiRDPDviIOQdtJFFcjmr3rrVtgE6hxHuQHhjb
	p6mP7W6OBjMzE5SimKevnKpCKpeIJ/+HuGXHRowgRexk/7uUBoOaeIkt
X-Gm-Gg: AZuq6aIZh2hiZN1n/b7HLBat/2Os4UZo7IUaSC5STSA9cx4baVFcgpH4sW1jv7sDdZu
	3h4GIKnnoe+yHWXLF4zqTUTO8RmafkOunbmGYmAufocKp+FZZsrClchyuJDaaL2tL/83uKUws4T
	rVHBzFSxWcQjV9D9GBMGtUcFv1B0uM0EVsXyZERJ8Ebka4g8UQNeRgi0Ajb7BdtVIseHgNTJ+l/
	+fmKqL775nVl7zNRpqYsdM2ix1+SFl4jMFadXdGUhuEKGNXJSCG2eCLztaUpCi1OiidWGBa+6bY
	MSxsthpAVbchno2gEAyRR53tH2KXSgFa+wpww+jI0H0EzGKrDUCR9g+DepAn5hbbv4hEqVll/lv
	eCBuCV/fjhC4KgvVdcXN4mOCMl6mSbyMYlJOBmQq0v+WmCcCKuShMredc3OPe8GOoFNkUoAb4mQ
	PjH/f/Lgyt2ceqAwpWljGrjl576fCmXMzuFnuU3nS5f0cDENK+ODoFerldii0LvnIR9ezbMWHI3
	tfeNQG8iMzP/+3HY6LhzIMeDwMAZWm2TIxWgjYO4D4FqIrY4yCX5jzI
X-Received: by 2002:a05:6512:32c7:b0:59f:6947:7e7c with SMTP id 2adb3069b0e04-59f6d34d001mr4165286e87.9.1771435101026;
        Wed, 18 Feb 2026 09:18:21 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f568d95sm4644958e87.30.2026.02.18.09.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 09:18:20 -0800 (PST)
Date: Wed, 18 Feb 2026 18:18:16 +0100
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
Message-ID: <aZX0WB_6qPoCYVvC@Lord-Beerus.station>
References: <cover.1771353301.git.stefano.r@variscite.com>
 <3e79c4d806b8b8024b71bc99c36b09a2fbb90a65.1771353301.git.stefano.r@variscite.com>
 <CAOMZO5CAb8738HdH49WcY-JPTzQ90n4Bnmyn96_3jfw47mxOug@mail.gmail.com>
 <aZTEm8nUUVcKZH0v@Lord-Beerus.station>
 <aZXqSz_OsCC64P7i@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZXqSz_OsCC64P7i@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_091823_801550_D65049AC 
X-CRM114-Status: GOOD (  20.75  )
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

On Wed, Feb 18, 2026 at 11:35:23AM -0500, Frank Li wrote:
> On Tue, Feb 17, 2026 at 08:42:19PM +0100, Stefano Radaelli wrote:
> > Hi Fabio!
> >
> > On Tue, Feb 17, 2026 at 03:59:33PM -0300, Fabio Estevam wrote:
> > >
> > > What about users who still have boards with the Broadcom Wi-Fi chip?
> > >
> > > Will Wifi on the old boards stop working?
> >
> > The Broadcom-based WiFi module was used on earlier revisions of the
> > VAR-SOM-MX8MM. That hardware revision is no longer in production and
> > is not available for new orders. All currently manufactured and shipped
> > VAR-SOM-MX8MM modules integrate the NXP IW61x instead.
> 
> This common problem, we met similar case. After replace new compenent, it
> should be new boards, or new revision.
> 
> I don't suggest directly replace it to broken old one. You can create dt
> overlay files for new boards.
> 
> Krzysztof Kozlowski:
> 	how about other vendor handle similar case? Any guide line for
> that?
> 
> Frank
> 

Thanks for the feedback!

We understand the concern about potential regressions on older SOM
revisions. However, since the wireless module is soldered on the SOM
and not configurable, we are aligning the upstream device tree with
the hardware revision that is currently in production.

This change also aligns the i.MX8MM VAR-SOM with other VAR-SOM
platforms already present in mainline (e.g. i.MX8MP, i.MX93), which
use the IW61x wireless module as well. The intention is to keep the
VAR-SOM family consistent in mainline with the hardware that is
actively produced.

If there is a strong requirement to preserve an explicit description
of the older Broadcom-based revision in mainline, we can evaluate
adding a separate description.

Best regards,
Stefano

