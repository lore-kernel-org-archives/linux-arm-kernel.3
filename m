Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F307C71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 20:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wuCVuGaHirlRuU3Mk+7drZzjFeMHQqUbXh9VX9SQqrk=; b=aQNGOEanqnzLpwLRpsVrdLCi28
	flPADImkHYYkqtuv58qC31E1TJz4V0nQmEuFLsR2ZyxqeZmAYJnVH83dDCFrfXIlwVt1uSJTVIWNF
	KKU8PSCAQhf3YgzlOd2HVVzpb6lePtQ1Sxdj9X4r4X2Y8SskqWJgfUg0x1JjMpvBRG61LxaglPrYH
	WGWakEAnY8gDzVPt8YU4LTq3syzqcJF+poGqchRR4ws/kfuzVNJKZL88xNcpzI+4eAA5wuFVH0RkO
	bdceaxuZ9+nqZyY/84cfOoCyPQy0gGRGVhn9IQcqrCi1l3/+aJi0jEcM7rCyIMh1SWA+HW331TNe6
	x1NkFXcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQB3Z-0000000HZor-1Ddo;
	Fri, 13 Jun 2025 20:31:22 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQB01-0000000HZOx-0CC5;
	Fri, 13 Jun 2025 20:27:42 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-313a188174fso3234845a91.1;
        Fri, 13 Jun 2025 13:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749846460; x=1750451260; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wuCVuGaHirlRuU3Mk+7drZzjFeMHQqUbXh9VX9SQqrk=;
        b=d+B3/KdI7B5UZlvuqPuA12ABLOBLLe9zhj6GRYZOp99XRy2OVNRpJhuURkxCWOzU40
         tiwTZ0NCAA2PMVAJYiLjgIU+YyRxpkJqioWBNRtf9SUU8D/USatM7t/N5RRi3dZLpS/h
         ldalOS+Tm0wtrfZjAGrWEK1a5bhZVq4jGceZQAQ5wH836IwKZI9/JzDyIPQpRAzK5lF0
         wNIDG5aRbhp8kuvQCMH7+AkFWXniCJJcMTks2hUIROo+/8SZnJnKLX6oterRshbN4zer
         oi9e2CoWonZEt9jgbHX8Ac7afV/EhUYtnUy8bZx0AQ3o+GXp0fPBDyGW/OJHd8wvg579
         WCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749846460; x=1750451260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuCVuGaHirlRuU3Mk+7drZzjFeMHQqUbXh9VX9SQqrk=;
        b=RaDBvpCZtdlLXrufUOR2zc6TVhi6iKK3yil4aHyXNr6GQGpwEZJiE5WnCeH2Mt/Q7+
         uzv9sB3kKmm7iIEjiA5Y88zDoHlHMAcTmXum6avjdr29LDEcNs5wmeecpLrLt0Dt5RBg
         HBYBbzzBbmNBls8NQUeRm/DyJCEHvVXOQBVkk4xEL+kVhpFbQeVKY3JeaytuL9rmFKPl
         pHGZ4BJ4azWkWJu3O9SrTo1EbclvEGfDXV1bxVobYsHOH20vFBGfk3zlT/puAiR6qhsx
         dKWyB1sbGgjHjVQxKWBCT65tcL37uzuXP6vGuKuvWcGDHsEOT08vvPBQAbhZzZhj9sGi
         k0QA==
X-Forwarded-Encrypted: i=1; AJvYcCVJgEbix7ZVs/+jbjjTs9c/kdLztWEr/mRkm5sod0pjqPkcIeggM95jU6qufpqOQLoYw2gUKPIVv4q+aNYzszuI@lists.infradead.org, AJvYcCWeQoE+YoKTdcYMo1WVLrP2/w+++fmxvHA6GnlgfSvP6aIANi72hHPFoAKiaPQUkfQgbISCR5x5KRz2@lists.infradead.org
X-Gm-Message-State: AOJu0YzI7QYYG8Puo1y7ScbPjgwelwx1F+JR94nUN3/ywUMQEC5MuFc6
	2myURIvMRL+vDoPOvXDi+knhBj6XPqI7p6NGJSYWrajomC+W03kNvQEW
X-Gm-Gg: ASbGncs1EAEzDup1P74zephvOIX3NGBDzHdMPL+bqQbBTHDz9biff5z4/ZOh+mBhmOS
	OlnAm0Sw6jjbObmPevcy/riiRBYUoL5OpV2rgqCSE2rBEbh67GQx8277Hc2vTGbvXSkpO+ACo3e
	EbFgXlChwuguq+oVUxT7jHcq+jxoo1cGuQx1OG1EI8mAML5Sz/z4WTUayRCDRhv6oD8BpbSSld9
	7EsWlMqbh4bv4zTYBTj390C6wVztrJK0AnZbRb9KwT5ciUQHrGSgdhGNmdUuc0Dd7hfyd/rp1im
	tU5vv5kpERjWgYfHlCslF1yGVzttmcDLctX5LWcAgbWwWEFiww==
X-Google-Smtp-Source: AGHT+IGUQjIESVvCU1Q82nN2vM7R+sdaSyi8GkWTG/4Isa6h9OSBbLcr54ZlcJqq7Bpk+gJG6xIHOQ==
X-Received: by 2002:a17:90b:2313:b0:310:b602:bc52 with SMTP id 98e67ed59e1d1-313e9036e0emr2281470a91.2.1749846460111;
        Fri, 13 Jun 2025 13:27:40 -0700 (PDT)
Received: from geday ([2804:7f2:800b:84a2::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dfc68c1sm18744625ad.238.2025.06.13.13.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 13:27:39 -0700 (PDT)
Date: Fri, 13 Jun 2025 17:27:33 -0300
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
Subject: Re: [RESEND RFC PATCH v4 3/5] PCI: rockchip: Set Target Link Speed
 before retraining
Message-ID: <aEyJtdhuofaUU-xL@geday>
References: <affaa12fedbb6e34696242d1f2f2dc5634b72005.1749827015.git.geraldogabriel@gmail.com>
 <20250613201543.GA974034@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613201543.GA974034@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_132741_087012_D3F9A7B7 
X-CRM114-Status: GOOD (  11.00  )
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

On Fri, Jun 13, 2025 at 03:15:43PM -0500, Bjorn Helgaas wrote:
> On Fri, Jun 13, 2025 at 12:06:00PM -0300, Geraldo Nascimento wrote:
> > Current code may fail Gen2 retraining if Target Link Speed
> > is set to 2.5 GT/s in Link Control and Status Register 2.
> > Set it to 5.0 GT/s accordingly.
> 
> Nit: I don't know what "Gen2" means (and the spec warns against
> assuming spec rev maps one-to-one to a speed), so try to use the
> actual speed instead of "GenX".

Ah, excellent catch. I'll make sure to adjust the commit message!

Geraldo Nascimento

> 
> Bjorn

