Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5309CC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 06:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1oSBgoYfNOzoZBnBYgZmCcAIw6EdAM/KqcKm0iKAiHI=; b=MdZTPfs6eivspnmQG8XsZO8rOj
	k07Ufc/jN8/0z1xOD6SMrBTTHfQiCNKZz9tGONfTXNXA1bBA9Do4+1x5C86m5YOAO+C+wBxiEbTjP
	0HMIUx0ANlalaSUHWD9s3SaU0OK/IPUNnaE4/KPs6BpQTcqQGM+lDKX801pZOP2Kfm5zA08Nfgzo9
	zPYwLBAwOcM4/GKkkHi9o6o8V7p00uGpGIA8cr0wG+EmYarfMpbBf4Hl11tgvLn6A39ViSmeG34cV
	JgZsSGuaA1hmi0TtbjfGFuzaLcsx1TuSVTfDkZA/Nqg8zM8hP0yyMsaCgh2R7gKP8B/TS0078a0Vp
	IVgghEIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x213n-0000000GUzX-2G85;
	Thu, 03 Sep 2026 06:36:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x213l-0000000GUzR-23nH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 06:36:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EA91160218;
	Thu,  3 Sep 2026 06:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 563321F00A3D;
	Thu,  3 Sep 2026 06:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788417388;
	bh=1oSBgoYfNOzoZBnBYgZmCcAIw6EdAM/KqcKm0iKAiHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MH239CTiZgay0S7dLaw0NUlUNa4TH3unGis4leA3h2CZk5LP6mYoMM2Luzwliaa4U
	 6WIXdL72iHSuGskBN44fCLh8EvprRWx/N4sVvvQT/MOtJPwGrlXkKA0enKy+l09ZK2
	 7cqzNSfCq9fL+S4cYzRQnBBDP3SsZ4OqzQzTcUY3TzkeI6OCzcUOeidge5vucWHdQb
	 6eejC6aKvzXmSkgV8PEwZH+y/vbgKJ3aE4EOV1heD8ylVDZQpcbR97G+k1fTojANX/
	 IkwazoZPqZgqycX/yQYanApPMwe3YsSV5cwIW5pib4VPFhxnCxzVQ9w3WcCCDQhiHg
	 f9fKWFIGqi0qA==
Date: Thu, 3 Sep 2026 07:36:25 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>, kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 3/9] firmware: arm_scmi: Convert OF-only paths to
 generic fwnode in SCMI core
Message-ID: <20260903-infrared-bee-of-popularity-ede87a@sudeepholla>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
 <20260813-acpi_scmi_pcc-v3-3-cb6b88b4ebb3@kernel.org>
 <20260824103929.00004912@oss.qualcomm.com>
 <20260902-funky-tarsier-of-competence-0ae6ab@sudeepholla>
 <20260902162911.0000761f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902162911.0000761f@oss.qualcomm.com>
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

On Wed, Sep 02, 2026 at 04:29:11PM -0700, Jonathan Cameron wrote:
> On Wed, 2 Sep 2026 14:39:31 +0100
> Sudeep Holla <sudeep.holla@kernel.org> wrote:
> 
> > On Mon, Aug 24, 2026 at 10:39:29AM -0700, Jonathan Cameron wrote:

[...]

> > > 
> > > There are no early exits yet and I can't see any added later in the series.
> > > So the scoped bit is irrelevant.  I don't mind the change on basis of
> > > hardening or similar but it needs a comment in the patch description to 
> > > justify that.
> > >   
> > 
> > This is mainly to release the reference taken in
> > fwnode_get_next_available_child_node(). It is taken explicitly via
> > fwnode_handle_get() before scmi_create_protocol_devices() as discussed
> > below.
> 
> When the loop continues to normal termination the puts are all there
> anyway as part of the iterators.  The _scoped case just deals with
> early exits via break or return.

You're right. For some reason I conflated the iterator-owned reference 
won't be released and _scoped version is needed. This loop has no early
exit, so I will use the non-scoped iterator here. Thanks again.

-- 
Regards,
Sudeep

