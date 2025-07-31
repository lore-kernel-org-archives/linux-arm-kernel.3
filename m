Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FD0C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 10:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fdd8rVwrOI/ftl2mALt/laddxSDrHqp2Ly2OA1Dp8PM=; b=c6XTtn+9TEzTHnO3nrGdb7COrP
	kyhSU6leekzAPywUyNOTbhl2PtbwBgYBd75agc4eZJ2oqWtOScqBhvPvXLn+KhgTD1b3+KYE15a0G
	NifMWdZYyVnJOyzRzKVlTxn54m1dBR/EVGy5eHLzQBPNfWXpJHTqmmiDka9lDiSYe1Opxivg2gfLg
	E4QatyESCxejlUyS3S322Qt4+blEZYBiCgEul6/bccFvYrCJUJmMJRl1Fu1kATFEwVBra4ClJD+wO
	73uevSWmjRaTz6FAUZvykRZ+AumWShNlX5ZIuiHSxBq67al8ixOUxfBjdQdnVz3jkvim2W0UewxEb
	VwHhjQRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhQWC-00000003Mrk-2cji;
	Thu, 31 Jul 2025 10:28:12 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhQTZ-00000003MY6-18CI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 10:25:30 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45892deb25bso2139615e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 03:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753957528; x=1754562328; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Fdd8rVwrOI/ftl2mALt/laddxSDrHqp2Ly2OA1Dp8PM=;
        b=L57G81Vfl94yFl7ExbSMVOwe+yQzT5hq4OP4RQWnuOrMJy9IJBWqgGjtavnjtULvkC
         I4dbP9ZjcRT4EDk0kxezRZ0Ms1CDxqMqju65UfZ5hB4g7Irh5V5rXYWke+tUETBwKOqa
         kuAMHAC8My1BcU+rbM+f4KPkwXpGouADhVM8lzQLucQJWakBZSYR2Nb9Xvv3hXEwVX/R
         lAJ+i/PpPAbqcA8MvvJipVPPW4+SiqYEMvEbmwh3BCmmmh3kbzei9xezRDSB0uB3kuYV
         iVy/iNC82ZxwBGnHdmmP4mEBweCJ1U7WG6DPuA37mOfiPhU29fdBAQfW9HKrUNtwtsvn
         QiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753957528; x=1754562328;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fdd8rVwrOI/ftl2mALt/laddxSDrHqp2Ly2OA1Dp8PM=;
        b=YTXBgLebY9BQlcw96jRQDJDKXnmS7p0FXZ/6uaGP5fofcBq3VqnMqHjlsXiVtiHqk9
         Xc/guzttDyc+O9zEDACZzHPmyEqGHwKu+ItqMczzDyq6SZkEMKDwrwbgN0r1ctwWRGFr
         FPJHEDmvRhHn3g2bJy4EjV/3P2msyk6yAv4g0aAB1IZ2WXutmXC4uFie7c3ewZjlDODS
         xEzCXm1SICU0k6VXgXPkaW8GZuKkAA4SlkCaUAIZfY5EIIJ5uomWR55lW7JnFLawJYk/
         iPtyDItXEfRLza0FXTE4zbBeRLJWs0g7QZOdEFKB37O/+3PYSITxP1F/0FWoKsFmoHJN
         BJFw==
X-Forwarded-Encrypted: i=1; AJvYcCV65uBgdMb6+9Pvq1Q6qLMCUye8FOtjENwW6khI9bvRH/s+EeoqML8VrwyghgRT0Gj7dAHp2IQPDqvlEuJdefPM@lists.infradead.org
X-Gm-Message-State: AOJu0YzULr3XJRh8OnUD7XJ/AFuN0tgNjIoKWMQvikwVyUHUuZbZKzTX
	6DFpfL4EHhcZovo2EDsZwAY2djpq7w4Gdx1+u8wTE1ryr1cCkvm/RFsNnAsuyJjV6Uo=
