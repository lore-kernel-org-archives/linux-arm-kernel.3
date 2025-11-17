Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB25CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 10:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QyzR7iq+ODR7vgeIZqYkU/02HH1m1IiL2UuTrM19qI=; b=gBkLjht1KOBputiFTuFOawm5Xa
	K7QBI9+OnKWM4Ppk3vOLjseND/dyDh5ttfRbLPjOjsL8ChUVUlAJybzykJ99uPHSpqgtQu0UznQgQ
	de2LwA2Ll+kj2QiFAfbsUD+/AERdTRoex/GIRBQ2RDUpmNwspLT83LPPVFFgtmNu2G3sX4dw7pLzj
	Bud4OmS+tZZRA+L3/tgGl7RX1X1BEoUNduiinh+jZ9dbsQqgXSpMID1bX073Lq5MBR+2z6dy/8UrQ
	IZ7cHEjHRPUwVTSORQW01PXjqjyU/YFtyi4C8uOslCUdSTodjFUxBbqtX/7P8Km+aqGoWQTJktYSR
	E5fdXIAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwt6-0000000Fv71-2jcr;
	Mon, 17 Nov 2025 10:55:13 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwt4-0000000Fv5e-0PSn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 10:55:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A5B3B1A1A1C;
	Mon, 17 Nov 2025 10:55:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7A93D606B9;
	Mon, 17 Nov 2025 10:55:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C10AA10371D22;
	Mon, 17 Nov 2025 11:55:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763376907; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8QyzR7iq+ODR7vgeIZqYkU/02HH1m1IiL2UuTrM19qI=;
	b=Mh+MM3Iat+uR+piX6fvbceQx19CgVzpOt5DEMOsf8diGqwvaXamIQdVTCrqYvmP7JnLgob
	DWKm2k/Kg+4GTEB2SLVXi4+ad2uuIdYnOK1zKlt6gGp/O6nXUdeaIHD5OqAIRYEpkalOgg
	Hbi/Xzhp8IMv5dMmWw6lKvAkiyLg5z8EzqYcThcAD6Jpqjm30ty+ZWJf8+Iev0rCboE9WF
	8S1AC0O1zjM/UNuFy10tG/NuwgU+r+b+eTdkTDcHo4NyRWqwrVCLeRI7bHmXXE6jrmE66D
	urjo31tZoscn+ktguAz3cmmDgcGySo+O629mIGBX33eURSIrDYCB4QBriyaKyw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251104100842.369-1-vulab@iscas.ac.cn>
References: <20251104100842.369-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] mtd: rawnand: lpc32xx_slc: Convert to use
 devm_gpiod_get_optional()
Message-Id: <176337690443.1740915.2027310433419117418.b4-ty@bootlin.com>
Date: Mon, 17 Nov 2025 11:55:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_025510_273240_DDC68264 
X-CRM114-Status: UNSURE (   8.52  )
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

On Tue, 04 Nov 2025 18:08:41 +0800, Haotian Zhang wrote:
> The initial fix for a GPIO descriptor leak added manual gpiod_put()
> calls in the error path and remove function.
> 
> This follow-up patch improves upon the fix by switching to the
> resource-managed devm_gpiod_get_optional() API.
> 
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: lpc32xx_slc: Convert to use devm_gpiod_get_optional()
      commit: 1f3dcfe5fcf57739b4a82811c12e55c48d794f86

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


