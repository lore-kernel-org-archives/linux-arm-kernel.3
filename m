Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC871CC6B2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 07:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Igp77I4HPWD6rlzRsc6MstCiqT4nkd6a098N50Swjx4=; b=r/jsPwwDXz2sMooxt0m2/C50gb
	JvZXhE+U0OibRhrkL8yIyQbIN5ZvlGNIt82BOTbzuuwdQ+Lo1rdeaU40EnwMaE2sXVeBivuNhMzJR
	ehDAc+T7Fl+3u+9UHITiRmc3IQFsdtMQNHDoN4YgPJ8DqepQ3kasn60NBjpQLZNp4kZDmtqPVTz/C
	G5RUG00pAGlgFOU/0ozV67AjMYqiiTDwNq/QY3TJt7Ow3Pa3yZ6INTei26qGqaXViDPW2RYAGJRK7
	7os0FpPX0Sev9/8LeDsWLVbAEv0Z8nLEhBGrx0PPDeZryK+Q8cLxEb5SzFEliH3U1W4CMvbRGo014
	/Efq6gdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFU7-0000000H0P8-269y;
	Thu, 15 Oct 2026 07:02:39 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFU5-0000000H0OP-1phf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 07:02:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1792047753; bh=V7xLPt0z761xV7UQc+1KBUtoCxFh2IXPptNVmnOnvYg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b2OFyXMmVRbvWhnER25s9dGw8RpxgYcCClvCbRTbQuyTAZ8qoWQU+wmoScR0vNPIO
	 9/12rfww9LTSN9OO48sgMbP3MnISb1fYBCyZycVwJt0JXdcPFk+b8lfgYOPgcOSWyQ
	 akUu8l8aYjP6fQ0ZuoxBwfovCspzdEQClDOdvroQ5hsLV/nHNA0VfIKHaPbgqPIOW8
	 8sTB8ioF0KvlhEVXBPgQ3Q2ZDlMDBd6Q+OPc19PWL5UIP8Cf6IWY67Ri4nYBiMO1mh
	 GQvNinlYLVuwNFB84WgHA9MggSHA22JB0n/stJoWK5aI31ReEjewTb9fEFhSaQc8jR
	 8VeWm4RlOf2jA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 80113404DD3;
	Thu, 15 Oct 2026 07:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1792047753; bh=V7xLPt0z761xV7UQc+1KBUtoCxFh2IXPptNVmnOnvYg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b2OFyXMmVRbvWhnER25s9dGw8RpxgYcCClvCbRTbQuyTAZ8qoWQU+wmoScR0vNPIO
	 9/12rfww9LTSN9OO48sgMbP3MnISb1fYBCyZycVwJt0JXdcPFk+b8lfgYOPgcOSWyQ
	 akUu8l8aYjP6fQ0ZuoxBwfovCspzdEQClDOdvroQ5hsLV/nHNA0VfIKHaPbgqPIOW8
	 8sTB8ioF0KvlhEVXBPgQ3Q2ZDlMDBd6Q+OPc19PWL5UIP8Cf6IWY67Ri4nYBiMO1mh
	 GQvNinlYLVuwNFB84WgHA9MggSHA22JB0n/stJoWK5aI31ReEjewTb9fEFhSaQc8jR
	 8VeWm4RlOf2jA==
Message-ID: <78abcf21-e5ff-4d5e-b1cb-d76bc1536892@mleia.com>
Date: Thu, 15 Oct 2026 10:02:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: lpc32xx: check devm_gpiochip_add_data() return
 value
To: Jayaraj Devaraj <jayarajdmit@gmail.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261014204331.15383-1-jayarajdmit@gmail.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20261014204331.15383-1-jayarajdmit@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20261015_070233_546195_8F2CF9D4 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message. 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_070233_546195_8F2CF9D4 
X-CRM114-Status: UNSURE (   8.21  )
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

On 10/14/26 23:43, Jayaraj Devaraj wrote:
> lpc32xx_gpio_probe() registers each gpio chip with
> devm_gpiochip_add_data() but ignores the return value. If registering
> a chip fails, probe still returns 0, so the driver binds with a chip
> missing and no error is reported.
> 
> Check the return value, print an error naming the failing chip and
> return the error code. Chips registered earlier in the loop are devm
> managed and are removed automatically on failure.
> 
> Signed-off-by: Jayaraj Devaraj <jayarajdmit@gmail.com>

Thank you for the change!

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

-- 
Best wishes,
Vladimir

