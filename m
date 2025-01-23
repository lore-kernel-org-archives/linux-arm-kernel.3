Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAB4C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 13:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cl9194DFZdwJ8whugEX9MZlsEcPw/nky6ZU9/dikYFM=; b=eC1qGVy5Mjr6SpMxVp/CRT8c4r
	j0j/te+CoX7XIIjW+ZCCRyrUyvrLCcFcXG53GXAao1oA0jz9bgvSlphTcGIwqteWD7XQKnAmYoSoU
	//Ca/Row+yDNZNpzdGBIEM0iyPlu85dNbrjWr82XAtdys1932T1P+l6hjwYghC0Gxmb7To6PokzTD
	BIrgPZNvyBA6t+EbRO7iRK3sHdEe/Cj6cVZngp+FOvkP0GYjv3N2p8/rUzbi4sSoF1qPxZsWgULO6
	VgcKxPJAze9leZXARrcGYU8S54JtgOUX/kPQn/4wrZ5ai4c9fM6SsCWuVGvN4xNLFVyR/DMokfpgg
	rCzjVHOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tawtv-0000000CUNO-0NrE;
	Thu, 23 Jan 2025 13:05:39 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tawsd-0000000CUFn-1Lrj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 13:04:20 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43690d4605dso5927855e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 05:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737637458; x=1738242258; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cl9194DFZdwJ8whugEX9MZlsEcPw/nky6ZU9/dikYFM=;
        b=e4nSBgmIiWUZ9N7XemoS2iHpXpFUrRh+RPiSFhuUOuhjeOspwnQ4wAaasa2J0uWfPu
         +9ZMe8Uw4Rft9QMYtyx9C3L2JDrv2JOIe8QL0N82D0EDSojxjQUV4VY4RwJ8OugqGfCu
         XlANZQViPYYDj/dkA+AfunudyV+ckKO4tIF5sQpNB/KFxrx4fcAJiF/RE4NCleVe3+KT
         Kp1Wduo4wdM1EgwQFvzHYMENH9sg0naZCOSSzCbmvj8Xi6EgXF4VThW7gnf0/YUn7ezJ
         95Kba3HfBCPW2YFMSzhDDBmFCQCW8c3d3wULhgQWp1AwywTHtbCnvYEQmuUqDR2IXsju
         9Jdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737637458; x=1738242258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cl9194DFZdwJ8whugEX9MZlsEcPw/nky6ZU9/dikYFM=;
        b=WMkgUXRp6pI7H2UN26qbqC3+3psmajsEhbgvVsITSa1gbRuLvR+Z/+rPVZXrbHdCyj
         4WxgMklyQz+xOcwQvJAQn/2MBICSLPQusUbTd0tMaqEk8vhKaWaoz/7/jLhtHAcr0GGh
         x01Q48xf27Zy8Z+0MdiOeaURIUEdcV1K6dzUMDShjqz+H1v6qsV4qOogLGw4SZAQLXil
         v9y/0a4Cqhcxh4yeL3eze72ZeNKECmdUrIVriKQ/gHqYgzZT95fIgB26j1J+NJGOH6uK
         mFLlnrpk7Zx50rqbkBXlfoxUdPwZVpH5CC5bLCz5Ccqdc4S7VzghiFiFF9+DG7gqgYJa
         Np5w==
X-Forwarded-Encrypted: i=1; AJvYcCU5tAkKgv+K9VdvOwP9M3m5mCJQ5MkjcOM857dG4AA/y8G+70fUET/5oQ/IqenxTzjiSl6RE1bS5i7iv6xPGahG@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7mGAAzO1YthvOVNjUkAlU+I9/IEx5i6PoQIARUd0ZFGGwCgFz
	KmZ9BmcJnlq8qJr0BKXfjPV7giT1PE/+exc6bWt2OoKDlKAkTRwla2CdzknBy8A=
X-Gm-Gg: ASbGncsHy91UgzkD0PbEVH++NguthdD7KYDPI0C7rL/omQpHqnRhiVaWNALV6MdnLJY
	kaS2hgSO691QKGpto/wum26JceRBoSo1biaaa6aWHndFC4pXfSBJIxONzw+MaDn52pgZRpwXC7W
	Z0jaHaHXJBd9SfE6Bdu5xExd3bicGqOem6j0AsWin9LSr51nk/BtRcQRwWN692rRkANaNStyHpX
	bAtsEHfGQyJ4T8Q7wwVTWsOU2ufFTStdo0uYP8l3TtUB5ZFhsLjuFkBSevgudZgYIGFGqPF8tIO
	5qXgJqIn+2MYNUd2PtyT
