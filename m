Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C93C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 17:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r83DxMbDAEAKhqhbmZSFk82WIQMOPTBJgIG0U6gX9Vg=; b=qEjm/YQI05bCHiJbwDbUZJFA1u
	A8IJNaPKBiYWPy8GBSkGBReG6d6Y/kXAkS2NEVGe2HI7BnBrGfFhbriq46Wc/bgstXZnFHqi5lDa0
	4dvxS/e4yrx2Z/1ueBGc6/Yw3OFs3QWn8F7dzYMzrcH5LBOHVrGBL0X0wKCeMGhxo64LO70j21M52
	FpMprv1yEdhiFod5w667aF2rlhm2raUJqt7qkCpTdujAqPat+eAXwtcwj9iKSpsQ/6gLcSzYKKAoF
	3DxoHXvW/P+kzcly89kjbJhEZpJPYbCm7vu/wCtzHYGRlQOIPlMmTFHVtyiJXMWWd6fHT3T9txCzw
	A8UpjCPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WvW-00000007aHH-3AWI;
	Tue, 15 Sep 2026 17:26:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WvV-00000007aGu-0yXP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 17:26:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 94C08600E2;
	Tue, 15 Sep 2026 17:26:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1533D1F000FF;
	Tue, 15 Sep 2026 17:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789493196;
	bh=r83DxMbDAEAKhqhbmZSFk82WIQMOPTBJgIG0U6gX9Vg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WbAQjhBAJeeAWV6UJesDnUIjjtMSV4izl+KG7RPOn+Uyw3te6quUyqbH4GIKmp2ll
	 h/cA74emvDlSZhWnJUl+EqHQsa/nEkVcTDYz5iW9+gBlrJKrbAsSQlKZdqx3H8vrXB
	 aFN3mIVIM/PcgR2PwyXOCM4cX2CtgAeVPPB2zdzXdGeNDBe8RAx8OoAyy40DaC8b0b
	 fZD2UjeNToh2QJeBb9bcnORYd3qgEDrpZk4JLTm032hoI8uJN5+N0JdZXLmgmiJjI2
	 moAsX0H9waeloU8u4a870kjyw7I1ytNdiL2UELE2XlgliHJqBLp1o1uwZTG6QFN02B
	 G6FYr1KKlAU2A==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Merge scmi_reset_proto_ops.name_get() and .latency_get()
Date: Tue, 15 Sep 2026 18:26:31 +0100
Message-ID: <178949312736.3922933.11444388869328950630.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <77c9651a11715013c0eaa8a56dbbc7dc3d9ddeec.1788429130.git.geert+renesas@glider.be>
References: <77c9651a11715013c0eaa8a56dbbc7dc3d9ddeec.1788429130.git.geert+renesas@glider.be>
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

On Thu, 03 Sep 2026 11:54:25 +0200, Geert Uytterhoeven wrote:
> The SCMI reset domain protocol operations structure does not provide a
> .info_get() method, unlike most other protocols.  Instead, it provides
> two separate methods to get a domain's name and reset latency.
> 
> Merge the .name_get() and .latency_get() methods into a single
> .info_get() method, to increase uniformity.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: Merge scmi_reset_proto_ops.name_get() and .latency_get()
      https://git.kernel.org/sudeep.holla/c/2911930bfbdf
-- 
Regards,
Sudeep


