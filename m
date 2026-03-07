Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6868FC9EF8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 10:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6RtVIq9TGaG0H+IOHqEdsAHV4ChyE5ApwJhByV31pX4=; b=ntdEP3KbC7Hp2ax+4xgar87rVn
	qUWVBa7MrAQqak4nU3RsBW3lNsztHcIjAqYLYV/11tbIQx4uC9rJJE2QQQMdr9qptOYMODYltwPSF
	kGMJIWQgUzID7La136s0/vDXEZKLnvLQWzEruRXJMRQ0XLLGICsIbPQ1cU5lsnx+zw4iScFpl8jh5
	+/+lqvmgmx3T515QtX02pc0pYRW4Kmazu27K0wfVol4HHB9nzYeJ+jL7ggbEsjTU9DZ+f9/NLmWmF
	Ejc5cTZp/J1sBIDf4uWXn4LQ0KbyFoC9ZMgLupqanqfnG1D9DIMpmKEPpy8GgrC/bQSZXZMBf0Wb+
	qkOurzbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vypMq-000000057yR-0dFq;
	Sat, 07 Mar 2026 10:58:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vypMp-000000057xy-2ut3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 10:58:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 382CE60018;
	Sat,  7 Mar 2026 10:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D1EC19425;
	Sat,  7 Mar 2026 10:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772881120;
	bh=Ionuc70jSLfmmprV1aKJDSZDnPZ8MojStxxeRXicepU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dEtEiiKpAEb+n96mbEzQTIiREcREP+9eTE0PJRTbtZ2MiUPTEuJWT9is67QzMC/Se
	 pobTAeI3jvSQ9zwppaiEEujN2WC0sMxtEDbDlo1ReLnZuF3bkz0Gi3q+cQyCHDTmBC
	 lDY4MWZv6Ghwl3zUqxeQQskJRsakr4Xqq8ctanRTVBcEzKJ2j1ba+1FH5w4F2id2kg
	 rdlCyQCoZUmwSn0iCC3tHZjijmyOoITEyQbYfTbP7Uuehk4LAwMYs9+kQvmvDg2b3X
	 VDlDHcz6RNHQvk+a47trCID2LP3bqYeR+YZPklZanCVAbkTqwawGNaoxEj31Qv5L3e
	 IxW6QLlzm6/Tg==
Date: Sat, 7 Mar 2026 11:58:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Shawn Guo <shawnguo@kernel.org>, 
	Lucas Stach <l.stach@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, s32@nxp.com, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, 
	Larisa Grigore <larisa.grigore@nxp.com>
Subject: Re: [PATCH v4 3/8] dt-bindings: arm: fsl: Add NXP S32N79 SoC and RDB
 board
Message-ID: <20260307-tentacled-antique-agama-e8a80b@quoll>
References: <20260306161555.9000-1-ciprianmarian.costea@oss.nxp.com>
 <20260306161555.9000-4-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306161555.9000-4-ciprianmarian.costea@oss.nxp.com>
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

On Fri, Mar 06, 2026 at 05:15:50PM +0100, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Add device tree binding documentation for the NXP S32N79 automotive SoC
> and the S32N79 Reference Design Board (S32N79-RDB).
> 
> The S32N79 is an automotive-grade SoC featuring eight ARM Cortex-A78AE
> cores organized for high-performance networking and gateway applications
> in vehicles.
> 
> Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


