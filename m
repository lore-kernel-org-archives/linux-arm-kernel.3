Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE833C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 21:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ighf+cCWtVjDbwA7lBmh2KFlX0F9HHQRRAc+dU8AEZg=; b=cUwLxkk9fdiZo/cgJqMnFN2rmc
	nbzzSm+4Yo6nHML+nD+c+7bMEz5HhSQGWgMb6t84zaa1mjUmPWbFSW15Jtg4dlDuFyqVHoLj+S5dh
	NtSj718zEC6LlNFtt5yGaNjWCqLPQMiyUhRKJevGcOb9KxkAzTZg/8hVpl4XAgnbqydIQXqgepfr0
	AOqS+mF8BYgggvswYFi7O1Zk+WtjpzeUdZ1aqFw9ewZRTgq9VW2r1ThhZZ+xCNUj70kLPLqtUTjTC
	zyfg0al3PWtyJoHC2R4myX+l5Y1s6gO18P86oUk/KWn/pgGSX/Tz0gH67gNWuWT4jteD6OvShyiUp
	UpM/7/yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thbZZ-00000001YAN-16KS;
	Mon, 10 Feb 2025 21:44:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbKk-00000001UT4-2k0l
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Feb 2025 21:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Ighf+cCWtVjDbwA7lBmh2KFlX0F9HHQRRAc+dU8AEZg=; b=GeOnJw7DHtNl2ffcCjjnNAeayP
	eSq8JK6HF0V19YB+uFKnFatZAEZoFmAjFff1sUnkooNV48ducOpxnY+k5xh2GE0oKtE3HJzBP7y+6
	TiuetC/CnUWwa4mFfj9wySpxkApTx/xFTkDX7DNHudTMsTrVG/s3Uf0RR5rw31Ny+ZbHzuYN7iUBz
	GEQG3vS5aYwccDhvhnfkb+8fHwazUrcfRNh+w8tmV3EaY31fnbjm+ujWGfvW0Ww4ajyChZryeRa7E
	YZzL1g6aZlOq3gUsAkUVgjFWQnx0hdkawLnRCLCGy85INHXiwECN9VoKB/ayjRmmt5O6yrO5zcTj4
	H5Z1le3A==;
Received: from [156.67.10.101] (helo=vps0.lunn.ch)
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbKh-0000000GnrQ-3hrO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 21:28:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Ighf+cCWtVjDbwA7lBmh2KFlX0F9HHQRRAc+dU8AEZg=; b=mDryXL/QcS2+NLebwVNJ221iK4
	LemKm77+MSODAz2Y0hgwvV615EN55OW0NrUlN61R36ifemEa9qBJbYGWv0M/DCqms/SWlaBV0dpPE
	ei9nGBDp23yzLuXTXxpWee8HgVq/qjQ6Vr1bh9QnNDCjx92IJOIIppt4XOzrGmGwlo+4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1thbKG-00CqAI-HD; Mon, 10 Feb 2025 22:28:20 +0100
Date: Mon, 10 Feb 2025 22:28:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Yijie Yang <quic_yijiyang@quicinc.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/4] net: stmmac: dwmac-qcom-ethqos: Mask PHY mode if
 configured with rgmii-id
Message-ID: <f0e45ece-3242-4d8b-a2d1-fa1478f05005@lunn.ch>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-2-fa4496950d8a@quicinc.com>
 <30450f09-83d4-4ff0-96b2-9f251f0c0896@kernel.org>
 <48ce7924-bbb7-4a0f-9f56-681c8b2a21bd@quicinc.com>
 <2bd19e9e-775d-41b0-99d4-accb9ae8262d@kernel.org>
 <71da0edf-9b2a-464e-8979-8e09f7828120@oss.qualcomm.com>
 <46423f11-9642-4239-af5d-3eb3b548b98c@quicinc.com>
 <60fecdb9-d039-4f76-a368-084664477160@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60fecdb9-d039-4f76-a368-084664477160@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_212847_981365_CFDB08E1 
X-CRM114-Status: UNSURE (   7.91  )
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

> > But what about the out-of-tree boards that Andrew mentioned? We need to ensure we don't break them, right?
> 
> No. What's not on the list, doesn't exist

How i worded it was:

> We care less about out of tree boards, but we also don't needlessly
> break them.

I guess if Qualcomm wants to break all its customers boards, that is
up to Qualcomm. But we can also make it easier for Qualcomm customers
to get off the vendor crap kernel and to mainline if we at least give
them an easier migration path.

     Andrew

