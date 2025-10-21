Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91403CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 16:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iydNKmh3DHrg3Fmi3TNTs2HmFzP28UN/uMQrY2wNwaM=; b=rCeFOHnNiKEHh0arr17EnVE/Xg
	yw8nhtgJqyzHGbSGNZ9yzk3b8IDBPs8PscBqYZUus+GTeAOrFflYdUvdvrr6RHXk7bds1C50XcVgp
	60bBZBD3zWUGhakGdhgpopW7qGYFc6WiZKftHcbkn3LW4z88a7FpcuHQvJfhfVtQwkWlv8k0OPhaj
	HybqSTXRfgFAX2hKzQLTnrN++wlvlL9uxGyqNjMdtA7sgClTxETlKXMfF/qz6Rmis8Kfce0yMEaTK
	FK0zlcuvO7DvYTCroVOrGmlwWAWXfSp23Ik5vopQMWUf7aDta1YNKO170Wi2Jd7Msp9wCi3GeJ6mi
	6NT3t2rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBFdc-00000000AT0-2CX3;
	Tue, 21 Oct 2025 16:55:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBFda-00000000ASf-34yz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 16:55:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 197D845153;
	Tue, 21 Oct 2025 16:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B5BC4CEF5;
	Tue, 21 Oct 2025 16:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761065691;
	bh=kcJe89EUvp59KaUJ7RAP9IH7lYX00mLmtsiVqwhSc4c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oYBpIhKLxjvi6aQi1PUCD8cDzSPRZZ3c1fX2T8pHwltHk42aIqAM0qvDpKkD+HAfO
	 GHkAgLKzPV5OkBlO9bdFHELLZrIbQlesC2RkfVeBNZniAdfbHY8LIKorsZNwcIlhI6
	 tovf2fK83OEhMhFU9Gu/7tX4FInFo6K6wk2EormtE0eDX5Gq65jBAQdo1jp2VdJOTn
	 y0D0CgvSjhYN4dpdjBuxiPcotHG/wzKeHIj6MKc96PHQwxEHp9g+qxfWpSnG9inQ2/
	 tUwvxljR9/TM3gfjwAZNXVkD3Wb9rW3TcHTZBIIHToJ3YCgAOSnpxitnQjeaTTlUAU
	 v1NGmzaRRZDlg==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id E4A4C5FBE4;
	Wed, 22 Oct 2025 00:54:48 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: wens@csie.org, samuel@sholland.org, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20251020152704.4804-1-jernej.skrabec@gmail.com>
References: <20251020152704.4804-1-jernej.skrabec@gmail.com>
Subject: Re: [PATCH v2] clk: sunxi-ng: Mark A523 bus-r-cpucfg clock as
 critical
Message-Id: <176106568889.3123154.11081141825428499092.b4-ty@kernel.org>
Date: Wed, 22 Oct 2025 00:54:48 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_095506_784656_349405D0 
X-CRM114-Status: UNSURE (   7.54  )
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

On Mon, 20 Oct 2025 17:27:04 +0200, Jernej Skrabec wrote:
> bus-r-cpucfg clock is important for peripheral which takes care of
> powering CPU cores on and off. Since this operation is done by firmware
> (TF-A), mark it as critical. That way Linux won't interfere with that
> clock.
> 
> 

Applied to sunxi/clk-fixes-for-6.18 in local tree, thanks!

[1/1] clk: sunxi-ng: Mark A523 bus-r-cpucfg clock as critical
      commit: 1dba74abf3e2fa4484b924d8ba6e54e64ebb8c82

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


