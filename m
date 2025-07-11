Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32591C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 14:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eb6ofrp0b4t0U9AgSUX6eSvI5BgLaaIZC3YfKofrBWI=; b=gwoJyXVASrIPa6+3FMj/tuUMDv
	AWw/1HL+2IStC4DjKubQNgx1n4z4ydZxOQu782W3HlLgaCnQBqxB1JLcp0apABo4dm+tjDUwF6brs
	QRSFRBcUlPGKN+KNLnayZ5hvWAHA1mV7znr6S7d6tgMfp+mVAFnesS0sIYXuyuoryVGBIgppuEE8Z
	xb1/G5SPwp3JHMuTRUkl41UCHxlg6FFqn4fQnJNsFwMFHGcq74NVDccgw3LWe36xsZy1KMOHbkwNP
	Y08wAQ7fFpYPWKXjk8khqNDyvg0oiND6Hs8kEkFq1CH2+KX8tzEcIWp9gVeozylDNqtpDv5KYSiaN
	zVOFo7pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaF7d-0000000F4XL-23Pv;
	Fri, 11 Jul 2025 14:53:09 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaF25-0000000F3We-0cDE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 14:47:26 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bdvfm31Byz6L5J0;
	Fri, 11 Jul 2025 22:46:24 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 9A5041402EF;
	Fri, 11 Jul 2025 22:47:19 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 11 Jul
 2025 16:47:19 +0200
Date: Fri, 11 Jul 2025 15:47:17 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Qianfeng Rong <rongqianfeng@vivo.com>, <wsa+renesas@sang-engineering.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] i2c: busses: Use min() to improve code
Message-ID: <20250711154717.00000319@huawei.com>
In-Reply-To: <tinhpctintv5okjfdzljg4q6tnfmmcsohywy4oqxxaqzmti3r7@3otlpzbypemz>
References: <20250709042347.550993-1-rongqianfeng@vivo.com>
	<tinhpctintv5okjfdzljg4q6tnfmmcsohywy4oqxxaqzmti3r7@3otlpzbypemz>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_074725_328993_AEF74050 
X-CRM114-Status: GOOD (  15.32  )
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

On Thu, 10 Jul 2025 22:42:26 +0200
Andi Shyti <andi.shyti@kernel.org> wrote:

> Hi Qianfeng,
> 
> On Wed, Jul 09, 2025 at 12:23:46PM +0800, Qianfeng Rong wrote:
> > Use min() to reduce the code and improve its readability.
> > 
> > The type of the max parameter in the st_i2c_rd_fill_tx_fifo()
> > was changed from int to u32, because the max parameter passed
> > in is always greater than 0.
> > 
> > Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> > Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> > Suggested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>  
> 
> The 'Suggested-by' tag implies that the patch was suggested by
> Jonathan, which is not the case here. Jonathan reviewed the patch
> and proposed improvements, but the patch itself comes from you.
> 
> For this reason, I will remove the 'Suggested-by' tag. If
> Jonathan wants to add his Acked-by or Reviewed-by, I will gladly
> include it.

Trivial enough that I don't care ;)  Was a drive by review at
best.

Thanks for asking though.

J

> 
> Thanks, Jonathan, for the helpful reviews, and thanks to Qianfeng
> for promptly following up on the feedback.
> 
> Merged to i2c/i2c-host.
> 
> Thanks,
> Andi
> 


