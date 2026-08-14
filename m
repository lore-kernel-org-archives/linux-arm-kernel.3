Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4D7C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 12:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mODKqQA1sxM7LYMpe2HFGMEJ30+oklZq/tpn4mz1xKk=; b=ucq2GH3nlD49P8TSkfPb4i4AQr
	+DE6niHnMvvNyk0ix8BmVi39Xtjex8k0AWBo3vJGrXcsdzZbaNxDQoHKJPs9+F4kTzfpHHN5+iWE4
	oTE2UciryBsCEHzXlm2po/6jDL40D+0zT1QdgoxO2QMkm5Dlvtz2wPVU8FStRsh+6g3/wNM1zXagz
	kBJ/Ge5aVPXLEOwRtG9bydgK+wadOZh+eimOn3A9lb1bC1laRCP2BC2gEsJ/llSy1OsupSyk9xeF/
	nYiWPygnXwQawk4O/Z2IGXoDrzy/pgKWyePMUKh2CABRUtVZfpOYVht7ekq7N22djBI8UHfgEt3Hg
	gWreJEkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wurGo-00000002faZ-0x2g;
	Fri, 14 Aug 2026 12:44:22 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wurGk-00000002fa2-30uT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 12:44:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EA8294E41222;
	Fri, 14 Aug 2026 12:44:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE77D6046D;
	Fri, 14 Aug 2026 12:44:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8329511C4EC8E;
	Fri, 14 Aug 2026 14:44:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786711448; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=mODKqQA1sxM7LYMpe2HFGMEJ30+oklZq/tpn4mz1xKk=;
	b=CvpC1xbSgxA3DjiB8rnsoKdyYMvzFFJG56HzS4Z2AqJIiWJXKSiUlQdgXpyr6SZLR5Duq1
	Lgjge1zYALo7BdDIie8Q/fyL2ykeRaZJhicYinF7y9aJ3+VoJonIntjt/tnFAiyH1Qz+6n
	Lw0EF8gCag9XnPD3aJCyK1j6PqthqhpddcMau9SAWFxb7K0VaP3TMPCO35RdoS2hw5GS8r
	sIzYf35HAkTP6gwMKeTCQ5k9RObDdHTtzcPaWN3wLlJSLmUxAWeIYnzwu+Nlh6ou/0POv4
	aJDkipXXAom5E8TuiumE4qIiyynheaudgaZLJwyf6234rYgXVgFRd0TZfiUrCw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>,  Shan-Chun Hung
 <schung@nuvoton.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Steam Lin <STLin2@winbond.com>,  linux-arm-kernel@lists.infradead.org,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] spi: ma35d1-qspi: Add DTR support
In-Reply-To: <09c3928f-4b58-4ac6-8e1a-84dfe3ff6b92@sirena.org.uk> (Mark
	Brown's message of "Thu, 13 Aug 2026 22:33:55 +0100")
References: <20260813-perso-ma35d1-upstream-qspi-v1-0-b217b9870eb1@bootlin.com>
	<20260813-perso-ma35d1-upstream-qspi-v1-4-b217b9870eb1@bootlin.com>
	<09c3928f-4b58-4ac6-8e1a-84dfe3ff6b92@sirena.org.uk>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 14 Aug 2026 14:44:04 +0200
Message-ID: <87ik5ckh2j.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_054418_934182_97697A89 
X-CRM114-Status: UNSURE (   4.43  )
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


>> -	ret = nuvoton_qspi_configure_bus(spi, buswidth, dir, xfer->speed_hz);
>> +	ret = nuvoton_qspi_configure_bus(spi, buswidth, dir, xfer->speed_hz,
>> +					 xfer->dtr_mode);
>>  	if (ret)
>>  		return ret;
>
> This needs ctlr->dtr_caps configuring, otherwise the validation will
> block it - only the _mem_caps were updated.

Ok, thanks!

