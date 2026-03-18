Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA23107BCF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 10:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnzdzNBShor5SsCSqm500KkuoYe6Fk+7EQmEipEUtYE=; b=D16NcL4Oi5hGGM6UIAGssDwobB
	D5wO9iWdGK+kJU5LgglASAMyMWOmIKkc0Jwpgp6AtisWniiKiUQREJtLzcx2sQ6NTf2Ob5xMaZ7N+
	yW4gjNyBzVYT+/eCP7sLwxtkpHcGfEeMqXadnce/YxjznPlH+QJy490BMluBqhHS2ehuLRdaT1Rh/
	ZJt/X8lI00JKHBkNaK8wTGWqsi+EINBAmOuMEcLbAiBjhxYTiCi4SpBZ6NK99Rrl5tCVntVtMuPPJ
	yCmoWuTTqjMaVkdZAeCZZcYodZQXYSklWV2UaT7QYGldRQVxpp7LiK8riYvwr4bDJImFR4ZGdT0+y
	1lKvpN5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oBV-00000008D8i-3AWm;
	Wed, 18 Mar 2026 10:31:29 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oBS-00000008D8M-138L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 10:31:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=rnzd
	zNBShor5SsCSqm500KkuoYe6Fk+7EQmEipEUtYE=; b=j0+If8cXjhMytAuuv3jW
	symnEI673OxAipEnveU+8nsBw/z6ifDnQoZG1Tyr6Uju1kwDt8iDohWo/idrsNEA
	3ko5H9oRd3IAsn2ZU3XurgHC4R1rm3Il4M2A42M0JDsiwDeqDNNmpYiqZGJ6PR/U
	Lv2aQXzwdztSFpRROlkIRhb9S+J40Tn52TAu0AhTU22xbdbwxBWlKHyoAE33UqaJ
	SX8eTW9uDSpvGYcVOF4IE5699O/OX9ZNUSbJytWt9FuICEIFFgosMADLiu+zF+UR
	TLC3I3GNnrmpjH70/bQBdszMDNS6E49Dk20ySM0X2RfzvYtZOxC2GFahdHfgcIGN
	6g==
Received: (qmail 652465 invoked from network); 18 Mar 2026 11:31:19 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Mar 2026 11:31:19 +0100
X-UD-Smtp-Session: l3s3148p1@d+DX80lNYtsujnvy
Date: Wed, 18 Mar 2026 11:31:12 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-remoteproc@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 04/15] hwspinlock: add callback to fill private data
 of a hwspinlock
Message-ID: <abp-8GlLkoBAUJj8@ninjato>
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
 <20260310075539.11701-5-wsa+renesas@sang-engineering.com>
 <dd21653b7343e261ec9c88c622c5facbba69df95.camel@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd21653b7343e261ec9c88c622c5facbba69df95.camel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_033127_186049_0E3397C1 
X-CRM114-Status: GOOD (  10.78  )
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

Hi Antonio,

> this API is described in Documentation/locking/hwspinlock.rst
> in chapter 'API for implementors'.
> 
> Changing the API parameters should require updating the documentation too.

I totally agree. I missed that.

> Since this API is changed again in 10/15, it's probably fine to update the
> documentation only once in the last 15/15.

Well, the changes are little, so I will change the documentation
whenever the API itself gets modified.

Thanks for the heads up!

   Wolfram


