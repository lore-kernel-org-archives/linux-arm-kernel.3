Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68FEC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 14:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tf/OcllJ2Yb63WJf1blzFMdyNwJao/wBuYAaItBcEfg=; b=utPxVGkqpqWAUpsEBoJcrOFDQD
	1xIeEJEpjyOwN1Np5oFj1U/qqLcMve/vZHfaLSxEkw3OjGjADR3JEs28P8qDAS7VCJtshRPsF0DGj
	McBf4F0qn7Gr2HRXUicgnJyC3Vg8DSUK4DkubUUBm61V7wStkNDVUKnvka/zmjh+HKT+bJlzLJJgg
	Z3kFoav17nOqrFSwQZ2oZWBBFViKoUwhtt1XJ1VhAobLz6SVzhe3j6PoSv2TSwEEh8bhjkfRiFZ2V
	Xt2yhqcxKrpAXk3PfwgH8neL70S8UL3FQ5tGs07l0c2zSbTA5SIE/O0lMEkMF14wfKTsz1d9Ro2nR
	kFXoDXcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67q7-000000040GL-01NU;
	Mon, 14 Sep 2026 14:39:23 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67q3-000000040FH-1oX5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 14:39:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Tf
	/OcllJ2Yb63WJf1blzFMdyNwJao/wBuYAaItBcEfg=; b=eaFyewLkH4TIDXFqvX
	5ksgDwOzYVORHyaVLJ0nbPS7QTIQM58s+fp30uLaV3i7ItBdgb5Vu8DV5/R7jXM0
	hVm13d+lB+c8kXP4qibPqVbrl9B5LrKn8+JVEcRJAhSjQgL41eYW2CatJKSuDGjy
	XHTKjrM1IvkoTHcWqWbYZ8EiM=
Received: from hpl-VMware-Virtual-Platform.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAXBL3qBqhqmNCpAg--.22384S2;
	Mon, 14 Sep 2026 22:38:35 +0800 (CST)
From: peilinhe2020@163.com
To: he.peilin@zte.com.cn,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: alexandre.torgue@foss.st.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	jiang.kun2@zte.com.cn,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	vbridgers2013@gmail.com,
	xu.xin16@zte.com.cn
Subject: Re: [PATCH net v6] net: stmmac: remove software VLAN tag stripping
Date: Mon, 14 Sep 2026 22:38:34 +0800
Message-ID: <20260914143834.5828-1-peilinhe2020@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7d72b99f-ca65-4ad4-954c-b3f9d07de523@bootlin.com>
References: <20260911141126.10592-1-peilinhe2020@163.com> <7d72b99f-ca65-4ad4-954c-b3f9d07de523@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAXBL3qBqhqmNCpAg--.22384S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZrW7GrW8GFW5Gw15uF4Uurg_yoW3CwcEk3
	yDAr98W3y8AF1q9F10yF1YqFnYgay7X34fKrZ8Xw17try8JF4Fgan5WryI9F4fGayFvF9F
	yrnxtFW8t34jgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_GYLtUUUUU==
X-CM-SenderInfo: xshlzxhqkhjiisq6il2tof0z/xtbC8guAMmqoBuuG-gAA3c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_073919_838646_DB43C00E 
X-CRM114-Status: GOOD (  12.04  )
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

From: Peilin He <he.peilin@zte.com.cn>

Hi Maxime,

Thanks for the review and for the detailed debugging.

> Eaxh patch should be an independent thread, not a reply to the previous
> one.

Ack. I'll send v7 as a new series instead of a reply to the previous one.

> So this patch breaks all the stmmac selftests on some dwmac1000, e.g. on
> dwmac-meson8b :
> ...
> Can you add the following patch to your series, as patch number 1 so
> that ethtool selftests still work during bisect ? I've tested it on
> the board who'se selftest failed with this patch and it works :)

Thanks for the analysis and for testing the fix. I'll add your selftests
fix as patch 1/2, keeping your authorship, followed by the software VLAN
stripping removal as patch 2/2.

I'll send the v7 series as a new thread shortly.

Thanks,
Peilin


