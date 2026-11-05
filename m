Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5D7606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 18:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AR433Ht3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=TEQJ7fVw;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=a4JErDSf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JMRH0CoDrno3e90+zIv2xxnEJQWV/B/Z4nMGkkCHCOY=; b=AR433Ht3YjPzmg+DUIRx+iEKAW
	X1OK8fi++qVFxHfvmkkvsK4MtdwPkdwC2/30B18wkc07+tJ/KyYPEBqao0Z+GWrIvtx+a8cHbdtB1
	97Xkr5fCcV70DzTYWrtJtMZ9pgvgQT4jpx6IFFoY4vQobGjRN5al9aZp2B3sO9J6xq7nMatNTe+Yr
	7/oztQLv4L2eYAcRIXGe5sO+2yw+b9T63ENQa+GCcu++NX15sQVcHwKdJ9GCycFY0D03I3QSp4DQ8
	JZ9jR3MMozJKbpE9MHb8sh2opef8HDYckDBR50RTGC3EdJguvFemxdxiKSUnkhcTLIrgucMvqjUJK
	0/jvXDHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2Fa-0000000A90M-0KCw;
	Thu, 05 Nov 2026 18:31:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2FS-0000000A8x7-1oZs
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 18:31:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JMRH0CoDrno3e90+zIv2xxnEJQWV/B/Z4nMGkkCHCOY=; b=TEQJ7fVwZOn578wxoCiVu2sekZ
	rb4tcOexa3nyzzEkox71AmLfIuyVJ0gCbWb32/1j7YVlqdlNE+mce8pcEciEwIACLskySM4xmdYBP
	EyUPzPPG1HJ5nut9tWXknSAcsdQb9bwcB6rugkif8yHB1rfgYr982nz9npOG/QtqymvSZJ2GnuzOD
	f0HNYRRhgWYKnb0sv5P4PKlFsB8vBP0rdmvI7SyI4or1avcmXiCwT1kNZEI2Z7EvWb13gFiKlxwAf
	617U5t1uGfGovqYcMrKEaR+3bhpeb1EweKBmSa569HPTKnAXgiuVmit3Nn6nxJUgciNrSx/Z3p30Z
	QSuHHNdg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2FP-00000003PRY-0o3B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 18:31:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62F88168F;
	Thu,  5 Nov 2026 10:31:33 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9BF13F632;
	Thu,  5 Nov 2026 10:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793903496; bh=0Z3Agz0b4/iSjEmrZUD6ZchKmlwnowHnlYZI794XMME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a4JErDSfU2sjmAHLm0HnZlPtUm1p4E7uRg1lHUyHBLDK6cMpUiskYxCzpzRS2BcHf
	 AA4KAFoQc//xaclfP7pKbOrNrmUy/IlxbogdTWmmRdtaNoeOWXWYHHRXyc8ygZohW0
	 1gJS1pDdwLuiKr2Da0I3q2Bxppv7TBlmFu9nw7b4=
Date: Thu, 5 Nov 2026 18:31:29 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
	sudeep.holla@kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
	philip.radford@arm.com, david@kernel.org,
	souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v14 04/32] firmware: arm_scmi: Introduce protocol
 instance notifiers
Message-ID: <auzLgZ17_1D5fpmP@pluto>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
 <20261016185553.2794459-5-cristian.marussi@arm.com>
 <20261019140203.00000f2a@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019140203.00000f2a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_183139_289969_FE57E1A0 
X-CRM114-Status: GOOD (  15.54  )
X-Spam-Score: -2.5 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 02:02:03PM -0700, Jonathan Cameron wrote:
> On Fri, 16 Oct 2026 19:55:25 +0100
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > SCMI Protocol notifications are typically used by SCMI drivers to detect
> > and react to particular conditions: this was the assumption and the classic
> > usage scenario upon which the SCMI notification framework was built.
> > 
> > Some protocols like Telemetry, though, could be interested in enabling and
> > registering for such notifications: in such a scenario each initialized
> > protocol instance could want to register a common protocol notifier.
> > 
> > In order to reuse the existing SCMI Notifications machinery, allow
> > protocols themselves to register for their own notifications and provide
> > their own notifier callbacks.
> > 
> > Each protocol, at the end of its initialization phase, can now provide one
> > unique per-protocol-instance notifier block, which will be registered, by
> > the core SCMI stack, on the related notification chain: such notifier will
> > be automatically removed during the protocol de-initialization phase.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> Whilst I'm not that familiar with this code, it seems fine to me
> (i.e. needs more eyes despite the tag)

...indeed Sashiko found a few races in some awkward and rare, albeit possible,
scenarios...despite being functional and tested as it is as of now, it
will need a bit more reasoning.

Thanks,
Cristian

