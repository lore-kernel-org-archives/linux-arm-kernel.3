Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B35CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 16:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jg3eKHm2/9+Dr+shG2gUZ2/D9yHklfF8q59PVSPRCGM=; b=1CR6/WZLAwpGtSfQtgypCixC6s
	FGWoWBwqdM7gOC/wkAoXHpNSoEKMJ/gE79P/3rqESp/NHFXdLfS27hwnwYkazbRvzj4dqwA+OyCGx
	8i09DYolL5zTNG4jk9MQ9V2oG+nKzl5OWlDLY8rVTOid3m41adnndSnIIPQudeSAPAUagE5S1PT6e
	Hr3AxLl21X3Lio+MHHq7+LWAfTTItHcUkgs7NsH48wAVUUGQq9InR5ptboBN+jI/lFSblXkDM1ZRY
	fFxY1kVJ3NrmWWiYP6KxsTqAnKBnhryPTOw1l46LEJVLr8Nvnx9klwdK1lqPdYZyvReAxngSsiy9o
	1MJjbddQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAOO-0000000Eaj0-2bWw;
	Mon, 15 Jun 2026 16:42:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAOL-0000000EaiJ-2NJr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 16:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781541748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jg3eKHm2/9+Dr+shG2gUZ2/D9yHklfF8q59PVSPRCGM=;
	b=dcFr3WEBMZm5TRZMdzoJmI3zgLU3eoxW5Qc3fD1Gj/yj9n8M2sdpUGu4e3Rx2n+dPOAO/g
	3M0Zzv/eyBqhZzNgSo9xQE+0TshS274NH3gr6GbaZHgVpoMFCW47ndt7OXXKDX8gW3nNGy
	i3dX8XtAaUds+o9PhHxgrnUfL+ZOHic=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-yhr8NSR0PjmtztOQYcZTHA-1; Mon, 15 Jun 2026 12:42:27 -0400
X-MC-Unique: yhr8NSR0PjmtztOQYcZTHA-1
X-Mimecast-MFC-AGG-ID: yhr8NSR0PjmtztOQYcZTHA_1781541747
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51949579e09so59771191cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 09:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781541747; x=1782146547;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jg3eKHm2/9+Dr+shG2gUZ2/D9yHklfF8q59PVSPRCGM=;
        b=qhJ0G8gN3lIw4dDlGuL1KZwggBTAy5Dc3JF5J51l6E6JZbK4sgwc6TcG6fUtFnkUCk
         SEruT0FR1jBtIzh7SRFB7XDCd3SqXm5PlvOQztu6/5NhBNB4GADOY/UG60N1g49tZAS/
         Ke1mlLTDVMS1+QeJC0vmUoHvSeOqjrd0qWKyRAQ4SQkH9n3/fDZVY8i96GJSDnT2w/UJ
         K8vfB7tjZKv4biDfFXwsQankPhF/AKIWIc6Vla+hFwlqLt1nD9Ep4PiV4OuoLXTJ3okz
         b48uXQX3nSSv0MeYqT4Y4gmtckr2uz4Eu4NksscI9fv+sY2Lhb7nSKfamCurvvD+Y9LU
         ykQg==
X-Forwarded-Encrypted: i=1; AFNElJ+xJwo8dvTzuXulCaZtfk932DjbMIFsxs8pFDGUf4DlSspm5XPYAoxDB8YvqFv5viYajd6bSejBIYm3FeCgAFlG@lists.infradead.org
X-Gm-Message-State: AOJu0Ywsn3upgSw48nRxi11Fn3jz5gT8k8o1oIq3AwCacIhDrNVvwtO3
	nnYZFkJqooAfHPR7t9Rmw8i75CHsYJ5srh4K45XfhUD4QLP33DK5IKFzqhabGU4aKLPiBrkidjr
	6wp9DB1wYgvBt4M9QZmMB5YmTSx4Hsc+/ZdpuLUcy2+PTJlDSn9KLTTM5bxWwWeC2ypSkaF5ICQ
	pd
X-Gm-Gg: Acq92OEmHeU1k6HalvNp6z62MNzpmdOhQ9p5ZqYh9jRRCGBEnuCWXEiNB1TXHjBxozB
	VerQ5D8nSjX/2fGHNEXnGMAVukMWiL8/OkmAHZQ8asV8qoPbVT5t4SW4ztsFFhslEFuEl55b6qj
	yQpIT2BlxZjepf+edISLEUm5XsEjgopAa2VXOPYNGW2hkPQQ/Ur99kHRBnvfYSyr2sfDDWdY/n4
	IiCkdxd96aitQm7t0T++FziYI1b1wl2cyy9SyH1F9toXj23RUAwU3mS6AnzAWcfDxlZNzq7yfWp
	pg4MLsCfA2RD6bN3MMaOi11dPPetk8ZrhKexthos5sxmcPN7oXbG+J+owfshXt6ulwsyKv0SlzM
	GDmdujFX6u1Nx+MyFcxGGHH5KifJ/YiRWrUphw+IQwURdZvyizgo6S1Yt
X-Received: by 2002:ac8:7d89:0:b0:50e:631c:c390 with SMTP id d75a77b69052e-517fe603999mr208597471cf.44.1781541746700;
        Mon, 15 Jun 2026 09:42:26 -0700 (PDT)
X-Received: by 2002:ac8:7d89:0:b0:50e:631c:c390 with SMTP id d75a77b69052e-517fe603999mr208596931cf.44.1781541746125;
        Mon, 15 Jun 2026 09:42:26 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb7dad16sm112174511cf.21.2026.06.15.09.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:42:25 -0700 (PDT)
Date: Mon, 15 Jun 2026 12:42:23 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: at91: Read "reg" with helper
Message-ID: <ajArb4D9OjinLmBE@redhat.com>
References: <20260612215251.1888345-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260612215251.1888345-1-robh@kernel.org>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2F9SaFzEBrt3Kw-zSF51dMy55v9CDhps5VvCq90gweU_1781541747
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_094229_935206_B89877A5 
X-CRM114-Status: GOOD (  12.71  )
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

On Fri, Jun 12, 2026 at 04:52:51PM -0500, Rob Herring (Arm) wrote:
> The "reg" property is an address-sized DT cell property. The AT91
> compat clock parser only uses a small bus id from it, but reading it
> with the u8 helper does not match the property encoding.
> 
> Use of_property_read_reg() so the code goes through the helper for
> "reg" properties, then keep the existing range check before passing
> the bus id to the clock registration code.
> 
> Assisted-by: Codex:gpt-5-5
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Brian Masney <bmasney@redhat.com>


