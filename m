Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE31CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 02:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xXDiAxEFwyAProbdrm+uUTrK71kU+kKOZY+CjZ1YNI=; b=0NtRxfEz27V8zpXfVW8DKMicKC
	JaYb3V6gbuPSX78cI2NBpjDAPnP2LqGCHEKtVSioGgjx7c/GCwrwArj31kDmoVttEQOqFcXOPrhgC
	uoO4e2S8jceL7Rse8k8kOXyRLgWBRAVO41MEUA4ptHTvullkxVyuyca7saJTDVraV5rRq1JNU45U4
	8nAbfj9V9BEV3lqbZkZQDkrSj+gawLtLdN5WBijfHQ7PfLue7os509gACOtE02WuO8YSsKmham3h7
	xUJiMPUJYv3AMEZeuF2O3QwFdacSf3PmhRy3lDuaaUIjWQeXyFN8XZBni6DgF+OvZQRP1vJS8JqGd
	FKNoeR4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa2vL-00000000XWh-1cDp;
	Thu, 18 Jun 2026 02:56:11 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa2vJ-00000000XEW-2Q6X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 02:56:10 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gglfw0nP7z9v2W;
	Thu, 18 Jun 2026 04:54:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781751240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8xXDiAxEFwyAProbdrm+uUTrK71kU+kKOZY+CjZ1YNI=;
	b=DnyO2zxFhkzhydI3TxPM7sUiLIlggbgInwByWW6FoKV3DabwHZXW8CPuub0zGUULodGpcf
	RnIrZbSOuh87N1jJcmi3ArJFct5sKoaBimaDxsfJHk32NLGd3bJy3EofjupIZ9e90M8fke
	ay8ULx7feekJ2kuCE5IZDctdtYroJVxwkUTQHcJA4QJSA5nrJceky32gJaAMYatlGlM/9H
	werau6XyUjZwu/bFDAEF86IXGIFQoHqvWAs8fEFWdl67NNOmCvkn/gFDI9apdGPXl82zQu
	jwUACTmNZ1Jptt73STom0ec60B8mB2Cft0i111iTHwml5eh6Qxr3BvkLQDg4gw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=lHMu8ryT;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <3fb1433d-604b-4598-9f6a-ae130c613d07@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781751238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8xXDiAxEFwyAProbdrm+uUTrK71kU+kKOZY+CjZ1YNI=;
	b=lHMu8ryTAHld6UQ7P6HwAwwVqnAf7abS6Oy9wMJeAQF2oKHwG5JOjoDV5lTUsBAcVRpn4D
	v2PJqXuieWuP3yD7krRBKH7ZHcSSIewDa++7SLQvIILOQqvCkC+phedR9u28pwp3/xJ7Gc
	XQaw2J9Ab3Y7epZ5ccUpSqp3qipQVHsWTKpjQgQCjFg1Mf9NulDUeJdIcMspG0WuumitAq
	tIaxSRaWC5mFbXa88zlu7RdNGBLLytgox72L2opQd8cNc84JION2qpGzVQf7a/8K/184Er
	TMUFoxBJUPCCwYQ0V70BuPbUlDKD6BfLtq+h8he9R4kOH+34UsPA1tDy4Ox1Hg==
Date: Thu, 18 Jun 2026 04:38:00 +0200
MIME-Version: 1.0
From: Marek Vasut <marek.vasut@mailbox.org>
Subject: Re: [PATCH 2/3] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum
 workaround
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260617030008.154449-1-marek.vasut+renesas@mailbox.org>
 <20260617030008.154449-2-marek.vasut+renesas@mailbox.org>
 <CAMuHMdX7XuHQDSsX4P7NZ46_OnCX2o25szuALwSs2z+PHq+JNg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAMuHMdX7XuHQDSsX4P7NZ46_OnCX2o25szuALwSs2z+PHq+JNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 5fc08f1b7a6d7969849
X-MBO-RS-META: 1imfw9c1rkfizt9npf5dc3bznq391u1a
X-Rspamd-Queue-Id: 4gglfw0nP7z9v2W
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_195609_777099_E33CAF9C 
X-CRM114-Status: UNSURE (   6.17  )
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

On 6/17/26 9:09 AM, Geert Uytterhoeven wrote:

Hello Geert,

>> --- a/drivers/irqchip/irq-gic-v3-its.c
>> +++ b/drivers/irqchip/irq-gic-v3-its.c
>> @@ -4901,6 +4901,18 @@ static bool __maybe_unused its_enable_rk3568002(void *data)
>>          return true;
>>   }
>>
>> +static bool __maybe_unused its_enable_renesas_gen4(void *data)
>> +{
>> +       if (!of_machine_is_compatible("renesas,r8a779f0") &&
>> +           !of_machine_is_compatible("renesas,r8a779g0") &&
>> +           !of_machine_is_compatible("renesas,r8a779h0"))
> 
> of_machine_compatible_match() with an array of strings might generate
> smaller code (I didn't check if 3 entries is enough to trip the balance).

Let me handle that as part of suggestion from Marc.

