Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0EAE7BD8B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 10:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVFYXNZ6okL6YFmTe2rDD9/sBQsf+RLu5VEz9wgQ6IQ=; b=hneRC8gPmmRxw/kG8pHNt5v6pr
	seUqof1RLo29oSh9P2X71mYv2WZhx3bNhAaSw9IaNzBHzV6l/k4MuSFrmIjW4UMMLHlaw+k4oxLj0
	I0UFLFAiloA+F0NL/pCZZPxdeSYw/7bgMxqJlQVwT0WLqgIZfuLoWkRwdJuC1eQPkfXgaqGQD1bh/
	4TmHlT8oWJHfMZbxWGz+nhe8tG+9hO4tUf4QF8lddcvxYKO4ZvFpe1NFEa8z3EA3bC/t3L5ueNO1H
	+kcuU8U+PHNMw9FbOL61sTVKjIL/CS8DGQdykZiK2xi45tkJ8vsCXPZi5HCdfa7Mh2uY3Uo2BdGuh
	zko6bs/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrw54-00000006NFN-1esJ;
	Mon, 16 Feb 2026 10:43:54 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrw51-00000006NF0-2DT7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 10:43:52 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-649df3c22d4so2482208d50.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 02:43:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771238630; cv=none;
        d=google.com; s=arc-20240605;
        b=kHDq05lTyV+lyze7j3gt4EhOlM4NLbsHQQKXmcqY43cmNBhs1lNSHjBQqyOoUJJ0iL
         HnT+xdv5G2GNs838Kd09KzlYzaiaBaSvMicHrxBd5zkzNM4TOerZexyuV8KkFLOvIoyw
         SbZgCX5EyrrhDwLcS6tYEaYfqiP9UvR8AR6QItAIDzvLc13oAZZCgaJN4F4j478AfKDx
         zGXCNMU+phY3TEg7SwieoNgJwvveIGw5mVL+lyDF+B4anJu6raQoxkAFXNqDLYmn4Gy7
         PF1gMiZgVX1ljKEGhNSC/ZQXedfOYWzINNAOe6nJXb+iq4xzHijDJBSuJri1WOjmhB3q
         oSgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NVFYXNZ6okL6YFmTe2rDD9/sBQsf+RLu5VEz9wgQ6IQ=;
        fh=92Tihb5vI6EoJsgV/7UESVZP0r7nK8je5hwE8ug3q/Y=;
        b=W5HS0FkkCPIK2TMF5KYnc6lPEzZ3zua2F7D3i3ndSecyngLdVw8nv+7Uc0NgO230OU
         XE2O20S06juuA3tXm2G2VgGL25DfnnFv+utHqB3ekulPkTwbm/2j3abMvEUkFvEYQ4rl
         PTsvRCwfDAMOkeWgVXf0v3MNL0gtdZuZpqb1/ELEHcFUFn/gSrL+APBCaKLkXkK4SlTT
         SrpyObVMNYgyW1ZJ4SiiOhcym0mtxbbazMOahemKKtu4evmnWAmDbNQNGCtoNFAUlCbt
         zHcaQVAlgFC+s4KrIboVqTm6uWbvnv5DnkMxE090/O83LUL3E/69TXV7gh/RJ5EXTnWo
         +/kQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771238630; x=1771843430; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NVFYXNZ6okL6YFmTe2rDD9/sBQsf+RLu5VEz9wgQ6IQ=;
        b=yqRRNfdzcXVjGptdnCpiGR9c5lHmJ7EynJZRfl0etcSTeWrlcAiGFq2dIBlkju6f4U
         IUDGcOoFG8N0ZWDgJ5Bbf5aM8qlQ/93GYlVlEIZGRpthVVc+tp2IGW2xqKmDYs3i0cS7
         orY2nKYPBD30y8lJq4Z7BpUxIgIfyVAAEI9DPnMfbmaVh3+GPg2EYukgXa4vPOxTdgv1
         2UpHTSqySdFe+lb5BmlSsSN06/icn4lC1cZdWKbVuzohEpJTafeU19CpacfNEC96Ry4M
         ml0YkVzbHSB2munDi777OxCf8c0X7IMCviW8ilDcbdHnTxJdoHa0f8XOzITnbYgatI7c
         YW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771238630; x=1771843430;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVFYXNZ6okL6YFmTe2rDD9/sBQsf+RLu5VEz9wgQ6IQ=;
        b=i3FPwE/n0rXUFbLNk6HXuzP77dcjyDw875jJ9KRA0Lo1ZcTt5CE3H98Spe1p/isoJq
         8q3BuQEHXRUzTiljLjJu7teBSPwBe/jDKNdRoijxc3mIi8XqF282GT5XKsLMdkhzh+/b
         74K+5xMkLzozdkPT4lfR6B4Bu8P2OZb/K36yRp7EHJp3+cf4hiaaOv1FgHXFiYCK1W2s
         qxoWAO3vUWetE9sKd2sgAlOC7ZI/T96QRziSrubnetefetKT9NADJjzyK/Z1wxcFWnwL
         4ZKugXxwjbirfT/sIU7N0pKBGI1zt1RhJfgRshzTN4fYjmDUTgqndN1m21Egtm3BIrUQ
         Jgaw==
