Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC44C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 15:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jFMOfL5Pv5EjomGzOk1gsjAPgr7PAL00YNzc4TmILmM=; b=B7K4Fru7bCDO8bVsCnZWDc38V3
	itm9zKGVonMstVj2PqEH8XVZIMOKsc2O35kQ80HyCJ8j3byp8LoH9bHeLiBXb8zrmiVTICpxauikE
	ArmywzBNhk29rP+GUXDG9FSwrqiIlk1kpv4K+FjtDWrC5TRjUfujTkW9HPbbUGq0HGMEpM9fPCgFd
	hkiHeh/w5P/BA1nc6D5AcGqHjA+lnapay8U3eunFwSU+XybQphwfaQlJ3u9wbSOY1HUQtkmq9EQNp
	EcPzTpEkK7w8V5Em/79ESMAdCShA0XVzGsKUmk24KKAX039Bv1PrsYISdQr2cug53RdmfDkSMbTs9
	0Zl9xDLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMRt-00000008Kg4-0TaM;
	Fri, 07 Aug 2026 15:25:29 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMRq-00000008KfR-0X0a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 15:25:27 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a17f91so5513523a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 08:25:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786116324; cv=none;
        d=google.com; s=arc-20260327;
        b=rXV6AO7ip/iS5edcCYH1U9Z/CjYMAliyXBBKL3uRhRYMi5SoVmj4ptgSbyrtB3lI2l
         VTsPC285k799XYEqao3roJrXkomvNciffXOXKe58y0T8RHM6QFIpnt1mmfg678x6Sh4F
         qSLDSEo3qkeTQ7fSCkQ6pzZXhXrbBNyjkdc6oPpUonIpGoOazwGvTjSlQN/RZvoA8FT0
         08DtEkQ8Mbp7yRPFuv/TGcU+PC051Pvfcoay9ugqfTgu+i9UOZyyFfsW07uVx1epJ85c
         sBbVGDyLfgEtgwrcSiuRHaX0nADsd0WgAFsVT8rMUPB2WRt/3ey9KLThwozNtf52MBt6
         hY3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jFMOfL5Pv5EjomGzOk1gsjAPgr7PAL00YNzc4TmILmM=;
        fh=sZf7rlTdJQ2Zwk/dzB9f5IZZD/lzbi5FMgUw4e2HNsA=;
        b=S72q8E8zyLmXKJnOHwS/oLghmo2YurOfr4VcpoJaQU+a4kppGYEp+aPNMC6+QJU1PM
         cLXOrd94MmL4jBEk9V3gIeL9wYZniCRKKm/CSjfVYiszFyxpkiED+fJGWFjItZGSc/Ta
         JH7YWFM9ie01nO5IWTX2tW5cGH+2yyoPtfmzFftGKOQ/v58nmcK4xMyMGDdWAar7IvK1
         jaCPcrsg+CUH2GcHrFhFNV91+VXWGLGRQlvHBN7tY6ztsA3iuD9knc0CXCUHRqwXNAzZ
         u3pb5+yt+md1NnELhRb6M1rDwSgGGoXqO47Wj/VmXS+vY+NEY8ZH+rxzoU/cRDxFXla6
         XBqg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786116324; x=1786721124; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jFMOfL5Pv5EjomGzOk1gsjAPgr7PAL00YNzc4TmILmM=;
        b=D97mYpeA9sK+UWtsr5/2MLMmYLcAtjg64PD+ni09iyxqU4U/eF77D60767rhX8Wrtd
         fOviXVylcK6xmOjoovEY3GPCgmFyD/auAZpNsAF8xQDp4s7xB04nXR+2CBSBp56j2Pkh
         InjLYnU/95hSGde21HSGP7jex0QyXpS4VsFs66GKavDRQ9+4ZccjnNYGDfIa0II3TqOn
         YUyO3B/jps4e9Z2xhetQP3d0cU6F1ouWf9WJUgxkf1rAMHVEulmEWWMZtpho2V+XPsln
         OmUmoqr91tKXBe8avYIL7oP+ie0v8qKk9Qj/bkenjKarg5Qur7jEcaT64Xp0ZnvzEK+u
         i4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786116324; x=1786721124;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jFMOfL5Pv5EjomGzOk1gsjAPgr7PAL00YNzc4TmILmM=;
        b=JNw9Tzh+NY/RLuv/t9cBnxSrNq8BZdyCL0M0/uafP3gp26Zjo22GWJ8HV6FK14/M4V
         O3xYdPtvJr2vlPw2Y4RdXrLxoLvXoQn7uKcXW+eAd0TbrHjs/nSPdYhdnbkCeiM79mMK
         5i5IeJbf0oQYbclSQUt2gaOyOg4o2tC20fGWbQpuTfQ2uWzJwVT9ogACGIYY/cBNPbEo
         R1+STLB3DAX/MU35GKWW/9U7RtxbyYLYWzwXlHky1aBh/TWmWKVd4nNyQgJ8rEmQbhKr
         xqT6A0+YDY4a+ZR/8uARdcpaWeZGDjNDR+rCJT1j97V+mhY1oi4CBmjL2V6dltS1zvqx
         WU+Q==
