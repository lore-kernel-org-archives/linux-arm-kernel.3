Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EAAF417F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 15:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7o2lSlwnqD1IVDD/21T16zX/mpFvqv7Ltx6kYFACD5k=; b=0SFnjuCQV+0yu9WP+2aDVEnvuO
	hrZx+LEcv0/qSxDj6nFEyJyp3FPJdpxS0xR2p4MUJfqGe8NpX+f8M+elVTWbkqg0Q75TooUnhJCBy
	gPxgdWyto/GfvWyApZAfTd2op4WjnlJwVNKOQUQ07SZybz4epuikgsCBGkVUNwAeTzqsKICnLYHRD
	PEyS4oukXSbFPRsmrNvEngAQ6PvSsEZ5eKQDvwFYxD0u4FWAr/0BGDdWgHYKAi+UdlUmBqCJGnj3e
	sxv0BXC/rrz1HpDniHyKgZWLG9Nc487i/GKZP7+kPEVeQdYIAvk24pJXYbDMlHMGgVkiTyW9O364X
	WHkbVSAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcWO-00000007bSY-2609;
	Mon, 09 Mar 2026 15:27:52 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcWM-00000007bRj-0C5Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 15:27:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8663FC4287A;
	Mon,  9 Mar 2026 15:28:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 21DD15FFB8;
	Mon,  9 Mar 2026 15:27:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A34C810369A9B;
	Mon,  9 Mar 2026 16:27:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773070067; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7o2lSlwnqD1IVDD/21T16zX/mpFvqv7Ltx6kYFACD5k=;
	b=NcIIly4DbRfRXqvItRLuep3qvqLnq7SWhqJtYzXeNVq2UihIuui7iJgcIR9rZ7xWW5Htgk
	DrnDaxi8xhMGISqAKGpd0ZYMozw4VtIKNzmAMN8P7zyyJ5RbuoEAwpobhkkGBsiXOuQ2WE
	x0v/927EmHkOjGGwcFUC+Hfw5D3mV0ZgxuOAd+MzRN/YWnV3OBq8QwsuB692Tvyg1CcEnf
	VYQSx1JfLeeHLZ0mwzfH2Adf+oROoXoyOhZrGgJAKAm92N8GElRtRDmfq7HGxmfo0tLBog
	izRJVSb3XnR45xZUIzhSonml8BF0sWdzQWNrrZaC7jlCX8HQ6LKGS6vEhLxVYA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Chen-Yu Tsai <wens@csie.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,  Wentao
 Liang <vulab@iscas.ac.cn>,  Maxime Ripard <mripard@kernel.org>,  Boris
 Brezillon <bbrezillon@kernel.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  linux-mtd@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] mtd: rawnand: sunxi: do not count BBM bytes twice
In-Reply-To: <20260305100137.2558423-4-richard.genoud@bootlin.com> (Richard
	Genoud's message of "Thu, 5 Mar 2026 11:01:34 +0100")
References: <20260305100137.2558423-1-richard.genoud@bootlin.com>
	<20260305100137.2558423-4-richard.genoud@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 09 Mar 2026 16:27:42 +0100
Message-ID: <87a4whnhu9.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_082750_223131_88FE72D9 
X-CRM114-Status: GOOD (  11.51  )
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

Hello Richard,

On 05/03/2026 at 11:01:34 +01, Richard Genoud <richard.genoud@bootlin.com> =
wrote:

> BBM is part of USER_DATA section, so we should remove it twice

Maybe you mean "is already part" and as such the end of the sentence
should be that "we should *not* remove it twice"?

> This was working ok because we are on the safe size, advertising that
> there was 2 bytes less available than in reality.
>
> But we can't change old platforms, since it may lead to a different ECC
> strength, so, introduce a legacy flag for old platforms, and switch the
> new platforms to the correct count.
>
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

Thanks,
Miqu=C3=A8l

