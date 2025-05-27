Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A66C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 22:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VuUfIA0TssYJnmm6edG30uTPih7t8tzBuHMackscMVE=; b=I7PNrAs7tYNnind+doRaHkpHF8
	bQfT0JLo5Rnzhbs/xrwA1vA4EfUnMpxXjzGSzqI+Lt3O3vANvNnrTvo7xk3ZjfL4c82mgvMFIDcYE
	zkcaa/jLZJ0CTOh9Nrw2OtSOtybq1TRHNnWDqs+aM/EOznnpxAxaf6RjRm77J36300+RXQR2WxYsa
	cwyBNxN/9SN03MSJNXKQg1C/QLa5Y1oKxLWW7ym12nX0QtAS435WptMgSLPRBHncXg1vecjYTqJKK
	vT6aV8nwQ7AFDSUG61qvzLFQhiv1acE+V3t2cPis6WnbI9OoYovcTn1flgIbtX6b2mA4eAmHRfYCb
	QJZAd+lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK30A-0000000BjfX-25VV;
	Tue, 27 May 2025 22:42:30 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK2y0-0000000BjZd-3H9A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 22:40:18 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id A2E46C00282F;
	Tue, 27 May 2025 15:40:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com A2E46C00282F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1748385613;
	bh=NSo57GFDK3pRjZbqeVf45lXVa0GyJ02lg0snu8/nMzo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jorezx+vksGQPRa+DdurWwy2CZjWiPqn2YFUQ/NEJ2B3F+YmO/8/Wg0i/1vnz2LZz
	 ZsPwx2mK04Ck6Q/uuUA3n48UsDX9Qxw78Xp3PB9Ad5rvG/KOdCj8w8zXYvMTt9SkmE
	 2JwGYNLjJEXDQnAsKP0UBxLUPP4xY+OjLnLqbUhE=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 36CCA18000530;
	Tue, 27 May 2025 15:40:13 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Uwe =?iso-8859-1?q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: bcm958625-meraki-mx6x: Use #pwm-cells = <3>
Date: Tue, 27 May 2025 15:40:12 -0700
Message-ID: <20250527224012.232638-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250527181320.373572-2-u.kleine-koenig@baylibre.com>
References: <20250527181320.373572-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_154016_915871_2BB4AE8A 
X-CRM114-Status: GOOD (  11.91  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Tue, 27 May 2025 20:13:18 +0200, Uwe Kleine-König <u.kleine-koenig@baylibre.com> wrote:
> bcm-nsp.dtsi has #pwm-cells = <3> as is specified in the binding. So to
> also use that correct value for bcm958625-meraki-mx6x the property
> overriding that value just has to be dropped. This fixes a few warnings
> like:
> 
> 	arch/arm/boot/dts/broadcom/bcm958625-meraki-mx65.dtb: pwm@31000: #pwm-cells: 3 was expected
> 		from schema $id: http://devicetree.org/schemas/pwm/brcm,iproc-pwm.yaml#
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

