Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E2AC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 19:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MGcvaZSPcorP6DNYm+a0nDXUDpyXPezZYvSZ9UhvaG0=; b=Cdtm47BqHgtB+K+EOfnLmL04/g
	NZtXP+grt680leRgsLylGh9qEk4MFEKGTMfFxBHMG4C9UdVx/7WVjmIGWp1SUAdjbyWpRscImpGii
	upD9jAON347qqE9jiA4dBKL0hnQ4fj/ADIzKKDlOXr/vTCjSbe6qO9ypdn6YWRG6wZKAaiSe4U6uy
	rx1lqFSS8lZSLi/KNzeGD7mNFJkggL2ubkXfuR7S714pt2v0UJvHNz2vqU6+0CCXUBEFyqR7olqSV
	zgYqyTHaNx5ycK2apI7QBCxKHYDJzuLDUbZu3B+xbpzC21ByMgZ8gItofF5J1Uvr3dMcMo/DUhIFB
	CyuEEq7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8joX-00000003F9q-35LT;
	Mon, 21 Sep 2026 19:36:33 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8joW-00000003F90-0bGH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 19:36:33 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d391aso23035635e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790019390; x=1790624190; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MGcvaZSPcorP6DNYm+a0nDXUDpyXPezZYvSZ9UhvaG0=;
        b=r1nCoG2fby61+MUt/yoZ+nzzzGpzjlk1J+YBFroNHMbdN6nyKj/v4uU1Wa4dSRvOKt
         KwD8gdwku+gdtOZoxwfDF8C6BcpNT2fd8OFXvYGlPPRyVITUL59w2PjqCnBepb9vXv3m
         5DdyvXBbXJ3y3+1rFc9mVL7v6Jx+58I6Cnc7e6mxkslEJwEvOjQ/lS2ve8jodS5WCMbc
         HdcI6vo9LxLxuHoQmXYU3dQ5/vstE2tKhOaMa7jw7H2r9+GO7Xgrgs73a5wr+8z/YhyC
         1Y3c8M7KTpZEi7gCcAL2aywfXW9jqQYMKbkIPy+1KUPgBDMNTLgAZNmWXwrQaDRpqIC8
         Pv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790019390; x=1790624190;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MGcvaZSPcorP6DNYm+a0nDXUDpyXPezZYvSZ9UhvaG0=;
        b=noj9dY4BgPPT8FGBFRa7odpRoGbJo+1rqeDsjYMCOXvJ4LynPMsXEU82/5JGMOxg88
         MuOiHPUXvK1/SdgSFA2rJecSAgWlNSHrxQXb/Jd5Nq/fWtrTocxy6Zb2F41pho9f7WUb
         sVbaEFYqvtOOvWEI35TLStmsvzmPzbS0+NMti+pMXQyBAGoPv5uvygodlezSk5gU1Qkk
         xLxVwWAzNtgcPyCO5G1qP3VMtdfWFOJtYoyTDnj8h9Q7+pJJPmHV8PwgWwqUwhYahOKX
         6B0NRDKQAdslxG+ZNEf6RBgAQrcwSzOAI1O3VowQdrGVkQ1JkZNvfeMuuRcXPGI8z0JB
         FH2Q==
X-Forwarded-Encrypted: i=1; AKwUvBylW9UhbIdrrFaQlnD+52/S54WSy1KKx9KODzn2ENkY9g8biDtH24BOWc64T4HXTJeVkfC4TZv15M7//oJwOQPS@lists.infradead.org
X-Gm-Message-State: AFuF++luLk4T+N0kcHkDN9TM9tX2QTI1TJIbhMIca4UhDdrTcSnFi5yE
	WC1lNi6QoTCnHbvaTj7roqI/HaYYJfwHz8gEyf3vd9YyP1GHa4IbAThw
