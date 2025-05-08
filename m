Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7107AC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 09:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQRn1/GHWVZUMKZLOHyyGc+VkBL3Ggrs7tyasy/5vBk=; b=B3OzPMRbfZ5ApcR0/OoQgzBfqu
	dwZoYguIL9l6ScJkHjQYzS5tEquu3gtqsb8rI+thqNNRcLdinl/jvBk3Ml3lrLLiqko03DZyp9zTX
	jCMO5sJn861Srd0eyEjfBHcW7e6p50cHlgrR0FINQEzvKdlGj6koCOyOX+BqSBnNDGNhqZlkZMypF
	TlWEVB0YZTxoDWQUhiKnDkT5vstMvTYYe1NuDK+waebkbPjWcLHsUEfJmAQN5CZK+2pKkPPXV22wK
	B4FmwamUlAF+NbDBTk0R7XFoPG84Dns1cWTyBCdcMG3t/vJBFoNc40oo/Y1q69AlOTrFgHfOZyGsI
	ac2sCxZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxGE-00000000DGr-0sBv;
	Thu, 08 May 2025 09:09:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwq6-000000009ew-49J2
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 08 May 2025 08:42:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eQRn1/GHWVZUMKZLOHyyGc+VkBL3Ggrs7tyasy/5vBk=; b=aO0tWsEVvJgj4tKLsi2yf9cTI8
	QPdnTQ43cu0MfBQTLlBud5J9NBCZnHfrGs3DmPURC+8mijYdy2kfw6vzhLi3JMLeSHKcym2vSe/1V
	s3rdZLYatvtu+Z/Awd5Lm64tQ9NMBULMoc1+oXc0ys/avd0K4fblel6xaO3OLct8c2CT9nJvbwqK/
	kY/JNf8pTwK3d4C2mjrhh/jts1MpYBd4HUVbYiWAIJ2WgaWxP0TGvdb4/ruTiFvfEuXS18P0J6Nty
	eY1lpRLsWmhEbsE+EolE6QVnuRQFf6atlLog+5tQqCl7JbIVvYNM96amn12xHWANIst8I+aaPwkFG
	5LisRq3g==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uCwq0-0000000G002-3ZPI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 08:42:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E66C1A4DAA8;
	Thu,  8 May 2025 08:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34804C4CEE7;
	Thu,  8 May 2025 08:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746693756;
	bh=P+E3NNjEk7mDbGoMuwRiIBIXW3l8dZzpasnSJi954yg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kuHeH5Sh0nD/r5HLG1hp0CiM+1Lkc8z/qqMF7RHFI1PvGn7dqtl02dWR5TrLzp0Hd
	 0FAylV8OyW3MUkwcHoh9GwHW1O8McNcCPcvFH05f92I2Z9raYujhNamPWQJd65bzOH
	 jjVrrrmfvdlY7zd/vo3YGBUdwuAbuTXkOPl2ALa1FmVtiNv98s1Jyhs81zXSF9uXpv
	 K/Me1kgLQkHTKE9plJUffAXkMn3rZT35mvJ8YZm66e6WRIzlAhiPNBcuoKvpoLk6l8
	 rHzK68KceHudJBa9sbajJRAlVewddYawfKbX/6+Dm7/cJRpAXagCK5ytjwgOB0v1zj
	 4+L0XevzkRXmg==
Message-ID: <b20ad0cf-f49b-4c78-ab67-adf3a4c55cf0@kernel.org>
Date: Thu, 8 May 2025 10:42:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] dt-bindings: Add Tegra264 clock and reset definitions
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
 <20250507143802.1230919-5-thierry.reding@gmail.com>
 <1ec7ed24-a4fe-450b-8f99-34aae6ed2c4d@kernel.org>
 <3gpirue4rr5hpgynzzadzlr6i2fvdhaugcutyqyfoeix2zf3fu@xpbdadb5nynu>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <3gpirue4rr5hpgynzzadzlr6i2fvdhaugcutyqyfoeix2zf3fu@xpbdadb5nynu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_094241_351838_BD3E916F 
X-CRM114-Status: GOOD (  19.08  )
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

On 08/05/2025 09:53, Thierry Reding wrote:
> On Thu, May 08, 2025 at 09:40:02AM +0200, Krzysztof Kozlowski wrote:
>> On 07/05/2025 16:37, Thierry Reding wrote:
>>> @@ -0,0 +1,9 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>>> +/* Copyright (c) 2022-2023, NVIDIA CORPORATION. All rights reserved. */
>>> +
>>> +#ifndef DT_BINDINGS_CLOCK_TEGRA264_CLOCK_H
>>> +#define DT_BINDINGS_CLOCK_TEGRA264_CLOCK_H
>>> +
>>> +#define TEGRA264_CLK_CLK_S			2U
>>
>> Abstract IDs start from 0 or 1, not 2. Also drop "U".
> 
> These are not abstract IDs, they are defined by the BPMP ABI. We cannot
> change them, otherwise it'll completely break.


You mean from the firmware? Sure. You have entire commit msg to explain
all unusual things here...

> 
> For similar reasons I'd like to keep the "U". These definitions are for
> the most part directly imported from the BPMP ABI headers, though we do
> try to be selective about what we add, to avoid adding hundreds of new
> lines in one go, and several safety-checking tools run on these headers
> that happen to require the "U" suffix to make sure these have a defined
> type.
> 
>>> +
>>> +#endif /* DT_BINDINGS_CLOCK_TEGRA264_CLOCK_H */
>>> diff --git a/include/dt-bindings/reset/tegra264-reset.h b/include/dt-bindings/reset/tegra264-reset.h
>>> new file mode 100644
>>> index 000000000000..31d89dcf62fa
>>> --- /dev/null
>>> +++ b/include/dt-bindings/reset/tegra264-reset.h
>>> @@ -0,0 +1,7 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>>> +/* Copyright (c) 2022-2023, NVIDIA CORPORATION. All rights reserved. */
>>> +
>>> +#ifndef DT_BINDINGS_RESET_TEGRA264_RESET_H
>>> +#define DT_BINDINGS_RESET_TEGRA264_RESET_H
>>> +
>> This is empty, drop.
> 
> We have three people currently working on additional drivers for this
> SoC and they all need to add to these two files. Adding the empty file
> here makes it a bit easier to coordinate things, making the resulting
> conflicts trivial to resolve.


Bindings are supposed to be complete (see writing bindings doc), this
means also bindings headers. If the constants come from firmware, they
are defined so I really do not understands why they cannot be published now.

Unless you mean that this is a new SoC and the firmware is not yet
fixed/finished, but all this must be explained in the commit msg.

Best regards,
Krzysztof

