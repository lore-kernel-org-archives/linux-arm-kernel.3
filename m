Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C491FC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 13:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=82ZzxMwz66wTm/Q8WAcyNS4waCVr3h4rwS5RxEI/cOI=; b=Nlar0pOTEpldSRjsY86OavQyw2
	luLgAVqBL+vRpX61nj7I+d4eAJW7G6hI9wSk88wMSLojaNF4S7K8mfRPvwbycslJXrKjopqumwADE
	5V511D03QEZaLmDghaFWLF9A+2KtOsbdt30xZuO3BJFG3XLrQtBNwfAUIqLgC7YWp+Cek5a25xU9V
	EE+bh7Tjx+ATmZ/C8+sD8rEeqDES3G98LbzBCIGk+m6EjYOdNUWMGT/5If8aA6g8SZQm9yrxlfgl2
	MWAWCNbRcZ1xCKMBuQsK44rH5UIKFnlgWbxB9ElaVBzuoH4+aeZLi20U0Mok6DycUg/F0+CjAcvGJ
	XH9PwlSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tojOn-0000000G4Xd-2GIG;
	Sun, 02 Mar 2025 13:30:29 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tojFi-0000000G3vH-0bO2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 13:21:07 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 522DKovK3080964
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 2 Mar 2025 07:20:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740921650;
	bh=82ZzxMwz66wTm/Q8WAcyNS4waCVr3h4rwS5RxEI/cOI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=l4XjVN0uL46iXAx/TgrKXb3lgX+7w4gEKxz8SEgcNP2ub6m5vFAOCRjF8XcBRHbq0
	 x4dmz4DzDVX2MmliICdbQDhWUVxUkU4i9ox8vi/Z6AxUFQTHVc0p0oSb2Mw/jEK2eu
	 B0tmPTwO2It4ByGTEWQC+lVJH6nYO2JyCNOW62jA=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 522DKoOU018374
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 2 Mar 2025 07:20:50 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 2
 Mar 2025 07:20:49 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 2 Mar 2025 07:20:49 -0600
Received: from uda0132425.dhcp.ti.com (dhcp-10-24-69-250.dhcp.ti.com [10.24.69.250])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 522DKj8E070180;
	Sun, 2 Mar 2025 07:20:46 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jai.luthra@linux.dev>,
        <francesco.dolcini@toradex.com>,
        Stefan Eichenberger <eichest@gmail.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Stefan Eichenberger
	<stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62-verdin-dahlia: add Microphone Jack to sound card
Date: Sun, 2 Mar 2025 18:50:35 +0530
Message-ID: <174092143355.3272913.9537150435807250847.b4-ty@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217144643.178222-1-eichest@gmail.com>
References: <20250217144643.178222-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_052106_278473_FD28F4B6 
X-CRM114-Status: GOOD (  13.64  )
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

Hi Stefan Eichenberger,

On Mon, 17 Feb 2025 15:46:04 +0100, Stefan Eichenberger wrote:
> The simple-audio-card's microphone widget currently connects to the
> headphone jack. Routing the microphone input to the microphone jack
> allows for independent operation of the microphone and headphones.
> 
> This resolves the following boot-time kernel log message, which
> indicated a conflict when the microphone and headphone functions were
> not separated:
>   debugfs: File 'Headphone Jack' in directory 'dapm' already present!
> 
> [...]

I have applied the following to branch ti-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62-verdin-dahlia: add Microphone Jack to sound card
      commit: 7139df64e7c13c079b754476355c62b490213055

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
Vignesh


