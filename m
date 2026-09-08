Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38255C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 10:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5vAQX4mLQwg3bgyjWIDegZmml35dIae71Cu53YVyKVc=; b=vnZHlgvbRG2UHXHZt21MY4LVow
	2GOR/2I20BHYv90poyQkQ5t0/aHo5kJOlHWw0b6F3koDs0iJfA1FkfKHcau8Qy8OEOv/adCdA4Q+Y
	+TYWy4nUS79Smsn6klb1O4LHodIDu3p4xnmAOrRhNWuHqsGGz4uCpQy6rjacv6L6Z48dyddKLjAB3
	nXWE1IH/iDx1aSvdleQu7A9+kbq/40iBW6XDNxgVIp5vLH9HxlcD6jPmrJWDPOqIPpu2MPaylVmXq
	zvINNDsM4fujB8HGNA/OB5tkk4UTtPBf9OmEcMEVSlH4allVMvJJIad9z+VY1VLgBu3I4iZe72/EG
	cRCaRH5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sg9-00000008imt-096i;
	Tue, 08 Sep 2026 10:03:49 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sg5-00000008ilM-2Sma;
	Tue, 08 Sep 2026 10:03:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A1D9A1A1A56;
	Tue,  8 Sep 2026 10:03:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73C25603C4;
	Tue,  8 Sep 2026 10:03:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C87711C7AF5C;
	Tue,  8 Sep 2026 12:03:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788861816; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5vAQX4mLQwg3bgyjWIDegZmml35dIae71Cu53YVyKVc=;
	b=HJxw7a5n7JiOtutr1aQa1jZOAcwYz7vUl4NtBmXInV72w47M2bbpX/gqsgpboIQx2ttkkD
	uJhck1Odhe6MP98SkTQKScFMRfE+5rZvf2rZimWdm5MoC+P3Vt1g8SUjbHeVIGdvRCwoO3
	ZbuzkTmBrjV6OMhxCdmzmvHQ/A6D8ohLa4PtjAqD7VLGrwY+PRcX7UZ2YBzXC3FGJ0HrxZ
	wLeFInhRpblg7OiYJyNlVTfsWzs8Qv1eFkR+N9jQ8iDBUhTHmI+JplH6lx4pGdlSV5BA60
	hhUYLGMmQCeKzYfHZ5VZTkgd4in2hMlAyW681J1LPsot4e024AN+k71R7E96Ew==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Chen-Yu Tsai <wens@kernel.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,  Boris
 Brezillon <bbrezillon@kernel.org>,  linux-mtd@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: sunxi: fit maximized ECC step to page
 size
In-Reply-To: <20260904-submit-sunxi-nand-ecc-step-validation-v2-1-6e3ba6200948@gmail.com>
	(James Hilliard's message of "Fri, 04 Sep 2026 16:39:27 -0600")
References: <20260904-submit-sunxi-nand-ecc-step-validation-v2-1-6e3ba6200948@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 08 Sep 2026 12:03:33 +0200
Message-ID: <87zexst5ze.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_030345_763979_C7C0B046 
X-CRM114-Status: GOOD (  10.21  )
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

Hello James,

On 04/09/2026 at 16:39:27 -06, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> When nand-ecc-maximize is set, the driver unconditionally selects a
> 1024-byte ECC step. A NAND with a 512-byte page consequently produces
> zero ECC steps before the available OOB bytes are divided by the step
> count.
>
> The older sunxi NAND controllers support 512-byte ECC blocks. Select the
> smaller of the page size and the preferred 1024-byte step, using a
> 512-byte step for a 512-byte page while retaining 1024-byte steps for
> larger pages. Unsupported smaller steps and controllers without
> 512-byte support continue to be rejected by the existing checks.
>
> Fixes: 4796d8655915 ("mtd: nand: sunxi: Support ECC maximization")
> Cc: stable@vger.kernel.org
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

As reported by Sashiko, there is another use of 1024 down the road which
must be modified accordingly. Although, in practice, 512-byte page NANDs
have disappeared for quite some time, so this is a theoretical fix more
than a real problem.

Thanks,
Miqu=C3=A8l

