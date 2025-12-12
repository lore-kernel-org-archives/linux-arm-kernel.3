Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFBBD4921F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 12:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j6u8X2UZKa5AxYd6jKX474JWOVEs/gjDA8ac2l5XM+o=; b=dN/s8pOrCkfSGKBBmR/C6K9rXu
	e6xPgL1Ui5OK+Aue6IXnnPPhq9CWuBg/d+4wGykWepS3f0hSFCwioG5+Yx6kDcvWLeY7B6KB0LMOi
	LElz7gFQNPi3wJdwrqjifKk5g5Nu3M8M2+kwxkiYim2Ln5rFRycBaX+X+BR4zYPgEzX0j2AqsuYQ2
	7zH+JwbrZNLj5L3hFXh9QM/dMobcN7Xqp0inkn6cdlao6mCbHBIQYCFARRfO+ViAqmbKDaejAbIez
	mAPH2FqKVuArlEORGpCmZ1yFUSKKEiuWcv8TZK6E1tfL7OZPwN2X9IumLtgW7QmEkwQ7YEFDqbVwM
	jcmhl/6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU2LF-00000000WiU-1njB;
	Fri, 12 Dec 2025 12:33:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU2LD-00000000WiB-1p37
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 12:33:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35F391063;
	Fri, 12 Dec 2025 04:33:38 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE4D23F762;
	Fri, 12 Dec 2025 04:33:43 -0800 (PST)
Date: Fri, 12 Dec 2025 12:33:40 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 10/17] firmware: arm_scmi: optee: Make use of
 module_tee_client_driver()
Message-ID: <20251212-rapid-vengeful-lionfish-85aef4@sudeepholla>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <537c48e3db243b5c68c3192179a948efb3a180c7.1765472125.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <537c48e3db243b5c68c3192179a948efb3a180c7.1765472125.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_043347_517098_62C8E404 
X-CRM114-Status: UNSURE (   8.63  )
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

On Thu, Dec 11, 2025 at 06:15:04PM +0100, Uwe Kleine-König wrote:
> Reduce boilerplate by using the newly introduced module_tee_client_driver().
> That takes care of assigning the driver's bus, so the explicit assigning
> in this driver can be dropped.
> 

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

