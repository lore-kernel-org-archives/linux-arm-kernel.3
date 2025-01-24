Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8E2C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 10:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGTlLozxCo1nf43/X/aagzssis+Atz8YpkZYRRrzAY0=; b=0md9/jYeSeprFUFnln3kWUx1ON
	GWnpcn5VUw4aUMCU04bd2XauMMDSSQ5HP7yHhJ/edFpeeW9FGoLa2BX0llvd69prNmNAxkAp2YAfl
	h2ZTXltt1n83794OqA5G3waKwKO81aIWoCtOV9KPqhA1e5OqMLgeO2s2z6jwyIfxrOcrTrOED6iYU
	jkzwblcZMkmGVwLOjWw/qj7Sb2rzW9jy2tooOHEKwswO0JB8iOiXtvnXg0gy4unIwfSemBCb08fAk
	+48b+6X3eJp6PgaQqSPGGjTkzDSiglZ+DVVvpYXC9aQ2JOvmR6WxcVir0jF63STteC/BsDvEOqefN
	QMfq5Nug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbHKT-0000000EVJg-0E3B;
	Fri, 24 Jan 2025 10:54:25 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbHI0-0000000EUxQ-3Kzg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 10:51:54 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-38a88ba968aso1867361f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 02:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737715911; x=1738320711; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tGTlLozxCo1nf43/X/aagzssis+Atz8YpkZYRRrzAY0=;
        b=WxdWwH0xC6zlxqdq7aWa5hxKXewezpyV6FCBGDNOsAJOktn4F0zT1ppkARSX/XfvVb
         FfGC1u2iRcD4Ac4nxj6pS3bgkESikKXjD85+hOyhSsFxIUZq0s2wSxJGbn0i/7/ueOkT
         5in/cPiT7EvVK0FGji1RSm2cEOozvsqoPksu7I7PrJRsO/C/qEeD42S9dl/CACvewOz0
         AaqmS/MJpmAkKBXl+Foxyv2h/lg8FScGlbvzOCCW1kfHDgjQKOJXxMONWf0NGFDu4oe4
         NnI0t20GgNj/uWZmA575Zh7zdzXoC00qzcwYEC7IvoxEaqOng/i0OQwkD936kx/HWQ+R
         2Siw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737715911; x=1738320711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGTlLozxCo1nf43/X/aagzssis+Atz8YpkZYRRrzAY0=;
        b=xIHRwqbMdgmMtxV9kvmmbsDv0w7H1GqJabce+tfOhFPTjvzCSET56dy4cuGLjsey73
         bof+M8GRVP9vvMfxbdjZelK41l2DXAQAJ59sZavstHYJ+r3O8PY66aW7PQdpOxk6ygFS
         cjnURZn+jzhbSF46JqAPG6mo7jVLZFHeg6uOITILe3/ZzO6M8WRTiWvESr+gWzC3lkbm
         osXIRUiL25osqRz0XL/8bAEBn11/UJhWcl1j/M8Gkwi1PKKxEw2TZUtBj27s8R7H+DCQ
         QVR0e2BQmlzjsHHAPz01I1j+O0wNFzEFYV4XxcHm3Ew2LGlLucaa2Wdqv7U4sDclJTIK
         4Bnw==
X-Forwarded-Encrypted: i=1; AJvYcCW+laiYrrJmOXAM2H2B3FuaLNRVOCAHMjbosneqePhlIpMehhlWuM76KX87gWjjs1OmKgbTkJSoZ06yKzafc+Ky@lists.infradead.org
X-Gm-Message-State: AOJu0YxgsrGtwBZSYB6KRE+mMWkhSKk2/jMUX2GTS+pMWnbrEsWP1ATn
	6EE9Vtt/FN/eK3/hbh9NnJgULBcgqRtB4gWkMn2cEG3fl81zB9cZSWhwWIJ7ijg=
X-Gm-Gg: ASbGnctlv/cun1sGDIbEjKwLDtyG+L1HmAXIVKhGXlCWTO5DLeLaNtVA/WEuqyzmvju
	sGUs/EDGOEuUMYZpPLoIaHUJUkk/PrQnXPdkF6/x5LbzsoJ81z0r3OW7xDatLAtwxdZEWhaQrFN
	XrX/OX91HNteM/88pNhKdYdesMf2w9nWMiy7oaK9UML2MULuEuCcWD7pbB5+jPVEX4v+FLYMF7m
	f8n3lxLLyepat7Ti88coBsY/C9DsRS4ZARQ249E7Ks93+E8DC6/fU7Fz69/xJzfI5IN3FBoE2ut
	3JcmNnJ7vg==
X-Google-Smtp-Source: AGHT+IFYQo9jNiHBgOR8bRaxcWjkfxh6Y7QIEImm5C6fb5pC+YqVIPsrpJEhp0PabuCFZK+cqqd41g==
X-Received: by 2002:a05:6000:2a6:b0:385:eb7c:5d0f with SMTP id ffacd0b85a97d-38bf566a239mr28879962f8f.26.1737715909296;
        Fri, 24 Jan 2025 02:51:49 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c418esm2332243f8f.95.2025.01.24.02.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 02:51:48 -0800 (PST)
