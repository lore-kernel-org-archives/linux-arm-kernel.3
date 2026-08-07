Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC574C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kCBAfJcqbgF3AmCRrsKCNXyT2G3N/ne3bssrcVUdDDM=; b=wXiK/objD4/A6TXU7MJA7gMsSr
	qmDZidAUuBdE8cME0XDfaIX62OmvExv973Z9kV5yCMEXoxzzjA61vuPXkdsls38mCrALlcPLMfTI9
	ZGzWyBPYEbq1SV2t8QpYJSvlb01omFwh7ZQCIrhv51Jl71nASZcIgwUwGT8MsSeGOXqlGhxgvjPrl
	roGdlVvxz6XjQoqap4kUp7TAC1q4HNqEhiVKZugOVr1526RoF1XV/jVJTvB3x8sK/R/7lW5eO4k+v
	bwgNEATT8ocV2YauqzGZJuoGOn8mbSWd5CMhdD2C7Vbm6E6UrvCmyICS4QfiErinNPKx+he6xPsm9
	pwPH+D8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFzh-00000007QBD-3A72;
	Fri, 07 Aug 2026 08:31:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFzg-00000007QAz-0U7X
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=kCBAfJcqbgF3AmCRrsKCNXyT2G3N/ne3bssrcVUdDDM=; b=XE/i2oS9O8Lzb/ZZU2UW0wfR6M
	VHhY4UWvrw2odIai/ULUTwQMQnjsyNJCjQD3ChpkV1GrCMxzQcsuAwcL5lbknvI3eFBvZkE1BXW7D
	biz/5YXRVs54Gt4oT7Tp5rDDC7e636lT0xiKuUK4Y8/8aofwm+eRmcR5V3VHNAJSA6vB4eCIXUv8j
	gXkg+C1a2Pjc9ShFd4jCqivXTdTMYexPCCpucBz6Rmir+LdzeCxWzo4unpiN3PdUXqmQivTAGEhl5
	gPhz/DMJ4yBnP4QFOCosIyJY/DnVDOFWt+5hxhCjD/ftVmoLKNXG6WsTD0c8WXNF94s6db5mwB7nx
	dmLXHDLA==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFzd-0000000CCRj-07Qm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:31:55 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso2879766b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 01:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786091510; x=1786696310; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kCBAfJcqbgF3AmCRrsKCNXyT2G3N/ne3bssrcVUdDDM=;
        b=krH5TM0r2qTuKWWa+LOo1SJnGhgD7tnxpYnFvUQ5QaMwmqUi5ZjvOvJjR3s5IfPgB6
         Fo7hObu5VtRIVNBtkAcnQvxd8bqyQBf4/P/ZRYegJYmNSZx151+dBebY72jEg3C6SacT
         aSA+VHiRavLfu/6oesnfKRyeHGkpV756IRSI1+aLc0ZcZLEa85M2ZLJkMsNZE6C5g99v
         +KlfRoDWMDY7BgsMY/vOcGwnfGeWe5x1NNeIv/R3Ljs1QGf16pzoE1Rw9Ni0Nmoky1Z/
         Q1gJ2QBX8nissXMnAtasxWA6gervYUFT8H7MotPFWCZ/2Im+SNwqBomeI3oIxF3qP68E
         Lqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091510; x=1786696310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kCBAfJcqbgF3AmCRrsKCNXyT2G3N/ne3bssrcVUdDDM=;
        b=V0Iav2yDemcnRggib1AcML+gx4aodfdSVOuLaLya3YHE6QHDLviS/1mUBsiCe7Fm6U
         9ZGu04jYrUHXaK7q3weTLcpzf7GFynxfepzhbNfXP2bvPdzMDm6qFurrDEgmelSGdCTF
         VpQCt2SftzYFYgZeJrLO7xYHgiG2ygFEIP72/ZDDNiz+gHH0myjHC5VziQdcXLMvK/yv
         kmYRhImDxKBH/ic6bqR9WATWdillc6f/ly0MFky94df7ofwZopFP8KjmnC4+oJOxeKxX
         2biRgkBY+b8sO9kwnv89QBuiWHAHsyxgchg7tPdAKo2NSuxD03tEm/1jszczvhpih9G4
         URZw==
