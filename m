Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5968CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 22:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1M5Nb/GMJtc+X2GXJNcDemzZBR8bSjA86XYehPLVfcM=; b=T38lw0Dne8rvChKAOhn/Xudxtd
	4Nuk7Lx76HTHVUogMGeg+By9k+aSuyPjNN6XT2cQPIBT4B3bwjI5oEWgdbyxgH1iqA+iIvmD8mtfJ
	S2Lgkws5mkPk7SYlQVnSYHMUogN9qMjmJx81SXkFQTKFa1OF48ofFbKo7tv61WubfCvWPQJYNbMT/
	9ATMByns2TflzH0qh5b/Wy6jOxewy0g0PNFtuUkUSQ0O3/ajOoCH1wInFMYNegViBbkyLqGekxZLa
	w0nXWn2eKQLvKxt++aRK3mtGTd39Xkd1avYS4Ebjf6hOJSduWWh01KlDvXdMEJVcVrOenMroNS3DM
	cDOfePKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDwR-00000000ogj-3HPp;
	Thu, 21 Aug 2025 22:39:32 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up84m-0000000HXD2-0CbL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 16:23:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CE7384E40B5C;
	Thu, 21 Aug 2025 16:23:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 83F24606AF;
	Thu, 21 Aug 2025 16:23:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AAA331C22CDE0;
	Thu, 21 Aug 2025 18:23:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1755793415; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1M5Nb/GMJtc+X2GXJNcDemzZBR8bSjA86XYehPLVfcM=;
	b=KVCPARWLBBak7ha8ttTM+7mSUp1YOMn44fkE8/H8tGUXMy0+0lnJUZKwja2mTiFQWgTOf/
	h5JQRzU7uU0UKzlfsawb+1jIJunssTSjuvp/WuRJI5SGaIR4c+20C+McMOq9F2hwTWA6w4
	1H6K/QEvyZd3/J8WyJqmnQ17TZTioEQXlKTqdVEUH+hrEjAhh6+j/Xrq0idi/N90oJwrLf
	0FsZf1PAbShVXrLvavCglq5Kta5HoiGUZUrVBOZ+WKoLTKrlq3jcXAvC39cZRfF179V4/O
	ZAOVylEgw9reB1RLQo6ww7MB5XnnP+Pf9eDMwEo3HrKQpWESylbdHy9RM9fAYg==
Date: Thu, 21 Aug 2025 18:23:07 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 1/4] soc: fsl: qmc: Only set completion interrupt
 when needed
Message-ID: <20250821182307.2f7c8aeb@bootlin.com>
In-Reply-To: <f0c5260651822e8003daf11c7a76921796517152.1755504428.git.christophe.leroy@csgroup.eu>
References: <cover.1755504428.git.christophe.leroy@csgroup.eu>
 <f0c5260651822e8003daf11c7a76921796517152.1755504428.git.christophe.leroy@csgroup.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_092344_572652_8DAAF82B 
X-CRM114-Status: UNSURE (   8.95  )
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

Hi Christophe,

On Mon, 18 Aug 2025 10:20:00 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> When no post-completion processing is expected, don't waste time
> handling useless interrupts.
> 
> Only set QMC_BD_[R/T]X_I when a completion function is passed in,
> and perform seamless completion on submit for interruptless buffers.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/soc/fsl/qe/qmc.c | 44 ++++++++++++++++++++++++++++++----------
>  1 file changed, 33 insertions(+), 11 deletions(-)
> 

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

