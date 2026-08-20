Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37722C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 15:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MT5cE37vNNATMSK/0ATPIPek355Lvu0hwGnVbzvXZEc=; b=rcZQGQWHe3U5FUhvN1rJWe3+zJ
	kdQgBI8ib9Bq2gK+l0qAqYcRrlG9lCv4/OJrnPPo/RMqolgDyDkVqgvoJJ09ZUOE+2XxwiN8l7MfO
	YoMPnoNS5bguTBYIPHBAO2yuQWbFirq9CBEt4Ycd8HaPBavUyUK61f4GsiDUsTUSpp2xV6xIDMc/x
	T+r/hcHoy1VDFPbnGFFMK8OfpJQjBzVC7C/Flgdo7oKid4QDsRg4VRO8EyRYoPlerB2CMzrSEhcwP
	Y5jQfeox8oEv+1K92G43yivtawF1zlXWqnRjCXVeMkmUBM97oUDNiP06pEMrS6JA4hkaURnekI6bN
	8Gwc6M7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4ek-0000000Bno2-15Nb;
	Thu, 20 Aug 2026 15:26:14 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4ef-0000000BnnX-3BzV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 15:26:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0B11B4E41301;
	Thu, 20 Aug 2026 15:26:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C83DA602B8;
	Thu, 20 Aug 2026 15:26:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D9AC11C76488;
	Thu, 20 Aug 2026 17:25:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787239560; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=MT5cE37vNNATMSK/0ATPIPek355Lvu0hwGnVbzvXZEc=;
	b=qWRLjnEHXjBvqPygZo7VeE3craVfVvnakFesBdtkzMMH+jtYTOIln/7LdaxPkJsYiVO3OT
	29gG2ohut3IepXPCD9JgLK8qfjrrO/JvXp8mNqwj2CKudEgKIgBLacDxGyLFYaJqhw9HYz
	KLjAtWZ7+xx+YgKyeGJ9q9fh4oMwo//qncLbgNmDA5mCIsgCpOHuMuTH60HgIE850HR8Hm
	94H/n7IeitBOje4Ye6A0hSlPpYDy6CrINwOrhhw5KGKfg5Kby4Cuphp2HCVop8ZCNxK5L3
	dRcnW2GYv/hsIeys9ZC23Mk/tlFRkAYzQBH87qmvtDvHN5r2PMrICEZpTVlhEA==
Date: Thu, 20 Aug 2026 17:25:56 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Probst <markus.probst@posteo.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Langer <michael.brainbug.langer@googlemail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/6] rtc: s35390a: force 24-hour mode
Message-ID: <20260820152556c6da4fce@mail.local>
References: <20260820-rtc_s35390a_int1-v5-0-5eb4ef85c6a9@posteo.de>
 <20260820-rtc_s35390a_int1-v5-4-5eb4ef85c6a9@posteo.de>
 <202608192220436c9c7207@mail.local>
 <da52511e1257d1a3d01ad78b53eb983162c66003.camel@posteo.de>
 <20260819232634fd70f621@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819232634fd70f621@mail.local>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_082610_106792_70094EB5 
X-CRM114-Status: GOOD (  48.34  )
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

