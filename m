Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D72D44C63
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 15:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZFDs8w6oIwAgY17c+CG6/KvHHaV452UTs0JKbJssRE=; b=Azxx3p2O5Z/L8lPtLJPJKie8Ua
	HrL7h/kV/O3ZWdksQT9aatzBG2XJYrpSdOHL/fjbLJOa04i7ZaOLopeDZ9xWL3jjlq+6EFIUPsJlB
	pIJwHMGOPkUX6pz5F+eDkYiQa/Qmr27xy3QBnGlHnbUyNJfpka4LjYqMOvgm0keSU12hh7CrEASq4
	Fvw2tducm4qQl+L7mnUGb+qAp7vXSFOcdChFiSgFRN2SACZCts2XOajzMCa0vC6dT7u6zo4dSgbuR
	XvThsqCvvNwiHB9FSjxT73Yu3UChdY2/VsIRViI+N8E7dgOC7SJnawJd5cgqp3gniV3W6avMEuGwW
	OIPlEh9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgPJY-0000000CbVM-33rN;
	Thu, 15 Jan 2026 15:31:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgPJW-0000000CbUp-1smn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 15:31:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2BE1640462;
	Thu, 15 Jan 2026 15:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B5EDC116D0;
	Thu, 15 Jan 2026 15:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768491069;
	bh=jU8ASm4NXUrmCL8l9JFWkAyRljXX2GMBYXvcGizejBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TDE0zP5Ak1m4vaZNwi8vZDfqExQ8nVbCNDN4JN30nXyOKhbcg3ZUbRVtlxgj7Ci4z
	 olLDodvRJeMfY/07bMnxjUZ3sWxqINgDQ0g7c0gCvJmCWQ/+rvET/+s6Bt/OgRODbQ
	 xTGppXkr7WDzFhAgLCxRgxhK1PMnUO/qeO2UCvZFEyuTSCn4fbnNPCrvK0v9CVWEQ8
	 XlU4boa5YYWAXp3iA8yJZz75PIJAecGM5NMFz+lUdDJlHvkJCWFWlY5LXddhU059sr
	 5vQLykxco4tVSMERg2QTro6p42YG7uvnHevCG1uj36KwHNHT0Yc3zUOF4isX01ILGR
	 cYGa0R6hdrHOg==
Date: Thu, 15 Jan 2026 16:31:00 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-i2c@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: exynos5: simplify probe with devm
Message-ID: <aWkHI_dBwPuKo-Qr@zenone.zhora.eu>
References: <20251217204944.10862-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217204944.10862-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_073110_508742_81DA3A38 
X-CRM114-Status: GOOD (  11.88  )
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

Hi Rosen,

On Wed, Dec 17, 2025 at 12:49:44PM -0800, Rosen Penev wrote:
> Cleans up probe a little bit and separates preparation from enablement.
> 
> Also use devm for i2c_add_adapter to get rid of the remove function.
> 
> Fix return code for failed clk_get_prepared. It returns PTR_ERR.

The patch is good, but this commit log is messy. Please send a
new version of the commit log where you describe or list things
you have changed using the imperative form (sentences like
"Cleans up probe a little bit" mean very little).

No need to resend, just reply to this email and I can update the
log before merging.

Thanks,
Andi

> Signed-off-by: Rosen Penev <rosenp@gmail.com>

