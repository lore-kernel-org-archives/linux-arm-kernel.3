Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74933C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 18:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qSuW21gIGWIPq7SyA83uYzZf0v0C9hCIbhv1CZuA/g=; b=ez6LhTLFM683a1A6JwGmwA+sAO
	pQpTFwPz//JCZ14pSdjuconGwYVX7hYQEE56LH6PU4ctsRq23YzvY88huoE7FXO2dRbDwZ/YOUFqC
	XssqXo2RthrAJ9J439Bo0ii7rDaLF5OIMDbeUvA2RM3Oal/+iQDe7dFEWFUKVMEq6Q3ID7sP5RttR
	1nVVYVJPXN2ZSFqGk3gX+ha+zN7CYDIPB+FLVygkUkqzjctUH+wNXLSouacSztlCKfvoZZxL7rSjW
	BxZAi/dTnLHFiM8ySNjQSJENHckylFgseye+z2Xkzwcq3KWnNK7DmquavFLNP+fzH8o73iXuv8/WG
	ENyU4WXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFsN-0000000BrAL-0yed;
	Thu, 06 Mar 2025 18:23:19 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFql-0000000BqyP-0GpQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 18:21:40 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 3031FC0000FD;
	Thu,  6 Mar 2025 10:21:37 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 3031FC0000FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1741285297;
	bh=CjtmHp/S04LVkwvsmmKCaOu6MxK3AnwxF7vP539EiUQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=of7gjB3mi7D+8kURI9bTCHfo5sT6Ed2PzBwJ8dsszg71eK4lq4295hMNkO2ISZwW7
	 ibbi7tf5YY3xOYaOkrGRPEajRcNKErxxWbs47sWARBJNYY+1OMX71sgtUsxEQztVnV
	 BFDsV+egy+B6evnuAXUOM3AMp8UMfVyWg2YZyP+0=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id E78271800051E;
	Thu,  6 Mar 2025 10:21:36 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Artur Weber <aweber.kernel@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 5/6] ARM: dts: bcm2166x-common: Add pinctrl node
Date: Thu,  6 Mar 2025 10:21:36 -0800
Message-ID: <20250306182136.1762272-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303-bcm21664-pinctrl-v3-5-5f8b80e4ab51@gmail.com>
References: <20250303-bcm21664-pinctrl-v3-0-5f8b80e4ab51@gmail.com> <20250303-bcm21664-pinctrl-v3-5-5f8b80e4ab51@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_102139_264994_3D1AC805 
X-CRM114-Status: GOOD (  10.42  )
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

On Mon, 03 Mar 2025 21:54:50 +0100, Artur Weber <aweber.kernel@gmail.com> wrote:
> Now that the pinctrl driver supports the BCM21664, add a node for
> pinctrl in the DTS to allow for controlling pinmux pins.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

