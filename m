Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008F9C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 08:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3OKRzgTmhPXAg//lEvyW0v8602qzDdflfkOw5zbN/8=; b=inn82WuG4BYFU6AhLWsW55Y4/Q
	pt0G7BeZmzMXvRCxFbUi2U67FCGbMwkqkF9zYpMdriL8xJNTlSI0MYVke3fpb723CBKxWBqfTi6n4
	Qu52gB/zRNDTAm3SZpeWggmKVMBQCVmJshklfMNgBO8jUcdPJrWfohvzr0l1aFo3/7zlkGi6N26Je
	oyatrWsPpKxRfUvcTxNqETkkJxVrYX4XQEibTWsNYjRdHYGdDtJY5pk+P/QKYgy2mFko8d/FcxHkN
	CGmAkvnvAOtnaEpNtd+psdBW0LvAdJqbXPdDR5oYfMqaoKFr8de9EOxLgHGDSngobf9k7BobEYyVO
	JORagCtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt04S-0000000DOTG-2dsh;
	Fri, 14 Mar 2025 08:07:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tszy1-0000000DNQr-15bF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 08:00:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 91648A4884F;
	Fri, 14 Mar 2025 07:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 233A8C4CEE5;
	Fri, 14 Mar 2025 08:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741939228;
	bh=7U8GExGUpIrRj21vxo50VT57HSCBjO9buljApi9E9Pg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ip2N1VrFv07pJUN826d9NhByxmZDPrULXITjASJ0+CdknlGXT8HPiuJYW5W5mhFjW
	 8DXTYNA8XDKNPHhZNPMTkkE0OxZUvRg7+maUvfhffmOtxKhEYZUu62RqORGVw78zjz
	 tMKrODkyUaf2MtiMqJXC6G0gV21xjC0VXhLwZConcNmX3V4IZtYhd6QnVc9ty/re4+
	 1MCX5njrIslpGQJQMTxEXLS8wlQvg83vCznIa/XoJXsuPIqUxKuXW5bvwMqGr+AdXN
	 rIf5xtkEgwwHw19Zqq6KfjyIvtwy2vtYNvjx1jAuC8ghCvsZA3mjpFNvdrsA/lAaax
	 FIlOLUOKscRrA==
Date: Fri, 14 Mar 2025 08:00:22 +0000
From: Lee Jones <lee@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v6 06/10] mfd: bcm590xx: Add PMU ID/revision parsing
 function
Message-ID: <20250314080022.GH3645863@google.com>
References: <20250304-bcm59054-v6-0-ae8302358443@gmail.com>
 <20250304-bcm59054-v6-6-ae8302358443@gmail.com>
 <20250313132036.GB3616286@google.com>
 <ef190ba8-a5c7-4a1a-90e6-2610de00e4ed@sirena.org.uk>
 <f363c1ce-8612-476e-a5d5-c3cb358bf50a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f363c1ce-8612-476e-a5d5-c3cb358bf50a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_010029_364462_B05201D0 
X-CRM114-Status: GOOD (  16.62  )
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

On Thu, 13 Mar 2025, Artur Weber wrote:

> On 13.03.2025 14:25, Mark Brown wrote:
> > On Thu, Mar 13, 2025 at 01:20:36PM +0000, Lee Jones wrote:
> > > On Tue, 04 Mar 2025, Artur Weber wrote:
> > 
> > > > +	if (id != bcm590xx->pmu_id) {
> > > > +		dev_err(bcm590xx->dev,
> > > > +			"Incorrect ID for %s: expected %x, got %x. Check your DT compatible.\n",
> > > 
> > > Isn't it more likely that the H/W this is being executed on is
> > > unsupported?  If so, say that instead.
> > 
> > Given that the compatibles are device specific the driver shouldn't be
> > binding if the device is unsupported.
> 
> Yes, the intention here is just to make sure that the DT compatible and
> hardware ID match. Unsupported hardware would not have a DT compatible.

Right, so the user is utilising the correct compatible on the incorrect
(most likely unsupported) platform.  When using a supported DTB on
unknown hardware, the driver will bind but fail here.

-- 
Lee Jones [李琼斯]

