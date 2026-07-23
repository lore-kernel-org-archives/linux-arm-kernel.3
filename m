Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D899C531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 11:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r2R5T62H0gucpi6rtR6WXD8Ks57MhBD7yXC20QHzb1s=; b=rpJOd0Mjq6NVTJUhAZeZnd50wY
	Ngzp4DgmCUu8iCAwt8Y06TMC8YImcL7RbOpGTvSFlnUQW9U2HvxtXRjB9OELbGYHXcJIAgv7CiZV/
	c2k+KpFAcFVy0fQXvgq1lT59V75FK+oDJw45JhN4ETyyiwDAGmI2qc45BOGxBn3IpZd5CDN9Tqzpt
	tQ5wsdYLLTApULmKwa7j/YPpHmrTIosOHjZynr6P47DXa/r+ZAq0lI6fGFm2TgslBPRk3rl8xUqq4
	pBsnuFeO0wZOYFw/Dqe1UyjxyH3nfpKv91nYjDu+pSmyAZUmWitPgskIW1jIxLXd8xkgyrkqCSTTg
	25ZYr0jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmrDl-0000000E6Xx-2aFU;
	Thu, 23 Jul 2026 11:04:09 +0000
Received: from mail.lysator.liu.se ([2001:6b0:17:f0a0::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmrDi-0000000E6RU-1Fvi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 11:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1784804640;
	bh=MvTqgjxNS84PYlMlgMtDK8GM9GogEAoF0piEZXQLulU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=tsSySRdLMyZG+vZG50VYNlov7J1IPwTqCzlTPpiV9F1r5yDD7iopPyCJeRdaWQvyo
	 LPS46s5QrkXvYaGUfAXMju03E73PQB9LOyz5f/gGXWRDTwFNLzrIWMGPCK5YUI5vL7
	 k0YmCch/x27rS0kJnraS/sYuAJyl9eXPy6nbNEdPfiPmVAnCgJPt8FjFw1vvWnsRIN
	 tP2cEMGtTqukbG8pPdWJ9cENX4o1RoiPkzTqN2IZp5AZYWdDdjwrvr3u8xAaP+GxDu
	 I4X7i/OFB9U3o9mtqf0UrMRmVbKfDe1WZYYt+EhZBHhIRy/LWUW/UzJatIsiRgoPgW
	 CjhOCHtxkZNcA==
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
	by mail.lysator.liu.se (Postfix) with ESMTP id 578221B9CD
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 13:04:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1784804640;
	bh=MvTqgjxNS84PYlMlgMtDK8GM9GogEAoF0piEZXQLulU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=tsSySRdLMyZG+vZG50VYNlov7J1IPwTqCzlTPpiV9F1r5yDD7iopPyCJeRdaWQvyo
	 LPS46s5QrkXvYaGUfAXMju03E73PQB9LOyz5f/gGXWRDTwFNLzrIWMGPCK5YUI5vL7
	 k0YmCch/x27rS0kJnraS/sYuAJyl9eXPy6nbNEdPfiPmVAnCgJPt8FjFw1vvWnsRIN
	 tP2cEMGtTqukbG8pPdWJ9cENX4o1RoiPkzTqN2IZp5AZYWdDdjwrvr3u8xAaP+GxDu
	 I4X7i/OFB9U3o9mtqf0UrMRmVbKfDe1WZYYt+EhZBHhIRy/LWUW/UzJatIsiRgoPgW
	 CjhOCHtxkZNcA==
Received: by mail.lysator.liu.se (Postfix, from userid 1004)
	id 2D9311B9CC; Thu, 23 Jul 2026 13:04:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1784804635;
	bh=MvTqgjxNS84PYlMlgMtDK8GM9GogEAoF0piEZXQLulU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=fRPANJUr08xFv3/+Fa3DGpkeAgN3NOgxGNv2LEM4re7gkU9QmPGwaJOIW7QMxsFdS
	 /tVGYBv6YZ8HWFzFfvQNDxOCIhd4mS6XqNEXy6wIqJbbDwiHnXOxYTTzYuwMFZqC64
	 mhFosfN24rv+KpVycw8bRJjMvwxJfNnv5NTvQ9QxV8Ox3R4mknxF+sZYWbUAkDmsOc
	 59rGemRMxO/ZJLuUJcUSs8hnjjDqNr0fFSEdquiInJfrOhf4FeHcJ6PlNROUYOipzB
	 uNBURUcI121smTO0XPNvg6EAEiZf/Gg5rXD27qKlLVWpuX6uN1dSoa7OPTCW7p+8zd
	 SQJuY3WFp+12A==
Received: from [192.168.2.172] (81-225-28-11-no2391.tbcn.telia.com [81.225.28.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail.lysator.liu.se (Postfix) with ESMTPSA id 053F61BA8D;
	Thu, 23 Jul 2026 13:03:53 +0200 (CEST)
Message-ID: <19dbf4be-5f17-46b3-924d-eb24ae41fdd9@lysator.liu.se>
Date: Thu, 23 Jul 2026 13:03:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Peter Rosin <peda@lysator.liu.se>
Subject: Re: [PATCH v12 1/7] i2c: core: add callback to change bus frequency
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260719-i2c-mux-v12-0-a5010d623a57@gmail.com>
 <20260719-i2c-mux-v12-1-a5010d623a57@gmail.com>
Content-Language: en-US, sv-SE
In-Reply-To: <20260719-i2c-mux-v12-1-a5010d623a57@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_040406_822085_80D570A6 
X-CRM114-Status: GOOD (  27.56  )
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

Hi!

On 2026-07-19 16:59, Marcus Folkesson wrote:
> All devices on the same I2C bus share the same clock line and the bus
> frequency has therefor be chosen so that all attached devices are able

Perhaps one of:

has therefore got to be
must therefore be

> to tolarate that clock rate. IOW, the bus speed must be set for the

tolerate

> slowest attached device.
> 
> With I2C multiplexers/switches on the other hand, it would be possible
> to have different "domains" that runs with different speeds.

that run

> Prepare for such a feature by provide an optional callback function to

providing

> change bus frequency.
> 
> As a side effect, several bus drivers keep the bus speed in a
> private structure and can now have this value stored in a uniform way
> instead.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>   include/linux/i2c.h | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 20fd41b51d5c..b3b0d16b4ddd 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -729,6 +729,9 @@ struct i2c_adapter_quirks {
>   /*
>    * i2c_adapter is the structure used to identify a physical i2c bus along
>    * with the access algorithms necessary to access it.
> + *
> + * @set_clk_freq: Set clock frequency for the adapter. Returns the actual set frequency.
> + *      This function is optional.
>    */
>   struct i2c_adapter {
>   	struct module *owner;
> @@ -742,6 +745,8 @@ struct i2c_adapter {
>   	struct rt_mutex mux_lock;
>   
>   	int timeout;			/* in jiffies */
> +	u32 clock_Hz;			/* bus clock speed */
> +	int (*set_clk_freq)(struct i2c_adapter *adap, u32 clock_Hz); /* Optional */

To expand on the comment from v9 by Wolfram [1], I too think it
would be good if this function pointer did not live directly in
i2c_adapter but instead in some other struct so that the actual
pointer could live in read-only memory. I.e. if i2c_algorithm
does not fit for some reason, a new function pointer struct might
be called for?

Also, returning int instead of unsigned hints that the function
might return a negative error code, but the new code in 3/7 does
not handle errors. So, either change to unsigned int, or update
the support code in 3/7 to handle errors. I think the latter is
the better approach.

Cheers,
Peter

[1] https://lore.kernel.org/all/ahX44_rzaRlTLSLU@shikoro/

>   	int retries;
>   	struct device dev;		/* the adapter device */
>   	unsigned long locked_flags;	/* owned by the I2C core */
> 


