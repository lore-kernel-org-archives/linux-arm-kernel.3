Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94EACA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nc/vcmy+EaSL+RZZSsVeBJ6JjsLMgp1Qvyb0IgIZr+8=; b=Hy129VxBm7pjWMaG4tU3jfd81S
	OCO1P6UY5iBs0lMypmq2mm9YnAe4okKa58fCt8n9V7S65SkS46+q9WdifZ0M/BMWCxBN4lIeQuu+o
	y1n+n0GsVDPp7zSlyaf0carrjOIsa5ZYuKaua9HwdR2nvGbt9vsCgxOKXbWe7RXenE+zT9ZIXV4as
	udBOTS+CEKz0VSliRobPc+0ZhiFEhMCmWeqptjkUbLHejxiM6KRnNTG0REDXTndUQ80zA3K0YgNqO
	DFsfIH5C093YEAI4Tk9pajd+N3ry74hPPJ00wc4mRBSO3Zsb+2IROifP3u7oPkdGTQrxH8qYc/P5s
	RzSxef8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsBM-00000004oQZ-1mwl;
	Tue, 09 Sep 2025 06:50:24 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvh0m-00000001iHK-3YU6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 18:54:46 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4b5d6ce4ed7so955601cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 11:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757357684; x=1757962484; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Nc/vcmy+EaSL+RZZSsVeBJ6JjsLMgp1Qvyb0IgIZr+8=;
        b=yrtcDuH5n4FAmOkfyc5IEug2CObLtdGzO2dQLnz9OaZZ7vwW7vnx7XLhnXiXS8qNe2
         /OHxazQahCrUBes1IJSOosPdlfFf5Fxjpt3kHSuZdKMVvruJFYMhfDKCyjrUpOCuT2MQ
         57h4wGNZnsKlsg3oGmPACFGvVvcAbs63GPL+jixo0gvPfA7T10LEEomkVZB0cpatgnYn
         VpMAKqyihz9qUsp20oDSDd3cjHRzrSAqH4DGL3E6gb+GlbG5VhtBLUdW8P/RPevz/L6I
         neETc6u9rZq4VOOYreiBjNjI4QbmYQxmZamV83gZ7XoTRF3VpV0lVgosDQwRup3eJXIZ
         zjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757357684; x=1757962484;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nc/vcmy+EaSL+RZZSsVeBJ6JjsLMgp1Qvyb0IgIZr+8=;
        b=VwxMg3Sc6/sTlzwyQOAL/ghkW6VwKyE0ZZyGdWtpVH53+ajNHPKnGKBGc/cYdeUeCi
         oeOjjTdSR2OZ6ro+6gpHVc1LimJ92rCXtTkjWVVTRm63e1jWveaGl4AZcVh2NUfflKQ/
         KZarAznU9j0/iykCjjZGnds5xUC9ihUs4EwjrojkNsj04dhzBosvjDUgD9AYnEZEgfVf
         kk+FR975fe/yOYdaxt4bsbqR6LJIJeP+G3hBbAseNkFhogGHaA5US3/EcjPZ0KDMmNe9
         1+4Y8YwKU2WMi3i9RX2W9XPQ5vixEsZ5mR/LrLacJF8TbKVjHjalrmT2HHCK3v7HoMjT
         6Pfw==
X-Forwarded-Encrypted: i=1; AJvYcCVW83jLaak5YUIJPRADvIdBHFFAYoFOJgEeO80YeKh5jUWvHVVNkYBQJJhqynSnk7zX7LTyfrIB5u9k8l/S05PM@lists.infradead.org
X-Gm-Message-State: AOJu0YzfEaVi1Pg46P32ebC+KR4WqUbmVFm+CVajNxunaPniJYI+a5nO
	r5HwY6grl4/HEOofI1RLuqXnXvF1N8AJ47hdEWDg4zPrRu3NyXqoh3XWLYffJAO56NW45fRA1H/
	Yob6uxdNHmbO7xej/mxHk1/OlfiDMWvwFWrFGzhzUGwwck1TBq0L7V7HH
