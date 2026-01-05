Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FFDC79F86
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 12:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5LYmxF46So4teTC+/oCRVtVgBkfT7UaMLi9v+OV7s4=; b=bCtQIBzGTVqgEGHT9AxRhGMAOz
	96fCzjI0FqAT26jFx4CqUdJzqGRZkefgBjuQrT8q+R+EO2cB4h1pU8EczF17/qlTZhkYaRG6hvfYN
	N5upg027TkBDr2Sur00KHqjSEtA1N2vQ2t44f/Bw64Kf1FNaTqZKkILcWjRqXu8GauUe0pN8vpa5m
	SiIfmhqI3A5BDk8Dsmj3VlgY3uGdFfzT/BN4YxLbsBY+cX0qEbE/TFTI+hIw+99Ti58U9Q17J8So2
	3NQfukr4OMns3bA5w+O+iyXE8nKX18W39+A9rhnsYHx2XRuoHkslk2f53QuBxUYxmKubbq2+hLnKb
	ih8hyTTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjQU-0000000BFhW-1qh5;
	Mon, 05 Jan 2026 12:11:10 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjQR-0000000BFg6-36GD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 12:11:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A02171A265C;
	Mon,  5 Jan 2026 12:11:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6B4EC60726;
	Mon,  5 Jan 2026 12:11:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD090103C84E1;
	Mon,  5 Jan 2026 13:10:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767615061; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=m5LYmxF46So4teTC+/oCRVtVgBkfT7UaMLi9v+OV7s4=;
	b=hDaCXN/QDa3HyGkKumXh/rRN3I3owCmfG7llh88Kw+9vkZSCIlHM9BnDzCteX2UMLY3HvT
	Uq013YD+P0GDQOrhbw0cpfNAsNpgwv/1q7t5uwXkhDQ2cWj103bR5zDqIUvjjIU4xmZR0e
	1/6vkwmaJBNF9TS1jFUu8cn0lBHxXMRJvrqZ8a8o6SnUuucQkAe0zqAwKNp2pybs1Dmu7R
	u1KhCWWFUw0JBcOLS3+WIdByDf/vgZGAXSwMtGcumAzoevI1F5OCJIIA3DAOGGFiLRs2k6
	UU9iXegSZfu/qDYIk/iFHlridOzNdeeDpsEo7EbnZwUYesM+Rh8RKJfsgRBGZw==
Date: Mon, 5 Jan 2026 13:10:56 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: fsl: qe: Simplify with scoped for each OF child
 loop
Message-ID: <20260105131056.391904af@bootlin.com>
In-Reply-To: <20260102124754.64122-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124754.64122-2-krzysztof.kozlowski@oss.qualcomm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_041108_123604_954DB76B 
X-CRM114-Status: UNSURE (   9.66  )
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

Hi Krzysztof,

On Fri,  2 Jan 2026 13:47:55 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/soc/fsl/qe/qmc.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)

Thanks for the patch.

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

