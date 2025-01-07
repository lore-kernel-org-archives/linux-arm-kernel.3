Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC52E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 05:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d7GzDGEIhCY1GK+byjPJdhkSL4A03CBJlx1sryt4hPo=; b=AwrDXf91f5lNGGSoFZ9lWhqS0f
	/is4Hq6Lya+B52P1R9JEX9+D9sjpc53etsda2tDuqK/hS23DWsGS/tV48MuCCgUIMBk0Tdp5sKRi/
	0AO3UOfpup6c1zevR9ozsn7H+X5ZlYmlXA41A5N5SsGzAG4ZwSgubzrNOiHVCC4EQ1syMUC759M+z
	y595tjIM2bSJen0/GrMDlrfAx5c0NHGxy+TQqWfGchP6Skf8Zx9ig6vbg+/vryUk7ktugrgycG503
	HBJH0ZJj6/Zol9n287cCjClBdV64dUo3IlZVF0f0jG7N4bbFqRIIouYtxRTih/LUC8Qs4lubiLFaS
	7rjzpLjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV2YG-00000003aO2-3ovr;
	Tue, 07 Jan 2025 05:54:52 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV2X1-00000003aDn-1BSj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 05:53:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1736229213;
	bh=d7GzDGEIhCY1GK+byjPJdhkSL4A03CBJlx1sryt4hPo=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=ZAd0MKTqX//BY/sdq4QR1aa6bCpL2f+2d1H7bdthMjEiGRjDZKYXAAaxkbDYkjyIt
	 t/7hbnDF1fryFVB0E0T0Oh3RYRoMdhhul9LVfkOfsuKJLJMqLWkSxGOXtjyPZX6Krs
	 QhsxZ20PtOEB9K3bgkuyWdtOtWdkReA6alRnUwCL2RzQt0NiIxsPTOdVrNC81CZ7Gh
	 cJibHg/zrrw3h+eOs+2mxqYaOe0mjzJQiLJLk4K5p7hTJONu5F6jri3yhJHag8OEPx
	 hHq74gvuPRgJaXlRFSN38Rq6j5qEdvtSvPTpdQHjlbvucGFmFjaVcB9Ymw3FyQAHfR
	 gmbsuyE3ozbMg==
Received: from [127.0.1.1] (203-173-1-122.dyn.iinet.net.au [203.173.1.122])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 33B74706BE;
	Tue,  7 Jan 2025 13:53:31 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 eajames@linux.ibm.com, jdelvare@suse.com, linux@roeck-us.net, 
 corbet@lwn.net, joel@jms.id.au, Delphine_CC_Chiu@Wiwynn.com, 
 broonie@kernel.org, peteryin.openbmc@gmail.com, noahwang.wang@outlook.com, 
 naresh.solanki@9elements.com, lukas@wunner.de, jbrunet@baylibre.com, 
 patrick.rudolph@9elements.com, gregkh@linuxfoundation.org, 
 peterz@infradead.org, pbiel7@gmail.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
 Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <20241217173537.192331-5-ninad@linux.ibm.com>
References: <20241217173537.192331-1-ninad@linux.ibm.com>
 <20241217173537.192331-5-ninad@linux.ibm.com>
Subject: Re: [PATCH v4 4/4] ARM: dts: aspeed: system1: Use crps PSU driver
Message-Id: <173622921112.97504.9310903819331925081.b4-ty@codeconstruct.com.au>
Date: Tue, 07 Jan 2025 16:23:31 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_215335_529774_02DE011B 
X-CRM114-Status: UNSURE (   6.14  )
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

On Tue, 17 Dec 2024 11:35:35 -0600, Ninad Palsule wrote:
> The system1 uses Intel common redundant (crps185) power supplies so move
> to correct new crps driver.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>


