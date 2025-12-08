Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD82D3B7F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 14:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Djl8rvrNTarTjqc7P3QXFkVH29nvnZ3byk5D9flUAb8=; b=VHFdSQVDwGXQdSrJwLalkARnuh
	zicr60XYoxTGFniWKOilLqB1bG5bSYmbDfbPRL8ZEzsth/NuGTuLIj2r8iMg1L2MpT/l8ZZUPHZv2
	CtBv4g+xc1NMDYHBj4MSlUycpSriEhmYUOxftzmOfNPSQCE5+sgWngglsQGh/iictsBhNH15KzNgY
	wKHSIoRIXIOvyaaSX2635nQwzbWyXdpQjTcEtdWdV6U8+qD5+aHhgQIEBbrHC58vbs9hpfe90eXfN
	VP+AgS6ETMKFQ4jboDpDJ3OZIKSLI5qnHJAFGPQ0G22dP2wy7MQE4A4BNHYiRD/pDj2aAQSAmEBUF
	J/SiC+6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vScWW-0000000DD1c-2AHd;
	Mon, 08 Dec 2025 14:47:36 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vScWU-0000000DD1D-1qn6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 14:47:35 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-8843ebf2facso66859666d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 06:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765205252; x=1765810052; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Djl8rvrNTarTjqc7P3QXFkVH29nvnZ3byk5D9flUAb8=;
        b=H4HxeFTypJ7Y5RNo7Zm5w9b12/M/BtcU3s4L7M96Ja7ZLqeJasJnCWSpGaH71bAaqt
         EU0nyDFvpT74yW2J38fK9BZxrjpXXunFOUMQDWhueJHhCxDj0UtSAJbAeYjjkaZ7GyBn
         J4/vCIRKvujcNj5BJyMNS2subXJ2g4Z/LSB9OWG/ytLxPzM9gr5co8espftzfQlvzMGA
         UOdDOdD077M/Ve1RYiGnNq4TjpcijEaYbHMSuQlOSrVtVpAAlvW/A1RCLYVGDvXn16ho
         e2PtToQwdNYEpNb+OQPWr7M1ql1ravdjPq/huUwdVNEjshmfYYzJxLNzSWCQv/tlZnR4
         sJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765205252; x=1765810052;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Djl8rvrNTarTjqc7P3QXFkVH29nvnZ3byk5D9flUAb8=;
        b=wgVrspzyR4MoOwX4xcrWYLBWlxbfZJ3nlTaP27jdq/Pd80hi0UhuDLCQjcaoSI2X+j
         Z05fzvfYbhHqu0dBViIgcRVbgaUSngYcKLEBElbBhHg9Lf9U4bHsdjNuvEMtCRCjiYNb
         BWMRUeFQ6XpQuZdVdrlks2GE9xfUi+W33Mtwx3d1zteIoAdx19h676XHNXGvEQnUfzAJ
         e4rdmKSyQxOhHlkow63mSu9d5qM4cAwpL2msJcqCFtpfR6e25xsUXMNGlGQQLFPvF9tE
         Sz732cRmr6CtTw9wpMJVVPwnPAPAgr4c4gJmo2D7ev523CDQ4bwtXUlawrwxjkblEG/a
         WbzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRkA6f0/PoGg/bO/lTY52Aia0/qnEYL9EHngI2n/qaM+WAB96XSt9+2cVJ2z3LuV5wiloE+ZBdgkERB+aR3LRu@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7WQrFix7A1YFi//7ylKX/mRJroJF70pm+nGwNcdLu0BDOMYdu
	EcPGuAy8XLbHEiy83tebyUU5GA8bdB9u+ox1XGS8quBxzelt45+4/IPmTLFRLC/0feaXKCgJ3Nl
	G39CjvnSaVZrt3Qz8T//F6/NGEiQ9mYIprp3QBvQVWA==
X-Gm-Gg: ASbGncsaCS+NL2ncMHd0ZF1EsM/yUDml+eIDHWfdhfGEdi532kG9/duA7ILoNE7xWnm
	YY2ZwH6E5eqlqIpU9K4q0LM32jMK7pujezuXu8ZwaCB0quMPrRQIJlr/MuATDZEiIDK1284VFN9
	9fHRIjRC2VftyFeH1XYaZkXJpsallvv+s9I8aaKEHwLVjRxlkRfNlqZzIen16LSW4YoDWHABzTr
	fZDzCPNtycZ53GHpIZNjiorvb1TKRvN1Rcsz5iFW9mLJDGbu3Wv9iGasFc/5CIOaPkWM32uBllv
	PwZzJp/VaLdA+YWDm2yK5Cn4Gqci6B9U6iWiAb2xoe3VhVQt7mo3mKfUnEk=
