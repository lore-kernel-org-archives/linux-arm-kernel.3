Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AF3CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 23:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nz2rzKLy9Tz4Ud9d9m7YWkCIWHoXJEq2RuMwh7vQT+c=; b=Wk3cDo0CvwwlpeFoARiSRvBMdY
	og5vzjDKJlWNtrek8r9QiXUYW9msT6axUD48meQyX2rW/CHCLrkUEuNd0o9/a/cFXCsLyWyb+p2oX
	V/TJjjKHJje+AmyoVxsx22bygrixo2ihcJZ+4k7glWNisSQtj2itoRKpoOmj4I9atZwn1QDaB6nkr
	5OAXBTKyK720qryJh4H23V/zNpOH13S/Fi44VP1zRxxnPdY4uce4x5Ot4LAs6221do+DohMRmZygZ
	cFPgt6BJLVfCYdC/Nc6Wnb1BX3BNRUQGrcIi66m5/1PFl9z6BGdYBSdd2Vz17HPzPbrgBFD7TlvHN
	e2d9gpEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPqEt-000000068Ju-0Nbi;
	Wed, 20 May 2026 23:22:11 +0000
Received: from lpdvsmtp09.broadcom.com ([192.19.166.228] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPqEq-000000068J8-2ATx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 23:22:10 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 5EF5DC000572;
	Wed, 20 May 2026 16:22:06 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 5EF5DC000572
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1779319326;
	bh=AbKXH8x5NJxJDSg9CvvS6j9aGhFhmyjJILTcn+NTtmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bjk07dc6Dsuwrb2c25e7P012ag81zLF8Y8yOOewIx9aCJKNg1pbYD9+rp8oGWdVn0
	 jVOw104dRjGU5Oxg4u/Ul2LNvlt8sp8NZ2c8Vl3tvum/YivP4nOFOxcdJBlrXSBTSg
	 kV9J+0LDn5xYGDrWqY2/kiOCPtQqQsv5wdnZNwa4=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 33DDCA83;
	Wed, 20 May 2026 16:22:06 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Rosen Penev <rosenp@gmail.com>,
	devicetree@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	"moderated list:BROADCOM IPROC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: bcm958625-meraki-mx6x: move pinctrl conkfig to pwm
Date: Wed, 20 May 2026 16:22:05 -0700
Message-ID: <20260520232205.14423-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430051612.700050-1-rosenp@gmail.com>
References: <20260430051612.700050-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_162208_604367_8142BA1F 
X-CRM114-Status: GOOD (  11.07  )
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

On Wed, 29 Apr 2026 22:16:12 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> On boot there is this warning:
> 
> /axi@18000000/pinctrl@3f1c0: Fixed dependency cycle(s) with /axi@18000000/pinctrl@3f1c0/pwm_leds
> 
> Fix by moving the pinctrl configuration to pwm, which is the actual
> consumer.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

