Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3BD106B53F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 13:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9OZ4u4cVhWMS+y1LRMtoJYOo8sApnqooCJL/ZNuRAo=; b=Nu7Gz8aoraAPI9FdyY7r6IdST/
	sHz040A7oTh2I+3T9FN0lu7qOCESdTYVvuZsmHTA/3qTsK2QcPh//Zox6vunfr8y/fPW+vfChpmmZ
	eWDHxvRBwU0epgx31JRADWxFVT8KNug4aqEVIq0fqD/I7h2ZbKBdDs56ncUn44JkwEeQoSPjQjOqR
	AGMBXmqxw37r0N1hXt0y7mZmJGTW3E470eJ3ejIA/M56IkPOOFc0NAR1W17w6C6TjThQxXntdvITv
	3TlmC3JYMY49RuM8hyHyckJd2wc+HZlKI9RdnBL5q65TxqzLpQS3+XgptsHJFzTKrnUkEjM1fVsG9
	jCsAPy7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5OfI-00000003VBj-2ZTp;
	Wed, 25 Mar 2026 13:52:56 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5OfF-00000003VAx-1pod
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 13:52:54 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fgpJL2kK1z9tyY;
	Wed, 25 Mar 2026 14:52:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774446770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o9OZ4u4cVhWMS+y1LRMtoJYOo8sApnqooCJL/ZNuRAo=;
	b=eB3A+maQj5Rht1YHFdjVOxmefIvxYol6GfZcgQTFvQwqJ8YE0Wkx9Lcgvruc6XyJw0H32W
	01eOwFQbbPQfIa3OQOJSZ6oR1hHUGDTzgFXVdLU3/38p2kJUFL+EliLawzCn+xtxyfK1Km
	LaLaX/IWdQ7MhpoajT7zWhAVJdnTVzqCel8mo5OCk0SklDJvcFuipszaKokEUGH9agU97a
	b9BJN5Nyr+i9Akpa3hZlt/77jh0XXGym3M29byuNWWY5Xwjz3AcK+lOAoYMsK9pJ52pln7
	2hyrLYc/fiwRrMdN1CRzer2oXxEnDBKiiPRILCrrPn+7rTdd1JXCqTT/H1/ZxA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=FDrVHXBT;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <78a1dcbf-64b6-4f3e-8d62-2bb9d26e9e20@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774446769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o9OZ4u4cVhWMS+y1LRMtoJYOo8sApnqooCJL/ZNuRAo=;
	b=FDrVHXBTcltC4Iufktx2VI/LiOCR2aN+YJi+meo2hqbGAFhFds/fqsuL8s70u0ByrB+hMF
	pydDyOXNF36CkKdnr/dymUphQ+pNMX50s8rhySooXkafbpoE3ry7YlLH5N7DEdx7tCPneX
	IeknfI+dzrXwZQy/fGHZjXniwlj7SnDgJSPdR2Z7q5L8gl8rvV7RFkYVHQQzGzIV2lQnzw
	U7805F1o/bl1/wnuNIBDymEPO4N9/IlnwF9a5aAEohiJGQ1b0MLN4X/oScMHCQ5fQhozDP
	rN94bxfAZPy0e7sv/yt6S4SbEha22PutMnZ7lFjPJJCdoRdBRBDl+TKwHRXCYA==
Date: Wed, 25 Mar 2026 14:52:45 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Reserve first 128 MiB
 of DRAM
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260324143342.17872-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVv5KUma8=2T+ibnXyH+45xvqVrQaPho0CSzP1_r+j_hQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVv5KUma8=2T+ibnXyH+45xvqVrQaPho0CSzP1_r+j_hQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 8bf10851b491f6f89bc
X-MBO-RS-META: j75d8ic77jhjuhdeawngtk8aegjzebjn
X-Rspamd-Queue-Id: 4fgpJL2kK1z9tyY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_065253_634021_2AB733DA 
X-CRM114-Status: GOOD (  14.03  )
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

On 3/25/26 2:08 PM, Geert Uytterhoeven wrote:

Hello Geert,

>> --- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
>> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
>> @@ -118,6 +118,17 @@ memory@600000000 {
>>                  reg = <0x6 0x00000000 0x1 0x00000000>;
>>          };
>>
>> +       reserved-memory {
>> +               #address-cells = <2>;
>> +               #size-cells = <2>;
>> +               ranges;
>> +
>> +               tfa@40000000 {
>> +                       reg = <0x0 0x40000000 0x0 0x8000000>;
>> +                       no-map;
>> +               };
>> +       };
> 
> Obviously I don't like this very much, but I agree there is not much
> else we can do at this point.  Shall I add a
> 
>      /* Temporary workaround for broken TFA BL31 */
> 
> comment while applying?

For maximum backward compatibility even with old TFA BL31 versions, 
which the users may run for whatever reason, I believe this reserved 
memory area is here to stay and won't be "Temporary".

But I will be looking into TFA to fill in this reserved-memory node 
properly for this and future SoCs.

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-fixes for v7.0.
Thank you

