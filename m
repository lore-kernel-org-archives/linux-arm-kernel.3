Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FF3CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 07:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eBNgKNNk2NNtvMNclSC/XfautocVXf61NgAtMNczS/k=; b=YHfbqt9THLv+8mqTnKU4C6oGOI
	2yO9ma3ueQH3CjxZ3tHam5/ashV+pV5Tl274VVfrMpP4nndXfz5P9nRVJlJdQ9P+gGACl2OJhu85j
	rs6IdmexneDvzJJaz4Lkt6BX/GUm0O8QC68LWD8+O8a3UdgRXLSb6d6A0XBkHN2glJVDbt39Y0YW8
	iUlhnwsiYk09vMrOFOaRID3NPYu/I6oMqk3tg+owHBod8sgwHeHLrh5GObJLhIX8cm3VlEkqAJndc
	NOAcPtUDfeqMsHOX3hsup1evRNrQ5X5HZIcN8yKSruL/pXU6rbgc37d9nDK/x0d1y8N3tIsX1yBj7
	UGRSVCEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6OGW-00000003Kfs-1otS;
	Wed, 08 Oct 2025 07:07:12 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6OGS-00000003KfY-2u2C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 07:07:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 97674C03B5C
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Oct 2025 07:06:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDCD0606E5;
	Wed,  8 Oct 2025 07:07:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B149102F1CA4;
	Wed,  8 Oct 2025 09:06:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759907222; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=eBNgKNNk2NNtvMNclSC/XfautocVXf61NgAtMNczS/k=;
	b=khNh2FH98tNbjYfkWAKORU7PNO/K4DQaGVKeea3aWvvXF8RvK6y0qc+RxMbDVlpWvsqpIJ
	a10L3h7pAtjStGLdu4LxqiGySb38yOyELhaZR+GEd2A2y3D7cL8MU1puy8eec9IQLp6bv3
	JH+ambC9PBfy1ZZxWlelZet5R4rRYbnbVh9Zvc0jOM1KQpjq2+k00VrbKbMtUwrJG/OcMR
	YYZQC7AwFiaiwrPaBegTrXD5BelATJ2Q9dIsxk68l/nTS+N/Mx3eN90NjX1Lzt2yhJzVRj
	VcAacZ27C7P5rHh7knl8FalL92AQvqtUAusrM1jt7ulcoEKIcDCLENMeU7giuQ==
Date: Wed, 8 Oct 2025 09:06:52 +0200
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: Dharma Balasubiramani <dharma.b@microchip.com>, g@tpx1.home
Cc: William Breathitt Gray <wbg@kernel.org>, 
	Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>, linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] counter: microchip-tcb-capture: Allow shared IRQ for
 multi-channel TCBs
Message-ID: <ijigaljlomxtyoy6ha2czocr7gnjqfdxs6kuhg3w4jxlwj4cr5@yum4paorabnm>
References: <20251006-microchip-tcb-v1-1-09c19181bb4a@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006-microchip-tcb-v1-1-09c19181bb4a@microchip.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_000709_272605_B9198E5D 
X-CRM114-Status: GOOD (  16.46  )
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

On Mon, Oct 06, 2025 at 04:21:50PM +0530, Dharma Balasubiramani wrote:

Hello Dharma,

> Mark the interrupt as IRQF_SHARED to permit multiple counter channels to
> share the same TCB IRQ line.
>
> Each Timer/Counter Block (TCB) instance shares a single IRQ line among its
> three internal channels. When multiple counter channels (e.g., counter@0
> and counter@1) within the same TCB are enabled, the second call to
> devm_request_irq() fails because the IRQ line is already requested by the
> first channel.
>
> Fixes: e5d581396821 ("counter: microchip-tcb-capture: Add IRQ handling")
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
>  drivers/counter/microchip-tcb-capture.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
> index 1a299d1f350b..19d457ae4c3b 100644
> --- a/drivers/counter/microchip-tcb-capture.c
> +++ b/drivers/counter/microchip-tcb-capture.c
> @@ -451,7 +451,7 @@ static void mchp_tc_irq_remove(void *ptr)
>  static int mchp_tc_irq_enable(struct counter_device *const counter, int irq)
>  {
>  	struct mchp_tc_data *const priv = counter_priv(counter);
> -	int ret = devm_request_irq(counter->parent, irq, mchp_tc_isr, 0,
> +	int ret = devm_request_irq(counter->parent, irq, mchp_tc_isr, IRQF_SHARED,
>  				   dev_name(counter->parent), counter);
>
>  	if (ret < 0)
>
> ---
> base-commit: fd94619c43360eb44d28bd3ef326a4f85c600a07
> change-id: 20251006-microchip-tcb-edd8aeae36c4
>

This change makes sense, thanks !

Reviewed-by: Kamel Bouhara <kamel.bouhara@bootlin.com>

> Best regards,
> --
> Dharma Balasubiramani <dharma.b@microchip.com>
>

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

