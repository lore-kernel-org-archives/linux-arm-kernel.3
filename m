Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C626CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 05:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T6CW/TyuaOTIt8N9Wr1RAPau+TTLjC9WJdIFjMkQ+v8=; b=qdITB+Cm1ueeL1Kq5uoH9fV5JO
	8coCOitDsyPbk1fXda9gpgybRpNHMK8SjE6K73hygprP9gYZxxOrVUR9UoasG9iBpzw37TUkI8rJa
	ZuubIZi6XmBv0EuTPrtHSTZKTpOtkEfAtv3HVYmAtbXMX/XE8SIjCFiGxBPuMr/4gtb7W5TGe6LFU
	8h5ZbrzfIk6tbHlCyGl5Hs8MRITUiKVicPZxzGMgWHomw+SGvNm8e4h158QB0T68Lh7HsT196m9i3
	2UDw5uqGNTzymVZ6ik7ZoYJ+SMsw09UznPXIcgtmWTzVZF+pkB4Po+ibgJo6eo18KnJuQK9UpBe5Y
	VfZ0agRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXukD-0000000ANst-3nQZ;
	Fri, 12 Jun 2026 05:47:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXukC-0000000ANsh-1P5F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 05:47:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AC3F600AF;
	Fri, 12 Jun 2026 05:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D17C1F000E9;
	Fri, 12 Jun 2026 05:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781243271;
	bh=T6CW/TyuaOTIt8N9Wr1RAPau+TTLjC9WJdIFjMkQ+v8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=odveNjCW0ZUI3oR91Xs45hWmQe3TgzpFDHBuM+gaYk0atc3WPIepJviYEc9Syytjm
	 j5CcT3jV21LN8fwMAeMp56LuWvHyEXAdAzVlEw7flVhlIRtAixD/4DZuI3S4YqAYyJ
	 HonE/hhUUmupYNkAqtmpuAKaxlIIyqlrH/P94LvG2IInaQXwIoryWlmHMO67JDN6IC
	 o4cZAbfZkljfmod/p5dg/+rTvRuGnlbs01ARS4Zq/Z5KzpeD964UAiADXlzv5ja97A
	 x/B26s6guXNwtTF2wbYAnEkMDgYL8w1qUL0VPj4vgy/u4tp2rT9ZqttI108yN4g2Mt
	 Bp027WOzif6RA==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v7 5/6] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
In-Reply-To: <b1d4b888-bdbe-4a45-8561-4f27e0e9a1de@arm.com>
References: <20260611130429.295516-1-aneesh.kumar@kernel.org>
 <20260611130429.295516-6-aneesh.kumar@kernel.org>
 <b1d4b888-bdbe-4a45-8561-4f27e0e9a1de@arm.com>
Date: Fri, 12 Jun 2026 11:17:43 +0530
Message-ID: <yq5a1pecmhs0.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

..

>> diff --git a/include/linux/arm-smccc-rsi.h b/include/linux/arm-smccc-rsi.h
>> index fddb77986f70..ae663aa8fd7f 100644
>> --- a/include/linux/arm-smccc-rsi.h
>> +++ b/include/linux/arm-smccc-rsi.h
>> @@ -8,6 +8,8 @@
>>   
>>   #include <linux/arm-smccc.h>
>>   
>> +#define RSI_DEV_NAME "arm-rsi-dev"
>
> This shouldn't be here ? This is not part of the SMCCC RSI standard, but
> a linux thing. May be in drivers/firmware/../rsi.h ?
>

The name is used by the Arm SMCCC firmware driver
(drivers/firmware/smccc/smccc.c) and the arm-cca-guest driver.

Since it is used by the Arm SMCCC firmware driver, I used the above
header. We do not currently have a generic placeholder for RSI/RMI
definitions under drivers/.

-aneesh

