Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0223E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 06:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXTnzO1XZ2VddqzjxnlaUzrpeuKoS+bHl85A8NmfDSY=; b=qjqUvaY4kpSM5rk/BshMC6cIPp
	7j+hjE7NzzAsVG+SV1ov6wNB8MfzLV3CO9r2pYnt6nHROxagqv8c4At5oTZGLAXP7Dr2KldJlsT27
	r05k/gqa/0ZLAtbhhnEhubPvacV5VKRj2eul5u4oaOfqh9ZrqhM904NZFkLtg+Jg3DPm8B3LcLOJQ
	aW03y2rgJUlHwDfpbRkNQ77aEwuukzjl1EGNrckMPmUoWqUWvAHXSpEuCcDo5x+oOhQ7MK4tvZ2lJ
	W5jp3ZhWwCGuyMWW+t0++6jBYXZiM36WrdRdtPjTzp8wQwjxG8Twg0sCa0scTxYvn/GrEQuhmhdz2
	m1/FDooA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJS9G-00000000jcS-2SWF;
	Fri, 06 Dec 2024 06:49:10 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJS8E-00000000jWf-1uWB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 06:48:08 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 67060114016E;
	Fri,  6 Dec 2024 01:48:02 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 06 Dec 2024 01:48:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1733467682;
	 x=1733554082; bh=MXTnzO1XZ2VddqzjxnlaUzrpeuKoS+bHl85A8NmfDSY=; b=
	B5Zxev0615rfInbbM8O/2wHlNzygAM3f4XoIYu8QItHfWEwDVhZOO9cCCMoR8VXh
	w/uD+ZkO+fZQjtbCIdzVwtvg1JvS7Hs9F2+oQvB0BLLbwqjKbciGjIgIShCV/sYH
	G7G67H3dwHCrr9DQfCPPnXuWS4fvoAkkyFe3G0LjoJPO7BgUDc2Jv0AHY7G8+vsP
	g0a5AtBEArec58w4p3yhv+cF+ruAURKfB7LaSPZu/ZgMs2C/ApFZB1WmOXhg1woD
	lXGw7WVUqiVIRnTzU7DjA6QCvdMLXmvJsP+4FA40snC3QP7GM9JIdsvWvORkAdVs
	tnmLyeWdkCPfrgzpMWbKvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1733467682; x=
	1733554082; bh=MXTnzO1XZ2VddqzjxnlaUzrpeuKoS+bHl85A8NmfDSY=; b=F
	Ejy8jmCDiD6FwMT5K7rHQJ8R8P3166Jsms31AxIquKxq/20/XPbwpTrMeHfFFVzh
	/ia/xHJVgWghbnXHMDT1kul1CCEhlPcv6CP7t2aEryjDja0UO1qO25R3keh+Y8xV
	MmEC88UDJ7WG4TlVHU1vlXM28j1BdBJlDU8s4gY4CLpObRplTJKvuLKzDjLOLveM
	0QKvsFiyIoGvyZm5TrVGiB+zWFST4u5dPfq+GydncyeX/KYgxJEq2TK6mjpzp0CS
	hYMyUD4d7hJM7zWgcXSQzZ9aRLu0bVqhtC3mqd4klfjY9JOnMJXr6H5pa9tWtJ2U
	Q7qw4/Ev0sWNe6HLnjfZg==
X-ME-Sender: <xms:IZ5SZzCGJx7AAEz16aZ4CNjS5ecbseDHkIOirhww-rmVmznXIHokVA>
    <xme:IZ5SZ5hemfXp8tdYm-Hjs-1Huj9ZGRcrCBUtSUlaWahdaO3hDh0ogh4wYM3zfcdHC
    ge9-O6w8l6SzR8dFjY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrieekgdelkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffg
    vedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedukedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepkhgvrhhnvghlqdhtvggrmhesrghnug
    hrohhiugdrtghomhdprhgtphhtthhopeifihhllhhmtghvihgtkhgvrhesghhoohhglhgv
    rdgtohhmpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshhes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgdrughrrghsiihikheslhhinh
    grrhhordhorhhgpdhrtghpthhtohepuggrnhhivghlrdhlvgiitggrnhhosehlihhnrghr
    ohdrohhrghdprhgtphhtthhopehpvghtvghrrdhgrhhifhhfihhnsehlihhnrghrohdroh
    hrghdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrgh
X-ME-Proxy: <xmx:IZ5SZ-kuyljmTwbW46smaKAIlhw1f8J9dTGwct-_fRW_2bgzKRp1dQ>
    <xmx:IZ5SZ1y76gU_3p-q-FQLa0Vs3szN9McrP7Wo8TzzdpCONgY5frXYRA>
    <xmx:IZ5SZ4QyWia5MJfYpAe-gKQWR1fl0muHRIl-hYCZH8-dfcB9t45u5g>
    <xmx:IZ5SZ4a2YOhUyvflEDFMZTrMWF8ghVxwda_xcralOHPCll624rEy1A>
    <xmx:Ip5SZ6FrmFlB7gs9EvcXlJmWImgkyaz8WymObdXCZUjoGaFwgXVeddxu>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2DBFB2220072; Fri,  6 Dec 2024 01:48:01 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 06 Dec 2024 07:47:40 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "Rob Herring" <robh@kernel.org>, krzk+dt@kernel.org,
 "Conor Dooley" <conor+dt@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 kernel-team@android.com, "William McVicker" <willmcvicker@google.com>,
 "Peter Griffin" <peter.griffin@linaro.org>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Vincent Guittot" <vincent.guittot@linaro.org>,
 "Ulf Hansson" <ulf.hansson@linaro.org>
