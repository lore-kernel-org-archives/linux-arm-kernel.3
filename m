Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24686CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 16:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PErgUidAcsRKwUXeMVve1SYZIwtC3TkFLkv19Pikhc=; b=vSU4wKiX/csEJ+Ky2yEM3VmC3Q
	1rfOnLNxlg13uYAcAZ0Jaw8+d0ReP1+NtrzO36BucyB34HlM726kcqxL33WvmPgivuKM8eER68fwu
	6yy7ZPPuuxqc66mlrTBbB0+VtFB1UCuADLZxCRRi52mmrbjONe37iFMsfi7s42Kdc6lECm2U714Ys
	UjIzvT5q7c2CM90NhXg+y6L40XjFT2jH6069CsnEmMi1bRj3J4tcGu0bolEfNXNfJny86t8uO5Nq5
	rsTK47fdg61BUSQn87aFpShyKFB/LWBxT68GhQFltfge5nvr7DnUzCAu/G67tJiHG3N6c+Trnrto1
	ABGjs65g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7G1S-00000008yln-3dHP;
	Fri, 10 Oct 2025 16:31:15 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7G1P-00000008ylI-3pxY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 16:31:13 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3322e63602eso3151971a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 09:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760113870; x=1760718670; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+PErgUidAcsRKwUXeMVve1SYZIwtC3TkFLkv19Pikhc=;
        b=FgDaQ26gsqVoqsa2I5nOd5kkgV8dwb5eMB4RyOP6UqULY0XHK2WAOyLw6vVUnTOtOK
         dO9hzxROt9yIU70yDl22xxM+m08XvlmwK4At4r44SNzIPyhGJm4UMZQbxuiHAyHiXM44
         m4eOUftwegxcAHRdpkPLSmaJc7i0eiAmdml1plGNj4H8f4H8DfmHcp+T2zSvc2mVJVC2
         qXYUEWMQmG7KbtqeT8FpKKCUqJ6AnUnRRT7UweREl/Xux/BakxTbVtK3+Ach4p/h1Y8H
         eb7fDzPuLK5S2GvIxjjAch3iJWkcMRkfK3wOwTFJASOejSl9+4tB2Xik7FTmi8YdJ1ly
         y/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760113870; x=1760718670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+PErgUidAcsRKwUXeMVve1SYZIwtC3TkFLkv19Pikhc=;
        b=hJx1NC4Yva1gy9DtBdV+Aseiv/JZMcWtz3XCsbEteSNyslfEGJ3bxvCjb4gl3o9XxO
         J+NM2cBfveZrkcZna/EakB1/uXi1bje1Z52I66/BkmZt7nx5pX9DATubxDzsM82bIu0a
         18mFHZUkq9xDDGbgf6o/295+6pkZnx00TK8zleqPB/1+I3W6UfHGqFGV/Py1T8fCcqHH
         HpWI+wLM+27whDfTAyFCAtl1BPeuNLHwvaXAgNte8R/kMzY+DHldYR72t8Qkkgxvgwtg
         iXN40m8SUVxcsDf0HLB7L3n3Nuf05dspqrXghUp2tcvJw80fqN0V3jvsp3kOUDiMk7Fb
         vMCA==
X-Forwarded-Encrypted: i=1; AJvYcCUI7AjqMmUKp1JKTVVTEOhQ5L833Vu2tqe4wIu7mgdeH0S+1kuAWdUupXkey4goW6od7yPJ9T+pZrQuMsg3hVs5@lists.infradead.org
X-Gm-Message-State: AOJu0YxzruJcApzY3lIVYqJpCX+rf8aQz6YiqZnkwy7GMzIsruFqGORH
	7EO3SzUW/m2zj2kp5CULS7isCZuPsN2uWULzNudG/xOGHvbNRfEmYx8zmlEWyIzYkmQ=
X-Gm-Gg: ASbGncvMAO7VR1WsViry0Rilt+p4U1qEsiYfbfwUkXrkVi9xIsFcbTg0FPelydp5tuF
	/u0nf3iXWB37QieQyhmxS3uOcguzJQxYbTq8hPoHRoxqagYjKPUbKw79ByBXqJhOJdo2obMgnNs
	Lem8inolipNZdX/rbc9L603waMQc3TBv/Tn24J9MUVGtp+Cnj/xR5FbzxGS5UgQUoGKW++4MAFE
	oEOGWedOvWRtWZLvR+FLF7FreeZHam2L84vEYsESyE35nnZOvAmqPGo7FsTK8CkPKx7muSSzyn4
	qSz+9Jpv0scuk37FFq+aYKnlAcvm4MXafZQRpTXbTWq+SRC8jUwJoOyQ9ghxlZ+NQ4QFoqO/58i
	QlYL4us2Cus9bkGgvC/KPsbBrkWrNNpLPvSKkg/cbtPbhnh4=
X-Google-Smtp-Source: AGHT+IEy8L6TDg54FExTrOyXceAe8pz/QOf459ho/0ZYB36VftdLiczXdkNEiG5CFEJM6POervy4bQ==
X-Received: by 2002:a17:902:fc46:b0:27e:ef12:6e94 with SMTP id d9443c01a7336-29027418f97mr152883735ad.55.1760113870428;
        Fri, 10 Oct 2025 09:31:10 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ad30:d3d9:45c5:4a3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f8f9bbsm61182205ad.121.2025.10.10.09.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 09:31:09 -0700 (PDT)
Date: Fri, 10 Oct 2025 10:31:07 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Shenwei Wang <shenwei.wang@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH v3 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Message-ID: <aOk0y8xTi9hoGvyX@p14s>
References: <20251009222716.394806-1-shenwei.wang@nxp.com>
 <20251009222716.394806-4-shenwei.wang@nxp.com>
 <eb99d9a8-eb96-445d-899a-6e1d9b6f6c69@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb99d9a8-eb96-445d-899a-6e1d9b6f6c69@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_093112_116185_76739C32 
X-CRM114-Status: GOOD (  18.33  )
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

On Fri, Oct 10, 2025 at 12:58:38AM +0200, Andrew Lunn wrote:
> On Thu, Oct 09, 2025 at 05:27:15PM -0500, Shenwei Wang wrote:
> > On i.MX SoCs, the system may include two processors:
> > 	- An MCU running an RTOS
> > 	- An MPU running Linux
> > 
> > These processors communicate via the RPMSG protocol.
> > The driver implements the standard GPIO interface, allowing
> > the Linux side to control GPIO controllers which reside in
> > the remote processor via RPMSG protocol.
> 
> I've not seen the discussion on earlier versions of this patchset, so
> i might be asking something already asked and answered. Sorry if i am.
> 
> Is there anything IMX specific in here? This appears to be the first
> RPMSG GPIO driver. Do we have the opportunity here to define a
> protocol for all future RPMSG GPIO drivers, which any/all vendors
> should follow, so we don't have lots of different implementations of
> basically they same thing? So this would become gpio-rpmsg.c and a
> Document somewhere describing the protocol?
>

I haven't looked at this patchset yet but I think Andrew's proposal has merit.
 
> 	Andrew

