Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0B5E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 21:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6bJq6GF/I2Dbpv0jRWv1zyBcOeLPNKknFS+NKHb75no=; b=hQtwQjaeU/6RmZny7A0MxFvLgG
	Z8MjVZy4AFLmq+wJAbIU4nfqB/l1aEQo7Sfllf0WMFom16Ci3KsqqtkvcdaMhPNmjtm+XZ6NUix7Z
	Oks9aXK/PgfOTyW9sZBQfeC/jk7sUxpn6YFLoq3uHy+pfObG4Dx78rwHyfuoHU98kM5zFu9D7MQHJ
	aHhoLsfGjyX7l5bwgcz3c7ZUJSlmvBXZ+W4XMvv57sdiEMrYccliXL+SYy9sz/679fz5llFmbN4xO
	Ef1rFa9FQHlw+IVuYRCODheZ/l4tMFe/fe1Hr5B8aQWOC8BN6637RRcE8DZYAmTi2U67hmuOBDX4W
	WCYtGipA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVHA7-00000006Ktd-1fxH;
	Tue, 07 Jan 2025 21:30:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVH81-00000006KTU-0DlS;
	Tue, 07 Jan 2025 21:28:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B5A4E5C5EE1;
	Tue,  7 Jan 2025 21:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2355BC4CED6;
	Tue,  7 Jan 2025 21:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736285320;
	bh=8HGJB7yYUS9sd3pQ4xcMEyxzGUMIAgxhbWWr/J0ibG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZnOzXt4akD8+Qx6GknIXndlGTmvDx84LSwI5tWYy44wWBuhxUPaZbRoVxLX5RI5S/
	 1mKxL8mn40YInLs2uSPjbx3Jx/dMkoskjJ7eyrUSZ55yGXAfdAGtguqb6CxlOi76sH
	 S31COq3X6QpdUsuiOswRrY42iT7ZWbrSu6amPZMwYeA37PCFXvv1ay19UouLQ0AjcY
	 rT+9nUBahSZeWdfY7DbH1dsCGSGemhuKYslZxXUd/lksbyPAnAay7BQ6revFPIrXbv
	 Lm8R7CL0SyH2CdHcaVmxPcMi+/TqJyd/O6AyZlnrOvDf/aQQRa6X/TFHAqwkNIaGVt
	 pS8321p1o25fA==
Date: Tue, 7 Jan 2025 22:28:37 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Zoie Lin <zoie.lin@mediatek.com>
Cc: Qii Wang <qii.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, teddy.chen@mediatek.com
Subject: Re: [v3,0/1] i2c: mediatek: add runtime PM operations and bus
 regulator control
Message-ID: <q3wod6cg5p26dedukvzns6m3npqt6q3crcr7c6rf7o6r6csosd@a4uo32azmfxx>
References: <20250103143250.1521287-1-zoie.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103143250.1521287-1-zoie.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_132845_152881_909C9C6F 
X-CRM114-Status: GOOD (  15.69  )
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

Hi Zoie,

On Fri, Jan 03, 2025 at 10:32:33PM +0800, Zoie Lin wrote:
> This series is based on linux-next, tag: next-20241220
> 
> Changes in v3:
> 
> This patch removes the autosuspend functionality from the runtime 
> PM operations in the I2C driver. These changes have been tested on 
> the target platform and confirmed to work correctly without the 
> autosuspend functionality.

Was the autosuspend delay not necessary, then?
Is there a specific reason you included it in the first place?

BTW, next time, please use the format [PATCH v3 0/1] for patches.
Also, for just one patch, a cover letter isn't really necessary.
You can include the changelog after the '---' section of the patch.
was, then, the autosuspend delay not necessary?

Andi

> Additionally, the patch resumes the I2C bus in mtk_i2c_resume_noirq() 
> to fix the unbalanced disable issue.
> 
> 
> Zoie Lin (1):
>   i2c: mediatek: add runtime PM operations and bus regulator control
> 
>  drivers/i2c/busses/i2c-mt65xx.c | 75 +++++++++++++++++++++++++++------
>  1 file changed, 63 insertions(+), 12 deletions(-)
> 
> -- 
> 2.45.2
> 

