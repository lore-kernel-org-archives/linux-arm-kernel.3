Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B6EE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 08:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wUq+5zh9qdHlN5brY5WX38A0V/NvzHGPCb1YfbsPb14=; b=DIUGZDqfXeln/f1Ze+E7mJXvl+
	QSz8616lc7ccO764EsmladgPRnyZUlQAg3Xwr2nUKAP8NXiyjuPlOcVKCv3YBA91QXn5MMF1aeZFy
	U9P9F87CQKdvPV0aS8N3T42LEkXg/iBMfUkKWBQ7RvjGkjEi3VzjRJFZPv3HZvUSkPu4dhLH7fcsE
	bwtsMnLrGTOeV/Gam/pliGtCpcEc4itY6g5CsucWXl+vcepehARchzw6z9o/Cf1yCCIDS38shAAZ3
	izAQlReL4b0Y1XngKbMBD/vcX7dLIm7UUWsPEi+DjDQ/y6WQybJBb4NRebwTZmetzg5NStK1zUlum
	QR5fE8BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6rH-0000000F7Dy-0UJJ;
	Thu, 05 Dec 2024 08:05:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6qF-0000000F724-4BYc;
	Thu, 05 Dec 2024 08:04:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2D560A42A97;
	Thu,  5 Dec 2024 08:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F234C4CED6;
	Thu,  5 Dec 2024 08:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733385846;
	bh=FIozSi8SgpqkY9ZdwR7YpI65MxDaseGvlnzWbKVg2nk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cCM/WL7AcmSti272C/8pmCDv4/kLRfmjlVaxX6jKtkohw9FU+pWVbFqN4btG9sx1u
	 XLqWNZjvXB3yI3t6NUvjR32zdTUc0z9+CF/hZQ58QjaxQ/+2VfMyW6NYoqvAb1t2L6
	 67Q9FWFCiKGW3ZiwO2xNke6z1SrKKCgiK/Rdd9t0=
Date: Thu, 5 Dec 2024 09:04:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Roy Luo <royluo@google.com>, kernel-team@android.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, stable@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 5/8] phy: exynos5-usbdrd: gs101: ensure power is gated
 to SS phy in phy_exit()
Message-ID: <2024120528-poker-thinness-6cfb@gregkh>
References: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
 <20241205-gs101-phy-lanes-orientation-phy-v3-5-32f721bed219@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241205-gs101-phy-lanes-orientation-phy-v3-5-32f721bed219@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_000408_113222_BBFC6A3A 
X-CRM114-Status: UNSURE (   9.20  )
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

On Thu, Dec 05, 2024 at 07:33:16AM +0000, André Draszik wrote:
> We currently don't gate the power to the SS phy in phy_exit().
> 
> Shuffle the code slightly to ensure the power is gated to the SS phy as
> well.
> 
> Fixes: 32267c29bc7d ("phy: exynos5-usbdrd: support Exynos USBDRD 3.1 combo phy (HS & SS)")
> CC: stable@vger.kernel.org # 6.11+

Why is a patch 5/8 a stable thing?  If this is such an important bugfix,
it should be sent separately as a 1/1 patch, right?

thanks,

greg k-h

