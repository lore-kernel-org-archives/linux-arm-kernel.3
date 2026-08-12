Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D71C5CFEE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 11:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAMJucX98od9lFQS19sQLl0kAJ7auuTQYd+7WMR6MJ8=; b=vAqA2xKZOwE9Yv4JEmzVMxLEVR
	DE/60ZY7ilIcJXPa2Pmk7924iH39+AJedJ4B/sx6RZ0HRWXdryUtAQz5woIyHGZobo7ethaYjhjZZ
	qJKTj7voJ1Nhl186iHkpTst5hLdoC7BHViKaF/dH3Sdkwr/TRupXHvVzrGNoytZi9XHqbbhYjicY4
	mAuhLC9R4ArHtNcdIHb/nB4TJ2XnuWxpWtkPde+yuhy1MBCm+arWLeR8npCnCA+6bcWgGAXyZ/A7k
	NC9evR/DSjwpjgUAMMObRSbB5PQ0DtE8Hp3xyzkHWuTA2US0HbD+zBKXLcr/RPZ9F3YJPubnDygg8
	u9nkK+rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6m9-0000000G05A-2MC5;
	Wed, 12 Aug 2026 11:05:37 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6m6-0000000G04p-0ffn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 11:05:35 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a17f91so1312470a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 04:05:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786532732; cv=none;
        d=google.com; s=arc-20260327;
        b=pNjM6ZmrMtkUoHtaXL/PVDodlfeKH3sUD0K6Dmj9MLg6r3fbla7ZaT9gbT/8F+h3Wq
         yd7Ozw/rEgBUbi0KgXyWRFvHa2/ikhYPUo6jApJx03KzJraq+yaDb8BtuzuTyx0kViak
         78q+pIisvaqGg9PvRXrVkfRNBeF4EwBUtF97ZwYc0F0JE/s9lHF7jHAIZECVUoTEfzWC
         Qtl5ESgNPs9X/FXMFXwY7E7vRtghBWUuCxvt/g+UOusOHquS/RAM8znzOJce5cXLogbi
         yDZhZKiaSN2weoJ/9x5frpaqB56RRXwYfXAURC//U5jejp7mdFwG9sHZeYxVO5KwjqdH
         BNZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TAMJucX98od9lFQS19sQLl0kAJ7auuTQYd+7WMR6MJ8=;
        fh=b4bicH66EM5pIv8DaIcnCbhZiuqHhlsVb8dvzLjN8GQ=;
        b=J278y61CLPxsByrE27OhYlO4jlG3IuH3neK8V+dnMLdoUFhbvJ+B6qLxYNjEDglT+E
         lWitFSXdFXDIkzmr0NxPD3QzNWBM9B4Rz/zTMZRg2hx5nF18xOmDKejlQ+JnlfNLLSM5
         YfhjkTEBYNBhn0TieFpnXbhZgSYGbPk7n4OFe4cZ7e6R6D0pRWvWVwY2mgp7lHuAId7H
         ZQfN5aTGWpGnAWsbJeTzVmeLYjUjELm4sxfcgkgGCTNiAYgOH9DBCa+p+YCmb1zRae3m
         goELQY0ZGbpgjoJcih8J8vMjn6/JhPNPPEZtOIpvDr8k1JrZRtyR8EmGnMDodjHT8Anr
         R6NA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786532732; x=1787137532; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TAMJucX98od9lFQS19sQLl0kAJ7auuTQYd+7WMR6MJ8=;
        b=SsW4btoighmdrxMpVo25jEWiSKCQRSNoW7/NRE58lOHX1IJnhUDfhs+IA6zt/9odMs
         JBjxM+Sk2K4gPjXBVDimxc8id3EMt4/7aST6YaF0FskFmxys+1urIQ3KCejKAMXavtQt
         XwMn9oPQxyoUO4WCghepADdsTiC9fyyemxJDmYL5kp9Yos9QlloGTsDL9iyZHw5AcYvY
         ZJp/zUL5cnUrMiwUnZDjAECHqKhk8xN3hIycwXP4FeVLHrmMrm86pYoBeY5LDcRp6i2Y
         hF3EeG9IGvyMoXcS6yRNiFxRPno7Mn7Luyt0xbA4O7+a1mRiAdomigf0KJ1UbzWUdPSI
         QQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786532732; x=1787137532;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TAMJucX98od9lFQS19sQLl0kAJ7auuTQYd+7WMR6MJ8=;
        b=Y8zJXOrnbd5ymYceJ0XICwKXYIYL/m1VvjeLfoFf7uvFcN4pmXaekkecLHhR+zZj4q
         FKAm+4jszHsdD4QsXToao0aEw1z41GGDqojfcwcL+xVPkgyfQFWjyw9CAPwUSeJCjMI9
         leUbuRDXQJFfrEJT6Rq2HrEdcbYO0HFkMKFzPP0YaknJGZE4sgpwfPN2rKbd0HBHrXRb
         Sze9DqwxCSvmVfenD04pk/rZL1VK8tXzUK2oeWcljxEY496swE/HjjOra5avF2yvWpvg
         UOmO9E4cF/Ywv/LSXvVOpeZT95ueyDs91R62vxSppQWocfz9EleGZC4S84yuEr84dspw
         9cvw==
