Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB688C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 16:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2u8iyN3q0EUKLYr5pleadR3LYPKgReYhURZxG75dAWM=; b=WGDdG5eXWWUKqgbScjbruR0sQ3
	aTs+ccdP3E78rolz7a7UShYo5C0uzPwAhX+DLTEPi2uPwn7IT9PNKNUxfdFUbfc9EZGbIXsg0ul2S
	H2guf3rXeXVL3WmvEFVxNLy65ULaTsfe7hec2nuSx9GKKvAfFwPSJuVMJm3uKd8Kg2Gunxs+8Ghpm
	5gWgJRa1lrnIP8cBoa0PwmqOUTwJYA4uGQdUcZb61Fs3yBlz1ULh6TjO5qjojL/mflrlB9PJWOfdd
	Zj9gRV5LLuUWdb3e1SQQQJENcGZI4+tJIV2xMhfKWLzLeu3OIPDzP1ivhFaWLQVSQpISmYadqTcDY
	qa8DSHrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x540s-0000000HCQr-3Mu7;
	Fri, 11 Sep 2026 16:22:06 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x540q-0000000HCQ6-1dXI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 16:22:05 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso12981245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 09:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789143722; x=1789748522; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2u8iyN3q0EUKLYr5pleadR3LYPKgReYhURZxG75dAWM=;
        b=x/69NH9YWKIHmgCiT+bcDoMbiEv+x/tNtGatqfcizEZNBLKceNaIgM9mV0pRlpd4YJ
         BBeCoWiOZzZrL8b+EwH/pGco3Z0vL7IPuG2vYfbLEguvOhyCMZMUU9XPxxxBLExvAukX
         670/yMFXbd7y6Mj9jRIXxZCpQU1oVrEThAMpSTiuDIphcTPlnXKgcE15Ex1oOw59f/6C
         t28F5R2FDp4Cn49E0kmsDei4UqSNGseWrrEeHrrII/DmgUyrNfZErSCgmYmRuEKJocRW
         1ivefuWOeeUMHghkEWJgZg56krRPHUydvAfQ0YE4cv+Y2slyZLJE/DYFm2+IPgjpj+c2
         GANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789143722; x=1789748522;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2u8iyN3q0EUKLYr5pleadR3LYPKgReYhURZxG75dAWM=;
        b=bJoL08xMe5tZkpiO+EVNxWG8qx325RQVHfN31iGlYLyuGBhyENiJeItD5f9KaiBJhX
         szZEF77xNUNcMortSEt1KK3zjA4SHGey6pu4hzL88l+6GZrzr35rKQql5ofQJBzfuTvD
         FqPItI+hfE/c0/gtWFN2Z5RvHGTJT/isOJJp4xyxcGHR8IODQlMSbyY4ZeZ0H4/EHGKg
         axrXbwcNG+WXbKHr5XON2SyrPq6kMYIrZkG5jOILAWw8XhgJs4sl8UHunScE2JEebWP3
         cXSfN8Zt790DWmyhJVP2gLKeVR069VkJFmqnfRuDktZS0KKB6p+tPBd6eVprqI6Q85cZ
         8Ykw==
X-Forwarded-Encrypted: i=1; AKwUvBwZxI6dbjr5Z1uShULDWJmyEJjowwCNUIds0vQSkYZIp70xrXpuUDYPzQEzpn5rSTDMvudUfWpxd5CkY0im/dUj@lists.infradead.org
X-Gm-Message-State: AFuF++kBe3BsaNMmsDVQhtNnDJSfeJVx/0P5afJGQY/4cWs5PUlkv4zP
	iWURgQt+/p6UxtobU1oVl7o1v1ds8RngGUej7LdS/v1l4gUw55Ku8khhlCMlWHNUYZ8=
X-Gm-Gg: AYBFou1vBHrjfqzsJ9PYYCWLLKVuNjUEu/lXpNpSfBWNjb4oZqAKDqKs5XmlkTJvMrV
	Pstmlio/O/+lRIDeiwXanFlNpaFIWTxEdw/hcQv+/+YT2WNAUxRm2dI7e+Oh4VNpYSGvdHPQ5Av
	xaEZ1rHoWYEUoTWe20khZQ9L6m+nKgJ9G+/9Xew5inTiCoc8JuXnUS7Vnd4r7LNxGZRoWhlQ1mN
	K4yoZ75p75Tp6GV6ghl+se/1hQEZl9PG7avu7s8mblrGvexLxAADCjIrhXIdXW9QoewE9Xun4Id
	YczY2XkUBkUeczGlJbwWyssdofT1cS3PJjb1nRnd9v+t0/QbAEtrP7xeT3RTx7FXGQuh4062b9Q
	bTLjvtyl0xoSx7/E8BPy3un3/lJ+8RXBe9G255WQ5CHLZQgaylOvpHSnV1u1nR8tl6fepNmsuRD
	n+7T2eSRFsb1rG7NZJO8NJRQLo+pldVEXLbbKwgZQH5RyOraGVIIt73WuMcEW4or68cWwSny0WA
	miXJaG0sEJdXwgv+5XlFcboZWlgX3ftQ8zK6W7c/CV52evHAloSsgPs8a635MZQGtNF9OW7
X-Received: by 2002:a05:600d:6414:10b0:49c:fc6c:be16 with SMTP id 5b1f17b1804b1-49e619c64cfmr43100325e9.28.1789143722456;
        Fri, 11 Sep 2026 09:22:02 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm75330195e9.2.2026.09.11.09.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 09:22:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 17:22:01 +0100
Message-Id: <DLCMIMOI4D23.1YB1F2148RZE4@linaro.org>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Peter Griffin" <peter.griffin@linaro.org>,
 "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: exynos850: Add acpm SRAM node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Sam Protsenko" <semen.protsenko@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>
 <20260727-exynos850_sram-v3-2-8627a49188ec@linaro.org>
 <CAPLW+4kBHV=pcK1WyEerQ=yg-_XcR+FMXe1W7OmrMX3hxcXo_Q@mail.gmail.com>
In-Reply-To: <CAPLW+4kBHV=pcK1WyEerQ=yg-_XcR+FMXe1W7OmrMX3hxcXo_Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_092204_452772_69E8DF8F 
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

On Fri Sep 11, 2026 at 1:28 AM BST, Sam Protsenko wrote:
> On Mon, Jul 27, 2026 at 8:23=E2=80=AFAM Alexey Klimov <alexey.klimov@lina=
ro.org> wrote:
>>
>> SRAM is used by the ACPM protocol to retrieve the ACPM channels
>> information and configuration data. Add the SRAM node.
>>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot=
/dts/exynos/exynos850.dtsi
>> index 3881f573ec08..0b614caa411c 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> @@ -163,6 +163,11 @@ soc: soc@0 {
>>                 #size-cells =3D <1>;
>>                 ranges =3D <0x0 0x0 0x0 0x20000000>;
>>
>> +               apm_sram: sram@2039000 {
>> +                       compatible =3D "samsung,exynos850-acpm-sram";
>> +                       reg =3D <0x2039000 0x40000>;
>
> Why it's 0x40000? I checked the TRM, and it says iRAM APM area is from
> 0x02039000 to 0x02069000, which is 0x30000 (192 KiB). The downstream
> kernel (v4.14) also say the APM SRAM size is 0x30000.

Good catch. That's my bad.

Thanks,
Alexey


