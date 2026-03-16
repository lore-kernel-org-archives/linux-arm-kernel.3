Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F87F53D9A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 20:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wnRbS1JcKQtcOd66NIL9yWC8Tj2IflkqzVvTbTbm5g4=; b=ouKZgVlBLwHZY85Zh2jCIuYijD
	W+FzkGNsqFMjaLSGf3P7Uf6Pp8w2C0si3A0mvlXsshAB2Nvvz7Lsoq/RtVwThAQ/Wuxpf6x5detLT
	TxT3CzPqulcmp4UR0B9j/AHU2S8O46so5h2v7S1RbZb+0LDak9fWMFnCHnjC+xXlrqmX3ul+WhOr/
	TYidgxaHQwDzNRYHmy5ho5Un/kMkqfWoJv0yzhXoHHthowIN/uesqyIVyHvHojkS/JXMjuJQ7m2Qv
	MAK4EJM8+kBDWTkO87DxIu8KYPQAIXQEA/VfangoO4urjXR6sfbU/kM6Qp5/7jcWTb6d6bAqrXDEk
	b4wf8kgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Ena-00000004pdY-23qk;
	Mon, 16 Mar 2026 20:44:26 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2EnY-00000004pcf-1Mgb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 20:44:25 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 092DAC0000EE;
	Mon, 16 Mar 2026 13:44:23 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 092DAC0000EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1773693863;
	bh=AN/a68FJUOhhWtuoOCLLNUHZs8iKlQKgxU6RuFzud0s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=skgCI4BiSDlfWFjjlzYhO5NojsJ7t3OGC2YlgfJibC7LTAH/CGoKt9kKpVypJFRqe
	 THTVY1Lv8p6ThigEuf2gk08pRDtVqYtUd+I17OwVsEJGnZQ1/W4+I0tC4FYebtYFxW
	 NrdPUSgtdy4yse8C4ZJwP/jzzTJ/a016h5Lqd34g=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id D38C2A83;
	Mon, 16 Mar 2026 13:44:22 -0700 (PDT)
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
Subject: Re: [PATCHv2 4/4] ARM: dts: BCM5301X: AC5300: set WAN MAC from nvram
Date: Mon, 16 Mar 2026 13:44:22 -0700
Message-ID: <20260316204422.2145317-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225230827.21715-5-rosenp@gmail.com>
References: <20260225230827.21715-1-rosenp@gmail.com> <20260225230827.21715-5-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_134424_384887_EBED3CDA 
X-CRM114-Status: UNSURE (   7.87  )
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

On Wed, 25 Feb 2026 15:08:27 -0800, Rosen Penev <rosenp@gmail.com> wrote:
> The WAN MAC is offset by 1. Set in dts to avoid having to handle this in
> userspace.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

