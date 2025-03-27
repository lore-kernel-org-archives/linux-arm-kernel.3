Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE9EC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 14:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rd72ZSp0c1wqOF9wFxJf6YkyT5PHaJKvyyrLNbHW2eo=; b=lhhfwXISmBvGoVuE2TE+L2W0wg
	CSrJi9aRpUAhjnKIa9JhwT1BJpUVNEejCjsFRXqlM0zCgY+uEigoGi+ghBe/XPqhP/PwkbTP75GrG
	lW3Gbvrt5Cq6Rp7v/27ukp7jqGaymVJmsX62KuSBha1Ic+43j5I+/V7YcKutZSUFNO4KMWbkRY8b/
	4tzlctgHFJMq1GtZscwcZz1bq5Rp1y3nfMOigqji2RBjXD+AI+6au0/7sW/Um7YChCtiKGxUd0GDj
	4a37o/r/bOAyyM6VGw3BR0MPz3K9krLc/G0JtfRs51p2AQKeT2VeyixOkxp70W5gmPvvAE+B+KOgO
	/Mw/scdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txnxt-0000000BAEe-2fWg;
	Thu, 27 Mar 2025 14:12:13 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txnw9-0000000B9rs-2taj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 14:10:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1743084617; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BR0UwQ2FzQkfwb4yaquRNiD4Ly9Wpgqdwcde1mPx31XkjX5dfmmI+mfUyfLZQhPzpwkuY3NyrfYMGID/M+/MLQEBYLLAuk6b5jHDno5BD21kKbuFzkvQWW/yRrDoxBlucUghHXNx9O2dfnUkSj/INu8kmgx5PZZbKSXYiBUiyfU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743084617; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Rd72ZSp0c1wqOF9wFxJf6YkyT5PHaJKvyyrLNbHW2eo=; 
	b=IlCsronZ4F0f4/mnflStJNBut+OjUwriYtWSm7W0brKX7VvYYPbsQN3EQ+vM6fHBHGXqfpsMZLERR2vhegw31eNoTR1RZqbdB5rQzDBwZ7HzwEr0DuCvZF1AaPKmvb9gR4sF/Za3+E579otkt3ZfAhAVS27vvNdjhIA3gWLQdtg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=martyn.welch@collabora.com;
	dmarc=pass header.from=<martyn.welch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743084617;
	s=zohomail; d=collabora.com; i=martyn.welch@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Rd72ZSp0c1wqOF9wFxJf6YkyT5PHaJKvyyrLNbHW2eo=;
	b=Tsu6CDElz48AMNVpLSkoZmt26tnQtpjXQaE6gooPaxh7Vcqf2jEUnb50av4gcg6a
	fHBLHCsFAd0m31nHbykcWeNujd66UNEexuIuEzvvaz8Q0W/q3jr/eO8z33YfBZ5FoXx
	ckcTNDmAsv5irQwLB/1G6bhD2ZetYIJgop6t2MTE=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1743084616848372.7384738795423; Thu, 27 Mar 2025 07:10:16 -0700 (PDT)
Date: Thu, 27 Mar 2025 14:10:16 +0000
From: Martyn Welch <martyn.welch@collabora.com>
To: "Daniel Baluta" <daniel.baluta@gmail.com>
Cc: "Shawn Guo" <shawnguo@kernel.org>,
	"Sascha Hauer" <s.hauer@pengutronix.de>,
	"Pengutronix Kernel Team" <kernel@pengutronix.de>,
	"Fabio Estevam" <festevam@gmail.com>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"kernel" <kernel@collabora.com>, "imx" <imx@lists.linux.dev>,
	"linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>,
	"devicetree" <devicetree@vger.kernel.org>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <195d7f07c75.da78a5cf8278.1708647163991154090@collabora.com>
In-Reply-To: <CAEnQRZD15J9GOHFL6MfaLtSkgaN6ksT_YL7GvG2U_St8q2+KgA@mail.gmail.com>
References: <20250327120857.539155-1-martyn.welch@collabora.com> <CAEnQRZD15J9GOHFL6MfaLtSkgaN6ksT_YL7GvG2U_St8q2+KgA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp: Add device tree for Nitrogen8M Plus
 ENC Carrier Board
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_071025_808207_2CDB2598 
X-CRM114-Status: GOOD (  12.05  )
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


 ---- On Thu, 27 Mar 2025 13:00:13 +0000  Daniel Baluta <daniel.baluta@gmail.com> wrote --- 
 > > +       mdio {
 > > +               compatible = "snps,dwmac-mdio";
 > > +               #address-cells = <1>;
 > > +               #size-cells = <0>;
 > > +
 > > +               ethphy0: ethernet-phy@4 {
 > > +                       compatible = "ethernet-phy-ieee802.3-c22";
 > > +                       reg = <4>;
 > > +                       eee-broken-1000t;
 > > +#if 0
 > > +                       interrupts-extended = <&gpio3 2 IRQ_TYPE_LEVEL_LOW>;
 > > +                       reset-gpios = <&gpio3 16 GPIO_ACTIVE_LOW>;
 > > +#endif
 > 
 > You should not have dead code in the final submission. If it is not
 > used just remove it.
 > 

Agh! Scanned though it a few times, somehow missed the ifdefs. Yup. wIll remove.

Thanks,

Martyn

