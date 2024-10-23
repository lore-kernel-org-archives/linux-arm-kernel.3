Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D532CDDE49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 10:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k5rNzgUZyWrtBSbaLrqGd7OPbJDTaej+TlqFpiYfr5w=; b=syTnWBwOxx6Z4x
	I0EBjMtVb6SNn7dqGpoLvuZDN5w+Q4O+01iQfxlQuaYfkkwPSH2eLdZ7yxVLzp2TQeAzV9BAKlmSr
	pKkuCDJHsgBm3rdi8GUUXGc2h2yksfwG445LeiCqQ+ymj1sbBOu115lnF7JXd5ZDucXC3dW1tiDqV
	4zechKYUHyQDZnSzejAYGdRdOZjuIJnNgOVkrg37sSVoUyHrXkfNxn+txqYgJCqCSDHozmFDsd7L5
	5X0p65OXbU8Iu1uTlliSAS2aWDXpmOLJiFFZPso2oGCIzhg7IvDQALuxotVcxmsrfJj+rA3eCZBBh
	df/x0ds3A7lgNs/tc1Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YP0-0000000Dwnk-0CUG;
	Wed, 23 Oct 2024 10:15:42 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Xzf-0000000Drd7-1JbI;
	Wed, 23 Oct 2024 09:49:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4DE4520003;
	Wed, 23 Oct 2024 09:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729676966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k5rNzgUZyWrtBSbaLrqGd7OPbJDTaej+TlqFpiYfr5w=;
	b=F8eYGl/LUBLH5b5Qbnd7lJ8YsELa2AQ0vy3Ybz2eaaPly6sCgzpuebVN4kemUl9fWuTNhz
	8NEvWEaI81iXglBSAOCmf0xB/nJWq48qkvmb3GTf/5L+a/uO7twrYokRpy+GQAnKesoj9z
	AmZG+kTk+Dfgco6KAMJ28M4LCBlpeybWl1GtRRdNpokUsl1Li1PIzgaobDgkor0B989FXU
	3RNzD6i/t8PKUYoRHKtiMD+pR29ikp5HTDP2ttBWHW6vEFhjSQ6Sn0PJktpD1tbPMRhIWK
	hX8Zcm1bhpGJ+wYwu+qb5VtQUBV2Reubwe/kxOk/Nid3XXy4dHxB4BJ6KJ+Bbg==
Date: Wed, 23 Oct 2024 11:49:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH next] mtd: rawnand: fix double free in
 atmel_pmecc_create_user()
Message-ID: <20241023114923.18e8e1b2@xps-13>
In-Reply-To: <7d809e5f-32e1-4438-9cc6-3167f27dd239@stanley.mountain>
References: <7d809e5f-32e1-4438-9cc6-3167f27dd239@stanley.mountain>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_024931_664358_6D50695A 
X-CRM114-Status: UNSURE (   6.95  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Dan,

dan.carpenter@linaro.org wrote on Wed, 23 Oct 2024 11:40:56 +0300:

> The "user" pointer was converted from being allocated with kzalloc() to
> being allocated by devm_kzalloc().  Calling kfree(user) will lead to a
> double free.
>=20
> Fixes: 6d734f1bfc33 ("mtd: rawnand: atmel: Fix possible memory leak")

Hm, I missed it. Thanks for the fix!

Thanks,
Miqu=C3=A8l

