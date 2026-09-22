Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC704C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1YdFqoWebSHijCdc5KahaV/EzBXGxPmzQ4XgDu5XncA=; b=zjUGfKwWelb7w0L+3csHnJQjU1
	z7Ejohke0SdnRsrUA0KTxdfwUys/IRy7K/0QGDtuKuxm+XUiasXxIefoTjJw3h8PkpBJftjaYOH5J
	nhphTcCfugLPdzBbxPIXaL7utG/QI9oDZ3lbaAaTN7ft/Y2Hu881WroRhifMTXg+9xBQT3CYPa3KT
	PER2rXYma4x/oN3wfpKF0hR3Oe6UI0RKb4Shy72dAjOqRBxmy8CAK+LVYSBNpXYJBvM9qVqm1yse9
	Bx88BkldjWSuNo4SG9zQel17BWD6O5S1eRBnzrKiD4uVQeSq3nAQspfvrvoZ5vO2vBcDNGNRDsyk/
	2y04lhTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vlG-00000004eoj-1VsD;
	Tue, 22 Sep 2026 08:21:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vlF-00000004eob-2wC2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:21:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 761C443210
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 08:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A0E01F00893
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 08:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790065317;
	bh=1YdFqoWebSHijCdc5KahaV/EzBXGxPmzQ4XgDu5XncA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=KQ7zXqB1j1Kf2ZEWYkrHF6LB9KuvaX0ak30Bhwb/gll99KnJZrpaL2ASNa/GPoiuJ
	 7XoIMP9JRqk6LgcsOsW6OvJYk9FtIQ0ChdC5XBOZQUFHEuYY5nfdKjLifGox+85L/M
	 1Dr+e+LUh9wPpdBzvsCpwJAn9FcwSI6nucVfmnT1Y71MrgpT13FmlDTgIJJ+N06aSh
	 aezP9GBIJ1k80OC9zX1K4muzUcd61JwAU6aESh4FwwtJsoUR6PTTM5ZmsM4xo2Wk3T
	 01AQjOJnlPCVdRsnFJzGHRePubrXKoGSXk2wpxiba8Btqt332SzgGDvzOiM6iWixJt
	 HkyHew/0/Q2dw==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5b2864f1cso33325781fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 01:21:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzdAC7U5keu+p+SYAo2iqPIoZBwSd3pRwOzBBd+jrQ2YvQEPC7vTIybbPswgDVXG0UhEucPJEd/ooW9SH+d1G1q@lists.infradead.org
X-Gm-Message-State: AFuF++m+D72k5bK5im2lXMiQOTfAQt5coIKfy9kbXzbUUoj2XvU6Hmwj
	oWcWLHbpGUmnih3IAyozgmPHB39bqJw5qOfxdwv3OCe8m4/kMvt44GM8U8FOpfr5cu1wgH4ZBhj
	3xWEVDv7S5vSOLOkXPpU2i+VcHc8zXA7q1wPVEGJs5w==
X-Received: by 2002:a2e:a99d:0:b0:3a3:7682:499e with SMTP id
 38308e7fff4ca-3a5fc0a7d91mr32468651fa.19.1790065315994; Tue, 22 Sep 2026
 01:21:55 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 01:21:54 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 01:21:54 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <71cba843-1643-4f5e-9830-9e60b5f1c334@gmail.com>
MIME-Version: 1.0
References: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
 <20260921-qce-fix-self-tests-v8-10-107537869a72@oss.qualcomm.com> <71cba843-1643-4f5e-9830-9e60b5f1c334@gmail.com>
Date: Tue, 22 Sep 2026 01:21:54 -0700
X-Gmail-Original-Message-ID: <CAMRc=MesPvie19NcaWmG6hM4zcT830JC2i9yWF6KmhqLHxyPCw@mail.gmail.com>
X-Gm-Features: AcwNN1XHY68dvq7BbAnO76WN0R6Z1v7gC4G6geUb4OdqJjOqUYaJ5RfbVzMrXq8
Message-ID: <CAMRc=MesPvie19NcaWmG6hM4zcT830JC2i9yWF6KmhqLHxyPCw@mail.gmail.com>
Subject: Re: [PATCH v8 10/14] Revert "crypto: qce - Mark QCE as BROKEN"
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Stanimir Varbanov <svarbanov@mm-sol.com>, 
	Eneas U de Queiroz <cotequeiroz@gmail.com>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Eric Biggers <ebiggers@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Abel Vesa <abelvesa@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 22 Sep 2026 07:42:28 +0200, Demi Marie Obenour
<demiobenour@gmail.com> said:
> On 9/21/26 08:58, Bartosz Golaszewski wrote:
>>
>>  config CRYPTO_DEV_QCE
>> -	tristate "Qualcomm crypto engine accelerator"
>> -	depends on (BROKEN && ARCH_QCOM) || COMPILE_TEST
>> +	tristate "Qualcomm crypto engine offloader"
>> +	depends on ARCH_QCOM || COMPILE_TEST
>>  	depends on HAS_IOMEM
>>  	help
>> -	  This driver supports Qualcomm crypto engine accelerator
>> -	  hardware. To compile this driver as a module, choose M here. The
>> -	  module will be called qcrypto.
>> +	  This driver supports Qualcomm crypto engine offloader hardware. To
>> +	  compile this driver as a module, choose M here. The module will be
>> +	  called qcrypto.
>>
>> -	  This driver does not have exclusive access to the
>> -	  hardware, causing races with the secure world.  It
>> -	  is also slower than the CPU.
>> +	  NOTE: This driver does not have exclusive access to the hardware,
>> +	  causing races with the secure world. It is also *slower* than the
>> +	  CPU for the same algorithms. Use at your own risk!
>
> Would it make sense to clarify that this is only an issue if you pass
> do_register_algos=1?  With do_register_algos=0 (the default), the
> driver is perfectly safe (unless you made a mistake elsewhere) and
> saves power, so most people want it on.
>
> Also, if I understand your previous messages correctly, Linux currently
> doesn't use any of the features that would cause the races with the
> secure world.
>

Yeah, I guess it makes sense. Sashiko still says the series fails to apply, so
I need to see with Herbert if he wants me to resend or if the change you're
requesting should be a follow-up.

Bart

