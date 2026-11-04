Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF1D606D80A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 13:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cqP2cZIz;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FAI45QX4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9kKsClYkSV6j9g4wIu2ceDVjMDKxVBDVIFPSvVyISHM=; b=cqP2cZIzpGGo5B
	xOdKp6HP7VbIXIer4le7qPnusH3hlf4p/A+9hvZi9VI7DD0EdtiCyL5yUU3qkrkhdk2PYJL6nHTfZ
	Ewylk2ev5B0eIuEE2dmjGRnlQI6H48qPHXN5I/SNEeVs15QnVQk8XoyoXyQODrV6p2aH62jzHkkn/
	eRrg1mjpDLDW4JkCmiYyPsSv2ZojFy9UCbQYAICnPyh+9KncL8AUzWnarzQ6fg9w2hApOG4pt8ga/
	pTlBFYAWJZBCEloXvZrwSWm47TwO1iUeHCCB1dWAPf0s3E5DIb9qd/iQtkEfzOHGeoCRIa1MXnVZx
	Dj8lhshPJnckGeOYBr3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOay8-00000005TaY-3adx;
	Wed, 04 Nov 2026 13:24:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOay7-00000005TZm-2QIo;
	Wed, 04 Nov 2026 13:23:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 373B14074C;
	Wed,  4 Nov 2026 13:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFCD91F00A02;
	Wed,  4 Nov 2026 13:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798639;
	bh=9kKsClYkSV6j9g4wIu2ceDVjMDKxVBDVIFPSvVyISHM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=FAI45QX4yCfOOm/wPruuAr++bgb8HAkJ5XDV/XFVrjxggayyF9jCmSkDXpzsT5Ikv
	 LUXwf7ItSagQ0+U3IiOObWdM/v76gs7DlCunMAsbevBQHsCBiQI2TBDlSlzaHEWest
	 avJ611T5ZbhiiZmnFsZtLS+5ZPwB9eQk30fciZXr62b7r8R7ZDTyHw/+IRxze3JpC+
	 iCGVU/kGAuc1eJSprdmMIHEBsWF83CpVojGADG8KihY8qtvQFBhHpWgdvf0FQTrMVa
	 KkKopNTo0PRfCkqP8XQLbG4mEDlnWy56iy0kn5jRGiUVxN+FB/XfxcULbr9/r8CfKZ
	 tfQ8TQZyjAfJQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 988BA260DFAE;
	Wed, 04 Nov 2026 13:23:56 +0000 (GMT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 2/2] regulator: rpi-panel-v2: Add vcc-supply support
From: Mark Brown <broonie@kernel.org>
To: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261104-rpi_reg-v4-2-3578e794ff45@oss.qualcomm.com>
References: <20261104-rpi_reg-v4-0-3578e794ff45@oss.qualcomm.com>
 <20261104-rpi_reg-v4-2-3578e794ff45@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 13:23:55 +0000
Message-Id: <179379863543.2456854.16005010652989263089.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=468; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ZthENp19pWMGxtxJS1cIyBw7fS2qfEp0vkEsABCxp44=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeG76Z1fC86Wbuw4jcxTePHj635XHbFN6nF/yczjo03
 2F4OHVhb0cpC4MYF4OsmCJLXBb3y/qS12v4Di5sg5nDygQyhIGLUwAmwvmQkWGLvBRn1JTepq6P
 ZhOOv3q6eqfEnkvnvO/cN2kyXJi7p+MuI8My2T1hpf5evWv+zr18srK2PJH365EYo1WXlkgfO+2
 sepsdAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The Raspberry Pi 7" touchscreen panel V2 MCU is powered from an external
> power rail which has to be enabled before any I2C register access is
> attempted. Use devm_regulator_get() to obtain the vcc supply and enable
> it at the start of probe.

> +	ret = regulator_enable(vcc);
> +	if (ret)
> +		return dev_err_probe(&i2c->dev, ret,
> +				     "Failed to enable vcc supply\n");

Nothing ever undoes this enable.

-- 
Mark Brown <broonie@kernel.org>

