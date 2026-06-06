Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E04CD8C8E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 16:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0CCEPdnbAf9O7YZGI5gomWMwSVZTv0vCb5M8aGMFXew=; b=p7+ti1t7/uAQWxV1WhUZTnCtLk
	Owwafv9xqBPZQtGiZWGJ/g8/fZZpi20+7hZnknCzkeuEWoAd1r6xiu+y3ewVwKcSmKbNiwubtI6JF
	l+Lce2SgjJ1g/W7Ivw/1bFBrI5yx/MXWH77vL5qJwYVlqHhbHIvHXjsrNZy7UIdStXMM36zWpmILL
	4/WjBSbpl68z4k3Ud9Tb0zDF03ltsyM5SvMefzJogbZ34bUj2xBzCATlLmCeGooACEeE4mzEYilqI
	goa2rGpcTkVJp9PFW+0xQp0PYUxBzjUY6eLpPBKhc64ICcE6YeFtq+LYAqPd3s1+9I+62caFHBbBu
	+gmRfDPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVu9z-00000001iWn-49G4;
	Sat, 06 Jun 2026 16:46:11 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVu9y-00000001iW3-10tn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Jun 2026 16:46:11 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-36d6bb38b44so2139989a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Jun 2026 09:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780764369; x=1781369169; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0CCEPdnbAf9O7YZGI5gomWMwSVZTv0vCb5M8aGMFXew=;
        b=boliuFEvrnPyh/Kj4HBG4ukAdBkTeX44dy7fMLP+x6zuKbuSMP5pg24kgeUwICtlgs
         6HJbpBSJh/Gh3ucA6tuVoFxUQqpnHGoADpl2GIHn5Tc+g4b4IZE+BsLP6qI2W1lz6JMJ
         iJSNhq4xS+Ok8IZQH3G+nt4nJUb2HGapkuks9Lt8I2Qrk4DD83n8P4eN/q9NzLmZSZrY
         RAQeX7JlGeAP3UkfEKwEWzxMSGrcxRKFGNHFOaqTbXUy7CZjY7EGooj+Dy4Fvz6qksEG
         qx28pzdQavGwQ1J+pwwV0y9cov2cMIZtPLEVeA7VpYpTsJGjnGBAG6XETLLChwIEhVmG
         2d3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780764369; x=1781369169;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0CCEPdnbAf9O7YZGI5gomWMwSVZTv0vCb5M8aGMFXew=;
        b=LRpJB+aIuQns+hNEy8lc9oWYGY7/fKF5qF2329z/173mQHqfHuuryivH83j5OZf21T
         v/buMOVwd6RZejcVu/7gvZrM5CGot2AsBEljd5C8Vnxq/gumydQvcbr0thoJRmEou555
         BfGlP0zNbJBCobObqKrMmu6f/pSNhaWLHx6zZyCxdIOLDdJsxMp+jIBYpkv5uNopD/9y
         dI2/p83l2eROkRy9KCHDwh9NcLwbI32t7d6sUa/ENE8xrrusKhDTJVfkI5M/m4gNkRAJ
         8Toco+uakTzfneCYM2VJw21JZaqazoa/nsTo2rRPaJagsKknlHeSCrn6pmiAT4TxBl9s
         TACw==
X-Forwarded-Encrypted: i=1; AFNElJ84AzvFPUhMFbsIdKrS0XbvRjXJChqLFsqQPLN00BlFWBd8WiSZPoaxeEPV4tXK1A7IR8bSTuYrFCAF8lGN4Z1u@lists.infradead.org
X-Gm-Message-State: AOJu0YwPtsM3lVOYfRt0J2GSm8tVkB9E6z/Hjeqh99QdMGiP/XExSXqA
	TzLmAgprfkcEzd8CqsZA+TxXjA6YeYsRbdo1mrmctZupZAwHrxAMCjlW
X-Gm-Gg: Acq92OEwVFzAkgwJK7cK8zPNEtNnzLErWBg7eh9zKdOietFOEZWdc4CHX+0mqY5atso
	m4xsGlV/LZY7+NX2su1jnT2/rvfRpDJdfrIdHS1tbpfvKsWckR6tQTPZQ7GlbH+FSMZ21+lxiC5
	Ack/WC7sjYNUKJh1G1ch2ZnLb+8yv4DVePR7wOdsWycPpHaWy+mxtEPz+PWmnN/tCinXGPhlOqJ
	5gljmMcYqXLaB5Naambp7vi5qRd43P8gITBcV+XfJZr1FGfpZvEtqYGqMteikO5N1jHeAXPHDLP
	Kh+O6vp/mMt48YNu/87O6Ya2UNQtD49b7u0SCXpwMH+0TK8Za0s2YCmsDkvA8xY1FyM2COfofBC
	LQfUputwIkd8q0bTcbvFbI33MtmZ6iSKJmp1V/ZlTnYPfEJH28vAN/9iEQYblhaTbx6TjVQ8Iv4
	kXm50k2xUtFcJsyPmI0c69L8LpuhyMLcU7zwlQhXG8vA==
X-Received: by 2002:a17:90b:1ccd:b0:368:a297:bd38 with SMTP id 98e67ed59e1d1-370eedfff8dmr9852447a91.7.1780764369256;
        Sat, 06 Jun 2026 09:46:09 -0700 (PDT)
Received: from [192.168.1.111] ([223.122.38.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f714e26afsm10414758a91.17.2026.06.06.09.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jun 2026 09:46:08 -0700 (PDT)
Message-ID: <b791aed1-cd05-45cd-973b-4d8bef27ee7c@gmail.com>
Date: Sun, 7 Jun 2026 00:46:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] nvme-apple: Prevent tag collision across queues even
 if tag space is shared
Content-Language: en-MW
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Yuriy Havrylyuk <yhavry@gmail.com>
References: <20260606-prevent-tag-collision-t8015-v1-0-93ccf4eca550@gmail.com>
 <20260606-prevent-tag-collision-t8015-v1-2-93ccf4eca550@gmail.com>
 <a0b0bea4-998e-4196-a2b0-9fcaf531d9f3@kernel.org>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <a0b0bea4-998e-4196-a2b0-9fcaf531d9f3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_094610_282726_968F900A 
X-CRM114-Status: GOOD (  14.78  )
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



Sven Peter 於 2026/6/7 凌晨12:12 寫道:
> On 06.06.26 15:25, Nick Chan wrote:
>> From: Yuriy Havrylyuk <yhavry@gmail.com>
>>
>> Apple NVMe controllers require tags of pending commands to not be shared
>> across admin and IO queues. However, on Apple A11 without linear SQ, it is
>> not possible for either queue to skip over some tags and must go from 0 to
>> the configured maximum before wrapping around.
>>
>> If a pending command tag is duplicated across queues, the firmware
>> crashes with: "duplicate tag error for tag N", with N being the tag.
>>
>> Instead of partitioning the tag space, which is not possible without
>> linear SQ, 
> 
> Isn't that just what the pci.c driver does with NVME_QUIRK_SHARED_TAGS 
> for the T2 macs or what we do in this driver with
> 	if (anv->hw->has_lsq_nvmmu)
> 		anv->tagset.reserved_tags = APPLE_NVME_AQ_DEPTH;
> ?

After adjusting the apple_nvme_submit_cmd_t8015() function to account for
the admin queue depth, it seems that the existing workaround for M1 of
reserving two tags for the admin queue works on A11 as well.

Will post a much simplified v2.

Best regards,
Nick Chan

> 
> 
> Sven
> 


