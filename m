Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D1FCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 22:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVoITpMtYi5Kgaxbk7LevCo8Kqli+/vM/Zg8iA9IuYM=; b=LTEMTM9mmNvFMyfgjHVUfYsLGW
	8mxtqEX+/PfDdwEA40nBRCOx0y8tEbjdyrc7LO1iTUKFAqhHf0do+oankovsa2UEwjkINhRJ1Yyu6
	ISJXlWYzOoJWIhGQM96jD7cf4w1cYFjJHP8Bnzt5Ogo9y9bnHYdIpebEsJnzwZjL7j9WtgAeQEqk2
	E7XQMa1l8olxtgHysvpKjrHMEgIvn45pBxQ9ULvesm/cdlYWD3cIOx8uz4ARHt4GxrkfaG5w4i5ej
	nzaXGTJfGXBOk15FD9f17fRvnYHWfX53lfkEhPe2kiHQLGxdNRTKY9bHcIL/oh9rCGGtI2Ax0wpIm
	xtaP3C5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHreh-00000003XOT-2iSD;
	Sat, 08 Nov 2025 22:43:35 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHree-00000003XNn-3a4R
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 22:43:34 +0000
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-5dbcc814b80so717210137.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Nov 2025 14:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762641811; x=1763246611; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AVoITpMtYi5Kgaxbk7LevCo8Kqli+/vM/Zg8iA9IuYM=;
        b=JXEqxfkvoAVAjrMP5nNMrCWmpzvOcYVUMijUaoWPuAirifz+Ui/KlH+gZzaX7C6Okn
         T1bpkf4fptI4gmwKcCJij2crHuV2MBTDSOZkcIbbAGrbrfivJItw5XRJjosvR/uN4/mj
         2O1SWabrHDeVlyz0EErmrJDBxm1wk6k+R93Dn3JTJxwCsN0WyVxxkUAnOf5bg69OR6uf
         1Hy4k96yRapHE2WNQwEpb1d6UzQY0ef1BOKOgDyfUgt+x5ebLieiyJ+OpMM97ZruMy4a
         LS40Kr4F3XJS3lVyqHJwVfxp3g+F1kVFEqnJxwG5SuVEuOLhx8UPa7cwURVMoo1AeGec
         1Syw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762641811; x=1763246611;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVoITpMtYi5Kgaxbk7LevCo8Kqli+/vM/Zg8iA9IuYM=;
        b=UZT8jooC++ESsbXD7UkY0Q4cF0uGTSInZoFwmqAzXm0vzLITJQj5juH/bC9/osjno5
         TRhcMXofqyclJa1JRdPceKQKjG0vyB/oSikTQo8fGkf/W1lxlcWtrmzkVyfpKG5jpnp3
         JRc2KdAfIZQGj91R/3ExIlS61Q41X31L+vcyFYaXlgG2nmOVQQE4M/t6aw5BRToF4Flg
         0amF6mni+OpRooi28RFMlh1tm07SxLyfOkHRzWPQdV+hoqz0bRL7k26hM6lLjxlkdnWa
         tlKMQpYM5UVa+dvS3m/gL2w/uFVWUoOw70CVz3vE/IkJ6vRcMtS2mjoE4mnnxAh69Dxh
         zX2g==
X-Forwarded-Encrypted: i=1; AJvYcCWhNVPDj2bLvjleby/4c14YzVcZQoY3VZrKeuKdOAoUNPWoRR3pDZtqcSstg7D8N1KGUCfG6OyyoOZPYxvQvbgW@lists.infradead.org
X-Gm-Message-State: AOJu0YxwhWkc3MEDBj5NzPpsxA0syfzng8kIfzaCJPOBRB79ahLsvkkm
	8fWavyHDs0exsOY3oo3Tcps/Z7we49b5A1sPJlcjKPDMi61Off1lSoKc
X-Gm-Gg: ASbGnctXNtKHGgv5ulL/NBV6Q7dh2fLGk+rJvZ97h/oFsmVMf+cLX/qxswCjhB7TRjp
	DvbWMeIvIFeZReCCP9dFXqIBpZjDCDLiSXc4YJN2bbDST9CpRgugm8moyyiohHNRTTAbd+nyFAM
	6cXSPX+EDjZlyZyyAlsDDHRDulyTW7mcnTzEvsy1Q/kaIUkACBKHc8IWyTbXy2BP2kaKd0DOJcb
	UKR5+LZQAqMaJR/HK5AyUK/rnmqTwnijexEfGYl0KQ+PIrHgOcz1GfOQxLktJcLciiEn1OehMBf
	JBbCuBnmsdui2UI2YxYjDsyH7df3HlbEvdXOG2oPO0W+sybi22cCciB/slavhYYABbthW8XCQ1i
	88U4Yj2aNGhAfjsS9OLCripnLy7ZxV6ZEftxO3ZrQAcoXYAgX2NvEghMuRPuTpvIylN5Btu9lvA
	==
