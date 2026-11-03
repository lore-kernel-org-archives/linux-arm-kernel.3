Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAD9606D812
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hQ5fAi5V;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NZwjkwaH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=; b=hQ5fAi5VX3wHBm
	n02EvmQ3TjnTaA6eL2uvd9DoRbSkyBbpGQEr+R8Qm7fnMcoG/4gXituPTP3WZ38Jg0bupkme4agGq
	3Gk1JmXukkrUVPCWSyOENI6weyJGHyRaDtjQr5Mr3PAYe6t9cssSbWqjIdoVJ2EbPCowHRVN6MrVX
	Djjn0iwdG8Ctb8qHApAwax6p3PmtlqX74vq294LjPH83tRuJuGiGJT/8Z/xqmluLdeVD//r3hoRux
	KgEDC3L2xJBDVpAwRrjwJeRed+ATcDp60Gj/xx2uimTgcDFIzBBr6G3lm1BiV/eEcIrYx3vZ/pCFV
	hl4nr3PlGDZ2inNT5C7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOH6a-000000034Ud-2h2K;
	Tue, 03 Nov 2026 16:11:24 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOH6S-000000034OI-32KM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:11:18 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-833e671ee9fso4487079a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793722276; x=1794327076; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=NZwjkwaH+rhEv7gd5E+kFEE59IGDrKmwZXg9ecf5Ex22SeF/iyzO0UKgf7IGNb7mnE
         F8s4vBjnm8qSSu+7ncozbC9BNdaVQriJQTKPZFVL4JrY9i7r4EutAMNvxpnEtjsGpG+v
         GMmf4qWoH3Hm32+SOH8CcfdkmPLY9n+V9qe60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722276; x=1794327076;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=KsT4nXmhAAoGa6yWqR3ZWcKRBHvFmDV65PvKTquNPgNVemuEWSa8pHcG3YCLGK6tOy
         OWaf+sd0d/L6SvMr46/HAYJiaVB0B0mJ6S9d06job+HV/pdrvD0iYKgFV9eTcVDBdj2u
         ufpe4L0BGk1ydCnFH+imP2QNWEdrCRIdeqQbQbaOMABn5QRIQHqI1xYUYau8Vw+d9w7K
         KbjWqzYD7VOnGYYfwjameYm15C5CLo8dqbUpINbtnVnCe4xRtapzCQxpLATU4fQIkQta
         ziJ6d/2yHG4eoGKOdXFnGi61ds4KSukvGJ4afaJNNh3nFw4RhJDVo5P1STJiuZNrYlM7
         wt8A==
X-Forwarded-Encrypted: i=1; AKwUvBzBkFfuvJxauKTnd1jgEgOChLSz5z1OiNdi2/Awd1CD1wqyxUfYgJyFSRA3wzziXSNvo4Pdbui8O+7aKcGs4Lcz@lists.infradead.org
X-Gm-Message-State: APuU4Z8bIhikEhkRJK0KIL331FCkFh87a0Ok5NpoSzA1VLtkspyB9kV4
	Ps1O+iUIKTJqXJKmeH+YaqbcYL/m1os97CSrTQmr1jLukwa2YnkA2GR1Ts65FO04tw==
X-Gm-Gg: AYBFou1UZjmNMh3k2fwr+VFFv7LiF20/4LaoUbfRSJyYtoCs4O9ejiB94O1wQu9ARpq
	V2RHAzV3UYUh463VrXlxuGOFAWoFD27947jXzkzN9ZQoFuaXU+DfM/MMgbey7FpzZWWy/pmhmKl
	VxElCitJyoB8PClCW5QRoQdUNeYH9AXjVL704AtloG0XFeG3nRYSOOumrg1jo3W1Myd1PKFAmiG
	DZuWVS8s+uQ7bVzjrZpV5E0croIwD2jP+1z1wsS3goHFD3SzH9AQ00u87LElWFpevbt6Tubvhkh
	CZ5rrE3i50QRIPTT8fkTwO5r/1EGnujokHJcuUOtDSX8qX7gI1+ItP2sXDff2YEJs41/lWbFR6e
	XwkYDQlpxKfKXnraRf5KoMZgYZMt1Novvk6rbW/q/nZYrvYgx1eBjq79g6qO4amYmDjdErZQ8Ug
	janQsMM5CkB3DEKq91EeuAhYq6p3XXjXBhjJD3V+XUBJP/+OfqC3mj6Q7ChUDpG0JE6ahbtRMi5
	IvvsjBFAXUH8spg2euBLHDkUtS7uE/b5ap1CCUx4mvXBkqhiQIjMmrzIi115AZx7LbjfoLpohlM
	losJ5S6H76+oTfpMJ3RqjZGW5t3kSfFkK1I/j5ho/SpXH4tyaaniImtqaAfVx8udZlDLCK/dcWU
	+yH/93Lcv6RxrD9A=
X-Received: by 2002:a05:6808:1691:b0:4f1:7c39:8a7c with SMTP id 5614622812f47-5640df628e8mr8758951b6e.62.1793722275736;
        Tue, 03 Nov 2026 08:11:15 -0800 (PST)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd95dc0sm11688383b6e.6.2026.11.03.08.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:11:15 -0800 (PST)
From: Raul E Rangel <rrangel@chromium.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Tony Lindgren <tony@atomide.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Timur Tabi <timur@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v9 4/8] serial: 8250_omap: quiesce DMA IRQ handling before shutdown
Date: Tue,  3 Nov 2026 09:11:00 -0700
Message-ID: <20261103161104.2449407-4-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-4-9159caade148@gmail.com>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com> <20261102-submit-serial-8250-dma-cancel-v1-v9-4-9159caade148@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_081116_761406_FA443E45 
X-CRM114-Status: UNSURE (   6.50  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reviewed-by: Raul E Rangel <rrangel@chromium.org>

