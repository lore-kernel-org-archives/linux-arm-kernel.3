Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715CFD38FE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 16:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOGask9npR+YlnkUj5CzN/Pzieo1MzhAPrMcaH9JsNk=; b=ivZX/SMWW2WH3wvUnPQ0Bc3tK3
	WCzTXv0iNZv+24c65rcRnSjvfIgfB9Hs+vI0a9C/yGFqwNXHVgbrNtwOWIJZMDMg6ro7gufoL637U
	wi94dqpvlmUZiEfrnlykuqYomo34mo9JePLLB9wRTcwL4lBurbYt83j1R0KU8F1RlKLfG+OlEn8n8
	bqx9UwApJXO0zBsjAu18KTSJAXmCtjRvwSZIr8d9di7GJFbgFJsKC3ghAFzGqBUKag6M1SLAQ8eE+
	4VHXXx9s2cMYEqwL81CtKsbys9YB2otCkP0eY/Z5YyOQFynMl8rQHwvG8TfR8BE9K1FoYguJ1mZhO
	1lsuIjQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3kX-00000009vb4-2KBn;
	Wed, 14 Jan 2026 16:29:37 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3kT-00000009vYf-2I3y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 16:29:34 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-42fbad1fa90so39794f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 08:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768408171; x=1769012971; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wOGask9npR+YlnkUj5CzN/Pzieo1MzhAPrMcaH9JsNk=;
        b=X+8LkvPSguzTaoMwIe1vCq89RzpIJ5HbrO/6SUZnwIs73Bo87PzhH4oYwfaluCOqCp
         MfDEk9AjHwniLm/gujP6pKmcuDsY1a6qIe7fV2EYxpGqbzw86c6VXFTLw7H6KFqJdCs4
         Zt8p5jcvg015ktaJx2sJfxWyfEtni9WDLJnWNPkk7UqkqEbzpUVbYJLHYzwAUWvyz1Nq
         3XUMqE/+vwDSqW0Ski/aZDEOMDyNINQ/jAjBZuYPGBqmnZ9vBIy5fiAaxuONj138xRUn
         OhS08Tg3sdfb9HadG8x5eoXq9ELOuZaU4qlF0xPzjJ1k90Q6SaYhTbzYF19BJjj17jeE
         it5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768408171; x=1769012971;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wOGask9npR+YlnkUj5CzN/Pzieo1MzhAPrMcaH9JsNk=;
        b=LT52ih8UbDLmswGQ7epFovhF93zwRFAxYN2u3B+34xvG6pMZk5EB2V55GbOhYYM8AD
         UuphaYItkBMBeE5z/GVO5DhDSLeizgwvfhRfGu4G3kUzEgy+ZSpCB0mh3JKQHAX72Y+b
         2NZ1KOOZI2J9H/RwuwZNan04S4jJntRiKe2WAorIyi254xc6pJ/ihQz/kKbKbcglZeYJ
         H267xm0oBtezxFMt9ZdsdMNEnwZIBfXwtazORCkK8eec2PH16c5FQ/flhWt2rVStWAwJ
         5hE/OCTW/CTp6vi/RXUQYjdNwXcu6y8oZy42g+nvkuWawYbl7QMCPUo/PRirbEC/Htry
         E2WA==
X-Forwarded-Encrypted: i=1; AJvYcCUX/s/LkT1T184ClFCXsF+yPkm7UHnnqI1DchVV+OoQvkZ09jqIoOL7L1ZFFi2OdBfRUFOhXqEg8Wc8N908gcqm@lists.infradead.org
X-Gm-Message-State: AOJu0YwT4YttrVPolVSWDebP26iy4XU0OSvjbhZN6aBp3HTGy3tt3ri8
	0BFjkCJ9mtWdk24bLytpIC0UgPEHtudp7V6S6NmP94r+lS53wNRBTAC7
