Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B44E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uwxv8DyDcZYQiFvsiF825tzlw/MGEc2mOWD/4lt+TXE=; b=jIyE0UNvjWHMbBUay226BdaWbq
	PvlunRM6/+tep8y8IhPdCt23f5nU/9D5Z1dAIT18699mBn5HgYCdTzUUzwXn+oD14r+Spz0gWGVtG
	X6rdFqlWcapaZnhSzuDU5M1FkgSC6p8VCyu2tXoxOj/OOjPuouAgApm/H8DZzGin9UkEH3erk1wfW
	esC52MsPv1cMR4AkdClNfoYpWtkB0uFLlztXjPGz2kdXS4TvjrkOW/soyAhPkDXToTvMuQqN6FkY7
	a0LwlLKz2wcjmA4GPkSO4OGE6GWzKt4hK6CMWohNdvdkcqxqj3qi+MZNC2XyjJBZTwyz3ZsJlDUaB
	FCHpIcgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbEe-00000007Lxg-3j52;
	Mon, 09 Dec 2024 10:43:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKb5D-00000007J6L-3jyy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 10:33:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0EAA113E;
	Mon,  9 Dec 2024 02:34:09 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06C4C3F720;
	Mon,  9 Dec 2024 02:33:39 -0800 (PST)
Date: Mon, 9 Dec 2024 10:33:37 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Etienne Carriere <etienne.carriere@foss.st.com>
Cc: <linux-kernel@vger.kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] firmware: arm_scmi: get only min/max clock rates
Message-ID: <Z1bHgf_4qqZgSnDt@bogus>
References: <20241203173908.3148794-1-etienne.carriere@foss.st.com>
 <20241203173908.3148794-2-etienne.carriere@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203173908.3148794-2-etienne.carriere@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_023343_972883_6BB6D751 
X-CRM114-Status: GOOD (  13.45  )
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

On Tue, Dec 03, 2024 at 06:39:07PM +0100, Etienne Carriere wrote:
> Remove limitation of 16 clock rates max for discrete clock rates
> description when the SCMI firmware supports SCMI Clock protocol v2.0
> or later.
>
> Driver clk-scmi.c is only interested in the min and max clock rates.
> Get these by querying the first and last discrete rates with SCMI
> clock protocol message ID CLOCK_DESCRIBE_RATES since the SCMI
> specification v2.0 and later states that rates enumerated by this
> command are to be enumerated in "numeric ascending order" [1].
>
> Preserve the implementation that queries all discrete rates (16 rates
> max) to support SCMI firmware built on SCMI specification v1.0 [2]
> where SCMI Clock protocol v1.0 does not explicitly require rates
> described with CLOCK_DESCRIBE_RATES to be in ascending order.
>
> Link: https://developer.arm.com/documentation/den0056 [1]
> Link: https://developer.arm.com/documentation/den0056/a [2]
> Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> ---

[...]

> +
> +static int scmi_clock_get_rates_bound(const struct scmi_protocol_handle *ph,
> +				      u32 clk_id, struct scmi_clock_info *clk)
> +{

This new function seem to have unwraped the scmi_iterator_ops(namely
prepare_message, update_state and process_response instead of reusing them.
Can you please explain why it wasn't possible to reuse them ?

--
Regards,
Sudeep

