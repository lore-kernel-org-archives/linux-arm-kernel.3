Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7242C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 14:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NOvfAcC4nSHwovxfMmc7lJ6Xohxm7kKLQxmp9yLUv58=; b=kFWUNJ+pwyAdYXPo3RlF8rRRLu
	resRV9j5fhTDk/8a/Jk8pBNbAay/SGDzUV3uWeSONsHUomUri7tzIrJ3SMO3qt7R2dUYDhYbMqlHI
	1djhrfKSNML39wQzJAtelImKrFzFgWgEC/4ZF82cYMH1tjl33UMnOGh+/xx/2fuSxv55Fkjmy7/S2
	C4Fx7gpAtaVZMTbfNrA1ROElfO71Lwpj433Z1vSVvjsQDpWCjdoodcSz3NuMDUiloYpaKHze32ckm
	p/UoUVmHQ6GNZ0/ujkeZrvhLoqwwfLwsIv0GYgxZWT1wvFRO4MW1+wPQ9gjUZvl5zcI3S6Y9jOARb
	QCzhX01Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3FKd-0000000E5Gj-2wb1;
	Fri, 11 Apr 2025 14:26:11 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3F21-0000000E1tk-2kWh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 14:06:58 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e6167d0536so3668842a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 07:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744380415; x=1744985215; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NOvfAcC4nSHwovxfMmc7lJ6Xohxm7kKLQxmp9yLUv58=;
        b=dkSsc35oGn5Dh/e4IRdho5euPRfdkhuirqu7D9GqTbPiQ4gW6ziwFVdWqMt3VjrC5b
         gIGWFgWVD0591xBHAcYcRS5kN3xPOmXTak51tFFfzIgp80KbIozGslCu1B1rV0arPUdW
         aKEWoubIgemJbsyXPgoGQovt4IcG3W8LlLeUo1TXOAN1KA/FhxFPKacs6kQxhweBe/Qi
         wl0cSiZL60klYnFJ6pYXIxJtR2KKjFAosBWvAq4k5CcwMztYNJFhY8A8qifxOIVPyNZY
         4Zjpj0Djr8Krc542tmr+0j8OMaPJOcX2Y+Gd0e+82xdcDkkNbdHNdJQTDeWPAKKZrSj6
         agqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744380415; x=1744985215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NOvfAcC4nSHwovxfMmc7lJ6Xohxm7kKLQxmp9yLUv58=;
        b=T/jRPf9sZqaYEEjcT8Q3A/jNO/o0Elk7WT99tUNiT+L+zlGoxVlsu/5Q3H+/MjvLpv
         bL7WjFu2EA7LpkNF5PS0Sfhs1joH0EzSRlKT8jHK+SvSsBogV/apk3DTuMt+blYDudul
         MZonT+fmIj5hbeWIaUK6Nyszge5BeFe1OEIzf47NuQvZ6a2mWkkBke5u/UdruL/Zfj29
         /fKhp7DQg1tYME2dZ3XM+Wo1OMH91FVSPpAOEf8jRiYQflH09n2y2hkNbjgJbbN0Pxla
         P7ueihlNUMxO0CoMozIQ2MpYkEOxS5yvAgUmM8X9VLm9P90GZtQh/OPLZ6E5plHSHD1s
         bcKg==
X-Forwarded-Encrypted: i=1; AJvYcCUreZWFowcO9DgP1VZ1CoPtLHT2OEHTqJ8V7wpUc3rb+eCEkHynVJNvNwCVSfxGUG1fBWNrrNfPUUA0vHN2vWl2@lists.infradead.org
X-Gm-Message-State: AOJu0Yycjvq2IVHEjMQrqO72PutdDBbP19VhMCEjwWLeCz/DV2NsXXPb
	nVpBzzOO5CnxWl9LjNqGaOZ5ORqhxXz86ss/kgkk8o4uITHMMxOb
X-Gm-Gg: ASbGncvc5UT6fym2MH9/aKRNx7vOchmKPgsc2UF8m1QKk7k5kyEZSGhpY7vD54wW64N
	Gq6hDrL9GziTGIuGszOzecJ7MEA23hWo2tIecKI1k1rv+ypaa3wBwQ6g/LXWr4WIIDH5r4W6EwH
	BQQJTL/gujpk356u3XZ8Sbs6UUYOuGTVp4OKA03RfB0n9tuyjtxD0vI2PX3EfDy+qlhkAFw1Kvq
	RxMx5Nnm8cuOnOfx15ehXXBipP3+QPG7YTIXUwKAjEcpwsiF3WzFnO8X8BLZ5ZhWGhHCAGpU3SL
	nJIvrxpHYEG3nemxi/CEj7VE6uPzkE6nF7/P4537atJXJNPZkppRdiFE1DXo/715FnCp8JFr2r8
	VeVnLIGS+9g0mI5gHtA==
X-Google-Smtp-Source: AGHT+IE1yOeDj9VvnJ4cJ143MdQvjsuVm7s+alTj6cIAtIkzd0ZDaU4JF1U6ysR5rjPt1629SVONMQ==
X-Received: by 2002:a05:6402:1ecc:b0:5ec:9352:7b20 with SMTP id 4fb4d7f45d1cf-5f36ee45999mr2263715a12.0.1744380415128;
        Fri, 11 Apr 2025 07:06:55 -0700 (PDT)
Received: from ?IPV6:2001:b07:aac:705d:8db5:5583:1b6d:7bba? ([2001:b07:aac:705d:8db5:5583:1b6d:7bba])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ee54fa9sm1005741a12.1.2025.04.11.07.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 07:06:54 -0700 (PDT)
Message-ID: <2af51b9c-cde6-4347-b062-daa87bddd8ff@gmail.com>
Date: Fri, 11 Apr 2025 16:06:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] i2c: lpi2c: implement master_xfer_atomic callback
To: Carlos Song <carlos.song@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Francesco Dolcini <francesco@dolcini.it>, Aisheng Dong
 <aisheng.dong@nxp.com>, Andi Shyti <andi.shyti@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
References: <20250319145114.50771-1-francesco@dolcini.it>
 <20250411114738.GA43965@francesco-nb>
 <FRWPR04MB11150B555044300A70102DAF5E8B62@FRWPR04MB11150.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <FRWPR04MB11150B555044300A70102DAF5E8B62@FRWPR04MB11150.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_070657_698076_83179E7E 
X-CRM114-Status: GOOD (  12.22  )
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

On 11/04/2025 13:55, Carlos Song wrote:
>> On Wed, Mar 19, 2025 at 03:51:14PM +0100, Francesco Dolcini wrote:
>>> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
>>>
>>> Rework the read and write code paths in the driver to support
>>> operation in atomic contexts. To achieve this, the driver must not
>>> rely on IRQs or perform any scheduling, e.g., via a sleep or schedule
>>> routine. Even jiffies do not advance in atomic contexts, so timeouts
>>> based on them are substituted with delays.
>>>
>>> Implement atomic, sleep-free, and IRQ-less operation. This increases
>>> complexity but is necessary for atomic I2C transfers required by some
>>> hardware configurations, e.g., to trigger reboots on an external PMIC chip.
>>>
>>> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
>>> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
>>
>> Any comment on this?
> Looks good. Thank you for your work!
> Do you test it at some board? How can we test simply?

We tested it also by using the xfer_atomic for "normal" transfers
(.master_xfer = lpi2c_imx_xfer_atomic).
The driver is used to drive multiple buses with different devices.

Emanuele


