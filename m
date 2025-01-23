Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8B9C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 09:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HkyeRQ66zp1oc6NXegGG+5zPV8GgPQJyFzgH5zMyigE=; b=PdsB7yCqNr0TAM8IYoOH9lBEX+
	7KES2TF0693hoWkIgH4q6EpNyEv62mlv2AWxhBiy3L/s/7Cyv6MmqalQrVX0o5WPUeiN6NUnWMwxZ
	1VVxVTNCowoSypYSMiGpXp+bgbaA8N7rJGn+GOOKXsUyEIrLHLfd1uqXkOqeoq0/Qx/DtMeDOkdsV
	3U0qFlbrA4ZZiAccDx6ZMNIBI10Rjsolps9dTsPC0UdtWQrh670IluRHCRRQwfFIJKqEXz/543pxk
	C8eBFiQ51aTX3wYUBHRu6HEyZWPpfl/g8LuTYs6k6qvcejsFKa8etdmfdptyH5EEXBcopgF0a0tpy
	CudxiNTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tat43-0000000C31s-3vfq;
	Thu, 23 Jan 2025 08:59:51 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tat2l-0000000C2u9-2QQ7;
	Thu, 23 Jan 2025 08:58:32 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3863703258fso1135649f8f.1;
        Thu, 23 Jan 2025 00:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737622709; x=1738227509; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkyeRQ66zp1oc6NXegGG+5zPV8GgPQJyFzgH5zMyigE=;
        b=O2qK3kLjaOiDWLPIvF6/shCaYPCF8B4WNxUZgc7+ydSqKrxdluNmMBjgjhMXXP7VAJ
         QorIBY5opV2Iq/25snV0ChYPmrYbYCOHT3evNkm41eiQ436+spnzcUiE5VdkIThnJH8p
         kDegKSLzA+yxTUQakILPC5WYdz3+HeHk99VY2ytGOtsj/DMJHkqhnDp5DrQuhgtviIiH
         LFPcAnT0NpRVEY+k48AroRFa5SS3khB862WJDd/jTYDnjxZtU5au2aXiBXnoIhuLgpDq
         Q5rRkqEMW818lEJ0spyQC626/3zRj2HDIlf9m84kuj1zcan7b/CLGoJRZbSl5tpZ6sgL
         Nbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737622709; x=1738227509;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HkyeRQ66zp1oc6NXegGG+5zPV8GgPQJyFzgH5zMyigE=;
        b=RAcMRyYtBBLQHZEL9F61gYO59QRM3LKFAMPE2vKvuqWZo8ryWfxvdZgzbk00KD52yB
         eTv4K9gzTdPAZiqztr/K+S/Wz8w52fndi8XcuVByra/RrbZGkB5RrWTWoz+0in65Y1MT
         jWAt38ljipsgdiej9PgnkcksrZw3sY66XuUbBzqJ1DKEBPygmf+tDZoslCO/nbKglcHu
         0jkJ91QdRxuGPErzhUj191DqwHgn1n5anwXrdUWqMfMuylYfY87JHjOtb1EPYIMWK3C+
         4QM2AbgQD1eB6uzeKYor4sYq/XPuhGXiZ8IASD18XGCR/cfO5lELzKbwJNCAk+WlUR5p
         L8fA==
X-Forwarded-Encrypted: i=1; AJvYcCVziGTfe+jI+Z/Q7X1GbLCYK1DcQK64QSNWEvb/vFXES89mnM/KDcVRX4ShO3PRn74By3PzdgXlJRM1@lists.infradead.org, AJvYcCX3Tyg1qSd6f96EX71eiSwF81KE6E8gTD90iineV3EpATX/3zsbIdqpq5Qodcv/Vs/UYp+9bvj3w3ndizeMrCtR@lists.infradead.org, AJvYcCXIVza168xDU9lCwmE6fIX1BnapD0Q+FZLvQJYMb/9wWrp4ODfWeG3TjU7TJieoE4FuAkkYqRbR68CO4z0=@lists.infradead.org
X-Gm-Message-State: AOJu0YynZaAJXWolm1I51aOhWgix4Ez7IeEhuCGCkaP8+rwHymj+4pmO
	OjyxQ1jqis6RmzP/AEdpASLpYBUIL91T7Xvul4GZJF1uFSGftuwMlSCN5KtS
X-Gm-Gg: ASbGnctd4kDaOCnYhIVB6aXiW1c3b7kfRuj1SzKLsI9McGeS6XbJDN8oDM8nrvrPEMh
	uA/r4duZj3LMKFz/iaZmWEFpvFTN88bRKeyJd5Mq6dkCu6tC6wBCzA/16bjQLGtMuZkTTXECSzm
	uuGw2WjTUZ1BaVRpsvLCEtv6EhBknPDN1kw7edWEjsHcOjFaw35bE8nB+KUPxtNhs6vkFnFC7pg
	lBpeaTx5uLz7tMIB26LXoAqB+IR2b4h1KbAHencr1Y4Sx2BbH5jTBG1VIo/DRKXsJflNr7QxA5f
	49c94vf3dU+COnqYI01SXpXnCNd13u+BLz+MP6GH4Q8=
X-Google-Smtp-Source: AGHT+IHc1t5fGPvcthsivd2P9fI8/r4mtQiSRE3tXH+2jfQUvFcq70i0y1FajJPpW7lEuohcXqidQg==
X-Received: by 2002:adf:f8c5:0:b0:388:c61d:4415 with SMTP id ffacd0b85a97d-38c22275647mr1806903f8f.18.1737622709399;
        Thu, 23 Jan 2025 00:58:29 -0800 (PST)
Received: from smtpclient.apple (185.174.17.62.zt.hu. [185.174.17.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322236csm18793946f8f.39.2025.01.23.00.58.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jan 2025 00:58:29 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH 05/12] clk: sunxi-ng: add CCU drivers for V853
From: =?utf-8?B?QW5kcsOhcyBTemVtesWR?= <szemzo.andras@gmail.com>
In-Reply-To: <36af1162-cd43-4045-bb43-b8bbf44f9788@quicinc.com>
Date: Thu, 23 Jan 2025 09:58:17 +0100
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <266DB665-67E8-40FA-8BE6-E7F82955BAEB@gmail.com>
References: <20250110123923.270626-1-szemzo.andras@gmail.com>
 <20250110123923.270626-6-szemzo.andras@gmail.com>
 <36af1162-cd43-4045-bb43-b8bbf44f9788@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_005831_637780_CE445B55 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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


> On 23 Jan 2025, at 00:23, Jeff Johnson <quic_jjohnson@quicinc.com> =
wrote:
>=20
> On 1/10/25 04:39, Andras Szemzo wrote:> =
+module_platform_driver(sun8i_v853_r_ccu_driver);
>> +
>> +MODULE_IMPORT_NS("SUNXI_CCU");
>> +MODULE_LICENSE("GPL");
>=20
> Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
> description is missing"), a module without a MODULE_DESCRIPTION() will
> result in a warning with make W=3D1. Please add a MODULE_DESCRIPTION()
> to avoid this warning in all of your new modules.
>=20

Thanks for pointing it out, I=E2=80=99ll add it.=