X-Forwarded-Encrypted: i=1; AHgh+RqFcMvpipQ1QEt2ad62ho8NmYvCZKQ2mpCgV7z3dTbcb2aPFIKgOTO2hukzvmgt5LHyUAwlUR1bU7IULWg93Eiw@lists.infradead.org
X-Gm-Message-State: AOJu0YwSEfMYys/UP1bNepP4Uxpqhp8PMVUeAncHlPy0gOSCnFG0+E4r
	bVmjdxkeM0/VIz3rrFE0E0jUSoZY3lM4w2LysFfPIjl5ynL51azB8tGlVsvWCqKPKudD+G6O/d/
	blwUFjpBuYgFZfopOmM7rRiKkIR3QedWiYBRLv4/3Kw==
X-Gm-Gg: AR+sD1163nW0ZxHcHguHb/WrnkjZuQr8lDVmVeB6Ruwkuv6xnVVcevV0H9dVBWCk93v
	0ge55ea37lK4zHRGnKBq+ThfbTbA5k080CZa92or5AEpwQuKJMOMP0kPplyFaxeOz5i+jin2Eld
	PvBe1PvKSzpNbwGE8zHuoBsYvbWdLRyZ7oLmVdEPgVUngbn5gZNyeT7f58KTlLdnxEO+d7JwBPY
	1fV80I4PHbf4C4ZoHjp8gFdNSrBtBcpvT4V1o+mOh8++v2j2kWseetNAskM4W+/8FbBr8MkxACk
	F8Cd9yQ2XaAEC56c83cuhQ9EO0Y7/p8BPkBW6uZ+TdxgxtAgl0krQt/AyQ3jnN2CXfsx+mKTDs6
	4Uw==
X-Received: by 2002:a05:6402:3228:b0:6a1:f95b:8cef with SMTP id
 4fb4d7f45d1cf-6a375e9645emr1820229a12.4.1786532731531; Wed, 12 Aug 2026
 04:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
 <amYIuhYenP4-qHyV@willie-the-truck> <0b7c0272-5506-4aee-82b3-76a78f2b39dc@arm.com>
 <CADrjBPqZFDvyLFpDy1YP9qrMNUCtZYtJhiaDd0iTnmB4ZYO8GQ@mail.gmail.com>
 <anmvW1LkypAGW6Sc@willie-the-truck> <77edba4a-b6b0-4b50-9328-7c177a0af283@arm.com>
 <anxN6RwREhUEuddT@willie-the-truck>
In-Reply-To: <anxN6RwREhUEuddT@willie-the-truck>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Aug 2026 12:05:19 +0100
X-Gm-Features: AUfX_mwI8H7TXg42iNqR_RkOIUIpO3gOTAkuA-Ll7XQip0ZZWi-1F1xt3OUBfdI
Message-ID: <CADrjBPqRPaZiwpj+cPznsXe79dsXa9kAObLKEOBQk0W5PovU5g@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add arm-smmu-v3 support for instcfg data override feature
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pranjal Shrivastava <praan@google.com>, Daniel Mentz <danielmentz@google.com>, 
	Mostafa Saleh <smostafa@google.com>, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
	jyescas@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_040534_253438_20FF066B 
X-CRM114-Status: GOOD (  52.07  )
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

Hi Will,

