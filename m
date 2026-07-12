Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD099C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 14:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SLS/kMhYXvqtbxCJZsqYcevLj6Cy5NnjgCrCPkzJMk8=; b=hAPvoJr+I8PQ7ZIc9sFaQLwWFn
	kfgZQifEnuwPGs1vG5wxfFtvfHJsn9SFiyCZ7TaRzNqndDpnG4NI3cX3s7K6Sbv3vDe+KJEt7BOB/
	YElV6QtOLpsJg64boSnRlLiEUCdZVZl1VnkZwxSzzMcKxglmoKZsTaV1O/JG5OOlP6TkZp+Nb9NOf
	Y80WxAgLiaY6M8qTAyosdFw8HhLepoUgvSHqkc29XAlbDtY3R7Aml2v9nZFgfQKVWXNHSkCtECZpf
	toab3NGAnr8kF1JHDxElafgy+KvNlj3IkcXuShbOtgiAiL3sbWO4Kg5cQy4eaivOJNtSXSiBgPCuz
	NouEVbQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wivMu-00000007WiC-23G8;
	Sun, 12 Jul 2026 14:41:20 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wivMr-00000007Who-3R9l;
	Sun, 12 Jul 2026 14:41:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783867266; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ua0hV+q9YwWdierF0d3tTHArRa58XYI355ifeJIbWW4LZtaawtl20H96TbVmRQjqbSO56vOFPYpJkcOKAnwZLk41DUgWI6NBLxOKHS150cqIcbguHE/i2Dzfl7xsESTR2Xl8qHs1jZdr2oxv9KJGh3bWnllNWCTo8cThhDSAgrA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783867266; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SLS/kMhYXvqtbxCJZsqYcevLj6Cy5NnjgCrCPkzJMk8=; 
	b=aoh2WX9UcchPAoc6jZ2+7rUQ8S2O8lFa6QhYvdJ5DUkNr3W4qYNoX4JyGeP0uu6v9ZLglioPjgdNlVGRuy4VhhpqbgTU2hdFFv6MeypNTb7xTlgIQs5KDxKeFIUdmMH9uRKh6Vn6vNplJt9nOVb8yn+nBh+d0PJyEFPEXDJNDxI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783867266;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=SLS/kMhYXvqtbxCJZsqYcevLj6Cy5NnjgCrCPkzJMk8=;
	b=pzyy9pATPvLJ5OdbAKgQIexqjPkcTp36x4ezLL3ngOF7JnVnEZGnT1j/CZzlbiP2
	WSEhCCeBy8H27PBqBkn7L4Eby5OjedwYGAs9h65RhVrIkJzg5gpa1jjN3r5EtAYLrbt
	6LGBXRYBXx1IwS0pbyTPypDBB5SSeHGDPQNuQAuQ=
Received: by mx.zohomail.com with SMTPS id 1783866353179481.00549749606785;
	Sun, 12 Jul 2026 07:25:53 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 12 Jul 2026 22:25:39 +0800
Message-Id: <DJWNUAW00DTS.1L26UVJEYHZ0L@pigmoral.tech>
Cc: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <netdev@vger.kernel.org>, "Jerome Brunet" <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 6/8] clk: sunxi-ng: a733: Add mod clocks support
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
X-Mailer: aerc 0.21.0
References: <20260711-a733-clk-v2-0-974d188cbe0c@pigmoral.tech>
 <20260711-a733-clk-v2-6-974d188cbe0c@pigmoral.tech>
In-Reply-To: <20260711-a733-clk-v2-6-974d188cbe0c@pigmoral.tech>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_074118_256675_D28F33BC 
X-CRM114-Status: UNSURE (   5.49  )
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

> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(timer0_clk, "timer0", timer_paren=
ts, 0x800,

I will update these to SUNXI_CCU_P_DATA_WITH_MUX_GATE in next version.

> +				       0, 0,		/* no M */
> +				       0, 3,		/* P */
> +				       24, 3,		/* mux */
> +				       BIT(31),		/* gate */
> +				       0);
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(timer1_clk, "timer1", timer_paren=
ts, 0x804,
> +				       0, 0,		/* no M */
> +				       0, 3,		/* P */
> +				       24, 3,		/* mux */
> +				       BIT(31),		/* gate */
> +				       0);
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(timer2_clk, "timer2", timer_paren=
ts, 0x808,
> +				       0, 0,		/* no M */
> +				       0, 3,		/* P */
> +				       24, 3,		/* mux */
> +				       BIT(31),		/* gate */
> +				       0);
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(timer3_clk, "timer3", timer_paren=
ts, 0x80c,
> +				       0, 0,		/* no M */
> +				       0, 3,		/* P */
> +				       24, 3,		/* mux */
> +				       BIT(31),		/* gate */
> +				       0);
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(timer4_clk, "timer4", timer_paren=
ts, 0x810,
> +				       0, 0,		/* no M */
> +				       0, 3,		/* P */
> +				       24, 3,		/* mux */
> +				       BIT(31),		/* gate */
> +				       0);
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(timer5_clk, "timer5", timer_paren=
ts, 0x814,
> +				       0, 0,		/* no M */
> +				       0, 3,		/* P */
> +				       24, 3,		/* mux */
> +				       BIT(31),		/* gate */
> +				       0);
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(timer6_clk, "timer6", timer_paren=
ts, 0x818,
> +				       0, 0,		/* no M */
> +				       0, 3,		/* P */
> +				       24, 3,		/* mux */
> +				       BIT(31),		/* gate */
> +				       0);
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(timer7_clk, "timer7", timer_paren=
ts, 0x81c,
> +				       0, 0,		/* no M */
> +				       0, 3,		/* P */
> +				       24, 3,		/* mux */
> +				       BIT(31),		/* gate */
> +				       0);
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(timer8_clk, "timer8", timer_paren=
ts, 0x820,
> +				       0, 0,		/* no M */
> +				       0, 3,		/* P */
> +				       24, 3,		/* mux */
> +				       BIT(31),		/* gate */
> +				       0);
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(timer9_clk, "timer9", timer_paren=
ts, 0x824,
> +				       0, 0,		/* no M */
> +				       0, 3,		/* P */
> +				       24, 3,		/* mux */
> +				       BIT(31),		/* gate */
> +				       0);

[...]

--=20
Best regards,
Junhui Liu


