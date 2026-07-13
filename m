Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5247C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 13:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8EGB7qAg+4ywsne5RyKCHvoiul9xzVt3YITDcP0YII=; b=qV0icGbPC9wW0nUuF0o+hYtodW
	+4sFDLXmRVdw6thNLJ7q4YVFZsVuEYisTrLRVknZoYs6YzORrswdVOTglRaiakA/I4VHuHyqo9Msv
	YFk22kJq5p+n2fEOvVdo1xg04HW3X4aR54he96KD4HJAC8RTHRoqeWQTTTcIpKCjh9T+tU20SjGFh
	BxPUM6xZJ5QUHV7xMZmq1foEtuZGhwaKJ6Hhjy9F5lz+vSnvmp4RuoXERDo2yNhHbOaamJTlH2vK4
	r5otstUBNafBp/cUSGxViZkyQhYrE9MbgQNvD4Wq1Bmc2VWv8bOg0K6hU49uBV6tt8rHhVXvy585y
	Pcg9KeFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGfj-00000009OhE-2N42;
	Mon, 13 Jul 2026 13:26:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGfi-00000009Ogf-1Suy
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 13:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=P8EGB7qAg+4ywsne5RyKCHvoiul9xzVt3YITDcP0YII=; b=nPv2fU4YBhQrEwnPIXSdJmNgPk
	lbC1BFypitWtHCQIoLRRrLCi5rLLfERwXr5l7oeTtGd6HNNAjwmg7HBrzYtCgsqwIW6QHlvqdSyBD
	T4+uCljGbSgEeBy3/3088ddkDBs33ihsu7/eHrohjrlCGevTx4TgpVDyzwyL7TfcLW6xtI2Qp9DOn
	bfhkf4Vb1KsGovjAHiJp4V7mtDGon4EzqDmTy46hmQdPDJCDs4gPvAy8ONslWhuNzF63O7cZQAugV
	5vvRI/TVkPo71V2udtTpOGd57Yhv2NV9IG4Lib7D6XvUidyhP5kJkPKvkfIM7yzCODQEg7oPh9z+E
	4+g5675A==;
Received: from mx.nabladev.com ([178.251.229.89])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjGff-0000000Be71-1EAs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 13:26:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E1A7F11992F;
	Mon, 13 Jul 2026 15:25:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783949142;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=P8EGB7qAg+4ywsne5RyKCHvoiul9xzVt3YITDcP0YII=;
	b=LulEUthVs8xG/zPIPifMnBISQJDzQ8qgMnOmJ+H5S1lL2pdNt/mlYPF0Cxa7YSyg1ZQ10f
	kZ3gf96aI3e7i03cTJh5dRo/ndC8xWSx7vnAlrlcmgsT4Tu3RKxvwdq7h5jVackrlWf7Gt
	qwLyEPZwaEETPI/e72tvmdALTOBOrHhyEaPfpikFVvNtF7fr7/bX5coSYXRhwwmVsgESrk
	YkuYiykKe4U/0vetNxKCfwAbYdSUq1E3U/4n+IstYHKUHLj+kLjTMZLpaRCf4lPdLpBFKL
	KNdmgWqNrh17BFDsz2iXXQ0ZX/X31yifCj/Nvub2TUXxdaNZqpliI6wBh+1E7w==
Message-ID: <21311e49-6132-48f4-8c5a-d321c14dc8e9@nabladev.com>
Date: Mon, 13 Jul 2026 15:25:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] MAINTAINERS: Add DH electronics DHCOS SoM entry and
 fix email address
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260711210131.236025-1-marex@nabladev.com>
 <20260711210131.236025-11-marex@nabladev.com>
 <20260713-rousing-transparent-mongrel-ee18c3@quoll>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260713-rousing-transparent-mongrel-ee18c3@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_142607_550719_4F89AA61 
X-CRM114-Status: GOOD (  13.67  )
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

On 7/13/26 9:51 AM, Krzysztof Kozlowski wrote:
> On Sat, Jul 11, 2026 at 10:59:39PM +0200, Marek Vasut wrote:
>> Add another SoM type N: match and update email address to an
>> up to date one in the process.
>>
>> Signed-off-by: Marek Vasut <marex@nabladev.com>
>> ---
>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> Cc: Bartosz Golaszewski <brgl@kernel.org>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Linus Walleij <linusw@kernel.org>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: kernel@dh-electronics.com
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-gpio@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-stm32@st-md-mailman.stormreply.com
>> ---
>>   MAINTAINERS | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 8729cea57c3dd..3532d425e41f1 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7518,11 +7518,12 @@ F:	drivers/iio/chemical/sen0322.c
>>   
>>   DH ELECTRONICS DHSOM SOM AND BOARD SUPPORT
>>   M:	Christoph Niedermaier <cniedermaier@dh-electronics.com>
>> -M:	Marek Vasut <marex@denx.de>
>> +M:	Marek Vasut <marex@nabladev.com>
>>   L:	kernel@dh-electronics.com
>>   S:	Maintained
> 
> Commit is fine, but, assuming old address stops working, please send a
> patch changing address in other MAINTAINERS entry + mailmap entry, and
> in all of dt-bindings (one patch for DT is enough)
There is one more DRM entry, I will fix that up in a separate patch.

But since you brought this up -- what about the mail address used in 
copyright headers (comments) in various drivers, shall I simply remove 
it and be done with it (I think yes, but again, separate patchset) ?

