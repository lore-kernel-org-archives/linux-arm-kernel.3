Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99711C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 19:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djTPBFNWY+H/rDAlC59m1x0mrK1UC4SflmKyAILLb54=; b=tFB/DbRRAtVhfMnfrpG9Itb2Yn
	q7yT+jJVeyilb7iyjKW9gTYwhhdFSPCT+Zr+QgyW0wyh5X3NJoTzIO8lNYx2CSIjheGb3/7ZuavOn
	4+CiHTUUD0oHYsFQnOi5sF4vqDDwwR7T2BHaHTu01UvDiKfskWoFkA5r6t8vQm68gZZUalLhxEwa+
	TzXV6GOnIPVpv3nvaXHnlVu/KYLQvyipujCVie82OCa2VMeZx3SRtHnt6k5+cVbK0zTwafP2BCR4A
	Av/YAfzRMhVij1Jp9xQKgD3cWtBPBnK83rw8ng8Q9E/Q9wNqe3HtCVWUMw3Z3do1iKKAAL4yvE1nV
	hVAIWxhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2DQs-00000000VmM-12PA;
	Thu, 03 Sep 2026 19:49:10 +0000
Received: from lpdvsmtp09.broadcom.com ([192.19.166.228] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2DQp-00000000Vlu-3zbh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 19:49:09 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 86EA4C0000FE;
	Thu,  3 Sep 2026 12:49:07 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 86EA4C0000FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1788464947;
	bh=sqA3IzvdmDfTtkFBOGCjZOJL3AnE5LtSgLEw2h4nxAY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ekSUl5HnVPXej+QtOuAXMlG1c6nygvSMx4gYXdLP2rDhn9DFVrC9ARwIy0NHTPkv1
	 inHniCoQMqb3xKrrogHATIy1R/6vlyjuQe4+5J/t9XhFWtyEG619rcNgGCKXR+lLn0
	 sxrm8tcQB9S75LEYwFxujmiNhxoLc8zC82ARte6g=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 65755A9A;
	Thu,  3 Sep 2026 12:49:07 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Rosen Penev <rosenp@gmail.com>,
	devicetree@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:BROADCOM BCM53573 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: BCM53573: add phy-mode and fixed-link
Date: Thu,  3 Sep 2026 12:49:06 -0700
Message-ID: <20260903194906.2039326-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805190740.8152-1-rosenp@gmail.com>
References: <20260805190740.8152-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_124908_014272_83536626 
X-CRM114-Status: GOOD (  10.47  )
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

On Wed,  5 Aug 2026 12:07:40 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> These are needed for CPU ethernet links for switches.
> 
> Fixes dtbs_check warnings:
> 
> switch@1e (brcm,bcm53125): ports:port@5: 'phy-mode' is a required property
> switch@1e (brcm,bcm53125): ports:port@8: 'phy-mode' is a required property
> switch@1e (brcm,bcm53125): ports:port@8: 'oneOf' conditional failed, one must be fixed:
> 
> 'fixed-link' is a required property
> 'phy-handle' is a required property
> 'managed' is a required property
> from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

