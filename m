Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA93DC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4R9BVuKxtJ3pt05Uw6GwWu5CO4B3A4w+bneFQUo34F4=; b=GkYGrEyB4/LO1I9yFKufIWPcY3
	bJbLYLB6KvsBr5Zz9fdWCsh/kCYf/sU8o30xHTTm9CO8vrpfKvLfTuhLiPnEs+PrD3J5gMfbAcc+F
	HZdQQH+h/6CmDx6gUsV+uWoyATWA4AVz1KITMmDtFurDHEnnEqvnwJjm2HSAskFPBoHfQFNu7virG
	VY4P1K5Rx4gr44osQyR9nZ6znw2Xk/5IgGd8rp0EE3K6eAZSN0CDVDOI4sAF1zqabvlKHT+DWWAnu
	qrB0D0V/EpNwK5JlJHX13i8amT0f74wQwTSqERFQLnHpmdm9YnAuYaH91eBdaun9aHCemfl/eXDvN
	bN2LpYlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOEF-00000003LXc-2ReA;
	Mon, 27 Jul 2026 16:30:59 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOED-00000003LWz-0ELI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:30:58 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 0D1BDC0000D8;
	Mon, 27 Jul 2026 09:30:54 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 0D1BDC0000D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1785169854;
	bh=GQM+bl3BlWiZ9skGF4hc3OUOP4V1vuyexLB/bEQXXAE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=elSfygsLEMwnusILTyYEvv8HBeS/0GFzYInwiruYsKOBiS3CPUPFvF1NADt1hbMF7
	 N3MPjcMK2JWSu4DtnccJbYHIXEfX8dylWsXcMBsl6yCns9VaOuqZ1NqjGNLZR4ASYz
	 KVXinQFaoxAeRQJwJxYFYlVYFqnpk8GSQcfBL23s=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 975A4ACC;
	Mon, 27 Jul 2026 09:30:53 -0700 (PDT)
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
Subject: Re: [PATCH] ARM: dts: BCM5301X: R8000 add NVRAM with MAC address for WAN port
Date: Mon, 27 Jul 2026 09:30:53 -0700
Message-ID: <20260727163053.1087086-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725215634.9181-1-rosenp@gmail.com>
References: <20260725215634.9181-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093057_183015_DED661D7 
X-CRM114-Status: GOOD (  10.23  )
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

On Sat, 25 Jul 2026 14:56:34 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> The R8000 stores the WAN MAC address at a fixed offset in NVRAM.
> Define the NVRAM region and attach nvmem-cells to the WAN port
> so the MAC is assigned automatically by the DSA framework.
> 
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

