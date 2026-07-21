Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45247C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 16:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZ3n3CdOMEFHPEcP0edo4YZhgg3xpqPwg4esUDVoRBk=; b=Wv5XG0v6MitmU7TvfLT4voHbnW
	owu/8LDWYD9PUpCGuySaTWgblAuOA0MeatQ8T3VZqzjx/vpO2xGnJIqnQi71XpQ1RBtyP7ztnLfGB
	4kcxjKNqAFQ6vV6QYmFuyjl/Qfq1Vk8TtExZlh+0B9vVHFO9ukOmPVVu3ZGOKbcjbWf9Wl30iw99m
	EogRuzExnBTe2M0Xnu7s220A9nWgsQZYIt2fP6KUnqgv0DgaSJsDjPu+Ypn1kc4FateI3oKafFskh
	TkysZ+Et6kBaT7Dm8iQey4VEgsyYElb7eIj6+SYyLtOelHjzK3UuAKlGutCirCVyMFW8bdcI1z22f
	0rPGvMTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDHa-00000009ulp-11p4;
	Tue, 21 Jul 2026 16:25:26 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDHR-00000009uXE-0o7Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 16:25:21 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-84830c774a0so6333210b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 09:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784651116; x=1785255916; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eZ3n3CdOMEFHPEcP0edo4YZhgg3xpqPwg4esUDVoRBk=;
        b=RRz7svDO6mQ69e5cwHcwbwspOSBQIjpBz4BvEML9UoCug4wKQAq2b9wQqWTQO0hhxj
         1dSpqd9Ryxs5WKRuu8oCrUCBg3nCLfSWAVMkOfoIDhbvqDjelAhlEWDWe9g+8I84qdsP
         vFXICpfuSPyiWgOLppx1C6iQhmbhbB0synb6iFloJkNprdRBmUqC/XmFCI3mqjg9TPe5
         G5NhCV6XRt8CE7dI8hfi00iG5HrrefrekJHiJ2ixXtIx6JSxucZbkpq5dqB3ePJ6YmrI
         bEc9Bxy139SyVx9v/y+74GZLVXV0XsqdZL781njZWKRbZWW08M4fz7CD2iI17tedqwCx
         LRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784651116; x=1785255916;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eZ3n3CdOMEFHPEcP0edo4YZhgg3xpqPwg4esUDVoRBk=;
        b=dsj5ZNnA1WwFXjciKTHWqEn14/IU8lZ/aIS20RNKPQHUAtlBB/lxsvTEzt9KmAB/1b
         NegNHzBZI7nax59uEeo8SB4YzzGvyh7I7jh8+9gpkF5u1pd1guBdBq0HMNDJwfngrCeT
         T+yF/60H77eOuD6qphAxxTrebsQD/cUjLGWfrTNJuoaB/DCK+ZWxZv8VJAVIUWZy89du
         dhkzYR97knE4vTnd9JEm4/47UuSRAqsIuW0Kf90DewizNfWGmRSB3r6A6WHgQe9quLhg
         NLb3204BRHyoCGHP2SWGnw4uEFxdYbEAT/ZqGm/hoe6Gp/b+cDSJIaZgkklHGC8uLB2A
         mTUQ==
X-Forwarded-Encrypted: i=1; AHgh+RrzxjmlKe24eB94cffty/jf/3LX+/cOmb6On9j3FS8i8hzXcMRp5ZLHe46D7iW4hZtEf+j1t/Qa4IZVBp7ebEEC@lists.infradead.org
X-Gm-Message-State: AOJu0Yy48OMCQMxDIqEDSUJA6DbAHvj6YdUxQzgJRKRfbtW7giufYIAS
	9j5e4dIB+jak+qTnLY4Bf80iOwQ40qvdxWBvtE3ECOwn2hGDLjR4SGhb
X-Gm-Gg: AR+sD13AMbiES5j7pr4V6ZmobxRhbkygyf+6HbYhjg8cikteQqsiDB9+kgYHL38dT8c
	2R9ztVen4dRASv1zs9suGuAv2DnhoCI3aVnYl7iyucKEHVEb40FxSu9UE8wX8WeszbSjA5ll5uj
	9dmoR4RFe+kaanPFkw9V1rd7O+opw5EqoFsfratQ0LVUAbwRryCSnx80mLPyzv8xLl+MD7VjyW8
	lZ+0Byko8ZP71Mlgi7qcGlUznUDRGYdv/0lL6t4EZspMGBPCA47hezsTIq5h113zy09EGiVGKnd
	fZO3x3fmJvsVaXEKEX67NLAA3rX4Jp+w7jcoZNkaCbRD4tbFoCb+uptP11vEHYk5YLH23eej6EH
	7BgwbT9rOOKVNv1JIFXFDR2og2+1XOnpnBRQCOcl6NoNQLMQ87Yl2OjryHpVBbyo6GkEk/3WB
X-Received: by 2002:a05:6a00:1708:b0:848:2e53:3f63 with SMTP id d2e1a72fcca58-84c292743ecmr19202537b3a.21.1784651115769;
        Tue, 21 Jul 2026 09:25:15 -0700 (PDT)
Received: from localhost ([172.216.252.18])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adc3466sm8021278b3a.15.2026.07.21.09.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 09:25:14 -0700 (PDT)
Date: Tue, 21 Jul 2026 19:25:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jared Kangas <jkangas@redhat.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8] arm64: dts: s32g: Add GPR syscon region
Message-ID: <al-dY5TA9jiR8706@stanley.mountain>
References: <20260721-upstream-s32g-gpr-syscon-v8-1-49c308536aa6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-upstream-s32g-gpr-syscon-v8-1-49c308536aa6@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_092517_246091_4A018BAF 
X-CRM114-Status: GOOD (  10.40  )
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

On Tue, Jul 21, 2026 at 09:12:41AM -0700, Jared Kangas wrote:
> From: Dan Carpenter <error27@gmail.com>
> 
> Add the GPR syscon region for the s32 chipset.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> [jkangas@redhat.com: GPR syscon resized from 0x3000 to 0x100]
> Signed-off-by: Jared Kangas <jkangas@redhat.com>
> ---

Thanks, Jared!

regards,
dan carpenter


