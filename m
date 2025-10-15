Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3C6CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 16:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7XF8hgw29FBS3UqTt6pdpH/UCnQ8pNPQc5CDJiZpncA=; b=FEx6E4y906XzTY5O4Y7mL0+f5U
	xPovlCW2EvRInaJoyzEiSxAMvk6ddsl4JJxloszFhK0uHRYUEzsoTzBszg4JY19xy6PchmaIIBO/g
	6EcXGdaaYxHpGJn6lhKKGzYEg6atbWfBIfOdKXgEo/2t5gFTp5QrK/JkuLp8DJriMTVl6Z1WGjhSD
	HlfNk2o0UD2dhgcfwJ4NJykCHtEICATj8RrWxGvARWbE/dTzksAM5rZvuRXFHnXIfMYMBEtABqd1r
	6b2fTmwyDEm9GA5P5PlRgUHNLFPLZ/q6frjKgbh1WUE+UUQj25SxRgK1tVMiJgMr19kIDnC7OwIt2
	vCLXI8gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v941n-00000002Dbh-3xCP;
	Wed, 15 Oct 2025 16:07:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v941k-00000002DZG-3gP1;
	Wed, 15 Oct 2025 16:07:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8415443D46;
	Wed, 15 Oct 2025 16:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850EFC4CEF8;
	Wed, 15 Oct 2025 16:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760544420;
	bh=yrrQGTEKDMa6yuiG3QQ8O0Gf2mIEuJW3I0RJHaiD/aQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZIaU9VERfqZIcGyeL654N5TDtjSmgo9F8TyKOset1ob9H5G/A6Z5UzPpYLlaBVFWd
	 UF43jQ38fG1YBDOntEw5zIx9vVW9N7tm2eKqB4d9OAxgq1V9/m/86q0LCF8S9NRZeB
	 LEIvicMRzl18AtWvw1w2ZbON2uKdVTJ3D1LOI+aLhzdx1XI3pEXygeMbwKQ6mIsnLH
	 Bkp1DGp6v9tMFihAyFL6RlnJeuKFQSdiPn/0/6SMv3SOZ1VngDUNw+pYQn0QLpSLFk
	 2sTFFOSN+waKDun903dy4PFqA2wv26shl8j4TLmfFModc2n+ktsT4SYjqlqsMG2s23
	 gKg2BcZUY4/jw==
Date: Wed, 15 Oct 2025 17:06:55 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: Re: [PATCH net-next 04/12] net: airoha: Add airoha_eth_soc_data
 struct
Message-ID: <aO_GnwiGo6w4jWuO@horms.kernel.org>
References: <20251015-an7583-eth-support-v1-0-064855f05923@kernel.org>
 <20251015-an7583-eth-support-v1-4-064855f05923@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-an7583-eth-support-v1-4-064855f05923@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_090700_942518_3C1884CC 
X-CRM114-Status: UNSURE (   8.67  )
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

On Wed, Oct 15, 2025 at 09:15:04AM +0200, Lorenzo Bianconi wrote:
> Introduce airoha_eth_soc_data struct to contain differences between
> various SoC. Move XSI reset names in airoha_eth_soc_data. This is a
> preliminary patch to enable AN7583 ethernet controller support in
> airoha-eth driver.
> 
> Co-developed-by: Christian Marangi <ansuelsmth@gmail.com>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


