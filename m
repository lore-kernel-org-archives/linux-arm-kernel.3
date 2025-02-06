Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549CEC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 12:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+k8Ga6Qst85KoJ7YqADf5P3tQdSviLmFNQm0uA5O60=; b=LSvsvRVpkZC9yg/ZFHtGzQiYN0
	vZT8qr/6htwXNvmZwY6NSfYk9V1AYSjTBNhC/qO5itFbWK6v0ggpUFXOShSnhDtp5p0UT/dZBtecn
	jWutogYDaiGcq0aTTvXFfC1gdZ9d98HP9mVA5ekEtaiS0tszc1YK0Bs/NIFOFrgDsr2XqqdqZUc7H
	JWc1RJoE/M1wN9Sx3gHC56MqFuByrM4tAau4YgGBJAsFUEGi4mTBm4NiqfWBHhFh8U25EfHG4QWax
	2GYTlvMEm2GIfRrrnCw+kQ9uVNiw6y1MyeIKyos6bRMGjq3tHLtXJQm3m4iaIALNIxmq4ivaxfVSf
	goXk4l4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0YJ-00000006Deg-3snk;
	Thu, 06 Feb 2025 12:00:15 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0L2-00000006BjC-0rzJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 11:46:33 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso744431f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 03:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738842390; x=1739447190; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S+k8Ga6Qst85KoJ7YqADf5P3tQdSviLmFNQm0uA5O60=;
        b=ho9zEHvIYOrm38a8m1KI382bbnJcu6NAfxTfHWZY6qslRX6VhIW37Z0jP5/ps5++z5
         rUi7vytcmmZxkvvZTzGDwHDTfW0TkrJmXnU1pw0tvE5GtXhBnS3Z7x3xo55aUpixDK/P
         tXUBoq+IrYEvgFgqt1Uq9Ki05Kudbkbsqbagfddc33FZYo1A/zo4CX0417SMIKDb7I4H
         lO2dmp1jytzSvPSoLFRAQBFbRcz0j7uD8X/iuzu4sOXxkvQxUmdZeeLT/O5ldrRtqDIe
         +gnsrLePRKNcDtm0ekpff9sN2rPGY3hrtG+by4lUENp3GAzhfb1+JvWGeFwuMj8In8x9
         rpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738842390; x=1739447190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+k8Ga6Qst85KoJ7YqADf5P3tQdSviLmFNQm0uA5O60=;
        b=nvYAqwDQtIzQzZfXaNrvB1S2lz3JyvmCDmEe+jX2peUzhs/sRK/mED1YM6c79iKhHX
         C2WLWS1yQbr+3nYdbc8aTcg476mJxiEVpwpOH1VIBmJzsubxIlseXTJHvTWTvqJ8coh3
         TP31Y88f9BwdpTDqt+Pvhl1yaUUuoNwFPlYzdUMpYQHqxEemTd/G517t1CKjZT0FBREB
         et0Ds33O4TVVce000w2qFXfSzyVhhqMloGhf0hPu6sbQnQ/mc4xdS/LjNR+mwDXJOGKj
         mWaWArzh08qgbuMGtACV9EzdapBF2kGb1Je1k5FYXu64sXMT+i2KZzBwLT3YgV36/Nt7
         vIsA==
X-Forwarded-Encrypted: i=1; AJvYcCUS0qYrityklfqn3crl2DBC/5LW8LQN7+dkMfdI4ClWaHyBjle+CZOqeWhp67C7qkhGdAPFPUXUueHKU1ZohQx5@lists.infradead.org
X-Gm-Message-State: AOJu0YwQvgmW9S9ZB0SnoFI6YSBEsTeHZDWa2oJnQOT/cTtCb3nSZPW/
	YB00t++lpuAd14KD1PMf2Cx7xVTk2k91TcrDQJ8DB3hhadBSIEXwoPniQtZ+8zA=
