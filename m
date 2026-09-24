Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B218C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 02:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9n1xLtwZfMoWvvLkdGoxwpegQEwUeD6t6y9z2tkYqM=; b=20DvACLVS6xGS7R+i3+0X7ZNSK
	3Ym1ycVeLqbKTwW1SmPO4MluH006nY6nuF2vUmvEfgDTwZn3fUQHlH3YcXh6aHHtfWgki+U03s+rn
	TNVz7+XiEAooQETAW22T7/BLo3MHxmTdurhYH2AK+fCzlpnTyIQID+FydW0UUaOETg+oZca0DNQQ2
	1z087X1lmqF1bOs6WZ83Br9uWXqw6WUNqmGjpmwnB3W3UKOTF57OjrKg77UrddrLmjEKmZ/4slr5d
	HP1SqnWHhH4lfDuywx1Mxk7tnnaKOo6WkXF37vh3IeFMXpERS6ai/y+FkV2cwFntgFTq6spKgRbDq
	kGATd7uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9YzF-00000009qk7-13Ju;
	Thu, 24 Sep 2026 02:15:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9YzD-00000009qjL-31lv
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 02:14:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=o9n1xLtwZfMoWvvLkdGoxwpegQEwUeD6t6y9z2tkYqM=; b=mU9MWpSlnSk7ZyJgggX8/IBFK2
	y4S6mjbGVJoGYNOj1PXe54H8HfB4rby8lH3zHDQ8XxzkEyebkqkdR3ufWa6bu+nqx1HfnwfGOp07K
	tAacrggg1uGVhkOize4jS+aZ9mMa2OoDLQY3An2kqlYaJKAPV6mq9GoxrnxUxBwt2YgwOZdVKcBvW
	zE3EG6vjG96WiZbixV3JUQdVJ+tBGEedq4Lrbg6UyhZ6e5tHBUADgT00dA9Wz/bk0YXugllxIOqCP
	Y8pQWAcF7NUpnX1FVC4GGBykQmdU1y3lOIRN93ea3HYtNBPfrx/ANbiZ1CZQI8jhXO7Dz61x6cCPJ
	bBnhuTzA==;
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9YzA-0000000FSS7-3P0q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 02:14:58 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-8631d0023daso882360b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 19:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790216094; x=1790820894; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o9n1xLtwZfMoWvvLkdGoxwpegQEwUeD6t6y9z2tkYqM=;
        b=FYmz45pohTAAsxDemNKqYMAZEberojYCwvqWKb6ZQ89wqcO/BLjBjvuqH+0lkAj67e
         vldswQEXTjS77fJw1rx/28A+7qv67TKE5/Kvw4gbFeTRvT5Hke5nXNW1sn1jDm4HlQ53
         +yVad2Yg8hdZ4koyzJEDQFfDvJbtrh42CMk0YdQeqFGHcRll5Co164NjQnipwIbBUp0w
         fhMGbyR8yk1+3bS3JmNInnN75rimiTM5SBWDpJU4pgD6LDG1yHV68ISkHCPSEMg33ghg
         pJn0/RC8ujJ4HnZxy1fe0q7QTjWg3V0kkP8g0ATOjy1wNZk2V/pqHVw4pnneG894nJbu
         wVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790216094; x=1790820894;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o9n1xLtwZfMoWvvLkdGoxwpegQEwUeD6t6y9z2tkYqM=;
        b=j9gLOb0h/xocxIAFNnA32GVVgXwFo1mtWnGXhhdxCRN4QxYlKJLFlGN00Bauwl2qUk
         rH/zjGaC9oWjGXCLK6NGEiH/1oK4r3HMEKBHNtakgpV1NcTmRq/5U5Qf/KwHnUgmVnP3
         y72uCqz+DrqHOS5sZl2XrVy9JkLQ0TIzpV4sMdrBIG8OvxA9JPWtRXAl+a13VqFa70bw
         IbIduUhnNkKDzF7l85a4OdgPgQqyzbZwMrRQLeYVFQXrfq4ybgp9uT5g7AojpO9Saj2E
         4npCKsmtu1lKL9ptzEfUComd5eUzJTuXVdF2bxKuXNGbmvc8qSCQXjCmqnLidqiAig/7
         MVlA==
