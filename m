Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD62CA5FF6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 11:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4LazPcF/wnlQqrBB0dkwPZ2Jb2xDS0R7wte5tpEq3I=; b=gLLic3/Xs/zSEHq1ra5Yb3e8q/
	7xlR71X5TkHesACuVCdo3JtJqp8igJR2QhUfNp0kd7Q6N+sHn8bYX25o3qUM8Cj1pEi7XT3OGENRj
	haDshAooYBoLdLhLwQgLJC37yL82xAj+i4xMZNJMIddPLJhUxGLLyWNkDouYdcmElOpvngAF7l33V
	o4UABSME+9tQO8XqpMlmxldQnX0wv/8IKd98kHOqsNZNPOLHluanYezU/iKEvhHQ8YO3YzmVvcPrs
	sIHnQDlXoGF+4VBt6rAFXjgHuqNF5gNrAxJS/ewY+UT6hQZX/DW/VXsrY3zalrRqAi81u+GkPDl9R
	aV5DYxiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhn0V-00000001qJt-3jeY;
	Mon, 19 Jan 2026 11:01:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhn0I-00000001qI2-2DKo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 11:01:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768820461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m4LazPcF/wnlQqrBB0dkwPZ2Jb2xDS0R7wte5tpEq3I=;
	b=fq3QRDdoEsVxwNS4c77Koik/Bto4CYx0AvbZb1GpDd6BDHHxpD0oiUPnHDjvBW66gt1fVG
	CgOt93bjAzaCXtPPJx2eAlf2Zy/bzTe5lmT41wNzv9hA7KEl7jcYy8+GDn/ZylUF/WSb41
	4GgYpX8WcWTur86w9vjlhcgoXf3L6Ho=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-T0t1irSbN0mvVaqZ50Z9qQ-1; Mon, 19 Jan 2026 06:01:00 -0500
X-MC-Unique: T0t1irSbN0mvVaqZ50Z9qQ-1
X-Mimecast-MFC-AGG-ID: T0t1irSbN0mvVaqZ50Z9qQ_1768820459
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81f73452300so7861686b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 03:01:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768820459; x=1769425259;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m4LazPcF/wnlQqrBB0dkwPZ2Jb2xDS0R7wte5tpEq3I=;
        b=Y6+spsUWIUVakkdt/DcTkLVUUKWWYVvnZudxScOPKQDtR/QeMhsJ6uljoI1suniGbS
         kH+66LKIQAIoXfxRTm86lH4MQMupF61qF72wH5wP9gzOTssRfpILAnp2ZdvzetGWaXig
         sc9Zlx5DFb6AIHiuWP8REF0i5xaUrgf6RlqU2bgaySEUBEpx75dDYmsnuAP2eaL9kiE9
         seliWUfmWVqX3DYaaq69bWHC2yy7vaiscpt1oJ4hqZ6vV9WbFY4XTEYOO2j+yL4Kx9N9
         GXtTIzbmhtGk1MRLLIB/z2+3MjlPkND6CLgsuxwFN7zs2aLfwnYwli4mBnszGOGEsT2E
         FCag==
X-Forwarded-Encrypted: i=1; AJvYcCW1i61n3R/tIWS1VC/N6gTSnlgi1zRRz1YGOBhYYfQPZQ3iBm7G8hw6yRbXNFwka+S10bh3QrK1Qz93MPAgQtZr@lists.infradead.org
X-Gm-Message-State: AOJu0YzfHV3tkwt3Z4xikraVDPhsYlaCmS95HkwTBagKzer3HTwVNzlO
	E1iIgaIX6aGVXlfyAN6XTkuiSd2HWTskrPAHAV1T263pGpDA8cAJ8atQ9XA3fR9WidICPC9SDJj
	D0c8RB//YvSfbwjob+LnT8v5ruLSLJuDSAFBr/+SW3i7yJppepW9aWdg2A/RPZoiZ/0zVyVHT5T
	lM
X-Gm-Gg: AY/fxX4yr2mGlczro7PLhvaJMSJnlL7bwSacR6hdlLycOKY6cJPQ4IZ8elqhepoarAj
	fV4IroIiKbbpTx7m3af77VOEGDHChLRkf/y22B/XiBL9Xy3JzhoMl13mgHm3s8+ohH5VrRs7rOV
	G5ZuD77rn7/TPFgAVZOh8ZCONARFHZ0JCARd/L3yAAI955W8LSdI/pUuP3IJ+ze+vWfrgF4SzO7
	lYZokF8l1VicVXW2Ja3KFHgG/lLG6FjWDjB23cQ/WnUD9HksCKgi+UOHsN18KFKUbenoXr/pEtD
	9t7g36DiqdI3ypxvO2OtOSjkeFyJNEM6DvA5CxHhAP99OStnsjn0H7iDl1n8PAJikTvb1Ft8zSG
	F