Message-Id: <427caa87-b9ba-4797-88bd-a18a96eefdcf@app.fastmail.com>
In-Reply-To: <20241205175345.201595-3-tudor.ambarus@linaro.org>
References: <20241205175345.201595-1-tudor.ambarus@linaro.org>
 <20241205175345.201595-3-tudor.ambarus@linaro.org>
Subject: Re: [PATCH v3 2/3] firmware: add exynos ACPM protocol driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_224807_107996_08E447B9 
X-CRM114-Status: GOOD (  20.95  )
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

On Thu, Dec 5, 2024, at 18:53, Tudor Ambarus wrote:

> +#define exynos_acpm_set_bulk(data, i)					\
> +	(((data) & ACPM_BULK_MASK) << (ACPM_BULK_SHIFT * (i)))
> +#define exynos_acpm_read_bulk(data, i)					\
> +	(((data) >> (ACPM_BULK_SHIFT * (i))) & ACPM_BULK_MASK)

Could these be inline functions for readability?

> +	cmd[3] = (u32)(sched_clock() / 1000000); /*record ktime ms*/

The comment does not match the implementation, sched_clock()
is probably not what you want here because of its limitiations.

Maybe ktime_to_ms(ktime_get())?

> +/**
> + * acpm_get_rx() - get response from RX queue.
> + * @achan:	ACPM channel info.
> + * @xfer:	reference to the transfer to get response for.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int acpm_get_rx(struct acpm_chan *achan, struct acpm_xfer *xfer)
> +{
> +	struct acpm_msg *tx = &xfer->tx;
> +	struct acpm_msg *rx = &xfer->rx;
> +	struct acpm_rx_data *rx_data;
> +	const void __iomem *base, *addr;
> +	u32 rx_front, rx_seqnum, tx_seqnum, seqnum;
> +	u32 i, val, mlen;
> +	bool rx_set = false;
> +
> +	rx_front = readl_relaxed(achan->rx.front);
> +	i = readl_relaxed(achan->rx.rear);

If you have to use readl_relaxed(), please annotate why,
otherwise just use the normal readl().  Is this access to
the SRAM?

> +	spin_lock_irqsave(&achan->tx_lock, flags);
> +
> +	tx_front = readl_relaxed(achan->tx.front);
> +	idx = (tx_front + 1) % achan->qlen;
> +
> +	ret = acpm_wait_for_queue_slots(achan, idx);
> +	if (ret) {
> +		spin_unlock_irqrestore(&achan->tx_lock, flags);
> +		return ret;
> +	}

It looks like you are calling a busy loop function inside
of a hardirq handler here, with a 500ms timeout. This is
not ok.

If you may need to wait for a long timeout, I would suggest
changing the interface so that this function is not allowed
to be called from irq-disabled context, change the spinlock
to a mutex and polling read to a sleeping version.

> +	/* Advance TX front. */
> +	writel_relaxed(idx, achan->tx.front);
> +
> +	/* Flush SRAM posted writes. */
> +	readl_relaxed(achan->tx.front);
> +
> +	spin_unlock_irqrestore(&achan->tx_lock, flags);

I don't think this sequence guarantees the serialization
you want. By making the access _relaxed() you explicitly
say you don't want serialization, so the store does
not have to complete before the unlock.

> +static const struct of_device_id acpm_match[] = {
> +	{ .compatible = "google,gs101-acpm-ipc" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, acpm_match);
> +
> +static struct platform_driver acpm_driver = {
> +	.probe	= acpm_probe,
> +	.driver	= {
> +		.name = "exynos-acpm-protocol",
> +		.of_match_table	= of_match_ptr(acpm_match),

Remove the stray of_match_ptr() here.

> diff --git a/drivers/firmware/samsung/exynos-acpm.h 
> b/drivers/firmware/samsung/exynos-acpm.h
> new file mode 100644
> index 000000000000..a03adcd260f5
> --- /dev/null
> +++ b/drivers/firmware/samsung/exynos-acpm.h
> @@ -0,0 +1,15 @@
> +#ifndef __EXYNOS_ACPM_H__
> +#define __EXYNOS_ACPM_H__
> +
> +struct acpm_handle;
> +struct acpm_xfer;
> +
> +int acpm_do_xfer(const struct acpm_handle *handle, struct acpm_xfer 
> *xfer);
> +
> +#endif /* __EXYNOS_ACPM_H__ */
> diff --git a/include/linux/soc/samsung/exynos-acpm-protocol.h 
> b/include/linux/soc/samsung/exynos-acpm-protocol.h
> new file mode 100644
> index 000000000000..762783af7617
> --- /dev/null
> +++ b/include/linux/soc/samsung/exynos-acpm-protocol.h

Why is this in include/linux/soc, and not in the firmware
header?

      Arnd

