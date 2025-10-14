Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39113CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 10:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSCBeJ8YaxPzGGnlaYVZUiXTKXZ5yYcoN/AmOZYDRxE=; b=COgxqkPiqnKHzeAjH20n8VwXB9
	aEGOK/2ve2ew0WlrnE/iSWk6eSvy1jvC7cpbGYnUZW2/I2tSBJ1CI7CEvJHKWWvl9s+aizXNWSLbI
	Xu5TE+vFyAKHPVEWxKb9vG5M3e3YvGFtkqsx7v9KntbpYdFCKcqOAPUkl3vBMJl6SLP5okqTC/FPr
	MaOn8i2BQETlo1CS9N3J+cX/e8R70ftvW+pqiju1et4npJTWFvOX57aPHr22vqmFh6+Y4H1at9k5d
	sbwqe1E65Xa83AA5lv2J81ZBAAFFf7X2866pVvd0K3fkveSxpV5smIAnUuI05u25xxFKJ7BjJvWiI
	G5VwiMnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bwo-0000000FsbF-3Sqp;
	Tue, 14 Oct 2025 10:08:02 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bwl-0000000FsZ5-1jcC;
	Tue, 14 Oct 2025 10:08:01 +0000
Received: from localhost (unknown [10.10.165.11])
	by mail.ispras.ru (Postfix) with UTF8SMTPSA id D7A304076183;
	Tue, 14 Oct 2025 10:07:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru D7A304076183
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1760436471;
	bh=SSCBeJ8YaxPzGGnlaYVZUiXTKXZ5yYcoN/AmOZYDRxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OhNzZHNsBMufwTkKrOIwGeFEPftMV6y7L8BKIBqMJ6Q8Je+fQXwuGaDQLMkRaFfOR
	 iRlSPWRuv3Q30ovuzIQHKyoUWHZ8dYxFVqsqNSsEJebUBLl1YIx9HiWGxl6ZaYw1xN
	 DzmSpc3GdTypCluR/LF9VnaVoiP81VfMduVAhdys=
Date: Tue, 14 Oct 2025 13:07:51 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, lvc-project@linuxtesting.org, 
	Eddie Huang <eddie.huang@mediatek.com>, Long Cheng <long.cheng@mediatek.com>
Subject: Re: [PATCH v2] serial: 8250_mtk: correct max baud rate in
 set_termios() method
Message-ID: <20251014130050-5cdb9e464558d609872d38cc-pchelkin@ispras>
References: <3eb40848-3bec-42ca-845b-c66d4b53cedc@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3eb40848-3bec-42ca-845b-c66d4b53cedc@omp.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_030759_942057_7C695742 
X-CRM114-Status: UNSURE (   6.94  )
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

On Sun, 12. Oct 20:56, Sergey Shtylyov wrote:
> Mediatek MT798x datasheets (that I was able to get my hands on) claim
> the maximum supported baud rate to be 3 Mbps, while commit 81bb549fdf14
> ("serial: 8250_mtk: support big baud rate.") claimed it to be 4 Mbps --

At least MT7987A datasheet claims to support up to 4 Mbps, so I think 4 Mbps
should be chosen for the upper limit.

+ added the authors of 81bb549fdf14 ("serial: 8250_mtk: support big baud rate.")
to Cc.

--
Fedor

