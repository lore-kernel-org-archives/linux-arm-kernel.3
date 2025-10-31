Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01D7CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 06:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hF/sVbbm9Ao9b8Ns6PIrso6umKYBwwEUA+RHQF/p8WU=; b=RD9aUoH/t6QauuLhWkW1zhva4Z
	fp4mJodj1Dqnfcdn/qvM7fFm1HWjBsT1RCL6UFd43o6HnAWTNST2QQLw80mmjdTXIQQFd8ADsuhEd
	CPrGCs+YVMyKMfVd5rFvH1aS+jIlHp+ClexS9FpdMiWvEXH26bCMoZFXV/kkfoU7UsqJvFAdPduKr
	UAX5V2XHJjPjufrmjRa84abANvxaSKRnwuf1ouJMo6Y+d7Bc7gD5E9s/wgG0WDob00nB1dukfG/VU
	BErijTtnbq2RLvJ6ZjCyst/l9lMfUoE019FkT8PRbcMVOVsHCk37k9IV1DRdBuO59NJj9rwhAYq6H
	+OVeXV7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEj4t-00000005V8t-1pot;
	Fri, 31 Oct 2025 06:57:39 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEj4q-00000005V81-0mYd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 06:57:37 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-63c45c11be7so3200125a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 23:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761893853; x=1762498653; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hF/sVbbm9Ao9b8Ns6PIrso6umKYBwwEUA+RHQF/p8WU=;
        b=PusivBd6dxkYzbGAwK29cTTmrnmWJkeOxq/efLkAc3GcgbQ/xshGsUyh4RGTZW+nHL
         Hjt9wuN1EUG+vL/vaXDEiVZp+rJTz7EfzIHBXmE3rpltbmzjvI6A+s9B6x9+Ek+UDQt+
         mEty+bDiWV/4QXjPIZE4vmFvV2oEhktLgLUAGAKM1IEsrHaK3UoNx/p+J99Sa0nRFIIu
         t5jOYsA9oYeNEDSMmPOeWN+1WG/xl+3wd/+umNiuJUqb6FQ4IUtH54VSnfxoeLv7/6Ib
         NTypIOA7D8KvpTDXaEKANSneTSKSnGiSDXv9/QWFN5MsMWZVplcmWFBWWeJ/3MSFRRZT
         QRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761893853; x=1762498653;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hF/sVbbm9Ao9b8Ns6PIrso6umKYBwwEUA+RHQF/p8WU=;
        b=fWhg4HwW3B29Qa9179B0RCNS8pBbR93mtbglwUMft8KusL3p0asBWWpi9Sg3EWxUex
         uDcCDVhHgRUI5kiKG502nqXnTC5iHgDsIeWWvyHDqzGitv9FRFx26zzsac+o1ze9IccZ
         1ugMP1vBUWs05ScvqOK1p0dAWWKmn/DYIFN0sC4UXMkZ9ht+RVDHE/+t9xoXd7I7L3c/
         7OMZ9EEs0ilksy9QExhdEQxMnO5Clj5Iy2yrxWvyoNns4AobFud9B8DLSUPaKaV5CM8c
         FebEcfyFHHAd7sHV4w8aXy+yt3FNO6S2zevUB+Z0A2KX6PiNhUUiFTxrk+TeQYyzSRH6
         eTPw==
X-Forwarded-Encrypted: i=1; AJvYcCWakR0mDvlTrrVSnvUo4OCz1JtFWZlVHf0mbPPBKY1FGLIa6a31xiEd9V74jLupQF390xoGqT4VFjj0s8kx/CdQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyrn4gWIeegO2HmemBwGRq2XU17AErk0eiT4KHmyWCpt+BqwNf+
	nyrwvo642iGpxYy7L+J1iULUOzCS8c12Iah9DTKmUgmIkjKKecCXX5v1Qmi2vM9IeCEHySMSEPo
	FEMHkdfDDuH/79ZckTew/8i4CEMoGssM=
X-Gm-Gg: ASbGnctLsocrj0M1bNan4B4AxTq5WzxdHq9H6sTy0G0Q3Vu/BF7idoQZM7reuRwU8Fc
	rDCUvI27kPtAqPNOVTRoJyuBcSWHWJxUahSWb7ZwqTO0GQRyO8SIbEGkJpb59einiUnRX16bkTi
	lKzlqZEL/g9Yn53xETfA8qm3YChh90yx1qPiNRO76rlY6AhDj41Sv3XTK99IjRBWIkdFKc8Rshp
	JQ5cMICT10UMaDHm0tWiRk95Qu9WjS8s6o9zUinNRpr5iqOMTz407jCz7bpx/HE/vFO0w==
X-Google-Smtp-Source: AGHT+IFyei+klT+e0zDZRYAQ8WfZ4bnVZVHTeB/u6lCn4sY3PNMEr1huxXolqGu7fMkBJJ2eI8cU2oPW7PqE/lfnbIQ=
X-Received: by 2002:a05:6402:42d2:b0:639:4c9:9c9e with SMTP id
 4fb4d7f45d1cf-64076f745edmr1865815a12.10.1761893853181; Thu, 30 Oct 2025
 23:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250905112736.6401-1-linux.amoon@gmail.com> <176085588758.11569.7678087221969106036.b4-ty@kernel.org>
In-Reply-To: <176085588758.11569.7678087221969106036.b4-ty@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 31 Oct 2025 12:27:15 +0530
X-Gm-Features: AWmQ_bkdpeuvODAhvIaaZqDfiic9UVZyJJONFz6Rrfy4AXRXj22BM3Tny4odqv0
Message-ID: <CANAwSgRjXS4V_Kpw5kaJnPA8f=18uN-MgfEQ5ErN3aFRqbJKfg@mail.gmail.com>
Subject: Re: [PATCH v1] PCI: dw-rockchip: Simplify regulator setup with devm_regulator_get_enable_optional()
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Hans Zhang <18255117159@163.com>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_235736_223414_5112DB5B 
X-CRM114-Status: GOOD (  16.13  )
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

Hi Manivannan,

On Sun, 19 Oct 2025 at 12:08, Manivannan Sadhasivam <mani@kernel.org> wrote:
>
>
> On Fri, 05 Sep 2025 16:57:25 +0530, Anand Moon wrote:
> > Replace manual get/enable logic with devm_regulator_get_enable_optional()
> > to reduce boilerplate and improve error handling. This devm helper ensures
> > the regulator is enabled during probe and automatically disabled on driver
> > removal. Dropping the vpcie3v3 struct member eliminates redundant state
> > tracking, resulting in cleaner and more maintainable code.
> >
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] PCI: dw-rockchip: Simplify regulator setup with devm_regulator_get_enable_optional()
>       commit: c930b10f17c03858cfe19b9873ba5240128b4d1b
>
I am looking to suspend or resume the issue. We probably need to
toggle the regulator
to maintain the power status on the PCIe controller.
Therefore, dropping the patch is an option; I will add dev_err_probe
for PHY later in the patch.

> Best regards,
> --
> Manivannan Sadhasivam <mani@kernel.org>
>
Thanks
-Anand

