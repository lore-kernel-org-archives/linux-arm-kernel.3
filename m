Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F6CFC0345
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 15:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQf/P7hvHt9A1fs4c4DenfrxwjfBH28w3+BhoS4FuwU=; b=s6efQ1XLYs3iBlFh3DMQrTcbTv
	1DTx7k8VYqNv+iFx3pibSOZUuPmgDeB84C4VoNa5tNjDT2Tiw5b3VJQ6HUexa5CnavuDqb3FBTDW/
	vpaJ5lEFmQV4zjrb+yy+1CcM5PltdBKG0Yinx8q0AQ+5bc+/iroXHacUJBo3QwTJRR7lbWiMy/abg
	JjRoTb7GtVhE0kUPYSiXFQicbmG6ELzng2HIiTxmY1TD67iil/84n5nS0ZtL8sIBX5fNEI7ZXRiYc
	7lTluNgJBYHU772gQIZuHeUyIOvdmGzPiH4zo7D7FP7czwaVLN7mBqF3ZJqcCzbDv5HjikSNe/59+
	0aQpmcaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFvrG-0000000BsEP-0L19;
	Thu, 23 Apr 2026 15:20:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFvrC-0000000BsE0-0DFe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 15:20:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776957643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iQf/P7hvHt9A1fs4c4DenfrxwjfBH28w3+BhoS4FuwU=;
	b=Iw84djJymNIk6+G3cRW7Q4xhD4jtMzvt0YeI6KS8xVLizLZD257++7PxemfwsDwWCcDOp3
	ekWT8agTwTndycj68bNsCm9AVjXs+qZaomvtoimiZT0o8UoawQ6YopeM/xC4A/FWSGqvp9
	e2d7cyHXkBzVjwAmqSHWf8Y43rvXVv4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-3XSAiDctN6ieNnQx97_oTA-1; Thu, 23 Apr 2026 11:20:42 -0400
X-MC-Unique: 3XSAiDctN6ieNnQx97_oTA-1
X-Mimecast-MFC-AGG-ID: 3XSAiDctN6ieNnQx97_oTA_1776957641
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb3c7b989so58115371cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 08:20:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776957641; x=1777562441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQf/P7hvHt9A1fs4c4DenfrxwjfBH28w3+BhoS4FuwU=;
        b=MyDZCdsNQA0BtdUaVhbD6n7M/SbKCHsxcrnaS1eP2h6LiwsMmAg4M/yb259zJpcnpD
         EBe4h/bQbjRPdvHJ7515wid8Sj6jMKqVHXbdMCnNhVr/4JIUriOzXXKeAWzJVSXBT+JT
         hN9MjGbze3E11WXTnBgN7oDZPKGMh9pwXPYPDyqjO2WemEYx8mH0xL7VMIaHOS42FYgR
         b8Q0GP0rSQez2J4X9XZaI/dGKmMcmAUvim72wSIAv4E1Ge3KioAfbJvmcYHGb6fcmBnv
         PoYBzeR7by/xe1QO6uPCF1DtDvC45V786TrULCO4XdW1kKzWVuMvsURcgOontQ88fGx4
         rUVg==
X-Forwarded-Encrypted: i=1; AFNElJ8Q+uoAczOYy038BLNEIBoDNjn3QsLsDpn0G72tjmOlyhFqRQV20r5zwsg7uDkDdZA2/giBy1xzxDbFNL65mbxq@lists.infradead.org
X-Gm-Message-State: AOJu0YxYnDPQztB7ot/eJUnzlyt2VoGCgnRPLtO9bb0QASs1sXR9JM6R
	B2okF2yW2+W8X7odzOjFR0zs3VROg6cRy4imF/8xL/G0fkmv/LqxM121B1dXHMQFcSsjpSv3aHE
	VRSDf75b0Nt84O3kJlrxubG/0yyOe3UONjfaLqcuVoPo4aHryHyPst29Lq8GlgoUmvcqK1ImB8f
	Un
