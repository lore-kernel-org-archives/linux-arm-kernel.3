Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DAFCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 07:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6JRYgwl0T5IpgOuDkp0yF08iEAoUfTslJUqiB0DRs8I=; b=T1s1cU9bZBdBstnnSdHVKPY/FC
	BTGvcDz4BHvdewN2XnJRo8d1aYjdzsEeX7FQpm6o8eqbGaVyEUTrnjBHKc2wURuxQ2ZrX0cVeRjZU
	suhm//6sdwHot+rfotxiH8yf1EEP2FjMPLe0SFRlaZgvc5njbKEKeIIP0WGDSXs6Fn946aBWDbdt0
	E2GDPMqlZNDy4dIMsJFOUnVVevpL1Xyp8jS4d3wtuYGZdyIMVSKCwm7xN2YHX+bXFNe7UWyKvSQwN
	6c0e7Ar7GXqBk6JsgxHcm0GVX1oTjAH/7Jw43OS962W1UbUjWbaVFZLQc+A+JFDpupHD1+v3cK1iJ
	aS7ICu1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3rjx-00000006xrw-3QA8;
	Wed, 01 Oct 2025 07:59:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3rju-00000006xra-35jY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 07:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759305545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6JRYgwl0T5IpgOuDkp0yF08iEAoUfTslJUqiB0DRs8I=;
	b=R9IbUTfL4xB9I5KgqSokOYTFzqZkaN5sYyaMftBvHjTnU96zRg6u4IPMTBnoTY5v2fvMEd
	sLM1V5w/nne1MfqdhX9mpvJL8yAq+FsygD2kK5QmAq9T8ffG91pu3VNX9Fg70CiHGCTcXJ
	FUU50YJ/feDoA+ttAoAFmfo/nnCwMUE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-O9YJlhKpMJCfkHqwZKUj2Q-1; Wed, 01 Oct 2025 03:59:04 -0400
X-MC-Unique: O9YJlhKpMJCfkHqwZKUj2Q-1
X-Mimecast-MFC-AGG-ID: O9YJlhKpMJCfkHqwZKUj2Q_1759305543
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-42558f501adso145702f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 00:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759305543; x=1759910343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6JRYgwl0T5IpgOuDkp0yF08iEAoUfTslJUqiB0DRs8I=;
        b=Yg6bHej7m3CUDC4HCnx7Xe+hEEXCnLLG38w3ON6qn968HnXVcLROGCxBxk9s8LYPNr
         fTXVtUV3VEdYD8L1w5stOMTA38+79rlLBa7T0TlKME0idQbSg9Z0u2LT2vcyJYhMgRQX
         SnUXH0EHxXS7H4q7o9kgQCQUYqdnGnSVDwvDToiY6xH1sV68ustk8BYav+8hBqK1wHr0
         qFlzwD8sdU9xIvPskqaUh8UVUaaGGOnrRDMV1p68Z4HOiyX2SxJKrvur0ZamxgPZ2JWc
         R37LTAlMj8TyDQ7tjPHUsdjF0w81ZPubeTBJ6yZlL5Muvv/FwhofmZuq8243nOXqLspV
         RVnw==
X-Forwarded-Encrypted: i=1; AJvYcCVkTqugWxIVkk6kuc/sxy9Ro4MnoaLZsLoEfyt8WfG1G+e+k26GgSeFsxmp4orhuzXLzE8uTiyJv48QG08CJvhr@lists.infradead.org
X-Gm-Message-State: AOJu0YzAVGE99cnl6tbkQYhmKVyqd/f+ssPdhz5HLY5YpqGG7biJjLWf
	Od8B8MIjoLeHvOskWzGhKQ79JtIoR2RJUJsdk8PKsq6GcdAtCKCDx6Z4UA2aPGyyZ4Fg28Zd3nC
	jakqpYJltlcaTI2dHpMEnh3gjC9ECKc1/6C2Ka89JILv0Z87Ve4MDqcVuK95PocRGi9WlGKadp5
	pP
