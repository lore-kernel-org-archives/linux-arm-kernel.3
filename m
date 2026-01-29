Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA676D61011
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 13:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUbc9YmxzZyQuCfYvCcWLpHnYb4bvtYeu1C4sFcAeps=; b=nQFXMgVraOO5l04NFj5+Cfs6VG
	6KYzQtDYUXRApksjFE2QjFjX8BSqul1ty+277Zwq2Q2QbV72lM4A+n5FNSf9m5UOCl9fpD1kNOxBa
	MMMopuXeo7+anXMhR2eKJhw1PKbd+szPI4wY8Pn4+8e2tvt+3KY/txTI9vDptEbb2Hp5oFW/dIuRW
	ZV1Z4UL8rD9nP1kbFrfkoD7E8SJvdPD+tigLvu65XUSahkIqVn2/ooTkDeCYWcEEHbNv5up0TECLc
	OU0WRGhdgE5ft8T312w0G/RjaQvZYZ4sXHgdI1Vy/81k1j2INKNLocYMtIiQxABWagiNXv+hwAZRP
	qPWD3jyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlSC8-00000000AL4-1luW;
	Thu, 29 Jan 2026 13:36:24 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlSC3-00000000AK7-0vd8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 13:36:22 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-124afd03fd1so1426161c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 05:36:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769693778; cv=none;
        d=google.com; s=arc-20240605;
        b=ZS5y90IL3EVk/tvVuogPOSWOoqsDE0eRSrcJKeYKhnTvCSWtq4xkcj7pf+KcRFyXiJ
         RXcUWJGX+FsSVIoZxmAMB3StQrK7QQcruJzqxLDRoyh6rKUcJWEZ8/ay4mV44SHoN86/
         VeBOctxyjVJAfLBvnGGR3d0ioYMOYWbwG24qxE1FZbzU/mH43o45VD7HttHQ7l8yjIkz
         Z39f+TKN5+69rl3aGYYixqYklZo1xD+nqOQMjiQvrABXLAHJ0wCiDfp7NqLkIcTpX/eG
         t8vVJa5oftBs9TpJOYQGq0iUz44eGg/kt6DgRt3a2m+wU619SaZVr0Bi/70w/I4U7C/3
         bFtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OUbc9YmxzZyQuCfYvCcWLpHnYb4bvtYeu1C4sFcAeps=;
        fh=Xc5Xt0ab7znbjdoLFGznkx/p13SpMzQQ5rHgQy6QOxI=;
        b=HMUKrx6VB+5E4dayWkPOCOjpHFmku0cSMAgH67gY+KPkV5PifCEi0UBn7Bf0phiv6e
         qisa607JB6LNZuRzVA6K1mhitSe7FzxFmIgQE2fxB/d3BP2Rv1vkOc3kA85KpZmMKADr
         QCAgrJGHeqT8a7Y4YMhbTheNrYLz9Hbl3QO/4GosxIUGVaNNd34w9kdyZPpknodaVMLF
         ohZ/O0StiwP6HRDH3lmuGAq9AAEbKTMoexzfsNFPRXjOOGPkkDkw6sS3mt8gnxJFrTo9
         Hrpy91waoIY50xghuh2wqo/G5SclTo8SSWdRKMyq2RWBPj7/U0JoSSs7rtUHE2angACQ
         sk+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769693778; x=1770298578; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OUbc9YmxzZyQuCfYvCcWLpHnYb4bvtYeu1C4sFcAeps=;
        b=LN+IYv1MG3zFFG/K8g2dkpyYfC206LycGApFA8t6yTnsJuLOf+kK+l1IlCHrSjL097
         ec1ns/5J8lKYlAM673AMLQWsOlWB1EsU6ld4+FDc29OKmTIzJyW/fYLNVZTMNeD7/Swy
         5E4RVKytmjC6b6RG0R3TkgOhkroQH3RUnRSDg8dmLeAxyL31/SYh6NvK+aYexP8vTPkd
         oCqy04hXmONM5wq5S8A5nGElXJcfB8aJDlfDAN31sgeap6T4E/DSjjdEuC9hsvgEVaN7
         x//FblpA6jbSoC2YV+AN5h5j2E0BwlzBgcawwI6+cz3YVcFwxV0lbZpDrT/jtvZd1zud
         p8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769693778; x=1770298578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUbc9YmxzZyQuCfYvCcWLpHnYb4bvtYeu1C4sFcAeps=;
        b=nvyYGpW1nn+USjON74S7STtCXlsTaINur3WS8bIvQuqDnI/KtU6M/UAOoxEwbGSQDX
         z2+HO3KMpiyArjpwBnwgsZq5ofusHztSYmap5+NB/SjAlbxkpL4di0+SIV5Y5Rvum37y
         J/PVVNYitfRAmAjan3CMUnkHt7VyLCkZu3LRy3AcHkpoStTzcqd55arn++WCEbNXXhwq
         uyqDix/6Hw7nc2Yz0UpRsQNkVt9GkpMKtY21eMWz9kIXYQHOYIirsq49U0cSg/CPJNTv
         lLj4wujlbxbsK0HroNhCQO11cXG66EeC9HYfACqkIzMZcrCQdrvRUM11xH6a5uS1Wx2k
         mpgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBTm8+yX7OAXS4joiGmK4cdDVqGcg2fP0TrNTeXDI0KYQi28JkAnke1A3aydX9CqhJ6Uw05i7gDaJTMnl0nR6t@lists.infradead.org
