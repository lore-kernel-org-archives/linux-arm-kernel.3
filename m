Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D415CD49221
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 13:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qa9NHhyLL4kxKZmTxJR2l8vXYrk/AJLkfdhe0yrUDHE=; b=yQvzn+VUbv+dR22efnslQClrCZ
	XsZ0e1keKVxdqg63aKCpZOIkB+84ufZW76fwMKWilBGmBFfOITxzXCykE3IyilulGeXg0uKHY0VTh
	ZujeIjE4B/0svHCAYmJVfKgdXBr9kUkwu0PwUsgObR2R98mDwoVyyBbAoi2ssyJtvhvgXUd8Bwmd7
	93AHCWNLKZ7U/p2eBmOMJq4csESQfm6SOXp43hslluifjT6/493+XfKtVGw7YkdAMEkmSFnbtEec5
	jeWIBC9HjkqSfzfL4QmfxlgGkKl6/m6VyYjSnjymGGNq6bJEAYRj4qzZ56O2EuUchXV6wABozPJl5
	DkbHrTVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1w6-00000009c07-3T9b;
	Mon, 18 Nov 2024 13:37:02 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1pg-00000009a8q-0t66;
	Mon, 18 Nov 2024 13:30:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F6D640008;
	Mon, 18 Nov 2024 13:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731936621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qa9NHhyLL4kxKZmTxJR2l8vXYrk/AJLkfdhe0yrUDHE=;
	b=pn+XHJxfizpJj+4/n7TDk7Pm8QBR25q0R1sp9RLBQz2n/Zhl9quYOW8cbg/S5UI9ZFCfgr
	7xrNwznaJcUWbC/l/E7HYYAv/PewQ8i+cXrN+2UV/+XWXvJXwUjbc+Eru2mcRO9br3VaJA
	yyj++LrQjTBSfO0F5DazhDQA4EaQlDZUoor3lVzkLFWv1xdu3Gts8YNUZQuFmhSQrKi1BC
	CeWHf3DuwMz36LYqBXC9dAV8BaqJGBl4ygEeydtPhJln4p/ugOQrhFSVgrxQpEKOD1uyMN
	44LFyn0t4ccXMTxey0TXg9cA1Ch7xOy90oMXxz+9RyNtn8vrrYDHYUoMODIa/w==
Date: Mon, 18 Nov 2024 14:30:20 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mtk25126 <defa.li@mediatek.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
	mingchang.jia@mediatek.com, yuhan.wei@mediatek.com,
	hao.lin@mediatek.com
Subject: Re: [PATCH v2] i3c: Use i3cdev->desc->info instead of calling
 i3c_device_get_info() to avoid deadlock
Message-ID: <173193659471.36588.2292207422310600314.b4-ty@bootlin.com>
References: <20241107132549.25439-1-defa.li@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107132549.25439-1-defa.li@mediatek.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_053024_382236_0A1BBFB7 
X-CRM114-Status: UNSURE (   7.65  )
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

On Thu, 07 Nov 2024 21:25:39 +0800, mtk25126 wrote:
> A deadlock may happen since the i3c_master_register() acquires
> &i3cbus->lock twice. See the log below.
> Use i3cdev->desc->info instead of calling i3c_device_info() to
> avoid acquiring the lock twice.
> 
> v2:
>   - Modified the title and commit message
> 
> [...]

Applied, thanks!

[1/1] i3c: Use i3cdev->desc->info instead of calling i3c_device_get_info() to avoid deadlock
      https://git.kernel.org/abelloni/c/6cf7b65f7029

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