X-Gm-Gg: ASbGnct8lHwd9KniqkqfgFwXMkIaZFNkSlFsknN2TyB5QfL4m0wR4qZR9e/+wkpHYih
	81Bw1SN6VuACW32tdPQStUD5105DeLHHCWvsajG1fFz/P0bUMja4rO5/wRN/XSLfjifvFHrzK+o
	nnbWLBE6JncXRcNuVg6KrX42tptLOG5kyS2M04qOk7dTIhgaBNYK3G+Ce6Mk7fbJRpa5qpSupai
	FIkT+cN+OfTpk1zO/4UCNPeJNdhjem+CcqMltzJgey9SmtUOIefEbT3ipyBaPBkZuZC9/ELZlIU
	QVDfLq+FmkhG9C1XQ/pCr3IoJ/pvI0gMaRf7iZvYQWaRBPm9uHXSsC/QZLq/JaoLkTlscu0Ht7k
	1CrRetrWUoV3xlJsIcg==
X-Received: by 2002:a5d:5f55:0:b0:424:2275:63c2 with SMTP id ffacd0b85a97d-42557816e2fmr1739115f8f.33.1759305542755;
        Wed, 01 Oct 2025 00:59:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmThKjj9QWZgUZye0EGBRbRcpzbrXizq8/t5RuSNwiL8WkyRG5/i9RJlh4f2Y+zEs9wXkX5Q==
X-Received: by 2002:a5d:5f55:0:b0:424:2275:63c2 with SMTP id ffacd0b85a97d-42557816e2fmr1739074f8f.33.1759305542103;
        Wed, 01 Oct 2025 00:59:02 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e619a6fc8sm26932675e9.13.2025.10.01.00.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 00:59:01 -0700 (PDT)
Message-ID: <a1f2c541-01c3-4c02-9caa-d061b1ec81f3@redhat.com>
Date: Wed, 1 Oct 2025 09:58:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 2/2] net: stmmac: Add support for Allwinner
 A523 GMAC200
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Jakub Kicinski <kuba@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Chen-Yu Tsai <wens@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20250925191600.3306595-1-wens@kernel.org>
 <20250925191600.3306595-3-wens@kernel.org>
 <20250929180804.3bd18dd9@kernel.org> <20250930172022.3a6dd03e@kernel.org>
 <d5aaff54-04dd-4631-847c-a2e9bd5ad038@redhat.com>
 <aNzc17ZW56gLX87v@shell.armlinux.org.uk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <aNzc17ZW56gLX87v@shell.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GwuFx12cocNsCVR6pR2OsqOiT20KMDZ44OFj1BS_jq0_1759305543
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_005906_862366_96B0837B 
X-CRM114-Status: GOOD (  17.91  )
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

On 10/1/25 9:48 AM, Russell King (Oracle) wrote:
> On Wed, Oct 01, 2025 at 09:25:07AM +0200, Paolo Abeni wrote:
>> On 10/1/25 2:20 AM, Jakub Kicinski wrote:
>>> On Mon, 29 Sep 2025 18:08:04 -0700 Jakub Kicinski wrote:
>>>> On Fri, 26 Sep 2025 03:15:59 +0800 Chen-Yu Tsai wrote:
>>>>> The Allwinner A523 SoC family has a second Ethernet controller, called
>>>>> the GMAC200 in the BSP and T527 datasheet, and referred to as GMAC1 for
>>>>> numbering. This controller, according to BSP sources, is fully
>>>>> compatible with a slightly newer version of the Synopsys DWMAC core.
>>>>> The glue layer around the controller is the same as found around older
>>>>> DWMAC cores on Allwinner SoCs. The only slight difference is that since
>>>>> this is the second controller on the SoC, the register for the clock
>>>>> delay controls is at a different offset. Last, the integration includes
>>>>> a dedicated clock gate for the memory bus and the whole thing is put in
>>>>> a separately controllable power domain.  
>>>>
>>>> Hi Andrew, does this look good ?
>>>>
>>>> thread: https://lore.kernel.org/20250925191600.3306595-3-wens@kernel.org
>>>
>>> Adding Heiner and Russell, in case Andrew is AFK.
>>>
>>> We need an ack from PHY maintainers, the patch seems to be setting
>>> delays regardless of the exact RMII mode. I don't know these things..
>>
>> The net-next PR is upon us, let's defer even this series to the next cycle.
> 
> Would've been nice to have been given the opportunity to respond to
> Jakub's email before that decision was made. Not all of us are in
> the US timezone. (Jakub's email came in gone 1am my time.)

I'm sorry, the time constraint is very strict. The PR is already in
late. My message's goal was to give you the needed and deserve time for
reviewing the series, not to pressure you.

Note that to merge the series at this point I need to undo some of the
work already done.

Cheers,

Paolo



