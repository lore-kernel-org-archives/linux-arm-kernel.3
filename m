Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05D5CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 15:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4t1NPXSpsgumuAbcGzE1EyiDPKl7vf9eJ/hyZgqkMpM=; b=b+PzIAeM7mgR41sS4uO2uHs+ck
	k2jicyS7zK+iN19WRmuDgBErAfZhQ3rMtrmaSOHpH5HmI6i86yENV9s/InKWCE9zIPsypXz2jd1Pt
	QULZkp746NNOj7YjBwThg/566FRtBsUXhn3DLEn01MpysqJSvFYb/OLHSTbca3cPcIos6mXvg2HL+
	2jFOJdRlRgEgN3Q4ZuGT4NKY0tE/SHvuAaV490U3aQGBerre2pYxMVl8AxdRaeE/LI1PVZnwHHFtd
	hZ6yHqqGqWy0ol4SoDA3/+B4nMlggQQOCqWfROJNQCJBO3MvaBVKZR2MbINmvg/3fMHdUKKSeRzER
	qRLkMnQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvHMO-0000000Bgnl-1WcG;
	Sun, 07 Sep 2025 15:31:20 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvHJW-0000000BgLr-38KW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 15:28:23 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-77251d7cca6so2900525b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 08:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757258902; x=1757863702; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=4t1NPXSpsgumuAbcGzE1EyiDPKl7vf9eJ/hyZgqkMpM=;
        b=ZQLFlKyMmJWFOCCqExWu3V37U2sOzRw08DjDlVGYlk39UMg8XIRYa2vkFGXixuB1CQ
         kyH6w0AWsX22BNHQutI+4yVA6IGcjN6R1GqePSuPSNFxdy3e8TIpGrtHV0iq28Oz9aFh
         Sd7g1AMKI2ACnCaXx+HOAMJhSc/XfPS5KLbrKRilyo30Am/xLiCwBe1dmZujNfHm2DOL
         3PP2lMH2iyfzcxkywX6THSvtWxNyuk3B7N8RasXoGyj2NEqv7XTBvRAcwdZzFNQm7p+7
         /nPUUkWAbn4n89n9APJlvvev4vFR6ajo63mDcxOYKpaB7gGWVvzKhvfboHGgXIDCKHdy
         /P/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757258902; x=1757863702;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4t1NPXSpsgumuAbcGzE1EyiDPKl7vf9eJ/hyZgqkMpM=;
        b=bwYyt72IZhjzbt1abSlmsYvjqPS7rPK2h1akqJUn9xtOFDuuyhdGvx2G9E0hkPRxBp
         PxH78lqbJdBla0FZxTZLxGE70VWwkUcoB5mHh3x4NTILQEN4Dw4rCMim0ds0CowXhCSY
         hJUYeN8ifL/FA710i197CWx8RcZvcbAaVegyNp8eM77ToIv+lp0JZAnV0ioASxIB1S+7
         gAmTI59eo70nytUCGr8Lo55c4TMP9UE/VbvC4I5J7+mjCOAVPRwsRo2PiVcHNbq87QNe
         yp+ImsA0RB2lJbAu4YLvKww53EmpNMxpo2xA2tIrO7TwjRL4+7NcJyDDaGjLTGQR2pIT
         JHyw==
X-Gm-Message-State: AOJu0YzzXK680GyN/+gqccvAy5ATC9Qlb2ttd64hTADgUIZcU6fd7kgQ
	y0ij0WwxC1gqi3cxjm9v7H3hefX7jo90zqfGIW1Cq6ZSKS6Ek32OsM2E
X-Gm-Gg: ASbGncvCjmVQdi7z81RylaelscRgIi3R5AAhiBs/u/rmA+R59MutsHWf35/+egksT4f
	CNnQ0C6ufEJE+/PTQwIs9xDTb+Gs336AuPDCvtIABtEbw2sY18yNuVFT0K47aWmehH8pySvsjQK
	s1vNhxFsr5hrRHF2PMTefp0/W6mPVysF3nOLi0s5qyZKYFnfLL24Zl2zPlHzSqxfS6rrXfAaCnz
	kwKc8GAhwohCz2p8wm7aJnE3KONsSxm8mQ09jVoK57laISNpPssJ2Ar+O57jtYdnNHw232BqZ7V
	mlrlnqvIwmAwqxGUvFGD6OSQUv8HBOaMc3IL8MLpXMYrY/7ahK+Ra6p6vXUtMDSeWsam7dWTTbw
	HhHudHhfGSUNF2ggQ71yspNOg8HoSpAb6k2hJlUaUoffpkgOGRdhKIHSqpAjQ5PKn65Rr20D3K0
	5cQPHh+w==
X-Google-Smtp-Source: AGHT+IGE6MiuigF2nMYzx+KzSDUOLA3WaN9Jrarc3HfPkx+hCejQIAa0ADWq74RTvhd9q/v/3azFVQ==
X-Received: by 2002:a05:6a20:9183:b0:246:9192:2789 with SMTP id adf61e73a8af0-2534441fa83mr7672424637.49.1757258901631;
        Sun, 07 Sep 2025 08:28:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4f8a0a2851sm15985846a12.37.2025.09.07.08.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Sep 2025 08:28:21 -0700 (PDT)
Message-ID: <83189bf7-6831-4373-a352-2a3a05526e08@roeck-us.net>
Date: Sun, 7 Sep 2025 08:28:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/7] hwmon: sl28cpld: add SMARC-sAM67 support
To: Michael Walle <mwalle@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20250822131531.1366437-1-mwalle@kernel.org>
 <20250822131531.1366437-7-mwalle@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250822131531.1366437-7-mwalle@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_082822_794764_730746F3 
X-CRM114-Status: GOOD (  12.68  )
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

On 8/22/25 06:15, Michael Walle wrote:
> The on-board uC on the SMARC-sAM67 board is compatible with the older
> CPLD implementation on the SMARC-sAL28 board, but has different sensors,
> namely two voltage sensors and one temperature sensor. Add support for it.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>   drivers/hwmon/sl28cpld-hwmon.c | 76 ++++++++++++++++++++++++++++++++--

Documentation/hwmon/sl28cpld.rst would have to be updated as well.

...

>   static const struct of_device_id sl28cpld_hwmon_of_match[] = {
> -	{ .compatible = "kontron,sl28cpld-fan" },
> +	{ .compatible = "kontron,sl28cpld-fan", .data = &sl28cpld_hwmon_chip_info },
> +	{ .compatible = "kontron,sa67mcu-hwmon", .data = &sa67mcu_hwmon_chip_info },

Effectively this means that the two chips have completely different functionality.
One reports fan speeds, the other reports voltages and current.
This should be a separate driver.

Guenter


