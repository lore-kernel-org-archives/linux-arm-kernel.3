Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98677C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 23:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2H3RYbOqTn3GnxjVlxKF7EKAbQAcVfPEnLj66ekv7I=; b=pQN1lob91HUpP91+ZWWhDBngqp
	1Wpmh/0X6b8zMcfK3uVRZ8PaIjGRE1ifG/Cf9SSIc4RmKqOGhzAtVGYJx/9qk6XCbupuPfnyCfF8k
	kgofI8FPpAfeiOGFKVU9ALfE7RngI2i4spoGAF+p4+BDufLSzqUuDbpDlS3INd7aFFv6cTmW0iDFw
	LT9l+PBRB8QYL6HB/edOiVhBPsJjuUtS/dXaTlhiJU7I0rP+eLYJbS61vSEFqO3BXHJ7ygRc0zzku
	mKzBM/mCC51sfJDDcNFwSHIeMDsHO8jg73RQiwRf8oPmpfqoewXTutqHKxmJGuR7aiYz4XU0sE4Fq
	1UqLKfFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkV4n-00000000lpf-1yZL;
	Thu, 16 Jul 2026 23:01:09 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkV4k-00000000lpD-3mrG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 23:01:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1784242862; bh=g0m8OeU/oxDIig8AJ61M96aO+0JSbbAlonoasTJgSVM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lE9qywpoyVqk2OB9ZWXf8ryCZ5PaKNDJmFhewyKtyCPE2tc6Bdh0rmNk3/spc0R1i
	 pSR8ca2hJZhqziYkmjrBFrfSPllh0//fAt7vMUeP4QRQFwUFFE1ul5oN+0KYMSlRIy
	 8Jd31oICysUv6S/9/60VoCXoCn9O3W7sXHFb/08QP8kA38/F8H7zwt+zHJdpgINY+4
	 bhrU/xy8IY2kECVf54CHroZuotdXpVPKxaXGVojeZElmETYa/Z9VJ5NZDslcQD6N4A
	 7fOd8F3nBVYt7H0XkrTvuw9K5kNzRqMgm+X39cNjw4y7UeBJntKzmuYY7GF6Lso1hD
	 Rt0O9i/ZPAl1w==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id C2F96398DAB;
	Thu, 16 Jul 2026 23:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1784242862; bh=g0m8OeU/oxDIig8AJ61M96aO+0JSbbAlonoasTJgSVM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lE9qywpoyVqk2OB9ZWXf8ryCZ5PaKNDJmFhewyKtyCPE2tc6Bdh0rmNk3/spc0R1i
	 pSR8ca2hJZhqziYkmjrBFrfSPllh0//fAt7vMUeP4QRQFwUFFE1ul5oN+0KYMSlRIy
	 8Jd31oICysUv6S/9/60VoCXoCn9O3W7sXHFb/08QP8kA38/F8H7zwt+zHJdpgINY+4
	 bhrU/xy8IY2kECVf54CHroZuotdXpVPKxaXGVojeZElmETYa/Z9VJ5NZDslcQD6N4A
	 7fOd8F3nBVYt7H0XkrTvuw9K5kNzRqMgm+X39cNjw4y7UeBJntKzmuYY7GF6Lso1hD
	 Rt0O9i/ZPAl1w==
Received: from [192.168.0.53] (109-184-53-136.dynamic.mts-nn.ru [109.184.53.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 12538398A39;
	Thu, 16 Jul 2026 23:01:01 +0000 (UTC)
Message-ID: <25ec77c8-f1ad-484a-b3ff-ee16cc4f0cbd@mleia.com>
Date: Fri, 17 Jul 2026 02:00:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: lpc32xx: only run SoC init on LPC32xx hardware
To: Arnd Bergmann <arnd@arndb.de>, Karl Mehltretter <kmehltretter@gmail.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260713192506.7782-1-kmehltretter@gmail.com>
 <8b04868e-1676-4c70-b14b-21609e01d791@app.fastmail.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <8b04868e-1676-4c70-b14b-21609e01d791@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260716_230102_815394_D3398519 
X-CRM114-Status: GOOD (  10.14  )
ln: failed to access 'reaver_cache/texts/20260716_230102_815394_D3398519': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_230102_815394_D3398519 
X-CRM114-Status: GOOD (  14.46  )
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

On 7/14/26 09:12, Arnd Bergmann wrote:
> On Mon, Jul 13, 2026, at 21:25, Karl Mehltretter wrote:
>> lpc32xx_check_uid() and lpc32xx_pm_init() are arch_initcalls that poke
>> LPC32xx-only registers. Since the multiplatform conversion they also
>> run on other ARCH_MULTI_V5 boards where access faults e.g. on versatile:
>>
>>    Unable to handle kernel paging request at virtual address f4004130
>>    PC is at lpc32xx_check_uid+0x2c/0x9c
>>
>> Drop the arch_initcall() registrations and call both functions directly
>> from lpc3250_machine_init(), the machine's .init_machine hook.
>> The calls are placed in link order (common.c, pm.c, phy3250.c) to
>> keep their previous relative ordering.
>>
>> Fixes: 75bf1bd7d2f9 ("ARM: lpc32xx: allow multiplatform build")
>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> 
> Looks good to me,
> 
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> 
> Vladimir, I assume you'll pick this up and forward it to
> soc@lists.linux.dev. Let us know if you prefer Karl to send it
> there directly and save you the extra pull request.

Will do it next week, if it's not too late.

Many thanks for the change and for the review!

-- 
Best wishes,
Vladimir