X-Forwarded-Encrypted: i=1; AJvYcCUf7hWIKaVQd9LPbQCZMDutjLajTn6Q5PUIjIpurWK/ObNe6wujH/0dCpGgf+Z3YYFxBzxkZ/mFKoF8dHLUsApC@lists.infradead.org
X-Gm-Message-State: AOJu0YzAYOCLd/DZIeNYOBABzP0QDpmj8nC8gHsj+m4zyKEPIXvOChNM
	DmROCQt3F3GJsrAPVR8oGGZ8Wb1Qi5NlYRIA7B+rL/pFIGdISFX0Fi7a+qX5BtHTrxAjqubRYuK
	+SjT9NJmT/vaLhGCMmyOhudhmbFUmmG9jz/AEoqzGrA==
X-Gm-Gg: AZuq6aJUf9AzwESSJ0+ewUb5zexaQyoz1reBWyUsGbSqgUYr+25SwRKtSegM/PVZVb7
	og4p3b/LEgWWf7pS3XovZyYimAoOmQ9Fs2/6i/3h8ZimH0HNDQVDC/phUqHjV8Ct9qbX+i6znuf
	eWV9B7PDbfzX9gYezBWOdVi+jgsA5FNGLLTIxUz0Ice6jTxyWbqcUz5srYy6lhAVvY/UHU92KSp
	JIxW6kWJi/vJLaSqgVZTe0fsOuLuz1jZjmRt4OzYGIi9lO6tgu93BLpvw5qPtr13jgHhgSMbpkq
	GgfnMtlOOuxyi8eQkyv7WSDsyg5Oy0abak5vdwoE7i+XKjnNGF3Qr6lGOrLSWcmU8kBfXzJVVJx
	5GMt93beYeaKMArIfGXetdpF6+e3Tp173eOFyWEN2dYwo1ck0A16/kzxjJT0qzHDHDsOq/H4sNY
	MTWRc7WfLDFQukerZM9VkWz2YoFBsVdAT5n4Sh0DSvTULi3vd0bYeWyRrX5+2mK8TD/X8PnNZVL
	MmIdroSTGEzBm06B27b4qtFxhkVbz7eF93Njsyy2JCaII4YE3MMoEnFX5QdYBvau1FneSYZLC8n
	qWwtXe1Mx6OTEPeUJUZ5kpGrY8CBjLpaTh6TEw1clIKI
X-Received: by 2002:a05:690e:e85:b0:64a:e9cc:6b79 with SMTP id
 956f58d0204a3-64c21aa6bf8mr5891327d50.40.1771238630231; Mon, 16 Feb 2026
 02:43:50 -0800 (PST)
MIME-Version: 1.0
References: <20260215110628.34293-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAC_iWjKQA0k+DTFpTDGieCK0qNL3=BCSiOPOtCo5gvdOtXd-cA@mail.gmail.com> <25d66619-23a2-4566-bbc3-83be8eae9d46@oss.qualcomm.com>
In-Reply-To: <25d66619-23a2-4566-bbc3-83be8eae9d46@oss.qualcomm.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Mon, 16 Feb 2026 12:43:14 +0200
X-Gm-Features: AZwV_QhZk8Ve-HVG4LywC7DTLkrzaAYTYg65ke5EPTaHQ49aWW-D7iWhOjZaNwY
Message-ID: <CAC_iWjKXcp8mmUaFphHRjJc+n3RNasVi91+_eP-mm3a9pnmYSg@mail.gmail.com>
Subject: Re: [PATCH] efi: stmm: Constify struct efivar_operations
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-efi@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_024351_636651_D7C38296 
X-CRM114-Status: GOOD (  15.69  )
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

On Mon, 16 Feb 2026 at 12:33, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> On 16/02/2026 10:49, Ilias Apalodimas wrote:
> > Hi Krzysztof,
> >
> > On Sun, 15 Feb 2026 at 13:06, Krzysztof Kozlowski
> > <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> >>
> >> The 'struct efivar_operations' is not modified by the driver after
> >> initialization, so it should follow typical practice of being static
> >> const for increased code safety and readability.
> >
> > get_maintainers doesn't include me in the cc list?
>
> I use only get_maintainers and as you can see no. You might want to add
> yourself as maintainer of this driver if that's your part. Or have
> korgalore/lei filters.

Hrrm, that's weird. Running it locally returns a more extended list
which includes me and Sumit Garg.
I'll have a look on what's going on.

Thanks
/Ilias
>
> Best regards,
> Krzysztof

