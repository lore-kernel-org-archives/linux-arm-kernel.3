Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDF9FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 13:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G884qd97PNIxFyanL5+UkLxO8fmPu7J/+fwd9gPZOR8=; b=LBvcM4o+p+LlDfSB2UsPnZnFaJ
	hgPVfuPyaLI/g1rDS3pZK7PthWM5mG5ftXlaVD5G5khzMSPU1qMhOTg3z7wxVGRimaEFvw2ux525H
	1I9fJEMU/08KcWKDSXd9MqGold8QBWgn3afciDydble9bLj30cSd4DtnYkQz46Hp6wGrTamFEMpKA
	i4KXou9bSUbDmgvqw7xedzczG1/M0pNcgRR4bkuVyY9bwamg0qkmXQ/NkwL6V+pw4tCZDcccrHIpl
	MRHkYudEeph+AeHIulezirWE5HQlEgm/6zVQTI/BMycMN/BAFMWa6XJgziGrq0JBR05549si5RRyZ
	ljWgiegg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGzbp-0000000Fa5m-0CVa;
	Sun, 26 Apr 2026 13:33:17 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGzbl-0000000Fa5U-1lcW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 13:33:15 +0000
Date: Sun, 26 Apr 2026 15:33:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777210390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G884qd97PNIxFyanL5+UkLxO8fmPu7J/+fwd9gPZOR8=;
	b=WsE19gSk0wj+TVv11MRCqO70eJqdJIYZTDkuTcxHRdA1Z/2eX9AE+eMmp+QRigvfhinfBC
	8wa4yJzFa4j8lkMkswAbKZhLYamRAujoAcaph+IooMc6H+EZAyzBYTyQXg8e+4ZJ3VCVpM
	o/0DCI0D9/H4wP0HsplB+6MoArqXyt4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Lothar Rubusch <l.rubusch@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, ardb@kernel.org, linusw@kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] crypto: atmel-sha204a - fix memory leak at
 non-blocking RNG work_data
Message-ID: <ae4UD-JGUarmSMiK@linux.dev>
References: <20260422210936.20095-1-l.rubusch@gmail.com>
 <20260422210936.20095-2-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422210936.20095-2-l.rubusch@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_063314_107985_814C057B 
X-CRM114-Status: UNSURE (   8.59  )
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

On Wed, Apr 22, 2026 at 09:09:34PM +0000, Lothar Rubusch wrote:
> The driver allocated memory for work_data in the non-blocking read
> path but never free'd it again.

Yes, 'work_data' is allocated once on the first nonblocking RNG request
and reused for subsequent requests, but the memory is eventually freed
on device removal in atmel_sha204a_remove().

The memory might be retained unnecessarily after use when the device is
idle (probably negligible), but it's not a memory leak.

Best,
Thorsten

