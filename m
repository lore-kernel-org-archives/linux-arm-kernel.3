Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A361FC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 01:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dq2fKZpF2ZHXoWdO/QCS/aYMwaYmBqIaG3WsHfdgCQk=; b=j9rJCmTFJbiulVNnPhzOKTLMHc
	DnFP2oNcoLpsKfuXl+Lx9f7V4aoolCptjc81fYtCcPAd7q5tMiEDnpqVq0WRdgN0aMNy9BZS/i9BP
	fv9TwcTKZa1AhSwyVSWnqa0+d/Ytvl4PlsjlnoQsjy/y2LrwGq8laHo9DVcl34Nrce9nTF/vi7TeL
	K6VGq/TmBeTikbsT0Kin77mFkZVIeiN+l+dwqM0FF+90MvtOLE0DAdLMFmGZIQhN0gvrKmPU7Zt3B
	lrjIOoYkfKP/UgCbzjHNi2Mp2xp/r5UhgnDkWFoAVVIUHwgcUxJXdLLC2x5kHZ8UO7Z6wKL1p6KNE
	Kx5UeD2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x70dz-0000000AOZ2-2FVY;
	Thu, 17 Sep 2026 01:10:31 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x70dx-0000000AOXr-1gJh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 01:10:30 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so242981a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 18:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789607428; x=1790212228; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dq2fKZpF2ZHXoWdO/QCS/aYMwaYmBqIaG3WsHfdgCQk=;
        b=NZMOtfFkqe7J9MALwpuPSepc3I59AYiVg8silMsszfy/fwzyqwO+ThZO/XXdE3g3pH
         XObWh2D6Zg2SqKRXVJRw+MnrAMEtaFOXxAGym2eZoKx7TOQNek5Tclp+Y+FiVKSMU15N
         hnVfAJsVBGc/bP8WQ+IvKmTJPkQZLLRbDZBzATGCJE/1qAXFF6h4xA4MOSUYEjXKf1zt
         /efbYhXo7+ioPILTNFNHqOJ9iY4A4k517ClrFxfGyDp2YGj8I3jm1Jns423lM+VpPKFy
         LNGJnSs2vIAJC8DdYhY7wEjSvp1izX4kj1qciDrj7fPasnl85W/5kebJyIExoSYkRqve
         7qcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789607428; x=1790212228;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dq2fKZpF2ZHXoWdO/QCS/aYMwaYmBqIaG3WsHfdgCQk=;
        b=SDyJ2OX6QmxRyN3jRtQekwlRVfX/eCEC1BGtKZs6SBDI2zPa3q/bDvUco0y0xiQCH2
         igXXduIJ6mhTyVZy2NCB1Z0+8DhRpZpWHHsps75Xx4KqdApkfQ4HPLOEJ+Hhapcb1R+9
         xUojUxu/FIA/vf/AAMqQDX8ejcO90YFLIdiDulw31zsnOY7iLQgcFNTtXJYdWi4dzmVm
         tf5lvlIptnnNS4tSToq+YuqGCbPWLYPSnO2ZT6cLwIpGxasyWh0cHEQ8C0QjQhkQJu1y
         a2x0TBntauagxKKARsKlQjNLPucdkLCHcT2nHw4DBW2b8XERaYFl/pHmk3vCQwOOILev
         228A==
X-Forwarded-Encrypted: i=1; AKwUvByq19az3Z6vE3o2hY+jekIor/iMApjl/WwyI6ht/Rg6R8rVZOa1hnrwK9NAlVLvsSimjZq+NS8+OFVJktm6Xn7h@lists.infradead.org
X-Gm-Message-State: AFuF++l9v/Evr+NxDh/GLLaO8B8q1H+k6brfqz4H5A9AsjIk30hLT8bk
	+ePPk1WQbkA75okbqf19QuH9YaST6Lk9oCOX8OoG1zxlOc5AG2U8GQZa
X-Gm-Gg: AYBFou1B3sOUurW8N9yIGSUmTkGxRDY3pz4uDRhz6yzYODMXi3DrRx0p+Wuu1y8MerY
	809l4DhfAkcvf7U72ed6sS4h3rRxLA5XoKH5CP4UZPegUdoHCFhjdwnBZ2t3vXUtkPpDntA/qOZ
	uDbIEr06nKhNCjIqYmZ1So3uftFDcka7imNplQyz2d6oinWpzSRAFvQKXTQXkUSJ1qV0jGphgHi
	yyild/aoGgzC88jfkVxiA45JbZbH02cIV3K8dcKvTSkwn8Z2nFosOOKtbuBY/+ox08UOSjrFqyj
	FpyMSJ/I/3/WvKKnUmQwjpOyg4xRJYK7qE2Re6hGuBMCPFjZj1cPzotb9VU7aRUJ+pcLDvtS4Nc
	GSvZRWuDEKTHdO/Trz3R4xQWljLfdiRBJ/3hSPW90KbbSAAwjaIZnWcn6GuzUn7PXm6zu8G0yM6
	k+X4vQFH0BJmzOuRpeYtmozbw+g6kqotYNPX6osYwcnhUDiBHhFFDBlU2VWYAADQ1u2NbHUpkVJ
	CvTzkbiW8/n
X-Received: by 2002:a17:90b:5785:b0:39d:6f12:fd47 with SMTP id 98e67ed59e1d1-39e1e50f73cmr14917254a91.20.1789607428438;
        Wed, 16 Sep 2026 18:10:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3909d02asm353486a91.0.2026.09.16.18.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 18:10:27 -0700 (PDT)
Date: Wed, 16 Sep 2026 18:10:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 4/8] watchdog: mediatek: Add support for mt8167
 toprgu/watchdog
Message-ID: <befea2ce-e4a5-4bc0-ba01-d18c4a236667@roeck-us.net>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
 <20260908174259.9009-5-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908174259.9009-5-l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_181029_441639_2D5930B8 
X-CRM114-Status: GOOD (  13.10  )
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

On Tue, Sep 08, 2026 at 07:38:31PM +0200, Luca Leonardo Scorcia wrote:
> Add support for the Top Reset Generation Unit/Watchdog Timer found on
> mt8167.
> 
> Since according to its data sheet mt8167 toprgu reset bits are not
> contiguous, add support for a reset table to the driver. This lets us
> define reset identifiers as contiguous indexes in the binding headers.
> 
> Also address a preexisting Sashiko finding that noticed that the
> has_swsysrst_en configuration was set after the reset controller
> registration.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Applied.

Thanks,
Guenter

