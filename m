Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFCEFED3F0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bkHBfOVa4bz/wCbZfmwZYYdZCO/tCYPxae+JQxak4Yg=; b=0i6Nt6Gh4DhyQa9vM8tx4CVybk
	XME4k+p3+DXbUonknHX470yu7fPSU6hsKVCWx9ZQGnEzEZKzblmlcmfMUOqrQ/zckSTyYfC3lwFGN
	8BZNOkC9Wd9REx7oUSuBAhBrTKcFr6Ues8F/kTttW++a7MLARcI/2MpaH1ODYalHqlJhBq/ZRQe40
	A8ezMEkV0Ev62adbxHz6FilbcJN4yjmk/NeRr76r6taTdDxaakWpCKMIHLylrH32Zb7l4oGN2Pu4v
	N8bxBOvDCOm37r59xztlCr4gI04J4HQVafj6YNwc3lZgFpEUPAd1tb99Qn4NCvF3b/lTxjznzaOjR
	jQKouj3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJKJ-0000000DRq0-3Nti;
	Fri, 24 Apr 2026 16:24:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJKH-0000000DRpH-02Yi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:24:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777047858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bkHBfOVa4bz/wCbZfmwZYYdZCO/tCYPxae+JQxak4Yg=;
	b=eZl25zDnldI79cy46T99uOTd673DqSE3j2FysmQbJamPpWT1+bYhnhXu0ciAPPgimA2OcG
	Lwjqbk1m/+Fj2iobSg00wB8ywT39ue32rH3MCPB5qWPhjYtAyDBWfS9dESKDAbPzROkNcc
	HyPxpHf9CxQ494ziriMuyR2fcay6u+w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-VMBPq8wINb2W1th_eFh3OQ-1; Fri, 24 Apr 2026 12:24:16 -0400
X-MC-Unique: VMBPq8wINb2W1th_eFh3OQ-1
X-Mimecast-MFC-AGG-ID: VMBPq8wINb2W1th_eFh3OQ_1777047855
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43d789cebcfso5509894f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 09:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777047855; x=1777652655;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bkHBfOVa4bz/wCbZfmwZYYdZCO/tCYPxae+JQxak4Yg=;
        b=cKVGiI2jRI8yvMQ2/0Z91YFDLvRpPF2qg43vVnyslFLwtuxWtXSdlxpFRK4e3PwWXl
         IXWuDcyamh2X2/85jHL4OARy00Q3fuiyNplWn8FB+Nzx9e7nj0VwVV1AwAj66srOLjCe
         C4AdlfZWgpvsTS1YPeMp8qjXrltrXjuSGLdfsI7dOSfFx2UmhUgX1W5QuK4C7BnyZX1Y
         hcYF+247xt4+A/0RU8c6ZB+yaLYGPpKj8vZlIBLqmT+DltljI/BqJaagqogg89TsresY
         JOB8PD/HOe8kYr+5HlYnns/s+6klHPcJhiw1wzf/FWLv/GFBDpCetErcsgzNgemKO07g
         XbkA==
X-Gm-Message-State: AOJu0YxcMwfAuTXc37XwApG1QdHxAS2wEAnki0u4i2N7HZX4/vLmlynK
	I0eeT1I4GGDJc0z5AevjqDU8Pcw2TEZiwtSmTVB8gvO+XOOe5rotAneqgsz8fswxGatD63zarQf
	4zImLbaPIVehMtFWAOiUfvamYfsSvamxW2MHdABp/Kfjd5PcjluaM/1nmrjOwXdJ2fF18Iv158l
	Fp