X-Forwarded-Encrypted: i=1; AKwUvBzsliODlpIOKi6ySS78bygicNuddsNCWaL7rwlEqiKkZufNGxx0IyzbGZz9MajmJrbFbi9mxsjuXdtScHkVJLeq@lists.infradead.org
X-Gm-Message-State: AFuF++n/1e+J6BVpSeVohbLJcsQ8iXvNDI/foAEpFtiZodIWtEC1QsLP
	gBIL4V6hmaKViQZlPT46pwL7IoPTJ20xVXHw2KMc5mpMmi35e2m7qfAK
X-Gm-Gg: AYBFou0fzWWZVI6BdPaibpd5eaQe122FL6fA222TPBpLoUNEnyfySj7TJjC74YKoolJ
	RWzExDWHijAxCl2JK8Y4dBzDfnX8g9CSQecZlsiHz+sXvqFNv+eeolkXriOKXoLEy1OqXCBdeXA
	+zJj15ylijr0zd6vtm2kVzy3goalx4GRMMHf8bUtfx5x2gq6DLrGxD8267pk5PSG8dMHEN4ppf2
	lrw7Kn/VJZKiR38lh3rR7MipU23c1L5hAJF2KRAVLMAdE+ut2tHwBvrGT2oG6oRGpfGeqNRnr++
	UWm3ryU1I75UuHzxEprvrFmvid4io/1AXPsRCHsE1w0fKogkLK3LARYMvIeU9SITp5Lmx1nyrqk
	dAOG8dfFZrYyeO4jWgcuyWknFOjz1WeQ8WVWBzGEvOn9GVP+toNJz0y43SaXB3cBtyein503oEh
	tRjZhXblb/QUAZNAmn44czOENfgUCj0tl5cKQYT7FT8XRva17Fo2N8w80lurb/7EPqZl0Ou2Ku4
	6EGVdPinGrVuyhUOhXjI5+bVxLjucoF+J0UQsnS+YXy+xQfNWk=
X-Received: by 2002:a05:6a00:9093:b0:874:706d:9631 with SMTP id d2e1a72fcca58-87e9acf16b5mr716577b3a.35.1790216093965;
        Wed, 23 Sep 2026 19:14:53 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1afb8e37sm2069214b3a.5.2026.09.23.19.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 19:14:53 -0700 (PDT)
Message-ID: <c2fc4b72-190f-40fa-aba9-c301db42598e@gmail.com>
Date: Thu, 24 Sep 2026 10:14:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: ma35d1: Add Nuvoton MA35D1 SPI controller
 support
To: Mark Brown <broonie@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260923041926.425551-1-cwweng.linux@gmail.com>
 <20260923041926.425551-3-cwweng.linux@gmail.com>
 <arPFHNrYR_kWl8vs@sirena.co.uk>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <arPFHNrYR_kWl8vs@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_031457_062948_2AA55B2A 
X-CRM114-Status: GOOD (  28.80  )
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



