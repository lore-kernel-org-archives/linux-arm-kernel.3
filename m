Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C82CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 18:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x8i4c2z2WoES1t5qSKN6GUknygX5CCKfGDT1oqYJPeA=; b=R4aLC6JFbOZZY0+9SUnwUQF5Et
	cX9ccxas3QDDP0c7OofpP3GtLDuv1gu3mTIpGGz+iyQQCs/PXAjjXSH9Bkn/YY2FmbLP4XhaLuako
	i7jcTmqjshANNVklZEd3iD2GgIWC0dK7efBoUy2HCktEZeG8dw1/8D9YHcnMCeBJVBye2gwsQQNUa
	2gSeofokEukQYMeim62mUJgJw39MMsaqKqbofwstSluJqAXMOQ4U8Ug1XLxGpU4waZUClrnph2VKC
	NBWZ3i8Fo4h1vUMlZzUhmkkFmbHtwO5CTfrESECPJCM9Rg6setnl5sL1k0W7csTcFJLwp5DuJujBM
	rrLJbz2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL3b4-00000004c3T-1cuV;
	Thu, 07 May 2026 18:37:18 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL3b1-00000004c2y-1bfw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 18:37:16 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-79a2ee65171so11438917b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 11:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778179033; x=1778783833; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x8i4c2z2WoES1t5qSKN6GUknygX5CCKfGDT1oqYJPeA=;
        b=TugZkc7O1bHeBTbHsgM2erhXjtIA1HCQEaGiLz7Zweqnfq9x2YrT9zK00T9cSo9jdV
         cX7AP0L2O1mDPeob/xM145WecuRMfdGGALf48e1HamE8x8/GVeMbPfStIxLZUj1lILeh
         o1VhYbc4C9WnSkZEuvndHNfX1BPFUWwHpW8b1ZkUqFa6eRFPvgZ3O8B47jIA5jfN0cb4
         lyK2PAi4W6wP/1VSFjopI4Tf58hC/r4/9bRJyKai1xnbCrrwqAVewrsPyLKg8G96iC04
         Yis/x9FHdQFsc7AK324fQ/p3rmVwET2fZK7e/kagQZgUA/RYhwWA4UG2/ebFRwfZed7I
         O/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778179033; x=1778783833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x8i4c2z2WoES1t5qSKN6GUknygX5CCKfGDT1oqYJPeA=;
        b=A6IEsAPmpJ7GlkvhGzAaO7e50+FnNnH7LBUdv/J1q+OQITRRldftKACDDldwhJSs9f
         3mLFrgQF8KYqTFWsiCNfjBtAwtzCaksIAVxPl9KqZnwSBkdvhzeQNed2Gs5JwUarCdtv
         qyxzGg5NoxW6ThGkNCA3TPOnBlepk9XEJ/w/inSfwY51fMaOf8GTHuYhIZTbkJGE9Jq8
         /s0bYoBvcETabrRLN6ne0YjMl/3tKdhyNaaNFeShqoZ324iaRbbc43/VOKlrx/X3MNbz
         BIU7yheES+dkGQYyqI4VWhxopPqlEDcPPsnmZplblafi+MVFyacY2iVKaSPDXZi09VHK
         YYFA==
X-Forwarded-Encrypted: i=1; AFNElJ/qGqRgIL8GkCvgajXGkvazdvXk6N/o4lxq36FgIFQ40Sao5JV4+ixpf8CoKzhviYhRx7gQaRs0Laz40TYWj+zc@lists.infradead.org
X-Gm-Message-State: AOJu0YzW3cPoBoEqQDRZguavalFW4Yei3JUHN1fL4jlDl4gvpfVWuclD
	mq2byYNr8miXpU5e7Uq8K1oWsLU/8Y1z5e0d0Wfyu/8TbUX9P2QhHayzWuN2JFGSGmg=
