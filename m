Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01C8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 13:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGAKh4uQmxyCz+ONct7STH4pqwnEOwd9rXKztJGQ6eM=; b=N1Ef0C2tLw4ylLSrhKcTIBioyE
	EcAFCiIYJpqM6kBNke6dNC2Z5x0NCppOoKSZeUtBQsH0f6AF86/fxshPvURA9FXesOabxfvUz6z7p
	7/hfnfmH2HYNgnFAmDIy36iaR/XZjrOG01OI37BXYIF4h8TiA6oP51mnMK0T7fE7rEHlzScsL+X1R
	GwBO6CN1fNEUbVRKzjUDOURNxmQEY1buET+GwyIvw1ynL/CQYWfseq6YP6MgKhJ6efYLJWfzAmepy
	mNs8F1IUaorLtS3HyOlcY9TB6y2SGNaYzwP+X53zyvE/+Cc3NA3gvh3Yvrlu/U+McIEjsUqc5YRom
	zDZoZSrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXL9-0000000DW2r-0jxC;
	Tue, 17 Dec 2024 13:10:19 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXIz-0000000DVaV-3Lmh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 13:08:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B8891C0007;
	Tue, 17 Dec 2024 13:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734440882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mGAKh4uQmxyCz+ONct7STH4pqwnEOwd9rXKztJGQ6eM=;
	b=alPHzC+kEBAXeMxkw7OEuP9IdA3kBU3r2Rb5GW4yE1rT/TChwLzGLo4Xdwx/P41KkF/vrK
	PyQE+QpDcJhC+9m3y79M5XXEnNeC153Vs1Gy3gZPYHq1qD5EJQame3J1prALwYpweHisav
	16GwlgEyaqQolptM2PoIlpGetRg+jOvCfDkjAbQjynmxUhCtSTpdyaM8nmFvXXRm1N4LIY
	cEK54Bw91/kWgIoZyMQV7QSwFJAwpz2bzKg3SI4c7cglAv6K/o3SRQNssfJy2o1PBWuqDQ
	rNAX7oBvndjFdgs2aHbAjku/XBsypcln66sRityxEssNHoDv3sdli4CZu8pGoA==
Date: Tue, 17 Dec 2024 14:07:58 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexis =?UTF-8?B?TG90aG9yw6k=?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/5] net: pcs: xpcs: fill in PCS
 supported_interfaces
Message-ID: <20241217140758.747c329b@fedora.home>
In-Reply-To: <E1tMBRA-006vaY-Sv@rmk-PC.armlinux.org.uk>
References: <Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
	<E1tMBRA-006vaY-Sv@rmk-PC.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_050806_017957_93B44015 
X-CRM114-Status: UNSURE (   6.66  )
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

Hi Russell,

On Fri, 13 Dec 2024 19:34:56 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Fill in the new PCS supported_interfaces member with the interfaces
> that XPCS supports.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks,

Maxime

