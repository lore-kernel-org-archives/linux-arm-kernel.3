Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D02DC5AE49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 13:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNoH/sMk/2phjmPlNsvvv4dT3rRnokFTlPJkTxXpUOY=; b=QYLddLsFOF4inef0v52e9YgdmT
	d6ne/IK+yfWN1Me7bu7e71x1S8J4tT5iljPGLFPZnzrZq6kUQorAxm4ust1frXzKHvJaxh23nTOts
	ntmmbG0q0q4qRoK50qH2VZp+yw7YPTs5S4A9Nu5XZLWEBlFyrixOZMJKa6B+F7qPudcwXm9mubxEp
	+PM5uw1YGdDqX34x1bNVdne5ExIqR5yYxU+uRiEVG2GcIHH22KZjkItVzk7E/gadM6BI8yCkFrWzk
	M49M/SJcmDDGPCvPRdGbzpPj9QLtlwyVwJkrX6MtPhsacE1TqyWyBXaOElivUQ6eJKzP3lVNpwXsK
	yrSC03jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQAf-0000000BufS-0VsN;
	Mon, 10 Aug 2026 13:36:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQAT-0000000BucB-02GT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 13:35:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3B6C1477;
	Mon, 10 Aug 2026 06:35:45 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B55813F632;
	Mon, 10 Aug 2026 06:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786368949; bh=991HfjnG6QbqkXDaoqknVpf0eV83dcGtzfTkULWDnW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fzZ91UK57kTdR2Ef94w96o0QEjTTIdkLtR5TrjLYYUymDnuoep0zcxLwSPCZqBq2v
	 /WhhmO/bx1xbKgv53Kzk6Wio2s2PHD6HdMQ0O+39vsRa0XTg5jqHFctPtBJYMzwnix
	 jbqKDeH739XPRiYNzgMx3dVujXp0ygb21wLMQ3gQ=
Date: Mon, 10 Aug 2026 14:35:38 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Fayssal Benmlih <Fayssal.Benmlih@arm.com>
Cc: Cristian Marussi <Cristian.Marussi@arm.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"d-gole@ti.com" <d-gole@ti.com>,
	"david@kernel.org" <david@kernel.org>,
	Elif Topuz <Elif.Topuz@arm.com>,
	"etienne.carriere@st.com" <etienne.carriere@st.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>,
	"james.quinlan@broadcom.com" <james.quinlan@broadcom.com>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"kas@kernel.org" <kas@kernel.org>,
	"kernel-team@meta.com" <kernel-team@meta.com>,
	"leitao@kernel.org" <leitao@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Lukasz Luba <Lukasz.Luba@arm.com>,
	"michal.simek@amd.com" <michal.simek@amd.com>,
	"peng.fan@oss.nxp.com" <peng.fan@oss.nxp.com>,
	Philip Radford <Philip.Radford@arm.com>,
	"puranjay@kernel.org" <puranjay@kernel.org>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	"sudeep.holla@kernel.org" <sudeep.holla@kernel.org>,
	"usama.arif@linux.dev" <usama.arif@linux.dev>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>
Subject: Re: [PATCH v7 03/23] firmware: arm_scmi: Introduce protocol instance
 notifiers
Message-ID: <annTqkEfL2hqcKFw@pluto>
References: <20260802145618.1952804-4-cristian.marussi@arm.com>
 <B5F86BAB-83E2-4C54-BEC9-7714C865CB7D@contoso.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B5F86BAB-83E2-4C54-BEC9-7714C865CB7D@contoso.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_063553_147554_345EBC3C 
X-CRM114-Status: GOOD (  18.44  )
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

On Mon, Aug 03, 2026 at 11:52:05PM +0100, Fayssal Benmlih wrote:
> Hi Cristian,
> 

Hi,

> A couple of notifier lifetime issues inline.
> 
> > 	scoped_guard(mutex, &info->protocols_mtx) {
> > 		pi = idr_find(&info->protocols, protocol_id);
> > 		if (WARN_ON(!pi))
> > 			return;
> >
> > 		proto_notifier_nb = pi->pno.nb;
> > 		/* Ensure NULL is visible */
> > 		smp_store_mb(pi->pno.nb, NULL);
> > 	}
> >
> > 	if (proto_notifier_nb) {
> > 		int ret;
> >
> > 		ret = scmi_protocol_notifier_unregister(pi->handle,
> > 							&pi->pno);
> > 		if (ret)
> > 			dev_err(handle->dev,
> > 				"Failed to release protocol notifier\n");
> > 	}
> >
> > 	guard(mutex)(&info->protocols_mtx);
> > 	if (refcount_dec_and_test(&pi->users)) {
> 
> The notifier is cleared and unregistered before decrementing the protocol
> users refcount. If the protocol instance has multiple users, the first
> user that releases it removes the protocol implementation's notifier even
> though the instance remains active for the remaining users.
> 

> Should notifier removal happen only when the final protocol reference is
> released?
> 

Yes, but it is not so easy to do given the current notification handlers
design (that I did :P) since notifier were not supposed to be used from
within a protocol, till Telemetry...so the attempt is to fit (cleanly)
this new use-case into the existing SCMI Notification framework..since
99% of the related handling is the same....I have reviewed this logic
in V8, improved I think, but still Sashiko has some complaints...

> The ordering may need to be reworked so the final-reference decision and
> clearing of pno are made under protocols_mtx, while the potentially
> blocking notifier unregister operation is performed without freeing the
> protocol instance underneath it.
> 

Cannot be done holding the mutex with the current design...

> > 	if (proto_notifier_nb) {
> > 		int ret;
> >
> > 		ret = scmi_protocol_notifier_register(pi->handle, &pi->pno);
> > 		if (ret)
> > 			dev_warn(handle->dev,
> > 				 "Failed to register protocol notifier\n");
> > 	}
> 
> If registration fails, pi->pno.nb remains populated. Future acquisitions
> of the existing protocol instance do not retry registration, while release
> later attempts to unregister the notifier even though registration never
> succeeded.
> 
> Please either clear the stored notifier on registration failure or track
> registration state separately and provide a defined retry/error path.
> 
Reviewed all of this in V8.

Thanks,
Cristian
> 

