Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB35EFCD6E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 09:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C29yB0Bc9mKdgrT2vJsAtLxxXbjEcAAnHzD1pCSjKUU=; b=PilgFJKRKrkrcnCUC20x/h9Lst
	bG7xdO085+juaoghrRfdrE4oKnaWfubpWyvW92E7k6D0Y6wYAaOkv3sqwTPT1I07NulFGUZ3r1dG7
	va9n+ymVDOfS34IBmmiCUJimCY5hckCMj5mxWQyDJxSG4BhYiBevR9zRpsoLA8IXViEUDgWehp3oc
	1sZkKzD5Z6c0+dHCFND8btdmtHvkrB9yivC/FExejH4hEW5cmhf5/+Mns6rONTB+V45y8eS87H2SZ
	5JTrma/vBzg3R7tLEiJKSA/K7KewkEtyebotTt6O1Hs3wUd2xEwMq/Cv2CXBdwoTCrcfKX/cKUXVx
	Pue7iPfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWu4-00000006yCD-2lsx;
	Mon, 09 Mar 2026 09:27:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWu3-00000006yC5-0U1S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 09:27:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3DBDA600AD;
	Mon,  9 Mar 2026 09:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D684C4CEF7;
	Mon,  9 Mar 2026 09:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773048473;
	bh=vAyN1hj0U3Oa8JbuK8YxYaCody3qygBNDhbFwrsgF+c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PdN77l2HC78giLy4naVWy4l7pSbJ3kswsoXn1F3iFmq1OOE+aFxy8+9tgJmnzBzUF
	 3J7PsFzbuPa9CYNftnaqQaMIiIgFuASprrS76B+tfo2tXSYpUxCEp3s1FlVL8cAkOq
	 mf/wAKvIm8tznWxSAGeQdCANsNAC0XstEXZLYU3jrpzR9o8cicqI6hz5pk9bJ6Dekh
	 VGAUdWcYb3FhTj8jpVGpUenFrYkIrH64f1ROjaCIJwiIoTYXwVXgGmgNX3zQnipSUN
	 qW3yfiS4APQsaJ4gjduYxnmc2JDoHHGNIapfrBM56e/WPiIE646XQepfLZbeorRFUg
	 Esi3Nss/7o/Mg==
From: Thomas Gleixner <tglx@kernel.org>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>, Adrian Hunter
 <adrian.hunter@intel.com>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach
 <l.stach@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, s32@nxp.com, Christophe Lizzi
 <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo
 <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, Ciprian Marian
 Costea <ciprianmarian.costea@oss.nxp.com>
Subject: Re: [PATCH v4 6/8] irqchip: add ARCH_S32 dependency to Kconfig
In-Reply-To: <20260306161555.9000-7-ciprianmarian.costea@oss.nxp.com>
References: <20260306161555.9000-1-ciprianmarian.costea@oss.nxp.com>
 <20260306161555.9000-7-ciprianmarian.costea@oss.nxp.com>
Date: Mon, 09 Mar 2026 10:27:50 +0100
Message-ID: <87h5qps67d.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, Mar 06 2026 at 17:15, Ciprian Costea wrote:

That subject line is useless. It says that it adds a random dependency
to Kconfig, which tells nothing. Subject lines have to be descriptive
and useful on their own w/o the need to decode them through the actual
change log.

Just fold this change into the previous patch which adds the ARCH_S32
support into the driver.

Thanks,

        tglx

