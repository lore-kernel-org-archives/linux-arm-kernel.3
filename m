Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F8FD42B9B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 15:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bkZf0dAyKpaV6oeL97qMQayHnuJCrWyOMGk6lUpa8dI=; b=ipdZrTRy1gQj/1rx0hYyRpY40k
	dB1X63rT2EbePnQup6TUYInQbLtdWnLk/2HFCcgV3GYTrKbTiUQbRfpHo+Qwwg378ueBtiMY6ae/s
	Co2uDeJzsT+0rb0c1jlvr2iJrpAemVOkgaF1jVcaROs4t+4nZlFLuqT+uU6dIg1TQi/CkSf+ZIqjn
	Cs1odyEaOtv9glReHfkP3rI62A0Lbt4s/XSoalKQq5pEhtHUN3t4vE/Gl6Lnryk8rN3CehgYA0I7d
	9oENo694DK9+Zrv9dluA2T487ad1UQBmLNh5OtWdfW16JwmJXTJRMZymFQHC+UqmB6uhwC5Trmi1N
	ikvydiBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAt3p-00000003zsR-2HZA;
	Tue, 12 Nov 2024 15:44:09 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAt1X-00000003zSP-12Im
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 15:41:57 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5c934b2c991so13511a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 07:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731426105; x=1732030905; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bkZf0dAyKpaV6oeL97qMQayHnuJCrWyOMGk6lUpa8dI=;
        b=LxLycsDHsSg3yJpK/RvLqJpEAVNP2KeTgcRq3Jb3oDF5JAG6/yEz/ln2yriajTtwIl
         5e/qo4dJQ1eRmPa31eWN4Od14djNko7QOmsMCnYWYD36N8vgl2apX+tuZMrSoRfWZGG0
         BCvaexx7TcwmPj3t11xu34PVZ9LjatapTjlvX7CgAth0a6WMSp2oJXU6m+4mGa9QCYIm
         2gCupnzgwEG5a8OfUf+nQnGCJEcIniW46t7TPvtYQKAa02m6pbmG7njqq1mKHhbyuRku
         +Z5ZM6vaSlEB+Dko+IP3QI9JorB8mbv0nW4VXuop5imTqTXLkj1rLojC/TmgRvnv01w0
         ZkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731426105; x=1732030905;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bkZf0dAyKpaV6oeL97qMQayHnuJCrWyOMGk6lUpa8dI=;
        b=gsQ8HuLcBO8G+OKylae5MOeevljC3d8jp2Ss8RW2QIGhdvOvVTiALfIiNZYRaFC9sm
         EOCWQ+1Hgdc4fssvMsLnIg/93DEVfeaC40Lv7MpU2rddZC0+dlM+x4dTv1AgIfRCMwU1
         5Xl5kB7ICr9i2hsM5+qcJJ3nMitQI5J+1E5/1wQwlyBYKwyaAhRTIU3ixZtqUIwrPY81
         yx+SLRlo7x8X2mk2K7FtK8I9opafinhaq+IgO1BaeJ1AgET6HZrOSAYEnh6K0znwV8Re
         fEqVnrJESHcIt0yZkC8qnnDLOBqYkpayT4BwFmCFGip/wXoe2qCYOXlMJrzs0q2jhAiS
         z77w==
X-Forwarded-Encrypted: i=1; AJvYcCVq8CfCQNLqzR4VEuD3t1P5MkoLk93i2SX+ObdkXEHwjPpXCZYz/pXCLROkAbpbO8cuKCb3vhtINiWFpkgII9zs@lists.infradead.org
X-Gm-Message-State: AOJu0YxJiD8QP5GoU/1nWaBZ4XulupMEPo3+3/p/Z34kj4J2n5Y1DIAg
	8kzcCX30VfUQoRO/BCGQHvP2SgpuQ+MPIDqlc/MZWWAXFzoZl7jj8Qbp3M4IBekIZagufOVgbta
	zL/ABq8G6za9Ur44rdHTxa9LpmXP5e8B0CJPM
X-Gm-Gg: ASbGncsip0Os5TDe17QOi/Hbc+x6zlONtPXmWjpFieLKQ54uaAoO2ql2EYXTpxKGV6R
	TvCq8ZGx34iUm00HpOkYKBd3B0t/4cKaryMmmz/5A8Zd7wYX/PspRN8+MUlXu
X-Google-Smtp-Source: AGHT+IGKGj3m0K6cw27EtgaGcbRERBtnwAgADHveQ1xpIh6tli+bg/P/um8bA7UFcXQB7YKvR9KUq5R8xprHojQBtMg=
X-Received: by 2002:a05:6402:234b:b0:5cf:4994:501d with SMTP id
 4fb4d7f45d1cf-5cf5234185emr287895a12.3.1731426105003; Tue, 12 Nov 2024
 07:41:45 -0800 (PST)
MIME-Version: 1.0
References: <20241112105604.795809-1-james.clark@linaro.org>
In-Reply-To: <20241112105604.795809-1-james.clark@linaro.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 12 Nov 2024 15:41:08 +0000
Message-ID: <CA+EHjTyPc5o3T1jQY8VY+W5qtneiKw5wVMVhuSif2ZVs3S=ChA@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Pass on SVE mapping failures
To: James Clark <james.clark@linaro.org>
Cc: maz@kernel.org, kvmarm@lists.linux.dev, oliver.upton@linux.dev, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, =?UTF-8?Q?Pierre=2DCl=C3=A9ment_Tosi?= <ptosi@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_074147_308194_CEA0B588 
X-CRM114-Status: GOOD (  17.21  )
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

On Tue, 12 Nov 2024 at 10:56, James Clark <james.clark@linaro.org> wrote:
>
> This function can fail but its return value isn't passed onto the
> caller. Presumably this could result in a broken state.
>
> Fixes: 66d5b53e20a6 ("KVM: arm64: Allocate memory mapped at hyp for host sve state in pKVM")
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  arch/arm64/kvm/hyp/nvhe/setup.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
> index 8fec099c2775..cbdd18cd3f98 100644
> --- a/arch/arm64/kvm/hyp/nvhe/setup.c
> +++ b/arch/arm64/kvm/hyp/nvhe/setup.c
> @@ -146,8 +146,7 @@ static int recreate_hyp_mappings(phys_addr_t phys, unsigned long size,
>                         return ret;
>         }
>
> -       pkvm_create_host_sve_mappings();
> -       return 0;
> +       return pkvm_create_host_sve_mappings();
>  }

Reviewed-by: Fuad Tabba <tabba@google.com>

Thanks,
/fuad

>
>  static void update_nvhe_init_params(void)
> --
> 2.34.1
>

