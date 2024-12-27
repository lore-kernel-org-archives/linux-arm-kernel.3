Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B78EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 00:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsCNlLrArzJoccppkpv+1qIBDRyKFdeDCzOUv5xdZqI=; b=uGVNzknM7SuCz27goumQW+suqB
	LpTKHM1do3xzZs7oXrEE4pbrHO3U9cMZ9JFBDugPEALMtGTbZEBHsf8YIS9NaAfFF2ZbbRXtvl6Nt
	lXO0VUjfl6N4rma6c2KkXG+KuLMnDvU76nsUaK577PwyWan5prH13BehCt+OfNMupjHfZ6YK481Xg
	hRSh3/l326IYpNo3DGjUOJc5iYtH+dAuht4vVPz/g1AvW8CMxlOdu4E7aOcOJS6oFR27txlofKQqu
	/quZafzOis6W9swP4nztjcCQhHW3q3bdKfpd56TBSJ8z1JytJVcobHnVOAX4U60jYDe0RfkrPsne7
	vJpVZrNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQyOF-0000000Gl0n-2rcE;
	Fri, 27 Dec 2024 00:39:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQyN3-0000000GkrB-1mUe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 00:38:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CCB975C5C43;
	Fri, 27 Dec 2024 00:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E51CC4CED1;
	Fri, 27 Dec 2024 00:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735259908;
	bh=QYzQx3fJtxFf/kFN+hqMx+i8Lscl27dsjoLsccZaqxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pdtl9TsNLp09G/nHT+TFIxQvhXeMRS++6sBC7JCR/0C8/v+HyAOrQcgY81ZoBwDuX
	 sag9tS+bHXFqNyFeralGwBzFUBydtZgeuWhwlWFEbm5w3kOjovSZgsB5841zQ/OLwy
	 TxNXfZM5QQajKBBMbAMBL0oRn0Sp7mQLjnG/oSzqYY0+xtnKcUBwVmBCvlO/IVLn8h
	 /ubzetD/Qr5zLk9mKqGTiV3pATBkNVpIrzUsZo4ALAlrQg0L/me1Ra70pxi4cCXGeM
	 M/NhEKZFFTeK2DMOCrB1bYkuf5jXgGdePvAx+PPHThgWm+S8mtj6WpM0JKNBs2EaTc
	 VzbN8nxqJQA0Q==
Date: Fri, 27 Dec 2024 01:38:23 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: carlos.song@nxp.com
Cc: aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, frank.li@nxp.com, linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v6] i2c: imx-lpi2c: add eDMA mode support for LPI2C
Message-ID: <ly7mzakvws75xcjncm6x24rie4xewt6ll4dlkz2kl5cblihi6n@7kivy2uqdwvp>
References: <20241125142909.1613245-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125142909.1613245-1-carlos.song@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_163829_511883_CC914116 
X-CRM114-Status: GOOD (  18.15  )
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

Hi Carlos,

On Mon, Nov 25, 2024 at 10:29:09PM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> Add eDMA mode support for LPI2C.
> 
> There are some differences between TX DMA mode and RX DMA mode.
> LPI2C MTDR register is Controller Transmit Data Register.
> When lpi2c send data, it is tx cmd register and tx data fifo.
> When lpi2c receive data, it is just a rx cmd register. LPI2C MRDR
> register is Controller Receive Data Register, received data are
> stored in this.
> 
> MTDR[8:10] is CMD field and MTDR[0:7] is DATA filed.
> +-----------+-------------------------------+
> |  C  M  D  |          D  A  T  A           |
> +---+---+---+---+---+---+---+---+---+---+---+
> | 10| 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
> +---+---+---+---+---+---+---+---+---+---+---+
> 
> MRDR is Controller Receive Data Register.
> MRDR[0:7] is DATA filed.
> +-------------------------------+
> |          D  A  T  A           |
> +---+---+---+---+---+---+---+---+
> | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
> +---+---+---+---+---+---+---+---+
> 
> When the LPI2C controller needs to send data, tx cmd and 8-bit data
> should be written into MTDR:
> CMD: 000b: Transmit the value in DATA[7:0].
> DATA: 8-bit data.
> 
> If lpi2c controller needs to send N 8-bit data, just write N times
> (CMD(W) + DATA(u8)) to MTDR.
> 
> When the LPI2C controller needs to receive data, rx cmd should be
> written into MTDR, the received data will be stored in the MRDR.
> 
> MTDR(CMD): 001b: Receive (DATA[7:0] + 1) 8-bit data.
> MTDR(DATA): byte counter.
> MRDR(DATA): 8-bit data.
> 
> So when lpi2c controller needs to receive N 8-bit data,
> 1. N <= 256:
> Write 1 time (CMD(R) + BYTE COUNT(N-1)) into MTDR and receive data from
> MRDR.
> 2. N > 256:
> Write N/256 times (CMD(R) + BYTE COUNT(255)) + 1 time (CMD(R) + BYTE
> COUNT(N%256)) into MTDR and receive data from MRDR.
> 
> Due to these differences, when lpi2c is in DMA TX mode, only enable TX
> channel to send data. But when lpi2c is in DMA RX mode, TX and RX channel
> are both enabled, TX channel is used to send RX cmd and RX channel is
> used to receive data.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Frank Li <frank.li@nxp.com>

merged to i2c/i2c-host.

Thanks,
Andi

