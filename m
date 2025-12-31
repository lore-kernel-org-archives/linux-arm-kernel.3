Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656E3EE644C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 16:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4VxsJvPd3cI1KTNnl7L01TZ9c0Oijs9ErHb2bvB+BxA=; b=udr3LFc+SJjwNZzkgf21oHBrb5
	khHqC6/OiUoVWi789+/MhdSHchT2AQlnHpfwubQI2BN6Qie7Hd6bKqNLG7KdgPWTxd4julllifGjT
	M4maZsQxKF9AsPfVXoxIyxmFd0zz2PuGxVF8tENQ3Sb/Z5GiQQAdvVuOje9S86wLpS6qfeb4kB66n
	BDfalWMpvxbYN+weNj4vZw4NLW+Z9xd6LA+w0oAQO/n2lRtOCz4GGND+KYHfu7zod9N2Zykb+Fx5F
	/SjlEBzEKyfeqoYRav1PCUyT6LZaM/I+hJAMMJyquDRTgU8CzocYDa1CUF5tYRGdn+A2kLeOQgFB7
	P/66H0kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vayx3-000000068Kn-0oOU;
	Wed, 31 Dec 2025 16:21:33 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vayx0-000000068Ip-0Bm8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 16:21:32 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-3fa11ba9ed5so7107054fac.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 08:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1767198089; x=1767802889; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4VxsJvPd3cI1KTNnl7L01TZ9c0Oijs9ErHb2bvB+BxA=;
        b=UOc7rZgQ4ti5Chzcg8vmu0BOmyjLVcyKDlaPVgIEep5aKVyVZtWzRicDZwwW2xPS7/
         EF9TM/LBrJ8RXicYrbY6Ls+f0zIu/UdhNZoPhn/SRw5TV/k7zx9mZKVOpWNyczi2NpUE
         QhTe0Lk1123vk5IHvisFv0/O8MHCrZkJdnUPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767198089; x=1767802889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4VxsJvPd3cI1KTNnl7L01TZ9c0Oijs9ErHb2bvB+BxA=;
        b=YGpH5nl9YXA0C/lASn81JAMS0mYGY/2I2xb2qtTkEjrAJdwq8OFleAp6Jk79GLt4aH
         IwMJ+1/35tejHquMlGYAgF30D73wL6h9YH5RHiTbuyUdmtuBrWkt/ucADyTJrUapKkN9
         ChXo432tAYMqL2s4NUtwYf8c+zuzWMdonEBL0RrAfbSGCgx+TPYLpHYg8bBy87VX9LNw
         MGsXcJ8dxpCHXSz22EdaM7DOKrP4NS5umJZDMPgR0WK1sdaDv+VPwA7qAW5SGAqr2FLU
         VRgloUzp+B9PlI2pNbv59MAx16r5ccPD5CiHWJS89VJzep9IEt4aaBOZItIUE+ITx40O
         qogg==
X-Forwarded-Encrypted: i=1; AJvYcCXDqPJ9JEeGzHWJJKDKRDbqeNOpeOrIgWSYn9Q6lMO08mZBScbpqFlavApESwfisrL88es4QK2tA8BgDt3ZmAlY@lists.infradead.org
X-Gm-Message-State: AOJu0YwlrfDCj9usbX7kh2uiDJn5FxoID52LVNm6SYyTuOozK2V1hAb9
	EyCnX7IHUvH4v0SmVLwYz/BmKHHLJy3I9Wei1shBTdENB0nb9vOh8G7fU4hmy7cZ/Uo=
X-Gm-Gg: AY/fxX7R9AqT0nfuodsxM8C0/UDF5IwLZlT6eJfLjGb8HLQZDckgH0MvP6M4Ea+hTQn
	EP4AymzEMjWMkyVICwzZo8tEpH859Uq6fRW20FKcp0pKy/2bvVAq661EZbEiaKMsT5SrkeCeIJT
	CpHPr+j/ZtwRakOFIeTJt05QZDqUNpLG9fwuV3HwKAgSKqpfhEGaw51yDKWpix3u2WHwXJLkRwO
	F2aWYFH1OD6x9JHy6WlCg2LEqSHNvzu0nR1v9AYl6KgydcKDQhriqTwFxR8cYpXTowumV0iXwC3
	7o4NeF0DFwyM/bEATPyIsca7rOzBtZkb0EZGzySD6JZEChPbQN/ptAEUx7gPgQ5g89bwnx+Ce2R
	GVMvfB9SauybKxBgS7Q1R/JwQUvwmI7dJUuG2vcFnqTq7LDRFJ0E4NPWiwdd1P0QVv2L1HFrWq7
	0jjF7Am6UdgJItmzyWQWzNAUg=
