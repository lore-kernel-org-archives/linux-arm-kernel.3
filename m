Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B532F506E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 14:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eS/mr2AhnSnjZg0tuXXEbdtbXsCzFrRvvvqkB8Uw2iY=; b=ydWOXP280Dla1DOzqZhhIR4Dve
	h9j35KzI3+u8/TPO7zVIbrgU/vl4xFhuL8Gw+A6FSiROa96axRklv8dBtJ5q376cBK65Cd7BbBN6i
	96fpEen8pWhI3G9tFfXvAHxCp7miVYDZwJw70nPy+YKeMsOZUI/gp1WEj7mFI2XtomhPF+9CTkJkw
	YvGbaNS+h1Hex4UVK8zAdejNhDhqoO+RcjLKEhPlaVaA3xU2bMtC99y4KwFuBeFSDb6yGRqMaEeVU
	jzrUxlew0lUZgZ1JkcCITZEjovmOy/1sOzy0ZZNBro6bd8Bz7amttKIQVX4yMMrTLm7n7l3TL4atd
	8mb/9VJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w295c-00000004CNU-2Etk;
	Mon, 16 Mar 2026 14:38:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w295Z-00000004CLR-0P8O
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 14:38:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eS/mr2AhnSnjZg0tuXXEbdtbXsCzFrRvvvqkB8Uw2iY=; b=AIxjgsuAr6ffuRLEE0LDezD48B
	BsfxyQ+mxjiMSGQpXuiiFue1rWTVqkm+sN3fVDNTPZOVAcYHcG/13ZdNnIouuw/MpJL85932klyuQ
	zfR9eAedo6lqCXAlc7irAs8SquxU5kFNvC81j1VU8wrlYFPe1HPvEjfSNKM0KwkW+hGGdZMFwnTDP
	kZTNmTFTm+0Ax6/6HFvOwTjDik3pBfOZRJ3WKpVtT/yAMC8rpdwH6+BWgKc6Io5NK3PX6VVxquen8
	aK/p9zLNXcWfgOc0nC98zYKr5Ir+LkwK3zjSGpxEafVAaHXhRxMvdDGNzwWrkRoMlC04e9dHWfoc3
	QNroSZig==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w295V-00000006y9u-42jW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 14:38:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E35214BF;
	Mon, 16 Mar 2026 07:38:24 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 662BC3F73B;
	Mon, 16 Mar 2026 07:38:30 -0700 (PDT)
Date: Mon, 16 Mar 2026 14:38:28 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 02/19] coresight: Set per-CPU source pointer
Message-ID: <20260316143828.GE8048@e132581.arm.com>
References: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
 <20260305-arm_coresight_path_power_management_improvement-v6-2-eff765d211a9@arm.com>
 <4dd1e996-5098-4b03-af0f-98294fdca908@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4dd1e996-5098-4b03-af0f-98294fdca908@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_143834_255194_37236FEA 
X-CRM114-Status: UNSURE (   8.48  )
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

On Fri, Mar 13, 2026 at 11:18:20AM +0000, Suzuki K Poulose wrote:

[...]

> >   static struct coresight_device *coresight_get_source(struct coresight_path *path)
> >   {
> >   	struct coresight_device *csdev;
> > @@ -1401,6 +1452,8 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
> >   	mutex_unlock(&coresight_mutex);
> > +	coresight_set_percpu_source(csdev);
> > +
> >   	if (cti_assoc_ops && cti_assoc_ops->add)
> >   		cti_assoc_ops->add(csdev);
> > @@ -1427,6 +1480,7 @@ void coresight_unregister(struct coresight_device *csdev)
> >   	if (cti_assoc_ops && cti_assoc_ops->remove)
> >   		cti_assoc_ops->remove(csdev);
> > +	coresight_clear_percpu_source(csdev);
> 
> Should these be done with the mutex lock held ?

If so, we will create a locking chain:

  coresight_mutex -> cpus_read_lock()

Afterwards in patch 18, it uses cpus_read_lock() to protect sysfs knobs,
a reversed locking chain will be established:

  cpus_read_lock() -> coresight_mutex

LOCKDEP will complain for possible deadlock.  This is why this patch
avoids to acquire mutex when set / clear per CPU sources.

> >   	mutex_lock(&coresight_mutex);
> >   	etm_perf_del_symlink_sink(csdev);
> >   	coresight_remove_conns(csdev);
> > 
> 