X-Google-Smtp-Source: AGHT+IFfMaV0Ij3T3tldLauIZsdbGiEdyirSW5JG2BohSSJNY2hQK3fqNX1SRxOVtDQ4hJ9zH+XqLQ==
X-Received: by 2002:a05:600c:3d06:b0:434:eb73:b0c0 with SMTP id 5b1f17b1804b1-438913c7e31mr266934345e9.5.1737637457469;
        Thu, 23 Jan 2025 05:04:17 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31afa30sm64090025e9.20.2025.01.23.05.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 05:04:16 -0800 (PST)
Date: Thu, 23 Jan 2025 16:04:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: zuoqian <zuoqian113@gmail.com>,
	Ionela Voinescu <ionela.voinescu@arm.com>, rafael@kernel.org,
	viresh.kumar@linaro.org, cristian.marussi@arm.com,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: scpi: compare against frequency instead of rate
Message-ID: <8ebf8f26-c3d9-43c0-b417-ce3131a84eb4@stanley.mountain>
References: <20250123075321.4442-1-zuoqian113@gmail.com>
 <ad11dfc1-5e88-4421-b427-3955d4220133@stanley.mountain>
 <Z5IzMhTOhtujyH0n@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5IzMhTOhtujyH0n@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_050419_374882_E0E235D3 
X-CRM114-Status: GOOD (  33.54  )
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

On Thu, Jan 23, 2025 at 12:16:50PM +0000, Sudeep Holla wrote:
> (for some reason I don't have the original email)
> 
> On Thu, Jan 23, 2025 at 02:12:14PM +0300, Dan Carpenter wrote:
> > On Thu, Jan 23, 2025 at 07:53:20AM +0000, zuoqian wrote:
> > > The CPU rate from clk_get_rate() may not be divisible by 1000
> > > (e.g., 133333333). But the rate calculated from frequency is always
> > > divisible by 1000 (e.g., 133333000).
> > > Comparing the rate causes a warning during CPU scaling:
> > > "cpufreq: __target_index: Failed to change cpu frequency: -5".
> > > When we choose to compare frequency here, the issue does not occur.
> > > 
> > > Signed-off-by: zuoqian <zuoqian113@gmail.com>
> > > ---
> > >  drivers/cpufreq/scpi-cpufreq.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/cpufreq/scpi-cpufreq.c b/drivers/cpufreq/scpi-cpufreq.c
> > > index cd89c1b9832c..3bff4bb5ab4a 100644
> > > --- a/drivers/cpufreq/scpi-cpufreq.c
> > > +++ b/drivers/cpufreq/scpi-cpufreq.c
> > > @@ -39,8 +39,9 @@ static unsigned int scpi_cpufreq_get_rate(unsigned int cpu)
> > >  static int
> > >  scpi_cpufreq_set_target(struct cpufreq_policy *policy, unsigned int index)
> > >  {
> > > -	u64 rate = policy->freq_table[index].frequency * 1000;
> > 
> > policy->freq_table[index].frequency is a u32 so in this original
> > calculation, even though "rate" is declared as a u64, it can't actually
> > be more than UINT_MAX.
> >
> 
> Agreed and understood.
> 
> > > +	unsigned long freq = policy->freq_table[index].frequency;
> > >  	struct scpi_data *priv = policy->driver_data;
> > > +	u64 rate = freq * 1000;
> >
> > So you've fixed this by casting policy->freq_table[index].frequency
> > to unsigned long, which fixes the problem on 64bit systems but it still
> > remains on 32bit systems.  It would be better to declare freq as a u64.
> >
> 
> Just trying to understand if that matters. freq is in kHz as copied
> from policy->freq_table[index].frequency and we compare it with
> kHZ below as the obtained clock rate is divided by 1000. What am I
> missing ? If it helps, it can be renamed as freq_in_khz and even keep
> it as "unsigned int" as in struct cpufreq_frequency_table.
> 


I misunderstood the integer overflow bug because I read too much into the
fact that "rate" was declared as a u64.  It would have been fine to
declare it as a unsigned long.  The cpufreq internals don't support
anything more than ULONG_MAX.  I have heard someone say that new systems
are bumping up against the 4GHz limit but presumably that would only be
high end 64bit systems, not old 32bit system.

The ->freq_table[] frequency is in kHz so a u32 is fine.  I guess if we
get frequencies of a THz then we'll have to update that.  But when we
convert to Hz then we need a cast to avoid an integer overflow for systems
which are over the 4GHz boundary.

	unsigned long rate = (unsigned long)khz * 1000;

The second bug is that we need to compare kHz instead of Hz and that's
straight forward.

regards,
dan carpenter


