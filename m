Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AA5C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 16:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4z6O4IkxuL3soFsgl5HuaRJCPykEjaleOKC87F2y/io=; b=FJnZZ08ndHuN6mwU5EGZaaY29k
	8r7VDVvN4HhLLSXDLZEZANDvCBnJbRuj5oHdhn9rY2EAtzQ2WYpHWj/4WqgOpRT7V2WCkpPHbhiCp
	DZZXo1MXiQ2EXpu+ZaK5g+OVHu+LWDo8XERbciG1oEP1TeFOXND7i483oR2fgxX4NoL0uuvEYXVsz
	kiR+63Qit9IVmRIm3TyonyJtn/U202nTF/D9ajsENVpwwB1/9QYK/jDyLJulgokahuANnNKsLnyS6
	+M4fJ1HsmermSciiluJRjj0p6MSPJSVLbfJa0XHMqvr6NpDjluiLHY/2P+giNwghf3yOcSdELlw64
	w1ZukJqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVwQ-00000006BxZ-2WQt;
	Fri, 21 Feb 2025 16:31:54 +0000
Received: from mail-pj1-f52.google.com ([209.85.216.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVqv-00000006AqP-0pfY;
	Fri, 21 Feb 2025 16:26:14 +0000
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fcc940bb14so3548065a91.3;
        Fri, 21 Feb 2025 08:26:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740155172; x=1740759972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4z6O4IkxuL3soFsgl5HuaRJCPykEjaleOKC87F2y/io=;
        b=k5Ta/ExbSwhGuQ9TNPWUUQamhLYIG2eTqeO9iFmDJeYabyr/ZP3E3hiz5v8A1wtS7g
         Oc6aecLQpG1sJPA1TSQKDb0gckpsJqm/PulX46TwbfvmiBEeYpLwwA60exIKiGziu/sV
         nmNRIWYP+UUE3QxQbA7xtp4GoB4nK64MkFen/bKLsYs6oyyrs1wFOxNYGdD5Y+bho5yI
         nXhRDz7U7l3tWrox/Kn3lxlwjtx0iJFJau/31TY0MaNlgg+4Bg6DkNdSO2dzdLmlx7Y9
         SWCOp4kThsyfc6r8rfEqEpSKFzid5DQWWfU+oQNxZ2CCwNzu/72ViQFRzHpBe0r3V/rA
         X+Cg==
X-Forwarded-Encrypted: i=1; AJvYcCUURSFjPrjtvNMaZKJJvml/pSc3Ma7hJviN/bBDqN64z/DHDnrKi4CIDBGKz0ATPjoQEQVq0XY7Dcgw9OsehaX0@lists.infradead.org, AJvYcCXMPgI8pr55NWqXtLBvRvkxdJbABk30iBOsFbDurslg3fQutmJ8DY/kAHs8qVOL2+x15fZjdLkFnZHNcbd8w+wK8w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMmxcu1VV45Vw5b132Swe4ID4eIOmqpee4Imixg5CML10vKNwG
	eADU7ShPaQfPGBNw5BCVQ715bAcSsnYEdy5PlLFcvcZ7HK+HlKJH
X-Gm-Gg: ASbGncuA4H9vj/Y8ij8h2l7WtVSaK4R5zasyybj4dIqI+UQO/PBa/hhn9Fr+5zam2AJ
	gS4Jg1AkN/PWSmrWEcv3lDLQ2Dl2tyFSyaBsZlAm4VFoTF6cucOZQHtUX6ruZg64MT3yOnLIo8J
	63ywC24kz4BVbTkCzM1QU6rcACeljLriXHCoppOT/ocnnOL6N6tfmBbbAiWAqgLDXiK4R68uh+R
	AIM394Ck28+pxu+0yZKnTob63Rlanl7cbykWnYwQxM5onxxAjSSQllBc6i3dkL6aJXwMor5NoFI
	qt0DinBzr8Hv/1YFGC79Y65MgjOkNWZejkFmA76iRUDyAbC/dhygiQuj1+ZM
X-Google-Smtp-Source: AGHT+IG50X4zqXhTHhqI02RRZLr0tYQJLiTV1L9LZNvdYSx6bY2d/dTV4UtvP0Y/8m772MSFX/Z4OA==
X-Received: by 2002:a17:90b:2241:b0:2fa:228d:5af2 with SMTP id 98e67ed59e1d1-2fce78b778cmr6540511a91.15.1740155172321;
        Fri, 21 Feb 2025 08:26:12 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2fceb02df46sm1603022a91.9.2025.02.21.08.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:26:11 -0800 (PST)
Date: Sat, 22 Feb 2025 01:26:09 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v5 -next 03/11] irqchip: Add Broadcom bcm2712 MSI-X
 interrupt controller
Message-ID: <20250221162609.GD3753638@rocinante>
References: <20250120130119.671119-1-svarbanov@suse.de>
 <20250120130119.671119-4-svarbanov@suse.de>
 <87bjvs86w8.ffs@tglx>
 <b1009877-6749-4bb1-95b9-ae976bef591c@broadcom.com>
 <320db9bc-3610-4336-a691-a8926cdb7e24@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <320db9bc-3610-4336-a691-a8926cdb7e24@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_082613_248501_F9B32AA0 
X-CRM114-Status: GOOD (  11.61  )
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
> >> As this is a new controller and required for the actual PCI muck, I
> >> think the best way is to take it through the PCI tree, unless someone
> >> wants me to pick the whole lot up.
> > 
> > Agreed, the PCI maintainers should take patches 1 through 9 inclusive,
> 
> Just small correction, patch 09/11 [1] has a new v2 at [2]. And I think
> PCI maintainer have to take v2.

No problem.  I dropped #9 when applying.  Thank you!

	Krzysztof

