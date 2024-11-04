Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CE0D132B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 12:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYvItjWc7e4pPd+CCBu2oWSX6jirooxClqMJ96xxtcw=; b=GqZcp1qLVAvwvgXFsm/sZGigGh
	p9gbDw8+7m9Zs+fbF4w33D0xkeuNRkj75P0iljfZ/RnEpaGrkkGTI6NW1FHmyxjqawycY449CADiM
	81qH9G8MUo+kVUuDebkCmQiD44eDSYpmsAKufM466KICldOjbBh5mwSq6SU3AKhK0BtOUbyu0MapL
	NmVG8JAjf6uAA8Gh3yBd5MzrfHrOupJ0WJvyWrcS4H+tWkf3upX2E7DQSPlzKgGzM2hqoxs69WB2y
	1x2nbFbbT87+C2krrj2PE9keGFw8iJbh5Ek8XR2ER4O2NY+v4di2W7DBpQTshKlqO21/tBhjL6IMn
	iU2TOjlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wX5-0000000DkEp-45CD;
	Mon, 04 Nov 2024 12:50:11 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wVO-0000000Dk8U-0yrZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 12:48:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9CCD5148169C;
	Mon,  4 Nov 2024 13:48:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1730724500; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AYvItjWc7e4pPd+CCBu2oWSX6jirooxClqMJ96xxtcw=;
	b=bqca/QcPRvHxrrDCthh0DkY0v87ETWZmLpK9jTIXcC/BG7tkQyu0CdN9HTbXkbxPI289eW
	GN+J8oOvw9/q1uPpjlyZyLsdwoX2UPaUzUfIBqIIf52Ok6vlNNFpy9qTwzGJsLJvjfFdMK
	mdv3O4Vcx/K+RH5ah7wXRsBdDAaNQFjRbWzDA62iipIndAUsPiqyEkweOnNEgU5wlmmSY9
	m+zOIDM/MOQaPtuMEQYLYmmDlomqXV0WmGeU0a5pJfSFZLo/u82YB3usg2jWJbTxObtH1v
	ZYT66nD8mg+tRIIIje0D0CXhWa/qDU7wPLjMEEcjCkgePV1oo5nKLSek/PPIfg==
Date: Mon, 4 Nov 2024 13:48:12 +0100
From: Alexander Dahl <ada@thorsis.com>
To: =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Varshini Rajendran <varshini.rajendran@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v2] spi: atmel-quadspi: Create `atmel_qspi_ops` to
 support newer SoC families
Message-ID: <20241104-vanilla-operating-de19b033f0a8@thorsis.com>
Mail-Followup-To: =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>,
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Varshini Rajendran <varshini.rajendran@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
References: <20241030084445.2438750-1-csokas.bence@prolan.hu>
 <7cc95e52-7509-44eb-8e30-d518283e7d87@linaro.org>
 <2b310b54-c215-40fa-b6d4-81faf75a8c9e@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b310b54-c215-40fa-b6d4-81faf75a8c9e@prolan.hu>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_044826_784010_D4257AE8 
X-CRM114-Status: GOOD (  22.70  )
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

Hi,

Am Wed, Oct 30, 2024 at 01:37:52PM +0100 schrieb Csókás Bence:
> Hi,
> 
> On 2024. 10. 30. 12:09, Tudor Ambarus wrote:
> > I think it's fine to split sama7g5 addition in smaller steps. But please
> > add the sama7g5 support in the same patch set, otherwise this patch
> > doesn't make sense on its own.
> 
> Well, actually, we're using SAMA5D2. My goal was just to somewhat harmonize
> upstream with the vendor kernel so that we may contribute other patches that
> we have made on top of the latter, or in the future, take patches from
> upstream and apply it to our vendor kernel-based tree. This patch was only
> meant to lay the groundworks for future SAMA7G5 support. I can of course
> send the "other half" of the original patch if needed, but I wouldn't want
> it to hold up this refactor.

It would actually be better if vendor would bring their stuff
upstream, so there's no need for a vendor kernel.  Did you talk to
Microchip about their upstreaming efforts?  What was the answer?

Greets
Alex

> 
> > Also, if you think you significantly changed the code of authors, I
> > think it's fine to overwrite the authorship. Otherwise, try to keep the
> > authorship and specify your contributions above your S-o-b tag.
> 
> I don't know if it counts as "significantly changed", I split out parts of a
> patch that were relevant for our device, and made small adjustments to make
> it correctly apply to master. I didn't find a descriptive enough tag for
> this, so I just went with Cc:, but if so desired, I could change it to a
> S-o-b, Co-authored-by, Suggested-by etc.
> 
> Bence
> 
> 

