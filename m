Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599EFD59F55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 16:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Luvxj0VLfiOJMq44JnritBWkaYJg5kfsvYj2fMawU0k=; b=CNt1DxTe3rT8bmuc3fXJyzy4Cs
	bJKVTDq7pCEPvMxnwffR3Oqx7JAFXYb1nmSYLOIk6FuyPTysX9TpkWbbNxvZeJNAmQ5lGNxR8nKgp
	bylfji++E/GCsYKrSPH7aKOmNT5BFwHMcthGwY0DPZBMVv6BO+c+JnHgLtMrbcI9/HVIADQRBrAqd
	lebrVT1Ea+Fz/LUMsjogudxJMuNbHbE3tlsmRkqzCWrqQSoO036h68TNSzuaNlJCxazL1jItUEOHt
	G5fFpPF3+8tD3OzUsP8Hg4RL/j8+YM5wD15ySb8RugyR9aV7UBGoAvwGLlLDG9FjzewPwWM2nlaj5
	x7/43T+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iaJ-00000003y3t-0LQH;
	Wed, 06 Nov 2024 16:08:43 +0000
Received: from mail-pl1-f169.google.com ([209.85.214.169])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iX6-00000003xAe-1fs2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 16:05:25 +0000
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20e6981ca77so72043585ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 08:05:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730909123; x=1731513923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Luvxj0VLfiOJMq44JnritBWkaYJg5kfsvYj2fMawU0k=;
        b=j8Y/s8wcTrFL7JEb21uNdIQBUPjlpDl9mB4tuzTGprvOWttdS2eR9p9rNgaWffmxHZ
         bzH9u+FnMaB3Td/fERLqdQh+tZkNkdiudBPjvvlLBihdu2uvIXx7IaD9TdD24WwvKv74
         gjYPYX38W3WVqqr+6tTvkUizbcmvIfY6+nGvmTKKAb02R+1x/q7Mej/f0hYjb04P4xuK
         WI4Gk1n+Ot8A0b9hiLCtWjT9CRX9uTT1N3waX2JsBSSSB49Fy/Id+a1GbaX0jGpT8aGb
         f8hSiTnvkonBasaD9t+iXuvd16PhqhDjiGh7Wk3HVLgTPUQ1Pr84e9W7mVfo1QegqONE
         on2g==
X-Forwarded-Encrypted: i=1; AJvYcCX0tDLJi3yqxLxTx2I1uNsaSwUDvdTCWlFWA5wKXRvgjLYIAF6h8OotkuOA8hMwW3YgIDCATt+BwVDE9P/Wl8Zo@lists.infradead.org
X-Gm-Message-State: AOJu0YzSobSUq/3jIF1lDbp2KlVILEXsr3fE+FeDjfUpLO1RjVZQ3uAS
	m0VpbKjZ3seEQwSN226BD/cEvb9U5q3l2PEss95JeY5Tnwi2eXbc2QlsSsGW
X-Google-Smtp-Source: AGHT+IGqN+w4IPky+TA68avq1xcHDWrLnXLWGcNEqb+lHzUgWoLGrwx5sr9SnQ1ogPHGuRxHeFbnmg==
X-Received: by 2002:a17:902:f68f:b0:20c:8839:c515 with SMTP id d9443c01a7336-21103ca485bmr325423375ad.56.1730909123048;
        Wed, 06 Nov 2024 08:05:23 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057c7560sm97276685ad.237.2024.11.06.08.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 08:05:22 -0800 (PST)
Date: Thu, 7 Nov 2024 01:05:20 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, lpieralisi@kernel.org,
	robh@kernel.org, bhelgaas@google.com,
	manivannan.sadhasivam@linaro.org, kishon@kernel.org,
	u.kleine-koenig@pengutronix.de, cassel@kernel.org,
	dlemoal@kernel.org, yoshihiro.shimoda.uh@renesas.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH v2 1/2] PCI: keystone: Set mode as RootComplex for
 "ti,keystone-pcie" compatible
Message-ID: <20241106160520.GD2745640@rocinante>
References: <5983ad5e-729d-4cdc-bdb4-d60333410675@ti.com>
 <20241106154945.GA1526156@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106154945.GA1526156@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_080524_466717_9657D1CD 
X-CRM114-Status: GOOD (  19.04  )
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

Hello,

[...]
> > I suppose that "data->mode" will default to zero for v3.65a prior to
> > this commit, corresponding to "DW_PCIE_UNKNOWN_TYPE" rather than the
> > correct value of "DW_PCIE_RC_TYPE". Since I don't have an SoC with the
> > v3.65a version of the controller, I cannot test it out, but I presume
> > that the "INVALID device type 0" error will be displayed. Though the probe
> > will not fail since the "default" case doesn't return an error code, the
> > controller probably will not be functional as the configuration associated
> > with the "DW_PCIE_RC_TYPE" case has been skipped. Hence, I believe that
> > this fix should be backported.
> 
> I guess nobody really cares too much since it's been broken for almost
> four years.
> 
> But indeed, sounds like it should have a stable tag and maybe a commit
> log hint about what the failure looks like.

Added Cc for stable releases.  Siddharth, let me know how to update the
commit log per Bjorn feedback, so I can do it directly on the branch.

Thank you!

	Krzysztof