Mark Brown 於 2026/9/23 下午 08:25 寫道:
> On Wed, Sep 23, 2026 at 12:19:26PM +0800, Chi-Wen Weng wrote:
>> From: Chi-Wen Weng <cwweng@nuvoton.com>
>>
>> Add support for the SPI controller found in the Nuvoton MA35D1 SoC.
> 
> This looks pretty good, almost all of the comments below are just
> stylistic things due to duplicating work that the core already does but
> there's one query about possibly excessively turning the controller on
> and off.
> 
>> +struct nuvoton_spi {
>> +	void __iomem *regs;
>> +	struct clk *clk;
>> +	struct device *dev;
>> +
>> +	/* Protects read-modify-write accesses to the SSCTL register. */
>> +	spinlock_t ssctl_lock;
> 
> It's not clear what this is protecting, all the users look to be called
> from the SPI core in a single threaded way.
> 
>> +static int nuvoton_spi_set_speed(struct nuvoton_spi *nspi,
>> +				 struct spi_transfer *xfer, u32 speed_hz)
>> +{
>> +	unsigned long clk_rate;
>> +	unsigned int divisor;
>> +	u32 clkdiv;
>> +	int ret;
>> +
>> +	clk_rate = clk_get_rate(nspi->clk);
>> +	if (!clk_rate) {
>> +		dev_err(nspi->dev, "failed to get clock rate\n");
>> +		return -EINVAL;
>> +	}
> 
> You probably don't need to do this on every transfer, the driver doesn't
> change the rate and it's not the cheapest call.
> 
>> +static int nuvoton_spi_configure_transfer(struct nuvoton_spi *nspi,
>> +					  struct spi_device *spi,
>> +					  struct spi_transfer *xfer,
>> +					  u8 bpw)
>> +{
>> +	u32 speed_hz = xfer->speed_hz ?: spi->max_speed_hz;
> 
> The core will ensure the transfer has a speed set.
> 
>> +static int nuvoton_spi_txrx(struct nuvoton_spi *nspi,
>> +			    struct spi_transfer *xfer, u8 bpw)
>> +{
>> +	unsigned int bytes_per_word;
>> +	unsigned int offset;
>> +	u32 val;
>> +	int ret;
>> +
>> +	bytes_per_word = spi_bpw_to_bytes(bpw);
>> +	if (!bytes_per_word)
>> +		return -EINVAL;
>> +
>> +	if (xfer->len % bytes_per_word)
>> +		return -EINVAL;
> 
> The core ensures these too.
> 
>> +static int nuvoton_spi_transfer_one(struct spi_controller *ctlr,
>> +				    struct spi_device *spi,
>> +				    struct spi_transfer *xfer)
>> +{
>> +	struct nuvoton_spi *nspi = spi_controller_get_devdata(ctlr);
>> +	u8 bpw = xfer->bits_per_word ?: spi->bits_per_word;
>> +	int disable_ret;
>> +	int ret;
>> +
>> +	if (!xfer->len)
>> +		return 0;
>> +
>> +	if (!bpw)
>> +		bpw = NUVOTON_SPI_DEFAULT_BPW;
>> +
>> +	if (bpw < 8 || bpw > 32)
>> +		return -EINVAL;
> 
> Again the core is checking this stuff.
> 
>> +	ret = nuvoton_spi_enable(nspi);
>> +	if (ret) {
>> +		dev_err(nspi->dev, "failed to enable controller\n");
>> +		goto out_disable;
>> +	}
> 
> Do you need to enable and disable on every transfer, or could this be
> done once per message?  If you need to disable to reconfigure it's a bit
> more complicated, but otherwise it's overhead to bounce the controller
> on and off.  Potentially it might glitch the data lines.
> 
>> +static int nuvoton_spi_probe(struct platform_device *pdev)
>> +{
> 
>> +	ctlr->dev.of_node = dev->of_node;
> 
> The core does this for you.

Hi Mark,

Thanks for the detailed review.

Regarding SPIEN, there are two hardware requirements/behaviors worth
clarifying for the MA35D1 SPI controller:

1. SPIEN must be cleared, and SPIENSTS must become 0, before modifying
    CTL, CLKDIV, SSCTL, or FIFOCTL.

2. Clearing SPIEN does not change or tristate the SPI CLK or MOSI output
    levels. Their output levels are retained while SPIEN is cleared, so
    disabling the controller does not introduce a signal glitch on those
    lines.

Therefore, disabling and re-enabling the controller is required when
the transfer configuration needs to be changed. However, I agree that
the current driver does this unconditionally for every transfer, which
is more than necessary.

I will rework this in v2 to avoid unnecessary SPIEN toggling and only
disable the controller when required for reconfiguration, while still
honoring the register programming requirements above.

I will also address the other comments by relying on the SPI core for
the transfer defaults and validation it already provides, caching the
input clock rate instead of calling clk_get_rate() for every transfer,
removing the unnecessary SSCTL locking, and dropping the explicit
of_node assignment.

Thanks,
Chi-Wen



