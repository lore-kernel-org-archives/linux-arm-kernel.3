Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184D8606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 13:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HVHry1E3;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=a8sqbx3o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NKmp+ui2Bo98qe07VUZSa+u7FLoONy+lMEEgOv7rH+E=; b=HVHry1E3riKOtZ
	fs1+aQxdSYP6VybwWZqn/v/QydlA91bkdfXsSPPfN8XiSyzWHjhIjC2K5VrB45AJJHtGNmR/sZVwx
	Y4KpWPt8u569Pw05uoCwXTnOV1IX8dCGyIaNByacZ2SiCOZ0ANJZ1EWBSRwK6Ch7kZRqUjKpfcUVy
	IS5ivbf2pvdgqGirIdU4HYVYqVoXi6coUqI+T4yTsvSlDnC4zdhdmnNDI/rOkeQa8+er4Df2Y/BoZ
	xjrojTt2gu12mSXcf+ClWybzvpwOA5XIwMjiEJZo8YSA725ABsvf7gKhryYCpM6vgDb4I5E/BKk1b
	9bNwTHsezlDsm4oXJh2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMmmA-0000000Blcp-1wg9;
	Fri, 30 Oct 2026 13:36:10 +0000
Received: from cmccmta4.chinamobile.com ([111.22.67.137])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMmm3-0000000Blc7-2xol
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 13:36:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=a8sqbx3oNNhXt0lqJ1Oxjxjwozq8dO9yMt7Z2eHUcN5GhpHTZGfVKfN2BUaOgM11ES27bKPL8uAYx
	 SIRIMgLuWtZ+MZeX7q7s1GSV7tlfLvQ/I04QNVltqxYIsn64Vww7MvseqcqvZAm9UDkFPo8mRkX9rV
	 VAdEBgeocndfTbUI=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86ae49d2cf40-1586b;
	Fri, 30 Oct 2026 21:35:49 +0800 (CST)
X-RM-TRANSID: 2ee86ae49d2cf40-1586b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-3K8GUTQ (unknown[112.22.250.195])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6ae49d33695-0d785;
	Fri, 30 Oct 2026 21:35:49 +0800 (CST)
X-RM-TRANSID: 2eea6ae49d33695-0d785
From: laixiangwu <laixiangwu@cmss.chinamobile.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: laixiangwu <laixiangwu@cmss.chinamobile.com>,
	dri-devel@lists.freedesktop.org,
	Lucas Stach <l.stach@pengutronix.de>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH] drm/imx/dcss: Fix clock leak on blkctl init failure
Date: Fri, 30 Oct 2026 21:31:30 +0800
Message-ID: <20261030133355.1938-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <auRgElrEh0YlUaKc@vm>
References: <auRgElrEh0YlUaKc@vm>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_063604_988543_EB18F14B 
X-CRM114-Status: UNSURE (   4.46  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Laurentiu,=0D
=0D
Thank you for the review!=0D
=0D
I've renamed the error labels as you suggested and sent a v2, which=0D
threads below this mail. Please take a look.=0D
=0D
Best regards,=0D
laixiangwu=0D



