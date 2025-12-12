Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C71D4921F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 12:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQ8l6DJEv7InDQiYmUi0HoQmE9KQSAJfFJJcYCfYawM=; b=eIJaaIFc+vpCZpjiOP3CfnCjWU
	5a39qdI+suReoNCC4FHFWoACPqcXXK6Y9pfqVMItLis1QNT0U6ywOPqc3Jx0SmKzNzqyS+TCgHibf
	D0XUUsQ2CaV8A1l2/sEkN08Xbt/h1Q9YMVE2xZIFddkpyp+Rl9NJ+LgGy9QI7LE4v0zNzuEtJHrIo
	1mvIIf6eNLjrHGkvxL/VFd/CA9jnikzFp4jzI3AwpqmiEnRLm5sikSATuwhj2Lu6B0pLuKs9FVili
	a/33BjQNiNt0k5QVwYZiPeICG92yzZBxx4kubJloJecSCouFSOOZD/Uz8tB3L61NFRdbdJ7hK8CjF
	UshwTMgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU2Lm-00000000WoL-1EJS;
	Fri, 12 Dec 2025 12:34:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU2Lk-00000000WnQ-2fN2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 12:34:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDC9C1063;
	Fri, 12 Dec 2025 04:34:12 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8467C3F762;
	Fri, 12 Dec 2025 04:34:18 -0800 (PST)
Date: Fri, 12 Dec 2025 12:34:15 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 11/17] firmware: arm_scmi: Make use of tee bus methods
Message-ID: <20251212-cuddly-viridian-armadillo-be28fe@sudeepholla>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <46dae3cada663b3a5ae1989881d9e74ef40acce5.1765472125.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46dae3cada663b3a5ae1989881d9e74ef40acce5.1765472125.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_043420_707614_ADF47546 
X-CRM114-Status: GOOD (  10.14  )
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

On Thu, Dec 11, 2025 at 06:15:05PM +0100, Uwe Kleine-König wrote:
> The tee bus got dedicated callbacks for probe and remove.
> Make use of these. This fixes a runtime warning about the driver needing
> to be converted to the bus methods. Note that the return value of .remove()
> was already ignored before, so there is no problem introduced by dropping
> the error returns.
> 

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

