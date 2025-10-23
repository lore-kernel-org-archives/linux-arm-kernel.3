Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B1CCCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 08:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ULH0iKccBdyyGfKIPE8SP4G7gUUCYwe77y7PIyw28Fg=; b=hX4Q45Oha07hJtk+IkSFYB2Tz8
	ZYnlOCqjMOqwFvkdyzwt0xNZQnQFcWr51LYgXoiOwV6i1vipfttY0RpiDhB8FZd+q042tDaSjUE8K
	GuUneKtpL/uc6Ruis3/D7rQhogwMg3nCCVgs6CtVidoKimKIMxRnLbvGDqbAmNOs2vU9qvxMMsatm
	r/6FQ/qcmsJUk8yrAbsPunFttxFjdix/sgfzoWk2aN2FXrrJNpZQqbic+1p4jr0/B7iWG/QTwkT1k
	Ba755ci+i6GFAl7vV6NJvGBlpaUWoyfdvh0P81fWO0yhElYsmpEZFLUBZTcsf1DeTwR5ox1PsxNL7
	8SM7LYzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqan-00000005WeE-1ORy;
	Thu, 23 Oct 2025 08:22:41 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqak-00000005WT9-41Bs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 08:22:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1761207687;
	bh=ULH0iKccBdyyGfKIPE8SP4G7gUUCYwe77y7PIyw28Fg=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=RMu8PuwNyWwVysi3GYFmcVSahB5oN9moyuTihwByGtDHXpY+VWx5YwLa9ho4Zqmju
	 tjwRuotj9zbf2yf4mllBSM3oXd61bAx7O/atSB7X0uAFbfWw1gApInmGV5eDxgxw4H
	 rlNMtLs65O/DkDV6IBIVo9gBqBpW2T9pAsZ5BiHU=
X-QQ-mid: esmtpgz14t1761207669t0c42400f
X-QQ-Originating-IP: e3alAhthGovW8qQgWjONEgVC26JHgxvMtn7tkZ6Ir2w=
Received: from localhost.localdomain ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 23 Oct 2025 16:21:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15548364574209632140
EX-QQ-RecipientCnt: 6
From: Qiang Ma <maqianga@uniontech.com>
To: ardb@kernel.org,
	linux@armlinux.org.uk
Cc: linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Qiang Ma <maqianga@uniontech.com>
Subject: [PATCH 0/2] Remove duplicate function calls and useless message
Date: Thu, 23 Oct 2025 16:20:51 +0800
Message-Id: <20251023082051.75183-1-maqianga@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: NlWvLSkfVnGcnCndnoah1DKaYHvTUYsnQRFyON0Cg2sXiKIeOARTbw+g
	Kvg0gezSHv69PiNOktscNoSPLV7qmDyXa4Yn3oDzcuZlnDMGcrc6MsyezB2aGpZvF0A0iaK
	hf3QlldP+tKkFO2laQQiaowy+S8Ka/JOWGTWERLq3YexkekjGBpCLsmulxLBnwUDxDBBNfX
	1LcKPzmK3xyMIjbPo41Hr+sdygm7eaNy2CV+tVlEKMo49IOIOpWKwxL6tPCN7o0awt4/O3p
	KERnPVl4pFaLjlROpljizSnxJSxa+xqzURrXQCIvvGgdTIE28xnF1mrPtdzerk6KvNZdAC6
	xGThdYEcA26W+jkdnxtPIa2zrNl6q8yZihmyRO9xGbOVSb6CXiNvETSvDsV5RbG8S17EVBb
	JbRdifc/mO2L5YTz1zRkYy1RQJOX/JlR7r/m9ww4kbRLArG1keemKwoE3aaI0HSNB+QCtkf
	rA5nkOX8lHbFSFGm2gDi7EcGOT1sq52XB8LAbCZt00Ua60Xz20U7zfeD7gQAJqamLhK0K9l
	uZFkn6qmMVeoc8wGWemU0fLJ6WPnItlgxUyyNaG4P1wPKfeQjdYuYdmv7wFG7kno/Shq5+F
	QjUPUHrCCE6LKHvI3DHhYBgNAq4iZIeNefTWXicKnd1CoP8eI+t9SEiwebwsbBNK9ge9xJC
	BAxxhHOa7LH2qhysk5QgVxr1f/Aqf5c9TYi4rWMXmNZS4VgPViQeMO48VBV9OzLCJcCB/ZC
	Vz4EANCo88iiGBvNRCfqsEUauKjP8qHcaRTl+t5eJUaSm20Ifgy4QCNC9rNnEJVaD78tWiM
	Qr3vd10Cxb3l+OH2WNdp6HtUiHRxY+Y6JraJpMk+XeCpwvfOQsYoivL0miXmPzDv2wzE/3Q
	a9HVyvlfrnfvXPk84EP6seZriqqd0JRt/Gctcmo+YCnrUkvFoeJfQT9EiYvad3S57wqADqQ
	SLOexmLrBw8yPL46QEKzh5BGW6togFKYU8ZRf5DShjAWSf7qlLNkz+nhIjl8Mb3yYHq4XQJ
	aZorEGBg==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_012239_536780_831F63E6 
X-CRM114-Status: UNSURE (   7.42  )
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

From: Qiang Ma <maqianga@uniontech.com>

This patchset removes duplicate function calls and useless debug message

1. The efi_set_mapping_permissions() does not need to be called in
efi_create_mapping(), because efi_memattr_apply_permissions() will be invoked.

The calling relationship is as follows:

==>efi_create_mapping()
   ==>efi_set_mapping_permissions()
==>efi_memattr_apply_permissions()
   ==>efi_set_mapping_permissions()

2. Based on the first point, efi_create_mapping() always returns 0,
so there is no need to print the failure return message.

Qiang Ma (2):
  ARM/efi: Remove duplicate permission settings
  efi/arm*: Remove the useless failure return message print

 arch/arm/kernel/efi.c              | 5 -----
 drivers/firmware/efi/arm-runtime.c | 7 +------
 2 files changed, 1 insertion(+), 11 deletions(-)

-- 
2.20.1


