Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E84FFED9EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 16:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dPLJvT/O3xjlhUzGaaqaIFKbRVcKhxs5Q2ocmQ1KpYQ=; b=EvLmm4+u75Lkeqb+Ot89Enwq6/
	fEazYaQNu80KJ44NKreUyDYiCiL4g35eqkvCmGVRywz/NQuLlhKv/oint6XWIZswXzN7h6yUv2xZZ
	wdDsVbcDofg1VuUdad7kf76ltOV/zfrdHHlLUJbuT/U/RcMgpl6GcrqNIpjTaBi5dos1hmfx3TxoK
	i1ssmze9qnQvvVq7Sihnun/lvmeiCBuUA2i92/8jXQKjz80rMSWfVGWOERMwfdd65vifnvQG2NQGp
	T4/EVPXNErU4iwhNT72Cj7zJv9b5BDGnOCLRkXq0W8+HKiMpQe/8BD0rXJRNgpCwpZ/kU1qCJv2rD
	/we1GjKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2XAF-00000006oO7-0xva;
	Tue, 17 Mar 2026 16:21:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2XAD-00000006oNE-04A4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 16:21:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B5FC740BAF;
	Tue, 17 Mar 2026 16:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775A7C4CEF7;
	Tue, 17 Mar 2026 16:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773764458;
	bh=e0BPQ1p0UdfRCxCsTaN9DCxBuEgVgdYt0iMgNM1/M1A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KWwY5lgxEUOSMGbdv+aQWxJp08HLMO7z3TQgBQ1a0RAkOkA+HhoC66RreUnEdoqVv
	 f/Cj0g3xYmLRHrgQZGCWbPRlyy12meMkzl61LsRz54Zu073r6Ct7QpcsIhxHEwwEYd
	 tpszZOw4aqVoCCSO8A1hDIi7Cx2lQ1cniaOFqORXExZjrvwcId9xfPi9od081znGp0
	 j3AlD3Vxh84yMQGKBBsYSIgnfRb2FPxk0OmYjc2c+6MctKviHVjF5wfUby36SiQxnP
	 zVQJz5jotHJhQosIBbAGv0xdxeJq969llKUbN+YrfDoOUB7H3IvqF6IK1UiyqIqhT+
	 ThoDGXHmVugpA==
Message-ID: <0f92ab73-5996-4977-9ada-e8a26957110c@kernel.org>
Date: Tue, 17 Mar 2026 17:20:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] device property: Make modifications of fwnode "flags"
 thread safe
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Andrew Lunn
 <andrew@lunn.ch>, Daniel Scally <djrscally@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Len Brown <lenb@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Saravana Kannan <saravanak@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
 driver-core@lists.linux.dev, imx@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, netdev@vger.kernel.org
References: <20260317090112.v2.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid>
 <CAJZ5v0hwO16=mP_vB=wi7x8CjROAw_Nd_Tq-hEohrDW3C58RbA@mail.gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <CAJZ5v0hwO16=mP_vB=wi7x8CjROAw_Nd_Tq-hEohrDW3C58RbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_092101_078751_3340BF36 
X-CRM114-Status: GOOD (  11.13  )
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

On 3/17/2026 5:11 PM, Rafael J. Wysocki wrote:
> On Tue, Mar 17, 2026 at 5:04 PM Douglas Anderson <dianders@chromium.org> wrote:
>>
>> In various places in the kernel, we modify the fwnode "flags" member
>> by doing either:
>>   fwnode->flags |= SOME_FLAG;
>>   fwnode->flags &= ~SOME_FLAG;
>>
>> This type of modification is not thread-safe. If two threads are both
>> mucking with the flags at the same time then one can clobber the
>> other.
>>
>> While flags are often modified while under the "fwnode_link_lock",
>> this is not universally true.
>>
>> Create some accessor functions for setting, clearing, and testing the
>> FWNODE flags and move all users to these accessor functions. New
>> accessor functions use set_bit() and clear_bit(), which are
>> thread-safe.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: c2c724c868c4 ("driver core: Add fw_devlink_parse_fwtree()")
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Acked-by: Mark Brown <broonie@kernel.org>
>> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> 
> Rafael J. Wysocki (Intel) <rafael@kernel.org>

ACK or RB?