On Wed, 12 Aug 2026 at 11:41, Will Deacon <will@kernel.org> wrote:
>
> On Mon, Aug 10, 2026 at 06:16:56PM +0100, Robin Murphy wrote:
> > On 10/08/2026 12:00 pm, Will Deacon wrote:
> > > On Fri, Aug 07, 2026 at 04:25:11PM +0100, Peter Griffin wrote:
> > > > On Mon, 27 Jul 2026 at 11:53, Robin Murphy <robin.murphy@arm.com> wrote:
> > > > >
> > > > > On 26/07/2026 2:16 pm, Will Deacon wrote:
> > > > > > On Fri, Jul 24, 2026 at 01:39:41PM +0100, Peter Griffin wrote:
> > > > > > > These two patches add support for a new "arm,instdata-override" DT property
> > > > > > > that enables the override of the instruction/data attribute of incoming
> > > > > > > traffic to Data by setting the INSTCFG override bits.
> > > > > > >
> > > > > > > It is intended to be specified when the smmu can't guarantee that these
> > > > > > > attributes are provided correctly from the client device.
> > > > > >
> > > > > > This is going to need an in-tree user and a much more detailed
> > > > > > description of what is being worked around before we consider this for
> > > > > > inclusion.
> > > >
> > > > Regarding an in-tree user, I haven't sent the Device Tree (DT) patch
> > > > yet for Laguna SoC which adds the smmu nodes and this property because
> > > > 1) I want to land the initial SoC/board DT first
> > > > 2) I want agreement on the DT property name. Currently I used
> > > > "arm,instdata-override" which is what downstream used. However, since
> > > > this is intended to work around silicon errata something like
> > > > "google,lga-instcfg-data-override" might be more appropriate?
> > > >
> > > > For Laguna SoC the first in-tree user of this is the amb_smmu smmu
> > > > instance which is used by the Synopsis dwc3 IP. The Laguna dwc3 glue
> > > > driver is already upstream at drivers/usb/dwc3/dwc3-google.c
> > > >
> > > > > >
> > > > > > In particular, if a particular client is emitting data reads as
> > > > > > instructions, then a better work around would be to avoid mapping its
> > > > > > domains using IOMMU_NOEXEC. But I can't tell what's going on from the
> > > > > > limited description provided here.
> > > > >
> > > > > Unless it's also emitting the privileged bit and thus falling foul of
> > > > > the implicit Unpriv-W -> Priv-XN rule, but then we also have the means
> > > > > to deal with devices which actually do that themselves (hello pl330...),
> > > > > so that would seemingly only leave the case of some innocent piece of
> > > > > AMBA-interfaced IP which doesn't expect to need special attributes, but
> > > > > the system integrator has gone out of their way to tie the AxPROT bits
> > > > > to some wacky value, which I would put in "erratum workaround" territory.
> > > > >
> > > >
> > > > You're correct Robin. It is an erratum workaround for the Laguna SoC
> > > > due to some custom usage of the AxPROT bits which differs from the
> > > > standard ARM SMMU handling for Privileged/Unprivileged and
> > > > Instruction/Data transaction attributes. The effect is all
> > > > transactions appear to the SMMU as "Privileged Instruction" accesses.
> > >
> > > Ah, so this sounds like what Robin was worried about.
> > >
> > > > The software workaround in this series enables the SMMU's INSTCFG
> > > > override feature to ignore the incoming value and treat all SMMU
> > > > transactions as "Data".
> > > >
> > > > One small clarification: in the cover letter I incorrectly said this
> > > > was set only for some SMMU IP instances, but that is incorrect. It is
> > > > actually set on *all* arm-smmu-v3 IP instances in the Laguna SoC.
> > > >
> > > > Does the above provide the additional detail you need Will?
> > >
> > > So it sounds like using the instcfg override on this hardware still breaks
> > > IOMMU_PRIV and IOMMU_NOEXEC:
> > >
> > >    1. If you don't pass IOMMU_PRIV, you still get privileged transactions
> >
> > However this is inherently true of VMSA stage 1 anyway - I admit I had to
> > double-check, but we don't have any user-only permissions (other than
> > perhaps execute as implied by explicit or implicit PXN). IOMMU_PRIV can only
> > _remove_ unprivileged access.
> >
> > >    2. If you don't pass IOMMU_NOEXEC, you do not get execute permission
> > >
> > > Is that correct?
> > >
> > > Perhaps it would be better to override PRIVCFG to force unprivileged,
> > > then reject IOMMU_PRIV and ignore IOMMU_NOEXEC?
> >
> > From what Daniel said, it sounds like the privileged attribute is still the
> > doing of the device itself rather than the integration issue in this case,
> > so while nobbling PRIVCFG might also achieve the end result of making
> > IOMMU_READ | IOMMU_WRITE pages mostly not fault on reads, it seems less
> > appropriate as a workaround. Particularly since IOMMU_PRIV is exposed via a
> > general DMA API attribute, while IOMMU_NOEXEC is only accessible to
> > dedicated IOMMU API/io-pgtable users.
>
> Ok, I did a bit of digging internally and it looks like the situation
> isn't quite what has been described here:

Thanks Will for taking the time to dig into this.

>
> - The issue is that AxPROT is wired so that all transactions appear as
>   instructions. This is an SMMU integration problem and happens
>   irrespective of the client device.
>
> - Transactions are _not_ forced to be privileged. That appears to be a
>   mistake earlier in the thread.

Yes, sorry about that. That was my mistake. The information I found
about this issue unfortunately contained that misinformation. Daniel
Mentz corrected this in a follow up email, though. In the next version
I'll use your and Daniel's more verbose description of the issue.

>
> - The reason privilege is interesting is because of Robin's point that
>   the architecture forces privileged XN for unpriviliged W.
>
> So, based on that, I think the instcfg override makes sense.

Ok, great thanks for confirming.

Peter

