Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FA2D29FBC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 02:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WDGnKAyMbvjak0laesuk30Fq8P+k3o9jOmQzmXmNl2A=; b=FINtc22gLJQ1SazwkJWMP39uRf
	zjMhWVlezT4B9IfZficc0p6pPqn/vWl7M2smpGjW/4D4AySUqqAC3gzpY+yS/q/wcuErQPOVG5b3R
	y15zKWU5dzv3HGGbcNrPSejkbN3IWwmczjHcV/VQhObJ6kfoo4Itfvb8jEXcteET/lkhFPtt+ExdL
	9N5TUGhUFGpc89JAxRi7UPQ12QcgkM7nUJwEZVNJQ7VHJ1MqoKHTZojEosDzL7tYhlJxgMpzUzgk5
	FsnmTldSXGfVXYBwdtlsCKNFS4jY0jwE1Kdrw7jjwge+GX1sPmg7UiSsyCd7GpQ0KOUMR6Ef/hJCn
	vGSyLWeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8rwF-00000005PRZ-2GGN;
	Thu, 07 Nov 2024 02:07:59 +0000
Received: from cmccmta8.chinamobile.com ([111.22.67.151] helo=cmccmta1.chinamobile.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8raL-00000005KdT-09UI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 01:45:23 +0000
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee2672c1ba6bed-18c05;
	Thu, 07 Nov 2024 09:45:11 +0800 (CST)
X-RM-TRANSID: 2ee2672c1ba6bed-18c05
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.108.79.103])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea672c1ba6fbb-49cd9;
	Thu, 07 Nov 2024 09:45:10 +0800 (CST)
X-RM-TRANSID: 2eea672c1ba6fbb-49cd9
From: Luo Yifan <luoyifan@cmss.chinamobile.com>
To: olivier.moysan@foss.st.com
Cc: arnaud.pouliquen@foss.st.com,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	luoyifan@cmss.chinamobile.com,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH] ASoC: stm: Prevent potential division by zero in stm32_sai_mclk_round_rate()
Date: Thu,  7 Nov 2024 09:45:10 +0800
Message-Id: <20241107014510.211654-1-luoyifan@cmss.chinamobile.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <f2d3778d-5fd6-49db-b418-b5411e617a0a@foss.st.com>
References: <f2d3778d-5fd6-49db-b418-b5411e617a0a@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_174521_625916_FBD76CD4 
X-CRM114-Status: UNSURE (   3.97  )
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

Sure, I can submit a new patch with specific tests and error messages added to stm32_sai_get_clk_div().