X-Google-Smtp-Source: AGHT+IH5SseQKoKB16I67ntJ67GG4BXBTKMzIYCCiw0CsG6rPQA3EtAxNow1MN/zkMLkl2Sb2mR0HkXWihB0+5jKCbY=
X-Received: by 2002:a05:622a:1355:b0:4ee:2420:4f7a with SMTP id
 d75a77b69052e-4f03fd73a6fmr125424381cf.2.1765205252514; Mon, 08 Dec 2025
 06:47:32 -0800 (PST)
MIME-Version: 1.0
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
 <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com>
 <20251203182944.GG724103@e132581.arm.com> <CAJ9a7VjWDBEwdmMf53geACBWGusC8BC3pJuOLETeecw24+N35Q@mail.gmail.com>
 <20251204103151.GK724103@e132581.arm.com> <CAJ9a7VjHHkkTz9XJqjdQ+11_XX9zXuY0ZcQzPtq=Zvi4CN__0A@mail.gmail.com>
 <20251205100432.GO724103@e132581.arm.com>
In-Reply-To: <20251205100432.GO724103@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Mon, 8 Dec 2025 14:47:21 +0000
X-Gm-Features: AQt7F2oAn2-nGLDKAafS-iz_tPYGSdBrMsxU5kNDu5FNNuxHPYo8oNtqnxE74P4
Message-ID: <CAJ9a7Vg9Efi-5eecfiUF82_Qq8Jg9imN5q1-VKYZoPVUxNpjhA@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
To: Leo Yan <leo.yan@arm.com>
Cc: Yingchao Deng <yingchao.deng@oss.qualcomm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, quic_yingdeng@quicinc.com, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Mao Jinlong <quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_064734_516632_BDC28B74 
X-CRM114-Status: GOOD (  35.07  )
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

Hi Leo

On Fri, 5 Dec 2025 at 10:04, Leo Yan <leo.yan@arm.com> wrote:
>
> Hi Mike,
>
> On Thu, Dec 04, 2025 at 04:17:35PM +0000, Mike Leach wrote:
>
> [...]
>
> > The tables in the patch are
> >
> >     [reg_type_array_index] = offset_address;
> >
> > e.g.
> >
> >   [INDEX_CTIINTACK]  = QCOM_CTIINTACK
> >
> > which resolves to
> >
> >  [1] = 0x020
> >
> > where index is constant for a given register type,
> >
> > As far as I can tell what you have suggested above is a table that is
> >
> >   [std_addr_offset] = qcom_addr_offset;
> >
> > e.g.
> >
> > [CTIINTACK]             = QCOM_CTIINTACK,
> >
> > which resolves to
> >
> > [0x10]  = 0x020
> >
> > which does not appear to work correctly?

Sorry - what I mean here is the contiguous array that appears to be in
the source, does not match the reality when compiled into memory - not
that it doesn't work programmatically.

> >
> > The registers are sparsely spread across the memory map, so a simple
> > mapping does not work, even if we divide the original offset by 4 to
> > create a register number.
>
> This should work.  Though the array is not filled for each item, but
> it will return back 0x20 when we access array[0x10], I don't see
> problem here.
>
> > The largest standard offset we have is ITTRIGIN = 0xEF8, so assuming
> > the compiler allows us to sparselly populate the array (which I think
> > it does, along with some padding), we end up with an array of at least
> > 0xEF8 elements, rather then the indexed 21?
>
> I tested locally and did not see the GCC complaint for this approach.
> And this is a global structure with about 16KiB (~4K items x

Which is precisely the issue - why use 16k bytes of space when a pair
of indexed tables will use 21 x 32bit locations per table -> 168 bytes
- 100x smaller!

This space matters little to high end server systems but is much more
important in smaller embedded systems.

Moreover the table + inline helper is more efficient at extracting the
correct offset value. The helper is a simple de-reference - whereas
the helper functions you suggest require the code to make the
comparison at every register access.
The "if qcom ..." may be contained in one place in the source code,
but is called and executed for every access.

Why add inefficiencies, either in footprint or execution?

Regards

Mike


> sizeof(u32)), we don't need to worry about scaling issue as it is
> shared by device instances.
>
> If you dislike this way, then a static function also can fulfill the
> same task, something like:
>
>     static noinline u32 cti_qcom_reg_off(u32 offset)
>     {
>             switch (offset) {
>             CTIINTACK: return QCOM_CTIINTACK;
>             CTIAPPSET: return QCOM_CTIAPPSET;
>             ...
>             default:
>                 WARN(1, "Unknown offset=%u\n", offset);
>                 return 0;
>             }
>
>             /* Should not run here, just for compiling */
>             return 0;
>     }
>
> Thanks,
> Leo



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