X-Forwarded-Encrypted: i=1; AHgh+RolHPrNgpgZhz5PbPvhyhB5n3TRbw547rKdP69HdLNiL3LaOdvK4hBgH+V5FByqHxv+CXxXR6vmVwGQ9Ma+g0oc@lists.infradead.org
X-Gm-Message-State: AOJu0YxawBDMyrsLr8zCYqb8TuyWD8XEUkVOiCqGNcoOoAjxCYmLfUu4
	hvDWm3/TVL3i8Bfzg9NAb6m8bhDU8/De3RsKuaoZuVKtOAMCKNIPbVZtZQS2RYd5mLxodqMwIwf
	Ggw2Vlfb9iY/TiY9mABhntfXRGZ8XjupQOh4tWcaXXg==
X-Gm-Gg: AR+sD128/qSW+MGlTqOd6N68RaSc9gS8lf7lD27iebx/oz+b8nrPEvE4lANPVR0Rg4k
	9OQnaI0vpXJ1gDOvSc+QFdtUBhApyV1udhCOL/oEfISb+wxjsY2pMhQgUQT+NKiuUViZf0mHoUr
	6SZfJQRGr3SnWjkHIxV4QnWsOZ/LeOswJSiyy2dzM8jUr6a6zgiVpXoeCfZt8aaLfrjg2l4Op3Q
	eHkZQnme/ieklh3zI3yzA0fXye3hsxChwyfLmmSkdMf7Kf5Ltt3jwVPBbKcUeaHnbq06LWoq9HM
	cE2g2mz0DeRq6lOjVJWHFXZk3yya/ziPec1vIEC3p3tikJjANAwTxbRyuHr6DzyCnN+HjUiSDUt
	4R/U=
X-Received: by 2002:a05:6402:1e8e:b0:6a0:8ac4:f055 with SMTP id
 4fb4d7f45d1cf-6a14f07c8edmr11239086a12.4.1786116324014; Fri, 07 Aug 2026
 08:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
 <amYIuhYenP4-qHyV@willie-the-truck> <0b7c0272-5506-4aee-82b3-76a78f2b39dc@arm.com>
In-Reply-To: <0b7c0272-5506-4aee-82b3-76a78f2b39dc@arm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 7 Aug 2026 16:25:11 +0100
X-Gm-Features: AUfX_mzVQ33goKUmAZD3cnZPYWgLmpoH7Rq86A-Q6fueTvaPphB8yY86QV4o3lA
Message-ID: <CADrjBPqZFDvyLFpDy1YP9qrMNUCtZYtJhiaDd0iTnmB4ZYO8GQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add arm-smmu-v3 support for instcfg data override feature
To: Robin Murphy <robin.murphy@arm.com>
Cc: Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pranjal Shrivastava <praan@google.com>, Daniel Mentz <danielmentz@google.com>, 
	Mostafa Saleh <smostafa@google.com>, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
	jyescas@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_082526_201965_4A48B534 
X-CRM114-Status: GOOD (  29.37  )
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

Hi Will & Robin,

Thank you both for your review feedback.

On Mon, 27 Jul 2026 at 11:53, Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 26/07/2026 2:16 pm, Will Deacon wrote:
> > On Fri, Jul 24, 2026 at 01:39:41PM +0100, Peter Griffin wrote:
> >> These two patches add support for a new "arm,instdata-override" DT property
> >> that enables the override of the instruction/data attribute of incoming
> >> traffic to Data by setting the INSTCFG override bits.
> >>
> >> It is intended to be specified when the smmu can't guarantee that these
> >> attributes are provided correctly from the client device.
> >
> > This is going to need an in-tree user and a much more detailed
> > description of what is being worked around before we consider this for
> > inclusion.

Regarding an in-tree user, I haven't sent the Device Tree (DT) patch
yet for Laguna SoC which adds the smmu nodes and this property because
1) I want to land the initial SoC/board DT first
2) I want agreement on the DT property name. Currently I used
"arm,instdata-override" which is what downstream used. However, since
this is intended to work around silicon errata something like
"google,lga-instcfg-data-override" might be more appropriate?

For Laguna SoC the first in-tree user of this is the amb_smmu smmu
instance which is used by the Synopsis dwc3 IP. The Laguna dwc3 glue
driver is already upstream at drivers/usb/dwc3/dwc3-google.c

> >
> > In particular, if a particular client is emitting data reads as
> > instructions, then a better work around would be to avoid mapping its
> > domains using IOMMU_NOEXEC. But I can't tell what's going on from the
> > limited description provided here.
>
> Unless it's also emitting the privileged bit and thus falling foul of
> the implicit Unpriv-W -> Priv-XN rule, but then we also have the means
> to deal with devices which actually do that themselves (hello pl330...),
> so that would seemingly only leave the case of some innocent piece of
> AMBA-interfaced IP which doesn't expect to need special attributes, but
> the system integrator has gone out of their way to tie the AxPROT bits
> to some wacky value, which I would put in "erratum workaround" territory.
>

You're correct Robin. It is an erratum workaround for the Laguna SoC
due to some custom usage of the AxPROT bits which differs from the
standard ARM SMMU handling for Privileged/Unprivileged and
Instruction/Data transaction attributes. The effect is all
transactions appear to the SMMU as "Privileged Instruction" accesses.
The software workaround in this series enables the SMMU's INSTCFG
override feature to ignore the incoming value and treat all SMMU
transactions as "Data".

One small clarification: in the cover letter I incorrectly said this
was set only for some SMMU IP instances, but that is incorrect. It is
actually set on *all* arm-smmu-v3 IP instances in the Laguna SoC.

Does the above provide the additional detail you need Will?

Thanks,

Peter