On 20/08/2026 01:26:34+0200, Alexandre Belloni wrote:
> On 19/08/2026 22:57:13+0000, Markus Probst wrote:
> > On Thu, 2026-08-20 at 00:20 +0200, Alexandre Belloni wrote:
> > > On 19/08/2026 22:05:56+0000, Markus Probst wrote:
> > > > Instead of trying to remember the current 12/24-hour mode, which could
> > > > result in time corruption if out of sync, we force the use of the 24-hour
> > > > mode. Set to 24-hour mode if in 12-hour mode on startup and assume
> > > > 24-hour mode. The 24-hour mode is already forced on reset.
> > > > 
> > > > Signed-off-by: Markus Probst <markus.probst@posteo.de>
> > > > ---
> > > >  drivers/rtc/rtc-s35390a.c | 67 +++++++++++++++++++++--------------------------
> > > >  1 file changed, 30 insertions(+), 37 deletions(-)
> > > > 
> > > > diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
> > > > index 575bb256eb25..b34a3f7e8476 100644
> > > > --- a/drivers/rtc/rtc-s35390a.c
> > > > +++ b/drivers/rtc/rtc-s35390a.c
> > > > @@ -64,7 +64,6 @@ MODULE_DEVICE_TABLE(of, s35390a_of_match);
> > > >  
> > > >  struct s35390a {
> > > >  	struct i2c_client *client[8];
> > > > -	int twentyfourhour;
> > > >  };
> > > >  
> > > >  static int s35390a_set_reg(struct s35390a *s35390a, int reg, u8  *buf, int len)
> > > > @@ -181,31 +180,6 @@ static int s35390a_disable_test_mode(struct s35390a *s35390a)
> > > >  	return s35390a_set_reg(s35390a, S35390A_CMD_STATUS2, buf, sizeof(buf));
> > > >  }
> > > >  
> > > > -static char s35390a_hr2reg(struct s35390a *s35390a, int hour)
> > > > -{
> > > > -	if (s35390a->twentyfourhour)
> > > > -		return bin2bcd(hour);
> > > > -
> > > > -	if (hour < 12)
> > > > -		return bin2bcd(hour);
> > > > -
> > > > -	return 0x40 | bin2bcd(hour - 12);
> > > > -}
> > > > -
> > > > -static int s35390a_reg2hr(struct s35390a *s35390a, char reg)
> > > > -{
> > > > -	unsigned hour;
> > > > -
> > > > -	if (s35390a->twentyfourhour)
> > > > -		return bcd2bin(reg & 0x3f);
> > > > -
> > > > -	hour = bcd2bin(reg & 0x3f);
> > > > -	if (reg & 0x40)
> > > > -		hour += 12;
> > > > -
> > > > -	return hour;
> > > > -}
> > > > -
> > > >  static int s35390a_rtc_set_time(struct device *dev, struct rtc_time *tm)
> > > >  {
> > > >  	struct i2c_client *client = to_i2c_client(dev);
> > > > @@ -225,7 +199,7 @@ static int s35390a_rtc_set_time(struct device *dev, struct rtc_time *tm)
> > > >  	buf[S35390A_BYTE_MONTH] = bin2bcd(tm->tm_mon + 1);
> > > >  	buf[S35390A_BYTE_DAY] = bin2bcd(tm->tm_mday);
> > > >  	buf[S35390A_BYTE_WDAY] = bin2bcd(tm->tm_wday);
> > > > -	buf[S35390A_BYTE_HOURS] = s35390a_hr2reg(s35390a, tm->tm_hour);
> > > > +	buf[S35390A_BYTE_HOURS] = bin2bcd(tm->tm_hour);
> > > >  	buf[S35390A_BYTE_MINS] = bin2bcd(tm->tm_min);
> > > >  	buf[S35390A_BYTE_SECS] = bin2bcd(tm->tm_sec);
> > > >  
> > > > @@ -256,7 +230,7 @@ static int s35390a_rtc_read_time(struct device *dev, struct rtc_time *tm)
> > > >  
> > > >  	tm->tm_sec = bcd2bin(buf[S35390A_BYTE_SECS]);
> > > >  	tm->tm_min = bcd2bin(buf[S35390A_BYTE_MINS]);
> > > > -	tm->tm_hour = s35390a_reg2hr(s35390a, buf[S35390A_BYTE_HOURS]);
> > > > +	tm->tm_hour = bcd2bin(buf[S35390A_BYTE_HOURS] & 0x3f);
> > > >  	tm->tm_wday = bcd2bin(buf[S35390A_BYTE_WDAY]);
> > > >  	tm->tm_mday = bcd2bin(buf[S35390A_BYTE_DAY]);
> > > >  	tm->tm_mon = bcd2bin(buf[S35390A_BYTE_MONTH]) - 1;
> > > > @@ -325,8 +299,7 @@ static int s35390a_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
> > > >  	else
> > > >  		buf[S35390A_ALRM_BYTE_WDAY] = 0;
> > > >  
> > > > -	buf[S35390A_ALRM_BYTE_HOURS] = s35390a_hr2reg(s35390a,
> > > > -			alm->time.tm_hour) | 0x80;
> > > > +	buf[S35390A_ALRM_BYTE_HOURS] = bin2bcd(alm->time.tm_hour) | 0x80;
> > > >  	buf[S35390A_ALRM_BYTE_MINS] = bin2bcd(alm->time.tm_min) | 0x80;
> > > >  
> > > >  	if (alm->time.tm_hour >= 12)
> > > > @@ -381,8 +354,7 @@ static int s35390a_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
> > > >  
> > > >  	if (buf[S35390A_ALRM_BYTE_HOURS] & 0x80)
> > > >  		alm->time.tm_hour =
> > > > -			s35390a_reg2hr(s35390a,
> > > > -				       buf[S35390A_ALRM_BYTE_HOURS] & ~0x80);
> > > > +			bcd2bin(buf[S35390A_ALRM_BYTE_HOURS] & 0x3f);
> > > >  
> > > >  	if (buf[S35390A_ALRM_BYTE_MINS] & 0x80)
> > > >  		alm->time.tm_min = bcd2bin(buf[S35390A_ALRM_BYTE_MINS] & ~0x80);
> > > > @@ -459,7 +431,7 @@ static int s35390a_probe(struct i2c_client *client)
> > > >  	unsigned int i;
> > > >  	struct s35390a *s35390a;
> > > >  	struct rtc_device *rtc;
> > > > -	u8 buf, status1;
> > > > +	u8 buf, status1, time[7];
> > > >  	struct device *dev = &client->dev;
> > > >  	struct nvmem_config nvmem_cfg = {
> > > >  		.name = "s35390a_nvram",
> > > > @@ -503,10 +475,31 @@ static int s35390a_probe(struct i2c_client *client)
> > > >  		return err_read;
> > > >  	}
> > > >  
> > > > -	if (status1 & S35390A_FLAG_24H)
> > > > -		s35390a->twentyfourhour = 1;
> > > > -	else
> > > > -		s35390a->twentyfourhour = 0;
> > > > +	if (!(status1 & S35390A_FLAG_24H) && err_read != 1) {
> > > > +		unsigned int hour;
> > > > +
> > > > +		status1 |= S35390A_FLAG_24H;
> > > > +
> > > > +		err = s35390a_get_reg(s35390a, S35390A_CMD_TIME1, time, sizeof(time));
> > > > +		if (err < 0)
> > > > +			return dev_err_probe(dev, err, "reading 12-hour time failed\n");
> > > > +
> > > > +		/* converting to 24-hour time */
> > > > +		time[S35390A_BYTE_HOURS] = bitrev8(time[S35390A_BYTE_HOURS]);
> > > > +		hour = bcd2bin(time[S35390A_BYTE_HOURS] & 0x3f);
> > > > +		if (time[S35390A_BYTE_HOURS] & 0x40)
> > > > +			hour += 12;
> > > > +
> > > > +		time[S35390A_BYTE_HOURS] = bitrev8(bin2bcd(hour));
> > > > +
> > > > +		err = s35390a_set_reg(s35390a, S35390A_CMD_STATUS1, &status1, sizeof(status1));
> > > > +		if (err < 0)
> > > > +			return dev_err_probe(dev, err, "setting 24-hour mode failed\n");
> > > > +
> > > > +		err = s35390a_set_reg(s35390a, S35390A_CMD_TIME1, time, sizeof(time));
> > > > +		if (err < 0)
> > > > +			return dev_err_probe(dev, err, "setting 24-hour time failed\n");
> > > 
> > > No, don't do this, this will break existing users as your conversion may
> > > happen after a minute rollover. The only function in which you are
> > > allowed to change the time registers is set_time. You definitively need
> > > to be able to read 12H mode time but you are allowed to only support
> > > writing 24h time.
> > > 
> > > Also, this is super verbose, adding strings to the kernel makes it
> > > bloated.
> > > 
> > > To avoid any desync, simply test for the S35390A_FLAG_24H bit in status
> > > in s35390a_rtc_read_time as the register is already read anyway.
> > > 
> > I think that would defeat the whole point of the patch, that the rtc is
> > always in 24-hour mode. If this driver was always used with the rtc, it
> > already should be in 24-hour mode, as thats the mode this driver does
> > initialize the rtc.
> 
> This assumption may not be true, the RTC may have been initialized by a
> bootloader or a different system in the factory.
> 
> > Your idea would work for the time, but not in combination with alarms.
> > If the rtc could be in 12-hour mode, then this would need to be
> > considered in setting and reading alarm. Also setting 24-hour mode
> > inside set_time would then also require to convert the alarm time.
> > Effectively making it less maintainable than before.
> 
> Note that while setting the time when an alarm has been set is not
> forbidden, it is never guaranteed to work anyway. I guess something we
> could do in the core is that whenever the time is set we go over the
> timerqueue and set the alarm again.

Actually this is already what we do so this is not an issue.


>This would allow to remove the UIE
> disabling/enabling dance.
> 
> > 
> > Currently s35390a_init does initialize the rtc in 24-hour mode, while
> > not updating s35390a->twentyfourhour. So some change needs to be made.
> > Just setting s35390a->twentyfourhour inside s35390a_init might now be
> > the simplest solution here.
> 
> Or maybe simply stop caching the value.
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

