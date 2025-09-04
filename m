Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3112CCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQCNdxWEz7L0Mg3GFhGJKRf/XCYM/60exxW5O65l2ho=; b=SVi9F2gkKXaOvGI72g8eN+o7ia
	ma5UL40KpJRgcXs+wZX7matxyp0mfKmJ8F+FqcZcw6wGL78qRJ9tDWOqRGvOChF2f43f4XHpGMg9Y
	BO7oUUJj98sG8BD4nTGSfH+n/J2MLDOtXXTPHb7+X+WvO18DNxt9f1yzWlfT1eE9N1kVlAFwtB9Ru
	UslIbhZlvQ2POLsKqq/xWVBnf58F1RCaOSy4VPGZgHZ9rtQpZR5HVwnflo7CWVwPteUYAxXo8h6Kn
	Jf/VhivHDJfD4TkHVaBB+kIBRlGmpKAoMBYGmbK42BRqR/P2jpNNy5Ye80IhSQTgtglxvyxaWxcfQ
	u9V2uQ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM3O-0000000G2Aw-1xSL;
	Fri, 05 Sep 2025 02:19:54 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuH8A-0000000ESCd-2PKh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 21:04:32 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id A6610C0000CF;
	Thu,  4 Sep 2025 14:04:29 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com A6610C0000CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1757019869;
	bh=7xkUd025jTL9gYCVFu2mBdejGnMcAoFUVLLm9oOToN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tVEbtBALDvkfa20257rVtZQic3fZncsQ7zCjG/wHyZM0ocOuVJ6PItBq83ZMEhTf8
	 IyCU/fKUDBFHZatelGg9OUJmokvsHktnhLmEnpxO+Vt2MtTpFOoUQV0umEy3W+Sg2P
	 XfF+/kg2zP5qMw759SruL+yBn1zLQ8xaaMQzqvgA=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 5C54D18000530;
	Thu,  4 Sep 2025 14:04:29 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Andrea della Porta <andrea.porta@suse.com>,
	linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Al Cooper <alcooperx@gmail.com>,
	linux-mmc@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: broadcom: bcm2712: Add one more GPIO node
Date: Thu,  4 Sep 2025 14:04:29 -0700
Message-ID: <20250904210429.222271-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6d311b2f629bbc0e1dd9821e4aa8e5af9f8e5362.1756386531.git.andrea.porta@suse.com>
References: <cover.1756386531.git.andrea.porta@suse.com> <6d311b2f629bbc0e1dd9821e4aa8e5af9f8e5362.1756386531.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_140430_637418_34E5A929 
X-CRM114-Status: UNSURE (   9.32  )
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

On Thu, 28 Aug 2025 15:17:12 +0200, Andrea della Porta <andrea.porta@suse.com> wrote:
> From: "Ivan T. Ivanov" <iivanov@suse.de>
> 
> Add GPIO and related interrupt controller nodes and wire one
> of the lines to power button.
> 
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

