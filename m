Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D0DCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ttG4R5muWt9PMLn9ALWfz3tcahkM7eevD8vc9g/MkRI=; b=cT4QeZ4aloMXFpa7In1Qfhsnae
	CrB2F+uJtYP7t20c5Na320gOpuv/suYDwWiouH7JixZCgzwYNHVfR47HWzEIysbJC2a85ZwJNx4OZ
	Gk8sSKD6j3j9wJPSTFYjXI4v+KWvYxfify76W/j6bqNgc2aSVCfmZgF9MAu0KbP3OVXx/nF8rLLQ3
	B200glk/yGannKWLf0Q2GnD7xFcVjFLTjIpLIAnCPNcjOEnd5BPMUXF6qOHtDDLEjfXiUJ8OdYE4W
	7NzFOJqvVBMhXge/azp+ZLoIyC/GTD5u0NpQvcWeakasgXPWTx9vyqMSWWAAsRPBaUYRvJS7eK3MX
	vb2vEGSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM3K-0000000G24l-3Ke8;
	Fri, 05 Sep 2025 02:19:50 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuH7n-0000000ES84-1TZp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 21:04:08 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 001D2C0019F9;
	Thu,  4 Sep 2025 14:04:04 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 001D2C0019F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1757019845;
	bh=yR0GeRsnT6KXyUB9lde0kiI5FPpCvrnFXwk4iYvFZCA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=suz2rJicE8GPfR5rLKj7IMQQh+v1zt/kCzmhE32d/n4Zmu+FjsOvKwZpOK98sEiWi
	 7FMTcczSy7qsti/LUd/bmD0zOI04OBhLwppOIA212EmpoBrrFKFipo9d7BydojaTVM
	 s/0jT0evpI9C8pU6UlSuPOEIpD3mCp3FSDjBpztg=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 6F2E918000530;
	Thu,  4 Sep 2025 14:04:04 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Andrea della Porta <andrea.porta@suse.com>,
	linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Al Cooper <alcooperx@gmail.com>,
	linux-mmc@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: broadcom: bcm2712: Add pin controller nodes
Date: Thu,  4 Sep 2025 14:04:03 -0700
Message-ID: <20250904210403.222143-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <5ceba8558e0007a9685f19b51d681d0ce79e7634.1756386531.git.andrea.porta@suse.com>
References: <cover.1756386531.git.andrea.porta@suse.com> <5ceba8558e0007a9685f19b51d681d0ce79e7634.1756386531.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_140407_485793_8509A203 
X-CRM114-Status: UNSURE (   8.46  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Thu, 28 Aug 2025 15:17:11 +0200, Andrea della Porta <andrea.porta@suse.com> wrote:
> From: "Ivan T. Ivanov" <iivanov@suse.de>
> 
> Add pin-control devicetree nodes and used them to
> explicitly define uSD card interface pin configuration.
> 
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

