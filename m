Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0C0CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 09:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxIVDfI3otYiBlPtplnFXJAWJ2t4AF9eNGEAxVc9r5c=; b=GwUYbvxkxdx0Ee8hun9Elx/rFn
	IoZ/XwJjl8VOciIuUweUBtRrotxk/c0n3jZv3XHSrlRGDzQsDHyuQ2h1koHH4IbgxIScfK78asKSQ
	6VxdsvVgx9wN4DkHDQ3GSdp8xi6wMV12p+Qhu3DIwEAP7sCqm9Z8BO2mRMAyWlr/BV4lbT5t9DyGJ
	KG/5Dg6UIDYN70utnwn49VQtEaHCDBgdrhr0u9c6ugiTurFkpjTQGXLVjK0M+BnhY82+AjT43jDoE
	YMURon6NuNIVYbYOfriUjtDZrErldF3rNoQXmBk7CsbonrV2SQo3LDnHhicl2qUY9VMnLAYvmT4cM
	9yJhFSyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStTa-000000073tF-0Svt;
	Fri, 29 May 2026 09:25:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStTX-000000073sb-291Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 09:25:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B5A22247;
	Fri, 29 May 2026 02:25:47 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7D4BF3F905;
	Fri, 29 May 2026 02:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780046752; bh=whOnCD04XzN5dEKeBNOCPQ4ejB9dEQUjEpJ2VkWVcng=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HyL3lskKyRvg6ritB3nqBC5fHzaOKf77CP2gBkaZ+ZWKGs3lieB7yH9Joq6V+b1xb
	 wZm8/4WB+h0UtoA2scNo8cHeoyOXam2df01vJ4wSuJ8QgMJ6BwqoiyCeMyQdhzds5g
	 NaVvsnMDiDhUUR9qSSYR0dO8halvM+DA2d77RePs=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: alexander.shishkin@linux.intel.com,
	Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	james.clark@linaro.org,
	mathieu.poirier@linaro.org,
	gregkh@linuxfoundation.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	stable@vger.kernel.org,
	Mike Leach <mike.leach@arm.com>
Subject: Re: [PATCH] coresight: etb10: restore atomic_t for shared reading state
Date: Fri, 29 May 2026 10:25:40 +0100
Message-ID: <178004662060.671212.8394865025455902639.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528165201.319452-1-runyu.xiao@seu.edu.cn>
References: <20260528165201.319452-1-runyu.xiao@seu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_022555_706532_25722629 
X-CRM114-Status: UNSURE (   8.12  )
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


On Fri, 29 May 2026 00:52:01 +0800, Runyu Xiao wrote:
> The etb10 miscdevice uses drvdata->reading as a shared exclusivity gate
> for userspace buffer access. etb_open() claims that gate with
> local_cmpxchg(), and etb_release() clears it with local_set().
> 
> That gate is shared per-device state rather than CPU-local state. A
> running system can reach it whenever /dev/<etb> is opened, closed, and
> reopened by different tasks while the device remains registered, so the
> same drvdata->reading variable may be claimed on one CPU and later
> cleared on another.
> 
> [...]

Applied, thanks!

[1/1] coresight: etb10: restore atomic_t for shared reading state
      https://git.kernel.org/coresight/c/fa09f08ede3d

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

