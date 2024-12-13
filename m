Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEDCE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 05:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nD0sOR12WYgd7zNnRDb+Fa3B5asY+3ux+m3WDu2HAKk=; b=rfpOvrn3ONr0SU/FM5c5WrWiUT
	08K9BhbPh88MvThH1xib2S20K537hMmjdskN6kvXiXuh3l00KIGaoOpqCoYiCp+CHLZ/HIgP2nPqo
	UWhEvnkSIX3cudwL40e9vmf01wWZsIz45klCCDvz3Z0p9rqyPaE4bfrp9kFRbqCHAb3opgoxnknye
	7/2bHkC+7ZS9WiHZHkfYmGivoJZXa4q899q3WI6UxOBD8h+YGEhhIlUJtQzXIIqLY3eibnttRCLsf
	CoplsZUo8nTjWiAjFiU2M4j6sgRv3Sfnscwu79LqGJ1EOdDNVsMlli2SWaB77/J/vfLh5AULL+nR8
	K4XwHesw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyHy-00000002mMp-1hLu;
	Fri, 13 Dec 2024 05:32:34 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyE3-00000002lkG-3T8v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 05:28:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1734067709;
	bh=nD0sOR12WYgd7zNnRDb+Fa3B5asY+3ux+m3WDu2HAKk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RABT6iUrzTl2BIniPxxi7HRX7TTQnO84EHOkzY2A7mKbGGFTfQHSgCTIem2/ICF0j
	 yVg1PPKG6vT2exDF5kAmrG0/VYhN7Gku0+eRGLfaUJeNd+w4idR+8EXV9hoiWfruGc
	 egThsSDasfF1WM0WmcK6Bfksn7cR/g8Vnxg0T5G+F1Ir5Cuy1WL1XqWlZ4BYsAVMWK
	 XbySBkGWrgD8nj+qk/uaSIF9UhQKjWujaIs6mq6if0TFVzrKo4Rc+ZJI9U0TIPYUu1
	 hTK/XW3J0ywWiRrq31OCrG2tyu4GmIVQwNdnSMgOMJzf3PHgsl7Qwydzzjdbn6jn3k
	 aTkWJNrEmUpbg==
Received: from [127.0.1.1] (203-173-6-153.dyn.iinet.net.au [203.173.6.153])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D83736E54C;
	Fri, 13 Dec 2024 13:28:28 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, patrick@stwcx.xyz, amithash@meta.com, 
 Yang Chen <yangchen.openbmc@gmail.com>
Cc: Jerry.Lin@quantatw.com, yang.chen@quantatw.com
In-Reply-To: <20241212133226.342937-1-yangchen.openbmc@gmail.com>
References: <20241212133226.342937-1-yangchen.openbmc@gmail.com>
Subject: Re: [PATCH v1 0/4] Revise Meta (Facebook) Minerva BMC
Message-Id: <173406770843.422541.3788323988670647121.b4-ty@codeconstruct.com.au>
Date: Fri, 13 Dec 2024 15:58:28 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_212832_096740_22BFE6B1 
X-CRM114-Status: UNSURE (   6.49  )
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

On Thu, 12 Dec 2024 21:32:22 +0800, Yang Chen wrote:
> Revise the linux device tree entry related to Meta (Facebook) Minerva
> specific devices connected to BMC (AST2600) SoC.
> 
> Base on:
> https://lore.kernel.org/all/172722509817.374662.7338401100529556748.b4-ty@codeconstruct.com.au/
> 
> Yang Chen (4):
>   ARM: dts: aspeed: minerva: add i/o expanders on bus 0
>   ARM: dts: aspeed: minerva: add i/o expanders on each FCB
>   ARM: dts: aspeed: minerva: add bmc ready led setting
>   ARM: dts: aspeed: minerva: add second source RTC
> 
> [...]

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>