X-Gm-Message-State: AOJu0YyWS7bnLS/lzy8gezg50gvKWbwRyps/Xl5DZtuudKP52N810Bvo
	K+dxk4kmhNk//nQPCqo+RwCsG20wYxHz4pHZQo8IThwd9+9pP+pk6QaBTyg1egn+dLQkvw8Rra2
	2VWdb72FlkL8k9A093g++R3HYFAxtdGhzj9SY4f5qPQ==
X-Gm-Gg: AZuq6aL/kgJj7tBGhquxAgCQ/Vtmfj6/MqUdNaLHPCZY6muWTrdKRiZP1SN4tL9L+NO
	sbx7n9xKGOPg9TXflOjefrmg1+9ODdJKLw7/3CV0O+l0BSnFWcQ7o1C4uUjiAMMc0ZYt+aSe+Td
	E9ByoSvuTx7T0BGDbzzcPRHPM+n0Pfxl6cktGapvLcfdx0fF0Ortz00SCI8jaP6T7rr2U350tB5
	XZnw0a7UT5CVLGOb8WwEHVzG1wO1jX7a0eefqcfuLvlj3V1pKs76B0QzwdXDKT6CY1lWaaOo/Hl
	vKHa1af40919QZi89oZtPWrl
X-Received: by 2002:a05:7022:b8f:b0:11b:923d:7753 with SMTP id
 a92af1059eb24-124a005f58amr6177136c88.3.1769693778067; Thu, 29 Jan 2026
 05:36:18 -0800 (PST)
MIME-Version: 1.0
References: <20260126092159.815968-1-vincent.guittot@linaro.org>
 <20260126092159.815968-3-vincent.guittot@linaro.org> <aXsuRTZUUnw0kdzV@horms.kernel.org>
 <CAKfTPtDfnpzq2CB-isVzvh1ZCWo7kit9KRJvVGoU1C3zZTgdXw@mail.gmail.com> <aXtfVUb0eLwP4R28@shell.armlinux.org.uk>
In-Reply-To: <aXtfVUb0eLwP4R28@shell.armlinux.org.uk>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 29 Jan 2026 14:36:01 +0100
X-Gm-Features: AZwV_Qg3uPvaKNdmIviHyRFKK8XsxTqMLqCrJ58tO3_TcY5z3DRE4t2Ah-LnutY
Message-ID: <CAKfTPtCiJcNOdoddZN5N1dKHXfUJBe0=zeWfZ5uENoXDvbMnpQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] phy: s32g: Add serdes subsystem phy
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Simon Horman <horms@kernel.org>, vkoul@kernel.org, neil.armstrong@linaro.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, ciprianmarian.costea@oss.nxp.com, 
	s32@nxp.com, p.zabel@pengutronix.de, ghennadi.procopciuc@nxp.com, 
	bogdan-gabriel.roman@nxp.com, Ionut.Vicovan@nxp.com, 
	alexandru-catalin.ionita@nxp.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	Frank.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_053621_154544_79A9B902 
X-CRM114-Status: GOOD (  14.97  )
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

On Thu, 29 Jan 2026 at 14:23, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Thu, Jan 29, 2026 at 02:01:13PM +0100, Vincent Guittot wrote:
> > yes, the usual pattern is :
> > - phy_set_mode_ext()
> > - then phy_power_on()
> > but I can add an additional check
>
> Please read Documentation/driver-api/phy/phy.rst section "Order of API
> calls" which suggests phy_set_mode_ext() after phy_power_on().

Fair enough.
That being said, all pcie drivers  that use phy_set_mode_ext(), call
it before phy_power_on()

>
> Having different requirements for different SerDes PHYs quickly becomes
> annoying for users of the SerDes PHYs.
>
> E.g. I'm trying to add SerDes PHY support to stmmac, which is used
> across different platforms. Having all SerDes PHY drivers behave the
> same as far as their PHY API calls are concerned means that the whole
> point of having an abstracted interface is maintained. Otherwise, it's
> completely pointless.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