X-Gm-Gg: ASbGncuvFUASUE7WPdxcsREAvvIOhKlomK+XQmjuxo4N/JRHf+2g8j8IttGpNPD8D+c
	SPSDQbYjWV/9DokkbJ8p28dUz2Rwqe+3XrDqSbxREhuqyLdYNtg46TyFw8EGVtYAFfvYXATzbfZ
	tZiJV0KXhse+OuP+a30ViHnuDG3Rta39KMdNpXj0JP7329aQk3sviNdfINKqFKUZjmuWOWv3mR3
	V9xyIXUo2ezE7AjKbDWNnGOeLjfoczz41wY
X-Google-Smtp-Source: AGHT+IHxJBSO7w5Xmh8kn2r/iMDjRfetjUilgPPiP9j+i2xhVrg37GnxGDxWNGuAz/flz/3JXZQ6OFIXSnc5YcieRWI=
X-Received: by 2002:ac8:59c9:0:b0:4b3:8ee:521b with SMTP id
 d75a77b69052e-4b5f6d1d109mr12322211cf.0.1757357683401; Mon, 08 Sep 2025
 11:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250827101949.4089456-1-tabba@google.com> <20250827101949.4089456-10-tabba@google.com>
 <1a248f14-60f2-4f8f-8b4d-3c63e602fd54@sirena.org.uk> <22a563c0-886a-4ccd-84e5-3093986b164b@sirena.org.uk>
In-Reply-To: <22a563c0-886a-4ccd-84e5-3093986b164b@sirena.org.uk>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 8 Sep 2025 19:54:06 +0100
X-Gm-Features: AS18NWDbGDcURy5P5Xe8dqaGtypth_Kq4WFhaOlejGW8eCU1PI2j12fC_WRCJiQ
Message-ID: <CA+EHjTwR-PFQLkH5ECPc0Ak6RpnqJjV-j8Phjf9XrRqWo1+=vw@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] KVM: arm64: Reserve pKVM handle during pkvm_init_host_vm()
To: Mark Brown <broonie@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, mark.rutland@arm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vdonnefort@google.com, qperret@google.com, 
	sebastianene@google.com, keirf@google.com, smostafa@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_115444_949180_E62ED568 
X-CRM114-Status: GOOD (  14.36  )
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

Hi Mark,

On Mon, 8 Sept 2025 at 19:52, Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Sep 08, 2025 at 05:05:56PM +0100, Mark Brown wrote:
>
> > I'm seeing the KVM selftests failing in -next on multiple nVHE
> > platforms (pretty sure it's all of them) which bisect down to this
> > commit, when booted in standard nVHE mode the selftests are all failing
> > to initialise with:
>
> I'm seeing a different failure on the same commit with qemu in VHE mode,
> we fault during pkvm_init_host():

I can reproduce this too. It's the same issue. Fix coming soon.

Cheers,
/fuad

> <12>[  112.802609] kselftest: Running tests in kvm
> TAP version 13
> 1..34
> # timeout set to 120
> # selftests: kvm: demand_paging_test
> <2>[  113.800187] Unhandled 64-bit el1h sync exception on CPU0, ESR 0x000000005a000000 -- HVC (AArch64)
> ...
> <4>[  113.812056] Call trace:
> <4>[  113.812571]  show_stack+0x18/0x24 (C)
> <4>[  113.813078]  dump_stack_lvl+0x60/0x80
> <4>[  113.813448]  dump_stack+0x18/0x24
> <4>[  113.813711]  vpanic+0x124/0x2ec
> <4>[  113.813965]  abort+0x0/0x4
> <4>[  113.814198]  arm64_exit_nmi.isra.0+0x0/0x94
> <4>[  113.814517]  el1h_64_sync_handler+0x2c/0xac
> <4>[  113.814812]  el1h_64_sync+0x6c/0x70
> <4>[  113.815266]  pkvm_init_host_vm+0x20/0x48 (P)
> <4>[  113.815629]  kvm_dev_ioctl+0x264/0x80c
> <4>[  113.815960]  __arm64_sys_ioctl+0xac/0x104
>
> Full log:
>
>    https://lava.sirena.org.uk/scheduler/job/1794785#L2258

