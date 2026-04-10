Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42559F36B9A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 02:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9kpSbJJ5ghjv9xGYI9AfenQBYv+RQ6JZSeUfjkeTW0=; b=u4DgO61+u81wyXUojt/a911CbD
	H8hUg/bTzbHJxbOxZa6POvoWj7UC4WaupWrLtn/AelKspKzuxQA+Iv7j/Cgub3ZMYQxJLf1E4Ea5H
	CBLnZt9UaJydHTj/I+crKbS6K2lImRZiqoMSvyyo05YqikgbygAAV28PCI8MSKUc/M8zsBRLhgOUd
	eVSFfPLHU/rqb7hKCrkX9Use6tSm2AQXY4fI06aHmgcLfEQASMpSYjDML18RAKxbsyD6tVLxjXJB1
	Mipr0sCf+6FMq423EBFnYrF7bVb7cs8ttIMN5cB1I+7ZP1eIPV2yJIHHDxgnIez5869+N9bkwXQVh
	TIhtoRgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB239-0000000BUqI-2dzd;
	Fri, 10 Apr 2026 02:56:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB237-0000000BUpv-1Sqb;
	Fri, 10 Apr 2026 02:56:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3CA3E43DB8;
	Fri, 10 Apr 2026 02:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74FA2C4CEF7;
	Fri, 10 Apr 2026 02:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775789807;
	bh=B9kpSbJJ5ghjv9xGYI9AfenQBYv+RQ6JZSeUfjkeTW0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=j0PBCj5804Oi5magRfTOBgMi/tGqroy9tnJC5VzMthMJAIwT1slg/7krpIJFdCRvN
	 /EiROl2kPERgWlqviiKXYbI9zRvlgwANO7CQhfOQHKXmb1poBTD5qJpfjPpyqaMQQE
	 Asx44P5Izpwq691fu3Ndh3F9qYAOfxqNKptg45+hXVoC3kNUwbhiu6R/zZNzVa4Dzb
	 rh2FsVJfXmmaup2N5YXjZo4rsUD8DjGsgkNLGOkJS2Td3jTovdsphi94IUkJvwIHWr
	 0hpic6bEjTuVxXv7MXBXFpux2PHELaVuNNnfVWZ6F6lf9C9bRriR/g0r5z9/qpk7VT
	 cqeDiYniRnqhg==
Date: Thu, 9 Apr 2026 19:56:45 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Christian Marangi
 <ansuelsmth@gmail.com>, Benjamin Larsson <benjamin.larsson@genexis.eu>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org, Xuegang Lu
 <xuegang.lu@airoha.com>
Subject: Re: [PATCH net-next v3 00/12] net: airoha: Support multiple
 net_devices connected to the same GDM port
Message-ID: <20260409195645.16c68979@kernel.org>
In-Reply-To: <20260406-airoha-eth-multi-serdes-v3-0-ab6ea49d59ff@kernel.org>
References: <20260406-airoha-eth-multi-serdes-v3-0-ab6ea49d59ff@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_195649_453640_0EA26A0D 
X-CRM114-Status: UNSURE (   8.25  )
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

On Mon, 06 Apr 2026 12:34:05 +0200 Lorenzo Bianconi wrote:
> EN7581 or AN7583 SoCs support connecting multiple external SerDes (e.g.
> Ethernet or USB SerDes) to GDM3 or GDM4 ports via a hw arbiter that
> manages the traffic in a TDM manner. As a result multiple net_devices can
> connect to the same GDM{3,4} port and there is a theoretical "1:n"
> relation between GDM ports and net_devices.

Still waiting for the device tree review. I'm going to blindly send out
the Sashiko review, please comment if any of it makes sense?

