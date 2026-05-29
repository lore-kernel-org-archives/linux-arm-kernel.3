Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D58CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 08:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tXMJ6g32FbF+vmYJskN+9ZRbeRax+mLSw7WMHME551k=; b=PgQSY5uRHlUgiYnEkZbZhDas+K
	JKkH1FrzQDm79EDjc5XVG9UgGCiYQ57CWbD45aBSsexdVP3nh74Je+aF0V8ncAWReI+9wZF8HEfxg
	5E1NIEkVBcaDAVGd9Mow3kaTnPGwlgR+YgadTtmxJWIHHjozLsSfKFDQ9zPh04NinvRHPwJYzZlit
	O5Zjg/dq+Oy0pcp3HRDcytnA6hKM5lSjY2AUUkoknp+3SjcX0y8qRc6+cRm9hGj7/WLeI/dGXWgtw
	+FbJvl3vWrSxsNmZA3SBkgtEeSpeo/yaw90phC8/O/ony48OZnRrlxwpqFSm+7Qm3IBcZlcTjSeo6
	jpZSG/Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsnh-00000006yL2-0ndk;
	Fri, 29 May 2026 08:42:41 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsnd-00000006yJU-2z2C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 08:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=tXMJ
	6g32FbF+vmYJskN+9ZRbeRax+mLSw7WMHME551k=; b=VW2F7wM9ULRSeNwaG7U5
	3IAafL5JB8q+DQq/fKmYLtD4thpSmcOoY6t3yiePp4Z8Fa8v2Vx4EYm4T2kCurE0
	QlEWJvg1n852Cf3prQfdgsFqdCcJAKdzBBQReX8UMs5Sipuy6pjTf92OfF8MMons
	+n1frwEAiHL8QXyGPqp1zzt9Nbjp+fFCIPyfdRgtw7B24PqaX5YG3DXb0kMatn+k
	8x1qshYwysFqxRkcRAI/PUwTRKnacK8bTj6YWYnE4Tze92etxh9C2vZ85kF7H8MU
	cod7iGDtshg7AMcTwrVDdOEkN83CBkA4Sad+/O7/Yx0XZ0Z9RZ9VS8ys5Insj8ED
	2g==
Received: (qmail 1342587 invoked from network); 29 May 2026 10:42:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 May 2026 10:42:30 +0200
X-UD-Smtp-Session: l3s3148p1@yp480/BSmuKSABmE
Date: Fri, 29 May 2026 10:42:29 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-remoteproc@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Tanmay Shah <tanmay.shah@amd.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 0/5] remoteproc: cleanup shared carveout and
 resource-table helpers
Message-ID: <ahlRdSX24TsPPxCf@shikoro>
References: <20260529021637.2077602-1-ben.levinsky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529021637.2077602-1-ben.levinsky@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_014238_622504_E158B76F 
X-CRM114-Status: GOOD (  11.30  )
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

Hi Ben,

> For the carveout map/unmap cleanup, this series covers the exact-match
> users called out in review: xlnx_r5_remoteproc, rcar_rproc,
> st_remoteproc, stm32_rproc, imx_rproc, and imx_dsp_rproc. The zynqmp R5
> TCM mapping path is left alone because it also clears the mapped memory
> and is not an exact match.
> 
> For the optional resource-table handling, this series converts
> xlnx_r5_remoteproc, rcar_rproc, stm32_rproc, imx_rproc, and
> imx_dsp_rproc. st_remoteproc is intentionally left unchanged because its
> parse_fw() callback also builds carveouts and is therefore not a direct
> match for the helper introduced here.

Thank you for this work, much appreciated! I want to test the changes to
the Renesas R-Car driver but can only do so early next week due to
travels. I hope I have time for review comments earlier, though.

Thanks and happy hacking,

   Wolfram


