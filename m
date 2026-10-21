Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBF4606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 14:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A8tMqR2G;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nRyNP+mU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jV+E5hgrLfXv6Faf4pDdJ1s/g+vMPTmOhUFdOw/h8JU=; b=A8tMqR2GFPXG5kvNqm6bMnBWdE
	hr1N/WpCqSbV1oI3J5cE/DgNgtoY9U7HMkFLN+zoUMIVVxqX4i+s8lOaIS8MoQ/xyzc9Tm5wzIVU7
	B58abtdvg44UWTUYbD69hvT+hViz490X5RDxPrAwwe1rI8R4Z6eXPd3xk4Nusm9KGB9sQdO3RDF3l
	qYwjB7YEgxUMxJiBlG1kRcZFR+8FsuAt7xB2m0xeiuyUeUD7y8mnaWHA+RSuP6Mp/2MNl6T7OyInK
	hFgPaDYLghUFvOxoMC+uJL42cnEZVHQaVDHLqEtjY9R1Dq3+BrNE8VZlRsI/7MO1FXBFRQl/3U3+T
	Ldbu2f9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJX0Y-0000000C3WO-1E5t;
	Wed, 21 Oct 2026 14:09:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJX0U-0000000C3V4-2tIj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 14:09:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 874E016F8;
	Wed, 21 Oct 2026 07:09:25 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 53AB33F7D8;
	Wed, 21 Oct 2026 07:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792591768; bh=0d2Lro54I4BgAUW59sSpcEpUuaxJGf2RyvXWi+lI4fs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nRyNP+mUggYQKcCkq7L7Ggl76eA8AkUSgZbNIhdt/vkhChAIAfxtCBg4rW7Pql1QS
	 PPHfklJdT5Wo+KLQ0fSXPvyJQS6i8z4vLaKVZ6gYYbU7yrlBVTylpzE+A6MmdEVVPG
	 ezKv9kcDnr0c9hNyIwZPV15SYmzRFyRsu1FADpXQ=
Date: Wed, 21 Oct 2026 15:09:26 +0100
From: Leo Yan <leo.yan@arm.com>
To: Amir Ayupov <aaupov@fb.com>
Cc: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] coresight: syscfg: Fail to enable a configuration
 not loaded on the device
Message-ID: <20261021140926.GG26205@e132581.arm.com>
References: <20261012230527.750567-1-aaupov@fb.com>
 <20261012230527.750567-2-aaupov@fb.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012230527.750567-2-aaupov@fb.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_070930_975484_544A0360 
X-CRM114-Status: GOOD (  12.85  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 12, 2026 at 04:05:20PM -0700, Amir Ayupov wrote:
> cscfg_csdev_enable_active_config() looks up the selected configuration in
> the device's loaded configurations, and returns success when it is not
> there. A configuration is only loaded on devices that match at least one
> of its features, so a perf session or sysfs enable that selects it on any
> other device runs without the configuration, with no error.
> 
> Return -EINVAL instead, so enabling the source fails on that device. The
> function is only called with a non-zero configuration hash, so sources
> enabled without a configuration are unaffected.
> 
> Fixes: f8cce2ff3c04 ("coresight: syscfg: Add API to activate and enable configurations")
> Assisted-by: Devmate:Opus-5.5
> Signed-off-by: Amir Ayupov <aaupov@fb.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>