X-Gm-Gg: ASbGnctzid16qCMXcQ7HC/PN04en5Mi/4xGHYiP1veGwC10XLXsaGju7incimhglYpg
	sTuoY/J+0VIlhegnKMbRd3KD5dDjY2SUoae/KJuv9nSCQtCJskvbUT9Y54zbfsn8UpiNM+ipNY7
	K4SvOG9KPA/d2aT0tLbLCbzbmaIXVike9Eel3pnr3wudCgPX5XhffWhnR0Sb/AXKnHK5CL4DJIn
	tXUT6KA+nt1bruPgtZA3Gw6ndLXFMpKT1xpbtpNkzemYTprhC7FJLE4O0fLQw93qpSG41dil6vW
	Vws5L282zVzzU27Hw3nN
X-Google-Smtp-Source: AGHT+IEErhO90EdplG1wZoluik8CF2AbSDTMnm0SPZkrxbnqggqrDc2mlAX4JRbsHtEmSfgQX/5rGA==
X-Received: by 2002:a5d:6acb:0:b0:385:d7f9:f16c with SMTP id ffacd0b85a97d-38db4912832mr4737364f8f.46.1738842390567;
        Thu, 06 Feb 2025 03:46:30 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38dbdd55656sm1542702f8f.50.2025.02.06.03.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 03:46:30 -0800 (PST)
Date: Thu, 6 Feb 2025 14:46:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 2/4] firmware: arm_scmi: Add machine_allowlist and
 machine_blocklist
Message-ID: <119bdeb3-f1d4-4f35-bff3-190eccc7c325@stanley.mountain>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-2-3af2fa37dbac@nxp.com>
 <230612a4-92ee-4acc-85bf-f1c47dc3c35b@stanley.mountain>
 <20250206110508.GB22527@localhost.localdomain>
 <15f20562-d5f3-4432-94e1-06c8174bf3c1@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15f20562-d5f3-4432-94e1-06c8174bf3c1@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_034632_248040_56D5C5CA 
X-CRM114-Status: GOOD (  26.41  )
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

On Thu, Feb 06, 2025 at 02:40:11PM +0300, Dan Carpenter wrote:
> On Thu, Feb 06, 2025 at 07:05:08PM +0800, Peng Fan wrote:
> > Hi Dan,
> > 
> > On Thu, Feb 06, 2025 at 11:02:04AM +0300, Dan Carpenter wrote:
> > >On Mon, Jan 20, 2025 at 03:13:30PM +0800, Peng Fan (OSS) wrote:
> > >> From: Peng Fan <peng.fan@nxp.com>
> > >> 
> > >> There are two cases:
> > >> pinctrl-scmi.c and pinctrl-imx-scmi.c, both use SCMI_PROTOCOL_PINCTRL.
> > >> If both drivers are built in, and the scmi device with name "pinctrl-imx"
> > >> is created earlier, and the fwnode device points to the scmi device,
> > >> non-i.MX platforms will never have the pinctrl supplier ready.
> > >> 
> > >> Vendor A use 0x80 for feature X, Vendor B use 0x80 for feature Y.
> > >> With both drivers built in, two scmi devices will be created, and both
> > >> drivers will be probed. On A's patform, feature Y probe may fail, vice
> > >> verus.
> > >> 
> > >> Introduce machine_allowlist and machine_blocklist to allow or block
> > >> the creation of scmi devices to address above issues.
> > >> 
> > >> machine_blocklist is non-vendor protocols, but vendor has its own
> > >> implementation. Saying need to block pinctrl-scmi.c on i.MX95.
> > >> machine_allowlist is for vendor protocols. Saying vendor A drivers only
> > >> allow vendor A machine, vendor B machines only allow vendor B machine.
> > >> 
> > >
> > >I think patches 2-4 should be combined into one patch.  This commit
> > 
> > They are in different subsystems, so I separate them.
> > 
> 
> I mean if the i.MX driver prevents the generic driver from working then
> we need a Fixes tag.  It really makes it simpler to understand and backport
> if they're sent as one patch.  Normally we would collect Acks from the
> maintainers who're involved and but still do it as one patch.
> 

Wait.  Just to be clear.  Does PATCH 1/4 fix that bug so that when both
are built-in then the generic driver works?  This is in some ways an
alternative way to fix the same bug as well as being a cleanup?

regards,
dan carpenter


