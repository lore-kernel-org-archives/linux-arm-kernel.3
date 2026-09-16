Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35991C982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 19:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZKIoHZ2yaBwojNtcPcwmQaPcDtxcHubfSKW9FzK/3g=; b=Rk5I1s62WubY5bLcXn8XAjvUMJ
	N+oRq7CnCZJZkHBWfJVp5ySfVyOV02LCLX9JEAP+Ppd7Pmds3uIA8RLrOVknKujzNpc4gbc6GZzcy
	CVymyaXCvgyb9qvA8XdHuOPEWf1GoemHTyYXuwf7rS1uzaNxOLuQSUwkF8duRSl/C1ZmpuzhE7ycx
	zmqaRwQQIDCq6hRQPKcEK4+AiItzOQKEsjmL66K2sflxRVTAqQPNBQJBZFa074oQSJkxv1f8Dl+hP
	I0LnyWVEA/3rNsbSIXWsmg6OfyrCCxq9WaVdEVLtodXKYpTDkkIot03+InrqAsiUUy4jUtxxMmZrJ
	ItJy6/wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6vJ6-0000000A1kx-19sw;
	Wed, 16 Sep 2026 19:28:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6vJ4-0000000A1kp-3ZVi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 19:28:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 40E0B4123C;
	Wed, 16 Sep 2026 19:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3291F0089C;
	Wed, 16 Sep 2026 19:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789586914;
	bh=iZKIoHZ2yaBwojNtcPcwmQaPcDtxcHubfSKW9FzK/3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Te6RnPKee/lPBmv0d3R0sE+DVOk5v1yOX3/+V2z8/S9UYzSjW5YsCslAGIMz2FQYr
	 7/Il53Lu4os64JnuiVrWMhSAcNuwhk/Y93V8AkLvyNrkdjyIC/udbTayHYTIk739c6
	 aYTEdfDDGmTfctZDRhFdiHlN1QLOdAbhrz8TARp7geN+0vmtKnzeUal5/ky+bLGMGC
	 hWId9AkNT/B5urJ4rCOKB/MtFFuQniAPiEwOh2s6CnEVRzgb4RLIXY+DIe4fnWMwW9
	 f1ZNnlepGelmxZVyOfDuoi9N4hrrhYvxw+xQNnFanhIZD6xytV/XQAp2ZcC1tyM2kP
	 AyzTZa6bOyO4g==
From: Sasha Levin <sashal@kernel.org>
To: gregkh@linuxfoundation.org,
	linux@armlinux.org.uk,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	rmk+kernel@armlinux.org.uk,
	linusw@kernel.org,
	kuninori.morimoto.gx@renesas.com,
	arnd@arndb.de,
	xiqi2@huawei.com,
	ljs@kernel.org,
	wozizhi@huaweicloud.com
Cc: Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	stable@vger.kernel.org,
	patches@lists.linux.dev,
	lisongze2@huawei.com,
	wangbing6@huawei.com,
	Xie Yuanbin <xieyuanbin1@huawei.com>
Subject: Re: [PATCH 5.10.y/5.15.y 1/4] ARM: fix hash_name() fault
Date: Wed, 16 Sep 2026 15:27:57 -0400
Message-ID: <daily-reply-20260916-0007-re-arm-show-pte-series@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260916080011.170295-1-xieyuanbin1@huawei.com>
References: <20260916080011.170295-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

> [ Xie Yuanbin: At the upstream, the following patches are a patch set:
>   1. commit dea20281ac8822661576 ("ARM: group is_permission_fault() with
>      is_translation_fault()")
[...]
>   patch 1. and 2. is unneeded for 5.10.y and 5.15.y . This patch backports
>   patch 3. and simply adapts to the context differences. ]

Patches 1/4 through 3/4 carry only Russell King's Signed-off-by. You adapted
1/4 and 2/4 and transmitted all three, so each one needs your own
Signed-off-by before I can take it. Could you resend with that added?

Please also drop 4/4 from the resend. e79ca91165d4 ("ARM: 9484/1: enable
interrupts when unhandled user faults are triggered") is already queued for
both 5.15 and 5.10.

-- 
Thanks,
Sasha

