Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9EDC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qe/VHo0JpOcsH0dSANJYDgEFC/+HxxxcdtUQi76Gx1k=; b=l9xD62okkLemlXakNbi7oJh2BZ
	YzqyLpo7hraOdmTv4dBJ7xbV5QxmKmMCF9glXWjMRnnYOd/cBFnZigQb2zYLaUSiqdwc6/DskiMAd
	loHV6b6K9RP5W6UvDBlCF1yw8OVajfupeWzNgluKPFCXS0ulYwXj2COAik3clm5B6yeEleXuSBNBX
	+pvKxXCykblCQ6BmbxHhcN3irrI/ArOj84xgw+ySiWudDgGBCaADfFAF8zThmj2KztZfnuLLVUtTz
	AESJzvaf/NZRfAiSHSrwdylQ85KsR2s4yQPBm86MI1S+jo5ymcXegRHMq9+x5fQi9GzXe/+frzw1g
	1y8XCZsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojmC-00000005eZ7-0LSa;
	Tue, 28 Jul 2026 15:31:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojmB-00000005eYw-0PS9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:31:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B86194334F;
	Tue, 28 Jul 2026 15:31:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1AAB1F000E9;
	Tue, 28 Jul 2026 15:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785252686;
	bh=qe/VHo0JpOcsH0dSANJYDgEFC/+HxxxcdtUQi76Gx1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OLsjD2TlWP71fvKmSoATb2P+cUoB5VaaRUx18FrT+NJy7edgGKU5PI7+SB46bl1bc
	 BV27cTs1gwn73vujMlFTNp5U/7KUFGs+jzGuB0iW+6irht1rY7TK/77FxpcIGrRsxv
	 4c3CllsUWf9GUmvi0I5b2R9Y5Xldsz/ZyH9UN1kxpwqQswCmrlr+CLZuJkckv/moX2
	 ZeZF8wJ3MImVy/vLpo/Sq5ctYU8QYubnyBC0sJG0a2aJG9bpDEvpOfFlgRjxqH7jZa
	 aj4tAI9W4xs78tjFclcWxC08+4aANSHkvFUHEqdhBkRocKf0Wt6LUeVIcSXAo9gGvr
	 5r6dJ1TbvFyHQ==
Date: Tue, 28 Jul 2026 17:31:21 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: carlos.song@oss.nxp.com
Cc: Markus.Elfring@web.de, aisheng.dong@nxp.com, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Carlos Song <carlos.song@nxp.com>
Subject: Re: [PATCH v6 0/2] i2c: imx-lpi2c: fix probe error handling and
 reset controller
Message-ID: <amjLJuBPDA7TQqpR@zenone.zhora.eu>
References: <20260716071957.2670263-1-carlos.song@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716071957.2670263-1-carlos.song@oss.nxp.com>
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

> Carlos Song (2):
>   i2c: imx-lpi2c: properly unwind resources on probe failure
>   i2c: imx-lpi2c: reset controller in probe stage

merged to i2c/i2c-2.

Thanks,
Andi

