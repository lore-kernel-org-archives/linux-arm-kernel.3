Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7687DE99053
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 08:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FlkvDopMbw59+z0XdHrMqtDa5KxFChBVJQJSz0U20X0=; b=KpKQ03rGEd3q7DVeUFUbqFYkMC
	ONBQQoEigRSvKIfbKOCHE/rirou0SdDv69xRpePUhUyreFrzgNBqlLrgrSdFiwbTNsZd1Trh5LYQ9
	o6yPiLisZhFp9cemc8bbf8xTVzR4g8tptjTfZCCJIlQ58KFVS2I4yM5v5lEeBbT6gTPR0bJ6BG+T4
	qvRKgKtzceZA+zc+vlKvz5/iuGdxQBDhC3OswhL5pN9Xi05hfmW2B2Hlytpex5iqJLdXQfQaqAFxJ
	Im/dwnpgc1gVfNZetVav8NnP0Ycgl5JQbWtCHJtdVWjXMO0Cz0khjhLSri4Z0Tpw326fohdNS/4Xi
	EhiY1Csw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB72D-0000000BpRD-2YaU;
	Fri, 10 Apr 2026 08:16:13 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB72A-0000000BpQ9-3aVm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 08:16:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775808971; x=1807344971;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FlkvDopMbw59+z0XdHrMqtDa5KxFChBVJQJSz0U20X0=;
  b=iy1Mfw/9W/spgURQjZP9GawPmcpBRAOvQT5FQBqDv2dav2QoTCF7FgtW
   rijUKIY4mm4Xj85qef32QiYD0A+GFc+a8rjIjqOkrmPgbZESjV/w/qF2w
   DQtgqVEOHL4Y1Kb9e2UAjQOh7kQHrAHZaVWTW2dzfb7czWPXB5/wEKBx7
   l/Konie33ccOmSI21baQVTOqWRMXStSdhR29qSEpLoSf+nZMHgFnNAv8Q
   XWKm6Mnj9/K9LT5faEsC/KCYvQJxPKcyLH25W3+1I0MReeiAyz2XTVFs/
   IfLMd7n18dXk9FbcHQLSnDlx/JdYHTlr+4edjeb0M5hShfC6oTI1AmBjP
   g==;
X-CSE-ConnectionGUID: THIlZzSaT+2Yf2ZFIrDBmA==
X-CSE-MsgGUID: F91C134HTkuhZk/z93zcFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76715077"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76715077"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 01:16:10 -0700
X-CSE-ConnectionGUID: GIvxrKJuT6K0PufgwPoptQ==
X-CSE-MsgGUID: lxTmbZwsRLa7jymHZyxuzQ==
X-ExtLoop1: 1
Received: from unknown (HELO localhost.png.intel.com) ([10.107.255.31])
  by fmviesa003.fm.intel.com with ESMTP; 10 Apr 2026 01:16:06 -0700
From: KhaiWenTan <khai.wen.tan@linux.intel.com>
To: linux@armlinux.org.uk
Cc: alexandre.torgue@foss.st.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	hong.aun.looi@intel.com,
	khai.wen.tan@intel.com,
	khai.wen.tan@linux.intel.com,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	maxime.chevallier@bootlin.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	ovidiu.panait.rb@renesas.com,
	pabeni@redhat.com,
	vladimir.oltean@nxp.com,
	yoong.siang.song@intel.com
Subject: Re: [PATCH net 1/1] net: stmmac: Update default_an_inband before passing value to phylink_config
Date: Fri, 10 Apr 2026 15:53:41 +0800
Message-ID: <20260410075341.5806-1-khai.wen.tan@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <adirrTJujEsrsK4F@shell.armlinux.org.uk>
References: <adirrTJujEsrsK4F@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_011610_929607_C9CEF4A7 
X-CRM114-Status: UNSURE (   4.31  )
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

Hi Russell,

Thanks for the review. I will address the comments in v2.

