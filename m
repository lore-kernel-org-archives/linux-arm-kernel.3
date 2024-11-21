Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42443D6E2A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 10:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RS5Hs2w0z8GYAD0nMVEYMTgAAwiFwMjKEdDralf7cns=; b=u+Gl0ruBms4MasYLpg3qgDqtSC
	C+ffDYuzrOar+IbA7jVd6QBA2WWn92rJsOsMOfOKjQeXh+hxVnN4/Xw+GoYpliT6YjwLdKPbbuXIw
	1utuBp3aIbypeRE6tb6d+SqFa3dQFQcdjWtAFj81AK09w+VzviQ0Xvlar2AidxRtG3E+mNclSoap6
	1EHnjzEuZv+V7Ik7RimilOfXDuxtnZR/266LL4nmB84P4bF0xVM/iJVkGxRbPXx3jaun3WoSV4dYd
	fjK8M34aoipBQn7AUX6I3qG73FOsvg0u8S8iLjHjh7gM8lVVjsIdchtF8XtY3eDW9+lHvnOeftUf2
	Qy+1S4yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE49f-0000000HK48-1q2D;
	Thu, 21 Nov 2024 10:11:19 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE48j-0000000HJxZ-05jt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 10:10:22 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so1131386e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Nov 2024 02:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732183819; x=1732788619; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RS5Hs2w0z8GYAD0nMVEYMTgAAwiFwMjKEdDralf7cns=;
        b=bLu9Ft9H8LwoGAmnxBSiLSRNWtKukphq5kwoUGf8g+SugdH4W2efrPiRD4uag0uBMp
         u8vs+taVxwvUHA5l7rUbT3SelTet2o+fjc7fdq+HQJqMNJ/JRp29EIouSgZZ4KHk2oTE
         HxHvk3o7i4r4eQMTC6I94tmyv2W5b/GnaSrZGRlRc+bS+YRAhXo09NOjYo3EU+EIzJVU
         jy8WIl35ZCbpPm7OyIHdMQ0UMhWx9mI7v6y6Z0YfHNplhGY2hXw7bdA1pOxQ+58zdc2S
         DRupeWeoAEMr4XosCZYkeJGxlCYVzx77WylJgFJ806SfjkBePVppHcZf6Xiqpuh1Vdce
         c4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732183819; x=1732788619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RS5Hs2w0z8GYAD0nMVEYMTgAAwiFwMjKEdDralf7cns=;
        b=vWlnKHr1VDd/DA4NC828iyrDl/jFOfJmRp8QRRP8XWweStv/c7qYU3044MIhjgzDNg
         shHynUEtp9J/aCVa+PMhyJc268ALvJeEDEVwxbJmgsDqbP38dPWNzkaF8UO6/U6Sm85d
         F9GXnHJ5y+wOH+G9NZCqedtwZcT2GVARQqpNoMAIeMVWCSI94NKD8DsMeBpVEeSaIZDF
         dTD3uclsTKRKT3zSmHdfi4pVbh+YyLtZ0yJhJdiYW2UrTg6jz9dE+wf7IW+f2q9Yb2LA
         wXusVxslXxi3PRiXpaEXR6HoBLpTO4aSBZVfNqWTcSZ8NzRqbsy+J56MxfJifR/WT6f5
         1TGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWtc8dWxbTmt/mOIaOeO0YKMB+H3j4a8wWtsVZlCpDn486OcFC+jcZsRq/orXDWGy82CUMo09kELFGjmoW3rsV@lists.infradead.org
X-Gm-Message-State: AOJu0YzzaNdMzDqy5iyavE0P8r1IHB9gpWs3MMsizEePgyt8J9Iea8CA
	jrW/Ib3kENxDxdGZNGt7Z1xCbaQQB+FmM9D6ddJyU2Pf6ia6go9xa94lCLneZA==
X-Google-Smtp-Source: AGHT+IHkiSNPA+QGDLKCuSwgtQUmmyBPeJbea/alPoOjAHHscS7MrZ/jLyvmJqypRsXk+rlet92klg==
X-Received: by 2002:a05:6512:2209:b0:53b:1fd1:df34 with SMTP id 2adb3069b0e04-53dc1363785mr5058086e87.45.1732183818934;
        Thu, 21 Nov 2024 02:10:18 -0800 (PST)
Received: from google.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa4f42d49c4sm63280866b.123.2024.11.21.02.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 02:10:18 -0800 (PST)
Date: Thu, 21 Nov 2024 10:10:15 +0000
From: Quentin Perret <qperret@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org,
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org
Subject: Re: [PATCH v1 10/12] KVM: arm64: Calculate cptr_el2 traps on
 activating traps
Message-ID: <Zz8HB8KQtUyj8d9O@google.com>
References: <20241120105254.2842020-1-tabba@google.com>
 <20241120105254.2842020-11-tabba@google.com>
 <Zz7wBU3BHW-XNnbr@google.com>
 <CA+EHjTyGzjOnVnyqfS6LO5=_EhQY3CS18HyrnSmnfNF483yz6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTyGzjOnVnyqfS6LO5=_EhQY3CS18HyrnSmnfNF483yz6w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_021021_060410_AF9EB91C 
X-CRM114-Status: GOOD (  13.57  )
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

On Thursday 21 Nov 2024 at 09:41:46 (+0000), Fuad Tabba wrote:
> Hi Quentin,
> 
> On Thu, 21 Nov 2024 at 08:32, Quentin Perret <qperret@google.com> wrote:
> >
> > Hi Fuad,
> >
> > On Wednesday 20 Nov 2024 at 10:52:52 (+0000), Fuad Tabba wrote:
> > > -static void pvm_init_traps_cptr(struct kvm_vcpu *vcpu)
> > > -{
> > > -     struct kvm *kvm = vcpu->kvm;
> > > -     u64 val = vcpu->arch.cptr_el2;
> > > -
> > > -     if (!has_hvhe()) {
> > > -             val |= CPTR_NVHE_EL2_RES1;
> > > -             val &= ~(CPTR_NVHE_EL2_RES0);
> > > -     }
> >
> > To be on the safe side, should keep the RES1 stuff for nVHE?
> 
> Sure. My thinking in removing this is that, once consolidated, it
> would be easy to spot whether we could be clearing the wrong bit. But
> I could reintroduce this when I respin.

Actually, my bad, while checking how this worked for nVHE prior to your
patch I've realised kvm_get_reset_cptr_el2() was already setting those
bits correctly, which is arguably the right place to do it.

Thanks,
Quentin

