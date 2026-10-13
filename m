Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B9CCC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 11:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RXZipy+fUyJE4tmfdVmFNE5i0PV1F24TRbxaj2s7BWs=; b=Tt963/SQHd9Qhrq1YgWA2rFPHr
	1FcrMbeGfgVq5s+CmbzJw0dItpYZzkbmkYkyAm3npNaSOQDu0txQFcO8SJsKQKbSqA8HVKzjC3r4O
	7EKsd4VWlGiLTXN42jnXb9ZHyDzBI9dy0TPNwEFjhQTvZvort+DMsudsl2+CnGhPpd3Tv1UcGNlC1
	GcNDZIo7Dkr/WtUXtI3saNr39g6id5xqyL8O7/qde1Zjg/NgFG9X1TmUPL8J9QxLW1oD8uxrdL9U3
	4H9JXtQfOWNxXxBKjORIOiTPviKQ+HEYGATftQf8RYFCqTEtkqQqtqMb7ai9vdMENgbNH9huQFSg9
	mo+QSmOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGb9I-0000000CllQ-1bS4;
	Tue, 13 Oct 2026 11:58:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGb9G-0000000ClkM-1zq1;
	Tue, 13 Oct 2026 11:58:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=RXZipy+fUyJE4tmfdVmFNE5i0PV1F24TRbxaj2s7BWs=; b=coIeN+ZVk9rzeh4fwrzxdIUGxg
	NsXihkcvVcMD90BovGsabSbtQ6Zx79cu+qsGLfFDGHQZl5g9O5/ElmF45eSBRLjJizpP/refSAJea
	lB1UdHq9PSwif4+moDtCLzO8Yna8fiOGxAg/ENjFir7l6C9IZYd1Kqn4rI5sJPZqdMkYqwwWd7ikq
	QttHtScVhiw6qO2v6qLtCXrW5DboVG12t0ECHezfeSBtSIgX18B8oXPduTjEOYSpUv/23VszGaT72
	Z2Tv9KavsAhmY6LWPGN+GHJJ0qNRJKeszbn1CjJB5ivaOTVtJ6LAMx4jB7PVGop0o220+wUpeyHUt
	DWTbACxA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Igor Paunovic <royalnet026@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] accel/rocket: search every core slot when looking up a scheduler
Date: Tue, 13 Oct 2026 13:58:09 +0200
Message-ID: <179189268364.3989522.6809230134424233060.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260905150432.7477-1-royalnet026@gmail.com>
References: <20260905150432.7477-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_045826_572524_7B75BA52 
X-CRM114-Status: UNSURE (   8.75  )
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


On Sat, 05 Sep 2026 17:04:32 +0200, Igor Paunovic wrote:
> sched_to_core() walks rdev->cores[] up to rdev->num_cores, and
> rocket_remove() decrements num_cores for every core it removes. Unbind a
> core that is not the last one and the cores behind it fall outside the
> search, so sched_to_core() returns NULL for a core that is still bound and
> still running jobs. Neither caller checks the result:
> 
>   rocket_job_run():      rocket_fence_create(core), core->dev
>   rocket_job_timedout(): dev_err(core->dev, "NPU job timed out")
> 
> [...]

Applied, thanks!

[1/1] accel/rocket: search every core slot when looking up a scheduler
      commit: 89c2c777df17eb0201c8e22afabbf3691f2a28fe

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

