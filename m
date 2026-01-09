Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83E1D26D7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 19:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58j9AgUfzZ/38ftGIgW2X6tV4I+EPs5M/SNwfN2BsMU=; b=yLtzFpHnKwOgteIl9jwA0DIpxs
	jLX4SR9Oj7OFJ/eAgQmnhQY4cTdXqK4cAMefWJ1+8f2ACnRvBVKn1DEzbQ4GyLyKeydzbhlWw4cCM
	I4/ffPknOaZh/eQEZEHwTY3hkJ9X1D3QCr9k0EO5w9tm+0A9Ga+TXOdFotW1fWQGRLW+q4clxC63b
	Wge6tWOfMfrpWWWlYuncj4CbDhEpQNUs2YYc3EaJ3fYmUpSJkfnNCA2JKSCBOmB6aHxK447zbAAmJ
	Ax/N6gO1Hy5G3I0uTwVq6MKwlPism7f2yzck90iJfa6agH8Xkr6u1KNjsl/CWnJ7d+BWftLj4fXqr
	g6KCb8XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veI76-00000002wDg-0Ti8;
	Fri, 09 Jan 2026 19:25:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veI74-00000002wD3-37xl;
	Fri, 09 Jan 2026 19:25:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=58j9AgUfzZ/38ftGIgW2X6tV4I+EPs5M/SNwfN2BsMU=; b=GDdPPL8pVT0S6NQabzZd9Lbmjy
	uro84EPVRHokVNyuOITSp2kVrCBLzF5pePkyt2bE7d3DMpPvPAjgDLB0g8oPspP7IFh2MaeGKzcsP
	YO1fEWTd7HdOthDr8zi+uUsEheMDZ977Qi6kfP0lppST/RdYC3bzMd19JQgk1zGmO03eZ9gf3dGxp
	JHciIMdYOc0h3BRjjHbEDovqN/UyRjVPIG5EBxaMZ7Ki6MbsQ3w+13GR/8lbTAX02dLIR1YxmYSmn
	Q/xx9Jrtgb7+Px0pPKxpK1S33/0qK6O33DppbdyfEkxLYSgdyJTL33jmc3t4ysgWR/onsoMPclvZ6
	3wRarG0Q==;
Received: from [192.76.154.238] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1veI6z-001fmF-0u; Fri, 09 Jan 2026 20:25:29 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Marco Crivellari <marco.crivellari@suse.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 0/2] rename system_wq and system_unbound_wq
Date: Fri,  9 Jan 2026 20:25:23 +0100
Message-ID: <176798671267.3432512.10099163174587731077.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251031104846.119503-1-marco.crivellari@suse.com>
References: <20251031104846.119503-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_112534_783144_82F4A402 
X-CRM114-Status: GOOD (  12.07  )
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


On Fri, 31 Oct 2025 11:48:44 +0100, Marco Crivellari wrote:
> === Current situation: problems ===
> 
> Let's consider a nohz_full system with isolated CPUs: wq_unbound_cpumask is
> set to the housekeeping CPUs, for !WQ_UNBOUND the local CPU is selected.
> 
> This leads to different scenarios if a work item is scheduled on an
> isolated CPU where "delay" value is 0 or greater then 0:
>         schedule_delayed_work(, 0);
> 
> [...]

Applied, thanks!

[1/2] drm/rockchip: replace use of system_unbound_wq with system_dfl_wq
      commit: 0650f4909af2bafe49322c91dd8dd0f68abfdf4f
[2/2] drm/rockchip: replace use of system_wq with system_percpu_wq
      commit: ab8559d44de5750e03778c42311aec8dd41a61f5

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

