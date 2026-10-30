Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C143606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 08:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=orq+HJYG;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hLGYpr62
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iKvZ29sEWJfZcEU9wIFw4ZTo/462jt1dW6m5fcFQf2A=; b=orq+HJYG76xnp7ZmbNtXKN4CSy
	GuBP2sG4K61i9d6q6Wo4x+d+iRad7Vnb4kBthYXnyYP6Nc8IrUu2Y4K9VAtqZvJCz/dyULY3INKU3
	bSbOVx9tbLFoOR/Ylvo7MQOBfCPY1pPvYEiMxlu4b0Fw/dtdoU8EWKTpHUzY1TuNaaai5FeDaZtIx
	qlq6OGOx2Z2yn8lO0A4X6WyTzYOyUa5g3q3IIOg4aK80KOihQFwdtlCrWDkAcuSH6305xv/GG6n8a
	BLZUM/QRFBnsADtAHqVRz04y/tCAGHydKW5YvWVSEsOhJQxFXu0mYAtiHnuqhDnxlyOwlUh6Z6FIY
	Q6IMBHPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMi2h-0000000B85O-0dXM;
	Fri, 30 Oct 2026 08:32:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMi2f-0000000B85I-1J5j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 08:32:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EFE72605C4;
	Fri, 30 Oct 2026 08:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B29F1F000C1;
	Fri, 30 Oct 2026 08:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793349171;
	bh=iKvZ29sEWJfZcEU9wIFw4ZTo/462jt1dW6m5fcFQf2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hLGYpr62os5YaII43isVPc3LFbwRHFV19BomfIKQss3uWosrbCjkZQOVmwVFR9mKz
	 6t65/ajJwLXSNYD5nF1B9sgNxSSFnc6gEEoqpSDB3JL0mRUT8hncnMw7ZD/JohlaT9
	 RmLLom4KpWzWUcoANyPxssMKMWqhKpYlpnZ0j0Ip9x3mOm17kvF/oDewSwXMEErpzr
	 SphBfP1MCjUUaVCsQgZKTQYsOjBTI8H68Hpr6GNq0chPzDc/SQleBmNxws8s7G/8BY
	 v/8o6kYdwG1qaMUyhVB+MKceHRlWe9Ra6MJ9ZL7anbwYXdpKjZDc73wWr157uh9IMz
	 +kwRhnci87ucw==
Date: Fri, 30 Oct 2026 08:32:48 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, dario.binacchi@amarulasolutions.com,
	Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: psci: handle unsupported SET_SUSPEND_MODE in
 PC mode
Message-ID: <20261030-origami-tarantula-of-contentment-a70ab2@sudeepholla>
References: <20261029191624.1.I5f8f3d75a566b72250d629ac6f43cf0d387c0218@changeid>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029191624.1.I5f8f3d75a566b72250d629ac6f43cf0d387c0218@changeid>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 07:16:25PM +0100, Patrick Delaunay wrote:
> The PSCI specification makes PSCI_SET_SUSPEND_MODE optional. If it
> returns NOT_SUPPORTED when Linux requests platform-coordinated (PC)
> mode, Linux can assume that PC mode is in effect. Treat this response
> as success so PSCI power-domain providers can initialize when firmware
> does not support OS-initiated (OSI) mode.
> 
> Continue to report an error when OSI mode is requested but
> SET_SUSPEND_MODE is not supported.
> 

So, your platform advertises the presence/support for OSI mode and yet
opted for not implementing SET_SUSPEND_MODE ? If so, it is indeed a
firmware bug as reported.

-- 
Regards,
Sudeep

