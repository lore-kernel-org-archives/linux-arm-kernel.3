Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBC8C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 18:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iuHhQ9iL2FyTtElJv20UE9bSrmFyOoZX7lJIa58h1Io=; b=4AUoctvuap7anuefOOk35bCdzz
	SKHKJNdG2bpetlY9K5Mj88A6ey3iTMawmMj6f+hPizjWObi+82/qQT5wchlVTC8DZoV0PEd40FK6t
	UutmLGZVk8jOlRtFfSuZPmQWmy633FmX4wTzkJ+VVfGtVEp5p8VM8EXMok1fTkGa5o1DPP8BOGZrG
	IB8TaWhHl4Tkn60GE5dtGI/T9GFQPRL2zvp0dCKMC/aCMR5x8Eq2vgfxK3yvzzv4ycrGIdKU+SnPu
	uajUh+IqhTcZrAkA/FsCDGdg+eiBCjMm4pKNON9ZwrO/86UglPrbjuTi/i5L0w172tqNN/3FySg3G
	iSstxvMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXSs-00000005vqA-1F5S;
	Tue, 04 Mar 2025 18:58:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVnS-00000005ZPI-2gpV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:11:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 19D97A459EF
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Mar 2025 17:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954C5C4CEE7
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Mar 2025 17:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741108269;
	bh=xIG690djDhXKXH4IBWWZJH31VsCI0TyOl9Qn3zjmGxQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eMzXGm/peXE2BD5aGPmJeqoiZxx0i2Kf49LPMJ67YalBWSMqKue6Mkmjv6m2wGgTl
	 /3OiUnbAhOI/KyqhqLIldNaIMrugCdqsz4llVVTgyy39QV9IC9tlo0I8KYi2y8wQ+s
	 A5xD8caVUFWUPxoV7O1oqb15otQWnP/VQuQVINVWKrPh+//S/0Ksypjna3qFE6oDnT
	 P65ociX14cMYQSeHJImZUj4TmP+YuI1y7e8pFpB5Z9zB4ZGPsJO2H9oJCEftAHz+SR
	 M4fwKG15JdsB+ser2yHaQd1NUZTHHKY6HgcsO6XrKVaAESIyY8DXdJnojjS1ifPr5j
	 QVabhxHZErRFQ==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaec111762bso1079788766b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 09:11:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUbPNs6pbDT0iF68h7MEGKdhM43U9RAvv/JfBUPWbj6dYwwfwt5rlVPZCwJiyv3LrEgUBVxxDTZxeJdJeiU5CxQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyJtfQ5lZZzUiVnnzdvmHxWMzWJpeeF9JJiWQqIntrh0TKY4TCs
	hWNxAinnXfSXs4jKizARI9KCe2kTa+C2YTsf1OQfqZzp3rVYwZR/n2vLS0U1VRBNOc4N0Z7Rw0j
	sP2VpjNO2uWc31wLP/u9prg09ww==
X-Google-Smtp-Source: AGHT+IFgs8oMB90zZE6lwaT3tbdeTZ2vDb6K7bI3B7uxQqUz1+cPe+fBOtsCycQF9VShe8mD0kCNZUK3gMn27oWuAu8=
X-Received: by 2002:a17:907:1c92:b0:ac1:ea29:4e74 with SMTP id
 a640c23a62f3a-ac20d92560dmr8023966b.28.1741108267600; Tue, 04 Mar 2025
 09:11:07 -0800 (PST)
MIME-Version: 1.0
References: <20250224193308.407606-1-Frank.Li@nxp.com>
In-Reply-To: <20250224193308.407606-1-Frank.Li@nxp.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 4 Mar 2025 11:10:54 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLJciDgc2cPy7QApH4ia=Rx3MnoVMS3pha3u9PVy_EfPg@mail.gmail.com>
X-Gm-Features: AQ5f1JoVIjx_EnjE9gxDA6sYaQfZU0bi3wrsrEMOzYkBv4xckzwxDP8YmX37Q1Q
Message-ID: <CAL_JsqLJciDgc2cPy7QApH4ia=Rx3MnoVMS3pha3u9PVy_EfPg@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: im8mq: move dwc3 usb port under ports
To: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_091110_741687_B8E1500D 
X-CRM114-Status: GOOD (  10.97  )
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

On Mon, Feb 24, 2025 at 1:33=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Move port@0 and port@1 under ports to fix below DTB_CHECK warnings.
>
> arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dtb: usb@38100000: po=
rt@0:reg:0:0: 0 is less than the minimum of 1
>         from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml=
#
> arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dtb: usb@38100000: Un=
evaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_=
mode', 'phy-names', 'phys', 'port@0', 'port@1', 'snps,parkmode-disable-ss-q=
uirk' were unexpected)
>         from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml=
#
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../dts/freescale/imx8mq-librem5-devkit.dts   | 25 +++++++++++--------
>  .../boot/dts/freescale/imx8mq-librem5.dtsi    | 25 +++++++++++--------
>  2 files changed, 28 insertions(+), 22 deletions(-)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

