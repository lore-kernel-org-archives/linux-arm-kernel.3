Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBFDD767F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 18:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AqFVHirLhrZ+YFiVZAcY6QE2WmjZdVsPtC7OHYHxAto=; b=VDLIiz+fbFAAxbCzdG58FMoMvz
	CbEUvYTgA6j+J8vtTqDbgDMD1jpDIvHgjzuxPVBOfEfO1Bc2kFRrNk3ItUnDpE8P5h0yn7Qyk4Gj6
	6BO8hOKlvqbB0myYI1jzXnNPKrFvvWv+mPk7lCPbK+uLSm+ghp5gASNmaGu8ICRH4dg6Dfwxc8wnq
	e0BcJbU0ECYwSp/Vxl9UfjVIIEj5tYsKIvX4xq7hnADPmE/TMSQMk33P2OyPR/BoB6EJUOM+40xor
	G7Bi0JSuYV8kGDAtoVAq+Q1vX/a3b9tLY8Nzt8pHIpGfSiIQhrbTxxnyEGs3g1kn+ybtbQNeLIHQn
	+kJbfqiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ZYu-00000004Roc-0qex;
	Thu, 31 Oct 2024 18:06:24 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ZVz-00000004RNa-2o7V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 18:03:24 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-83ab21c26e5so46195439f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 11:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730397802; x=1731002602; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AqFVHirLhrZ+YFiVZAcY6QE2WmjZdVsPtC7OHYHxAto=;
        b=VZ2klssaY9QWJfxgAp2HD1fQ3khRJs/KHqKc5ZI6cB5964nAGUUs1mGH8/jK1hcNG0
         nM6f6FyHhkJh8MhHu08gzaLSPFJFma7b671Rm8+rofD05AUcPaQvVH1oX9dJ8IgStRay
         rLkyKwjrrGCR1HlUIvahkeEttMk4aMWnhHtz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730397802; x=1731002602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AqFVHirLhrZ+YFiVZAcY6QE2WmjZdVsPtC7OHYHxAto=;
        b=uy0cESwePb+1Ub5M/TkL77gqbAk/jCRYkrSbsGL7n4/1XoUsXIZ4ucRfMI9XhrM5cc
         SRbdf52qmEbga5PSheU3dUPDWzpMK2TgG8nccUtUj99NAR+cdiuSdeQOxpy9Y+91SimY
         ggimQgYsk3+F3pUVSDqILKvw/ejak95Hul19/t+h/Zo1aqdb/UUNd/Z5n00gpdNNZTkK
         vSH6uxxoFaHA6wue3kj64BoklUKlaA27YhDIvvg0F29W43WMo3XsgIIJTRn3UwcdFeBI
         UU9FW3nukE8C8WqO753iIL0dfZ6vzOW7r8Rhx4Agr2rXejqclraklEn+M3+kINWysPqU
         vyDA==
X-Gm-Message-State: AOJu0YzsTlXagVdMTJZVVAs/22WGXYew5KXKNuijxAvtqTZPa2MzL3Fp
	bgg/1Oc2Zxmrm5l/HnR67yjYVAzv4ZYnCj6UIYTPMmylJkT/nhGTprclKdSfMI4=
X-Google-Smtp-Source: AGHT+IE/2tMHtynRkwFoEe4g15eKesbze+UUZeNHxyrhBMlrKzOpbj1uiD8+ldwsn9EFl+/fSR/Tfw==
X-Received: by 2002:a05:6602:3fc5:b0:83a:db84:41a8 with SMTP id ca18e2360f4ac-83b1c4b4febmr2360267439f.10.1730397801962;
        Thu, 31 Oct 2024 11:03:21 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4de0497785esm380041173.89.2024.10.31.11.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 11:03:21 -0700 (PDT)
Message-ID: <4703b646-3df4-43d3-ad75-92a38f5574c3@linuxfoundation.org>
Date: Thu, 31 Oct 2024 12:03:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] kselftest/arm64: Add 2024 dpISA extensions to
 hwcap test
To: Mark Brown <broonie@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20241030-arm64-2024-dpisa-v2-0-b6601a15d2a5@kernel.org>
 <20241030-arm64-2024-dpisa-v2-9-b6601a15d2a5@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241030-arm64-2024-dpisa-v2-9-b6601a15d2a5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_110323_759682_14E9BD58 
X-CRM114-Status: GOOD (  18.58  )
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

On 10/30/24 09:34, Mark Brown wrote:
> We don't actually test SIGILL generation for CMPBR since the need to
> branch makes it a pain to generate and the SIGILL detection would be
> unreliable anyway. Since this should be very unusual we provide a stub
> function rather than supporting a missing function.
> 
> The sigill functions aren't well sorted in the file so the ordering is a
> bit random.
This is talking about the one that isn't implemented. Can you add
a sentence or two about the ones that this patch adds?

> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   tools/testing/selftests/arm64/abi/hwcap.c | 273 +++++++++++++++++++++++++++++-
>   1 file changed, 271 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
> index f2d6007a2b983eba77a880ec7e614396a6cb1377..beb380bc09b0d07269a85a60e5d2977367740473 100644
> --- a/tools/testing/selftests/arm64/abi/hwcap.c
> +++ b/tools/testing/selftests/arm64/abi/hwcap.c
> @@ -46,6 +46,12 @@ static void atomics_sigill(void)
>   	asm volatile(".inst 0xb82003ff" : : : );
>   }
>   
> +static void cmpbr_sigill(void)
> +{
> +	/* Not implemented, too complicated and unreliable anyway */
> +}
> +

You anticpated "not used" messages looks like. I see that
this gets called - thanks.

Looks good to me. With the change to change log

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

