Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7D4606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 16:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ubke3jVf;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DkWrHJ7l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rmtUDKQ0yoNlGhv53ScFwXXOWxSmXa4pTOke6+QnPrc=; b=Ubke3jVfub5vFGZmchbwGsrTXz
	YA2A/BIhuTIC0KMtZRWOngr0UtIJn0Nt4CAeiHd3UCWgU6Ns0uJ54vgMNaHoMhm0p6jQQXpuW4wDL
	XLTXVIu3c2YKYSGiSX6Ar2k9A79lp+KMnlJqmsPMy7TPsn8boLYp3ejkGkFBlm7Hd1U5CcvOrUKrD
	oDIPAAgt6c4XsBPjCJEU5q9ETIyjn+XsSsnchGFm0WTLAXL1PA1cBaLvko6/Io228Tr8qcyC9ZS3T
	QEzpfDF4JyO+1HoB8Gejf9TtupZ2rPWMEVAuyepDUIlHrmXFwsBSQLirdR+hkGy6kewSNmf1YhK6u
	7tNL5EFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6r2-00000007ah0-05jd;
	Wed, 28 Oct 2026 16:50:24 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6r0-00000007agJ-05lT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 16:50:23 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso13156405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 09:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793206220; x=1793811020; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rmtUDKQ0yoNlGhv53ScFwXXOWxSmXa4pTOke6+QnPrc=;
        b=DkWrHJ7lfk2CGx8BpshHlg1fdep1/x9J4IFIYjIfjubfAtWO0dyp0OUOVTW3uttvig
         kYPT8NJXZRc+bFbhAeQPk/McI6dSu4B5+EHIDFt7n30FBmZLFp7U36eKktIQxtA4D146
         vepm2AGkB9zDpHZEvC+PFddxq5pL/nNF6ngnI35Ikp7s4yQ4l+Ebz3oigWQzcrALp84f
         LfUMmCe++ozvMVPMskz36y8y2b8dRgFsz9baimqgkZ7a1tZMI1janPggja/hJbTnaJ4A
         kxKPDOS/SJd9oPSsx9uS1EyXsB/BLzTQhdOocucIxRZzMbAbfGgfdcYQtwmHiHIG9DCq
         gqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206220; x=1793811020;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rmtUDKQ0yoNlGhv53ScFwXXOWxSmXa4pTOke6+QnPrc=;
        b=O8kxo3gHI4nc1Ium81HBxGJYw3+k7IEhgNQ5rDKHBB9I7TQ6UuvnMfcvMHsWHC5GuT
         QjPVQA81FKUy4g10jmRKdne30kmg6K/3bX+5o2xu9mnxy05Cs8xr514P/snNb9QJYWet
         oEF4bA4tFdd+lAF2gyHjvppFj2lwu0aCV0FDJCh6ODLJp7k7THj61K3Ra8Kp6uGxlQCP
         LN4opfOG3KrhoFHkmkjfuJ5+sykgVkOaZaz5o6JiBBTaKjCAoMuFj2owdkKDEOrgvbPQ
         0xBgFd1GwI016GndaWTDND6qZLn1rnC4zxd1V11UiarOh55kEqQyUAau5WkO+UyR+mIP
         Tusg==
X-Forwarded-Encrypted: i=1; AKwUvBzryLhYYxOBKxRsgVHv+17iuJhSPsm3haZxfc6FHESTH28dp2IaV7eKShHJPk9sldDVjg3xABghQOdTqdol0fvC@lists.infradead.org
X-Gm-Message-State: AFq9FYIDRzq34itlHkOLoEWPXpAFMdPD/XzWZh0ql4vJIRRYhFPeAUvl
	0bd7wAtg479ZW+6ffLEe7TNTcrkGQVHF3aonuXo6sdbrF8UUYUEc4qttlNf1oH94gCg=
X-Gm-Gg: AYBFou001tzpxYTqxapRiRXeYxpirvAHv4gMAXES3/lWbW+A0irbopPmzanHupvWkSY
	l8gCToiylvlXaXguU70myZkK6niCqMWpCWog92EAf9TsyTSkSMj6hUW+6end38g2049eQvHWn0h
	oTAmZPR3H8i9SeXXEIGXzp6e/Rj9mhYL1NlbDeZJwbeF9Zwv6A1vSbiObL2M49NrGf9J04oJR/k
	c4IeSjeLDWCGrqsLaKoyiUw27WMfT4ceZLGLYMpa8XEcvJZ8bvqdntsJRLdenz8yoFK/KZCLVlq
	B1fzI96emnbwIlQnu1Lzut7SNMesz0SHxo5jyuUnom/7Qa9QVoRFuh5ZZtLf73HvNeiRJT8Y+Ee
	if2NTCpsFqx+n8a4tFId5FNUxajZkDFO9Xi9NvFW20NcUeIeWgmGgKJys4uLe7Sz6ZLB8HrBd8P
	prhjqxLZPGkum6L0rzT540OJUiafQgcdwQF67JmzSS9+E7ipA8+sMiFFG2fJG7MwV9DyWh65VvJ
	ZbveReJTfmI5T3Wp4VU8bA8fBs0P0RnO6AcePS9w4gfQHKHc/vuwsK852notA7zT8gpSohPNBCg
	Ix4BHjXXBfo54wCBotn16Eyl/7Zt
