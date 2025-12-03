Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC019D1BDE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 21:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6chODghEB4z80xHdOkemzEluE/IBI6XrITBvqfM7dE=; b=rkQ/Nk93U98PjI0QCo6BgGpqTn
	gtcB3ijT4tti3Orn9RAyd3Sfye06dZ1WU8oYt2+O8XaPfynI+NNKL30KfG9EEo8eHpPGxCeh5MZRJ
	0Czx61RRlGF+bW78aESeG28h7cJWO/Y0CuoHpc0lGcN13PTkniQTQeCq4LUBqAc8KSbJHRegbmkf+
	c6479r1++jB8sUvhO8NoFQVgFEpRERD3C3S+TWNFiLNelKJzgr+1lJmD6YsscURWrAYhCKUjQs99A
	5bpH1+opZ+qqgZjsR8iZ6OKJFUIlQa4m0wiD4dvRxWbvh8unZt8MPCFOl8N++s7YdKs3sKqKBzMmR
	G0GZ2+KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQukU-00000007BhF-2xHD;
	Wed, 03 Dec 2025 21:50:58 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQukS-00000007Bgu-0BcA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 21:50:57 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-11beb0a7bd6so1698561c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 13:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764798655; x=1765403455; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o6chODghEB4z80xHdOkemzEluE/IBI6XrITBvqfM7dE=;
        b=DLbrC9MChiO0EAsgyzVXZ7Gq7PVEDaG+iHHtGskhxjF6fxP8SMiIgJNOZQtpSiPPc3
         S3+ItRbBPYcTWMnarPVAqyYOWg9ODAQ/zUsNzN7OJa1h6a9v8oj9SmheBtdVKUWx4j0c
         Rjw8RxxyjeZT+mfaL4f37KZFJBnnNCgMQvqms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764798655; x=1765403455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6chODghEB4z80xHdOkemzEluE/IBI6XrITBvqfM7dE=;
        b=bq0aNdQUqt3pQ8jxnl3mGSW4ayiuyitFESp55qJvHs621yc5oTG1Mp9P4U/o7TVD9K
         k24qXfsTq+P1MvvwZpA0ndIrpjIfRr72EtSWAR/B40aiko1wkajc2nSOdqEz5tgrkuv3
         v13BzhdkDpGoEmc8hKtMfL7gg7ErtcGwe3ua79G8Wb6WicEaSYWyUh220BHznt2Q3J7F
         7aT40z95ke04I4zFI/73+0pnmoEzwoUq/KEUiCirV38JNkk67QYdrpmJOkUGPeeGY1m+
         vfAzdfoTqA+tc6/OtOZ7MKJ1Zl0nJgZi27Jw6iks+YUudXmq74wx34qMXMx3k1bkxjZ8
         YQPg==
X-Forwarded-Encrypted: i=1; AJvYcCUko4Si2DJNe8c1ILsuHIlKzXl1c7J2KvVwBYhGQMNvTiHhx/Lh/y4QEmrL1N+PcU3Eu+ls6bh19EzjANezNnLZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwwSoEVpeKTkWO7KKonro1wU9YWLlZoZBLKbNA7SUs5OnaB6QqZ
	NP9KlcMxjqy0hprX9NcQmct3j6UAjtSw4iMoUhuRfJwLt/73b5TMXezIFhRyu/YPAQ==
X-Gm-Gg: ASbGncvFQsV0ZAZ+y/IH0MD/vwyqhVJEnPoRv1XM8Yh3KFxHvHHHS67gWCYxiAlKG13
	tRMQxyTP4EyPzD1udNX4vnYi/Q6hNBSut+wOW/T4OiB2GI5Yx/D+rVMyceLeGmG966nf43prp34
	iaF+7l9bwAoBf9NbcH6Mp8rzFW4z2OT+9a0F7aQrrs0OaSg5rKjzJX6+B+je1unfM1iWfAHK9ht
	ERC1go2DaqtXvMNxi+rF9nlitZtfO1UiVtgPvO/ooqrN4LwKuX4t3f1hcewztRvqVhsiUe/khRh
	dTUhSORUTlO/3GQJ45JpxbA01hpga3ZkpyHqRKZV/vMaog4OIlVQQTDVJAr7ccQhI5YyPqfLFIc
	cYjGF9uy84T1Zy3dq7dbnPioWuCjP8tK6QtrGITwkMCyqR6s6hHcKikA+sXJdeSw3XY/4HYbdc+
	E8oPnz9g3TR8m52ygw0q6N9AetCsMmxUp9+nG9tAzXkzb5bN/OHg==
X-Google-Smtp-Source: AGHT+IEIEIBW08OkV8WK/jMyO0yClG6Glkh0kZ5O3uJlxkndo5BOSqM+ZQ1/IXiO+9a7SW6sezHK1A==
X-Received: by 2002:a05:7301:60e:b0:2a4:3593:cca7 with SMTP id 5a478bee46e88-2aba3394a44mr820588eec.4.1764798655218;
        Wed, 03 Dec 2025 13:50:55 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:e953:f750:77d0:7f01])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2a965ae9d06sm69699431eec.4.2025.12.03.13.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 13:50:54 -0800 (PST)
Date: Wed, 3 Dec 2025 13:50:52 -0800
From: Brian Norris <briannorris@chromium.org>
To: Karel Balej <balejk@matfyz.cz>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Ulf Hansson <ulf.hansson@linaro.org>, Frank Li <Frank.Li@nxp.com>,
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org, Jeff Chen <jeff.chen_1@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [DONOTAPPLY RFC PATCH v2 1/4] dt-bindings: mwifiex: document use
 with the SD8777 chipset
Message-ID: <aTCwvFBE6IF6WT1d@google.com>
References: <20251026182602.26464-1-balejk@matfyz.cz>
 <20251026182602.26464-2-balejk@matfyz.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026182602.26464-2-balejk@matfyz.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_135056_089450_1B009999 
X-CRM114-Status: GOOD (  16.91  )
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

On Sun, Oct 26, 2025 at 07:20:38PM +0100, Karel Balej wrote:
> Document the corresponding compatible string for the use of this driver
> with the Marvell SD8777 wireless chipset.

Device tree bindings aren't supposed to be about "drivers". This can
just be:

  Document the compatible string for the Marvell SD8777 wireless chipset.

On the bright side, it's totally legit to describe HW bindings even if
there isn't driver support yet. So:

Acked-by: Brian Norris <briannorris@chromium.org>

> Signed-off-by: Karel Balej <balejk@matfyz.cz>
> ---
>  .../devicetree/bindings/net/wireless/marvell,sd8787.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml b/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml
> index 930b700b73d0..d31ff38f57d1 100644
> --- a/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml
> @@ -18,6 +18,7 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - marvell,sd8777
>        - marvell,sd8787
>        - marvell,sd8897
>        - marvell,sd8978
> -- 
> 2.51.1
> 

