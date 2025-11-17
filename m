Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EACCE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 19:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6Sk6Ea+BnsCZIzKA6qjgzfCaGybM7rNTtkuZ9omx3c=; b=Q6OToGIRY7fj9omkYIDlNsJdiP
	A6Ox16omKkck0n2hYHnwo+fwkJ4PLBZiGSV4me5RZpeXzogKfGQXPpx1waZxLmt3OEY8EYlMW23yg
	SJiqKCeIieGcw164rNFUmMkC7HAHAqEpDkfLzKf0Dd69yg7yvgidYOSCS7OEBRk7/P0PYKkV0Rp4S
	wejhyi+XoQBF5dl3hYVvx0zU+HK/eu5Aut2OYiWJycSGK+J0GEGIfyCgwdI0o0Xi8c384klzkMqaE
	YW/iVwJXVnlRTbLyte2+1sdmv9IP3emCV6OH6AMt0+ae42Be85aQbsaRe2RJUDXJApS96G2iMhbvK
	uvNKIY1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL59d-0000000GmZ3-2SkT;
	Mon, 17 Nov 2025 19:44:49 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL59b-0000000GmYk-0Do2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 19:44:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763408685; bh=maDYVAw3NdZd7Yq2YnAUo3PJYzmMdCYL5n3QL0+uiEg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J2OCl/J8Nc8TotGlvXWe9ddEhv8yMq421/w/QqAfDRBHl1FNoHSVnix0EWybUPnVM
	 UeFRH6p4v9HztYjWIIBc1AcvO2+/LVsVGogZlvqARwSEblYKHBxs5X/GHPsgv7yEiy
	 MrvhPS3wsfjGog2XTkfBfHKS7M8LBOMiW6RlSZjpoq+avpUXOVWGKaOwmGjz4EBhMA
	 Fg7u9jxR54WEsbeAJhIruOIdSnp72y2hWar9LSGbgaOMUx0y/fcHxaT8A6kCnKohRi
	 maAL6ZDA4TFkUGtgBSca2faNCfQzztLoTqULevWS9dnKNkzZMnkaD+8lQdIMEGh7eL
	 z6Gzq7RxRzTcw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 4EC1F3E1D1D;
	Mon, 17 Nov 2025 19:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763408685; bh=maDYVAw3NdZd7Yq2YnAUo3PJYzmMdCYL5n3QL0+uiEg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J2OCl/J8Nc8TotGlvXWe9ddEhv8yMq421/w/QqAfDRBHl1FNoHSVnix0EWybUPnVM
	 UeFRH6p4v9HztYjWIIBc1AcvO2+/LVsVGogZlvqARwSEblYKHBxs5X/GHPsgv7yEiy
	 MrvhPS3wsfjGog2XTkfBfHKS7M8LBOMiW6RlSZjpoq+avpUXOVWGKaOwmGjz4EBhMA
	 Fg7u9jxR54WEsbeAJhIruOIdSnp72y2hWar9LSGbgaOMUx0y/fcHxaT8A6kCnKohRi
	 maAL6ZDA4TFkUGtgBSca2faNCfQzztLoTqULevWS9dnKNkzZMnkaD+8lQdIMEGh7eL
	 z6Gzq7RxRzTcw==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id A43FE3E1D02;
	Mon, 17 Nov 2025 19:44:44 +0000 (UTC)
Message-ID: <1ebfc59e-dad5-40bf-8bdb-869fb5b06a1f@mleia.com>
Date: Mon, 17 Nov 2025 21:44:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] USB: ohci-nxp: Fix error handling in ohci-hcd-nxp
 driver
To: Alan Stern <stern@rowland.harvard.edu>, Arnd Bergmann <arnd@arndb.de>
Cc: Ma Ke <make24@iscas.ac.cn>, piotr.wojtaszczyk@timesys.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stigge@antcom.de,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 stable@vger.kernel.org
References: <20251117013428.21840-1-make24@iscas.ac.cn>
 <4fe5b63e-072c-419c-a1b9-bc21aec7e083@app.fastmail.com>
 <9834be77-29e0-4a65-93f6-b61bf724f922@rowland.harvard.edu>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <9834be77-29e0-4a65-93f6-b61bf724f922@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251117_194445_344946_6003C871 
X-CRM114-Status: GOOD (  27.93  )
/bin/ln: failed to access 'reaver_cache/texts/20251117_194445_344946_6003C871': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_194445_344946_6003C871 
X-CRM114-Status: GOOD (  27.94  )
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

On 11/17/25 16:56, Alan Stern wrote:
> On Mon, Nov 17, 2025 at 09:53:21AM +0100, Arnd Bergmann wrote:
>> On Mon, Nov 17, 2025, at 02:34, Ma Ke wrote:
>>> When obtaining the ISP1301 I2C client through the device tree, the
>>> driver does not release the device reference in the probe failure path
>>> or in the remove function. This could cause a reference count leak,
>>> which may prevent the device from being properly unbound or freed,
>>> leading to resource leakage.
>>>
>>> Fix this by storing whether the client was obtained via device tree
>>> and only releasing the reference in that case.
>>>
>>> Found by code review.
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: 73108aa90cbf ("USB: ohci-nxp: Use isp1301 driver")
>>> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
>>
>> The patch looks fine in principle, however I don't see any way
>> this driver would be probed without devicetree, and I think
>> it would be better to remove all the traces of the pre-DT
>> logic in it.
>>
>> The lpc32xx platform was converted to DT back in 2012, so
>> any reference to the old variant is dead code. Something like
>> the patch below should work here.
>>
>> Other thoughts on this driver, though I I'm not sure anyone
>> is going to have the energy to implement these:
>>
>>   - the reference to isp1301_i2c_client should be kept in
>>     the hcd private data, after allocating a structure, by
>>     setting driver->hcd_priv_size.
>>   - instead of looking for the i2c device, I would suppose
>>     it should look for a usb_phy instead, as there is no
>>     guarantee on the initialization being ordered at the
>>     moment.
>>   - instead of a usb_phy, the driver should probably use
>>     a generic phy (a much larger rework).

Since I'm one of the remaining users and holders of the LPC32xx powered
boards, I should take this task.

> 
> Considering what the comments at the start of the file say:
> 
>   * Currently supported OHCI host devices:
>   * - NXP LPC32xx
> 
>   * NOTE: This driver does not have suspend/resume functionality
>   * This driver is intended for engineering development purposes only
> 
> I wonder whether any existing systems actually use this driver.
> 

The LPC32xx OHCI host device works fine with the driver, noteworthy
there were some issues with the LPC32xx UDC though.

Any pre-dt leftovers should be removed from the driver, as Arnd suggested.

-- 
Best wishes,
Vladimir