X-Received: by 2002:a05:6a00:368d:b0:81f:3b6e:21be with SMTP id d2e1a72fcca58-81f9f6850b8mr9116596b3a.11.1768820459097;
        Mon, 19 Jan 2026 03:00:59 -0800 (PST)
X-Received: by 2002:a05:6a00:368d:b0:81f:3b6e:21be with SMTP id d2e1a72fcca58-81f9f6850b8mr9116305b3a.11.1768820453951;
        Mon, 19 Jan 2026 03:00:53 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10c03e1sm8433770b3a.22.2026.01.19.03.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 03:00:53 -0800 (PST)
Date: Mon, 19 Jan 2026 18:57:23 +0800
From: Coiby Xu <coxu@redhat.com>
To: Rob Herring <robh@kernel.org>
Cc: kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>, Baoquan he <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, 
	Kairui Song <ryncsn@gmail.com>, Pingfan Liu <kernelfans@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>
Subject: Re: [PATCH] arm64/kdump: pass dm-crypt keys to kdump kernel
Message-ID: <aW4Jq9on_4a5o5o7@Rk>
References: <20251226141116.1379601-1-coxu@redhat.com>
 <CAL_JsqLEsUV34tMZWSMc6w-xDV=M0JpOmS95TxrtbbBMRoD3Jw@mail.gmail.com>
 <aV49pPV3OViTDe8c@Rk>
 <20260114210859.GA3197242-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260114210859.GA3197242-robh@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JT6NasuCmuDdXLfpUz4tUYTyPoumz776G9CGLSyfS8c_1768820459
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_030107_037734_2A7BEAC2 
X-CRM114-Status: GOOD (  34.63  )
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

On Wed, Jan 14, 2026 at 03:08:59PM -0600, Rob Herring wrote:
>On Wed, Jan 07, 2026 at 07:39:24PM +0800, Coiby Xu wrote:
>> On Tue, Jan 06, 2026 at 09:44:37AM -0600, Rob Herring wrote:
>> > On Fri, Dec 26, 2025 at 8:11 AM Coiby Xu <coxu@redhat.com> wrote:
>> > >
>> > > Based on the CONFIG_CRASH_DM_CRYPT feature, this patch adds
>> > > LUKS-encrypted device dump target support to ARM64 by addressing two
>> > > challenges [1],
>> > >  - Kdump kernel may not be able to decrypt the LUKS partition. For some
>> > >    machines, a system administrator may not have a chance to enter the
>> > >    password to decrypt the device in kdump initramfs after the 1st kernel
>> > >    crashes
>> > >
>> > >  - LUKS2 by default use the memory-hard Argon2 key derivation function
>> > >    which is quite memory-consuming compared to the limited memory reserved
>> > >    for kdump.
>> > >
>> > > 1st kernel will add device tree property dmcryptkeys as similar to
>> > > elfcorehdr to pass the memory address of the stored info of dm-crypt
>> > > keys to the kdump kernel.
>> >
>> > Is there not any security issue with putting the key into the DT? The
>> > DT is provided to userspace. There's provisions already to not expose
>> > "security-*" properties to userspace (see __of_add_property_sysfs).
>> > Though I think that has a hole in that the FDT is also provided as-is.
>> > However, I don't even know who or what uses these properties.
>> >
>> > Rob
>>
>> Hi Rob,
>>
>> Thanks for raising the concern! If I understand DT correctly, this
>> property is only accessible to the kexec'ed kdump kernel. A new DT is
>> allocated and set up by of_kexec_alloc_and_setup_fdt. Btw, to be
>> precise, it's putting the memory address where the key is stored but
>> not the key itself into DT. The key is stored in the memory exclusively
>> reserved for kdump. For more info on by who and how this property will
>> used, I've created a dt-schema pull request as suggested by Krzysztof,
>> https://github.com/devicetree-org/dt-schema/pull/181
>
>Okay, that's a bit less sensitive. That still could expose a memory
>address to user space which has generally been locked down in recent
>years. Though I'm not sure we'd consider addresses of blobs passed by
>kexec sensitive or secure.
>
>>
>> And yes, there is no need for even userspace of the kdump kernel to
>> access it. So this idea of "security-*" properties/__of_add_property_sysfs
>> seems desirable. Thanks for bringing it up! I'll give it a try.
>
>Since it is just the memory address, kdump just moving the key would be
>sufficient. Or the property can be removed early on. I think we do that
>with kaslr seed IIRC.

A security-* property is still exposed to user space. I think simply
removing the property is an elegant solution! It's also much simpler
than moving the key. I did a test and somehow wiping the old memory
in read_from_oldmem_iter made it fail to read the keys. So I'll apply
your suggestion of removing the property to next version. Thanks!

>
>Rob
>

-- 
Best regards,
Coiby


