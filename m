Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15980C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 07:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZawFD+HI83oYz/qiWMGJpMyBAsAiNUOkVPsn0yTgbQ=; b=zH3LDfASSiPb5FpQRhkLaCpoXd
	f5B9TV0sgB6LxA2w2OsbQQjZUh+iLAFx2SEP5LmL8t79t5npEMfPhgUAKwhD7RAwF7BiJwsFTJdsg
	uyrUHI6/Oj3SbtIX36Yk7dteO2wO0hTlumWkXI79oGiGzFfDJ34eXCIV58ujs7vr1cP6Nv9/OUgGd
	b8BsMtaBlR8hQGlE5mjiWW5ePnZQ4X4AQ6crWLG8EkEizfduvSS/0f8M3TGX+Bdmo+GCwNcuajLEu
	Hce9Pczv9ALhB0FPqgCDdRFOyrYBr2LwGXN5o0zgznewa4CH3A0vF29E3dCbq1cVGBwqgh/IlJHGE
	zA0ypJQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3c3-0000000Dq53-3VN2;
	Fri, 27 Jun 2025 07:35:07 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3K0-0000000DoCM-027z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 07:16:29 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id DC8864EF8A;
	Fri, 27 Jun 2025 09:16:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1751008587;
	bh=uBKXF6vM8NfVlqAtE7zDF6I8dzJzNc3fCBNdDoutpU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NcPb/K2MNA6v5UAJKyjVIWtTDJW1lvixW+t/T5N7+COup8OWRQ43PYOax9pP703H/
	 Pfz8CHP+e5tr2GMW0rgL9g2iUic+LOy09BSquqNOVvmPtMt+F+8Jtly86xWOqnsw9+
	 IgYME6KPy6P6uzLMs2nEOWuRES3Rx6ODmue4yBK+UKKjv4txAq2fsxN+tXNHnB9E3A
	 wXoEMMmmPhAlWKfviTw/eOiGTV+vgUVffBaMLF8vinx+mWyFmZf6uo6UjqnHf9a80n
	 8RBXBnmpFdArB7D3PF4Ggr81DNf6CU0RExxWOIJreXBRTLwEYYBM4eoCZA2FQmYasN
	 v1r165GitYyxw==
Date: Fri, 27 Jun 2025 09:16:25 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Zhang Shurong <zhang_shurong@foxmail.com>
Cc: will@kernel.org, robin.murphy@arm.com, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] The sun50i_iommu_of_xlate() function didn't properly
 handle the case where of_find_device_by_node() returns NULL. This could lead
 to a NULL pointer dereference when accessing
 platform_get_drvdata(iommu_pdev) if the device node couldn't be found.
Message-ID: <aF5FSez2w-Y3c2za@8bytes.org>
References: <tencent_889D023A2A9B04DE8D592DFE961C5893C706@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_889D023A2A9B04DE8D592DFE961C5893C706@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_001628_186388_DC670CD2 
X-CRM114-Status: UNSURE (   6.45  )
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

The subject line is too long, use something short which describes WHAT
the patch does. The WHY can be placed into the commit message.

Thanks,

	Joerg

