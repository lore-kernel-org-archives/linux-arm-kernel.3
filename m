Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FABD3B7F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 09:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LmegpvWp3bdLPUJEMLYBNbuICLKr7brrr1IYNigmVdc=; b=WT+9OuwP3WU2yqRuMYJSV1KYDc
	fRAP8+xm93rAAId1Gp7OIpGCVy5BaDzCllGjsjxV6mqom6ZmFWSAjMpvz08oMoC7HX3TXWaQ7C69c
	/R6jS1Fgki8AzDoGnsbl3MMbXGrrA2IZhp3ZQ4urBt8aGYi8EKeOKIvv2aaiQZeYHMcRSvyvqWQzv
	9tBeYQ5JPGigwwT+BBJJdBUpoGvjQasl+ZfZSoqVzLFkuPV1Cs0lmRMoxvqMx+dGwFHCHSQfX0EGA
	dTzSYlUAP2Cq3hsHKgy93s5GlZtAxLfs/LZLD8jTScOOxaykhb9ZSFVt6qfHiMnqAV8xf8KiI4FRE
	mYGiXCwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVBr-00000007WaQ-3xJI;
	Mon, 25 Nov 2024 09:15:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVAR-00000007W5f-3Rpv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 09:14:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 99AD4A41392;
	Mon, 25 Nov 2024 09:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC643C4CECE;
	Mon, 25 Nov 2024 09:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732526042;
	bh=1XQUPazAG20tbs4O/Rn/xERWfHbxiKgQ/YgDItpVwZA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=NjuiiomyOxo9MIeolvgNU5/PdZ8uJVY3aZYnHAiMjOY/fWRhiffon/RO4gq9Xt/eh
	 o/9UwTIymkTPJKSxnPeIqr/+Pqxtgw2rxUE1VyYMbAzCXL/0f2wRU6JGYcnbllv1F4
	 tbl9/GZcHjMnpXarIsNYN1dcA4u6dQRB2tU0DHeGhcKvmUn+x/D4Zcc9JA2EapnbdR
	 TD+8rzRSex7h1JL9U6oGwEYRbPIu6LM7Vje1mwpRlkjRai0F52GdF43nTpTQCyZdy3
	 e3vuamCeaJTGU17s23RDnxasS5vzQ/GEXJDnTM12bovr7VKE6u0kk8CnXAgoUoZNK6
	 2b+pOjVmoTZTA==
Message-ID: <b83f53e7bffcc7de692c2e478e083928@kernel.org>
Date: Mon, 25 Nov 2024 09:13:59 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 01/10] drm/tests: hdmi: handle empty modes in
 find_preferred_mode()
In-Reply-To: <20241122-hdmi-mode-valid-v4-1-2fee4a83ab79@linaro.org>
References: <20241122-hdmi-mode-valid-v4-1-2fee4a83ab79@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Chen-Yu Tsai" <wens@csie.org>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_011403_940016_A53797DE 
X-CRM114-Status: UNSURE (   6.91  )
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

On Fri, 22 Nov 2024 11:12:57 +0200, Dmitry Baryshkov wrote:
> If the connector->modes list is empty, then list_first_entry() returns a
> bogus entry. Change that to use list_first_entry_or_null().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

