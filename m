Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF066E77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 17:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVqYJUxbXOGzw+lGDlx8LPDTanHjPMiGCmwr7wh/Uuc=; b=WbN6nVY4re7gYwkz8iOtZ6M6qI
	rWU4WA7kiVeL9c0ki7Nn5LXa0F9aQ3xBnxFItR2wIpaUfjK39nVlHE2nSZFdUJuKIedvBn8q2v6Ne
	53rGMlqMjCFCCMXs1e+6xyT5fbEnAdG8rUkRljMYSQ+nQSe7n5R2c10f03L5OzaZOn/anSw883RwK
	AKjZ3GbMMMn2IrJeWNWSAfzkSlhSgr7vBCSssWSF4o0YbSl60+385/X+KXx9mkmS5mV2lJR/kvTMZ
	Aik2vBzfNtfY3oZX+dIbGgIHq1Eb7UN6h7WfRKgNunIpoUrXWDDBtjmHZUDVz1OXYruubkGjjhRiV
	N3JROeWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKhA-00000005c0v-1Y7R;
	Sun, 08 Dec 2024 17:03:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKg8-00000005bkN-1PVt;
	Sun, 08 Dec 2024 17:02:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 36C815C31BC;
	Sun,  8 Dec 2024 17:02:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B46F1C4CED2;
	Sun,  8 Dec 2024 17:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733677363;
	bh=IQCzJX9mzqFx0k8wCqsYT0do0fUE/zPwysTrpnz5vb0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iJAKPGEbZzt4UwPydnM0avSvGXaRy6T1hLicejUhXPu3YuBoPGosCRX2Ad1RH0y+5
	 8AzrKuD7p5StOgU2d6lfkcXv90XQjaSUAHnakt85jEy4DC6qPlHiykaMK7YxplNJF1
	 ETWQAp/OK5umo+T+z4ChoRCKg/5PzDwdmQ6uR4noIlpYBKzUgpkAK34SCo7iL22HIv
	 ndJWgudL2sEQfEXeGGW+4ktgRDpgK8TI00cUPO4oAKYSwt+6DK+VVN6oPUTYhyW6vR
	 YhpfA5AVnaEwkpGhskVrQDt568Iiqm57U2VBGJu9ZQnVkdkdo+kvRDrEBO4NtLbted
	 jVWPc52Lc6VZg==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Anand Moon <linux.amoon@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <20241012071919.3726-1-linux.amoon@gmail.com>
References: <20241012071919.3726-1-linux.amoon@gmail.com>
Subject: Re: [PATCH v3 0/6] RK3399: PCie Phy using new helper function
Message-Id: <173367736033.1042266.11057456243557400488.b4-ty@kernel.org>
Date: Sun, 08 Dec 2024 22:32:40 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_090244_426132_FC178257 
X-CRM114-Status: UNSURE (   6.62  )
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


On Sat, 12 Oct 2024 12:49:02 +0530, Anand Moon wrote:
> Few clean of the phy change and Using guard notation makes the code
> more compact and error handling for mutex_lock/mutex_unlock.
> 
> Plz review te code changes, I tend to do silly mistake.
> 
> v1:
> [1] https://lore.kernel.org/all/20240901183221.240361-5-linux.amoon@gmail.com/
> v2: Fix some typo in the subjects.
> [2] https://lore.kernel.org/all/20241006182445.3713-1-linux.amoon@gmail.com/
> 
> [...]

Applied, thanks!

[1/6] phy: rockchip-pcie: Simplify error handling with dev_err_probe()
      commit: 84de918083d09500d93d991d8989addfaae1611e
[2/6] phy: rockchip-pcie: Use devm_clk_get_enabled() helper
      commit: e96397db55e5fbe290ff1462ddf6c24ed94eb7df
[3/6] phy: rockchip-pcie: Use regmap_read_poll_timeout() for PCIe reference clk PLL status
      commit: cb0ba26ad09398d3d0d10f518af4ccae69c8b64e
[4/6] phy: rockchip-pcie: Refactor mutex handling in rockchip_pcie_phy_power_off()
      commit: bb70d1aae565fd52e6a50e643d1ad6e7d419c2a5
[5/6] phy: rockchip-pcie: Refactor mutex handling in rockchip_pcie_phy_power_on()
      commit: 96522eeb8735449957272e9c6f8ea3b72dcbdeb8
[6/6] phy: rockchip-pcie: Use guard notation when acquiring mutex
      commit: c90a7a685a5d90228cedf7a5068f50b3da23ddfc

Best regards,
-- 
~Vinod



