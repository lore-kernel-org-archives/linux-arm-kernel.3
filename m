Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C05C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 14:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kW0o9UPJNg9AiaH8DSDghz5FDDxObOe1q9wX485ILPE=; b=AqAjeqyiQ7SQLXWcI5xBEhmx65
	oCAOHG2oPgeXfgHkaU8hLgkffgwFdITuDk1ax2+ME3mUaJ/PEwvQ7bK3GAltPLdVe81v6lZ0kfjDM
	nsZa8scR8cQBuNIGqY/PtUnadt3DJmWhl76gDKHm4WBWend/x+CFcwmJKOVKOd6b9BW2lcWMcRo5h
	7v79oeS/mytqqjVWQf9jpshbEKWalyjxHQ0aXUdO9hPuLFZSMoF8BhGoSqCLq3yasglWVCOUd+Wx2
	A6+ZPzR4UOwp8awKOBgzo09+EM+DxMKClLViDYHKEsCpFoE4ZiIza3O1zFWfLGpCqTy6ZBXS7174f
	pPaJ32Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wivBp-00000007Vx7-47lO;
	Sun, 12 Jul 2026 14:29:54 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wivBl-00000007Vwj-473v;
	Sun, 12 Jul 2026 14:29:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783866572; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CbSThQwVFKuvcUyMJAZMQMjEGfBe+S0u3AYavMf4uAL9cH8dhDMtYxTmTxcHMlX2Zpq846FJ1vHxLqz5czyzGw7u1B+xwqxZZppc8ZGqvOVWt+up/kboYR+82ZLmF4vPKlYsubWm7g82iNhicIQEfeQX67Srl7Wyh3rX+3OtoRQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783866572; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kW0o9UPJNg9AiaH8DSDghz5FDDxObOe1q9wX485ILPE=; 
	b=b8lO66kWioDHgWFO9xDePdqvN4v+z/TTkf+KW6oLnVL3/7etC+D8wubfhR1qWqEADAPUAKJnnupOsQ+giMD8zR2BavWin+vb8if2doUVwYpgTQK7W6VktHlaG5hWx4ECUuHuM2zCjebWQpJOhnCkS57rM3FO/6ksD9FQLVLQgYg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783866572;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:From:From:To:To:Cc:Cc:Subject:Subject:References:In-Reply-To:Reply-To;
	bh=kW0o9UPJNg9AiaH8DSDghz5FDDxObOe1q9wX485ILPE=;
	b=lW/5oxaO/c02GuF4ZI5GwC/QM/JtLE8JZtR1q+1ScpoHN22vN/zPs8UsKpyF7oq9
	HycEte8i9DKiSCV4Kc1Q6gwkXBWuEiqPMXS7D3Te3oS8KLrJ+YzjFyC0aVGOxsZ0BoP
	33xO5kdx++JJ6JUekSpkIePLuwYTO5enKOGfbOGA=
Received: by mx.zohomail.com with SMTPS id 1783866570656662.824676365365;
	Sun, 12 Jul 2026 07:29:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 12 Jul 2026 22:29:16 +0800
Message-Id: <DJWNX2QDTLFF.17I9ING28DUWM@pigmoral.tech>
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Junhui Liu" <junhui.liu@pigmoral.tech>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Brian
 Masney" <bmasney@redhat.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Chen-Yu Tsai" <wens@kernel.org>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Richard Cochran"
 <richardcochran@gmail.com>
Cc: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <netdev@vger.kernel.org>, "Jerome Brunet" <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 7/8] clk: sunxi-ng: a733: Add bus clock gates
X-Mailer: aerc 0.21.0
References: <20260711-a733-clk-v2-0-974d188cbe0c@pigmoral.tech>
 <20260711-a733-clk-v2-7-974d188cbe0c@pigmoral.tech>
In-Reply-To: <20260711-a733-clk-v2-7-974d188cbe0c@pigmoral.tech>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_072950_422786_B23C3F20 
X-CRM114-Status: UNSURE (   4.30  )
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

On Sat Jul 11, 2026 at 4:10 PM CST, Junhui Liu wrote:

[...]

> +
> +static SUNXI_CCU_GATE_HWS(mbus_iommu1_sys_clk, "mbus-iommu1-sys", mbus_h=
ws, 0x5b4, BIT(0), 0);
> +static SUNXI_CCU_GATE_HWS(apb_iommu1_sys_clk, "apb_iommu1-sys", apb0_hws=
, 0x5b4, BIT(1), 0);
> +static SUNXI_CCU_GATE_HWS(ahb_iommu1_sys_clk, "ahb_iommu1-sys", ahb_hws,=
 0x5b4, BIT(2), 0);

The clock names here should be "apb-iommu1-sys" and "ahb-iommu1-sys". I
will update them in next version.

--=20
Best regards,
Junhui Liu

