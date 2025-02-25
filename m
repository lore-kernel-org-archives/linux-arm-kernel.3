Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E32C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 19:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eiYgeOoDUuaVT081vXPN4zQ1xYsoMKvRhbBNAAAKeww=; b=IJHmVsZJlwswWrpKwqWpCHwD/e
	ELH0xhMK+LIpAGmzuKPePfNWz1KGfBwF4Y74fCaHhERRnmMymYzMYYSc6yjCuZnxemi6+sK03v4zw
	KP2Hi7hu0YLmyl9e57jFYDUK0mXqguYn6drzBz2WBgDAalWgGY8sCxpZNIzFjz0wByQA917Ii0fBC
	8zzB+CQRqmDJbwhmU9JxZfUnXBo+6KMHkaJshzXYXX9bFkQhzUDZ5nGJG3QSuMrxk4ByLyNUaqZJd
	6m2N3RV9G1cQHwHKD2XS++xrAKoExn6kJ9RippOYK3z+do/5WFEcwTyxKXcKUskW2fDD9RTK9fPcY
	7/rd4Oeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0ei-000000019SY-41Uc;
	Tue, 25 Feb 2025 19:31:48 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.209])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0NY-0000000164P-0uLR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 19:14:05 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 6295AC000C81;
	Tue, 25 Feb 2025 11:14:01 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 6295AC000C81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1740510841;
	bh=RADfpvUUB5xFjExltzb59CSi/mP9Xc1qO4lVRwRt8dI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=krA8TjA69/CRBGoui6S/gmek/sjssohgRONExdUPhJj/kfwSQV7FiPQtX79PZzCPo
	 jOVjq1x4AIZOySyVl0dJ+tO2AIW8+2BExcaSKh/N9YC86WqWkXDzgZ6Q7hMu40yN25
	 pIEE7iEE58I6gRCZdsTGp3v4uxxhznvxPKBi8jMY=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 0A2B218041CCB8;
	Tue, 25 Feb 2025 11:14:01 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	florian.fainelli@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] bus: brcmstb_gisb: use dev_groups to register attribute groups
Date: Tue, 25 Feb 2025 11:14:00 -0800
Message-ID: <20250225191400.1059513-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250224193730.2698894-1-ovidiu.panait.oss@gmail.com>
References: <20250224193730.2698894-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_111404_357232_CA0A0307 
X-CRM114-Status: UNSURE (   9.29  )
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

On Mon, 24 Feb 2025 21:37:30 +0200, Ovidiu Panait <ovidiu.panait.oss@gmail.com> wrote:
> Instead of manually adding attribute groups, set dev_groups pointer to
> have the driver core do it.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian

