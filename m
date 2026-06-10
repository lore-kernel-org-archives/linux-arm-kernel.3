Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757BDCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 11:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWnTRg+mjczQPC1dW7dIXNyJPlDFUHTGB3Kh2mwFLDE=; b=J/YyRlqkKWxEdUhJNcUMKsUO8i
	Zf1iSlBhxSzbSCGjIjZK0XlB1aomA7zksSgIdW1itE0o/P9uQydNQjvVtFU3OZL0a/FlbJ468JUeh
	yGlvDXD5inPdNCH6TKeBi9ZQjKnnAV3wJC2zQP8FCPSFsp3NT5AMtLJhGkHVF+amvQBz7uRIdquXI
	PxFfzMjyW0O9/vkaHqWXBELFAOYXbhmcvEF6Mb0E3BsKRNHI5E/3t1ISbnfkEDLe6lY5/L8iEvqfc
	Cl1dEou5hyslaHYc7pwK0O8Abt4xVlHhe6GTYPXPD15pDOhTxeclyiYixaSDykKQttGPXnyb5197y
	rJpVkmPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXGuW-00000007VJo-3m6w;
	Wed, 10 Jun 2026 11:15:52 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXGuU-00000007VIx-2u0t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 11:15:51 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2bf20f6be6bso52290405ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 04:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781090149; x=1781694949; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KWnTRg+mjczQPC1dW7dIXNyJPlDFUHTGB3Kh2mwFLDE=;
        b=WBXTtnsASWX1aeay/1vuwqDXTtasYgAP3ussoR7bbGJ92GyJdq3slg7b0xrehub8Di
         xwjC8YcoG2bi0Nc1HpDTd3xZCVP5dmszu1wWy6fU2SUk2OAo4jpM4xGImseD0MZj9sau
         G5Q8DMI3IHgWP7UNH5msCsLmO0a9xN3GSUg6FROCchw1UbDj6PAB4OB5KRe0apFCGYSn
         G6zWm80r4J6svvO23OvWfMBMWHQll71TYkLuVw8JZxRtJJOTzWRaj1751TuHfa1dszEs
         hJcxzNYb/cL89HcHG0ZxuobiSflT6dC+OQ5XIzN2nyzvZII7d0X7h2qD5wrZPA2XbxSE
         fGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781090149; x=1781694949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KWnTRg+mjczQPC1dW7dIXNyJPlDFUHTGB3Kh2mwFLDE=;
        b=RFyrTutJgBbdfPGJ39bdzxX/7y5wFrclvQ1lO/NvbqmvB2s5fIjTHkPGnBH7/gqD+b
         gJVL6yZAKYHgvHFmdmk2//672TQxxexYbcMMnK5Tc/faO+z/G5HDZvDghZw5LDP/+WdN
         U4Vfz3mJXNPNkhpDIefnq9/mUK8riYBxAe6nfJIbOf70bSp2+otE9VRiBr5XvYHRZ2Rt
         HYiychhEFnu9HJrv2y6PczDjAsu9YHMjSAvIC3qlyJ7DlQxWuqUR8d6bDpiFFDhn3aJt
         LSQgv8PuIxltFtrtCB1E/zHaxD9ItTpfdNtiCVyQHNyRhUznowlx1b2aQFVV+hwdjDWF
         AtiQ==
X-Forwarded-Encrypted: i=1; AFNElJ+WhudzA3sV2ohQpTFdPD2E9FGp+juZzfS9atKcx5lkgwlXZ3paVnAegacWohC6u9GE4bRfdXJCFFdezcri6zPE@lists.infradead.org
X-Gm-Message-State: AOJu0YzioT14mvAh0wTkZ3b/bt9sb6iRH8Wazdm7DYIqnFVsps5CriCQ
	RtUenZ25lmLXLgdBGwtOiwFWZpanHgKgv57eBqmgnj4kUsGSBjpc9zKY
X-Gm-Gg: Acq92OHViFRh8IAgSS+X+IAKlA4QDRK6dO5tkGTeHvuW3hbSrbxTbylkRU4yGlZTSGq
	mxZb9QzW/+m6bdtIAZEgNRLwuy8yxsvWCBpGewVIo89vyRann4xnaC/n69EMLrkDfAWQiIH+fUy
	I8gSlX9CjPFArWDE/pgJ8WLD1mYFUYbxXh9+bc0UqSn8YkExEC+u6fR0W7JlP2jCS1zyaUbAAcF
	ogumGY7GViNdwyo8j6S5pFQHTmws/Mpyz/VbGw/4ubBUunx+Ilnet4rh5itu9vsUAhzu5ORu2g3
	RMi/YN7cPAe1Bw6pQ8oAG+3uuMLFryvkexVJsN3X+mPZXdEtfDmSHGDIAY11zwo9N2z5prqxTUU
	4kYjEBqEJ/AWnn0DkmiDqmbMO5PWtpCW7QOR5SHeCpD5UicrRKFqwFLabEk0duBOvSGg8fd+k9W
	05Db9tX75mR8GiNKyJKyC/v5uLYUCaVkwgjBNzRo7zyCkJC18XCAh7o6BiakyuXg==
X-Received: by 2002:a17:902:e848:b0:2c0:b6c7:2273 with SMTP id d9443c01a7336-2c1e79e29ebmr292674635ad.3.1781090149023;
        Wed, 10 Jun 2026 04:15:49 -0700 (PDT)
Received: from [192.168.1.116] ([223.122.38.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e234sm251459075ad.53.2026.06.10.04.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 04:15:48 -0700 (PDT)
Message-ID: <4bef16f2-ad9d-4417-ae12-484ffd7a87a9@gmail.com>
Date: Wed, 10 Jun 2026 19:15:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] nvme-apple: Only limit admin queue tag space when
 with Linear SQ is present
To: Christoph Hellwig <hch@lst.de>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260606-prevent-tag-collision-t8015-v1-0-93ccf4eca550@gmail.com>
 <20260606-prevent-tag-collision-t8015-v1-1-93ccf4eca550@gmail.com>
 <20260610051146.GA559@lst.de>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20260610051146.GA559@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_041550_752892_0365B986 
X-CRM114-Status: GOOD (  12.75  )
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


Christoph Hellwig 於 2026/6/10 下午1:11 寫道:
> On Sat, Jun 06, 2026 at 09:25:25PM +0800, Nick Chan wrote:
>> Apple NVMe controllers require tags of pending commands to not be shared
>> across admin and IO queues. However, on Apple A11 without linear SQ, it is
>> not possible for either queue to skip over some tags and must go from 0 to
>> the configured maximum before wrapping around.
>>
>> As a result, in order to prevent tag collision, dynamic tag reservation
>> while a command is in-flight becomes necessary. In this context, there is
>> no reason to limit the admin queue's tag space, as it is not helpful in
>> preventing tag collision.
> I'm not really into these Apple specific, but what does
> "dynamic tag reservation" mean here?

This version is based on an incorrect premise (v2 is correct and already applied)
so feel free to stop reading.

In this version, the incorrect premise is that it was not possible for either queue
to skip over tags and must go from 0 to the configured the maximum. 

Under this premise, the only way to prevent collision is to set a bitfield indicating
which tags are in use when submitting a command ("dynamic tag reservation").
If a tag is already found to be used when submitting a command, return
BLK_STS_RESOURCE so the caller retries later.

Best regards,
Nick Chan



>

