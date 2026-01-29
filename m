Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E612DD61011
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 13:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3FAbLg0n8TvG7sx8QobTC/6/6GD1GFWRF9jfzZ0OiBM=; b=28z26BTqJ0gc9T51exy7R3P8xm
	pPwqywl2jh0T7/cB7yjQk0+EknUzhiajmtxo7jUYMZDHjTKmYiu8/ZqgAX9krXC6HU5/d40VbG6Ef
	NkCB+/0xUTiFRGyUn/JIU6mks/tKoo+9DLSiElt5yUXF78sbG74lw3vuBQRHpzS3Kgso640GFhwyZ
	/eH/GSATjS0Toqsvs9iK1BMmumK+JjGKFZqWTa9SxhwQ+dBXfD7038gpTiUjUNC8l0LVES+3nJeq+
	bSbUOBhY8gF3jX4NNHZSNYZV7EbjqNAnvXSXCAtxHExsNcnpYA+1QpFPS6g7kkg3JIy+0zcGZgznq
	Y1N/NX+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlS2Q-000000009pi-0Tfe;
	Thu, 29 Jan 2026 13:26:22 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlS2N-000000009om-0CZ4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 13:26:20 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-658d3d3ac37so915192a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 05:26:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769693177; cv=none;
        d=google.com; s=arc-20240605;
        b=aT1EODa3tRmauX6rJZO8EB3Cz7NNIGnU2Ri4EGDXHbHASvOgvYXHLr1XeKOf6xolbM
         qinfoJoSQLo0bQW376EVi52Ht3JFvJyguyu25QBhBLwnkXgf/kQtmgl4zSz6ay3uM88C
         hu+C1ucfq23oqSSbzgJK0Iw4s636yVc1Rfnykhq3cx8sNAKYHfszqZbazVfi6ErNr1lI
         UD37H5c8RKT1/PKXELigJdRn6EukfMYu92zsSzaXt7XEZ+VZzseG436CRf5F9C/YcQvF
         H1V3XPpDpltVLWwBf93mSD68z+IEjAjrz0rJLnMvtqf4mFGq48QY0lPAjdtWI5GLOasN
         IlZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3FAbLg0n8TvG7sx8QobTC/6/6GD1GFWRF9jfzZ0OiBM=;
        fh=IiboRqEk6fTqGtMQftQ+8XkGK9qGC4uLlZam5MKk1OM=;
        b=ZJrq5E/10BuCN2fjPNwUwR38f38UUxOecS+10A9dHZOMpM/Yd3+dlS0n84CUtHkyZg
         7ot5vmHfPnYpIxVJ7gAMAr344RhZOFYRqOMX8jdjrmgNwdt6CIXv5RbAnJjYfntCWen8
         l9w8JwduJSNP96yBfbQkiN8br/sNkg+1nbyZJpr3beFK+3INB0cvt6ZN6tEnI5tcRdLb
         p9I4QbQNQsCbH02KeIGLw1mL+UvQbYtJvMZsZO4dXgPh8/nN/KIhOjgeXm/pmb2OeWJb
         mu92+ethTkp5s+/LVEW1X+9/0kftUo0OVPIXashn79lORNrVrYCBeUXgTDq9GKqefUQf
         6GCQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769693177; x=1770297977; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3FAbLg0n8TvG7sx8QobTC/6/6GD1GFWRF9jfzZ0OiBM=;
        b=zal5DVof01PFiRerjUzbSYm0UnOOsslQGaCM7ee9Dpi2WBQnLjO0Tg/yvficndzAfa
         h6td1ZgbV8FZhgc2ybJNpGrvSOPH35+1UawZ2YqBeNbNhaSP85LjsB59VuAiVqQpRV6q
         R9d6PwbQ4gVdvTIjhHQFy0x5dxo6r4c5yarxvCEMQT1je06hn+kvKBBD/Fie7oQVTACN
         mcURaSbwxx6p/xihxIoxivd/+BwI/fHcwrOQeF/6FptQpVKpTcLrsgaDQqKBC6VYJkBn
         HX65lxWQumKzLCrU7rI5/wY5zd4uS94tR6ve4Of2/lvp0GwXUtq9YFr1whJW1BeTzMz8
         jthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769693177; x=1770297977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FAbLg0n8TvG7sx8QobTC/6/6GD1GFWRF9jfzZ0OiBM=;
        b=GPY3qjjiNrgCfaQPSqr02MkwlEq7dFddbtqwuBNbfW9KkqVY8O5J8W6acuMHN2/F8t
         tuaeHIXPPh29WEc3k9Y/h0CqUQgiki9M/oSHGV680UO7QY4wqr6+0cqcTEz9UiGNs6hw
         irwDtLDKAofo+GgJDbYc7xRrAgI6FECSYccFDzEc4/YvMczYioi9+RVI0LPPydn1j/p5
         29JsNOHVTKxYnp/5NZ3W5YbPQt/2JposFwSU8AjCO7Vnv4zurlH4rcv0dhJikM0CbBPP
         gduPTMj0tyMbZ77x0tIL7Ue/W5J/QoQ4tCl07bysZsXDqWSaK5ijP9/jfrAjyAT2DHPB
         2v6A==
