Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC766EC0471
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 09:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3xKcWF7NPjeXU/Yo9Rn3BptYJg8YH0is0Fv10MXJEt8=; b=U3WjDX3HiUx+IxWUdmbShKNheN
	AHBLRC10T09hiR1IVkeF+/fMm2zTSAOrGs2vO5K/36T+JBtX2KcRCwxriRaWazVFnrwKjZXo+qjXF
	z7O6enj5wRV1oCMES8sAWwcP4LtTvEETprtY96wfbzKBhct929nkbEoUTWvtHbJgZyZpgHjNGg1x+
	96gVFe+r4YoF+gx6HDodMR+e56kiCLaY1VYWmktWl7wTehqktwGbpUBqBDGrHDaTEgJbArOKwWur6
	IboPaw9DrFdeWcCjBSwKcRkn9TNw13PU6JaG0im4/5eQNm0j7B1BIDDtkimEPm2p5ikYSCoaoXzYa
	O903eTIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxLdX-0000000Epjy-2KRl;
	Tue, 03 Mar 2026 09:01:51 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxLdS-0000000Epig-2kf5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 09:01:50 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4837907f535so46607365e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 01:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772528505; x=1773133305; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3xKcWF7NPjeXU/Yo9Rn3BptYJg8YH0is0Fv10MXJEt8=;
        b=Zv0EULrvQEzc/tI17851daPm3aQq5UqEnVmeMJWQKqMczcekgf3v+ne1vnkKr6omuL
         vRqb0+e31fcK8hoTryJAGjxCczlL3GbOZTNCpJT6gcaIqbsm4kFtO9gWEETDHMCaH+38
         HGFwD+8VPnIzAJnAWf0EXb6aKjuSU5X2NBtzie3GLJRz3Ffi1xKnkAU1wNY9zh0FUnE7
         Zza2d7ZmlkHu8NW2lwvun9Q3AALhSv9eIWzGYMloABpPAQ4RLizxU4IPw5AUbG0hqWJx
         vLo4fcRw95kP52biTU/nHgYdRbfhQQb8aU6imn/ykJLJetXkA+kuE3b1YdhKvCfbFxas
         6kbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772528505; x=1773133305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3xKcWF7NPjeXU/Yo9Rn3BptYJg8YH0is0Fv10MXJEt8=;
        b=AORcZQUH+mY3IRMyk8cZ5/vp7eEJSk8KH1slfTgVvt/gu7ktIIuh6Z1OXEgmlzglE/
         RPeUN+sIisw7yh0OPGA2GFdn7+hmk7G1MnkdeRwk7YEXiuqlDJSX9GqrPtxV4yWLM5/i
         R7ifBj0nxk4GHrh2Rzb/x7Fl7648VOSdvp2o4EHDKwsZlVqmJPih6wHgm4/ed1U+Lp8b
         1K1QKMfGZQjNLs469TvVnKCaZ7yhwMzl/aMFhzJ5GwiVJbz65rykqRHprAfEKkpQfsuD
         GKztcDMxgFhWqJZ1ld5PHsjlQ28r4plUz5Vvo5QU3OjfXCwlhUVaLDqiXMKpGOPS5Bv5
         weaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj7KpKCa9nt9ol/SGFk+AGzRkxM+KHWzksRXr2N/3+QHJXQcn7GmA8fAm3j9Yk9u94vzLnMlLjOhl3XGQFDXlP@lists.infradead.org
X-Gm-Message-State: AOJu0YxKXB1erlvS6vQJ2vVkif6Yj+IEx+soo66C7cXuvH85gii4MJ9Q
	LI+AfBQSPtblkCXHPctTM13E/hUDMx0Ztx5STsyLMhN/Z4whCL0iZOFyFCWIOtHUBoI=
X-Gm-Gg: ATEYQzzz79LWvz5THYKIDORE6iuU01FaHjtXhUBFdF63tQw5fdTb7Vd71xiteattiAA
	BQqF6CmZg5JHe4/oeyJVZNguPVoKW4vt2Z8mQW5lpocMJJb3OPBekHQQ+4xrhE1hwbGXE+xysk+
	LmXyKxcVjEpbVa+5t3EQ2emUO+PXiFjlB+j4+MJQJc8xFWAy7sln6WDYD+1alkA3X1bsIqVH8VV
	S/JiVXVNYZq349rTdmvqF5/LkjHPwZr5lwOAdmOy6kWdmrE9yZ9nzN+3KcHLG/fW9Sad2j9UmJR
	Oi3gBrjOKHerUKSfxPgRcg34PeoJ8+fEcI7xOcUCKI1aHIs2MsIZz1+KvoTv0vrr0ZQZAtpIXWP
	PTCO/KTXt4BNshrLyC3RQCGyIWd3WHpTR1jfgZfxoW47PVTS0DGkhB6VfNb4m+IolYiVi/nSn1A
	uPUd029k6a9oQ92QD7XGaoeA1MIlSs9ng=
