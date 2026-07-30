Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59490C55167
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 23:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A46kRGYTcgfE0K4YMHJk3bmzKoITjN9aeXwVU8ig/FY=; b=WJbeLl7ZddClSbo1cipOEhnDm1
	JI2HAECx9P1bXyhaLOwyfRtb1K0E5dgkBoTrcPuWseTC/Layf4OsOpIR5mYnkg/0JZ6pj0gttXOwS
	KGpCQXHxyR834itza/csSYOZRhHauU53tPZF5QupZu2XbRaiCdsE6coYS77kjrOhLoY93km2EBocT
	SeV2pd3JMWptdScH6yjmTtgdKrO0bjkYKqYNJ/2syg1P3P9hG9JZmGoZ8gomZInhWja9NX9BrC4JI
	wnCkPWH6wiejJjvsAW349fo/7sr2w2d0XtkjjtNfcpPHUbZaD7sBk6bnHsqV+SrCAwporiXREJR59
	Ev5PYjhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpaBn-0000000BVEm-0sVR;
	Thu, 30 Jul 2026 23:29:23 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpaBe-0000000BVDS-1DOv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 23:29:15 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id CFAD8C0000F8;
	Thu, 30 Jul 2026 16:29:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com CFAD8C0000F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1785454153;
	bh=ttxI4Ur9rC7uwFPeGVxcwjsocSNemkrADE7CZQ52zgk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T6WmT7WnSa7YMW9P3Dyoa6T6gYwVV56Bd7dt9z0JlAdV7uBmUmtnYvaVKBkO2SSoh
	 IRaNUV2XrZuyS7i+MSyH+phAStQs6MEdeOA4XhGDBMJeLpsMRaJDEN9kvQqTakCGrN
	 a9JZ0SiVt85xO5p1Ebgl1EDivoVGXfcukluOS3To=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id A278AAD9;
	Thu, 30 Jul 2026 16:29:13 -0700 (PDT)
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
Subject: Re: [PATCHv2] ARM: dts: BCM5301X: panamera: add phy-mode to switch
Date: Thu, 30 Jul 2026 16:29:13 -0700
Message-ID: <20260730232913.2707467-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729225402.775442-1-rosenp@gmail.com>
References: <20260729225402.775442-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_162914_374623_20547794 
X-CRM114-Status: UNSURE (   9.35  )
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

On Wed, 29 Jul 2026 15:54:02 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> phy-mode is needed for CPU ports based on the documentation.
> 
> Fixes dtbs_checks warning:
> 
> switch@0 (brcm,bcm53125): ports:port@8: 'phy-mode' is a required property
> from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

