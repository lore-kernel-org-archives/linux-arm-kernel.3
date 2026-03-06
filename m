Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7876AF01832
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 13:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfqK4agcNfapf3O9rtrZ4lBX4FarzB1cQhh8M24Ef6w=; b=UOf8i6dQzh+61VhLfxzCI3pPLb
	1nSg8W/hdssLufqrQMnnsm4BR0DYgF8wgEblx3q11rEHA9zyGqS4pecswgmx0K4t+uu8rxZTC/vdA
	Pj3wZIIQNKDUwi6vZQjI2QwdAXLu4u2KxB7N1SFt6pvQYZkmbix8GLYkH3ptU+SzP5BlXAsB1MX5X
	vu9GYP2k+7+NNfprNtHJBMT8s7PQOkCG7q/QcloDEvNIz0pmpmY12tfj6WZijDcng2M+MYB6b8Qc1
	KGDGpzFMAG46NmNgeAzAWEUP4WD7IkRPFq+wPo3/twQmAYAA7jmB+Coy/oKozzW6cFS0mXkQbn6EX
	IZcVqTrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUnI-00000003i1j-2vxy;
	Fri, 06 Mar 2026 13:00:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUnH-00000003i1S-3YY9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 13:00:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ECE976012A;
	Fri,  6 Mar 2026 13:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C1EC4CEF7;
	Fri,  6 Mar 2026 13:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772802038;
	bh=SUilmRyxi9rSQ2L8Zu1tUGBe9n/KlEBwjbmt8lTSZZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nzXGg6rVmEJJG6AygVVVyC5TblHizjVm0/fiTm/TAugIDMsSYhg5s5vU4fdpnvQL1
	 lLWB1P9pUgPZ5fFLbjxnh1Zh5swrJmEEomAzl+WOu1XH1rti0ulKpuzmiW3Def6Wxh
	 fJvIYXw2QUG/UOyUol8+3BsSYK/JVrghOF4O1WOl4LeRazwSx4EqT6Xi0+MOv/gZmq
	 ouHiiLJdgZyKoRETncAhoajKoboLNKuG9Gxi+M3qEK/YV4mfAXfIQbjX7vkB50oeTF
	 jT+H55kOfCxtBjluOlRP2ToS/1wBfsDU6t+vWPukoJicc4pdk3P4VtAvRJukRjaqeg
	 suq05TtmZZeWQ==
Date: Fri, 6 Mar 2026 13:00:31 +0000
From: Lee Jones <lee@kernel.org>
To: amitsd@google.com
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Subject: Re: [PATCH v8 3/6] mfd: max77759: add register bitmasks and modify
 irq configs for charger
Message-ID: <20260306130031.GK183676@google.com>
References: <20260224-max77759-charger-v8-0-eb86bd570e9c@google.com>
 <20260224-max77759-charger-v8-3-eb86bd570e9c@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260224-max77759-charger-v8-3-eb86bd570e9c@google.com>
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

On Tue, 24 Feb 2026, Amit Sunil Dhamne via B4 Relay wrote:

> From: Amit Sunil Dhamne <amitsd@google.com>
> 
> Add register bitmasks for charger function.
> In addition split the charger IRQs further such that each bit represents
> an IRQ downstream of charger regmap irq chip. In addition populate the
> ack_base to offload irq ack to the regmap irq chip framework.
> 
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> Reviewed-by: André Draszik <andre.draszik@linaro.org>
> ---
>  drivers/mfd/max77759.c       |  91 ++++++++++++++++++++--
>  include/linux/mfd/max77759.h | 176 ++++++++++++++++++++++++++++++++++++-------
>  2 files changed, 230 insertions(+), 37 deletions(-)

Does this patch have any dependents or dependencies?

-- 
Lee Jones [李琼斯]

