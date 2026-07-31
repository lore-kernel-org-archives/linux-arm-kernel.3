Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569AFC55174
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 20:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yebtGUa2uL7h2MtOfCtXvRl825pwJqmlyhUE+Wjb6EY=; b=cC77Kz9biqu2o8w7O6HTFJU8im
	djnIGzYcbFo/mfRo2+5flyTQvqIHF94MIBFfAOSAC8tRmOGfeUzt6PMOF6LdXvy9Bo1gxe2ilds52
	vYtD2eaA1DlJJ0H5ZkkUGKZikwP0rBqcG3qLKzolffzFpUdsyR1XVEJ475cujP1cNtLB4/Ju0b0UI
	kGnNUXmK5CrElknTqtodv/ja0n7Ct0u6NtOWHmKeVNPyKTs5ePtfYwHrPWPvWhWO4VSRXLPbOw+NY
	TurSlQkbf4T5TjJV1+jDIeA45Mu41n2XdNkQR5Rc8bIpNPMQvTGqRXXE6S/OTlvNBigGl99Lp465q
	tSPu6R0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpu8E-0000000DZUO-3L6i;
	Fri, 31 Jul 2026 20:47:02 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpu8C-0000000DZTQ-1m2J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 20:47:01 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=Fen9wKt55bvlJ6YwZALJLAh1T0TNrU2GbVmVG/BJvOY2xjajJZ4w+1EqBrRH8igeoV+7iV+UJmnV4yHTm11oHNuXI7KVVIlhQIk45UBpRVaP6drMBS6PEaYiS/nLJw2VdPd9XXuYjxERW3oBOcJnNyn/Hmz23RmoendTlSQh7VuB0gKvnf4x8txxefH5VEqFJiev/oe71RiVYwFMU/NXFogIfZKOODk19ys4zdjN60NgXDaaIzDGIonRertmu6biu5bezrPSIvfGg6NuKmMzdtXyw5DKlWWtMIMpoYnirI8tmE4yvVqf8dDzCqnZdY48F0GyRUqCLD5AlLgf9La4zA==; s=purelymail1; d=c127.dev; v=1; bh=yebtGUa2uL7h2MtOfCtXvRl825pwJqmlyhUE+Wjb6EY=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=fhOQSsTDbK4PMqvXrBFp2EAPGjpy5I4Z7yH7u83e/c0hfPTYYropER4VOX/eWuYsdtf9jzYMIDoqeQZwyDPrsUT8XHq4KLPcZjjrR+OuHn1djVLzItqY4cZjgcR9v6GX4YQqaIvV/EBJHPoU2XH6m1338OezIakMMT3n0rWhLYjKkDWLaE0IWknBZrJRuDS3G86x5Phh7icBARQ19LbxhR+ColyBAkhDtYYmRsVXEaI385AdUhfr7GW9e7domi+DgdVnIlQCgiEIuYxDbz6f9mecArVKddpC5cI/fXGwptEMqWNrPkvJ23DXm0/BGU+90yTEDSNSvlEF0vuvYjsm6Q==; s=purelymail1; d=purelymail.com; v=1; bh=yebtGUa2uL7h2MtOfCtXvRl825pwJqmlyhUE+Wjb6EY=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 1017243:43747:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1250848215;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 31 Jul 2026 20:46:27 +0000 (UTC)
From: Johan Alvarado <contact@c127.dev>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Johan Alvarado <contact@c127.dev>,
	netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	Jose.Abreu@synopsys.com,
	rmk+kernel@armlinux.org.uk,
	pavel@ucw.cz,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net RESEND] net: stmmac: raise TX completion interrupt at the end of an xmit burst
Date: Fri, 31 Jul 2026 15:44:44 -0500
Message-ID: <20260731204444.65925-1-contact@c127.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731194522.55069-1-contact@c127.dev>
References: <20260731194522.55069-1-contact@c127.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_134700_544830_9FBD9CDD 
X-CRM114-Status: UNSURE (   5.90  )
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

+Cc Maxime Chevallier, who now maintains stmmac; the MAINTAINERS
handover postdates the CC list of the original posting, sorry for the
omission.

Maxime: this is a repost of a fix originally sent on 2026-07-06,
reposted at Jakub's request after the netdev patch queue overflowed.
The previous posting, including the review discussion with Maciej
Fijalkowski on whether frame-based coalescing could be dropped
entirely, is here:

https://lore.kernel.org/netdev/0100019f35ea26e0-42ad009c-01ab-4a8f-b126-fa6=
5fbacae5c-000000@email.amazonses.com/

Best regards,
Johan

