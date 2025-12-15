Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAD3D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 09:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8y30agL/OBRJjiMvhgVLZeLhCOZuBHrLXQ/8fXbhbc=; b=P54XpMNVQFWvVk0QufyiUYhwZ1
	+OEf/VdGn+lzUMMYi1T4WsK+BWqy2eGjGxjQntkOnXL93h7BO6k727R/mNF4ITJUeru61WdJCARNW
	YZXKmDE6jCPDfdzPOBxKYl6bnlvJA1/Om8yN67QRLQMbZbup2Z2Hz+pCZmcs/bW1wCAKyhlzVQcMX
	5yOkzsl5acEFV/BuDX83unGOMw+zpMdfFNLumhluigbW+WPi3sLcOdDOzSb9N/kYnjVyf9VITbTqM
	vXBxztOonbb0waKqbvbZiDxc265W2KYRogncVmxl48RGGObn87NOdjtgtLqoxH1Spu4IiaPCWLlYa
	w2Q+4gFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV5EY-00000003Ora-0OCS;
	Mon, 15 Dec 2025 09:51:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV5EU-00000003OrA-1kB8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 09:51:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBF5A497;
	Mon, 15 Dec 2025 01:50:58 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 997013F73B;
	Mon, 15 Dec 2025 01:51:05 -0800 (PST)
Date: Mon, 15 Dec 2025 09:51:03 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Ma Ke <make24@iscas.ac.cn>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, stable@vger.kernel.org,
	suzuki.poulose@arm.com, mike.leach@linaro.org,
	alexander.shishkin@linux.intel.com, mathieu.poirier@linaro.org
Subject: Re: [PATCH v2 RESEND] coresight: etm-perf: Fix reference count leak
 in etm_setup_aux
Message-ID: <20251215095103.GA681384@e132581.arm.com>
References: <20251215022709.17220-1-make24@iscas.ac.cn>
 <c698d581-da15-42bf-9612-62f1bad66615@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c698d581-da15-42bf-9612-62f1bad66615@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_015110_545485_2D16B3F1 
X-CRM114-Status: GOOD (  19.03  )
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

On Mon, Dec 15, 2025 at 11:02:08AM +0200, James Clark wrote:
> 
> 
> On 15/12/2025 04:27, Ma Ke wrote:
> > In etm_setup_aux(), when a user sink is obtained via
> > coresight_get_sink_by_id(), it increments the reference count of the
> > sink device. However, if the sink is used in path building, the path
> > holds a reference, but the initial reference from
> > coresight_get_sink_by_id() is not released, causing a reference count
> > leak. We should release the initial reference after the path is built.
> > 
> > Found by code review.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 0e6c20517596 ("coresight: etm-perf: Allow an event to use different sinks")
> > Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> > ---
> > Changes in v2:
> > - modified the patch as suggestions.
> 
> I think Leo's comment on the previous v2 is still unaddressed. But releasing
> it in coresight_get_sink_by_id() would make it consistent with
> coresight_find_csdev_by_fwnode() and prevent further mistakes.

The point is the coresight core layer uses coresight_grab_device() to
increase the device's refcnt.  This is why we don't need to grab a
device when setup AUX.

> It also leads me to see that users of coresight_find_device_by_fwnode()
> should also release it, but only one out of two appears to.

Good finding!

Thanks,
Leo

