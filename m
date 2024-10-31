Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B68DD6B6A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 12:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ByTCYd14UYri5hhBpfCXYZOyOvDgKqhahBNXgoUgOVc=; b=vTRMdvQOheTmitnyGAWoXRp2vi
	UxJ0fEeWtw+RTrA2WwoQon2DuoI8L35iNuJicmoukzs12odmOnWPODN8RFR1tT1Z8eHFICks3XUdl
	ShuK5iSc6d7/Zjm10Yrx+XBi1VTtB2Jc+qT4ObsSapo60j240VdbGxB5RdkC5G8M92jG8VJMEPeP9
	zV2iKMDA+QrGUVZUl9czhOoP6q18SzwDvdU5Elv7E0ZyMfD3lyqhaNxlH/4gpBEwz8W+8JOx9Or1C
	y++xejYxKKp1zNJJg+22ZDhaBcupz7kkfn9jr5sWADlj5JMAaBjyJZ+E5Eo/jx6F8zeBWiECl66Hp
	ECTCtWIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UIH-00000003Wdx-1I1h;
	Thu, 31 Oct 2024 12:28:53 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UGc-00000003WT7-3mWz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 12:27:12 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-37ed7eb07a4so679389f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 05:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730377629; x=1730982429; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ByTCYd14UYri5hhBpfCXYZOyOvDgKqhahBNXgoUgOVc=;
        b=GOug1d5h1GlbE5pBEM2DqRRA6o26gFyxzg3oPXWu91gQNF0MPnBOnZRWByFoKDP3gQ
         1HJcDWZ1Cr/ATEpN00nAfuUCTsz+h8xThbkVM3bnhEvkW1Qmrg9DJsuN1hyWGobSQE/H
         IX5RaN/RsYwR1PgH+LWsS2bKzjxTz3vUAyZPreX11e2xnTKqBcK2KMVaVYhh086mBX+l
         M3rxd/GnuO3AWXbKtFkdGSbc6cTR0pjGdJ9YV19qmk6tP9nZMEFuIy64uiaiJjZWSZjG
         bQNtm1VRM7urvgYYmBl04QpdAQ3E5qkQS4S9KyorTcvxFjoUDTAFnep8tyCsG5nnVybT
         VsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730377629; x=1730982429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ByTCYd14UYri5hhBpfCXYZOyOvDgKqhahBNXgoUgOVc=;
        b=Pql3V+e3ulPCBy4GbpwL+0D/gsYjgqNj7+8g+uDg+4HVkTpnPf7FGXYdgafX7gn6oX
         +mvLIoIqUqDyUBtk2vmYrdWmTHB+rAums6uUos2dNQTuTNtY7pkafaDU6U78IrsmVMTE
         +LMqlbfb2xSSNc0cY++nucLuYtG4b7kRQ9+7tiwopvQfNQNyU0VQXg4RnhqdLJOV61Fc
         xN67+Tyg/CCdCnw5Unt+wdt1jSZ2PX4y6PguLX2X7c/P53+uQ3auc1L9i9B+ztTy3mHt
         E1Qw2sVQgQpgLYKOKoS1yRGGhqZi9MMssNJT5CtRzPKhqUp4XvcDJpzwpkGR0PuIYOYM
         Gicg==
X-Gm-Message-State: AOJu0Yy02IORYqObOKH1CJuF5RRMr4EcL2kso1lPBN1CKh8Wu3q/hyF1
	xEwjmbta/OI3HDrWWd2E7yYpVAZDazO7gzuFfxQB9XBNsiuycDTC
X-Google-Smtp-Source: AGHT+IGNej0joknwPsbYKOTEUixvGOjU0e5Z1XjBTjKkSw6IjWk9zeeBnOp4KqqlhyMlQQW7srqsDQ==
X-Received: by 2002:a5d:5847:0:b0:37d:4e74:67f with SMTP id ffacd0b85a97d-381be907c52mr2539991f8f.37.1730377628990;
        Thu, 31 Oct 2024 05:27:08 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:d7b9:afdb:c541:d023? (2a02-8389-41cf-e200-d7b9-afdb-c541-d023.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:d7b9:afdb:c541:d023])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10eaafdsm1977568f8f.63.2024.10.31.05.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 05:27:08 -0700 (PDT)
Message-ID: <984e5b55-edf6-4f1b-910f-8064b30d1c72@gmail.com>
Date: Thu, 31 Oct 2024 13:27:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drivers: soc: atmel: use automatic cleanup for
 device_node in atmel_soc_device_init()
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241030-soc-atmel-soc-cleanup-v1-0-32b9e0773b14@gmail.com>
 <20241030-soc-atmel-soc-cleanup-v1-2-32b9e0773b14@gmail.com>
 <dfa83464-4632-45cf-a257-b9d9739d37e2@kernel.org>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <dfa83464-4632-45cf-a257-b9d9739d37e2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_052710_977300_EFE14291 
X-CRM114-Status: GOOD (  13.39  )
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

On 31/10/2024 12:07, Krzysztof Kozlowski wrote:
> On 30/10/2024 18:10, Javier Carrasco wrote:
>> Switch to a more robust approach to automatically release the node when
>> it goes out of scope, dropping the need for explicit calls to
>> of_node_put().
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
> There is never a "drivers" prefix. Especially not first (because as
> middle appears for FEW subsystems, not for SoC though).
> 

Interestingly, 10 out of 20 patches for this file use the "drivers"
prefix first, so I guess it was an error that propagated for some time.
I will stick to soc: atmel: for v2.

> 
> Best regards,
> Krzysztof
> 


