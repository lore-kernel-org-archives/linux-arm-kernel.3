Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35DCCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 10:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCywyWtPG7xhPz4mDJsFONHwjktY6zCv82HEx1Rjk2s=; b=jwpL/AbcmgzQ0EPDM6hvRRsPTS
	RBSKH9fzggjjPwo3aE/6+7P/6m0uTRE/xvAO8MOhHXDEusKN1jKEOVZpn4Hcm9XXvzeuIaaBEKksB
	L4iniAiDzrMkgYBNLoe2S+4yeX8CzWk0DkizdJTY8fJJtbAd/FoyKpBhe4ECTuTWhOhLuXk4v/rxa
	aJFGPInlCdp80wNmepOXIQ9UYsx9aLHE/WsGMClDTKWOdA3pnDNZcf9fE44zuNPtKqGnpxCQy6bxW
	HR6ojrEqUt/e6gxMpszGJOaOHnqrOj4ha7tBvtnqzutWxaF0lBEqPUSnIXpwooRJBTra80sDUulCO
	UxcHDM2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEQ4u-000000040a2-0ezu;
	Thu, 30 Oct 2025 10:40:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEQ4q-000000040Z9-3MQJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 10:40:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RCywyWtPG7xhPz4mDJsFONHwjktY6zCv82HEx1Rjk2s=; b=DipggkwhifOTGFbt6Tw5h2OBCG
	ShvA3eH+PJz5SAosWXlC6MzBX0ny72o8hYDYFpCd5ZK9t17vVAL7cnGRxOkUqXQj27Sp9XpKs3uvC
	O3SEkV74W7Luyvz+J6dpAqBP4jxEu1R5EjfqvFHoejfVCpjfRI2hlEMc0QFR7Bf8nFdQke89adTkV
	nu5PTgG+SEC2sNHaPYTG4pjLAhZCujDjhj3rGYHxFH3kG4/9go3ViQTBk5j7F2PcqHJsmjq2aFvI/
	5yFSXd+d92/XAiED1/xTe2pTex1tL8h+M0oGuwIGJYAt7YVzmXUJStuz35ynhA7hNd5+2rO0ZQiEc
	8APENvFA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34098)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vEQ4g-000000005ZB-0ady;
	Thu, 30 Oct 2025 10:40:10 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vEQ4e-000000008Oe-2a4n;
	Thu, 30 Oct 2025 10:40:08 +0000
Date: Thu, 30 Oct 2025 10:40:08 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Krebs, Olaf" <Olaf.Krebs@emh-metering.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Fix IMX PWM period setting
Message-ID: <aQNAiDVKahkIrLYA@shell.armlinux.org.uk>
References: <20251030084727.4098222-1-user@jenkins>
 <c26fde7dff3a41ff9f7e6c97e2a31801@emh-metering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c26fde7dff3a41ff9f7e6c97e2a31801@emh-metering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_034020_864830_868CEE08 
X-CRM114-Status: UNSURE (   9.21  )
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

On Thu, Oct 30, 2025 at 08:51:20AM +0000, Krebs, Olaf wrote:
> From: Olaf krebs <olaf.krebs@emh-metering.com>
> 
> We use 3 PWM channels to control an RGB LED. Without this patch we get an error:

Not build-tested.

> -		if (tpm->user_count > 1)
> +		if ((tpm->user_count > 1) && (tmp->real_period != 0))

"tmp" vs "tpm". As there's no variable called "tmp" in this function...

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

