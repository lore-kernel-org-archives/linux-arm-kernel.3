Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59376CC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 14:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxkihl9morGXlwHlg5G3dnvtjqdsFp1JKoB8HwphYrQ=; b=wOk+W678wuGS3lL3kNvmA97YRQ
	qJfwelTnUsS3/f+cx1KOkfQmy47lQUQGD1V2yiFjpcPenQaYpzXu245KXFkne8o0QJgdl6j4Qs0Pp
	/blLQC6OIeHXJpkOAapvtaT0qFrzcolmWdUFCKA2/4p1Tr0L7/b8qYqym8gvXJkoaxUw7U3gW7vea
	xCZPjbEHnanJOn7sAj9Tzx5ZT707altN2Ar61H8lN3s+m8kavJws2fjooBWumtZHuXtcCkV4gOXJf
	iD1vJqwIQf+tiRI0LMo+uagwolKgNlqymw6LkiwX7R+e4G0/NurzcI1jrewgpw3t/ww0Nzc7097Jr
	C1b0D+Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdZp-0000000D7Hm-0UUt;
	Tue, 13 Oct 2026 14:34:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdZn-0000000D7GV-3I0i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 14:33:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 164DB60A59;
	Tue, 13 Oct 2026 14:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACEC11F000FF;
	Tue, 13 Oct 2026 14:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791902038;
	bh=yxkihl9morGXlwHlg5G3dnvtjqdsFp1JKoB8HwphYrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A/aP9m8K/ZBmiLTwBNRWMtDaOX2sADg9dRmLN7xT+o4x6zEOV5qeiq3+xEpz5pEMC
	 0rC0d3CPXHXrzVbjf7ApgOwOQi7mb2wbRXoPQjKEmhxYMt9SZKE3NpnzXhcoLfK/v7
	 APwhfoMfZFf8Tta+DunM49FZVFvuOIgoQSgjQwzEQOmaICPinyZOy0KxPgIakgp4tD
	 tqQmhpvG1agHKfsPm/r/NVqzlCLb6UxC7dOXtvw6wTqGi/ViyrtjU6blpmSZuPga0T
	 a9qXe+HtW8yZj/emolxRLKiymyem8Nqi6hc0hyrJos03WbqDjgNGuTLbvULZniugYs
	 4pA1AMEiZ274g==
Date: Tue, 13 Oct 2026 16:33:54 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"open list:FREESCALE IMX LPI2C DRIVER" <linux-i2c@vger.kernel.org>, "open list:FREESCALE IMX LPI2C DRIVER" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..." <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, vkoul@kernel.org
Subject: Re: [PATCH 1/1] i2c: imx-lpi2c: remove dmaengine_desc_free()
Message-ID: <as5BOk8aLCx_s6_T@zenone.zhora.eu>
References: <20260929190605.3516147-1-Frank.Li@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929190605.3516147-1-Frank.Li@oss.nxp.com>
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

Hi Frank,

On Tue, Sep 29, 2026 at 03:06:05PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> dmaengine_desc_free() is designed for DMA_CTRL_REUSE. If DMA_CTRL_REUSE
> is not set, dmaengine_desc_free() will return -EPERM.
> 
> 	if (!dmaengine_desc_test_reuse(desc))
> 		return -EPERM;
> 
> So calling dmaengine_desc_free() does nothing. dmaengine_terminate_(a)sync()
> will free all already allocated descriptors.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

pushed to i2c/i2c.

Thanks,
Andi

