Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3F8CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 16:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wkVCVcSpGhoASFpSYOayYIERNxNi9iwqZqN0/hTf7po=; b=P9q2gw41ibVRnUtVT0HBYZmWnB
	tAJBwAqkf7Ju3XLTqua/xdODswwVp5PTXqP6WBMsbu2+Q0759t0NQS/DZY0y1rvCO7EVoKDIxXTb7
	XzbNGl0W0eqg6pt2Hwd+/Slx0WRA7lAVdEpKpu0/dZcW7m4UiSGmvP+jUTws1rz5EropW9KsWCVAR
	kXA3A6OAtYSmheXQUsBOX1NFeU7ag/dFU5UuLgJ1iAWxEtjJrT0EgwIyCHy6U1Z/cQct0wcev5sJi
	iNisuuIGsBedw7Ho2E9VxSx2AqFsmQKQ6VmZ+S5seNhIDwm8o5nKzJ8baxiezLTLFwIDTIFcBDvPr
	sfWhjo7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v942G-00000002DpI-0ntz;
	Wed, 15 Oct 2025 16:07:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v942D-00000002Dnm-1lPL;
	Wed, 15 Oct 2025 16:07:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B8A243622;
	Wed, 15 Oct 2025 16:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532F7C4CEF8;
	Wed, 15 Oct 2025 16:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760544449;
	bh=vW+sUqrp42QvWqx+pFlrtwbxBhUYUL98Q1Hm7OK3wwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t9lNOVsOfjmvGhrXJ4X7cwbwUH7x5nW0C/MWkNdc11xqCnZ1nv3gpWEOFbqodRCuo
	 tkpOP3XyDb7qVRzYCdM6BPa3MhqkCXMADNBnSy0Hr8/cGrShlq5lThwaxrKhATWc7r
	 DtPxQXKfK0roluCy1CT2cJVJKEPzJse8cC6lF4+anD/NG21rBzD3SXF1Dy0K85vHxi
	 x6h+sVahinXaLnJuKV1293SZBrBqHEqGDY1MP1FFgHXAJ6oREC1m4LAsBAh8jeKBdY
	 NsoD8UHMdey+moNo2jqKhdZrIGw/K0VuDQy2Op85id/m5kctpjjVkkdAmIZy7v8CeG
	 +Nu7LsFurf7hQ==
Date: Wed, 15 Oct 2025 17:07:24 +0100
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
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 06/12] net: airoha: ppe: Move PPE memory info in
 airoha_eth_soc_data struct
Message-ID: <aO_GvFhcfw39Y1He@horms.kernel.org>
References: <20251015-an7583-eth-support-v1-0-064855f05923@kernel.org>
 <20251015-an7583-eth-support-v1-6-064855f05923@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-an7583-eth-support-v1-6-064855f05923@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_090729_478964_4B0EB29A 
X-CRM114-Status: UNSURE (   8.26  )
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

On Wed, Oct 15, 2025 at 09:15:06AM +0200, Lorenzo Bianconi wrote:
> AN7583 SoC runs a single PPE device while EN7581 runs two of them.
> Moreover PPE SRAM in AN7583 SoC is reduced to 8K (while SRAM is 16K on
> EN7581). Take into account PPE memory layout during PPE configuration.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


