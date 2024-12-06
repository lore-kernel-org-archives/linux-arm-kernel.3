Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6644EE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 08:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1UwquMqHQAEbMWHm24NJ3i+17h6zazMQWy5+3k3rLW0=; b=JHUoSOP8OMmzcN+TaMCcvJ73Hr
	sdZjrORsArYTVZsXuBT3Jz3+T+WckoNo2SLHOPqfhP/dQve0sKKd0C9nGDkIXJbp27CsA8e3pBd21
	tZeD2BK1MaWsfjbdi10xsuSK0Y26xmUPsEMiU2bq3xo65u7pCgGnf6MAYAIBQlSB/tRKgZJUPgp3s
	OxouDkNPdMe/YYxcfqeOInrnjFSmGVCGag42juiocYsNOqE3P1jSIpPFqEccEVCFzc+PGNhAT2Q12
	fX/8qcvHuKvWEwq+bYHXt47Flk075rooJOxUwFkBn2OUxwkYa1+CMiX3YDPDF5cnUdRPcfX2++2XZ
	Z5ID1tzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJTnB-00000000wCe-1kYz;
	Fri, 06 Dec 2024 08:34:29 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJTm9-00000000w2G-3UWT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 08:33:26 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-385dbf79881so1798741f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 00:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733474003; x=1734078803; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1UwquMqHQAEbMWHm24NJ3i+17h6zazMQWy5+3k3rLW0=;
        b=V4B4JpgfLG/s9YFYy0RKhLDqauW5hrnE5Jp0ZNXqd65sZvUshvvhyfeZ/BVUsDLHQS
         zEj/ZDJZRXEP/hazDrYh1yJu/gxzgN9RkQtI5oXmbfAdN6dtmETjMmzC2qFr6YN+MVPo
         phFaBodKXNA/j1gDxN3c4ZSbrv1Vv+qn1502vcoicPGGeVP3GNA+jS//lGgCRER7MLCc
         8byaMSSGBKnyGELQ2x0RNppiXhZd3ofh3d4GfBvx36A6xTUsGjf6FvDkvk3jfwKN+9u7
         5f3pTXbyhgj/AzqTfq7wXkEc0PQc1/ryyPV0kAjP8NFfNQkQZs0PRJqVLPjxUjJ+ClQu
         0dHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733474003; x=1734078803;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1UwquMqHQAEbMWHm24NJ3i+17h6zazMQWy5+3k3rLW0=;
        b=tPZtr+APlUFP9vBC4J8D2tSypUB10LxJklpU7ghWFe+UhO9jLsCMPmN0j3imdspUNo
         OrJ9dwhFFE1/Q4TGykot9MawmMNnNNwx7ixQIcvfZ67iRZLQEKb2ibGy+2ao6DL3s5OH
         GtchB3IbN94wkLwav3GN6BNkx2jW7P7UrMi3GcCF9rglEOE3GSPrlYQYlgM8EQDmCERr
         Ybz+bPt7F+tNQEpe1P5QixIyH/YkpjwBHGefToSpHNz97JDPlCbxZDQVGNENarQRqpKI
         jJPKYsJ1WrBLqOAoHfCOTBIxnRIqLAINr06/Ucwbq4wc2XOJNniBexFayk1OchhBvpLy
         vBQg==
X-Gm-Message-State: AOJu0YyHXBnejI1Ka+Mm9/PO3g2Mb8pw1nLf+aguS5oXqkuFMnfeo8Xg
	bC3g6Ck2k7aoGpEQa+at2tqMFKyK6hXtelqZT7Wkb8XDaOi9/06SJAacSiIRMm13tHDzrCVuDnb
	1QfEOYwuHnu2pOTqpueJQPkjJiP0a/DfTGHk=
X-Gm-Gg: ASbGncsLe00XZsdWwE+wmdjyDyFxZV6JRObEWoQBl8ifXB4CP7kSAYLBGksfBoAECBL
	DojufOiKzq9YaCTMvA5KuJKMSZNK8Soo=
X-Google-Smtp-Source: AGHT+IEmuAIU0mTKGq/6tyiv+faRyxylaFEW1ymbM8aaM75TuBDPrX1SjlYvQZ+S74OUZZ/o13CLBsk08f2Llqzwq20=
X-Received: by 2002:a05:6000:4026:b0:385:fa26:f0b5 with SMTP id
 ffacd0b85a97d-3862a91496emr1291250f8f.20.1733474003070; Fri, 06 Dec 2024
 00:33:23 -0800 (PST)
MIME-Version: 1.0
From: richard clark <richard.xnu.clark@gmail.com>
Date: Fri, 6 Dec 2024 16:33:11 +0800
Message-ID: <CAJNi4rMfhZOCT+7Ki14vUs+dZbv9cxCZ0s+jgn6=_om4NTgo_A@mail.gmail.com>
Subject: Question about interrupt prioriyt of ARM GICv3/4
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>, will@kernel.org, 
	"Russell King (Oracle)" <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, richard clark <richard.xnu.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_003325_866202_DEA75DF2 
X-CRM114-Status: UNSURE (   7.89  )
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

Hi,
Currently seems the GICv3/4 irqchip configures all the interrupts as
the same priority, I am thinking about to minimize the latency of the
interrupt for a particular device, e.g, the arm arch_timer in the RTL
system. The question is,
1. Why don't we provide a /proc or /sys interface for the enduser to
set the priority of a specific interrupt(SPI/PPI)?
2. Is there any way to verify the higher priority interrupt will have
more dominant to be selected to the CPU (IOW, the priority is really
working) in case of multiple different interrupts asserted to the GIC
at the same time(some debug registers of GIC like GICD_REEMPT_CNT :-)
to record higher priority wins)?

Thanks

