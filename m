Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229EACA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 18:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PZxPMEjPTKCPQuV5Vdll2zGdxDT5RzAvIigUnlJowmg=; b=u6/9Oi0RO+KsJAeO4C6C3EYnF0
	V9dkY3L4AatJWLNE30oXudnA2nNndVhGk1PMv3BImYktwU1RQM0iGa6WlI22tPwi0do1LzFF3TJbJ
	Gv1A9h4SwwO8wel9D9fVbZKAIhOCZWSzifrYEJtBVOKp/RbVdrhb4FPGVrvAd+vNnH+dMqDCORzHU
	pyTahdm5H38RK7Og+/RLHvKv5vZV4ERd7DF5Sf8dAo4L1ASGNQIttSGbn019Ky8/cVwnfiT4lTrDP
	8g/XROSnptVMhS+qEN+y1SScpAyPWqZhWJsTmm7KQ3GmTnIoAgGErko1+qGlU32qkPXlsLZDftOlg
	J3D6ZdxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utsGc-00000007ItA-1dYc;
	Wed, 03 Sep 2025 18:31:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uto2G-00000006fqD-3S6M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 14:00:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PZxPMEjPTKCPQuV5Vdll2zGdxDT5RzAvIigUnlJowmg=; b=zZtl8LDOWyf58VMvu585aBJR/d
	VIR5p/ovbKNLwNroL6S9fJBtlMxJhfGIEI2uVNVwdN7MjPX7W2IKNlVsytMjmopBwhndH9RaG2duX
	BCdVq3MiX5gsXa/PbQW1I3ABt26OQm5BAE6R3MQtyDYZ+AANiARddOCnBJm0p9srzJShLq3tPkzL1
	vIAEVlF2byC5srNZr95WIq3qwr3Rv9B8F4KNgSimXPEiR15EObk7wSaasOkihcK0IYBEvZCtN+SC9
	f7IT5GgvrxR5kduuY8Rh8mvn1/5yry/RYALtCrZSbSUWgHhj65YEunExZw7vGtROADkMNEeesLk0k
	hhDm2Lug==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48416)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uto29-000000000bj-2vxv;
	Wed, 03 Sep 2025 15:00:21 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uto24-000000000ag-2hTt;
	Wed, 03 Sep 2025 15:00:16 +0100
Date: Wed, 3 Sep 2025 15:00:16 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 0/2] net: stmmac: correctly populate
 ptp_clock_ops.getcrosststamp
Message-ID: <aLhJ8Gzb0T2qpXBE@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_070028_859503_34D932D6 
X-CRM114-Status: GOOD (  12.09  )
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

Hi,

While reviewing code in the stmmac PTP driver, I noticed that the
getcrosststamp() method is always populated, irrespective of whether
it is implemented or not by the stmmac platform specific glue layer.

Where a platform specific glue layer does not implement it, the core
stmmac driver code returns -EOPNOTSUPP. However, the PTP clock core
code uses the presence of the method in ptp_clock_ops to determine
whether this facility should be advertised to userspace (see
ptp_clock_getcaps()).

Moreover, the only platform glue that implements this method is the
Intel glue, and for it not to return -EOPNOTSUPP, the CPU has to
support X86_FEATURE_ART.

This series updates the core stmmac code to only provide the
getcrosststamp() method in ptp_clock_ops when the platform glue code
provides an implementation, and then updates the Intel glue code to
only provide its implementation when the CPU has the necessary
X86_FEATURE_ART feature.

As I do not have an Intel card to test with, these changes are
untested, so if anyone has such a card, please test. Thanks.

 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c |  7 +++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  | 10 ++++------
 2 files changed, 7 insertions(+), 10 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

