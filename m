Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0ADC982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 09:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwzMj+wKLAhRMi5iVspOLaW9J0cdkcPNjcJO5g6QxW0=; b=Bo1pnL5vhqFNmMn+qstIdHjwY/
	de4YTRvO+DC0G9aOFyIuvzpYzU+CdeMRZYecfnBdbN4TOh7ZjoMGwBo+6xAxuwy1D7U3VUFThCzcB
	cigjxJyIXT48p96yDdLegancl7A7p56AvzG6fY8z+QhKdvxF2n6PmHDTZB+9xa5O8d7f3ohqKKPmZ
	gmko2ydN3srtgvbRvarf/vKFgy3pM1DjQ9mb922S4w3klt15Q+bIq2o+EFwYkG++Xx7MjxTdNKbB3
	TvfS6UUZa2eSKxYqwLUUvIUsudCnbod5yjbmNsXwdsKkIpgcanr7UnLCAGQM7m5pgFCqeo0Tqer7M
	7SwIEw0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZyI-00000001RtD-48o8;
	Mon, 21 Sep 2026 09:05:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Zy0-00000001RpI-07z7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 09:05:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 72D8341FB4;
	Mon, 21 Sep 2026 09:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EBDB1F000FF;
	Mon, 21 Sep 2026 09:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789981539;
	bh=nwzMj+wKLAhRMi5iVspOLaW9J0cdkcPNjcJO5g6QxW0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=PbVyvJ+2T/4MbjOWH/nmfpWjfLrH55pL9UbQZ9Z+toGw4YMB8lO2bOzSjuXX7CPBC
	 tKzfg0xWuVloIVwLSs9SUTqflFjwTyLNWDhHn+uqOmcHYCeL8YIJ6CurK91G2HcCcc
	 jmI+N7yi7n1lDkBjIRCK29gg0g3BPobmesr3Z60en1UtGcag+iCqZp/53jN8d6Cadg
	 ZXSsAORtdWzdY2W/RUYZAsQaWT5d9ekdKEbN0MZfNaQIHnBN6K8uRiayMJnXOEp4il
	 9rfEJ38034j39y45DP0xi1/hozbfvU96XBjTEpHU8gHF3mYMytHsm1QRCUDN60MXMU
	 ld2dt73by/fHw==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
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
	Suzuki K Poulose <suzuki.poulose@ram.com>
Subject: Re: [PATCH v12 4/7] arm64: realm: Move Realm memory encryption ops
 to RSI code
In-Reply-To: <arDwTjQiqF6VZOau@arm.com>
References: <20260921053807.354802-1-aneesh.kumar@kernel.org>
 <20260921053807.354802-5-aneesh.kumar@kernel.org>
 <arDwTjQiqF6VZOau@arm.com>
Date: Mon, 21 Sep 2026 14:35:31 +0530
Message-ID: <yq5a5wzz3rfo.fsf@kernel.org>
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

Catalin Marinas <catalin.marinas@arm.com> writes:

> On Mon, Sep 21, 2026 at 11:08:04AM +0530, Aneesh Kumar K.V (Arm) wrote:
>> Realm memory encryption callbacks are CCA-specific. Keep the Realm callback
>> registration with the RSI initialization code instead of pageattr.c, which
>> only needs to provide the low-level page-attribute transition helper.
>> 
>> Export __set_memory_enc_dec() within arm64 so the RSI code can wrap it with
>> the Realm-specific encrypt/decrypt callbacks and warning policy.
>> 
>> No functional changes in this patch.
>> 
>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@ram.com>
>
> Nit: Suzuki's still at arm ;)
>


Will fix. I copied it from:

https://lore.kernel.org/all/bb59b1e0-2550-4a9d-8738-a54e5f106f45@arm.com

-aneesh

