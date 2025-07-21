Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DE4C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 18:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9pKFUGnES5BOvIgz7OhSqjKvwg3RjLuuOEjVJ2EOIQ=; b=TgYPNm6nP0YUpP3zaoZdRQBswi
	VOyNd5mbYsS3GLlaSSnc8UZaCnWTk9xPWK3RcK4tcPy8r1INUTYqDpSmVhx6SIV6GwkUQnItWWUGK
	fk5FvJBFiq7mJmzSK7Js/AzXmt5gKZc+KuQxJM6QonmAiYTUPEL37CpXeyP3H0gh2FUktZ6jCUg2w
	F+boGnud+68JfBI7QwsFzoQvCZ33Wkrt2I4MCow5iw8w33dz/Fhjqc1f65ZFrzjbzU3ZXAgCzAxCq
	MRXFTZcHvSZdFWOrPOP9Q1XPnkR2a2/ikdl5KjvQftTpliqH55N8odOTXvrr6frIVLlq/Uk4GWAOG
	+27jqM/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvhk-00000000Rej-2gUY;
	Mon, 21 Jul 2025 18:57:40 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrsL-0000000006z-0D4m;
	Mon, 21 Jul 2025 14:52:22 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-87f4c8e9cdcso2515866241.2;
        Mon, 21 Jul 2025 07:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753109539; x=1753714339; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h9pKFUGnES5BOvIgz7OhSqjKvwg3RjLuuOEjVJ2EOIQ=;
        b=Cc5KaId5Ysygss5xwOhIBggn6cktbcILeTzudFSqWnERcYDcb6J4UkaD/x8Stx6qpY
         H5lbrXzRAowDNaCq+8PBIuCE7rc41UVguW9PGfcAzqkyiD7lBVfpDOjxEfGPEsjxVULc
         5lYacWN9DBQfnxH409Mca33W3SJ3PLAc6eDIhth1pRik5Mj926Cvu6b3N2mXTh7hhheA
         e1oMYn4kYH/EKNxq0I05y4o9T8oqtwdRVi2FKFqInXIXRqXVUiGiCHLYR6krv9bTSRCt
         B3jl2H7r6yY9IW1Xa8JvVLHkLKOyrlEh82ocm7TvPYYf6+Vy8PMm6mECzH8ggINlvd7y
         OYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753109539; x=1753714339;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9pKFUGnES5BOvIgz7OhSqjKvwg3RjLuuOEjVJ2EOIQ=;
        b=ETnkPKJguO7MVDDjaBbROmmKHelnp4Kn7QcUpPRhcCv49HZJQTDKabgFBnAOFk2Jmz
         uqPmxpjQ5tfMkVbTI07pMigKbQzhvV9OwiTFWNxcahDrCykU8nQF0Jm+XjAJy9w21UYk
         TbOS1HX2lfjaGdqn9jCoIaVHHkVb2JF2lHNHsqfxnTqwKl7SkzYZfc1IPBR3/flYUbwT
         EioOTGn002GNziJc/gPEhwAFVfw9HuJZGOP+ffJEf2T9hKmPSqqB6CeOiQJQY07770/9
         luMrisfXh18HtfBc/besDb6NZv6DO2KbVxckoaJsqojylXXv+RDcf7IfOa/wQrHTLhK/
         4EYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgbH5jIEoBAFX9z881JoW47YYgAbUtdzGCOGhERPfyz73hLrjbWDA2bjzYepM1mfpmpLu067yC7TcjeJQY4bbo@lists.infradead.org, AJvYcCWUQkJiD952RE9rpaOKAb+zKXfLNQT4I6NDeruptzWHh3znwF+rHjruqDHPXoFovuWcgckzgfMxJVGg@lists.infradead.org
X-Gm-Message-State: AOJu0YycbpN7qniJeBCQelxkXZw5yXfh4CDn6fkZcPRPTJXa+GGs1Bx6
	idvFJWfn7eomgM+agFsSi9ICLH+RqSa4edHNUj1HFEtsCNTOqBQ3Lz87
X-Gm-Gg: ASbGncvRFf8djR0Guy3nDKIUqWDDRpRNQyvDXinK5phqiASIpxnTnYO5IgsOjTNlLey
	Z/V3SzfogjqpU6ZCUPh37H4mVB0/5C4skq2iK1cWKtBd6Y4DZmjH73FCiaZAqPYSn8oJanCI2gf
	sW0JKSoQKyEciDYNZMq4aAnX+HmoGVpMuMhnB8WBOR1yxhYBal0cUl/L0SJbL71gf4rgNTwXbTu
	RKrb2TQSIJDXB/hz7hYgwC0mmnfiFSHlXahv81K+rbjDmRKW2LhhMdqGGM3vCRXH4EToXVca67G
	WX6buFf/BujiTYgnqWqQ01POqvLW/boFWxa0xEEJ5YK2rv01BvvdDLWNkuwUSi8l8jf2eWcc6l6
	XtbfrZs9Siw==
X-Google-Smtp-Source: AGHT+IGmd9k2a2Hbn8hJD4fenPYbM7kP6VlkdwpccXej9YWy59eUsaAV2qcil8B3QUVuuNtyCfMeoA==
X-Received: by 2002:a05:6122:1d56:b0:529:f50:7904 with SMTP id 71dfb90a1353d-5374f6b4ddemr7449549e0c.9.1753109539382;
        Mon, 21 Jul 2025 07:52:19 -0700 (PDT)
Received: from geday ([2804:7f2:800b:6584::dead:c001])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53764f2bd69sm2823702e0c.14.2025.07.21.07.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 07:52:18 -0700 (PDT)
Date: Mon, 21 Jul 2025 11:52:12 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: linux-rockchip@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rick wertenbroek <rick.wertenbroek@gmail.com>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/4] phy: rockchip-pcie: Enable all four lanes if
 required
Message-ID: <aH5UHPAtAVb2snSK@geday>
References: <cover.1751200382.git.geraldogabriel@gmail.com>
 <b203b067e369411b029039f96cfeae300874b4c7.1751200382.git.geraldogabriel@gmail.com>
 <2affed16-f3c4-47d3-9ca6-e4f48e875367@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2affed16-f3c4-47d3-9ca6-e4f48e875367@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_075221_088300_87D34E99 
X-CRM114-Status: GOOD (  14.45  )
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

On Mon, Jun 30, 2025 at 02:48:25PM +0100, Robin Murphy wrote:
> On 29/06/2025 9:58 pm, Geraldo Nascimento wrote:
> > Current code enables only Lane 0 because pwr_cnt will be incremented on
> > first call to the function. Let's reorder the enablement code to enable
> > all 4 lanes through GRF.
> 
> As usual the TRM isn't very clear, but the way it describes the 
> GRF_SOC_CON_5_PCIE bits does suggest they're driving external input 
> signals of the phy block, so it seems reasonable that it could be OK to 
> update the register itself without worrying about releasing the phy from 
> reset first. In that case I'd agree this seems the cleanest fix, and if 
> it works empirically then I think I'm now sufficiently convinced too;
> 
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>

Hi everyone,

Patches 1 and 2 of this series were merged thhrough pci git but patches
3 and 4 of present series got R-b's but were completely ignored by phy
maintainers.

Do you think it's fair if I resend these ones with a new, phy only, cover
letter but keep the R-b tags?

Thank you,
Geraldo Nascimento