X-Forwarded-Encrypted: i=1; AJvYcCXoyYlw8Yvr2UStM7hu+PCo/KkxGTkqxKFS0xqRtr774FF7EydFE52R7ae6CjgL0R3JW6FloJhlyrEmrmQq6/d1@lists.infradead.org
X-Gm-Message-State: AOJu0YxpLwfl6T/Xp+pC5WRw0tTuPZpbo0zsdDIPAsK/+jmmex1fILsz
	nRP1/9eeL62EleIH9ebRDoDfn8/Dp/SZmMj57H56ADRtyBYJ7XIUPdue9OAx4wkDFL5HctCboa/
	y+Nmf35FM+qlKu26ckrjVfIsgjEF4zmFiLQyKxfK1Wg==
X-Gm-Gg: AZuq6aIoBdGWOQBBeA6BMKlFePV+xHhBts4x2e9xcZpIjo7FfpQtNnWpvNh4JZdGFIx
	4T/nUYIBkA8ZgMYOvf0nKRwracTXwIoRzn+svko5o60KWJF1CQLSPRwJ7A8umI0JiBnSfheM9nE
	xJKzKkS/Y9DhnCTg2DQ3kNVQOeAoTFP38oWjH2DrRj8h6edMmVKUGt17BqtN9LyTe5sHPZ7/VJE
	L+HnWgjW0xPsCwZOyQ6cUlX5U0tYYna7N/X1UvDiz6VmA4I1ZBToYiikqVglhzS4/aQFBik0Jzg
	QuOErZ5iOBQRr2D2ewWy8hiu
X-Received: by 2002:a05:6402:1d50:b0:64b:6e44:217 with SMTP id
 4fb4d7f45d1cf-658a5f8e7cdmr5148739a12.0.1769693176886; Thu, 29 Jan 2026
 05:26:16 -0800 (PST)
MIME-Version: 1.0
References: <20260126092159.815968-1-vincent.guittot@linaro.org> <aXtUNxEmxcvuNj6J@shell.armlinux.org.uk>
In-Reply-To: <aXtUNxEmxcvuNj6J@shell.armlinux.org.uk>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 29 Jan 2026 14:26:04 +0100
X-Gm-Features: AZwV_QjGAIu9W6_VpH3QHcTFTkleDIzRR41H4AQo5SaX9LTdvMXOOFKWjz1rXio
Message-ID: <CAKfTPtC6TOnrHbyS4mH05wF78OFOMp_ST1UOeEgNZ7+hhh8gvw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Serdes: s32g: Add support for serdes subsystem
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, ciprianmarian.costea@oss.nxp.com, s32@nxp.com, 
	p.zabel@pengutronix.de, ghennadi.procopciuc@nxp.com, Ionut.Vicovan@nxp.com, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	netdev@vger.kernel.org, Frank.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_052619_092787_27CA6214 
X-CRM114-Status: GOOD (  11.02  )
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

On Thu, 29 Jan 2026 at 13:36, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> Please drop these addresses from future patch series:

Yes, will dorp for next version

>
>   alexandru-catalin.ionita@nxp.com
>     host nxp-com.mail.protection.outlook.com [2a01:111:f403:ca09::7]
>     SMTP error from remote mail server after RCPT TO:<alexandru-catalin.ionita@n
> xp.com>:
>     550 5.4.1 Recipient address rejected: Access denied. For more information se
> e https://aka.ms/EXOSmtpErrors [AM4PEPF00027A62.eurprd04.prod.outlook.com 2026-0
> 1-29T12:31:01.197Z 08DE5971FB66165F]
>   bogdan-gabriel.roman@nxp.com
>     host nxp-com.mail.protection.outlook.com [2a01:111:f403:ca09::6]
>     SMTP error from remote mail server after RCPT TO:<bogdan-gabriel.roman@nxp.c
> om>:
>     550 5.4.1 Recipient address rejected: Access denied. For more information se
> e https://aka.ms/EXOSmtpErrors [AM3PEPF0000A798.eurprd04.prod.outlook.com 2026-0
> 1-29T12:31:00.781Z 08DE596525364766]
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

