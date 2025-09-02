Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C53CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dE+y6IouNTFh5LnCQS36Be2cwV132cRumEEcY15HKHQ=; b=Jm8D7o6o9Sw1NVmSFQ6JelOdjh
	wn02m/979ZR7kWrqnopJBOm6CbkNCe7py4d2863/vZcay4tcNkm1KKXXsJJMCYQ168C52x9wLHqpc
	7Eo4bBCZKUQbYFJcGd2nPVfWWqP2wh9EhDtlxQnkUh629f8uhGDE0q/YM9DgwinEIVNvl92G1ZRQs
	WTsAr32lOs21dOO/HBbmEraHOE96hG0D7cUrm/3pthlhR0H51KnPqGzpH1/O6k2Vl1llTXvT2Vpe8
	+EzjVzH3Jqz6BVxT9NuW7se79LdVvyGA5zHteozOs1ZlEfXG9xMJf4/3CtjZ0F/cWHqfVXi8/T5ut
	8FkxZPyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYm1-00000002ATk-3Iz1;
	Tue, 02 Sep 2025 21:42:41 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utRJ8-000000008JS-2Omr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 13:44:23 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-55f7cd8ec2cso2237460e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 06:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756820661; x=1757425461; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dE+y6IouNTFh5LnCQS36Be2cwV132cRumEEcY15HKHQ=;
        b=ym5GsOtnZBLAvK+xaEbThX+fBmntLvOmmxvb8k40RWiRkAV1CSDIfyleWHJUCwyImc
         1hH2L2FswUFvYJ/VkLd2T++YoJqJYnBfUncixgbWBTmSoMXwXncb4RO2/XD99ZeD+TOF
         puk2n5D/TWviIUnnjSNMHyLooDQfXZGXx061wIgOCIzvRkcpZL3T6WxDsVVbfJeZUzjx
         07oNAmge0AzDWoDPxWIp+W76v92WyW/xZnmAFaWzFENP2qnTETuE+oU4cGkrhiWCwA2A
         CQD59uXxt/w0HB8bjWW99DZaW9/PSKCqrIYmkdYyRijdE/kko6nuKdKJzixzu0dgvruo
         HlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756820661; x=1757425461;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dE+y6IouNTFh5LnCQS36Be2cwV132cRumEEcY15HKHQ=;
        b=IN45WyNziRg8mJIzzBm8kOJ5XtK1QSyIHFeSeiejC74J/nxzJPVMjeAy/Stj21gpPN
         qSpH8KM+lDdBVrKq7u7k676isEJRNxlJR/G/SRSH5dZzp16/l+SiQ5ku+fuiWl2ZG81J
         r4hN8ybeVKmiCleenFi7dOwuyArDvWGLeBrcjYfE80IQxUIMtjJMGVbxfgOfcQq3AOP9
         COdlnySj2oKt2oE08gnWCNsCoohJtKc/e/ktc/U66jKwg2c8wbI+g1xiJPkmZ2aEi2oo
         VRbCoWEKmkKeBG9MGi/BbX0O+uhSK6NJZWeljcGpZDdFWBSvCfnv/YHmySRfj/mkcT6Q
         /5uA==
X-Forwarded-Encrypted: i=1; AJvYcCVUBeaASOFbebbMrQbfovKbWSnc+ojS+GEuH9Ih0huleHhpjAlx4mXMxb8xark9x36tLdCplsvYrXk6JkI4dviU@lists.infradead.org
X-Gm-Message-State: AOJu0Yzxwh0dE2mIO/AbBa4I1FEHTTMX3Gxn2RPACh11fRKP1Rk7QdMC
	I4D14/DIkUPOXxlyvsYsALwBmK0qFgskhs/qxJbo8buSHGj+vnD25/z2PyFHi70pMX4Lt3Os/Fn
	ISRBH6eaWuOXfuoJG03sKlFhW9xWwO0FdZIpe/ev30A==
X-Gm-Gg: ASbGncu7u6c9SLOKn75dg7GCB+YDKOy1kNDtYJ9m3SwneFln4azoJaxSI84wSgwIPSs
	ZNhAqsB+KiaCpsnC5gukURb5Ly6xe55Jpv5fEzjngUv9sBXvAGgB7XyA7tL9LD1eE5eZ0olLpBY
	U5AT0yE3w3QR2WKPp+BZtQqc2Sg6IZabQ9TnfnrYF1S/Wr3v/O5vp48c8Auiw06DfAsNaDTtiwv
	L9sn7f4D+X8J2ZAe85krrUAWMtZ8bKN6efvqNs=
X-Google-Smtp-Source: AGHT+IFjWoO0id3PcP1NXpHfcbubOLclGZa+2gjsa6UEJt7qXSImOMZixhyJgYfyt1Hb98CHs/tfLZNBHaEkOWQql88=
X-Received: by 2002:a05:6512:3d10:b0:55f:4bf6:eff1 with SMTP id
 2adb3069b0e04-55f709482f9mr3675040e87.39.1756820659308; Tue, 02 Sep 2025
 06:44:19 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Sep 2025 09:44:17 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Sep 2025 09:44:17 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <c5788504a473625faeb9f99b08d3bca5e7135120.1756727747.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
References: <cover.1756727747.git.christophe.leroy@csgroup.eu> <c5788504a473625faeb9f99b08d3bca5e7135120.1756727747.git.christophe.leroy@csgroup.eu>
Date: Tue, 2 Sep 2025 09:44:17 -0400
X-Gm-Features: Ac12FXy_COZhtMDYkikD9QbVVClX9tOwpv2fAavRIrHRKcbOHQym28lIfpzYJKk
Message-ID: <CAMRc=MfwNr+B-gxkN4ApGX5-k-0=aH=03Aw==WHVSYydy+iHkg@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] soc: fsl: qe: Drop legacy-of-mm-gpiochip.h header
 from GPIO driver
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, Qiang Zhao <qiang.zhao@nxp.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_064422_610186_865307D2 
X-CRM114-Status: GOOD (  12.00  )
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

On Mon, 1 Sep 2025 14:05:10 +0200, Christophe Leroy
<christophe.leroy@csgroup.eu> said:
> Remove legacy-of-mm-gpiochip.h header file. The above mentioned
> file provides an OF API that's deprecated. There is no agnostic
> alternatives to it and we have to open code the logic which was
> hidden behind of_mm_gpiochip_add_data(). Note, most of the GPIO
> drivers are using their own labeling schemas and resource retrieval
> that only a few may gain of the code deduplication, so whenever
> alternative is appear we can move drivers again to use that one.
>
> As a side effect this change fixes a potential memory leak on
> an error path, if of_mm_gpiochip_add_data() fails.
>
> [Text copied from commit 34064c8267a6 ("powerpc/8xx: Drop
> legacy-of-mm-gpiochip.h header")]
>
> Suggested-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

