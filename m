Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B889C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 14:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=08BjH0ziI5ADq3xxOWwWBDU24HS4UOP00O2KNSnlmew=; b=D115fz7+DXbZV4o+0UOmwzpwDS
	kkNJZcozKM1xx6EmA1/W1tx32xeQSiRV8tMxe2CUVl2oaLuHpLq0O6OJnowzOAfvzoQTWM22qcHha
	8ui/6TSjLaX7gM9uD9Umf3pBFWdV5lYS3f/oWagahQU/Iz2nMFo81o5V7+pU1Ny2SAgVL0y5Rf0lY
	DLp2y6uUR9Qgh4/XCzeJr8j+S7bR53XdtRSpYvsva2ywhUG+0lcV5+pGE3j+34aN/O6Pq9pP6WoGz
	YWZrbJaDcXjxCdbzcQr+GIO7/zds8dBZKjJ2tg4EXl9ByVSQkGu+FfDOglHnm0vSQIC/LMfOFBCnZ
	FtU3o8fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY48C-0000000Gfaj-2UnY;
	Sat, 05 Jul 2025 14:44:44 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY44v-0000000GfIv-2huQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 14:41:22 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-60c51860bf5so2783471a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 07:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751726480; x=1752331280; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=08BjH0ziI5ADq3xxOWwWBDU24HS4UOP00O2KNSnlmew=;
        b=hVB3TPf+sKa7SyhkcWm9y+f2j8E5mI8dJm5WyT2thqbBb26LyHI0c9NmYCZmnsY8nY
         L5z6EmTFSKQDhu9tFe6LsuhC9U2DQiNmaJvJ67HpAFf9uCkI7CX9DyDY9SAKUNx2Am7v
         ZfouR0MpVDDOXRrNDZ40ibj5AEXzuSA3uAD6vYW2DtIh7UwVIKoIogmQ5JNSe0iFnJ/L
         XNsbgnx1y9mYi7zs/OfsxssA1pywo7aJPproQfbHvUjtooeF3ilJ4ozTC1IhdRtg02sf
         vHYCiNEDUoAnZiaObgl6eTOjLAmi8hSes7FUEwpnrp6S//ArT5ie/92S2ICTQoBOM47x
         4ZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751726480; x=1752331280;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=08BjH0ziI5ADq3xxOWwWBDU24HS4UOP00O2KNSnlmew=;
        b=p43fGKwWsApHFaqJ5/EU70fPR1+VLkitI2wZTsNJ0m0Ohg3ctGLu9sCj6t/w/V+1YL
         /mz+oG0v02bK8vREylbhDf8qmze3BZu1xesQfAlsgXaKs5rktWfbNcsbUot9DPcyAMnc
         /RPv5PFvSwXEyuP+Hb1MXhdKadScVFb7jJdN48EBVkABxzGrtHN4DAbpEmrf8vJ1zsGe
         xQH11GqM+G3TEPwlMF/1+FrLQst8WQagNURnF/em0sv5TNjIHBS/jDa7ueIEDA01dJ1K
         p0EYETHhZ+eGB1arEGSdfIqvU5xgqML0Ab5GeRdh7zAvApwpf9IOao6aNe2OYvyAm8yr
         IUKw==
X-Forwarded-Encrypted: i=1; AJvYcCXCSgnf/+U4lebKEMDHl9W9fqgFoT4cty5EXOdgYzVm51bXfpvHNxPZ2VWtdEe1Y3EjKDOQpKAq55dZJmwhVXiU@lists.infradead.org
X-Gm-Message-State: AOJu0YxmYAmVzclf2vf6O21r81Is/7sBkwTGkrDAWxeRAvEl6hgz3gsY
	T6mn8r4vYOoIM3L+TN33VG9LS2g/QoWVFKhEtlDmnByo1jrG4glGGZy7
