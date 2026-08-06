Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FAEC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZU0VrTV4GLDlCfx7g+a3UzwLYWGbzU9Cafj3dXrmRs0=; b=xhm/6R8Do2RvNksx4UcRYHQNLm
	GsixrthkCcAbjBGVMdxOWqOky/94e+Z+0K2DgRYKDczGnOdkEpWNW/3RXI+/VDpyz9bNp/Uqva4j4
	hSFEKUiceUpqOqNc9pi8tg79vrwKy2XnhJcM3lB6Tzh7zJTVeb33yxc05ZmvDWCpRXrBg34oXIjDc
	jA4GVtl3O85NeTAu10QWpNgp273ydMCyJ+hLJO5fZkyaUSvyRqF85D/P6Zk2DVSm/N0zvmnf3lf5y
	duzPW+dxofXpYhTQwMKqu6TohnAYm4SbKAdmSV7oweKN1B3D/V/KPKvT8JDHYU1vrUp/P0wj5giAm
	SnokOGyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1de-00000006Kbx-3whW;
	Thu, 06 Aug 2026 17:12:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1dd-00000006Kar-1bwn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 17:12:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EDBD342E99;
	Thu,  6 Aug 2026 17:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A9481F000E9;
	Thu,  6 Aug 2026 17:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786036332;
	bh=ZU0VrTV4GLDlCfx7g+a3UzwLYWGbzU9Cafj3dXrmRs0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I6ckpMARmovzb8GA7jcN41tiAxs6P02GoIqR/93Jx+k472VjftW/vJBilnwhKIho8
	 1b3CHjckp2tdT3Oj4xUoVj/PbgSR3Bmf8bVRS+JFjxdp70v8DHvUSyl3MF6E7v6jWb
	 sZy8rMz08u6jDcr67Yrfcf1GqmNBxH9BC8IizSQ2Qgv4i4I47ttwMtP8U+bnmtXAHl
	 sBnvuY6caeKLEuLSECNC0gf4sCEdpT30bJn67DZ7v3PwSh9tkPpaIjP3kk8JB3Y+xN
	 VdlrO7oUo81la9VxR3J6oxu+mefjLW6fEEUyDpayd3HB828y8GAr+sal+IidJAPM/g
	 XOyYi5eBCmbwA==
From: Will Deacon <will@kernel.org>
To: Shuai Xue <xueshuai@linux.alibaba.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Frank Li <Frank.li@nxp.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yushan Wang <wangyushan12@huawei.com>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Chengwen Feng <fengchengwen@huawei.com>,
	Yury Norov <ynorov@nvidia.com>,
	Ma Ke <make24@iscas.ac.cn>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Pan Chuang <panchuang@vivo.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH 0/3] perf: Remove redundant error messages on IRQ request failure
Date: Thu,  6 Aug 2026 18:11:42 +0100
Message-ID: <178585020446.3647840.3969322133081891560.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260717103123.34887-1-panchuang@vivo.com>
References: <20260717103123.34887-1-panchuang@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Fri, 17 Jul 2026 18:31:16 +0800, Pan Chuang wrote:
> devm_request_threaded_irq() and devm_request_any_context_irq()
> automatically log detailed error messages on failure via
> the devm_request_result() helper, which prints device
> name, IRQ number, handler functions, and error code.
> 
> Since devm_request_irq() is a static inline wrapper around
> devm_request_threaded_irq(), it also benefits from this
> automatic logging.
> 
> [...]

Applied to arm64 (for-next/perf), thanks!

[1/3] perf: Remove redundant dev_err()/dev_err_probe()
      https://git.kernel.org/arm64/c/a2d0c34f6dc0
[2/3] perf: arm_cspmu: Remove redundant dev_err()
      https://git.kernel.org/arm64/c/3bee2a4d210b
[3/3] drivers/perf: hisi: Remove redundant dev_err()/dev_err_probe()
      https://git.kernel.org/arm64/c/5f254ed7149e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