X-Gm-Gg: AYBFou0la5rPGuqQBR3JoOEPrbVlRh1oiLjJUX2tHLj6Dg1DM/njNdff3UvfiFvDy/D
	+TqOBIc+GEu1yaX0fGgYey3rZdvmtHN6nauhEqOXgBbIhIzofWpWeai4i3ExeSyx/yJqDBCSlfK
	aOF6aLMFMSYOvGS12DVA7lcg/deMxlX7wdfQv0/SxEj95lZmLhpjsWhawZdWSvMVnfuYfGGzWFx
	vDxdmXS9lEA+i8TPzl6CdQGusvAWEY3CSgBb6eQxh0Pjf11JM0mEyqhS/JwwErQvA1L8MrVBN6l
	5Q3SzeC2LnpAaRk1hgJvkNBSVFgtxup/f1uffzXxu0rPrOLPa+M8BrLXdQMDaz/AjKx/s2LWzmj
	P3/BmSEMP4aiSlwgTN/AoyHLhsM5plF+HPu/eUIqkeVgOUOf7BQzTBDFRhAnIxLpMkqFKz9Y9+E
	kurkWxVzAZ5hxm4YADDZwy420/D0t5YoGdSTQZs5/tiAyii0ofXczfSeu4sC0/V7VfOzkHyrfBe
	M1qI82hvLZV4Qrd7SXuqCnz2AhwKY2nQaGEOAPBeI0QQV6ouE7riA==
X-Received: by 2002:a05:600c:4e8f:b0:49c:fc6c:be19 with SMTP id 5b1f17b1804b1-49fc574c2b9mr174061695e9.31.1790019389438;
        Mon, 21 Sep 2026 12:36:29 -0700 (PDT)
Received: from [192.168.0.40] (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd8b96cefsm13450625e9.1.2026.09.21.12.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 12:36:28 -0700 (PDT)
Message-ID: <9dd42965-f39b-49e5-aeef-5d03647b2005@gmail.com>
Date: Mon, 21 Sep 2026 21:36:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] rtc: Add Raspberry Pi 5 RTC driver
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonathan Bell <jonathan@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dom Cobley <popcornmix@gmail.com>
References: <20260917135841.841680-1-sander.speetjens@gmail.com>
 <20260917135841.841680-3-sander.speetjens@gmail.com>
 <20260918-outrageous-myrtle-giraffe-80dfdc@quoll>
 <20260921185949d6debd17@mail.local>
Content-Language: en-US
From: Sander Speetjens <sander.speetjens@gmail.com>
In-Reply-To: <20260921185949d6debd17@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_123632_188643_3A6A8271 
X-CRM114-Status: GOOD (  13.73  )
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

> This was my comment on the previous revision, I'm not sure why it was
> ignored.
Looks like that email got lost on my end, I found it in the archive.

> This undocumented sysfs interface has to be removed.
Just to make sure I understand correctly: does "This undocumented
sysfs interface has to be removed" mean that
   a) the attributes themselves are not wanted and should be dropped, or
   b) they are acceptable but must be properly documented under
      Documentation/ABI/ before they can stay?

Kind regards
Sander Speetjens

On 9/21/26 20:59, Alexandre Belloni wrote:
> On 18/09/2026 13:47:22+0200, Krzysztof Kozlowski wrote:
>> On Thu, Sep 17, 2026 at 03:58:41PM +0200, Sander Speetjens wrote:
>>> +	return devm_rtc_register_device(vrtc->rtc);
>>> +}
>>> +
>>> +static const struct of_device_id rpi_rtc_dt_match[] = {
>>> +	{ .compatible = "raspberrypi,firmware-rtc"},
>> Please fixup white space issues, see existing drivers (missing space
>> before }
>>
>>> +	{},
>> and unnecessary ,.
>>
>> Just take existing latest code as starting point, otherwise you
>> reintroduce discouraged patterns.
>>
>> More important: undocumented ABI.
>>
> This was my comment on the previous revision, I'm not sure why it was
> ignored.
>
>

