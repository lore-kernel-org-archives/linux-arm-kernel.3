Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2E4106703C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHbUooFMvANOZ5eEmxR11NQpXOt5Yepk2Tb3aJhTApE=; b=c5MQ6vvBCqoh/dgZWoJJ6p6iTg
	ozQinQ40fthU4ojNH4NSvEd4m4P/4OShFiu2190dDdeaSGNFDA617MnCszH1OjpqIMl5GSr2r2n9T
	UdEMupy6nrkmtdRvvqukftJ9lbjcnnh8KjOWmz6Rr9TJXmEazm7HnCTy/v2YC6EfvENV+SK4esK91
	ladOUKgIsSH5BuSwxpL2+nzbJYKg0b7fkAvMzi+FlPOB+7DQEJ1FMkcn4HOjb5ZxpWnS0eLSsVPWK
	6fjwSb2sMbIA+shF5Lt+2arjiSIlIe2dpYUJhFynfQhwHrTU3QDgmoVSvCB4rKvYTEGvFZW0BZwPT
	GNxI88Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hul-0000000EMzr-2JZx;
	Thu, 12 Mar 2026 15:25:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0huj-0000000EMzK-2HR4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 15:25:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 97D1B6012A;
	Thu, 12 Mar 2026 15:25:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E27C4CEF7;
	Thu, 12 Mar 2026 15:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773329128;
	bh=SPRgYaYcRXRx+Oi439MXJIfPzTvRSwq+RQAg9WxA+zI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=anlMdoQkbijqZRi0VJYy8JBbtdJ99d2UOvXTrDzEOVDqrazZ6mlhAWtuLSpH6Ikm7
	 6ImOvTMCoS58xXWPq/+6X/utGrHIGcvBwgk96I4N/ajMoIwKJWIDLfXvpsS3bO0Z83
	 +sJ9mXNCSi4hN0WN9fqqUgwL9IuxCYcvPync29cfTlZFa3ABCdAWQISQHK5TaAWJJG
	 /ufBzJ/KTQjmlykVtxvcWqUW4jpt4DPDvSNi277E2jEfIykcwedRIG5rdoPgu5jow+
	 qRhOZoI1kNCcfSBJr/EWkoLr8E1m2YGHlpDgWGAhs7hzhZ6qWc0W8GUpMzZu5smpht
	 3wfDkDTqtxj4w==
Date: Thu, 12 Mar 2026 15:25:24 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 5/7] arm_scmi: pinctrl: allow PINCTRL_REQUEST to
 return EOPNOTSUPP
Message-ID: <20260312-abstract-dazzling-herring-94de74@sudeepholla>
References: <cover.1773150895.git.dan.carpenter@linaro.org>
 <e10b198aa9ed7a9cda6d0e9033a00d1c700ecf9b.1773150895.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e10b198aa9ed7a9cda6d0e9033a00d1c700ecf9b.1773150895.git.dan.carpenter@linaro.org>
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

On Wed, Mar 11, 2026 at 10:39:03PM +0300, Dan Carpenter wrote:
> The SCMI protocol specification says that the PINCTRL_REQUEST and
> PINCTRL_RELEASE commands are optional.  So if the SCMI server returns
> -EOPNOTSUPP, then treat that as success and continue.
> 

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

I see Linus W has provided review tags too. Though I am assuming it will
go via some other tree as SCMI core change is tiny, just wanted to check
it explicitly so that there is no wrong assumption on my side.

-- 
Regards,
Sudeep

