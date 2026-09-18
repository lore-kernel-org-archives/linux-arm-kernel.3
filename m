Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB24C982DD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 19:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sSqwyN7Lx41J/1XR2bBQKHR+k8k6/S/N9gfyTr24T5o=; b=iOi6G00ZyDTAx4P48U9Y/+Ybny
	JuBjmntzm+A6zyfGgEJC02Ru6Dlsf58z6IAcz737HylzwgP8paioa4qCCUrslWY7ew6grnsEf0GO5
	JEouPsoEkZ3q8BUJiW8J07wd3svDCEh5F9lunghTL214Dg554mzSuddu/bHhq5s4FC+0Lhtvw+hp3
	jPyPvs6nKSPk6Mm5ejZT1wHfTZ1Qe0FQn2bRLSQfyOnsKZPW8xYiW+V6bWxYwf351ujcT1DQTug7o
	xKfIWnUMN9a8CTE6gk0ipZM57iCgHJ7nlyICA5hlvavNsJACgViCUS45xm6wJ/YPg/XgHUDMwhBCR
	lkxaMSGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7eKj-0000000FQFw-1KGG;
	Fri, 18 Sep 2026 19:33:17 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7eKf-0000000FQEg-1dp4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 19:33:15 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so7288815e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 12:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789759991; x=1790364791; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sSqwyN7Lx41J/1XR2bBQKHR+k8k6/S/N9gfyTr24T5o=;
        b=h4CnDObLWD70Sr8EZ6PCJGHw8JQgXWMNPZivm/A+ZusFmreu3kzsdRvlnt3MPAC70G
         W+x9Wwx4cgHST8bFQNwo0nlE+CzzT+heMOwdtIiECBSCpA97uskWYnyzNzxtp0rWV4GL
         rIsdqT1Z0lxGT6OqUXMBfE7sa2sCT+o1Fo+beoapN+eQ74yYV4J1FsvSB0QFLtUg/f/6
         n4j+dmeGQbi6cLWCyRf1XXyIiqQCYayYokMnu2bYwGTBMe/CJMqteJoyjj/TL0zSHkkW
         T+2+jGDAqyx2O+jnJDRwtnXvv/DoG7Zh/c08fP8B7vw/UAzJ3b6uABQakC/wTZQ/2xoS
         sF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789759991; x=1790364791;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSqwyN7Lx41J/1XR2bBQKHR+k8k6/S/N9gfyTr24T5o=;
        b=V2H+wHuLQYQmEpZxejBUdhY90ezlFWL0Y4X6YrwTSIycW1hPiujHZAIOkyugq/BZhb
         4hqaHt5pFxpOgwwkC4jybNPeDd+QyXqMkKhAk0dGUOGvpMUeGoe/rKxjX53oULQAfmOA
         Cjasgv95tFHsuSyAdjyw1nGmfhPD6kXR6Rdl5+DcM7c6Y0E0L7xs+OFpiMsl/dCOP4Cd
         JutBdCqxd78xH+XAeGyvStDMsmGGbsBFN34X6KPJWAamt/t2gReY+hqs+jZWAenXgDAv
         QILFFNiKitGnCBpnfL0PQqO3Tfanvs05+28py8zIkrvEwF17BH4EZWFW7y8Gi6UDsSfj
         OFpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSuGEcvOqOIpXJ+j5KsIJw9Jb4OmZ/HXawFth22c/tkQS2sAfUvkHNGyszTwZgHXag/yC9AE5xzO7VVbcZraJL@lists.infradead.org
X-Gm-Message-State: AFuF++noQScGQ0Q2O0Bza3bCp8qnFmqm9GU5WyxxK+phn04wCwuHAmHN
	AcCVZjEKNnwRmiwWMYkm5WxBsJLdxyOG944I/tA1DC0YXr3UyPih3xZi
X-Gm-Gg: AYBFou2Lusy2hS6sdhu/x9BQT/V9VcN7OX8EfEEYLMtkQTpwyzmAKNsuF8xRfxo9EZd
	I+jnHiI0saeysq5MBRQQ7oIHxATL7jpCzEbtKf6EN8HG4MVm3iDHmP2giS9eDeqYvZ4R5tnt3l8
	MwA5GJyG0DlEprtwo43AbfNoD6w1X4D+cSY1Nv1siYiAa68w6QBVG/Jhm0aT07707EbYM9lX9Ay
	lJbOQcRPGhP/sv4hwc8L0WP/zoE4M+eNhikXYmcwg484MX0Vp0dLYo8WLqUhVAFg/NfpYnrkbcs
	rssEzZyT1nigAxUVik5qVUZjHO6w4pYUYJM4MeAwy7PMWapmAYRtH8S3++GTtf3ilh7qqFKIi2c
	ErEKPZgbcQ0FFfycvUUSl9pZ5f2oGTiAJ5BV/DVRSTHvCTmI0xCkONx5QRK7WXPMBUd6II9jfez
	0SD0usBI+n0G0Cf0fWxDq2h7+BPQ2/X4Lx6z90mk1aZFkUFPflvciaRDnWvqQXYjAQc/wQ1HIur
	/jI7sxTaSAJ9yGl2rn81B40uUi7to8TfHAs9G3DAkU=
X-Received: by 2002:a05:600c:1986:b0:49b:9105:cdaf with SMTP id 5b1f17b1804b1-49fc56cb2f7mr87032645e9.8.1789759990865;
        Fri, 18 Sep 2026 12:33:10 -0700 (PDT)
Received: from [192.168.0.40] (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd2f7ef3sm10168685e9.0.2026.09.18.12.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 12:33:10 -0700 (PDT)
Message-ID: <74d59f1e-479a-495e-8413-51e1feca78f5@gmail.com>
Date: Fri, 18 Sep 2026 21:33:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: rtc: Add property for Raspberry Pi 5
 RTC
To: Stefan Wahren <wahrenst@gmx.net>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonathan Bell <jonathan@raspberrypi.com>, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260917135841.841680-1-sander.speetjens@gmail.com>
 <20260917135841.841680-2-sander.speetjens@gmail.com>
 <20260918-steadfast-unselfish-loris-996d7d@quoll>
 <f5c04c5a-20c3-4f4c-bd1f-045516d24140@gmx.net>
Content-Language: en-US
From: Sander Speetjens <sander.speetjens@gmail.com>
In-Reply-To: <f5c04c5a-20c3-4f4c-bd1f-045516d24140@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_123313_446677_0D074D00 
X-CRM114-Status: GOOD (  10.92  )
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

> On 9/18/26 15:27, Stefan Wahren wrote:
>> Am 18.09.26 um 13:44 schrieb Krzysztof Kozlowski:
>>> On Thu, Sep 17, 2026 at 03:58:40PM +0200, Sander Speetjens wrote:
>>>> Add trickle-voltage-millivolt property for the Raspberry Pi 5 RTC.
>>> Why? Describe the hardware, the need, not the diff.
>> Is this something we can avoid by making this configurable via 
>> userspace / hw_clock --param-set=parameter=value ? 
I think it would be handy to have both.
A cm5 board designer could choose to have a super-cap or lithium ion cell
and for that a device-tree property would be handy for it is always the 
same.
But for a user attachable battery on the pi 5b via headers or soldering
the userspace version would be easier.

