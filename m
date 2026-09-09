Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED135C79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 21:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjwFGcVPSNWfje2QsRXKLC8B+AQNq5tvQ8diIKCovEc=; b=kxJPQanzX6vFP3C8s2qoP28W0G
	wXAHriD6eV0IM9dURatw0qNTCFn2GYUpXdv88h8bXOsl8jEd7jzXaD+ui1N/LTYnLA3y0MzI24Lp2
	+Mbgj+ejjeCSCTQbHuKm94Bymwud+FtT31ZJ27sMdQsvXbiygGl/64Jn/0yG3UZPJpRa+Xp686J3Q
	iPimz1sg6UEwSRfzDjaF9Vj64aDt6i6RRwk44z/1T3N6Ugr0m1cT+5E/OKhlhwax49VswhZMB4GiX
	0yziJjR0KDJBcSi+q+ruxXM9wkB1274tDoF2z+nLRFAwSgzioNkCKhpJVOap187TNgB0dg4oKRyWE
	V6j3mu5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Pmv-0000000CsjA-1uPC;
	Wed, 09 Sep 2026 21:25:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Pmu-0000000CsiU-24Y1
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 21:25:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sjwFGcVPSNWfje2QsRXKLC8B+AQNq5tvQ8diIKCovEc=; b=ZL4yULiZXmALg1ocob4IHac+d3
	Tx2z82nfwQjkFwlpAEjwCuYTzoQFN0wj45UHEBCdVhJ+I6Ukhk5uKffyUIjoP5ZbRhs01HbHTjSag
	yAeTcW+IQOVuqiNXfihNJyv3JtKHu/9RHrY59lznaCG4wYl/DlTO4F69rfz4z6pq8YT5J6pApodk8
	r19c5X5mldDbza3Oa6u8gi6AR0cU1Lo0+g8VyrSWv9mbU3HkGwsRzlmeYMB7fcO6FAMtgbF2Cc6yR
	MYKtWoFhHHDqoV6irxCD3Apm82UToPlc2LH4NHZcl9r5UaWv2pauBbMESY1uDa9pBcRBRKZEKuLk9
	5Lqn5ruw==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Pmp-00000001hKI-2zYy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 21:24:59 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so5378445a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 14:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788989093; x=1789593893; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sjwFGcVPSNWfje2QsRXKLC8B+AQNq5tvQ8diIKCovEc=;
        b=sWfQUpJyv2knzTfAsVQzGs+Zk1nEiLXKUhhfW0PYd36F9b8p5ydPojeLAiW6jQP1i4
         t686UKQ+z7YGwIWVmMMEgSVeffGaZyu0Onk3+28qX726La6po4vym50NHAuscX72yNAY
         rmYOoBtlfZ7o9u28EfJu896OjxNjPhBaf0px09i3y7xE65nVgZpc78i43+PPk7n9Ta/O
         2rSaBYpXzdyvQXoqPFCNH2LzcJoUACzOsk94ryLYCCxlHSOGMX+ROEKtbwsvQt3NFnYS
         EdbNtCVi/4piuCqYjp4s9VR3RyoIUmYkOfwEvldvw8GHor/pIzLpkpR7sCWxvm9V1/2i
         jbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788989093; x=1789593893;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sjwFGcVPSNWfje2QsRXKLC8B+AQNq5tvQ8diIKCovEc=;
        b=qIkMoSvGcmNXGdUZG7+56T1y7oLDuZaQAFuUInxBLSiemBJTEZW8rmJ6FXDajXK8Z3
         78mBJboYJcz2vphI7OH/XktSv3gjtH6h2ZE4CTylloCitOCsbkkbJg2XBURdyaOOEp8n
         QtxSvL8l8r868gJCKLpuO2nWsasxLKcF2YodSNNx0+dZvagt+NXTxB2C0UMe4vAHxxWE
         DLrjS5Yf8iRaEyrrNb8NIxpfMcjPbyfId6CcmOYU+hPDXC7wQm0NGCfBEH3A3KZzb00L
         4cXIVtv4wkMw+mlRaq/+8qhyeafJoIkj54UjbQNRmWPzDOFRMH+cDrk6hVoOUUNFjJFA
         5nFg==
X-Forwarded-Encrypted: i=1; AKwUvBzXg/+d/waevGKu5ZqeFFKOqzeDuuFeL04+4RNZywWPFI0D1/gO6sqIhC9SGrnVuYvT9kyu1akRrsWlGYdRdHll@lists.infradead.org
X-Gm-Message-State: AFuF++m7ptHEU5GZaF1NJrsSsQoSd5IvueJ1jXq1M4aekDz43BGQj5gA
	wF1ZhI+ooc1N/N231PXH7s0YR5u4QZ5j0Cv+81psHSnsVAC9vowVSoFh
X-Gm-Gg: AYBFou08PZQqxZr+uSAI+6IGUztdd2rc3LjEIg6qOfBFh5wKxX4CwxoAdmfXzd95sP5
	qmYnsbuwvY09Jm8Nh8gUXurLq8ANbcYrn97XWAyOyBtySWB7cOItkfQVsm+sRfj4xKMW6sE1mqm
	Hrud1Ezru2ljhAzFtkkfkuXbwaUmtwXm5SHl6t5qlllFVuy+nWEQ5wt4ZkdB3lqALMvZLwmYYMZ
	pXSrIuwoxQp0eUM3JJfwa4LOa9MDRs4FgcqKhE7P6FGGxLriMIVY8onPyVUdwcNClilJUG5bFSN
	LP31Qo3sE22uDEHtTzk5q00xjjUepj1ZtsFsww7imbngh3lFB2edin3Qj76qvhbz4jOZA06woZN
	ZwIWcYa+QleS4MxY+sNJHuTF0q37zpPpI0QixutVxmBcfBPJc2k7In8fJAsPtqpQcyFj5w/Mqmv
	mkSOUes49atYIDuM1kcthYSTiY4t8Rmj9CR74ELRq2cy9wu/P5cIitCRbTxXpmWk2zkcWLqbqYR
	iWeIhlaXYdn
X-Received: by 2002:a17:90b:1c0a:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-39b2614e099mr53418423a91.3.1788989093027;
        Wed, 09 Sep 2026 14:24:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e9014cbsm6506a91.16.2026.09.09.14.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 14:24:52 -0700 (PDT)
Date: Wed, 9 Sep 2026 14:24:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/8] watchdog: mediatek: Add wdt/toprgu resets for
 mt6589
Message-ID: <b01b65d3-9ff5-4bfb-9917-5ab287535078@roeck-us.net>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
 <20260908174259.9009-2-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908174259.9009-2-l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_222456_922288_6E370BDA 
X-CRM114-Status: GOOD (  10.31  )
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

On Tue, Sep 08, 2026 at 07:38:28PM +0200, Luca Leonardo Scorcia wrote:
> According to Android sources, mt6589 has 12 reset bits in the
> WDT_SWSYSRST register. Populate toprgu_sw_rst_num to allow toprgu resets
> in device trees of the many compatible devices.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Applied.

Thanks,
Guenter

