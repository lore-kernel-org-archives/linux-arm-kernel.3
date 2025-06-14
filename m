Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75E5C71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 02:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=muvH186xbp1wZouT3DAGJVB1Ry12NAmcqUPQ49mvjxQ=; b=XGpaxqKumcUqSLCLNgWxASXJSg
	ZCBq8PGDpVqnP9Tr+0eTah1sZGXThtNDTO3D6LkmYZQvL81GvkCC3euzs0feNYOGGTKTzctIfJezb
	PmNIO5tT2lFSZc2gekPZJQ39snvGQI+RXF0v8jpeoQR+rJ4BXvVJ3H1pmx1NuAudMC+oMZOat7YcG
	b9/R+2WFDD67u6p51EZ0T+Q5BdzQh1uehQsOlzd/SQpPZaYdm7xWcYxoyNYl4vkYpK6LUAcsjjIjf
	dEApNqQzq+HClBWof2MA4Lk2e9TH/hfEymvXGSXyeF0d+di9LFSwQHmK3ZxS3btwAzdzFhNWVaO7B
	DNkIIFDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQGiK-00000000Xm2-1b9K;
	Sat, 14 Jun 2025 02:33:48 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQGg9-00000000Xd5-41xo;
	Sat, 14 Jun 2025 02:31:35 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-879d2e419b9so3068990a12.2;
        Fri, 13 Jun 2025 19:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749868293; x=1750473093; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=muvH186xbp1wZouT3DAGJVB1Ry12NAmcqUPQ49mvjxQ=;
        b=Pkayy9jIkmePg+DKe+xLLmjmuI6hqsvMjjCEg+0iIaAJ7o/7MU9VcigC8VBxe0SNyH
         igD9txP1YndW6hyNX7izni+nF8Taso38h9cX5/u0jmPdVpanouWR1T5I/Dn1nLKNIlkn
         UXlBk9xAPqVg2rg0T2geyexkzD9rUIxvfKuGalq3aLgxVDLk0VlUS7QowLSQkzPuo5lN
         DK6WN/J8/06YAbJmIKD17IpaIXTzOW0Of6CnpM4qdIb/3ENlW0qrjKIHMbQLlukpEGfp
         CzLJd/FiwlmNMkiEnExcNSayHjeR+QHnF9tNlyYq4fSvEU3wue9J0Vh5Gvvf/LNdav7h
         AhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749868293; x=1750473093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muvH186xbp1wZouT3DAGJVB1Ry12NAmcqUPQ49mvjxQ=;
        b=aAFgALtwHn7+lz536+jth0VyhZW3oUObD7of3/HUcOFVhCBSY/63wlBSYwRAaNBUFT
         RGLmGRVVg28CeQmxQayOhFt19HB5HLGlu6lYAd1JRT4m+EwICH9GsI17ukgID6ILtQcA
         6Ku4FnQRCnDkKfBFrjtwXtWH68eWVIvdJluIi8m+J56NVZrR9zrMqphG2QeLUxp4iNIj
         4vYLg6wbjJIq5/x8+6FVSqwhorp9mkD9gIvOiiJk5AUSnBdK1blY0WkKQMnckztvPNsA
         6ZXRwInbnOpzlaa9SDsZ8zZCIjP27ssp6EmmH2CUAVFjoWUix/uQjJMHEVXRYcYo0kT3
         N6xw==
X-Forwarded-Encrypted: i=1; AJvYcCUBmS9GBVfjpHtGT2k9E7dRsyP1/Wc4ZuaPkS2phsaHX+u6lChNwVg1yul+hEoGUsvltwBLO4GKgQD6@lists.infradead.org, AJvYcCUFhgMcKZdVUqu4GQJZaPce53+4ixhTSEJZR4+2ld6EttyDC/nXxC/8mV4ojLe1nskQPYpCWBZlhzQ1P0pcfoBD@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3TtC3Gzgpc7eWLmux4ZiodpgzTCHFSzeIJfOVfyPCofQL0MWZ
	yqCnXaqc1ZBfbd5nMhNwmg4NTcA0/bP9AZff4oGOrfFgI3Z1dPLqrWdkljhQg6i2
X-Gm-Gg: ASbGncto6Tt8pGWs5cGbowheFtg5c9zYjn2OBhtnf6RDSCnx08+Nmf+USTobKsFmBas
	ceF9uQ0zDuCR98vULDLfkUFi4PpdWq3kzrnilZqhjRtN7Qoo+dWZPxNdCVZ4M+D3VdCjaygUxGZ
	eVHqcEBAIAFUPfeMmqjXKfELBOLYS1BkmL3RA29Cqgq4uQjmbCSiqboab1DaHNL+NHS+QSEInrc
	Wryx4IrUUHOsRPmt4EZ37cjbi0IyAxJMsVXD+DqzjeisdFzDNlCbq/uF8WyMR/r3dXPCXddRVjV
	TQ1CH058FZBYoUcILsIvceBjZGe7u+oksiG0eqoFgxBpjOzZ/w==
X-Google-Smtp-Source: AGHT+IHCj4fIQmaD0smD64d+WdoNvxKcsF+LPm8LepKLk3m/wfu/XLkOZVHbtI+96XbJp9WpjbjE8Q==
X-Received: by 2002:a17:90b:1dc4:b0:311:fde5:e225 with SMTP id 98e67ed59e1d1-313f1c01641mr3118796a91.14.1749868293053;
        Fri, 13 Jun 2025 19:31:33 -0700 (PDT)
Received: from geday ([2804:7f2:800b:87ca::dead:c001])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19cd5a6sm4158494a91.12.2025.06.13.19.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 19:31:32 -0700 (PDT)
Date: Fri, 13 Jun 2025 23:31:16 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND RFC PATCH v4 1/5] PCI: rockchip: Use standard PCIe
 defines
Message-ID: <aEze9A8jtNsZLxr7@geday>
References: <aEyJhoiPP0Ugm1t6@geday>
 <20250613205023.GA975137@bhelgaas>
 <aEyRrtMZ0LidhyOR@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEyRrtMZ0LidhyOR@geday>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_193133_999603_ECE71858 
X-CRM114-Status: UNSURE (   7.35  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jun 13, 2025 at 06:01:40PM -0300, Geraldo Nascimento wrote:
> They are not under NDA and can be obtained though Rockchip's
> official site:
> https://rockchip.fr/Rockchip%20RK3399%20TRM%20V1.3%20Part2.pdf

Hm, sorry about the confusion Bjorn, that is not an official website
at all it seems, so I assume these are leaked?

If so, it's a real pity, there's not particularly confidential about
these docs, and they are essential for working with Rockchip chips.

Sorry,
Geraldo Nascimento

