Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50EEEA3F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 16:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IbCBjyvOQusFhwRoELNOw/DkpVAJ767NedVSh8uzPu0=; b=CoybQRqY0JLAD1Dc89fqm17XPY
	xoXl2V1m642UdZhGYIaUZSJCoBr5Ge91BsAPf17Ft6T3eQDQmHwu7zLeHRIDIkW8WGzM3plhXS1p1
	lZV1nMBrS8VIb+ceV+Dt5IBbK0wymWQD6WdlwHUHZ7j3wy9MlQjGYnjP9AKOXsYj6OWDlWjX0qN4y
	QB8vuI6cqSnwY/j/bJ33Uxvn+vp0A1FiKCMgai3iCmMJtFa9kdXCBLTWQq1meEqsiaWqedCcA3yoE
	b85ZmDAvBJVQU5wh5Oh+sYFHv+itzZHON6wIxrW9QqUI57rnvSW/F/dho6Ihny4GfJtpC15gXIwBx
	PQLc7JlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqKL-0000000HCFP-0abu;
	Tue, 10 Feb 2026 16:11:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqKJ-0000000HCEx-03fz;
	Tue, 10 Feb 2026 16:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770739854;
	bh=lLVDD99fYBVm2CdLzN2zj/HZbrLO0z3wX6Z5az0oTNk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Optq0UcrlWtJQoGV5TU1aPGXWMxciVd3yJJkWNEa2bsRMWsKuy8W78gGRRLF4teCR
	 Q+pHjGV3xH4zYuSzAIfryAVNEGS3mb8tdsnj05HHae8WxCkCoYSh+lJNQNjjvbAp5g
	 zGG/tvVB//HewOto7KknXDt4dpeAu2iPADwm9Vp32UJqpxOsU0rhhJObNTZs3/q2tF
	 sCMw1dqm6GzpJZlNwO0EvQeJTWTsAih8PPZg/fm0jgnthFOQSgHkaAGTd4hvGgHXmC
	 rSGf747THQxMwGzHA/UaSEXlTUyffdrzcX0KwYmdvX3C7pm+hFUZTuOUoTzDVkQgij
	 pkT6RRU4DxoBA==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:7872:ec71:6d40:b8ea])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4503317E0E90;
	Tue, 10 Feb 2026 17:10:53 +0100 (CET)
From: Laura Nao <laura.nao@collabora.com>
To: aford173@gmail.com
Cc: angelogioacchino.delregno@collabora.com,
	broonie@kernel.org,
	laura.nao@collabora.com,
	lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org,
	matthias.bgg@gmail.com,
	mturquette@baylibre.com,
	nfraprado@collabora.com,
	sboyd@kernel.org,
	ulf.hansson@linaro.org
Subject: Re: [PATCH 2/5] clk: mediatek: Fix MT8196 topckgen2 orphan clocks
Date: Tue, 10 Feb 2026 17:10:49 +0100
Message-Id: <20260210161049.42621-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260210053708.17239-2-aford173@gmail.com>
References: <20260210053708.17239-2-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_081059_207667_9677369B 
X-CRM114-Status: UNSURE (   8.66  )
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

Hi,

On 2/10/26 06:37, Adam Ford wrote:
> There are a few clocks with names spelled incorrecly, so when a child tries
> to associate itself to a parent, there isn't a parent.  Fixing the names
> restores the proper parent-child relations of these clocks and eliminates
> the orphaned clocks.
>
> Fixes: b093e0f17099 ("clk: mediatek: Add MT8196 topckgen2 clock support")
> Signed-off-by: Adam Ford <aford173@gmail.com>

I intended to drop the ck_ prefix from the clock names in the original 
driver submission, but it appears I missed some of them.

Reviewed-by: Laura Nao <laura.nao@collabora.com>

Thanks!

Laura


