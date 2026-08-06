Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0A0C55838
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 07:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WpTrq3KT7PoBd2S/V9sh/mcnOd8WakjPdDWB72Qu55g=; b=2TBTyq6TvS96UEq1eDL3wYESr/
	guLTZXxNFrYvvREC/eITMK3JF2LeKbA7Yscq0loml/In8mjNnSixzhdsCikWGF8IEWmBJTKT7676a
	9t2qDrWljjhSSvDzcRuJ8xZCRouAduTqtKS1wIP8gFc/SDLcCiY6pgtPrn1YjKHJ11dDIX8/R0Q8r
	bOqH2Uv35ePJ9Ybo4euAUm5xUwMkx3xBKMzb8kp1aS0nzAMvdYC9exjwtMjZlZ3+aEdNVcKXCY5Ty
	fCXICDWSwCh82X/idqqdvia0ggP7/v6deXldxtZJlxxU1NvJNdGH5A+JgEr56rH0GPksdKL5AalpU
	+Imow3jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsY9-000000058xa-0xSJ;
	Thu, 06 Aug 2026 07:29:57 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsY6-000000058xG-0VVm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 07:29:56 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso16344175e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 00:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786001392; x=1786606192; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WpTrq3KT7PoBd2S/V9sh/mcnOd8WakjPdDWB72Qu55g=;
        b=e1fJjWzkX91QMrWuU1dBV+XU4FeiDiP3+PQO//zI3ZboTz7wKHGED+AjxGIT14zX8+
         CmHt366OuY16f6BNEL9v9MztPlcSCJj7x9C01tWBo/XlvHC6uOlzjq4xKJ+nsy5KidBs
         FB+iKe9RgIGX3+oqjuTkEQqR7Ev0uh3cg6vDpg+uRCAuSB7qnUdW+ZZ26vMolHUaAiDc
         Hv3ywEtnkMEGwQs9GyjNHoF6EIRI/4F7rUp1cvYTPb4EA8lcfAq5t4vPVP5PAvqo21RH
         awpKlPfwivftJ5qHW8X3HMt537UgVsF4uzLOoj1l6nMmZceB2EXhWKmK8QojsFTe5QuI
         F2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786001392; x=1786606192;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WpTrq3KT7PoBd2S/V9sh/mcnOd8WakjPdDWB72Qu55g=;
        b=M3w1HxpXxNQBIVznAE/85yg8l1ykNRvvk1Gi+1oNL4JP0HzgQ/Y4BT/xE9f0tgLU06
         WJyDtjuW2QoVj81lr1cNBrBdYo8aU7+FrUPXZUfCa7AIGysA+/HBxik4EhpFA4CpMvMu
         KZhgZrAeAmrCWxOZAfTeCGwKtwZLFngloXmZcbhVWwPM7kK7Z5HJQQW+8uZrtDxCrxpG
         NQro7WpFYQn6/X+eYMb9tKuFWZq3A0qiwQUZ9ibX/Nnr0XBiJNzvdVcRd4MqgVKWNN6X
         MMI2WECI2itYWgmlNxyXmjaiJrxm/bzQkhLOsswT5+IAk+1ljD2jbE+JVZqaEdoUUPcY
         cP2A==
X-Forwarded-Encrypted: i=1; AHgh+RrhLttwOX5dlAavnnFGD2tZK/Rs64VA375Qte7YtbM2iOKZX/+goANsO2Hp51warE/Azicoxrl9Bx4ZtGXuhLTV@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh14QHqM9qe/t9HSyg8BjluBYO+dmJLFLPU2PTRcoTsGnSxjYD
	q0rPZbNqYceNoJqxQd5ONVI/EOqxIb8d+nLSudYiVY6ZKgdSEo0KV++p7ppHfbhIee8=
