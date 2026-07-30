Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8640C55167
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 23:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xr3eg2SzOOaMScetfBcKjBPYcfciAnYT3vlYYiCWO/A=; b=NfHYvZ3yE4pqiBXCpYqcLq3zZN
	KTzbzUR6jUwrGDBHf8AVpJBk2E/j9RmHlBK8Z4oZ/ZXjUJHfknfXgJ6wcV0E3rc+lBB8g1wXxVYAx
	Ka7QALzCzNLHwJ+g0a57jwBL1TQ1l6Dz+iCcAuthk9bl0TRBMpaVOIGgsViJjngoSkIjD+Endrka2
	pla76tJ6uVpIY2zvVuVIQDlG4wYfZWv9w3JXLVdq3J2e7hU2kwjWPXvxV/xbDe/59EIihtaMXDYM9
	BkIBuK3ZiPhGJ10zXU+1qzLsRe4zEZLKzSLy2Ty92/8QQrJ3ju/sSV/UdfeUy6dfCGuGgbnYt5aDc
	etEVm/qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpa8W-0000000BUgr-1gk6;
	Thu, 30 Jul 2026 23:26:00 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpa8P-0000000BUfK-3eQf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 23:25:55 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 915E9C0000DB;
	Thu, 30 Jul 2026 16:25:52 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 915E9C0000DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1785453952;
	bh=nia8VyEJ648pKqEegOAQM+wyrOIIRDihZ07lbhi9ZoE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d1A/v0swLLqbFNZ914HLWo7CWSoXrkH4P+uDxpn7IIrhrh7MWZOEYqitioaOuE1Tr
	 gOUg9m4oOm6D+s42bRO4LE+TAtHc2Upw6W2S+azzWdKcT3Pb25HSXfzn1egbgah8Of
	 eb+l3OIl1nvYphYpwJk1T4uFcFjsYMI1QvSWY6w0=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 679C3AD9;
	Thu, 30 Jul 2026 16:25:52 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Rosen Penev <rosenp@gmail.com>,
	devicetree@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: BCM5301X: DIR-890L: set WAN MAC from nvram
Date: Thu, 30 Jul 2026 16:25:52 -0700
Message-ID: <20260730232552.2706739-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727202737.21862-1-rosenp@gmail.com>
References: <20260727202737.21862-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_162554_270184_419D8DF7 
X-CRM114-Status: UNSURE (   8.99  )
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

On Mon, 27 Jul 2026 13:27:37 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> The WAN MAC is offset by 1 from et0macaddr, same as DIR-885L.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