X-Received: by 2002:a05:600c:6385:b0:477:54f9:6ac2 with SMTP id 5b1f17b1804b1-483c9b53c9cmr291863355e9.0.1772528504551;
        Tue, 03 Mar 2026 01:01:44 -0800 (PST)
Received: from [10.11.12.108] ([79.115.63.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b3474dsm312924805e9.1.2026.03.03.01.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 01:01:44 -0800 (PST)
Message-ID: <b8a029f1-1229-418b-895e-b8dc0319b545@linaro.org>
Date: Tue, 3 Mar 2026 11:01:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] thermal: samsung: Add support for Google GS101 TMU
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
 <CANgGJDpjsyoCnuXuMMi1L3nWNJsM4aMs6C=NvBcTkWeC3NFadQ@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CANgGJDpjsyoCnuXuMMi1L3nWNJsM4aMs6C=NvBcTkWeC3NFadQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_010146_736879_CABB33F8 
X-CRM114-Status: GOOD (  18.80  )
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



On 3/2/26 8:30 PM, Alexey Klimov wrote:
> Hi Tudor,

Hi!

> 
> On Sun, 1 Mar 2026 at 02:26, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> 
> [...]
> 
>> ---
>> Tudor Ambarus (7):
>>       dt-bindings: thermal: Add Google GS101 TMU
>>       firmware: samsung: acpm: Add TMU protocol support
>>       firmware: samsung: acpm: Add devm_acpm_get_by_phandle helper
>>       thermal: samsung: Add support for GS101 TMU
>>       MAINTAINERS: Add entry for Samsung Exynos ACPM thermal driver
>>       arm64: dts: exynos: gs101: Add thermal management unit
>>       arm64: defconfig: enable Exynos ACPM thermal support
>>
>>  .../bindings/thermal/google,gs101-tmu-top.yaml     |  67 +++
>>  MAINTAINERS                                        |   8 +
>>  arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi   | 209 +++++++
>>  arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  18 +
>>  arch/arm64/configs/defconfig                       |   1 +
>>  drivers/firmware/samsung/Makefile                  |   1 +
>>  drivers/firmware/samsung/exynos-acpm-tmu.c         | 212 +++++++
>>  drivers/firmware/samsung/exynos-acpm-tmu.h         |  33 ++
>>  drivers/firmware/samsung/exynos-acpm.c             |  35 ++
>>  drivers/thermal/samsung/Kconfig                    |  16 +
>>  drivers/thermal/samsung/Makefile                   |   2 +
>>  drivers/thermal/samsung/acpm-tmu.c                 | 643 +++++++++++++++++++++
>>  .../linux/firmware/samsung/exynos-acpm-protocol.h  |  30 +
>>  13 files changed, 1275 insertions(+)
>> ---
>> base-commit: e2211f5d980086dd9fbdab3bcd86b715e12cae13
>> change-id: 20260113-acpm-tmu-27e21f0e2c3b
> 
> JFYI, the series doesn't clearly apply on today's linux-next:

okay, thanks. I'll submit a v2, but right now I'm dealing with other
higher priority topics.

> 
> Grabbing thread from
> lore.kernel.org/all/20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org/t.mbox.gz
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
> Analyzing 18 messages in the thread
> Looking for additional code-review trailers on lore.kernel.org
> Analyzing 20 code-review messages
> Checking attestation on all messages, may take a moment...
> 
> Base: using specified base-commit e2211f5d980086dd9fbdab3bcd86b715e12cae13
> Applying: dt-bindings: thermal: Add Google GS101 TMU
> Applying: firmware: samsung: acpm: Add TMU protocol support
> Patch failed at 0002 firmware: samsung: acpm: Add TMU protocol support
> error: patch failed: include/linux/firmware/samsung/exynos-acpm-protocol.h:40
> error: include/linux/firmware/samsung/exynos-acpm-protocol.h: patch
> does not apply
> 
> Was it done against mainline?

Of course, yes. It was on top of what was the latest Samsung SoC tree
at the time of development. Internal kernel trees may change,
depending on the maintainer.

If you want to try the code while I submit a v2, I pushed what I
think it was v2 at:

git@github.com:ambarus/linux-0day.git, branch b4/acpm-tmu


Cheers,
ta

