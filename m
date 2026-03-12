Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFEC1067044
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJAaoI4nzBqB4og+me+TxApI7HoHmE98gzJ18rNBXLc=; b=QLlR9QZ11A4C0NxsKgw0xRcdPg
	/DMxL27g0hJ5NaqZiIOqllvgQO/ccDn2Z6ijTJ8gRTYo+R7kR6VgAmWlg5FWHjsFz40jv5nE/RP+V
	g0HF4VIDeoDxDTIpZvuewGpxtG3wl2GhmAYdr+VtJkGk3FHEthAXwZ0ayvjC/HMt39NwoCWoxHSX6
	I5w6ul134vTN4xDy8KdZXcK1iKdvQJDmmmt+4rkA10d7J65rybE1hpNhvKkXuXZjDUzyGpvpMS1Ft
	hxL4/fLlv66AjRuJsPhZDamWbw+SSYGFwtz59m5O2URuQbemzi2YVpaMv9uOJNPaxV61DNhcP8J/p
	HXTX4sQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hxA-0000000ENYN-1PS0;
	Thu, 12 Mar 2026 15:28:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hx9-0000000ENYE-0STU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 15:27:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7712960142;
	Thu, 12 Mar 2026 15:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C860C19424;
	Thu, 12 Mar 2026 15:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773329278;
	bh=8dH/mFWlJvpvVrmPDnbkFrGmjYLDxkA/o3NvlttQmP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b0yekm05/4C9bNOwUlQbKDgQqBpOah2g59yUoFZwI/leF/mcoIQkimPlZ8piIF8E0
	 E4iqjj8XNW6nunYqGx/NYJUvEKgeKCB5zc7DwWcs3mgdzwA5muq2TZjpFy7wopU05e
	 1jJVRPvKPQa23K6RnYDbJoPXXBiZrb2t5J2YJxznYeOZvVwAz70EJ1BgFO2Z3tie8j
	 1mKIO/Y0oNvakrMCm3zn+Y/gXNWMVOePI65RmDuPO1ZpPs12ETJI5JFY0n7lEQ6dpn
	 RaaTbvkq4uRX6bYP27xuyDXpjRcVQXHupx1QbxGvjBL5ASQ091u3rorPejXhNwMrCd
	 7yD/rTEd88KNQ==
Date: Thu, 12 Mar 2026 15:27:54 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/7] pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
Message-ID: <20260312-pastoral-peacock-of-essence-d21feb@sudeepholla>
References: <cover.1773150895.git.dan.carpenter@linaro.org>
 <ce2b6b8f5b5432ac551720bad5776ef2ce490b68.1773150895.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce2b6b8f5b5432ac551720bad5776ef2ce490b68.1773150895.git.dan.carpenter@linaro.org>
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

On Wed, Mar 11, 2026 at 10:38:16PM +0300, Dan Carpenter wrote:
> The PIN_CONFIG_LEVEL parameter represents the value of the pin, whether
> reading or writing to the pin.  In SCMI, the parameter is represented by
> two different values SCMI_PIN_OUTPUT_VALUE for writing to a pin and
> SCMI_PIN_INPUT_VALUE for reading.  The current code translates
> PIN_CONFIG_LEVEL as SCMI_PIN_OUTPUT_VALUE (writing).
> 
> Add a function to translate it to either INPUT or OUTPUT depending on
> whether it is called from a _get or _set() operation.
> 

Acked-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

