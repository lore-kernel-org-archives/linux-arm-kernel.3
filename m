Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1A5C83F38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 17:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNkoBmSrQhOotHhcZ/pt+jefZGvWgsF4nd+f/EvmSvE=; b=hXd2kpdBr8QogotLhb/HhUo3TD
	IhHxcdBu+1/evOQAO91Zrw1xXZd57urcHmLjvxA0mSvnI3u4ATLz4AwJltQ1inZtAh+9b2aj5Ek2F
	1jSY4VAbsOmfbXtGup1sc5UY3tzanJAriG5WP35lR2TtJ241IlLz2V5cQEHMLV7rMn0e3l8OsPEjk
	BMyrhksxMvi4znZ2R94/S98J7iqHkeUqp4tx0IHD8EJu+aZRsBpWLCIZ0z+EmwsplgpuHTH1/4xUz
	QX8rDqVkRKZV9B9Da450ZQegjnjKClP8aN+RYiXI1Dbn1u7ia7yACxYMIMU2SBtMhvnweEXaFlaS4
	7Vai1qWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucS4R-0000000AjhH-0jeH;
	Thu, 17 Jul 2025 17:06:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucRyS-0000000AirK-2ee7
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Jul 2025 17:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QNkoBmSrQhOotHhcZ/pt+jefZGvWgsF4nd+f/EvmSvE=; b=HF/U0Upk3xOTSQjR1neBgbqjv3
	qqTy2bOeH1IWE9NE3dcVwpqikG2a0q6+mOPEkNFZTW+8qc1NorKSl9qn145RnZpapRgIAkwb5WoSt
	Nf5yAQgsJT5qgoSLAr4fxk8T28E6QjYCQ6kanc0S9dJEbbBJvX0ZYJ1qsN/Rcat5uS61OhRtz1vYG
	ILX51jFv6tyPRbmXj/GBIiYktd+pFnyElHq5HI3MdhtA7gUEW3iPcEXx13PQtXO4tqzDSYR+gEcmW
	7WMdW2o4moBN/1KaUTYfGTnJY/NwWV2ApNOoADhg95mFNE+Ji3CsJg9TlX/RWUL2JtXlCv8uWjboD
	8HbM9+7w==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucRyP-0000000AKTE-3rNx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 17:00:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QNkoBmSrQhOotHhcZ/pt+jefZGvWgsF4nd+f/EvmSvE=; b=X9ovGZ4MkcBJYK9anYVaqgUArl
	eHIcgGHatBzFf+0yHuuSLDmyz/6GWwj0ykwmdE8NCSE9rFIE/5bjNYYu1kndxizmpJJMojBTjMUL/
	h8mPXrNzHj/M6PmeDpAGvCjXj+LGiRfpwJOiF8PELJ68pW0Wc/TyJgDdxwZO2J3h52Kk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ucRy8-001uYl-NC; Thu, 17 Jul 2025 19:00:28 +0200
Date: Thu, 17 Jul 2025 19:00:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Willie Thai <wthai@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Deepak Kodihalli <dkodihalli@nvidia.com>,
	Ed Tanous <etanous@nvidia.com>, Leo Huang <leohu@nvidia.com>
Subject: Re: [PATCH v3 4/4] ARM: dts: aspeed: nvidia: gb200nvl: Enable MAC0
 for BMC network
Message-ID: <e0d61de2-00e7-457c-bed9-21f0d7b5488a@lunn.ch>
References: <20250717-update-gb200nvl-dts-for-new-hardware-v3-0-f28145c55c98@nvidia.com>
 <20250717-update-gb200nvl-dts-for-new-hardware-v3-4-f28145c55c98@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717-update-gb200nvl-dts-for-new-hardware-v3-4-f28145c55c98@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_180046_062673_6054925D 
X-CRM114-Status: UNSURE (   5.34  )
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

On Thu, Jul 17, 2025 at 09:52:13AM +0000, Willie Thai wrote:
> Upstream-Status: Inappropriate Bad devices
> 
> Signed-off-by: Deepak Kodihalli <dkodihalli@nvidia.com>
> Signed-off-by: Ed Tanous <etanous@nvidia.com>
> Signed-off-by: Willie Thai <wthai@nvidia.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

