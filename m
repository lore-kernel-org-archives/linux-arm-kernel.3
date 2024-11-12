Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F33AD42BAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 16:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSFT+PppZ+AOooJMlyfp8nF9VSVE2a+WHpE8iQQeBVI=; b=WEFnUwLaElz4v61FG6BOBmgH58
	BKppomqxCVEypHftAcGcaRRA1zNSIKqQ0+dRSUxn9ztmNuY8z0hU56v7JFKLYTvnjDa19ieholBdH
	r8iEQ157MYNE+fWEKrNNQ/fGyb/h33lzEZtc0VnynAh9wHr9N9H0II82sTFirDld00LaD4HC/Cspj
	wDx2PIlMBloxcUtnkNd+BrK3IBTDtQ67R9N/n69ItIK49OfvMZ6eYiPNAhROQsUxfmMUPknc/3p0B
	16m53tbvPmxx6IxNtgqaWsXfY1ZLT/fo7QTXxw5gZh7ulwc1zbZAB8TY5ZN7mrh5KiIk2XMyBIfX1
	hsGR6pSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAu2n-00000004CjF-2DCD;
	Tue, 12 Nov 2024 16:47:09 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtz3-00000004C7J-35HO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 16:43:19 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ACEB6512;
	Tue, 12 Nov 2024 17:43:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731429780;
	bh=65VsRjVcEe9IvdBJ/DvvVbzX+0/6GvW4V9ctYpdSrKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qKIDCDSxxKY37Yoayj++VojJCA882nVp1mOs+5bUrDgIxFyRNST6HrdXK87+y/UTW
	 LPJv/2w4C0hvOdZe5i47ERqp++oMfcyz1OTQZnxWnU8o1puJzQg3l+tXAyMr6p1LIG
	 cOMxU7Wl/UXEXtiHOCk7kjkKCQ9zHC8atICcOj8Y=
Date: Tue, 12 Nov 2024 18:43:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm: zynqmp_dp: Unlock on error in
 zynqmp_dp_bridge_atomic_enable()
Message-ID: <20241112164305.GA24067@pendragon.ideasonboard.com>
References: <b4042bd9-c943-4738-a2e1-8647259137c6@stanley.mountain>
 <20241112052754.GB21062@pendragon.ideasonboard.com>
 <37be000a-3ef8-4df4-aefa-b4d73487ad27@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <37be000a-3ef8-4df4-aefa-b4d73487ad27@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_084317_954190_0661D298 
X-CRM114-Status: GOOD (  15.39  )
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

On Tue, Nov 12, 2024 at 09:41:58AM -0500, Sean Anderson wrote:
> On 11/12/24 00:27, Laurent Pinchart wrote:
> > Hi Dan,
> > 
> > Thank you for the patch.
> > 
> > On Mon, Nov 11, 2024 at 12:06:10PM +0300, Dan Carpenter wrote:
> >> We added some locking to this function, but accidentally forgot to unlock
> >> if zynqmp_dp_mode_configure() failed.  Use a guard lock to fix it.
> >> 
> >> Fixes: a7d5eeaa57d7 ("drm: zynqmp_dp: Add locking")
> >> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > Sean, how about replacing all the mutex_lock()/mutex_unlock() calls
> > you've added in a7d5eeaa57d7 with guards ?
> 
> I have no objection to that.

Would you send a patch ? Otherwise I can do it.

-- 
Regards,

Laurent Pinchart

