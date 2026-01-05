Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F3BC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 14:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0VJAy1LxeO1DoMMmQqr6qf7GwbBJdW99Z0xb4rwj9wE=; b=KvP6YDuNEx9iSFaidDXqcpflm3
	IVVxO7+YJFHQgUKslcqm/7Nap0kjFII7WaWwCh0UQmwzvRDT+QyhMgzbzSNPb+tVrc90ACw83bocm
	k96y4sN2fu9uh0zB/JEzbSCZv7go4u/S1OWyiRfihJ4iYDsRSjSs8WDKyQ7BbW9mJMSZcDPxWbkW4
	yREHROaApeIc0IE6IMCdaIaZCxhnrYVaqtVAC+mydrNGk6+9slekD92drxl/NvDbxaCHUaoLBTs1z
	yszPIzNAldJUhh4MvJDCOLEL4UaHdUkECEUzkTVVtSZoZwKhjUaFmFWgN2RHipJ06b9q5Ne+uwG7H
	l/MToxOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclxW-0000000BZge-2Pqd;
	Mon, 05 Jan 2026 14:53:26 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclxU-0000000BZg0-2uHf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 14:53:25 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-8b220ddc189so2012417985a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 06:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1767624803; x=1768229603; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0VJAy1LxeO1DoMMmQqr6qf7GwbBJdW99Z0xb4rwj9wE=;
        b=XiQjKEevgciZOPihvM7T6HR00Qeybnrn6N7XHJlgb8rq5ZCqjZvkpIU6+PAa573XYa
         S4XUJTC9aGs/X7F8pfU9fw9QXKPZIHICwb6Nwb/hh6zMowaceFoGkV/he7MNoRsa038m
         /tbEPYgO2qBF1WacCInQ+YiHgERy0iG7ilmKIZh7icwtl9DA9nD8cd91B2hUDtA7FmEE
         9W8ODFH4ceHJk77I524dY+8nrjGkm5QFZnrV2R8UWmAnwKVxV9m1zxGLHsjxva0UsouG
         Wyp+AaVC2bGPbV5FfewpfgGrMLEjHFN23gBRvIAQEVCQDzmKKRO856jLPLtsk01jv3kj
         Uk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767624803; x=1768229603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0VJAy1LxeO1DoMMmQqr6qf7GwbBJdW99Z0xb4rwj9wE=;
        b=cGcX8PQNPbC/6Ty7a0avkAb0CRs49lEVeKXOQKt+ijb1nPZ61rXvVfoQOzHEQZQzH0
         Ip53mOR1hPaC+66Ailwf3xstPfsgEZcHWCwfIrPf7ajGS0Z7uuZnH6Nz7G4Sb1+0H4N1
         ixihFKRj3Wno2CgoJgsDZB3Swdy9Uw3kW1BRLpagPHhyiA8zgDGRMNzmkf8toWi2LIQf
         yBFrq1dES/TRMuRUL2O8tuQLBNVWGUrPjmYiUbcNeBBU4p9P5I/9VYQw8gFrA98AQ2cZ
         2yWQ8XOOOEmsYDWYXhMBGknm8p4afz5umh7uENC5ItKGc/dl7lvzV2WTa3kwGprj3FB7
         hPMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHYD91Rb/bZ6B/BOYEJmP7anJOpzWCJfVT9tiSL1QECSoURGQngwtx9ImcAWtMqtVkVkJpJaR/P35ZyVoF4F0R@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8fQBHLizAQQUi31+j95X3/6hsAykm3dqAuNExvxV5uuAy/tTe
	lXB13QvE2HhlX6DeJRR2Cg1qCC3OGlmTVsbdln4Fv8BR+Jm7DACZzKhfqmLMJvMjH0A=
