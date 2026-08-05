Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE2AC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 23:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jX93A5wJoAu0JKunu6l9UvEvI322kw4iodDAJblYaVI=; b=b6pqRZKAVXzpU/omhydx2ZyrMR
	GB7VqNA2VcgD8kAbNZxQKQSCgQm2y5Hp+0itysxMCp44qxnpHsC4Y/t6w9P/lZpvbAqAzCWsacpNQ
	J7e36/qgiJ/NYTPQ33TRMDr1AysN4p/JlBQf9HhGuvt+HevJ5RctjC6Z3u8JGUoTm2mNER2uDm5b5
	D54oZF4zDpGJJ+gAMLH0LG06DvUBDc1fKSIjabD+D6oMi4wVmkET4lOd0Cb4smS9L+dWMyPWy2B39
	mBtDYh0rIMwhqbn7+UND0QHu5bQbqSxPnFD1+Txy5qJ95v1cZfIb5RYi/L+Bv049lXc/gM3bKQx2D
	aXHfJZHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrkpO-00000004dnJ-27BY;
	Wed, 05 Aug 2026 23:15:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrkpL-00000004dmR-1N72
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 23:15:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785971710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jX93A5wJoAu0JKunu6l9UvEvI322kw4iodDAJblYaVI=;
	b=N/oOBORM4PlQmbm597RKRqYlJBIIN5Ur9+XKAuOJgSGryOTmssuX1hEIClWZXf2bAI9XWm
	e0a6KvcuBKjjuJMRmOl90DZQnKrSk4bJY3MYOnZB+Rjte9rt/iCaQ3ezNtL18xXvVR7FtD
	pV1uYQzeoqGiQQLopY6cFD7ujm9hUJY=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-9IPK4nu8N4O7AyUsQHjGsQ-1; Wed, 05 Aug 2026 19:15:08 -0400
X-MC-Unique: 9IPK4nu8N4O7AyUsQHjGsQ-1
X-Mimecast-MFC-AGG-ID: 9IPK4nu8N4O7AyUsQHjGsQ_1785971708
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81f0b6bb02dso41459757b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 16:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785971708; x=1786576508;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jX93A5wJoAu0JKunu6l9UvEvI322kw4iodDAJblYaVI=;
        b=rfwg3UEEkkpf2ifH2i+Ug8DNETigcVX99/AOeJ7B0+XQbXy68BdRZ5pSqk0YDxQ8mL
         uGIxnN4lmx5H61dKoRTCjTMXjIK2y4A96xAZt8UYi1dcQL7DfqXujZ/w5SR7jALfouzt
         ji/R9ZtyPyCjozvW2VxP6dGelx4FNvV+2A6svBwUrNom5VPcCTtqSpxtsfPMgtVmwITP
         yiXMj2j7/uWIiLJzY1igtGo3nLv3Z8EtsaLBSTFnmaV0Nux29pA6ceWUbhjW6y1WY7If
         kPQOkhE1mpS8G7jspzK7k+0qU9DKRhc3fOWvp6oocpie757jbHe6Nw6boMY9+OO+69JN
         B8wA==
X-Forwarded-Encrypted: i=1; AHgh+RpCbFkMZEjI2Euot+Pv7b0lETzX+JvYaVu6JRVeH9Bhaff5bB7xq8hQo/bAdY+dmvgHQLYCEI3zake+6HMrJdrV@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4RdaFy85uV5X6RLUu5PibGuSa8tHQBWDKb42dLPZ2iMCYY62m
	58GzVbYsbGcetJRc5t1bwZZgizPzsYJPIAt/mz1CMCbzKywhYC0N63ilG4g9ikjxnnBWDoHQ7hd
	nsnCl/g+Wez3y+WWhXmDXaR6vyoNdUJLTYC0H9hbIkMf9VLYHamqVCQ7UtYL2cjb9VWDwDce436
	2K
X-Gm-Gg: AR+sD10Khv8P0lpDyZpFCbtyvnEKAuSjDxkvEE2rZMGtMsyqWFIknvEYTnC53lIVADO
	moo0x9KwEJCEX0014UT9wmZgkS01cm7uwCR98QLFnl2q/2R+VCXCW6vNOYue3hGvnFoLdh2Lmzr
	Y9uboV9sh43kVbpW3QloGHb0L7fJHVnO/aKgYBGsuPcCdFCHEYUFrh6vVfOEiRF0ZM5Oxgdkt9Y
	QRzgAu2p8jaz5CnlT2Wc9zlkwdC4Vk3HOa6Px4cdyryoOeBbIczBXB06Ue8Gl2qVvycbEPP2ZZx
	R0OyQu8bvEJm5AYO4ikOS1jy7OEuZZm/H17znZRxgjW9Tg7Ez7n4K44h/vkVARS7Y+YLxtCLqE9
	jwxfje33XxkgeDks3LLwob+tnAGbQWgaN0tc=
X-Received: by 2002:a05:690c:4882:b0:80d:c9d9:e1a9 with SMTP id 00721157ae682-820229a0978mr60602407b3.27.1785971708281;
        Wed, 05 Aug 2026 16:15:08 -0700 (PDT)
X-Received: by 2002:a05:690c:4882:b0:80d:c9d9:e1a9 with SMTP id 00721157ae682-820229a0978mr60601867b3.27.1785971707809;
        Wed, 05 Aug 2026 16:15:07 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-820134a9e21sm29018917b3.42.2026.08.05.16.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 16:15:07 -0700 (PDT)
Date: Wed, 5 Aug 2026 19:15:04 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v9 05/12] clk: zte: Add Clock registration infrastructure
Message-ID: <anPD-I9GDyOZSDO7@redhat.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-5-d05530d85d28@gmail.com>
 <anC72Cf1zKcLYWlC@redhat.com>
 <ky2t5IqOTfWMdfZsXE91Gg@gmail.com>
MIME-Version: 1.0
In-Reply-To: <ky2t5IqOTfWMdfZsXE91Gg@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Nf2VEaKJktxH0G4TQTzMRbQfEpOqxx47RfocFAU5rpU_1785971708
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_161511_429718_8446A847 
X-CRM114-Status: GOOD (  20.38  )
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

Hi Stefan,

On Mon, Aug 03, 2026 at 08:48:18PM +0300, Stefan Dösinger wrote:
> I have a long-standing question about tristate/module support for drivers like 
> this: I don't think the driver can realistically be unloaded. I have been 
> testing driver unloading by removing the UART clocks from the DT (otherwise 
> the clock driver is busy) and marking all clocks critical (otherwise 
> unloading/unbinding will shut down the UART (and more) and lock me out of the 
> system).
> 
> I have made it tristate because from early research into clock driver state of 
> the art I gathered it was desired, even for drivers necessary for fundamental 
> operation [0]. Did I understand this correctly? It also uncovered some linking 
> errors that weren't obvious when compiling the driver into the kernel.

Leave it as a tristate since that's how most clk drivers are built. Also
think about this from the standpoint from the perspective of a generic
distro like Fedora or Debian. Support for lots of SoCs will be enabled
in the kernel configuration. Some SoCs that may be deemed to be not as
popular for that distro may have their clk drivers compiled as modules.
(We at least do that in Fedora -- can't speak to Debian.) That way they
are available if needed, however the generic kernel image doesn't have
a huge number of built in clk drivers. Some more popular SoCs where the
distro may run will have these drivers set to built in to help with boot
speed.

Brian