X-Gm-Gg: AeBDiesSANpVVgSd6Qe8tpdaS721YgdjYM1XPqIoepQeUar+dfYLrWdlNOxLNEITVHA
	EJXyvDWYCIezKZzNeNs3aLpRy8JeT2fGaeNatggjl4SUWgdV1W8DskzmEcecqJFusioK2E6OUtd
	62omG0Lfpc0pLU5uLOX6BlAryR29769d2zOUh8bcwddfPNe2JzNZY8tuc5EqrnfnbYEOJcp5RFP
	VYUIz6C+7BIIBPIB4bj7MDQZD/HjshoQT6EqvswnLrANPTJQCQS0vl4z1ParXub9pCsylWuIpIe
	l2poEwmqsgu1XQ2CjaGfNdai3hZayljrQ/Mz7bY8DCtkm+a8XnwJweGhHhePZ7dU5sVAm0msatS
	T5pIyV3KMiFFejze5eEyI7yxvW/zULk30HERhBNOGJg==
X-Received: by 2002:a05:622a:1390:b0:50f:b076:43dd with SMTP id d75a77b69052e-50fb0764918mr197598121cf.36.1776957640956;
        Thu, 23 Apr 2026 08:20:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1390:b0:50f:b076:43dd with SMTP id d75a77b69052e-50fb0764918mr197597111cf.36.1776957640401;
        Thu, 23 Apr 2026 08:20:40 -0700 (PDT)
Received: from rh-jkangas-kernel ([2601:1c2:4400:6bf0:7677:bcee:4ef0:e09d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e5f5cc439sm105170541cf.17.2026.04.23.08.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:20:39 -0700 (PDT)
Date: Thu, 23 Apr 2026 08:20:34 -0700
From: Jared Kangas <jkangas@redhat.com>
To: jan.petrous@oss.nxp.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	rmk+kernel@armlinux.org.uk, vladimir.oltean@nxp.com,
	boon.khai.ng@altera.com
Subject: Re: [PATCH net-next v12 2/4] arm64: dts: s32: set Ethernet channel
 irqs
Message-ID: <aeo4wlrSinKUsdrZ@rh-jkangas-kernel>
References: <20260313-dwmac_multi_irq-v12-0-b5c9d0aa13d6@oss.nxp.com>
 <20260313-dwmac_multi_irq-v12-2-b5c9d0aa13d6@oss.nxp.com>
MIME-Version: 1.0
In-Reply-To: <20260313-dwmac_multi_irq-v12-2-b5c9d0aa13d6@oss.nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: O3MAeJYX7C5g1GvrFYNhXOZzaWUusCC4EVvJYLtIpZw_1776957641
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_082046_162849_E1A04D23 
X-CRM114-Status: GOOD (  12.52  )
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

On Fri, Mar 13, 2026 at 08:13:33AM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> The GMAC Ethernet controller found on S32G2/S32G3 and S32R45
> contains up to 5 RX and 5 TX channels.
> It can operate in two interrupt modes:
> 
>   1) Sharing IRQ mode: only MAC IRQ line is used
>      for all channels.
> 
>   2) Multiple IRQ mode: every channel uses two IRQ lines,
>      one for RX and second for TX.
> 
> Specify all IRQ twins for all channels.
> 
> Reviewed-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---

I missed that there was a net-next rebase and ended up sending a T-b to
v11 instead of here ([1], [2]), sorry about that.

To give more details on my testing around this specific patch since the
driver patch was merged: I configured RX queues 1-4 with
'snps,route-multi-broad' across several different boots and verified
that interrupts showed for all TX/RX channels in /proc/interrupts.

Tested-by: Jared Kangas <jkangas@redhat.com>

[1]: https://lore.kernel.org/all/aefX7Ajltzt5EqIR@rh-jkangas-kernel/
[2]: https://lore.kernel.org/all/aefY8WGCuNr4BQG4@rh-jkangas-kernel/


