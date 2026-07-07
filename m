Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E0DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 06:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0L4272XicdnCVTlaYkSLBNwZCjsMYx6J5/Ki3naDCg=; b=UECTAdIbbn9sEX2TVN/os74tB1
	Tt74PG/CNd6pHvmYzqs73a+806G1cYwcNk6P+mbG+Uuf3Qa6hiQd+LbbbA0lYageNWpB+evm7vOTs
	6Pcn8ggDq1R6Q0Je/Egu6RQhthqQymRvbc9KP/HwvnV3EtZLWBzcBOj/SrC6V+5F63tQKSHhfxRoG
	fAFYXNWx7npRwaxHNQA65rxzCo4VglrY1/5SI4oRmiRpaRNq/KDme+hg/iwxdLjAVJAPE2/WlWFxf
	Z1SurycZJj8pc163Qnl0hWtFeGPDXUcqkzrvaWiGM1Bl7ySVg/UeY9Ozk2eqT2VB2Tcjuc9kWENvY
	2km7veuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzCz-0000000ECjZ-39co;
	Tue, 07 Jul 2026 06:23:05 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzCv-0000000ECiI-3bRZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 06:23:04 +0000
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 7867F22BA6;
	Tue,  7 Jul 2026 08:22:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1783405375;
	bh=/0L4272XicdnCVTlaYkSLBNwZCjsMYx6J5/Ki3naDCg=; h=From:To:Subject;
	b=ogT3ycFrxbBdTSIJwRSTgdvlDCdIZrEEhX6YesAYV8i91hyxXwM6/yc2PDtqIsGnO
	 8nUxqHSOmEV2YzrbJEaFsSOrIniOme2iBj348DrizR1xw9TtE376HWNWDOBEK/sQmM
	 33EAmdZ/k6hII5nHOTN8h3kttMUyTYGc1b++GpX0pgz1IlTpKnq6Btozv7EHA9gOCM
	 iud1o4xvhZpdhfrZ9BICaqU8vr4FusXF6BcDpJzathRYYuc6ypihL+ES7BA69MdFQf
	 e9+PLiOInpZImkV2f6AYuYQpGJFFeTCzpD5kwlWhDz3iNceJRH+tWEM6hFpmnzUKvd
	 hvtcNWnPUd9wA==
Date: Tue, 7 Jul 2026 08:22:50 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: hongxing.zhu@oss.nxp.com
Cc: frank.li@nxp.com, smoch@web.de, l.stach@pengutronix.de,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH v1] PCI: imx6: Fix i.MX6Q/DL boot hang by separating PHY
 power and reference clock control
Message-ID: <20260707062250.GA20259@francesco-nb>
References: <20260706030629.3264320-1-hongxing.zhu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706030629.3264320-1-hongxing.zhu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_232302_928282_07ABC909 
X-CRM114-Status: UNSURE (   6.17  )
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

On Mon, Jul 06, 2026 at 11:06:29AM +0800, hongxing.zhu@oss.nxp.com wrote:
> From: Richard Zhu <hongxing.zhu@nxp.com>
> 
> Commit 610fa91d9863 ("PCI: imx6: Assert PERST# before enabling regulators")
> introduced a boot hang on i.MX6Q/DL variants by changing the initialization
> sequence.

Is this related to

https://lore.kernel.org/all/20260629143439.361560-1-leoreis.costa@gmail.com/

?

Thanks,
Francesco


