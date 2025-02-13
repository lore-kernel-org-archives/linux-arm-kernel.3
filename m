Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20264C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 10:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=COJNGekBErJDtHN053nWkTAoSgTTSoO9L+cYR+Xqxy4=; b=KWtgPYEU+V/KJ6/BkAOk8lmFfG
	xO3asMJKOWhRcY3G/C2EON4GVwomtN63FG+8DyVGTR7TiWyD3uv1q1NLRcczosrodF/qIQ5Ewd8d4
	bt7dnc4b9WIZZ8aNppVMTnnNtDuxyvvf+SduGYKIZpwbOZ6tDNYLVBmJUdNZKSn4VjZciogBj7+ei
	1QdRDwJ0XfxWU/VJ1YxNG00Ox8yK9VZporerTsynwJgVTqC6CGiIpNv/knFJlu2h0lj8nlZ35wnyU
	4nOcvn86+9Ri89tsU4B7Hg2xK+DlYWu+USrrcpIj2Rv5B/hpqanRb2PHFLrEkAi3gzaOuWYumjFCl
	3LtjjYRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiW4B-0000000AZsg-1P48;
	Thu, 13 Feb 2025 10:03:31 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiW0b-0000000AZH0-2oOI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 09:59:50 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6e65e1d30c9so209016d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 01:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739440788; x=1740045588; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=COJNGekBErJDtHN053nWkTAoSgTTSoO9L+cYR+Xqxy4=;
        b=Jf2VSKK10E9B74s2o8pIEhXDX9IPQhsZfKUd/JNgWbXnU+3804Y4rhpJGeGQgVW3A1
         PErZUEE6r6cGB5dUFxlEsfUsi514AhqQ+sPlPBKcf8v0h8HnGEX7tLuPTGYSuRnXjRN/
         uyFC/8cTTnfOiseaNh0KnwdX/3QNj1/RD+HJKu7QgMDQpfkyvvGmhp4KTUBcskSNrOya
         NSKzg6MmNa4P/oOWj18Ps8Nxc0gZpQ8/4Ly6UW8bc54+EPgygi12rKCxUF7ULpz1WI8g
         f5lF+YxvFCaEYVQyZPiwYkgZnR4VGBmFuQFWOUTX/G+zmY/1dm0qk+4tO7v8VyRdNj4H
         d7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739440788; x=1740045588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=COJNGekBErJDtHN053nWkTAoSgTTSoO9L+cYR+Xqxy4=;
        b=kKrmPo6uxIyFPL853rwOKkvqIlkFh7QKKHfKS8ks2VwsqqXKgECObOizAls4XbL2qj
         bfVkkrdyj88qaXhT+RuYWYmzcWK5QuPYQz5ctNerQFQbEN3r92bbkhQqglVkvkUy87bH
         57seFwiKasDPEIwWs09XrF41Wr8rqOVHG9R4y0K7MeV8lujwLl24aiord+8kZadsnCkX
         p53OxR60RcoQIjdiLb641sHGrYHpbpddWFYZ//EeZZ1s+QGpOXfy9zyNFhPAGMsL4KZ/
         b4iKLxGo+w+4OZcJMrycAwjjMA9IGQEGkxaL1EOUQtH+8Nq38XVXpQQt5VYuzdujGXWE
         XCFA==
X-Forwarded-Encrypted: i=1; AJvYcCUFALKqIAWhXOV3b1uCIjpC4tBpTl1I3ENBK+rNue6e80+Kt0RrRPUxH6m5WP0zE0ve+ls0R3y2c93wW13gNQPR@lists.infradead.org
X-Gm-Message-State: AOJu0YxU82s02dv1P1meNF9dUk66uFogM9vwtIrLAoyDlJMfZdXCw4WC
	zKk9aTeuxJjobDVzKdUcdajHgmAiZtCeVYU0wDEsTiDit2hr+R03y3aQ9+J1WLsfx+sjsy4jzWq
	ZU0Y05yTaiHWd5hIODnG3INtITLzy5lB+mTiQRQ==
X-Gm-Gg: ASbGncu1LGowtQyfaOFKO/bc6uaLMC4G8QpskJobxct/slFeL4fxhuWKK6TBajkgpVx
	fPCkoI4AIN+XNaW+AiMpDNdWqcMHBwnta1u95yfQZkPf1LwEiDwhYCQOdJ0eL6p++P9Ttpk9p
X-Google-Smtp-Source: AGHT+IHjST43iJQwKlW8MuHT3YKNmk3TJzkB+3qglLpmrJHxoQ21YjQ7p9lFzVWUi5QoVF1/vD6V21s991LiGcWOuME=
X-Received: by 2002:a05:6214:cc8:b0:6e4:2975:ce54 with SMTP id
 6a1803df08f44-6e46ed7f367mr40769266d6.3.1739440787956; Thu, 13 Feb 2025
 01:59:47 -0800 (PST)
MIME-Version: 1.0
References: <20250212173454.2864462-1-maz@kernel.org>
In-Reply-To: <20250212173454.2864462-1-maz@kernel.org>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Thu, 13 Feb 2025 10:59:36 +0100
X-Gm-Features: AWEUYZnv3GWn0jzFu3uoM9Lo2WH4CAyE-PhoCt0q0vIYbO78Rx1ocXlr_cZpyFs
Message-ID: <CADYN=9KWdAm4iKYNN16Uz68XPViDLXGar3uhrM2e2+Dharaosw@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Convert timer offset VA when accessed in HYP code
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, 
	Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_015949_714220_6C9F60FC 
X-CRM114-Status: GOOD (  11.34  )
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

On Wed, 12 Feb 2025 at 18:35, 'Marc Zyngier' via lkft <lkft@linaro.org> wrote:
>
> Now that EL2 has gained some early timer emulation, it accesses
> the offsets pointed to by the timer structure, both of which
> live in the KVM structure.
>
> Of course, these are *kernel* pointers, so the dereferencing
> of these pointers in non-kernel code must be itself be offset.
>
> Given switch.h its own version of timer_get_offset() and use that
> instead.
>
> Fixes: b86fc215dc26d ("KVM: arm64: Handle counter access early in non-HYP context")
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Tested-by: Anders Roxell <anders.roxell@linaro.org>

Build this patch ontop of next-20250212 and ran kvm-unit-tests on a rockpi4.
And it ran fine without any kernel panic.

Cheers,
Anders

