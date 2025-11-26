Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1116AD11186
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 17:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o60MW7S69uuqBYywy0KQnM0R58oP3Hl+TM2jep19u1Y=; b=kLvFEHKEtw1vcprkrT6Mn5BzpZ
	nQuqBBPu1Fvl+TgeOCjVSLgCIKPTc5G+ydh4WCiBFcdv1uDmVHIVgXxxTHzMe2cdXpD+pVWCGGbbZ
	4422V/m04LYTKkwq+uFRt3CawKa9vOfy34iy6YhxibCiy0X32G68ZppZo0yJ4gDPhtbxE9lBKCx8g
	zxfrfEfz0vp4dr1KaWcbMxcAc3aCcE+fX4Xg2FRnUSjPcTy+2A7Xe1gGS5WnWlD6qSsjV4KvR0HhI
	MutTgDEHLbGJKnAZ6oPBqrbLURqnx50EOxA3+ye4FW/w008yceWjylZ3EjWkYyOFLNHa263W9YWCb
	KL77D5Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIyK-0000000FMlz-04jm;
	Wed, 26 Nov 2025 17:06:28 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIyH-0000000FMlP-2tLK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 17:06:26 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4ee243b98caso306551cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 09:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764176784; x=1764781584; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o60MW7S69uuqBYywy0KQnM0R58oP3Hl+TM2jep19u1Y=;
        b=UlVtHqE6Z1XuoUPPu8Em73dOgD0owGBMiFWhgqpo5B04E9vyUv7wC0diMhWHRvPrh0
         avp6TpImUpUVnNxcys88bCwp1HayTo/VCErCZSVkNQgpex13A4mX5WZkz9CA7bjex4YV
         zrs3+OkGWSfgac0iDD4aSW1i6OWzahATbiHsFmTxVHFhyGB0eaQs4menN/6jAiJrYAVv
         rTBYr5lYw7ddytkrwv6Jg1Xd6UbQtusk1gwgTX7ncOCT0LvTPAshfkv3cNq5zZnCZN1f
         sW0qs8CiJ5zgLU9NQQGxZQ68SC+Ywmd1L1Ec2YqO4fiuTEGBbfNI9sKfuf2kQW7UVOSJ
         PAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176784; x=1764781584;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o60MW7S69uuqBYywy0KQnM0R58oP3Hl+TM2jep19u1Y=;
        b=I2jdgkxcRbX6uFT6bUSoMnHt8/qIqnLbAd5iK6gvO7FiUouh9t7WB9CpB+ZxC1uqBM
         RBs9N6MafPuIO70Z4nw9YYsWQLTjWlb206cTtC1kw7pcw6U69gNcH7MteMfkf0Pof/NJ
         ZfWJasLXERVZzoCWFsPuZPeLKUO5klJGg4ZRP5CDIwiE+SnIzyvgA1pA4OnlkfDYfeSd
         paV/Swrrmk3624pwJm92XTIP1rjru9OuMtuvPoq3Su1iafxx7kt7KxiLpEiscnMzRuMz
         z+La+MBFeWaZNdRSlG5UtrGQD+ZEdUyes4hP0ek+/ktZ8qnmaSLIGZ70+lYQdgwpJkw3
         C5XQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1zIvfp0U30hIYyONhqpsirZu1g1xRVYpKRMs07OvLbEEyDBzdyI2/A7UBdLqUmxfSRAEWZvFLAHOXVhxnO17H@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa9AGS3Isvu+kgXVv/Hrpx+0xTjwbbcJDyx1KaZV/BvSilqkvF
	OCxUssUMOSxBJrgSTUUx+ohN/WwKeLa7xOKEnkiMCEr8Q2+7ospqUB7nMGnXVYk5OBrxnFSdd5O
	jYGAEtwy0KGGWEEek6BQ7m003cqaUUc75q6bGIC3w
X-Gm-Gg: ASbGnct5r2b8ZWDMK/dBbSfiY0uJxXw+xyJeCaJ4q+dQ/aC0BpAkn+qeiXbFGbz/Lk0
	KKehophgjM6nRA7LdNzsacYEqkd4h+js11iL+Au8i3PVBbnwVcJQRtBV7MpX/3t1C+fnu+syHEz
	wePxuy1B4zLM8O8SzM49UZvFSv2tc/12qDNbsm/0OAVb3oj+zP+r80Hq2CFQfKbO5EcIeHvy6ly
	W4GUpWYIo+OOikYMEnJub6ZWO3gg3cMeIKzqCv7lK3HaLmJ/kLF1JN0MrDBuXp4TilPYwk=
X-Google-Smtp-Source: AGHT+IH9tnAOFqfHE1ZUeq9aGNT99DojsOvMG9Z95k/L2aVsl+KbVPrslR7MPF1R0Fo4pkQWgFDJOxqw7DlE+AJKQwI=
X-Received: by 2002:a05:622a:1496:b0:4ed:b665:3779 with SMTP id
 d75a77b69052e-4efc6c8b73bmr5092981cf.16.1764176784132; Wed, 26 Nov 2025
 09:06:24 -0800 (PST)
MIME-Version: 1.0
References: <20251118103807.707500-1-tabba@google.com> <20251118103807.707500-6-tabba@google.com>
 <867bvdqd4m.wl-maz@kernel.org> <CA+EHjTxPxscVZryCoVAZYebgD82waEKiv0Z-CFG6H+CW3dAbXQ@mail.gmail.com>
 <864iqgrek1.wl-maz@kernel.org>
In-Reply-To: <864iqgrek1.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 26 Nov 2025 17:05:47 +0000
X-Gm-Features: AWmQ_blQ8brwZqwItq1-TvVlfw6eYa-PZX9_b2kaFWro8aZCC6KtramSGHgSbtw
Message-ID: <CA+EHjTxJtxvJYCmaen8SgVVECeRZym90_m+AgJZ9txoswDsgSQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] KVM: arm64: Include VM type when checking VM
 capabilities in pKVM
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	vladimir.murzin@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_090625_747704_36D0E47A 
X-CRM114-Status: GOOD (  17.44  )
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

On Wed, 26 Nov 2025 at 15:36, Marc Zyngier <maz@kernel.org> wrote:
>
> On Wed, 26 Nov 2025 11:00:47 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > Hi Marc,
> >
> > I agree, but I don't think this patch changes this behavior. Later on
> > in this series we expand the check to apply to non-protected VMs to
> > also restrict features that are not allowed in protected mode in
> > general -- something that until this series we didn't have.
>
> Ah, you are correct. Apologies for being so thick.
>
> Still, I think we need to do something here -- the whole extension
> check without context is just broken.

I agree, but should we handle that in another series, since I don't
think that there's a straightfoward solution for this?

Cheers,
/fiad

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