X-Google-Smtp-Source: AGHT+IEHyGzJlX9BG5IGxQWI+udvuX8r10ycrsNMN1UZ5U1HR75+jvZ88LGIfUUEQ4FL5FGJJHzKPg==
X-Received: by 2002:a05:6870:c18b:b0:3ec:321c:b2ac with SMTP id 586e51a60fabf-3fda580edb0mr17664156fac.37.1767198088781;
        Wed, 31 Dec 2025 08:21:28 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3fdaab65763sm22362927fac.13.2025.12.31.08.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 08:21:28 -0800 (PST)
Message-ID: <f9a32a91-e25a-4f25-8c1a-1e4c0e3b07e4@linuxfoundation.org>
Date: Wed, 31 Dec 2025 09:21:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.19-rc1 mediatek mt7921e broke badly
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Eric Biggers <ebiggers@kernel.org>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Mario Limonciello <superm1@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>, quan.zhou@mediatek.com,
 Felix Fietkau <nbd@nbd.name>, lorenzo@kernel.org, ryder.lee@mediatek.com,
 linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, shuah <shuah@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <d7f3b00d-beec-41f0-b157-7cfb871f9a46@linuxfoundation.org>
 <756e3f65-b2f2-4da3-985a-17754a7a872d@t-8ch.de>
 <CAHk-=wjO-7uR5HBi-MFnkxAxjhpgfbAQ+HCMKPiXFVwM+AJ7tA@mail.gmail.com>
 <6fc04df5-b753-4b2d-b978-0e59a7f48ff7@linux.dev>
 <c1304430-dd7d-437b-8744-70af9ca85c0d@linuxfoundation.org>
 <8c8c8f27-ba44-48eb-96f6-dae6d2d0cbf8@t-8ch.de>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <8c8c8f27-ba44-48eb-96f6-dae6d2d0cbf8@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_082130_489100_56B6BCA1 
X-CRM114-Status: GOOD (  19.34  )
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

On 12/31/25 03:36, Thomas Weißschuh wrote:
> On 2025-12-30 16:57:20-0700, Shuah Khan wrote:
>> On 12/29/25 21:21, Matthew Schwartz wrote:
>>> On 12/29/25 4:41 PM, Linus Torvalds wrote:
>>>> On Sat, 27 Dec 2025 at 04:25, Thomas Weißschuh <linux@weissschuh.net> wrote:
>>>>>
>>>>> Hi Shuah,
>>>>>
>>>>> On 2025-12-27 02:07:24-0700, Shuah Khan wrote:
>>>>>> mt7921e doesn't load on my primary laptopn on Linux 6.19-rc1 and problem
>>>>>> still there on 6.19-rc2.
>>>>>
>>>>> This should be a duplicate of
>>>>> https://lore.kernel.org/all/CABXGCsMeAZyNJ-Axt_CUCXgyieWPV3rrcLpWsveMPT8R0YPGnQ@mail.gmail.com/
> 
> (...)
>   
>> Reverting the following fixed my problem.
>> f804a5895eba ("wifi: mt76: Strip whitespace from build ddate")
>>
>> The above fixes an extra newline in the dmesg by making the
>> code more complex it needs to introducing local buffers and
>> strscpy() - the proposed fix replaces this with memcpy().
>>
>> Is there a simple way to do this than introducing memcpy()
>> or strscpy() to remove an extra newline that might or might
>> not exist? Why not check if newline exists or not using
>> strstr()?
> 
> We do have memtostr() which would be a perfect fit to use here.
> That is still a memcpy() under the hood, but the code is clear and safe.
> It does however require the source to be annotated as __nonstring.
> Which also seems to be the right choice here anyways. However for
> consistency, all other similar fields should also be annotated in the
> same way. So it is a bit of a larger change than a pure bugfix.
> 

I am playing with just removing \n from dev_info() - there are
three dev_info()s in the same routine that print the same
information. I will also take a look to see if they are indeed
needed.

thanks,
-- Shuah

