Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF081CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 May 2026 14:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0F2bp1mazAkJtSUEyvJv/Ar4TEUHcrJS1Sxc7iPu/w=; b=oVxgAUZ75BXQWrH78rh64cc3qR
	0fXNKclWyHpx6HwYzpgwzzDTxR2TaZAOWkN7b1AqvYwwi9B08TBwj8a27mx6+FRtctWaj+0EfIwhc
	DiSZsJkG38T2TI6TWyciXPgMu0C2opWThoYIXWP4Hx+8odWJf6/ngPM4mq4vvTLfQu3hWq812SYHk
	eMtsziZxAXf8qdF/H2d1QbPMG9QkqupQRVEAwNPMYc8ap1Jw7VBsOUPLFaTpuoNRk/4xVLqt4SHmX
	yfzyI9swf+uMcHryv97/O/sEeQtzbYs13FgzEzYYf387Mdiget3jGziDuFThkljCb+NA22vCh1ays
	/gZ7/Vzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJBeJ-00000009BZJ-1xop;
	Sat, 02 May 2026 14:48:55 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJBeF-00000009BY0-2cpH;
	Sat, 02 May 2026 14:48:53 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1777733313; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=e6itlIHEut/CPuoZDesPd7jHWDdjrBNN76l2JwPCfyZ4Gw59aM1IPCoaaFA2EW0E1K
    cCjOyklcepHi/5yYR7RjHKqn0GgwY1upw/fgQsd02P5TiBxcqWlwNWP9BTp9QgGGds5C
    bypITQKtIRB+q9iFnKIxFDPCJMDdkKi1mBN3jExEb9vxAvprKAi8D7/47WHjcFot8m9i
    hOC87SQiB54yVKdDMtjxFoXCjsen8R6TwlqCMlRP28sYpJd1Zig3o1JMzcRSXd/klQ5a
    njJx27kenk6mXE88dPm5XRq/VJzjBflQ2f8YreCPJu9AaZ/kMACj5xD1ZxkFxsoFIOot
    i2Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1777733313;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=U0F2bp1mazAkJtSUEyvJv/Ar4TEUHcrJS1Sxc7iPu/w=;
    b=kkm/jEv8Q1coPGRqAgw00IKDsMPIwC51eh0QeESYrOJGLBR/kJwJVkAuiy84Du37o2
    TIb69fK9uQNVslVWVvpSUF1d342IJk+vULHmaZdoukmmv/chYUHQmm/APYJBjnOTWDdf
    aEneVBcGXA421puqzSae4jpRGgKshs18WOoCuJsl5W6H8jAHrTUH6oN/frmO7ZvhCfMH
    BtgqkTLBLbGl46LiVZ78e06G12jk4G8AETfigVR5u8GnG7jq5LG1ws5h6Q1q1hR2Ssuz
    IVJ0xfzQKVcyOsm4+NVxm7Uv9IHlhGjebxkC4RJB39ar/1mf21ebWkwTyM3Kdhs0Mj3l
    4b5g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1777733313;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=U0F2bp1mazAkJtSUEyvJv/Ar4TEUHcrJS1Sxc7iPu/w=;
    b=oF8wqdexWxrJxhDdkT9Mzf+qQGrDtLy4Pvg6y3lk49nJvo2rXASQaXUzKQRXM43ER0
    QijNJo7tLfJuoxQdH+1gQa3HO5TugDLPTVXz/3kJehD9zagUXfPIptbMOa5LA9VO9F1h
    UaZYgdebAB6jUMr6djVQthmAeMaX2VbyO0v945iIYrTEdbT/3cFKUi46/GMK/Hs7yvnI
    +190gTdYAI5CtPtb6k2qyKxQ5D+g0XrgmyWEuINQYBbuXdO+9sFJcrGCj+eh+kca1bew
    BD01Q3PWhg1o9IKe2wq5UkhWA+qsM9LUp58SqeVXnqf6NAXd0YnW1APBZJ8EYjEDRAeT
    6wQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1777733313;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=U0F2bp1mazAkJtSUEyvJv/Ar4TEUHcrJS1Sxc7iPu/w=;
    b=DsMG1es88ao8/91HpH1qVJILUUqJnJWArDBTRTvoiAjIP1WkUgj1fMYXCdfVcIQ4/v
    VusIXROai6OSAYusMbAw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yfzkZ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.0.1 DYNA|AUTH)
    with ESMTPSA id Qcf97c242EmWZPM
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Sat, 2 May 2026 16:48:32 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.6\))
Subject: Re: [PATCH 3/7] pinctrl: ingenic: Fix type in .pin_config_group_get()
 callback
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <9f50c234c44af9075b5252ee7e59452ed2179b27.1777562725.git.geert+renesas@glider.be>
Date: Sat, 2 May 2026 16:48:21 +0200
Cc: Linus Walleij <linusw@kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Sean Wang <sean.wang@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Tony Lindgren <tony@atomide.com>,
 Haojian Zhuang <haojian.zhuang@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <98F0E379-88A0-414E-B24A-187374E5FCAD@goldelico.com>
References: <cover.1777562725.git.geert+renesas@glider.be>
 <9f50c234c44af9075b5252ee7e59452ed2179b27.1777562725.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
X-Mailer: Apple Mail (2.3826.700.81.1.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_074851_940640_9E214F89 
X-CRM114-Status: UNSURE (   8.61  )
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



> Am 30.04.2026 um 17:33 schrieb Geert Uytterhoeven =
<geert+renesas@glider.be>:
>=20
> On 64-bit platforms, "unsigned long" is 64-bit.  Hence checking if all
> "unsigned long" configuration values are equal should be done using an
> "unsigned long" temporary.
>=20
> While Ingenic is a 32-bit platform, it is still better to use the
> correct type, to serve as an example.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

tested to show no visible difference on Ingenic X1600 based board (Letux =
X16) on top of v7.1-rc1.

BR and thanks,
Nikolaus