X-Received: by 2002:a05:600c:1986:b0:4a1:fae5:f2e2 with SMTP id 5b1f17b1804b1-4a9643d5154mr61518125e9.4.1793206219964;
        Wed, 28 Oct 2026 09:50:19 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94e4be4b2sm38091265e9.2.2026.10.28.09.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:50:19 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 28 Oct 2026 17:54:12 +0100
To: Guenter Roeck <linux@roeck-us.net>
Cc: Gary Guo <gary@garyguo.net>, Andrea della Porta <andrea.porta@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pwm@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH RFC 0/4] hwmon: Add fan tachometer support for Raspberry
 Pi RP1
Message-ID: <auIotAwnOWKNApjp@apocalypse>
References: <cover.1792748690.git.andrea.porta@suse.com>
 <7df58d42-517c-4936-88b0-9d044d30882c@roeck-us.net>
 <auBzvB8TsvIK8Hik@apocalypse>
 <53a4b4bb-271c-4d2d-a9e4-cec4e0ce214b@roeck-us.net>
 <DMFPE71J8205.3FZKD5BKW3U7C@garyguo.net>
 <b02b4f0b-ad2c-453a-b69c-a0865a333d62@roeck-us.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b02b4f0b-ad2c-453a-b69c-a0865a333d62@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_095022_093828_6FDDF6BE 
X-CRM114-Status: GOOD (  43.24  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09:13 Tue 27 Oct     , Guenter Roeck wrote:
> On Tue, Oct 27, 2026 at 10:51:15PM +0800, Gary Guo wrote:
> > On Tue Oct 27, 2026 at 9:48 PM CST, Guenter Roeck wrote:
> > > On Tue, Oct 27, 2026 at 10:49:48AM +0100, Andrea della Porta wrote:
> > >> Hi Guenter,
> > >> 
> > >> Yes, I also proposed that in the cover letter because auxbus seems also a viable
> > >> solution.
> > >> 
> > >> The current implementation is a consequence to the discussion about the companion
> > >> PWM driver, from here (and the revisions that followed):
> > >> 
> > >> https://lore.kernel.org/all/cover.1775223441.git.andrea.porta@suse.com/
> > >> 
> > >> To give a short and hopefully coherent view of the decisions, here's a breakdown:
> > >> 
> > >> - first proposal: PWM driver + fan hwmon (to read the RPM), all in the same driver
> > >> 
> > >> - V2: Uwe preferred to split the PWM driver from the hwmon one, so the hwmon was
> > >>   dropped from teh PWM driver in favor of a future (fan) driver. To accomplish this,
> > >>   I moved from readl/writel to regmap + syscon.
> > >> 
> > >> - V8: Gary proposed to export a function to read the fan RPM as a viable
> > >>   solution. As a result, the regmap/syscon was dropped as it was no longer needed
> > >>   and the function has been exported from the PWM driver
> > >> 
> > >> - new patchset for fan driver: the now independent hwmon moodle just call the
> > >>   exported function from thw PWM driver.
> > >> 
> > >> If the auxiliary bus is indeed the preferred approach, I'd like to ensure we are
> > >> all aligned, as this would also require refactoring the PWM driver.
> > >> 
> > >
> > > Let's say it that way: If you don't want to implement the auxiliary driver,
> > > and you insist using the exported function, I would prefer for you to go back
> > > to the first solution. The one thing I really dislike is conceptually broken
> > > code, and I consider the current approach broken. Your call, but the one thing
> > > I won't accept is the code with the exported function.
> > 
> > I agree on the auxiliary driver part. However, I don't think EXPORT_SYMBOL_NS is
> > an issue, and regmap is not the right fit here:
> > 
> > - Previous version of the PWM1 patch series publish regmap using
> >   of_syscon_register_regmap, but this cannot be undone -- which needs to happen
> >   on PWM device unbind (the RP1 PWM device is itself platform device, but RP1
> >   chip itself is PCIe device which must be removable).
> > 
> > - The tachometer register is not its own separate register, but rather (re)using
> >   the phase control register. The phase control is not implemented in the RP1
> >   PWM driver on the list yet, so this is currently a simple register read -- I
> >   can see that RP1 PWM driver need to take special care to about the tachometer
> >   reading if the phase control is implemented.
> > 
> >   For the two reasons above, I think the way that tachometer is read should
> >   really be an implementation detail of the PWM driver and not for the hwmon
> >   driver to worry about, so I suggested using EXPORT_SYMBOL_NS.
> > 
> > - EXPORT_SYMBOL_NS is the documented way for exposing functionality from parent
> >   device to auxiliary drivers: https://docs.kernel.org/driver-api/auxiliary_bus.html
> > 
> 
> Let's agree to disagree, and keep the code in the pwm subsystem.

And auxiliary bus it will be. I propose the following:

- drivers/pwm/pwm-rp1.c: create an auxiliary device for the fan. The function to read
  the RPM will not be exported, but a function pointer will be passed through the
  private data to the fan driver. No need for regmap. To be taken by Uwe.

- drivers/hwmon/rp1-hwmon.c: The auxiliary driver is probed against the device registered
  by the pwm driver. No imported function. To be taken by Guenter.

In this way, we decouple the two drivers and we leverage the auxiliary bus paradigm.
Also, no DT node needed for the fan.

Do we all agree on this approach?

Thanks,
Andrea

> 
> Thanks,
> Guenter