X-Forwarded-Encrypted: i=1; AHgh+RrstuKY0ST5Kniw3NCIgyvmZBUiAWB7+5t+xnvygEpb2dffdJdLZSq1m7kN64e4ssVX6/WpZ9acH6zb0In50y6L@lists.infradead.org
X-Gm-Message-State: AOJu0YwotkGDBBuVFoDJPJsgMjUwI7dhC6OJabHBW7V7BGb6YqL4B5r5
	w9sB3ocAvuwCTDenNmU35zDtnwLVxTNHBrRQwl7wLDxm+Bv/2eawnqrc
X-Gm-Gg: AR+sD13XL2ZpGaRU03YlnizfphWb3V7QSYqddUop0G8mvkVT05Jhg+GVNcQ+v5mybLF
	VFbfXJxl8b24OeaHl5FJ0cbyFV3OwrDeaEe3GJebpQpXgoMA52XJrRfXA6/rOHdTXhCvcYNcf2X
	e+pg0kKXoFC/XyCHOgaXGp1VvZd4oaBUEz/TqzD9wVDQZUwYVq6RG8lHyfab8gPnB5LHjtwqKNy
	VKfYhekwzmhL6bcs1LGcNjoVMqnQrxCNBq45oWJQnEf9eOOgDc+uyzKTiJiXW3/Ie/gcuogpY9D
	loeNbcwPSXEfIiQ6jsG4pmivoFEQFTzEU67nO63kJ3/dUWcTzKEEWaI7cLidLNkzPERQpRfS6DV
	IQn0wUWYG11e8Bv9KMlX9CqKaSWyn4w5/cQazggp9yDIqRfUzOR8+F/4PA7WU7nWryYYPtw7rc0
	+p0tjegAjye5sDYJo/uf/oY5p3Ia+pUOD7URBLrf0ThNyA5oeesHEb6tOawBwj0NC/P7s3RqTLa
	SMYMY8jaFuXCGNSl3Vh6nCp1wLmuROrsKVx5QBFI4xwILHRwA==
X-Received: by 2002:a05:6a00:3d4c:b0:848:417a:d1a6 with SMTP id d2e1a72fcca58-84f2dff0031mr23770572b3a.15.1786091510336;
        Fri, 07 Aug 2026 01:31:50 -0700 (PDT)
Received: from fred-System-Product-Name (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a553071sm627409b3a.43.2026.08.07.01.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:31:49 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] ARM: dts: aspeed: santabarbara: Add system monitoring GPIOs
Date: Fri,  7 Aug 2026 16:34:03 +0800
Message-ID: <20260807083415.672008-1-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_093153_259533_5C8538DA 
X-CRM114-Status: UNSURE (   8.78  )
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

Update Santabarbara Device Tree to include several GPIO expanders for
NIC, Switch, and system monitoring.

v2 -> v3:
- Reword the system monitoring GPIOs commit message
- Disable power monitor nodes for ICs that now have multiple vendor sources
- Add GPIO line names for the JTAG CPU debug interface
- Add SGPIO line names for MCIO thermal trip monitoring and UFM read-complete
- Add a leak-cable-presence IO expander on the module boards
- Link to v2: https://lore.kernel.org/all/20260421130344.2751662-1-fredchen.openbmc@gmail.com/


v1 -> v2:
- Add system power fault alert and E1S GPIO expander interrupt
- Add switch board SKU IDs and power good monitoring
- Add NIC1-4 power good monitoring, reset control, and fault detection
- Update the commit message
- Link to v1: https://lore.kernel.org/all/20260129073749.3155383-1-fredchen.openbmc@gmail.com/

Fred Chen (5):
  ARM: dts: aspeed: santabarbara: Add system monitoring GPIOs
  ARM: dts: aspeed: santabarbara: Disable power monitor nodes
  ARM: dts: aspeed: santabarbara: Add JTAG GPIO line names
  ARM: dts: aspeed: santabarbara: Add SGPIO line names
  ARM: dts: aspeed: santabarbara: Add leak cable present IO expander

 .../aspeed-bmc-facebook-santabarbara.dts      | 200 +++++++++++++++++-
 1 file changed, 192 insertions(+), 8 deletions(-)

-- 
2.52.0


