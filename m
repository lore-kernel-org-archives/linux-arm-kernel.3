Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFA3C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 17:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvXQbcqOWygs/VwootWLBvcI0ZEs6gJWfjd2kJrIlyU=; b=qy58cV0TJI7k9saLdgbLiTq3cA
	EZg8xcNrPhO5P1t3dWS8YZaDFHohG5Cr5oEgkQbG7nQp9h1Xyns/3Gw+n5C7OlFFeXRlDPcZaWD2q
	lHnwOEgvG+XeezrhJu81nlbhM0o4AcZx/h9Ny0HO0Izcq8kWXnjVKERDJ77l7N2WHsN5OC/lw5d2h
	rf8nwRBSnbw/sD8G+/GtgWSZEKEKPVrnFVkeacmQE0W0SUXwwfkcs9SBUpyOl7uVCnzL4hmaSTI4J
	204XI1CVeVb0rBz6a0kv50bI22m4dadeURJ4kgYu68tIBMRShjN+THX0ajvzcMStPX5RHQCauCvaV
	qoGod5Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taHmz-00000008RTZ-3SxP;
	Tue, 21 Jan 2025 17:11:45 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taHli-00000008RGn-0EKW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 17:10:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=mvXQbcqOWygs/VwootWLBvcI0ZEs6gJWfjd2kJrIlyU=; b=qmQUQ2NAHWeZVwh3xqOrkfTZvj
	yprXEINu8P2IOI6rjQdad5/dUMsBqMAdq6cCOtYFah+JRTp2FLP2i5oRuWAVob33pd9O+FCQhSoCH
	fEk2z7/apymzPOiQLQziaXnJG0ht92ACKoorlOm8CZTEU/+eihGM2wJSPvO3GM4nc4/g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1taHlS-006hNS-3y; Tue, 21 Jan 2025 18:10:10 +0100
Date: Tue, 21 Jan 2025 18:10:10 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
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
Message-ID: <bf45ec15-d430-499a-ba30-825611369402@lunn.ch>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-2-fa4496950d8a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121-dts_qcs615-v3-2-fa4496950d8a@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_091026_093895_1E5F4D64 
X-CRM114-Status: UNSURE (   9.46  )
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

> To address the ABI compatibility issue between the kernel and DTS caused by
> this change, handle the compatible string 'qcom,qcs404-evb-4000' in the
> code, as it is the only legacy board that mistakenly uses the 'rgmii'
> phy-mode.

Are you saying every other board DT got this correct? How do you know
that? Was this SoC never shipped to anybody, so the only possible
board is the QCOM RDK which never left the lab?

I doubt this is true, so you are probably breaking out of tree
boards. We care less about out of tree boards, but we also don't
needlessly break them.

	Andrew

