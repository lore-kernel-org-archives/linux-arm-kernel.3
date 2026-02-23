Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334BAE98E09
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 08:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Jn+9bAvm0kQIymOaqw76fCPzCInW2hdIe6l76PNf8Q=; b=H/XzI/67fLe+k6aM0+/f01tn+e
	4GorO8JqqT+eZbW/EuWCAaZRq45pi1plV5xcGv7etIlUFH3i2MXFqvqLPQD/lyINFIiG5uLn/phzh
	9VUMTy6+BNwC12rUUmTQWxJzJU1Jv4VPYPO3orNwF6XqNXFXI6jcniVQrVpUipoRia9/Ea2vClKtV
	viv94IMitWEN+1VpqjZ1Bh5GZCPaPcQgTQJ44YaO8fCZ4FbaWeliLmQCgX7Wd+oGfVClDoQ7nH7GE
	mxJN1sxqG++N9FMp2kdXTo00MhXYYlHvbSsUPkaD51JrfyXmwCsAl+82GycIJ6qjnf41nuP0AQhF2
	8x0sWDbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRZl-0000000HRD1-1sGK;
	Mon, 23 Feb 2026 08:45:57 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRZi-0000000HRCe-0PjF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 08:45:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 65B78C0078F;
	Mon, 23 Feb 2026 08:46:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4A9825FD43;
	Mon, 23 Feb 2026 08:45:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C0257103686FA;
	Mon, 23 Feb 2026 09:44:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771836288; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8Jn+9bAvm0kQIymOaqw76fCPzCInW2hdIe6l76PNf8Q=;
	b=EDbFHxeKAfGw8+gnLFRq6tQC0uJRJ7Yurql72wpaI+ckTM5ucON1jvgfTKEauHmjNTz15Q
	F0GV6MJB/cPxcxtlWRCh6Ut1doiuDBN72GVii/bSslx7qPojIuN6WQtwpwmmg0EMd9udti
	hXBEhctUmZV4gK6DZXF/tvLj8nfhfS8cBlUeT2kznoHFYf/QuU6rvcXwVlkBChlGW1JB+a
	jD/t0LGvF9+zBj33MG8DxzhaA7Y8Ob2+muzb0W8obUnqhcVLE8i3ZkDGlwhj5/biyW9+4Q
	po07cWOqGFZsrc8pul5Y/jPwQ3dAH5zsEAP2HkQy7hs5BvE1fbJmw1Ixfr4CTQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  linux-usb@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] usb: ehci-orion: remove optional PHY handling code
 remnants
In-Reply-To: <20260221-ehci-orion-drop-phy-handling-v2-1-5e26aa73790b@gmail.com>
	(Gabor Juhos's message of "Sat, 21 Feb 2026 10:02:37 +0100")
References: <20260221-ehci-orion-drop-phy-handling-v2-1-5e26aa73790b@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 23 Feb 2026 09:44:46 +0100
Message-ID: <87tsv7rgqp.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_004554_289094_F07384C5 
X-CRM114-Status: GOOD (  11.28  )
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

On 21/02/2026 at 10:02:37 +01, Gabor Juhos <j4g8y7@gmail.com> wrote:

> Since the USB core code handles the generic USB PHYs automatically, the
> optional PHY handling code has been removed from the 'ehci-orion' driver
> entirely by commit e04585184dcf ("usb: ehci-orion: avoid double PHY
> initialization"). However, the devm_phy_optional_get() call has been kept
> so the driver still gets the PHY even though it is not used for anything
> in the driver.
>
> Drop the remaining code, and also remove the 'phy' member of the
> 'orion_ehci_hcd' structure to simplify the code.
>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks!
Miqu=C3=A8l

