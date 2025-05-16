Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B964C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 08:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdKztaKZj+ArxWleSUI2lI0rhw/lHk7zt8SPSV2S+Ko=; b=1Dk2bd3XR9+z/TX0yLhKtLOZeK
	2mzZ5qtuUDFmtkRiQcOVG3h5vPVovIk+j2YQNBkX+oOScYu1SjTb8Cmc6+HmDSPc6wnwH385kJrrO
	r/cjFOwaDcTKjLmFg/60wICpj9mYMi78N9YcbxEi/JmGonYe7wWda7ERnpoj0FRBvc6cCpBSaDiPX
	HfjHIKobEkfC1zJ6UMWev6fAD8dmdsz4emrXBCbxNajVpUooR49ztpN3AEtwPKHTHDcr0QvBheXqN
	ALW1ThzhfrFTHmSBOyYQAj5eqRetv/d96sUhJGvEtGs9Zm9pO7uoJbRjIE9xe+9rKmP5+zQUwB3uK
	Harvdb+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFqCI-00000002lS5-01vE;
	Fri, 16 May 2025 08:13:38 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFq1d-00000002jpE-0qkS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 08:02:38 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a0be50048eso1735288f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 01:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747382555; x=1747987355; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bdKztaKZj+ArxWleSUI2lI0rhw/lHk7zt8SPSV2S+Ko=;
        b=cQycynq4X75irOSvESX5wKZHBK5PfV9dbVffgBiG48H0VTJRBZoJkAjFlHvZGyIB3+
         jw/+BafZgps2q+V69KtYqWhLAs+aSUZ7ZJiukeUsvPD23dZPBlrfehuet1N/sbf5cCSq
         qfNyfJyg8z6AlNW5Ic0v6h+qW8zrZxfb1th3IAsJv0lpiBYbguoB3Pib6fnwE1bvhZn8
         uAzTTNm3oZCERPXy6F8yKaMJRCj+hbgovATWOdon3HesVRW26zDLqFCDS2z5Dx2KjvTg
         S586sJE3cqjWkYCOZwD9e18U3ebsmRwXYuBac9Bax8vb2k4LjyqFXdwxTFaj7ToCXFGc
         uTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747382555; x=1747987355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdKztaKZj+ArxWleSUI2lI0rhw/lHk7zt8SPSV2S+Ko=;
        b=a6KTn7VBpWG9w9MJAyYFjnnm0J5hKLmFTpQZTBjkcRhPWWTXRNQkUB7RaqWxM6fDud
         jWEQnE5SN4e+B+XI/PHxpP5m+zuCOLxU0hFM/1PWJ99m6TDmq0pEYqIBq94i3FMCDsbm
         KoosyGZn1uC26m8mXP6xUingQf4akij/GOQJYpgrFAzTd4/Z4w40m6WYks2yw/a/cmG0
         yfPHu8x+xZ2Twd28NjEjvG6kbCyuqvv3bU7tvyofnU2lDl8hX8ZN4HUV8KiP9hhwzAnW
         /rMmJGOMzLRAdJuMfg3u2/O+z9tg0RTA6CsD4QyLcdqNP3aY++XuwAhz07MynApKIKJW
         GUrw==
X-Forwarded-Encrypted: i=1; AJvYcCXZkc3oorw/nHu0vZSuoydAqChDDkil8PeoP3JqpQdRoo755ovJ/dGgnWyG9zQcfUc/OFS3E63tVHcPgivcVgR0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1PNcbun9Y9ExaK/j+xW08b9SyPaPcnMdgD1SAdCYP9TRQfH5m
	8xe4954FM4OVTFJiiNOIf8e3zJTuVZrGkPQZNz4gvA9Ehf6nzsyABRxjlKJfpbNrURc=
X-Gm-Gg: ASbGncvvdLHX+nKg24nmRmlIju5lby7uRw6bJP20IiC2u+GWOfASYX2E91z4BNkV5zr
	YDiJex/YN3GVigrihmC6jfWGjBY51l8Mzr0H5HOEFBKZ4o9YADmTja4Zkw7dxt1x9iBCSJRGTna
	hjrXs/4YHtE2xHko9PYJGw/xQn4jKaQnq3BiPlxMjHr4JiugwrrtwvJDZ9xnqltpnaDGli7AiDu
	grte18t9JQnKU1HUhMvTpPelzCZIruUQkiO1pio32xYIxyaoKPBKAQUo0jbeUuNZzi+tK61xM58
	tmmeNhDgxdAzoX13oQQsQ5ecxmouap+e0QuYYbS/f0txc7Qg4at+FZN7yrb88rQBXLHWfI0tRhW
	CpGl2eTh7RHZ/5IIO
X-Google-Smtp-Source: AGHT+IGajP2MNPkEe6N02ds5+ATpXbBcyUjkhr3oNkMVyA1PAD1v31L2wT8EjnkrVr11DTg5FBDOMA==
X-Received: by 2002:a05:6000:2ca:b0:39a:ca05:54a9 with SMTP id ffacd0b85a97d-3a35c8263d1mr2594040f8f.29.1747382555439;
        Fri, 16 May 2025 01:02:35 -0700 (PDT)
Received: from localhost (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8d185sm2005730f8f.98.2025.05.16.01.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 01:02:34 -0700 (PDT)
Date: Fri, 16 May 2025 11:02:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: long.yunjian@zte.com.cn, sudeep.holla@arm.com, peng.fan@nxp.com,
	justin.chen@broadcom.com, florian.fainelli@broadcom.com,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, fang.yumeng@zte.com.cn,
	mou.yi@zte.com.cn, ouyang.maochun@zte.com.cn, xu.lifeng1@zte.com.cn
Subject: Re: [PATCH] firmware: arm_scmi: Use dev_err_probe() simplify the code
Message-ID: <4c970388-4b1e-4c5c-bc54-d55c2d9cd62b@suswa.mountain>
References: <20250515203855146Sn9x-Uw9Teur35mOjn41C@zte.com.cn>
 <aCXzPGvPayVyiMHG@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCXzPGvPayVyiMHG@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_010237_254215_FDD9CA8A 
X-CRM114-Status: GOOD (  16.09  )
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

On Thu, May 15, 2025 at 02:59:24PM +0100, Cristian Marussi wrote:
> On Thu, May 15, 2025 at 08:38:55PM +0800, long.yunjian@zte.com.cn wrote:
> > From: Yumeng Fang <fang.yumeng@zte.com.cn>
> > 
> 
> Hi,
> 
> > In the probe path, dev_err() can be replaced with dev_err_probe()
> > which will check if error code is -EPROBE_DEFER and prints the
> > error name. It also sets the defer probe reason which can be
> > checked later through debugfs.
> 
> All true...but...if you look at the main scmi_probe() function all of these
> failures are trapped at that level currently on the return path...
> 
> see the call chain from
> 
> scmi_probe()
> 	....
> 	ret = scmi_channels_setup(info); 
> 	...
> 
> ...so your probe errors will be overridden there with a more generic message
> left in debugfs at the top level.

Good point.  But that feels like a mistake in dev_err_probe().
Ideally, it would print the first error message.  I bet someone
will eventually fix this.

regards,
dan carpenter