X-Gm-Gg: ASbGncuOxZSZ9/te4LT0GUOS4KqWwzsqCni3ilUTJf3cpMrM6qD3tp4Xzo6xXnThHY/
	JUXe6t1tWNLrOxFdIZARwV/Q+YRmnplvhijYTd6ZG3WnIZUpOoWaNikdKMLwNFRnvnJ67Zy14C2
	hgkCYgXm/8hdFzEvmg8YD8pw1e2fRiOtWo4Du0u9E5e80AWpZa3BGKzsUbB1kNF5KkYEBQT5vus
	tkqr1JuO5IUEwW21s4QMvjtSVdo8SHQsCrQ69NMK/fDHDG40x+0YHHU2VCjG4lxwpAMJ5+fdhCY
	20T9NUBPQ+o4CBcJUxy9iQPYb2UAbaIl7/aOr5HibII7/wfoewKWi/6OdZD4jyAxzC7IsZaDCnZ
	RA+TBWGEq/DU9zA==
X-Google-Smtp-Source: AGHT+IHUfbcDjacnwEt8xR0sbjyK4vWexz7YblZ9+sKMlKZSDvvhwGsTYoHN6eAfc7JmSTETLDd2yQ==
X-Received: by 2002:a05:6402:541b:b0:60c:7018:de04 with SMTP id 4fb4d7f45d1cf-60ff38a94a5mr1951309a12.10.1751726479433;
        Sat, 05 Jul 2025 07:41:19 -0700 (PDT)
Received: from [192.168.1.129] ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb0c791bsm2787138a12.42.2025.07.05.07.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jul 2025 07:41:19 -0700 (PDT)
Message-ID: <225eb39b-958c-4e40-96be-272a8dc9ce12@gmail.com>
Date: Sat, 5 Jul 2025 17:41:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <20250610160152.1113930-5-laurentiumihalcea111@gmail.com>
 <ac1daf6b-ee06-4076-b86f-b436ca0acd6d@sirena.org.uk>
 <c3deef24-fed7-4405-9953-804bff118c11@gmail.com>
 <8ef60a13-015f-4228-b834-799592342ae6@sirena.org.uk>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <8ef60a13-015f-4228-b834-799592342ae6@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_074121_692307_09707855 
X-CRM114-Status: GOOD (  22.22  )
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



On 7/3/2025 6:25 PM, Mark Brown wrote:
> On Wed, Jul 02, 2025 at 10:54:09PM +0300, Laurentiu Mihalcea wrote:
>> On 7/2/2025 9:49 PM, Mark Brown wrote:
>>> On Tue, Jun 10, 2025 at 12:01:50PM -0400, Laurentiu Mihalcea wrote:
>>>> Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
>>>> missing 'power-domains' property. The domain needs to be powered on before
>>>> attempting to configure the security-related registers.
>>> I'm seeing failures to probe the audio devices on the i.MX8MP Verdin
>>> system in -next which seem to bisect down to this commit,  I'm seeing
>>> separate boot failures on the EVK so haven't been able to confirm the
>>> status there.  There's no obvious logging, the dt selftest shows:
>> Thanks for catching this!
>> After browsing through the provided logs it would seem like no device under the
>> AIPSTZ bus gets probed. Right now, my guess is that the AIPSTZ driver is not being
>> compiled since CONFIG_IMX_AIPSTZ might be set to 'n'.
>> Which defconfig is the CI using? Is it arch/arm64/configs/defconfig?
> This also appears to be the source of the boot issues I mentioned on the
> EVK, affecting ramdisk only boots:
>
>    https://lava.sirena.org.uk/scheduler/job/1533032
>
> as well as NFS.  The board seems to get to userspace but then not
> respond to serial input, it looks like it's hit something while loading
> modules and locked up but ICBW.

OK, this is very odd. I've tried the ramdisk boot using the files from the CI job: Image,
modules, CPIO and my own flash.bin (u-boot and ATF hashes match those shown in
the CI job) on an EVK board and so far no hang.

What I've noticed though is that the bridge does indeed not get probed. So, for now,
I think I'm going to submit a patch to enable the driver config in the defconfig so
we can get the Verdin failures out of the way.

