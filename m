Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119F0C88E58
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Bq+ncT3/4d3sU066qKQheB1ok+7UPyv7WtRbs2+Vug=; b=weoEWjfGVFE/UIE8MZ5KQTLcDU
	xdy0jrfOMwEv8UDcnbV9K51pl8f+eZApdDolhIWh+uK/hkg/gnNo7Dxk1zXhBBLl8T4WbmlTRuNEp
	ZSOfo53OE+U+b8PD60rzgrl8WaGpTbzWWk7RuTxBzValLfTBGuOSibcjU45FWT1Azw75ELh9ywjNv
	aQXV+i+a9qchI2c6aSLfvh8SJvHRCtpxiR9pG/bSK8eG0T5Ftff9hXW1LfZJoWNLI58dnDAbHsbIi
	fDoXcA0okVbgLwhPdqWELwUZro+bQdIXVFaVM0jeNsv2tf2SJxFnZkt+ct8hV/iyzzL8oycydEiIg
	Lp9UIP/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53Kf-0000000H5A5-0ZjC;
	Fri, 11 Sep 2026 15:38:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53Kd-0000000H59J-2aiJ;
	Fri, 11 Sep 2026 15:38:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A0CD4190A;
	Fri, 11 Sep 2026 15:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7A61F000FF;
	Fri, 11 Sep 2026 15:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789141107;
	bh=7Bq+ncT3/4d3sU066qKQheB1ok+7UPyv7WtRbs2+Vug=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=GbxOPoYwCFXz0A+VWv5BHFn3I+mbbUVEA5fLIMZUPWPic4HDxAi9h8zbvtJTbJDmp
	 1B5fKMgyJ7yhWIiMO7cflIrYuGBtwFPjQ5Gd5v3cSntEZlKdbGsQVkJgFplZx0iU37
	 vGeg9GrCHzyySIt5ubEWLJLqap/UME7tlnKsLms18+7W3DgUSOcB/MY+Ta/fftctoQ
	 cCJ9bkxCczdv7HMkxNtJ+iMBs3NPaashGuCKyJvHsE4qGLPZN/9JreEe7kZBRyEnez
	 ubg934dEJjNLx0sFa9j/xJcJoe8Zh8moiWp+07ztNfeV2WXd/OukROJd9JsZpB81m/
	 +HrQsjZrQF1jQ==
Date: Fri, 11 Sep 2026 17:38:24 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Justin Yeh <justin.yeh@mediatek.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, 
    Matthias Brugger <matthias.bgg@gmail.com>, 
    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
    Douglas Anderson <dianders@chromium.org>, 
    Maxime Ripard <mripard@kernel.org>, 
    Project_Global_Chrome_Upstream_Group@mediatek.com, 
    linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] HID: i2c-hid: Unfollow the panel on shutdown
In-Reply-To: <20260908013843.368364-1-justin.yeh@mediatek.com>
Message-ID: <n9rrn4p0-9ro3-00r1-r00n-n70s38p3o05n@xreary.bet>
References: <20260908013843.368364-1-justin.yeh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue, 8 Sep 2026, Justin Yeh wrote:

> i2c_hid_core_shutdown() sends SET_POWER(SLEEP) even for panel followers,
> but nothing in device_shutdown() guarantees whether the panel, and hence
> our own power, is still on by the time we get there.
> 
> Do what i2c_hid_core_remove() does and just unfollow the panel.
> drm_panel_remove_follower() calls panel_unpreparing() only while the
> panel is still prepared, which powers us down properly; if it is already
> unprepared no transfer is attempted at all. On MT8196 the panel is
> unprepared long before us, so this also drops the ~2s i2c bus timeout
> from every reboot.
> 
> Fixes: 96a37bfd232a ("HID: i2c-hid: Support being a panel follower")
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


