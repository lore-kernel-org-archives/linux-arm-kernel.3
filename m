Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23239CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 15:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1H66fBtDuUyx5k+v6mnerV6vMnOskePJXGOPaUDkaY=; b=NP9hx0hYrsU4lbXnx/n0B6FcV/
	V+meVkqxzSccqugLdgHCxk9pAa7AF+ES2C+XutzTM3j2Hye1nN1dCX+Ar3mss27OYKNKorJWWTL6D
	vy23W0sKBS8n7IOfRUglu1ErlI5qRf40btTRyTDFhD4Xk838Dha6NeZdCKaIPIGXbN0zWs15r20LO
	Fo1VOVfa7Fw0g9FXvzV+xQhQQybaZQHhKxu1oRs7CLBVnZBIjv4A69AFAPr7vBZunNPqyNc7E7VFv
	E/q75LB3g8+2LcZVOC5ygJnqs0skrpYsc63Ol4DFZOJTLwbx7BU5e+rx7f1b6KYW0VQ8dO8umNOCl
	RBLrPTiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokf9-0000000EFAb-1sxw;
	Wed, 20 Aug 2025 15:23:43 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojO5-0000000DvQ8-1Bto
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 14:02:02 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1D7016AF;
	Wed, 20 Aug 2025 16:00:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755698459;
	bh=Z176GSQLSegavImp3En2033NP/ktqan4wx0wmAMGZXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=clcud02inuNkyRl4ngZzWp5wKICyIAFK6bn5DZCZxqzkyQRTM/i6Lshq9oICXC8xF
	 I01mZ5IQpT7NVy4HJuy8eeAICMdXUey/XXnXONZ+ARfSpnctHclxYeddS4OA02+3NL
	 UzN0JESW/9NEQTxUqClkUklyGcuMZns50ga3NGxo=
Date: Wed, 20 Aug 2025 17:01:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Martin Kepplinger <martink@posteo.de>
Cc: mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: nxp: imx8-isi: check return value of
 media_pad_remote_pad_first()
Message-ID: <20250820140135.GA6190@pendragon.ideasonboard.com>
References: <20250205172957.182362-1-martink@posteo.de>
 <1f4b4e707762c0926c0acece18cb9cc3ecc242bc.camel@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f4b4e707762c0926c0acece18cb9cc3ecc242bc.camel@posteo.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_070201_460007_A9268E75 
X-CRM114-Status: GOOD (  12.72  )
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

Hi Martin,

On Thu, Feb 06, 2025 at 08:49:37AM +0000, Martin Kepplinger wrote:
> Am Mittwoch, dem 05.02.2025 um 17:29 +0000 schrieb Martin Kepplinger-
> Novaković:
> > media_pad_remote_pad_first() return NULL if "no enabled link has been
> > found".
> > Check for that.
> > 
> > backstory
> > =========
> > While trying to get a (Y10 grey) sensor working on imx8mp (v6.12.12
> > now and
> > I know the hardware works on an ancient nxp-kernel),
> > I tried to enable the sensor link, set formats and stream:
> 
> btw, that's roughly the
> driver: https://github.com/VC-MIPI-modules/vc_mipi_nxp/tree/master/src
> that might need additions to with recent mainline kernels. Will the
> sensor be the reason for the link not being found here?

I've submitted
https://lore.kernel.org/linux-media/20250820140021.8026-1-laurent.pinchart@ideasonboard.com,
which should fix this issue in a more generic way.

-- 
Regards,

Laurent Pinchart

