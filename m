Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89995F53D98
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 20:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6OBM9JT7J/mLreUZ0nZQbeDcyb4MJa0fprF3sqhNfM=; b=YLxl/m9Xi+tWoNRMAiuoOZ7D/x
	Ppqxc74FDy9w7Pde7MA6Lu71uIepw+R12hFIz0+c8Zw920AqHMTvA3GcrNk83Ay7G3WhLMiANHg6c
	OvygHPZKvOe+6DTq86Wcye4+bAcOXDOHxwRoSVuNgn8UU4XUzyMDuUycMAUaJu1e7esaY+eELWOOR
	1hE5FQW4CUuyyUtpDUgs6FMC3GA3ov46wB53In1T5NYiDXyVPfzk0pC1hS5wh/70+szpgdcwaPIPd
	0KHGdt8/Z4HFLKR6o3lqxX3fW4jQTeYXOHanxkymelv01pdERHKNx8Vyw/4YBJRHINEwB7YDbdCE2
	Sl0yNV8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2EnJ-00000004pXQ-3iG0;
	Mon, 16 Mar 2026 20:44:09 +0000
Received: from lpdvsmtp09.broadcom.com ([192.19.166.228] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2EnH-00000004pWe-0qXY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 20:44:08 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 87437C0000EE;
	Mon, 16 Mar 2026 13:44:06 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 87437C0000EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1773693846;
	bh=Z01aGLYe/AR9KimCTu5Lg7rP4ynEL3TZM14SOlIpx7Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W/7OE3aWo8mF5rSkyLWI2WfhvuBKbiKxr1684rJsiBlE833tQp0q7E2/fG6Gt1tQV
	 I27JR5lYGMBhvJ1E0XIoOIksIe/LdrRd6yLU1MCySzHmhzGWgSSGHlX/5Gr65Z44gh
	 IVVXZUSqjHEclCWFERLeTaCbxkq4dqa9eII4bxDc=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 5D10FA83;
	Mon, 16 Mar 2026 13:44:06 -0700 (PDT)
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
Subject: Re: [PATCHv2 2/4] ARM: dts: BCM5301X: panamera: set WAN MAC from nvram
Date: Mon, 16 Mar 2026 13:44:06 -0700
Message-ID: <20260316204406.2145139-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225230827.21715-3-rosenp@gmail.com>
References: <20260225230827.21715-1-rosenp@gmail.com> <20260225230827.21715-3-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_134407_257749_F84B0C40 
X-CRM114-Status: UNSURE (   8.07  )
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

On Wed, 25 Feb 2026 15:08:25 -0800, Rosen Penev <rosenp@gmail.com> wrote:
> The MAC address from the stock firmare is offset by 1. Define it
> properly to avoid having to override it in userspace.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

