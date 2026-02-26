Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19733FC590F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 08:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sHpzMvWuCY84sah/2m8MLfZR+WWY3bl3noDNvu5O8ao=; b=HZZ10y7J5SbmwgjV+JLHBV84zE
	BL/tKH7IdJhb7XRMrb391U1Bq85SCy9e2M2FviVvp6IC34d4OOkDf6OSPXTR2QpQbnrMmgI3h+FT/
	IU6i8C6omH5vqz4geKcGCyJrCp6bJHW9sxSkXklvFmtMoeK9u8bfTqrFN51O30UA7A9h3RUPevp68
	rMe5zXXLCI6AIv2yB1C1XeCm+4NUS44WcYFgOl6+bGs0xvuPylyKzwkF2QbOTNcQn/Z0mWIkv0r5A
	RzUGsCbS8Hd23mJTtHxB+uSBqkVD1mXqwxZ3ChtAgwl03mUMhklAOar9O7+Hl6kiIO6Yi51B7T8L5
	R0PMd9sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWyM-00000005gZl-3J0t;
	Thu, 26 Feb 2026 08:43:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWyI-00000005gZS-3UnN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 08:43:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 655714400A;
	Thu, 26 Feb 2026 08:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60844C19422;
	Thu, 26 Feb 2026 08:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772095426;
	bh=6ywaiuYNqseRn1mvJq29f98IwXuNv4cBSJB8jKhMaNA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YhtCsOIMMFhGtOCm3amop+MoKMzWu7Uaz5lKPa2BDe82uvsobCDSXT7zp2bUGc2yt
	 4OyrNOAO3BevmhZH42s64mbOnjGlgyZpYfjCBCORS7vuPLC04Wm1MPkuYT8sO0rzz+
	 zqj9FKOaqh6YYcS8J0Oh/xAIXegWocu6N8yJbdmC/j5IHTBlejzJBUx0bvM0SASbdn
	 lRCR1eEs2Yv77WE8jkBC1SZ/qMs5ZYYlrmDZoduju2v52435VcVPcbpMveXw2QiH/R
	 TDZPto8L6hLf1KyZU1nEE4VUw/CM/pKXPNiwTsVHwM1/SFC/3//EEhtRR5X56TAzlA
	 2iYg3EqGFk1OA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260122003501.1191059-1-florian.fainelli@broadcom.com>
References: <20260122003501.1191059-1-florian.fainelli@broadcom.com>
Subject: Re: [PATCH] memory: brcmstb_memc: Expand LPDDR4 check to cover for
 LPDDR5
Message-Id: <177209542511.27851.15259973659521995959.b4-ty@kernel.org>
Date: Thu, 26 Feb 2026 09:43:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_004348_532734_620F91A7 
X-CRM114-Status: UNSURE (   7.17  )
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


On Wed, 21 Jan 2026 16:35:00 -0800, Florian Fainelli wrote:
> The same limitations that apply to LPDDR4 also apply to LPDDR5. Expand
> the check and rename accordingly.
> 
> 

Applied, thanks!

[1/1] memory: brcmstb_memc: Expand LPDDR4 check to cover for LPDDR5
      https://git.kernel.org/krzk/linux-mem-ctrl/c/a969a0835152984a0f556434eafdee0b84213670

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


