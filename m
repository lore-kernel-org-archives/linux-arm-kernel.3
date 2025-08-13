Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B3DCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 11:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3VcXeU7Q/RhQLvXFV/p9dr4CD3d9sQhgHJ+B5N3rmuM=; b=a1Q75337dop2XLeqyQR2V/MnUQ
	Hy48mhgJjUdySzW4jY4cnbbk95Jky6G2nZlvhyXc8ZLsc/ydkjpOPUyPLZkTD5aiCEtUcmJtRR1lM
	esPBAx79Rp4wafPxTPrA72V4shknspQJyoyZ/D/e8OEle9iwAODohkTTQa6gXWwP8UTXl4rWcei0v
	1VZo1vKFIPuQVnyOMWd5xLj2tL7uJHbY2EYEWRykUqrQkwItaF8sP3l3MvK8N+dUbkimPDIz+Nx3Q
	+pZ/HiCXw1bvEvElEmbfMwd3eQ8A+fufCm+L04bI9lKiXJrp5sYkl6yxo+ybFlztDXgq/cyDacpT9
	4tciJ7VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9IL-0000000DTJk-2PQl;
	Wed, 13 Aug 2025 11:05:25 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8U6-0000000DL2K-493z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 10:13:32 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3b7825e2775so5851871f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 03:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755080009; x=1755684809; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3VcXeU7Q/RhQLvXFV/p9dr4CD3d9sQhgHJ+B5N3rmuM=;
        b=c0GP9ReAzJwzKu5UJ2GeAGs9jq+LT1nBG6/eIR7bW2GxqARn//vjWi0twNAUia723B
         O3y1LXC1VkvM3DRylCp8h6WVTCHxF/GGLO1ICyCTE5ixWYaXIFwZ4ORX5lBSlThLQ/RO
         g/ahabgsuXYHMizIRYyciHCIi2xym8K+eqOBthEB3w+LdyOlLhFaXqy3ZDV8WetUNExd
         YJSw3bkrWgKN67VqHCse1wQC/E68Jgkh9JGYjeUK9P9D7PB8oGtxpzKJFm0dIP528ksb
         0CZxYbAYGWfuFHRW1RrKOEqh8c2XGXA0QSih6p8wbqGwjzDOiYJ0QFaC9x7UuQZxfXCg
         nixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755080009; x=1755684809;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3VcXeU7Q/RhQLvXFV/p9dr4CD3d9sQhgHJ+B5N3rmuM=;
        b=dAkrNtghLnbVBAnMRpk8Dm9+cHQoN1SctCFdxYLF+N+9wYcx5OAi/OsuOQePLviDCO
         Z5HDqi3Ao6jeBmMvCkUx2khrSHFxhvcv04p4RjU6DHF4DbrkKP89YA2Ci3SQ2rzTDmbE
         weDRJMZ1V4WwAED+E2FmVkQDbx81LKGwhygUmAtk/FINFAiQYl8uwzHCf15MtfBai4Jt
         c3Lmx++vOD7ZHUbIGfxLMXaN7H+i+uIuI8pqmVnWxxDx2T/HIMPfabYzXOeGtUnQMY7J
         9oBlP3tc2gi3cbjP1ZJAcRCyR4lSd+7UHB+KKyS5ed943x79+ZVJgGmsWGpbnKjc8p2D
         D+oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAt+lM+c6PUPm4oDek/G8ogVvXRttXE0d6/bdaH3oiByx9ra3Z62+e49VCGp7CBQVMOwClKdwAU+uk2vXKPHrE@lists.infradead.org
X-Gm-Message-State: AOJu0YzVGz2c21YeMvo008h4DrJZogNCy3FG0j+FB0xrcvqrG02ImNRA
	eroPSAngByfsRAnRLIXbxQjwNDIJeVj1HiIDZYmXqGiNMRUGlvwjOUMj
X-Gm-Gg: ASbGncu8wn/j+zZ9HdcUwSlBlV1wnxyUQRmEQj8Vwuiu0SKxp3aA126KTlyyshwA6YF
	/oadpx0Kgx2Ci2GtsXfcoWtu0CHCWec90an5qTOG+KFD1ZLCrcmUpzsgk5jnjFPe5slItDEfsD0
	dmr1szqzFXz8y8YYl4dnVlWsb8H+HhRRz64ASe2dyXuwd5NEAY9zqCRJODQ2GSQ3Z6LSRt3Sikp
	RJgS5/A5eob5xRjmkV/S43xCHERiJ7KXZXHhT+a332qaRGo57Pa/sJkPvkRdHgnM2eaiH7zKIXe
	Tk9f92dZmeZdEDlDQ6qDRmi8wK23Fz0REWM3kpRv3ngxrtcdPDwY5x04d9lYhN+Ome5yaxoD/Sa
	ev3bvYsfqB1EzQt0gv/xWEbpQYlWcYAfDMvgfEeh4MEfn099m7fla0YPxc0uoFlKKokAYbk1ANQ
	==
X-Google-Smtp-Source: AGHT+IHTH7wQ/DM1riP8mGfCNOOY6mu29ZxIpOrfWgcTJfETBDY8IpnmMP++rI1zrIhW2rRbIJTrow==
X-Received: by 2002:a5d:588b:0:b0:3b8:d2e1:7889 with SMTP id ffacd0b85a97d-3b917e2d98fmr2092073f8f.12.1755080008825;
        Wed, 13 Aug 2025 03:13:28 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3abf0csm46216026f8f.14.2025.08.13.03.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 03:13:28 -0700 (PDT)
Message-ID: <4cd3efbd-4798-4f25-9440-879ee289d8ed@gmail.com>
Date: Wed, 13 Aug 2025 12:13:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: Re: [PATCH v2 0/3] i2c: pxa: fix I2C communication on Armada 3700
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Russell King
 <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Hanna Hawa <hhhawa@amazon.com>, Robert Marko <robert.marko@sartura.hr>,
 Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <aJpOyWKzBt-tDWUF@smile.fi.intel.com>
Content-Language: hu
In-Reply-To: <aJpOyWKzBt-tDWUF@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_031331_029836_8C5DC29E 
X-CRM114-Status: GOOD (  12.83  )
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

2025. 08. 11. 22:12 keltezéssel, Andy Shevchenko írta:
> On Mon, Aug 11, 2025 at 09:49:54PM +0200, Gabor Juhos wrote:
>> There is a long standing bug which causes I2C communication not to
>> work on the Armada 3700 based boards. This small series restores
>> that functionality.
>>
>> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
>> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> 
> I didn't get this SoB chain. Who is Imre here and what is his role in all this?
> 
> 

Imre reviewed the patches before publishing those, but we were unsure about that
the Reviewed-by tag can be used when it is offered privately before the
publicaton, so we decided to use the SoB tag instead.

It can be changed to the Rewieved-by tag if that is applicable in this case.

Regards,
Gabor

