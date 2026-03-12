Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E906A106ACEF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 22:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EqLWHEz9IhcXZhbxieHlix0e5oY0OyP7jJs7OlzEW7s=; b=hn81JPAKbyiaOjQwS8YsWY5sAF
	o8a44GHlho+Oxa/NwHigU1K+uDvaPLX+fQ8TkOd5VWxt+2f1Gc0MRZKHKlhrXIo+VZRlcZbbyYkt3
	ZxP5Xr7mhZYskGfyni18B0mwqm9u3QkxSzoQXQU/fXQGEZvepnH2+lWvet3Rs1pe8Lu5rBqBBRuQL
	HNaQ0gGrRRqIvhy5q1dS0Tyi5A6Nlh1V6NqWBc059kVNkNQ/nHN6J5O+Kr0ctJVuyPvsD0ERu8Aqo
	fbeFO0TKi0bp8CLyJpIzG0I/ht/L8EivdgMiXtDUwbaAr02z3yXy6AD8m5VfLI9VxGOA07tPD2Xxg
	kIIlPIDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0oY4-0000000FduM-3dqJ;
	Thu, 12 Mar 2026 22:30:32 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0oY1-0000000Fdsd-1fRO;
	Thu, 12 Mar 2026 22:30:30 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1w0oXn-000000002Mx-17fh;
	Thu, 12 Mar 2026 22:30:15 +0000
Date: Thu, 12 Mar 2026 22:30:12 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Laura Nao <laura.nao@collabora.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] thermal/drivers/mediatek/lvts: add missing fields for
 mt7987
Message-ID: <abM-dM7Fx_-9yqgS@makrotopia.org>
References: <20260312202433.39092-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312202433.39092-1-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_153029_459326_987AFE76 
X-CRM114-Status: GOOD (  10.19  )
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

On Thu, Mar 12, 2026 at 09:24:32PM +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Commit a4c40559499f ("thermal/drivers/mediatek/lvts: Add platform ops to
> support alternative conversion logic") added new ops field which causes
> crash on mt7987.
> 
> [    1.518540] Internal error: Oops: 0000000096000005 [#1]  SMP
> ...
> [    1.564481] pc : lvts_get_temp+0x84/0xc4
> [    1.564492] lr : lvts_get_temp+0x60/0xc4
> ...
> [    1.620900] Call trace:
> [    1.631753]  lvts_get_temp+0x84/0xc4 (P)
> [    1.645471]  __thermal_zone_get_temp+0x24/0x11c
> [    1.656502]  __thermal_zone_device_update+0x9c/0x52c
> 
> Add the new ops member added in 7.0-rc1 for mt7987 too.
> 
> Commit 6931d597c5ef ("thermal/drivers/mediatek/lvts: Make number of
> calibration offsets configurable") introduced field num_cal_offsets
> in lvts_data. Add this for mt7987 too.
> 
> Fixes: 78c24e67d6f8 ("thermal/drivers/mediatek/lvts_thermal: Add mt7987 support")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: Daniel Golle <daniel@makrotopia.org>


