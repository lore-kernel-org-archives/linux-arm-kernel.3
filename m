Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51867C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 14:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bu+pyXFj7sNLmakQmL0jFnSTt/DRNrTkdOpW8RUv1Ys=; b=2FpFU/nyQP9rq55JGzJo/MBWJd
	QlrtecSpuLK1wyIiExtxH1SUA4yf1NTHExDcRwJVW0ES4X02NnVayOl0MQTZAFdtU5uDo8CmlNQDR
	wP/PlauAa+Lkt1qWZO8aY3ScmP8YLgGvBeW4sD4tODUiP8W1JEFuYLe/BxPq7MjXTzojsoZzSPi/b
	05HZvSP8Vb+MGGO+KCZ7zJqKe5C+QnjDcTot4IKqDVoK4qHaxP7jekg/tNeOkeNSslmCZIiPPt3bX
	ktnsXisSaEa4+uaqG7xKRD2CAyiERwwZ0Nx4/a1nEJR2cVWZw/Fg8q7C/hTIFQrubq1Y220+bYk8I
	oXsLqtcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28Xg-0000000HWqU-0pnO;
	Thu, 03 Sep 2026 14:35:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28Xe-0000000HWqL-3sRc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 14:35:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3979043CE1;
	Thu,  3 Sep 2026 14:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B00C1F00A3D;
	Thu,  3 Sep 2026 14:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788446150;
	bh=bu+pyXFj7sNLmakQmL0jFnSTt/DRNrTkdOpW8RUv1Ys=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ZzXaRsxNnutDszNFcLFo1SYHliTv2hHPvo2KXqgu5dKjaPABNmpg4eUO+vELocjZE
	 3/2cfr47oG1DjtzLx7pilksYA1O+oxr6Mzyz/9s0wQr4aIJzEGqrKGGK/Krr6Jfd4q
	 04B7hNHnugDlgfH4mamFmBRLWllA4dGEHx2RrD4NSjU5R6xxte+NIQko85dCz0q/r8
	 /5Vr1NgdkxFLWcarrhcsTiSrsq9TiOBSmm98de7onNi7NjLX7rk3i3AFkNfaK1gNxl
	 WVBSPtWUcDVftZBwBC8t87KVU7lLfw2TBv8GVDD/sIJSyTv9Wj3N3jdSoxfx+KsUEi
	 W48TYRvVy53Pg==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v9 1/7] firmware: smccc: Add an Arm SMCCC bus
In-Reply-To: <20260903125718.GI4157646@nvidia.com>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-2-aneesh.kumar@kernel.org>
 <178794567779.4159892.8785590655735217125.b4-review@b4>
 <yq5ay0diyavw.fsf@kernel.org> <20260903125718.GI4157646@nvidia.com>
Date: Thu, 03 Sep 2026 20:05:40 +0530
Message-ID: <yq5av78mxv0j.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Jason Gunthorpe <jgg@nvidia.com> writes:

> On Thu, Sep 03, 2026 at 02:22:51PM +0530, Aneesh Kumar K.V wrote:
>
>> I have updated the bus to match devices using func_id.
>
> Did you have any thoughts on how to handle ARM's versioning scheme
> too?
>
> I'm not sure what the rules are but it seems like if the major changes
> then the API is incompatible? So shouldn't every driver advertise a
> supported major, and the major be in the modalias and checked by match
> too?

I expect a single driver to handle the RSI features and determine the
version range it supports. I don't think we want multiple drivers, each
handling a different major version of the RMM release. Given that,
wouldn't it be sufficient for the driver's probe routine to check the
supported version range and return -ENODEV if it is unsupported?

-aneesh

