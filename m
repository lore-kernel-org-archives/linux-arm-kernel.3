Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2B0C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 21:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7vRDdIX0O+Q0gOR9D0g7YO5WKVPbaOK7LtZR1zkHwM=; b=3vr2DvebKmWQ8O9u+IWfXII6lK
	wzLduNbNQnADwiNFFVtgUQvcGg7ZN+P6E6QsnKT3xxrxLwBt/0NkoOxTNwXQk0+fp3YraDXCNVVNS
	3mhjgvtZft9LIYt586tj57DujBRptHqcSxEpQeX01EUKVXFQRUzaGDX+W6C6yt0QsrdYHZ8dX6MFV
	bbPF9nrgN7oWQnBp93YpV7JENdyVNccYkxFx/VowjRhMjluycKjUBt+nCmhlWtJMq1kM1W6DlGv93
	bH6Rp34umDnSVYln+kcnLZlXj+c+hZ63iX4qEHUpu1b8zCM2vANFv8LxvV5QfyDcFs1hsrfleNS3v
	d8JHxQCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUXkG-00000009yHa-3aFi;
	Wed, 25 Jun 2025 21:33:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVSF-00000009hNT-10Wy
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 19:06:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=o7vRDdIX0O+Q0gOR9D0g7YO5WKVPbaOK7LtZR1zkHwM=; b=UUcVBScm98QZL8qEC+o2e2upFR
	+p7MbeEyUSJtt7nv2wF6DMjNhYlRRgI/Dy3RCfe4CpADdSmsiyE3Lj46AWSx0b/t1ZSWaKrvXss7y
	vze8toqG+ZsBDr2LHeF1rEo2P94gSWiW7di48wYoqW1KkE4lG3PYFLfcAOp9FqDjW3IwRapeGvn0m
	81JsgScLDhUnVroB4gS7e9dsZ3ZvXefjao1R3Dyw9l5DBKR9pJzlXUpcgW4a854Jo5MtsEWKe2AUU
	tDULyinVX+8rgF9XrnsOR70rU6s27CfJaGphnRBFNuknTwFf7tD9iKNgxZ0WJPWfE3bIEgWJmD7Qd
	LgZtyCwQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVS9-00000005x6c-0tHC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 19:06:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0269D5C5401;
	Wed, 25 Jun 2025 19:04:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF815C4CEEA;
	Wed, 25 Jun 2025 19:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750878395;
	bh=mt41Fb0q1YhHKfjDtHyYRotEsd67rfLrbLZk+qxV9gA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cBIWj6daJ2/j7eMRSz1WZoK1fQzvuFIbKA3ujFVOwzwFQgQUFqRzb4VcI/0TzmRi1
	 MQbK8UqQ6+wrYd03mjrTGw5QunO6u3fJv7XIqGo4REHjwJVmoC4FsonsRF+f49FB1o
	 Qcc9662DGCUZjVJc+4CmJZ+ZvmbuAgOidrrSsdfAoNBaMcfXgEgtngQKc+DbgoO4f4
	 HDGvy/v3iBv6jZH8P0oU4gs5s5LZe+3SJ2X0lgDObx2FLzYmT3dHpaQE5LqDWvwkKy
	 iMrGDmDFZyR9l7ask/n02TT40PPBSKyfUaJx6tbPFoFg13B7F0d0r+7RXB+Ubv0BJP
	 lNCjQgJv5rH1A==
Date: Wed, 25 Jun 2025 14:06:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v3 1/1] dt-bindings: ieee802154: Convert at86rf230.txt
 yaml format
Message-ID: <175087839356.2050766.5864325742697685736.robh@kernel.org>
References: <20250606155638.1355908-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606155638.1355908-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_200638_944487_B687C54D 
X-CRM114-Status: GOOD (  11.46  )
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


On Fri, 06 Jun 2025 11:56:33 -0400, Frank Li wrote:
> Convert at86rf230.txt yaml format.
> 
> Additional changes:
> - Add ref to spi-peripheral-props.yaml.
> - Add parent spi node in examples.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v3
> - add maximum: 0xf for xtal-trim
> - drop 'u8 value ...' for xtal-trim's description
> 
> change in v2
> - xtal-trim to uint8
> ---
>  .../bindings/net/ieee802154/at86rf230.txt     | 27 --------
>  .../net/ieee802154/atmel,at86rf233.yaml       | 66 +++++++++++++++++++
>  2 files changed, 66 insertions(+), 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/ieee802154/at86rf230.txt
>  create mode 100644 Documentation/devicetree/bindings/net/ieee802154/atmel,at86rf233.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


