Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCFCCAC594
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 16:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQIVnV0YzVXO6tmmGMhC+lDkzjuD/leVXqK9pC6E4D0=; b=lttRaRhYZzv714QOh6zr1fBIrS
	dHSr0knLoWKCy4234g9WpHgoDKoqRq1a/9+7wez6TgEJHMjpgdjiXbUi5SxqEl0PkmSHP7hpDe56l
	2WA1lFRMXrSdvml9rFtds3ZA3b1EMvouVEOzUDYi0alMvpkugwtJ02NSXzNNm7RsBq66Uk3WQ6J04
	KFYQNuBKvEnCxYVc6zphkw20goQjAhderithw8T/oGUsb7QGMqzVULyMuHcf6zPkvpi4uDamabnMX
	BBufgEXHq6TNmF2NYVQUk2otv9d+me3ioDGiq0rN0q59f664MGnARYZ2tafyUAJ8g7yd67zYkDoDQ
	TI2wtPQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1Q6-00000008ac6-3CO2;
	Tue, 09 Sep 2025 16:42:14 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvurD-000000064KE-1VaJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 09:41:48 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1757410905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vQIVnV0YzVXO6tmmGMhC+lDkzjuD/leVXqK9pC6E4D0=;
	b=qvIrj3JI/3eqkUwq6c7mN250yjGhwbss1V4PWDI42NO5zsdvHD2Px1NRtkqPlEIjgBwMFb
	vQev/Q2LW8Qp2bNeRphhOfJHoH3h2un+pdCt9RxfC+4Ed6YB7wpH48XJDndcdnMntJ1yFj
	kilGhrrnBQmjtEerSJEmoAb06/56VDdHbIq5U16yEErKkLWh1kOau7gNJHVyrMffSOMlxJ
	WGafxpsB9DqdLwmJjizjhCqZ5BFt+6jN+yuaYCqRiNdyiXo1cCR5h0OHb07YgzGLpv571d
	/1azegSeCqeBr2R63/2dfI+0DDySVTggpIid98nHwcsFgPqCgXrBcyv7ZO5qwg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1757410905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vQIVnV0YzVXO6tmmGMhC+lDkzjuD/leVXqK9pC6E4D0=;
	b=/FYUewtTPcwOHupZnyoV+0oOE5Qc5NLcJmsTOEecyy0ww+II071SyAt6Jz4zdM0VnyZsu2
	4eCRUK+q4d41yLAQ==
To: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Sven Peter <sven@kernel.org>, Janne Grunau
 <j@jannau.net>, Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark
 <james.clark@linaro.org>
Subject: Re: [PATCH 12/25] genirq: Factor-in percpu irqaction creation
In-Reply-To: <20250908163127.2462948-13-maz@kernel.org>
References: <20250908163127.2462948-1-maz@kernel.org>
 <20250908163127.2462948-13-maz@kernel.org>
Date: Tue, 09 Sep 2025 11:41:44 +0200
Message-ID: <87a534vu7b.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_024147_563693_8E8BC44E 
X-CRM114-Status: UNSURE (   9.11  )
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

On Mon, Sep 08 2025 at 17:31, Marc Zyngier wrote:
>  
> +static
> +struct irqaction *create_percpu_irqaction(irq_handler_t handler,
> +					  unsigned long flags,
> +					  const char *devname,
> +					  void __percpu *dev_id)

static struct irqaction *create_percpu_irqaction(irq_handler_t handler, unsigned long flags,
						 const char *devname, void __percpu *dev_id)
{

No?


> +{
> +	struct irqaction *action;
> +
> +	action = kzalloc(sizeof(struct irqaction), GFP_KERNEL);

	struct irqaction *action = kzalloc(sizeof(*action),.....;
> -	action = kzalloc(sizeof(struct irqaction), GFP_KERNEL);
> +	action = create_percpu_irqaction(handler,
> +					 IRQF_NO_THREAD | IRQF_NOBALANCING,
> +					 name, dev_id);

Please get rid of these artifical line breaks. You have 100 characters.

Thanks,

        tglx