X-Gm-Gg: AY/fxX6TtUV6U572uk6VL54B63U6lXCpnhrRrGZruUHuzLCPXPErmzY7Ctm48dxE+KZ
	gckrOkS3tsBuOo817ZXqdS+U/8M9jD3ujdx9iZaambZeJpHnEPKqCLPBQIoOeIDe2PiIWjStfb8
	3w5Pi9C1fa56XGTkJj66vesBUxh4cz8RQf/X1wQzXrV/Pml3pbIiHajRMvYRUKUo2m4qxfsfIH3
	g1kkPCKl956hbnmIDUcYloie2wb9CBE5VTLQbILpx0aAdhbtOtM+lN79jMiJpFi8tRzY41afrv+
	IwJ+urbvKZT4N7U6+fcGNvgj6WCzaIa8P0JyKFC/s01QL555KByGOAkBKUtCXxerXKbyqxwiU2U
	oNMYL4ZXhhoizYU6AxLG1Mykst4JUEdNqLi+YgAjh2ro0OCT0qRUDJgjgw9hfrRw/k8zDbvgAop
	n0+MxGqh+1D6Xg0CPk1rnylQzYppt7OojtLQ+3OhSfLSk5y7kgVOGESpgHaZ22yQIWm3Q=
X-Google-Smtp-Source: AGHT+IFUt6wPvI9u2rR/xi8Np2VLLWZzGxeI/Po3U8DHhN0nYQEKldceIemvjTqj2Iro8b99/psoBA==
X-Received: by 2002:a05:620a:4611:b0:89f:19e:46fa with SMTP id af79cd13be357-8c08fab5a22mr6994767385a.20.1767624803162;
        Mon, 05 Jan 2026 06:53:23 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0973f28e3sm3963769885a.45.2026.01.05.06.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:53:22 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vclxR-00000001ANB-23EY;
	Mon, 05 Jan 2026 10:53:21 -0400
Date: Mon, 5 Jan 2026 10:53:21 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Dawei Li <dawei.li@linux.dev>, will@kernel.org, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, set_pte_at@outlook.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Maintain valid access attributes for
 non-coherent SMMU
Message-ID: <20260105145321.GD125261@ziepe.ca>
References: <20251229002354.162872-1-dawei.li@linux.dev>
 <c25309d1-0424-495e-82af-d025b3e6d8c8@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c25309d1-0424-495e-82af-d025b3e6d8c8@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_065324_804748_2D38DACA 
X-CRM114-Status: GOOD (  20.96  )
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

On Mon, Jan 05, 2026 at 01:33:34PM +0000, Robin Murphy wrote:
> The assumption is that if the SMMU is not I/O-coherent, then the Normal
> Cacheable attribute will inherently degrade to a non-snooping (and thus
> effectively Normal Non-Cacheable) one, as that's essentially what AXI will
> do in practice, and thus the attribute doesn't actually matter all that much
> in terms of functional correctness. If the SMMU _is_ capable of snooping but
> is not described as such then frankly firmware is wrong.

Sadly I am aware of people doing this.. Either a HW bug or some other
weird issue forces the FW to set a non-coherent FW attribute even
though the HW is partially or fully able to process cachable AXI
attributes.

It is reasonable that Linux will set the attributes properly based on
what it is doing. Setting the wrong attributes and expecting the HW to
ignore them seems like a hacky direction.

I didn't see anything in the spec that says COHACC means the memory
attributes are ignored and forced to non-coherent, even though that is
the current assumption of the driver.

> If prople have a good reason for wanting to use a coherent SMMU
> non-coherently (and/or control of allocation hints), then that should really
> be some kind of driver-level option - it would need a bit of additional DMA
> API work (which has been low down my to-do list for a few years now...), but
> it's perfectly achievable, and I think it's still preferable to abusing the
> COHACC override in firmware.

IMHO, this is a different topic, and something that will probably
become interesting this year. I'm aware of some HW/drivers that needs
optional non-coherent mappings for isochronous flows - but it is not
the DMA API that is the main issue but the page table walks :\

Jason

