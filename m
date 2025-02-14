Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EFFC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 12:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/iIDMxwWhOMlo0pvsjBLVEb4l7Yzd87q8gDAWf5Jng=; b=V1QUuV6halxv5PB/4livT7J7QS
	NVp28VS3KDYIYkJ+25HAGjq4OHFMe7+4mQvkRlvtlM57v+iEsANYAAz+QCnpauZJ6/Nl2Tggf6FH7
	UdIj5HuD6ZNRcUM3SknyA8tv7bXAYYm3w5for2rDQR9QP+oZIzqvK1lN0DPweOtPQ3QtJ4Z97atfa
	lOveb+xe+L78fX0w0j6WZSsxxfJc0vG+I8iK6TCuSiIucE37Yy+4EHT5XrDWLjAcynxAp6hSDlXrF
	R3faMan5utl/RJWn6lgbka+0JX5hiUBQqQIv/UsdyvvpoWdCgIJsi038ZqYUIn2JWVJiqSKwqXxdc
	pKpHKDBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tivDV-0000000EtCm-3fkJ;
	Fri, 14 Feb 2025 12:54:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tivC3-0000000EszU-2VcN;
	Fri, 14 Feb 2025 12:53:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 72A285C56B1;
	Fri, 14 Feb 2025 12:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA9BC4CED1;
	Fri, 14 Feb 2025 12:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739537598;
	bh=W20/hho5/JKp2k83eRciL4B0jPMKgL9X5owBtOEnhK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n47noHxF18PlaEr5zaUzUu3eIqSCbdx3pLu2oHLYc8zf8YunCqQS8cNkd08YYatCz
	 +YqzxN+xwQ1GMTDAyjnJ2cMlzT5lv9IMGycjrF9RuqR7VabMGLnAR56Xg47NxrWcAj
	 dFeEzJFx+PTgD5nN1ZNbtFGJYQC8iB3ug+RQRBazAH2nuDPUJtwLURu/ueiQgqwVff
	 ysXfzv3fhymVtK2H8CGKS9eu+9l0aUwqOkc3/YwgdWKVGVcLIWYH8CUW8vT0cb3KHq
	 wWDP77ggDxI6iP0rYfG/dIn93iYkqOJwlk1gAkykLl23YwGr5vVhvkCnQRd2drRSTr
	 y/njZSXq2q1Fg==
Date: Fri, 14 Feb 2025 18:23:14 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: kishon@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, arnd@arndb.de,
	fabrice.gasnier@foss.st.com, linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] Fixes: 2de679ecd724 ("phy: stm32: work around
 constant-value overflow assertion")
Message-ID: <Z688unKfcSeFE5X/@vaman>
References: <20250117140514.3614314-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117140514.3614314-1-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_045319_691639_D980BBD0 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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

On 17-01-25, 15:05, Christian Bruel wrote:
> This patch replaces the workaround with fixes for two issues leading to
> constant-value overflow assertion:
> 
> - Guard against false positives with a WARN_ON check to make the compiler
> happy: This should not happen because the offset range is checked against
> the sorted imp_lookup_table values.
> 
> - Guard against a true warning found for the max_vswing, as a given
> vswing value can be 802000 or 803000 depending on the current impedance

Patch looks fine, the fixes line should go here and subject needs
revision

-- 
~Vinod

