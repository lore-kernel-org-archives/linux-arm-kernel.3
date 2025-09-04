Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0CACA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 03:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uop8xGNgOJZGYlc4EjQPD/RKV6DJFuZeUeAynxnhLbI=; b=GYWSGfaW43G78vHbTW6rsoCkVp
	4zHHYu1PdPZtzBedSl6GCOVKJcYAoIS4dX7TIPnw4bq5rmO6uPR+DmA7F0ULTWJcJgjYjEVnDUSgQ
	HHwIWvY5dvMg3zfrasXZrEDq3+JVbZpYdBY9EEXQB19Jxc7VIbbYy/XLFOTuIeJ0siaA6PwEEQqTd
	YStP0tfmGeI6fmhM1fk15cM6TDShWEZT+BnCqiYUiSCIRrN10iG6btMfZVLaWBCfySWtfVIQ2+eg+
	0Cbu4Tfw4uhLiq8RxZfXppuQQnntOOuXii3NpphwLiSxJLvlF5KZdF0dksYoPfJrXweWn43SKKjpL
	o+/QlvdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuN5U-0000000GR4f-1UHz;
	Fri, 05 Sep 2025 03:26:08 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuH93-0000000ESTA-3OvD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 21:05:27 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 4C058C000567;
	Thu,  4 Sep 2025 14:05:24 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 4C058C000567
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1757019924;
	bh=q4bHoqpCr2Q3jUWmMCTsjSg2SwzWOoNsjilN0aT5mKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZaTD7D/1lokj3KqwhXZ0/ygdK7SlY+AL2PPPj/5tYFew2nd3DP9FwubB+TN6tWa60
	 DDnhKs4L2vCAJVX1lFOEWjxgBLv4gGZxftCgZQipOU7d85V1e6RDQKdkvx7xBLvb5M
	 MopDS5avy5P/768n+HkT8vTbJeJ3mK1TYkXZM2Q0=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 04D4E180004FC;
	Thu,  4 Sep 2025 14:05:24 -0700 (PDT)
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
Subject: Re: [PATCH v2 5/5] arm64: dts: broadcom: bcm2712: Add UARTA controller node
Date: Thu,  4 Sep 2025 14:05:23 -0700
Message-ID: <20250904210523.222558-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <35c0da6a741019efefc3c8e405e210a3a8156830.1756386531.git.andrea.porta@suse.com>
References: <cover.1756386531.git.andrea.porta@suse.com> <35c0da6a741019efefc3c8e405e210a3a8156830.1756386531.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_140525_873705_3BBFC8A1 
X-CRM114-Status: GOOD (  10.82  )
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

On Thu, 28 Aug 2025 15:17:14 +0200, Andrea della Porta <andrea.porta@suse.com> wrote:
> From: "Ivan T. Ivanov" <iivanov@suse.de>
> 
> On RPi5 device Bluetooth chips is connected to UARTA
> port. Add Bluetooth chips and related pin definitions.
> 
> With this and firmware already provided by distributions,
> at least on openSUSE Tumbleweed, this is sufficient to make
> Bluetooth operational on RPi5 \o/.
> 
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

