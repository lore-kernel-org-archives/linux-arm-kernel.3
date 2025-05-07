Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A489CC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 13:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+78+2+2l+vz4thd4fzsZIiDpYheZnEoUC6X/M8JFQ+I=; b=1mocFQRZ8C0yMUOe/2T4Mknn0i
	OEB9KILsnrV8OZ6I5kAzf37oX0MWckVfyWhIauSS0u/y/dITyQh69J6W9D5fDCXOlDg8d3KE7qxPP
	JM3ZV5YfKgAAk1cstMr+SpLcDk4mrMnlVU7t6kB3hTshpSgzmGl+kzyVjiZAkX0obG8n+jqoKb66T
	vh8Wwi1sbEO0QY7SR2eYIH1xFIPqQdAvkyZ694+v535VR8kTv3cKNPP54apaXInNF/zk0zb1GfCMG
	xUz/0v1se6VmKf6GkgHG8OIRCR+rPwVUAAIbacJYKAH6bpbi/PEjzsc8yXENKzx1Bo8X1Oop3nkgj
	DkV8Rjtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfF4-0000000Fekh-1TM6;
	Wed, 07 May 2025 13:55:22 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCf2s-0000000FbIJ-0DDr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 13:42:47 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746625362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+78+2+2l+vz4thd4fzsZIiDpYheZnEoUC6X/M8JFQ+I=;
	b=shOSxWFZela5XBLLbauvJz9BG7m+vqSD0Gy+bN4oCEnkdqUNvURj+ZqKa26k7Yhx050RTI
	y0evKBTwX+2HhVBFGikRYaSMpFzbdf3qCBFhZ1aVeYmp1HL+Rlqj0fwMh+IoUxTiZejTt0
	V7HSXvo9DwC8S7pe0MzLSkm4/IJZFFe4UEOT58nZIam9xY6vye2DF0uvNTN4uRiZ0h8CSi
	jwN6IqfZ+a1Ebi5yyxkwOsY2lE9ZI3J1lKOTngOD0rDvtVTg7ylZPDQhznHloukop+QMK+
	XqDCXf1o9eFcrQA7mNGJOMqVjHA6v1ycMdgcbWUdmxfrLlgm0j64iwqgWzw2wQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746625362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+78+2+2l+vz4thd4fzsZIiDpYheZnEoUC6X/M8JFQ+I=;
	b=NXcqGGelg10I9lqrw8our10jEDm1FPuD5NTxtrDwGvSU2XzWT6j6WMq8MIDa9K547nbkqR
	SlQVWlkvvexVEABw==
To: Marc Zyngier <maz@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Sascha Bischoff
 <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, Mark Rutland <mark.rutland@arm.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 20/25] irqchip/gic-v5: Add GICv5 PPI support
In-Reply-To: <86a57ohjey.wl-maz@kernel.org>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
 <20250506-gicv5-host-v3-20-6edd5a92fd09@kernel.org> <87zffpn5rk.ffs@tglx>
 <86a57ohjey.wl-maz@kernel.org>
Date: Wed, 07 May 2025 15:42:42 +0200
Message-ID: <87ecx0mt9p.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_064246_227312_66C1813C 
X-CRM114-Status: UNSURE (   9.44  )
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

On Wed, May 07 2025 at 10:14, Marc Zyngier wrote:
> On Tue, 06 May 2025 16:00:31 +0100,
> Thomas Gleixner <tglx@linutronix.de> wrote:
>> 
>> How does this test distinguish between LEVEL_LOW and LEVEL_HIGH? It only
>> tests for level, no? So the test is interesting at best ...
>
> There is no distinction between HIGH and LOW, RISING and FALLING, in
> any revision of the GIC architecture.

Then pretending that there is a set_type() functionality is pretty daft