X-Gm-Gg: AY/fxX5COshtzkR+YUHWqHt/YQV2v0hPfOTKfRMIgHFZgQYAbQTUvlQ+oPFt+9BRUXm
	gxDRla+BPsfaCFLlkOs/f+8sXsZz1Bn8aQuAvPCW5QqowM50GQM7fgeAssC9UhcowJUk8dLVUKZ
	Ns6C+KDN0rJ2e/YCGssECgSu53MHppE192f2ysHi2aW5KAI3p8Mvwb1AzCoGQYKLAVlalIVOHeB
	QU0go23PNytVk868aa4x8+qkGAs1cQpiU4/2W/AhzPMEStxe3wnBaE771GnFH3czsraHZHX1XAp
	SgMTK7InyxbP5KIXehwpwppDrKPM6uwf6ssi6A4ir8vY5jqCZ9LuP2kVbTtuKBY/go6u9U/qwmf
	TUtDfDoxA13tBJp0q6bfsKc0En8xUrm1CzYSfH4dNUhMUCgv2nGrHq3SAgzbNVYl7RgRQop5DsL
	nQfDK0sf8veJj9M/phXV58fc96Dn4h0SedduKBwio=
X-Received: by 2002:a05:6000:310b:b0:430:fe22:5f1c with SMTP id ffacd0b85a97d-4342d5dd3d4mr3043280f8f.59.1768408171137;
        Wed, 14 Jan 2026 08:29:31 -0800 (PST)
Received: from Ansuel-XPS. (93-34-88-81.ip49.fastwebnet.it. [93.34.88.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6b2988sm147835f8f.28.2026.01.14.08.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 08:29:30 -0800 (PST)
Message-ID: <6967c46a.5d0a0220.1ba90b.393c@mx.google.com>
X-Google-Original-Message-ID: <aWfEaBla1K6AZnsY@Ansuel-XPS.>
Date: Wed, 14 Jan 2026 17:29:28 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: airoha: npu: Add
 EN7581-7996 support
References: <20260113-airoha-npu-firmware-name-v2-0-28cb3d230206@kernel.org>
 <20260113-airoha-npu-firmware-name-v2-1-28cb3d230206@kernel.org>
 <20260114-heretic-optimal-seahorse-bb094d@quoll>
 <aWdbWN6HS0fRqeDk@lore-desk>
 <75f9d8c9-20a9-4b7e-a41c-8a17c8288550@kernel.org>
 <69676b6c.050a0220.5afb9.88e4@mx.google.com>
 <e2d2c011-e041-4cf7-9ff5-7d042cd9005f@kernel.org>
 <69677256.5d0a0220.2dc5a5.fad0@mx.google.com>
 <76bbffa8-e830-4d02-a676-b494616568a2@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76bbffa8-e830-4d02-a676-b494616568a2@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_082933_603366_F1199FFD 
X-CRM114-Status: GOOD (  20.07  )
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

On Wed, Jan 14, 2026 at 04:56:02PM +0100, Andrew Lunn wrote:
> > > Yes. What you plug into PCI is not a part of this hardware, so cannot be
> > > part of the compatible.
> > > 
> > 
> > Thanks for the quick response. Just to make sure Lorenzo doesn't get
> > confused, I guess a v3 would be sending v1 again (firmware-names
> > implementation series) with the review tag and we should be done with
> > this.
> 
> Since this is a PCI device, you can ask it what it is, and then load
> the correct firmware based on the PCI vendor:product. You don't need
> to describe the hardware in DT because it is enumerable.
> 

Hi Andrew,

I think it's problematic to create a bind between the NPU and
PCIe.

Do you have any hint on how it's possible to read the PCI
device attached? I'm not aware of any API that can be used
to enumerate what pcie devices is present on the device?

Considering how tightly integrated things are in this SoC
I still feel firmware-names is the most effective solution
for this. The WiFi offload is mostly optional and sadly
due to Airoha limitation, it's not possible to have separate
blob for the single feature/support.

-- 
	Ansuel

