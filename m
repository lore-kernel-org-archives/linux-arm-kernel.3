Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8E3C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 11:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dAqrnR9lpSHDZlAAETS+32VSLf1k30Eg11RRVWeYS6I=; b=Az7VvtOnXFYPe81pg+mmIvK0Zm
	/8zv4V1/a+nHrJZ3F2stD26q9rA4vD0YLDwUj7wuiFwKQl4SuwQs7uAjG243w9FJ8v98MjnrTkNbf
	YzZ5zCfZgISFoDsIbne2n5Sn9Lf0wmYNi14z2tYmqVmQELlzNTe9FjLxyNSojJvpJMLAUubKCWe9k
	govfI7qJ7O9yxu7DsrC1stIfxYufySFyEkeZtUYQ6tAXv2+8d+yL/hag/iodFeODorzw4+cR5o/8s
	QPAgpu5JcgjS9Z7IHlzwMki0oXiHop2MOo+UO/X6ELymJtlKLG24zZPDn5x15dzSA7ArQq11zTvs4
	SBt7Fvmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFt1H-00000003Efl-3fwa;
	Fri, 16 May 2025 11:14:27 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFsis-00000003Byt-1SM2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 10:55:27 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747392924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dAqrnR9lpSHDZlAAETS+32VSLf1k30Eg11RRVWeYS6I=;
	b=wFRyTgh5iLzemsXj0MthjLhFkFk+T/oUw5so4tKc93df/qp3XUEjP0//91ABrO72LDZWWA
	6DOqZ2GdO8dB4KQ2fvSWcSImMetRprkZTdyqi/suBJgic+6Y7YktkkK+V/cvBNH41gSLu9
	yxTqypSv5u0VKOLcKwO+MNZgkYC/ZYnZk4DUfAt0g3yWrDfpvXbYUkJPw+KY9wu2lmt4uo
	9zAL3k32Mig1jq4ZJeU+OndA1bjZdk2F2666NyE+R16DTtb78uW7YJyWTRR7G+Qo3zJ/vW
	xL6O8xtEU5h251EoV00skrMpgNGcr0pV95olUSRyz/dbeEzfpRcvtf0t2+Z0kA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747392924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dAqrnR9lpSHDZlAAETS+32VSLf1k30Eg11RRVWeYS6I=;
	b=hj8ucecRwdmcFj2oYvgQ0kQwtzo7OZ50CexMIsZVvD8IvuPM4gpusBdRiJjRlyhDME/vuO
	sYiPVi1U5uXAp6AA==
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>, Manivannan
 Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Toan Le <toan@os.amperecomputing.com>, Alyssa
 Rosenzweig <alyssa@rosenzweig.io>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 3/9] irqchip/gic: Convert to
 msi_create_parent_irq_domain() helper
In-Reply-To: <86cyc8g7di.wl-maz@kernel.org>
References: <20250513172819.2216709-1-maz@kernel.org>
 <20250513172819.2216709-4-maz@kernel.org> <87h61kj10o.ffs@tglx>
 <86cyc8g7di.wl-maz@kernel.org>
Date: Fri, 16 May 2025 12:55:23 +0200
Message-ID: <87bjrsj04k.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_035526_527242_A95E2D59 
X-CRM114-Status: UNSURE (   8.46  )
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

On Fri, May 16 2025 at 11:47, Marc Zyngier wrote:
> On Fri, 16 May 2025 11:36:07 +0100,
> Thomas Gleixner <tglx@linutronix.de> wrote:
>> No need to resend, I just hacked up a few lines of coccinelle script to
>> eliminate this offense.
>
> I personally find the rework much uglier than the original contraption.
> Variables declared in the middle of the code, Rust-style? Meh.

That's not a Rust invention and we already moved over to do this to make
the __free() magic more obvious.

Thanks,

        tglx

