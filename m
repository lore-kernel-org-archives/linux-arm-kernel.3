Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1642CEA3F3A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 11:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IIIH8rs47eeZASgfNwrXLb1U2ER3O5vT4pgpQkDTOCE=; b=kpp0x4DiL1OucYcTPQJXeYz/vA
	VW43SDDniIRGTreB3w56d11fXmDu6PLO2i/gB50ieq8uAMyRLx9fxhTbk+6qXS734C2iHS+XQUkyg
	u50OgW3hYzneMjqr2LEJSVbnystzs2bkT3EwmtlYDM18pyr17iKf8M3IYezySlbvtrvOhDp9KK2N8
	LlGlCCPS3pDA+LDLFMRd+mfwHfFp+GzkuLr4muwXVgW3dDyq62dFKLN5cDDZbGSuIZZ7yVvMdfLsG
	o53d4tjsF+mQxr/rSqCRSPvtZKsmJZlw+TpTjTFS3h8vAdhlsI9SC5cKt2GArQ7b3kGEWGfpqRV8I
	b8UyouQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpleK-0000000GsIk-1GGb;
	Tue, 10 Feb 2026 11:11:20 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpleH-0000000GsIG-3W98
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 11:11:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=IIIH
	8rs47eeZASgfNwrXLb1U2ER3O5vT4pgpQkDTOCE=; b=ZvEJ4YmbBjtfe3ItFGC9
	0A3ilKieAnuoeLsLcTO/KGKoPkOvC0JUE25/etzCrxCErQCrLrBUwHThiGNf61Fs
	ym3qFHjDsQ+Iq/3lL9k9RZ7A0Rj0He2l6dCs2UMZu/Yh1Sozi6MvCVkPG4705e5v
	oEP8DxAa79F+178kq7p3S62BmTdXGUFAS2O7m8eXNQCg8XPZCMyDWIFr31kaQCPO
	EEaSv9vlKvHHHOi/dF1uaRsoerWutfnBMqVu+XqLGFYollME8mi8OkKnf3A6563f
	8IlUah9hI5el4tCtL5U2WHJvQE3pDY6vaqbv7bFGFj0minuNGnVdpcAEpVJZO0gV
	3A==
Received: (qmail 359802 invoked from network); 10 Feb 2026 12:11:14 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Feb 2026 12:11:14 +0100
X-UD-Smtp-Session: l3s3148p1@XrhVUHZK2L4ujnuT
Date: Tue, 10 Feb 2026 12:11:14 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/2] firmware: arm_scmi: Implement
 arm,no-completion-irq property
Message-ID: <aYsSUlbsJoSjj_Qg@shikoro>
References: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
 <20260117010241.186685-2-marek.vasut+renesas@mailbox.org>
 <aW5ifVcxVf6uux3m@pluto>
 <9175b8aa-18c6-4dc1-8904-c26fa1dc7428@mailbox.org>
 <20260209-quixotic-offbeat-stork-f1d310@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209-quixotic-offbeat-stork-f1d310@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_031118_676764_EBD5B7F3 
X-CRM114-Status: UNSURE (   7.51  )
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


> As I had mentioned here[1], I am happy with it and I will pick it up for
> v7.1 once I start collecting the patches after v7.0-rc1. It just came in after
> I had sent my PR to SoC team for v7.0

Great, 7.1 is good, thank you!