X-Gm-Gg: AeBDiesIAhDMtH4CqnhLbiybskFGJTNArm49GL0Vu8pCDfQe3UG0IWoJe2lehWIkCfu
	aU5jSsPxKpNB4cPRnFzcEk5k82dhC1dI011JvbYJd7es72D+HRhZnAcFDsyW7wXDpqy8OB6q95F
	oiMmV5RXZm4R93adP37qokVt34HehFVF5TLY3OFTaO6xiP754Jy4FW2d+w6WEiKrC7Wzm6sQaku
	4cKs6AHaylx+OmTXIkeGLQLdyC5dcPwQER4cYfS3kp3HdUX4j4n1tP8/a9eplYMxj/bDTNIYkQh
	wvTNKmj/YHDWfStD8RyE+I8tA9DeBMs2TW92lTbAnw1G1FpSsxuS6hHKgqcAYtTijm27atOVfx2
	LoYbzkuPQDuYVXd1QR8KBy0Y6SsNFZdHAty4l9nJICpfwq1/HfqYPeHDmUCYAkoutCEzfu/lsNC
	VH1wIy0ZAGSH8qH/I=
X-Received: by 2002:a05:600c:8b6b:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-488fb8859ddmr427762075e9.2.1777047855231;
        Fri, 24 Apr 2026 09:24:15 -0700 (PDT)
X-Received: by 2002:a05:600c:8b6b:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-488fb8859ddmr427761525e9.2.1777047854742;
        Fri, 24 Apr 2026 09:24:14 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a682588f8sm6272915e9.10.2026.04.24.09.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 09:24:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Ard Biesheuvel <ardb@kernel.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 longli@microsoft.com, Helge Deller <deller@gmx.de>
Cc: linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 3/8] firmware: sysfb: Make CONFIG_SYSFB a
 user-selectable option
In-Reply-To: <0156562f-5fcf-47ce-8fea-03345f2c3fe6@suse.de>
References: <20260402092305.208728-1-tzimmermann@suse.de>
 <20260402092305.208728-4-tzimmermann@suse.de>
 <78f76717-8f1e-41d6-92f7-261df96b84b6@app.fastmail.com>
 <3e466158-c2e5-4e23-934f-dcdbb71ad41f@suse.de>
 <d3d7c545-3b07-4881-a16d-45b6f039de19@app.fastmail.com>
 <001efe27-9cbb-4a89-8d2d-a1f3ae15e505@suse.de>
 <295a43ce-92fb-435d-a82f-d1cfa8f4f28d@app.fastmail.com>
 <0156562f-5fcf-47ce-8fea-03345f2c3fe6@suse.de>
Date: Fri, 24 Apr 2026 18:24:07 +0200
Message-ID: <87se8kjpi0.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: egrNZxrmCI1M6XJrBZitPxFxcVVkwowGup5cxWfHOZs_1777047855
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_092421_108558_C8BCD406 
X-CRM114-Status: GOOD (  17.37  )
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello,

[...]

>>>>>> On Thu, Apr 2, 2026, at 11:09, Thomas Zimmermann wrote:
>>>>>> I don't really like this part of the series and would prefer
>>>>>> to keep CONFIG_SYSFB hidden as much as possible as an x86

I tend to agree with Arnd here, I'm also not seeing that much value on
making this symbol user selectable. For now I would just keep it hidden.

[...]

>> Yes, I saw that as well and don't have an immediate idea for how
>> to best do it. I saw that you already abstracted the access to
>> the screen_info members in drm_sysfb_screen_info.c, which I think
>> is a step in that direction.
>>
>> I also noticed that efidrm is mostly a subset of vesadrm, so
>> in theory they could be merged back into an x86 drm driver
>> along with the drm_sysfb_screen_info helpers, and have a non-x86
>> driver that constructs a drm_sysfb_device directly from the
>> EFI structures.
>
> I would not want to have a unifed driver for all-things-screen_info. The 
> code that can easily be shared is already in the sysfb helpers. But I 
> don't mind adding a separate driver for EFI's Graphics Output Protocol.

I agree. It is much more maintainable if we have dedicated DRM drivers that
use shared helpers, than attempting to have a driver for different platforms.

As Thomas explained, the maintance effort is small on the DRM side and he has
done a lot of work to split simpledrm in efidrm, vesadrm and ofdrm.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