Date: Fri, 24 Jan 2025 13:51:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: zuoqian <zuoqian113@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Ionela Voinescu <ionela.voinescu@arm.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"viresh.kumar@linaro.org" <viresh.kumar@linaro.org>,
	"cristian.marussi@arm.com" <cristian.marussi@arm.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] cpufreq: scpi: compare against frequency instead of rate
Message-ID: <d7e5ba38-046f-49ff-8201-409756218e75@stanley.mountain>
References: <20250123075321.4442-1-zuoqian113@gmail.com>
 <ad11dfc1-5e88-4421-b427-3955d4220133@stanley.mountain>
 <Z5IzMhTOhtujyH0n@bogus>
 <8ebf8f26-c3d9-43c0-b417-ce3131a84eb4@stanley.mountain>
 <6793606d.050a0220.a73fe.0803@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6793606d.050a0220.a73fe.0803@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_025152_855000_A421C66E 
X-CRM114-Status: GOOD (  44.78  )
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

On Fri, Jan 24, 2025 at 09:42:01AM +0000, zuoqian wrote:
> On Thu, Jan 23, 2025 at 04:04:13PM +0300, Dan Carpenter wrote:
> > On Thu, Jan 23, 2025 at 12:16:50PM +0000, Sudeep Holla wrote:
> > > (for some reason I don't have the original email)
> > > 
> > > On Thu, Jan 23, 2025 at 02:12:14PM +0300, Dan Carpenter wrote:
> > > > On Thu, Jan 23, 2025 at 07:53:20AM +0000, zuoqian wrote:
> > > > > The CPU rate from clk_get_rate() may not be divisible by 1000
> > > > > (e.g., 133333333). But the rate calculated from frequency is always
> > > > > divisible by 1000 (e.g., 133333000).
> > > > > Comparing the rate causes a warning during CPU scaling:
> > > > > "cpufreq: __target_index: Failed to change cpu frequency: -5".
> > > > > When we choose to compare frequency here, the issue does not occur.
> > > > > 
> > > > > Signed-off-by: zuoqian <zuoqian113@gmail.com>
> > > > > ---
> > > > >  drivers/cpufreq/scpi-cpufreq.c | 5 +++--
> > > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/cpufreq/scpi-cpufreq.c b/drivers/cpufreq/scpi-cpufreq.c
> > > > > index cd89c1b9832c..3bff4bb5ab4a 100644
> > > > > --- a/drivers/cpufreq/scpi-cpufreq.c
> > > > > +++ b/drivers/cpufreq/scpi-cpufreq.c
> > > > > @@ -39,8 +39,9 @@ static unsigned int scpi_cpufreq_get_rate(unsigned int cpu)
> > > > >  static int
> > > > >  scpi_cpufreq_set_target(struct cpufreq_policy *policy, unsigned int index)
> > > > >  {
> > > > > -	u64 rate = policy->freq_table[index].frequency * 1000;
> > > > 
> > > > policy->freq_table[index].frequency is a u32 so in this original
> > > > calculation, even though "rate" is declared as a u64, it can't actually
> > > > be more than UINT_MAX.
> > > >
> > > 
> > > Agreed and understood.
> > > 
> > > > > +	unsigned long freq = policy->freq_table[index].frequency;
> > > > >  	struct scpi_data *priv = policy->driver_data;
> > > > > +	u64 rate = freq * 1000;
> > > >
> > > > So you've fixed this by casting policy->freq_table[index].frequency
> > > > to unsigned long, which fixes the problem on 64bit systems but it still
> > > > remains on 32bit systems.  It would be better to declare freq as a u64.
> > > >
> > > 
> > > Just trying to understand if that matters. freq is in kHz as copied
> > > from policy->freq_table[index].frequency and we compare it with
> > > kHZ below as the obtained clock rate is divided by 1000. What am I
> > > missing ? If it helps, it can be renamed as freq_in_khz and even keep
> > > it as "unsigned int" as in struct cpufreq_frequency_table.
> > > 
> > 
> > 
> > I misunderstood the integer overflow bug because I read too much into the
> > fact that "rate" was declared as a u64.  It would have been fine to
> > declare it as a unsigned long.  The cpufreq internals don't support
> > anything more than ULONG_MAX.  I have heard someone say that new systems
> > are bumping up against the 4GHz limit but presumably that would only be
> > high end 64bit systems, not old 32bit system.
> > 
> > The ->freq_table[] frequency is in kHz so a u32 is fine.  I guess if we
> > get frequencies of a THz then we'll have to update that.  But when we
> > convert to Hz then we need a cast to avoid an integer overflow for systems
> > which are over the 4GHz boundary.
> > 
> > 	unsigned long rate = (unsigned long)khz * 1000;
> > 
> > The second bug is that we need to compare kHz instead of Hz and that's
> > straight forward.
> > 
> > regards,
> > dan carpenter
> >
> 
> Thank you for your valuable feedback.I will make the changes to the patch and 
> resubmit it, including renaming freq and keeping it as an "unsigned int".

If you keep it as unsigned int then you will need to add a cast when you
do the "* 1000" multiplication.  Please make freq and rate both unsigned
longs.

regards,
dan carpenter


