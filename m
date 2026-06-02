Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DFECD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 18:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tbha56/7IbU9o6lT6g3eE33GSrujKbwp5wEl1xMrKQA=; b=bkSpaH1CoEg4mBEXLjaKZP5Tmt
	7TdJJX34MidEyWyrNSX5nr/STC3SZTNdq5NlRJ/1SSnvA10ggafFfqIjHnOJdR3Ykpolzp5WRiSdn
	kMp3+DfLSXcsOsccZg79+2z6FvixqFYkYFtnX81fHEFC+HbQZDDhgf80sJQOharBvnuVfGHZv4z3V
	6DJD3fevLne+BkW9zW/jEt89uqHHY2RRDCvzX7ml6dQbmsJ7g8G266Z4xfPoN/SbuEKvU7pIxGrmo
	/gaAcaJlSgsqWTE+mHPT5x6Wuct6plvTVT1OREyoNIM7t8WKktLrwyClOmfiFt6eZmVB/VyAuD7I2
	h5lc0sFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUTlp-0000000Ddat-1Ymb;
	Tue, 02 Jun 2026 18:23:21 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUTlm-0000000DdaN-2y58
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 18:23:20 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-8ccce57762cso66320486d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 11:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780424597; x=1781029397; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tbha56/7IbU9o6lT6g3eE33GSrujKbwp5wEl1xMrKQA=;
        b=EAtTM/fyknmvdV32DkMjn43JxzYh6sluXFYFVB2Uwfi/VbzB/UIffTb3yt1LZb/iaI
         +yl00KGAG+lhCLh+KVieJ0FphUEYZZDCluMeyIA8a5nyTnukBc+7eKrR8500RBK2S6AH
         YUDty2AalZJ+03ggeDrgn8qPI8Jn58RggMlvQmlyqX+vzPobwh26r2as3Z7rKpGCd5h6
         p2mx+mwZpaX22TX9Bx0uZGnhWyytIWhaQUuvnCkEkDE9PIbGsTbstzGnIn6ZK308Tkmv
         bozIkEi8YetCt7NDJ9/BDiaPvSTEuyIPuNJ4EDnuJ/Gm9FshNcGneLzYoZPP5nP38l0R
         TYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780424597; x=1781029397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbha56/7IbU9o6lT6g3eE33GSrujKbwp5wEl1xMrKQA=;
        b=FfmCmkN2dctf8exWZEb2YSzQc7WN3Herq8nF7/sl0TI1sMVfbpsKLkUO0GFV8mnyCO
         LI6yjKEys4jpFBDQlnSYMqG9JASC68zCVIH5o6svx1oKTcd45zCF6czb4b6me80KUm/p
         y1yhfLdLTWUZvFDKe39cQ6YiLh/vfhZms+RFnB16fvYrHFnOEO5zE1iNiEynRUJJJU2l
         1rkuVk5qIVoRuFvzYrOn6h10WiOzwF+3yoirvriJxhPtzDBONH+Pxfy6DP8Ij8N19gMR
         1dp+rH3zC/WCE340JtufkSa6bBroinO3d7nE91kmWMwK2/KKxf+Vu7EkN3yOZsxdqexn
         zUyw==
X-Forwarded-Encrypted: i=1; AFNElJ9SH4f/xbff4yXlS84xl2QyrcrXrZFBEMllgaTN6qRajnKX/HtkxRDhe9zKO1aCBS9Er9Z1qfgF81/RlHzt9/js@lists.infradead.org
X-Gm-Message-State: AOJu0Yxie//u0f8PzsZz1Y1kNczyWtFqlPBCMamerkJlidFhauXg6MGl
	lcHDu9fmxc/HCnuJOBoFZmDGw5VOV3UjzZQU1/t9IidmBKaVyA2+8ocstvxr3dtU1pK1MNo3ce1
	CPsvb
X-Gm-Gg: Acq92OEnjmfl/+qyTwveeLFXaAcJdPICYHdv20mHbYfwVQZPu1OIoIIwySdOxV4l+dF
	grYIAk/v2/bAv1X+IqbenT8L2ovQIrTU4VB0/UBqJiGcOrnCZj2W1XAKKYo0GvrixYpR0mhFPgo
	GNYiNjNjtyLx7wtjWq9EA4rCFRnox/0MKKEjJrLN6gqAuxTPlZRdYDOf4v7+4Fx/I6FH6BJTedP
	/apv5YCm3pL/pY2LnvM4N32Od47fNA0eiF39gJFnu6SZQntozBesnDHawCjn4SrR+Dji5cflhxD
	G/5wQvf+kt6fS26RydP/D9jyvitA0TetoD9nuzheqC6Lsm6ZahL9+fAn0C5ylnpJK3IyVsleAcH
	ZIxF1u8T7SJ93R7tNQTgNp3S+CYpg7esY2C2uX2C6Hf1SlY4N6eHYvmwZPd+4nEwGJb5JIilrOM
	1WiNlO2bRlqCgkrizwCvR+4OMJKD3PbVqG4K6T3fp/zeU+7dBlqV/ucStAMc/WYicheUethcscu
	5qA12pK3loT2ASx
X-Received: by 2002:a05:6214:300b:b0:8cc:f3e7:7c1d with SMTP id 6a1803df08f44-8cecb3420aemr11414386d6.32.1780424596822;
        Tue, 02 Jun 2026 11:23:16 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea2587a5sm134235176d6.46.2026.06.02.11.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 11:23:16 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wUTlj-00000004Mz7-1ui4;
	Tue, 02 Jun 2026 15:23:15 -0300
Date: Tue, 2 Jun 2026 15:23:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: Ashish Mhetre <amhetre@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, nicolinc@nvidia.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 0/3] iommu/arm-smmu-v3: Tegra264 invalidation
 workaround
Message-ID: <20260602182315.GH2487554@ziepe.ca>
References: <20260601104845.995005-1-amhetre@nvidia.com>
 <ah8FYa0hdkkAFQVp@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah8FYa0hdkkAFQVp@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_112318_822375_50E4CB90 
X-CRM114-Status: GOOD (  14.10  )
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

On Tue, Jun 02, 2026 at 04:31:29PM +0000, Mostafa Saleh wrote:
> On Mon, Jun 01, 2026 at 10:48:42AM +0000, Ashish Mhetre wrote:
> > Nvidia Tegra264 SMMUs are affected by an erratum where a TLB entry can
> > survive an invalidation that races with concurrent traffic targeting
> > the same entry. The hardware-recommended software workaround is to
> > issue every CFGI/TLBI command (each followed by CMD_SYNC) twice. The
> > second issue must execute only after the first issue's CMD_SYNC has
> > completed, giving the sequence:
> 
> This seems quite intrusive, will the TLB entry survive if you push a
> full invalidation instead?

It's 36 lines and completely contained to the insides of the command
sumbissions code??

Stuff like this is why I was guiding you to use the more code exactly
as is for pkvm. Historically there have been many invalidation related
errata, and invalidate twice seems to be a theme in fixing many of
them.

Jason

