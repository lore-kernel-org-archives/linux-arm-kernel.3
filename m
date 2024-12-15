Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC4DE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 20:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yY89w7EyE7YhvETBcg/BNaJrusmpuLoPjQdmt3JKcM0=; b=CpMtLdV4gDxUotlk/iFEfrlqqu
	e+MAFJhFZ1CIG+wyJl5fYpl+haF0QA5n7btn0QRLfIX5sb6Ds24nMPJ9R0SjRZpibM5U8YIblAH3W
	N1+XmYorwkHTMymE1Fyx2KtbHCr+3GR/elQjdbSaPqjNxxn8alyCis8mpGR4WRMG/5wJXRGxUljJG
	XW164RvUyuXwXmaEC6G6tAnWB5ij8/CPMKxV04FIreZA4PWBLSeX8d62ri7po5WAInlKQukQqp/2+
	YRNe3yA0UMuufkLbK34yM4vPpeHBjj1i5d3APIhWpZTnsZAELxe3KhrIrp995w7AsRIcBUID82/iG
	84ESTIvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMvKb-00000008Qbt-2IL5;
	Sun, 15 Dec 2024 20:35:13 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMvJU-00000008QUA-34l4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Dec 2024 20:34:06 +0000
X-CSE-ConnectionGUID: 3SZbd4r9Q96lrZsWPPqzJg==
X-CSE-MsgGUID: L2EbLFJSSNCJcd9lJG+chg==
X-IronPort-AV: E=Sophos;i="6.12,237,1728918000"; 
   d="scan'208";a="227902833"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 16 Dec 2024 05:33:58 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.26])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4A361406865D;
	Mon, 16 Dec 2024 05:33:45 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: robh@kernel.org
Cc: arnd@arndb.de,
	heiko@sntech.de,
	krzysztof.kozlowski@linaro.org,
	lee@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liviu.dudau@arm.com,
	lpieralisi@kernel.org,
	pankaj.dubey@samsung.com,
	peter.griffin@linaro.org,
	sudeep.holla@arm.com,
	willmcvicker@google.com,
	biju.das.jz@bp.renesas.com
Subject: Re: [PATCH 3/3] mfd: syscon: Allow syscon nodes without a "syscon" compatible
Date: Sun, 15 Dec 2024 21:33:44 +0100
Message-ID: <20241215203344.46158-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211-syscon-fixes-v1-3-b5ac8c219e96@kernel.org>
References: <20241211-syscon-fixes-v1-3-b5ac8c219e96@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_123404_883471_635A2F9A 
X-CRM114-Status: GOOD (  13.90  )
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

Hi Rob,

On Wed, 11 Dec 2024 14:57:14 -0600 Rob Herring wrote:
> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> index bfb1f69fcff1..e6df2825c14d 100644
> --- a/drivers/mfd/syscon.c
> +++ b/drivers/mfd/syscon.c
> @@ -171,8 +171,10 @@ static struct regmap *device_node_get_regmap(struct device_node *np,
> 			break;
> 		}
> 
> -	if (!syscon)
> +	if (!syscon && of_device_is_compatible(np, "syscon"))
> 		syscon = of_syscon_register(np, check_res);
> +	else
> +		syscon = ERR_PTR(-EINVAL);

The current modification will make device_node_get_regmap() return -EINVAL even 
for syscons that were already found in the syscon_list, which I believe is not 
the intended behavior.

I suggest modifying it this way to maintain lookup functionality for registered 
syscons while implementing your intended changes:

static struct regmap *device_node_get_regmap(struct device_node *np,
					     bool check_res)
{
	struct syscon *entry, *syscon = NULL;
	struct regmap *regmap;

	mutex_lock(&syscon_list_lock);

	list_for_each_entry(entry, &syscon_list, list)
		if (entry->np == np) {
			syscon = entry;
			break;
		}

	if (syscon) {
		regmap = syscon->regmap;
		mutex_unlock(&syscon_list_lock);
		return regmap;
	}

	if (of_device_is_compatible(np, "syscon")) {
		syscon = of_syscon_register(np, check_res);
		mutex_unlock(&syscon_list_lock);
		if (IS_ERR(syscon))
			return ERR_CAST(syscon);
		return syscon->regmap;
	}

	mutex_unlock(&syscon_list_lock);
	return ERR_PTR(-EINVAL);
}

The above is the resulting working function I've obtained while testing with
different scenarios. This ensures that:

 1. Already registered syscons are found and returned correctly
 2. New syscons with "syscon" compatible are registered as before
 3. Nodes without "syscon" compatible return -EINVAL only if not found in the list

This has been tested with my v1 syscon work [1] and with v2, where I remove the
"syscon" compatible string for custom regmap initialization, aligning with your
goals for this series.

Let me know if I should add this series as a dependency of my v2 or how I should proceed.

Thanks,

John Madieu

[1] https://lore.kernel.org/all/20241206212559.192705-2-john.madieu.xa@bp.renesas.com