X-Gm-Gg: AR+sD12gCRJpTuQg9Tx0pQk+0IYlihYXB7uMpjGQ09t8wXk5ESwMQDli9lztwPL0jgK
	12ajH9CGDLPN7T9SOWGWmEVvrXr140Nt4J8fnfysRN05JwGGOfFCzp+OryJPPGGbNk1V1/2GEQz
	MUd0jrxxZBxTXQtdoyL4vxZFM1DDFzgO37Li9NbBue9qevpoLQWQub0Jv/yA+cZV6TxxFTLQ7nK
	qxvsRoja/dnq2EGveB9doNNdUieonWfL00A0AuULcZ4IBRKe9AyCqLAE2bOgX+ls44ww2nTOlOp
	M3DIRrvZTXd9gTRG5pn5RBJYi1wqawZePjbWbb9NtSJfKB0mfV9SDxySTE9jCMuSbWCgDE7LoPt
	1ZTdOiJfDGkEHktvnJXmj6QhR2t1R9FfAfY/OlAQhMrZ7IkuyMvKA5zUJQDy4nuMUbouQKRPRMz
	HhATWRhcA5HqzxFw0/pDvfuV6JcqlmiX/4RK6TKSfboFBNCknghViKvESRx2g=
X-Received: by 2002:a05:600d:6446:10b0:495:641a:bd3f with SMTP id 5b1f17b1804b1-4994e7c5d9amr144919805e9.13.1786001392307;
        Thu, 06 Aug 2026 00:29:52 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:fc32:5991:4f4b:f361])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-499542135cesm41789625e9.4.2026.08.06.00.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 00:29:51 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Mark Brown <broonie@kernel.org>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Chen-Yu Tsai <wens@kernel.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,  Maxime
 Ripard <mripard@kernel.org>,  linux-spi@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: dt-bindings: sun6i: Add compatibles for A733's SPI
 controllers
In-Reply-To: <20260805210739.6da82d16@ryzen.lan> (Andre Przywara's message of
	"Wed, 5 Aug 2026 21:08:27 +0200")
References: <20260805-allwinner-a733-spi-support-v1-1-7bfd1141ebc9@baylibre.com>
	<20260805210739.6da82d16@ryzen.lan>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 06 Aug 2026 09:29:50 +0200
Message-ID: <1jpkzvln9t.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_002954_457884_904D1C77 
X-CRM114-Status: GOOD (  17.65  )
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

On mer. 05 ao=C3=BBt 2026 at 21:08, Andre Przywara <andre.przywara@arm.com>=
 wrote:

> On Wed, 05 Aug 2026 15:53:26 +0200
> Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>> The A733 has six SPI controllers with the same IP as the A523.
>> Like the A523, one of them (spi1) also supports DBI mode.
>>=20
>> Add SoC specific compatible strings, falling back to the A523 ones.
>
> Has this been tested? Can someone confirm? We should avoid adding
> bindings prematurely, not that it bites us again as it did for the H616
> DE bindings, for instance.

Yes it was. There is SPI-NOR on the cubie A7A. I did a quick sanity
check on it to verify it was functional (writing and reading back).
I should probably have added an note about that.

I have been submit a few changes like one lately. I'm doing that so we
can get on with DT as soon as possible, without waiting on the bindings.

I would normally submit the corresponding DT change at the same time
but DT is currently blocked by the main CCU and pinctrl.

>
> Cheers,
> Andre
>
>
>>=20
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml | 7 =
+++++++
>>  1 file changed, 7 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-s=
pi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
>> index 6af4ff233158..be47c6e00409 100644
>> --- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
>> @@ -36,6 +36,13 @@ properties:
>>        - items:
>>            - const: allwinner,sun55i-a523-spi-dbi
>>            - const: allwinner,sun55i-a523-spi
>> +      - items:
>> +          - const: allwinner,sun60i-a733-spi
>> +          - const: allwinner,sun55i-a523-spi
>> +      - items:
>> +          - const: allwinner,sun60i-a733-spi-dbi
>> +          - const: allwinner,sun55i-a523-spi-dbi
>> +          - const: allwinner,sun55i-a523-spi
>>=20=20
>>    reg:
>>      maxItems: 1
>>=20
>> ---
>> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
>> change-id: 20260805-allwinner-a733-spi-support-e30a9ac057a3
>>=20
>> Best regards,
>> --=20=20
>> Jerome
>>=20
>>=20

--=20
Jerome

