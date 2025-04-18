Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5123FC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 18:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XF5UFEiPpcoG4EPoQ5tbuqNRT1AiCobPXUiSYtdTDLo=; b=gDmXAtJ8FcQvRK2JKHc1Bql7P0
	K3v/32pmrhIuJ1gPRAyPtOO5Q5KQzeA3LzCpUXqzSAadaMBWN8uvnVc0F1O8oVa8dmUvPaqWC4G9l
	FOKP2S4Wrw9XiIL/G/EjPsTlUT2NmZdjWiWibcsKUUyyLLFnTVz+yarbOYXuWv4nYqXQ1eDBBDT25
	jwLcm5YIVyU8Fo7+8BDoYrzOMKaeAiz6W4dSQphRp6BQjWwaohgnPYYbyH5ai+fSnkyhObzp/NedF
	KsJvNUqHV2B0BDdBORVfY9SWRGG12quI+vmI2jqgpdpbMEd2yzy8BgY/SKlK/ocZbaAekjWamhilN
	WmDVp0KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5qti-0000000HWuQ-1jrt;
	Fri, 18 Apr 2025 18:57:10 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5qqh-0000000HWXn-2cEU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 18:54:05 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53IIrxXn1000830
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 13:53:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745002439;
	bh=XF5UFEiPpcoG4EPoQ5tbuqNRT1AiCobPXUiSYtdTDLo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=J3Eiw7ZGqetox3+539+LJ9Ptm8Fa+kitgTEhEX7da25TwqN35flJI2M/QNcCzSvT1
	 vx6/n51iaEMRlkEifLeVadjT7o4QVFYtsE5fD0ZSuSY20sBXX8y0Xgp3+DEm7u07Fa
	 jiepfgJKOcXHJm7PMtpU8Pf5zcpBbYwfBSAI6b5s=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53IIrxJf077947
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Apr 2025 13:53:59 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Apr 2025 13:53:59 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Apr 2025 13:53:59 -0500
Received: from localhost ([10.249.36.23])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53IIrxDq114058;
	Fri, 18 Apr 2025 13:53:59 -0500
From: Nishanth Menon <nm@ti.com>
To: <shao.mingyin@zte.com.cn>
CC: Nishanth Menon <nm@ti.com>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>, <ssantosh@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <tang.dongxing@zte.com.cn>
Subject: Re: [PATCH] soc: ti: k3-ringacc: Use device_match_of_node()
Date: Fri, 18 Apr 2025 13:53:57 -0500
Message-ID: <174500239091.94267.5561449667206494033.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250331201425296l4h98bZjxHzs08fdvHrGO@zte.com.cn>
References: <20250331201425296l4h98bZjxHzs08fdvHrGO@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_115403_712474_03D31A61 
X-CRM114-Status: GOOD (  12.78  )
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

Hi shao.mingyin@zte.com.cn,

On Mon, 31 Mar 2025 20:14:25 +0800, shao.mingyin@zte.com.cn wrote:
> Replace the open-code with device_match_of_node().
> 
> 

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/1] soc: ti: k3-ringacc: Use device_match_of_node()
      commit: ae9c0b68089d5412bb252c4adbeff122017557c3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D