X-Gm-Gg: ASbGncsJT+lKJ4vp2HyohMHdfME8jsryju+Se9ah1WNV6eLFfkMstYEGbDlpZXXcv5J
	qd860JI33Q8p3fo9VxizJQA7WSIfKF8Yh78/p0wMV6d6MJ5Ijb6fT0mfY3k+oPrNukefkYMQn32
	WBqryHI89VwgPQi1UFrY5bBiQ8cmOYkBK7qZoGpLFCYsNlfP6ANezDkmE8LVRdYIGHxUdn4IWz9
	LG7Mbg3WQjf+ZpMzEKYh0vuNrcNCKBxC2jY0QOpqdFsZoahT4w2AxEFHlrl6wpsIly/V7cyXWRt
	0nzlQvjFn8vHvgujsJwRXv6WaxJbZGZ1X7WScV3LlsoHSj6ZJ0RvjLy9cy840h+RMaOMUwOTzcE
	pJEE8kbYRBa24XX+Atzh8iL8R2w==
X-Google-Smtp-Source: AGHT+IHhqyP93G+ZH0mqfHoo6oZhMJUnlWvEtPn99Mobxr9hcWgTGsVHemxeWgkdcIjD6PVicJSyoA==
X-Received: by 2002:a05:600c:1f92:b0:456:207e:fd86 with SMTP id 5b1f17b1804b1-45892b931ccmr73450555e9.2.1753957527737;
        Thu, 31 Jul 2025 03:25:27 -0700 (PDT)
Received: from [10.1.1.59] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4a2f03sm1888068f8f.72.2025.07.31.03.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 03:25:27 -0700 (PDT)
Message-ID: <afa34f49d502d7f921818141979167920b8d924a.camel@linaro.org>
Subject: Re: [PATCH v13 07/10] firmware: psci: Implement vendor-specific
 resets as reboot-mode
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, Bartosz
 Golaszewski	 <bartosz.golaszewski@linaro.org>, Bjorn Andersson
 <andersson@kernel.org>,  Sebastian Reichel	 <sre@kernel.org>, Rob Herring
 <robh@kernel.org>, Sudeep Holla	 <sudeep.holla@arm.com>, Souvik Chakravarty
 <Souvik.Chakravarty@arm.com>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Yan	 <andy.yan@rock-chips.com>,
 Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio
 <konradybcio@kernel.org>, 	cros-qcom-dts-watchers@chromium.org, Vinod Koul
 <vkoul@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Florian Fainelli	 <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Mukesh Ojha
	 <mukesh.ojha@oss.qualcomm.com>, Stephen Boyd <swboyd@chromium.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, Elliot Berman <quic_eberman@quicinc.com>, 
 Srinivas Kandagatla
	 <srini@kernel.org>
Date: Thu, 31 Jul 2025 11:25:25 +0100
In-Reply-To: <473f7269-3852-64a0-8aa6-7299be0fc85f@oss.qualcomm.com>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
	 <20250727-arm-psci-system_reset2-vendor-reboots-v13-7-6b8d23315898@oss.qualcomm.com>
	 <b45b157593f1865a402f4098cdeafc298a294c6d.camel@linaro.org>
	 <b92c164f-c6df-a2c0-1416-67652a01b179@oss.qualcomm.com>
	 <34c52c88fd8fcbf68c453c1e94e4cd6294becff1.camel@linaro.org>
	 <473f7269-3852-64a0-8aa6-7299be0fc85f@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_032529_316800_F523CBA8 
X-CRM114-Status: GOOD (  14.13  )
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

On Thu, 2025-07-31 at 11:05 +0530, Shivendra Pratap wrote:
>=20
>=20
> On 7/30/2025 8:53 PM, Andr=C3=A9 Draszik wrote:
> > More importantly, if e.g. an OOPS / panic happens after the reboot
> > notifier has run (and set vendor_reset.valid because a reboot mode
> > was requested),=C2=A0a panic handler changing reboot_mode to warm to
> > retain RAM contents will have no effect, because the the original
> > code above making those distinctions can not be reached anymore.
> >=20
> > Above scenario with OOPS / panic after reboot notifier could e.g.
> > happen as part of device_shutdown() - see kernel_shutdown_prepare()
>=20
> We can handle the panic path by adding a panic_notifier in psci
> and make vendor_reset.valid =3D false. Do you think adding this can clear
> the panic scenario above or there can still be some leak?

I think that would work. You then can't convey the reboot command, but
at that stage (panic/oops) it probably doesn't matter anymore, it only
cares about the crash handling which probably is enough.

Cheers,
Andre'