X-Google-Smtp-Source: AGHT+IFsj6aNYCy4VSY/pT65HzYuwBfF3Efce20HU3WXVuf6OpeZkuBOsC9gHRfJcS97JADvXgP2xg==
X-Received: by 2002:a05:6102:6cb:b0:5db:ebb4:fde3 with SMTP id ada2fe7eead31-5ddc46eef21mr1212345137.16.1762641811172;
        Sat, 08 Nov 2025 14:43:31 -0800 (PST)
Received: from geday ([2804:7f2:800b:4eac::dead:c001])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93725285d26sm1269736241.7.2025.11.08.14.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 14:43:29 -0800 (PST)
Date: Sat, 8 Nov 2025 19:43:17 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Ye Zhang <ye.zhang@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: align bindings to PCIe spec
Message-ID: <aQ_HhfK0pbOE1m1R@geday>
References: <4b5ffcccfef2a61838aa563521672a171acb27b2.1762321976.git.geraldogabriel@gmail.com>
 <ba120577-42da-424d-8102-9d085c1494c8@rock-chips.com>
 <aQsIXcQzeYop6a0B@geday>
 <67b605b0-7046-448a-bc9b-d3ac56333809@rock-chips.com>
 <aQ1c7ZDycxiOIy8Y@geday>
 <d9e257bd-806c-48b4-bb22-f1342e9fc15a@rock-chips.com>
 <sbulnlwz3vxyk3yw2c2tcsdvyu57cdvyixkpeq2okh4vn6yyod@4o4kltfb5u6n>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sbulnlwz3vxyk3yw2c2tcsdvyu57cdvyixkpeq2okh4vn6yyod@4o4kltfb5u6n>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_144332_890712_7CDBB438 
X-CRM114-Status: GOOD (  27.49  )
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

On Sat, Nov 08, 2025 at 11:12:54PM +0100, Sebastian Reichel wrote:
> Hi,

Hi Sebastian,

> 
> On Fri, Nov 07, 2025 at 11:01:04AM +0800, Shawn Lin wrote:
> > + Ye Zhang
> > 
> > 在 2025/11/07 星期五 10:43, Geraldo Nascimento 写道:
> > > On Wed, Nov 05, 2025 at 04:56:36PM +0800, Shawn Lin wrote:
> > > > 在 2025/11/05 星期三 16:18, Geraldo Nascimento 写道:
> > > > > Hi Shawn, glad to hear from you.
> > > > > 
> > > > > Perhaps the following change is better? It resolves the issue
> > > > > without the added complication of open drain. After you questioned
> > > > > if open drain is actually part of the spec, I remembered that
> > > > > GPIO_OPEN_DRAIN is actually (GPIO_SINGLE_ENDED | GPIO_LINE_OPEN_DRAIN)
> > > > > so I decided to test with just GPIO_SINGLE_ENDED and it works.
> > > 
> > > Shawn,
> > > 
> > > I quote from the PCIe Mini Card Electromechanical Specification Rev 1.2
> > > 
> > > "3.4.1. Logic Signal Requirements
> > > 
> > > The 3.3V card logic levels for single-ended digital signals (WAKE#,
> > > CLKREQ#, PERST#, and W_DISABLE#) are given in Table 3-7. [...]"
> > > 
> > > So while you are correct that PERST# is most definitely not Open Drain,
> > > there's evidence on the spec that defines this signal as Single-Ended.
> > > 
> > 
> > This's true. But I couldn't find any user in dts using either
> > GPIO_SINGLE_ENDED or GPIO_OPEN_DRAIN for PCIe PERST#. I'm curious
> > how these two flags affect actual behavior of chips. Ye, could you
> > please help check it?
> 
> FWIW I assume single-ended in the spec means it's not differential
> like all the highspeed signals on the PCIe connection. This says
> nothing about open-drain, open-source or push-pull being used. The

yes, I agree. It was an oversight on my part to assume open-drain on
PERST# was part of the spec just because many cores implement it that
way. Kudos to Shawn for correcting me.

> kernel on the other hand has a very specific understanding of
> GPIO_SINGLE_ENDED:
> 
> 	if (flags & OF_GPIO_SINGLE_ENDED) {
> 		if (flags & OF_GPIO_OPEN_DRAIN)
> 			lflags |= GPIO_OPEN_DRAIN;
> 		else
> 			lflags |= GPIO_OPEN_SOURCE;
> 	}
> 
> I.e. it is the same as configuring open-source ;)

Yup, I had noticed that. This works because the reset value of PMU GRF
register PMUGRF_GPIO0B_P sets the relevant PERST# GPIO (GPIO0-12) on my
board to pull-down, which can work with Open Source/Emitter. If we set
the GPIO to Open Drain/Collector we must on the other hand set that pin
to pull-up. Either way it works.

I've been investigating why that GPIO isn't properly working as
Push-Pull for my board (Rock PI N10) but so far I'm clueless.

Thank you,
Geraldo Nascimento

> 
> Greetings,
> 
> -- Sebastian



