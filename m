Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102D8CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 20:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDOOwXlF8XSVB54dbj8fN/DkU+oAHCBK8LyzU2tYaXY=; b=vwp4IzWzdKvqWr5kt6HOJPSD6K
	FYpWjzwUvkrXHwGBlKp1JiKCinduTTGfKB1aHaZGP3gYho94+ORen0vnS0c7fTkUbyhDPvTel1zWo
	4OF0gxT6YXj22WzQdW2svo5y3muxwh/amlYucK28UqCDxJayXyQ91Byu6/7iI0riLKv/fz94lgnOY
	9T4J6YtVRqR3ZlGZu3ASzY8CzqQ+QJKjLVnV96T1oBpoWH14UNc28zv+ZTPZHmEv45Y8xQcu0/Q3v
	tADlOvzSyyboZ/3tQiyIC/7us/BAdg6XSOZUAl+WnfyAydHqGBpDObnto/EHUCHovpWvT+hoxwI/m
	MU/U/EAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbPFA-000000049o0-2ZAK;
	Sun, 21 Jun 2026 20:58:16 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbPF8-000000049nP-0EvJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 20:58:15 +0000
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4923fb1f095so24454115e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 13:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782075492; x=1782680292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDOOwXlF8XSVB54dbj8fN/DkU+oAHCBK8LyzU2tYaXY=;
        b=Eru2DzWeDeSQ+bxFogjzgKszx935o04bJ++osm7kTYaSncVGUvYNRHjQtmpS0JBF48
         UsjpfSBKDAZUejRB6mJn1wnRlJpahPNsgJywvPHMwnt3DNZTukBnujyJxFQAdIVlgrJz
         GLdLnlpk3BWJYAB5Y283o1hcPy7YUj+GGV2UKCRewH8o/l3yDujfVHW+tzkCEwKY2U8X
         DPZRemHDRiPi8Jm65JyyQBlfB8kaWWqd5/YHeur+O9AO/Um+KQIQ68cMAFNUQjpAD+MY
         8givrASN0GKrqvn6dM47YmUah/oIb+TXIOwhb/m3DA2AL4L6QUI8146UXC4hIqGWcdZb
         CDkA==
X-Forwarded-Encrypted: i=1; AFNElJ/YdvtdCoourzrCPs64ejG0lQTeF5G1Yk597X3HuqTe+MU1BJIm8ts6la4pwFaGiNSQy8uMcZhmYN5K+KtVNGLB@lists.infradead.org
X-Gm-Message-State: AOJu0YwGAUD8qoi3z96sBVX2nBeevYpO3VC1HveoZyS6cpSJ4l+QwXK4
	dcQPyemBZcuvwfd2KKC+7xPKauWmtY1nJNLbGbcAoubcw6UQSEVduLse
X-Gm-Gg: AfdE7ck0/mCGV7E1TGVxWA0/76OmzTYuwNtKPwaRUpR+QHPbU2CPHgmk9OdBC1hk8uB
	muvjvEeTmsOpn4H64KYFFLVbFwYd8bEflhmT9Nays4NzROqlLw+2CuCIl3lhd6InNy/9TtX+5pn
	3qbAm45LLY7VVuJybZZN1xr+AsGk0sFVTdetxIQA+d0Y6M6JHjSQyeu+aW7iq7Yfn7hUtw2ku49
	dTdf8XKp5o9hYvXJRV5WIxEqRaTFOjs94BeYURpX2wsN5Wu0pMLvxPvgqhQWJLTTXntasipOukx
	JSkUMduJOuecF1VKoirfCF0agq3qVFG7ax653IkjEa7Ws1IGS5qvM19PUSRu634jwj2N2MppNeN
	BEoJ6Cs+GFvA37v9oEbV8PrOdogi2aAfrpxZ/eYzPorswTeA1ijdn9e/6YBjFYcBUilFsVYMdBK
	z3O0LjlMyAj2b+OgnqcF7IY56G/aO164XopviOi43/Dz3iizE7dTxhAS5c2iFirYcUY4xwluFYp
	A9iRQ3T5N0RPxQE5Fkr
X-Received: by 2002:a05:600c:5285:b0:492:463c:48b7 with SMTP id 5b1f17b1804b1-492463c5257mr142771365e9.22.1782075491802;
        Sun, 21 Jun 2026 13:58:11 -0700 (PDT)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fe7b359sm230394915e9.9.2026.06.21.13.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 13:58:11 -0700 (PDT)
Message-ID: <89a39670-c459-4467-a032-a965bc1dea6b@reactivated.net>
Date: Sun, 21 Jun 2026 21:58:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: Remove non-functional EL2
 virtual timer
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Marc Zyngier <maz@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com, andrea.porta@suse.com
References: <20260619204832.586079-1-dan@reactivated.net>
 <878q898ulx.wl-maz@kernel.org>
 <223cd514-41b3-45b9-8617-b54d379d5091@broadcom.com>
Content-Language: en-US
From: Daniel Drake <dan@reactivated.net>
In-Reply-To: <223cd514-41b3-45b9-8617-b54d379d5091@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_135814_103582_8567521B 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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

On 21/06/2026 21:03, Florian Fainelli wrote:
> Daniel, do you happen to know which 2712 SoC revision you have, whether 
> this is a C0 or D0 stepping?
> 
> We have an internal bug tracker item pertaining exactly to the virtual 
> timer interrupt connection however it affected a sister chip (77122) and 
> not 2712 AFAICT, now checking with the design team whether the same 
> happened on 2712.
Thanks for looking into this! I am using Raspberry Pi 500 with D0 stepping.

Daniel