X-Gm-Gg: Acq92OG4hQ1EcpgVqK+UZ0OV8zMUTakIBVh4XU6xJH9fiXqY33WxyFx3zvvtgwLOOvU
	n5TwfE+lGi6mAjctllpknty9l4iyHfu7wifDTm59aqOZf/qwK4+KD7fEK7DE0JMJU3Jg4eBSnsZ
	yIhst7PRl1yHn+Xu/h2X+LxW+6KjKD4s/UlHQY81ldYzery7SyCUkCCeBjHJTC6YRvTmfmYNxcO
	/OBAQpjFuM3vjup/BAjfiV9S1bGIupGPkkCz59tY68SsH/9q36BJAjjr6RUqiDez0JIbmdCzC5X
	8Sy13D/qNQLwWU3xEgF5Nd3yAY6WSHDyXJq3F8KEqh/pQLiCTvOY3nwbD46R0tHVj8A0PCTD44b
	AI+kRZwi5z9ZRo3oC3yybh6QquKohNJ48Inw0yyLKb+IQIIuvfuWQIlvPdWe9xEYCJA2IrhMSmB
	AJoQA1N4Y0a635DUZYZIvJXH08K97g0r/mQIN3cFuSaqlejKYwHBCkodyPygTvAlD8
X-Received: by 2002:a05:690c:6101:b0:7a3:7ad3:3e9e with SMTP id 00721157ae682-7bdf5e7cda0mr98323737b3.32.1778179033551;
        Thu, 07 May 2026 11:37:13 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd976fd09asm57064577b3.41.2026.05.07.11.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 11:37:12 -0700 (PDT)
Message-ID: <3c78f48c-6478-46d0-87c2-581bb58637dd@riscstar.com>
Date: Thu, 7 May 2026 13:37:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 08/12] dt-bindings: net: toshiba,tc965x-dwmac:
 add TC956x Ethernet bridge
To: Bjorn Andersson <andersson@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org,
 Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com,
 a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 boon.khai.ng@altera.com, chenchuangyu@xiaomi.com, chenhuacai@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, hkallweit1@gmail.com,
 inochiama@gmail.com, john.fastabend@gmail.com, julianbraha@gmail.com,
 livelycarpet87@gmail.com, matthew.gerlach@altera.com,
 mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-9-elder@riscstar.com> <afycOwz5TpkegkZd@baldur>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <afycOwz5TpkegkZd@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_113715_685538_F73357F6 
X-CRM114-Status: GOOD (  18.90  )
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

On 5/7/26 9:12 AM, Bjorn Andersson wrote:
> On Fri, May 01, 2026 at 10:54:16AM -0500, Alex Elder wrote:
>> diff --git a/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
> [..]
>> +
>> +  gpio-controller: true
> 
> I don't have any concern with the use of a proper gpio driver to model
> the implementation, but if I understand correctly this relationship
> between gpio controller and gpio consumer is strictly internal to "the
> PCI device".

(I think you're already cool with this but I still wanted to respond.)

That is not correct.  These GPIO lines are used two ways for the
RB3gen2:
- drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c uses GPIOs 2 and 3 to
   assert/deassert the reset lines associated with the two exposed
   downstream PCIe ports on the PCIe switch within the TC956x.

- Each of the Ethernet PHYs has a reset GPIO.  On the RB3gen2, the
   GPIOs used for the purpose come from the GPIO controller embedded
   in the TC9564 (00 and 01).

These are therefore "exposed" (they are *not* strictly internal).

> Is this connection variable or is the link merely expressed in
> DeviceTree to mitigate the fact that you choose to implement the
> responsibilities of the two parts split into two device drivers?

It is variable.  These resets might be implemented by other GPIO
controllers on other platforms.

> Are there other consumers of these TC956x gpios which would result in a
> board designer (and hence dts author) to ever reference this
> gpio-controller in a different way?

They could.  Nine of these GPIOs are exposed by the TC956x pins
(GPIO00-06, GPIO12, GPIO35 and GPIO36).  The RB3gen2 uses 00-03
(and possibly 04 but that's for a PHY we haven't tested yet).

					-Alex

> Regards,
> Bjorn


