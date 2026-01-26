Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE958D19501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 16:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zkg8yo9frCHt3AEHe9zzypPy8xjGFU1UMRNY4eNhQHc=; b=XuNGsTxbSEO2HKxn/drBY601bC
	T40d1jNbhlpMhz1d63K2TO3d6l5k2k4gvMt+NehiX+K6e3KhzESLv3DKDSEofrwwVqU0xolEopDxG
	a1KQo/StgmO2/tYf4DZeGYWW0YJINbAiAxiKK9N9ojbn0TLjna61k4Rn2DuJ7yzDkNDNr623WfOZs
	Zb45GUFjnf6l3NBZ1MPD/Ql0hE35NY06U5fp3onuL9XX19xy7gsa/0ar2jwTL1lc4V/MenJHUPSJ7
	i+ReBstdd9LcwDNKyEP4oB2ydFelzujiKgogbdfv2yHczdsCr0ZOfFB3ZsFx6TCYjLUFXQTtcp0xZ
	jWHu4tWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPIb-0000000Cqf1-2fBC;
	Mon, 26 Jan 2026 16:18:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPIZ-0000000CqeY-42kd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 16:18:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C773D339;
	Mon, 26 Jan 2026 08:18:35 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D38983F5CA;
	Mon, 26 Jan 2026 08:18:41 -0800 (PST)
Date: Mon, 26 Jan 2026 16:18:39 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Mao Jinlong <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/8] coresight: Fix memory leak in
 coresight_alloc_device_name()
Message-ID: <20260126161839.GC1339236@e132581.arm.com>
References: <20260126-arm_coresight_refactor_dev_register-v2-0-b5a3c0441c15@arm.com>
 <20260126-arm_coresight_refactor_dev_register-v2-1-b5a3c0441c15@arm.com>
 <062c51c2-082d-4771-83df-3e5bfa90927d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <062c51c2-082d-4771-83df-3e5bfa90927d@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_081844_041535_8D7B9044 
X-CRM114-Status: GOOD (  15.15  )
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

Hi Suzuki,

On Mon, Jan 26, 2026 at 03:48:28PM +0000, Suzuki K Poulose wrote:

[...]

> > @@ -1546,7 +1546,7 @@ char *coresight_alloc_device_name(struct coresight_dev_list *dict,
> >   	if (idx < 0) {
> >   		/* Make space for the new entry */
> >   		idx = dict->nr_idx;
> > -		list = krealloc_array(dict->fwnode_list,
> > +		list = devm_krealloc_array(dev, dict->fwnode_list,
> >   				      idx + 1, sizeof(*dict->fwnode_list),
> 
> This is wrong. This would mean, the array gets released when the "dev" goes
> away and thats not good. This is a per-driver list, not a per-device list.
> Also, please remember that, we need to keep that node alive
> when the device goes away, to make sure to allocate the same device name
> when if/it comes back.  May be, you could release the  list and array, when
> the "driver" goes away.

Indeed.  In next spin, I will to fix the leak in module exit.

Thanks for pointing this out.

Leo

