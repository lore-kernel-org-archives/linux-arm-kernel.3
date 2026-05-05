Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15252FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 05:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpWMGrla8ujc+yJ0xsFuIV5CslqX+fFHzMu968BtRqs=; b=L1vwZfwksz69a1b8I8xrsypUw7
	bw7/I3lh83ONVbSkdGzUhyK2mgoAb4I+aCd0C9iJrQTnXawNV80cN0Z6dNK+gSia4ZK0fbilSGQ5D
	t14TVBkpZjt4b63EseFvnfQ76a7aCAc90O5gcgcoQrMu4F7XEg7Qgo9YLZZe72eNK2uItLBYzEvc5
	/NlKiW6QV652o0QaCRCorwsdOfmj7joWN4jogRMuzSRFboS8tzUVploZV9wNbF2HTBHN/RhfdkszM
	/r032FKnkVe2P6muTaOhg1hMdp+JKX6EhIMGpyqYb7/5nGUroGXyGPxp/ngRnq7cfXxpVu+q/FB3Y
	oJd4muUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK8kD-0000000FEX9-0uxl;
	Tue, 05 May 2026 05:54:57 +0000
Received: from [2a03:4000:b:d08:14a9:1bff:fedc:75ad] (helo=mail.kernel-space.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK8kA-0000000FEVw-3eXl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 05:54:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
	s=s1; t=1777960490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JpWMGrla8ujc+yJ0xsFuIV5CslqX+fFHzMu968BtRqs=;
	b=iGyIV0pokGRqOSR6yVS5OD8OgQUH1DfaNQTvqfIAtARXgTj/lyciwqZ7txwOhzCs36wjBW
	CzOy3NZSCXrGBnvWRZPQxNZsamZotkReSv4X+BNBw2wjhYq6GEVyq7f7/A2fZprO2PU6ER
	SUG2FJhrzSqiKnk42VeFQeSg3agl4qw=
Received: from [IPV6:2a07:7e81:7daa:0:62cf:84ff:feee:627] (<unknown> [2a07:7e81:7daa:0:62cf:84ff:feee:627])
	by oreshnik (OpenSMTPD) with ESMTPSA id e45b9491 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Tue, 5 May 2026 05:54:50 +0000 (UTC)
Message-ID: <dcef09cb-3e99-4755-b423-5de1a4404fa1@kernel-space.org>
Date: Tue, 5 May 2026 07:54:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] iio: dac: add mcf54415 DAC
To: Greg Ungerer <gerg@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 Angelo Dureghello <adureghello@baylibre.com>
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
 <20260504-wip-stmark2-dac-v1-10-874c36a4910d@baylibre.com>
 <965cb599-37ac-4d69-a8c0-015152037139@app.fastmail.com>
 <31297e73-52a5-42a0-9676-ecf057f7c21e@linux-m68k.org>
Content-Language: en-US, it
From: Angelo Dureghello <angelo@kernel-space.org>
In-Reply-To: <31297e73-52a5-42a0-9676-ecf057f7c21e@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_225455_290116_6C790AC4 
X-CRM114-Status: GOOD (  11.64  )
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

Hi Greg, Arnd,


On 5/5/26 04:06, Greg Ungerer wrote:
> 
> On 5/5/26 03:27, Arnd Bergmann wrote:
>> On Mon, May 4, 2026, at 19:16, Angelo Dureghello wrote:
>>
>>> +static void mcf54415_dac_exit(void *data)
>>> +{
>>> +    struct mcf54415_dac *info = data;
>>> +    int val;
>>> +
>>> +    val = readw(info->regs + MCF54415_DAC_CR);
>>> +    val |= MCF54415_DAC_CR_PDN;
>>> +    writew(val, info->regs + MCF54415_DAC_CR);
>>> +}
>>
>> We've recently discussed changing the MMIO accessors on coldfire
>> to behave like all the other ones, which makes readw() and writew()
>> have an implicit byteswap. An additional driver means one more
>> place to change during the conversion. Maybe you can use the
>> new mcf_readw()/mcf_writew() helpers that Greg has started
>> introducing? Those will keep using native big-endian register
>> definitions.
> 
> Yes, please :-)
> Those newly introduced mcf_readX/mcf_writeX are in the for-next branch
> of the m68knommu git tree now, they have not hit mainline yet, hopefully
> in the next merge cycle.
> 
> Somewhat related, I will have patches out for the other affected drivers
> over the next few days.

ack,

sure, will do, also understanding properly the thing, since was out from m68k
for some time.> 
> Regards
> Greg
> 
thanks,
regards,
angelo> 




