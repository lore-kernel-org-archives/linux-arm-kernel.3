Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4D7C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 19:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zW66JlASrZdxP04HyoAnrXP/yDSLGw95Tk/l8IOyHL0=; b=JExGoIYu7TQwFDo9AH6fEJ7H+L
	33jxl1R+v9ZupZBvFVA1qyhLPEevNtJwNmdIQmBgbKG4NiIwKs6U4MKnfPgqMslofWHwEODN5mbUa
	mgPIBgivjgwa+ZRf50irBlN8HLvgUWkW9ICtnnGdELxTjkYYIF2xemR3QVvq+anLDUqoWtXrsbz5y
	kOlipID2WhtDxld2phXNRD5ZysfHHERil/WHPrFzN/KNAA1ObIuuwNHuy4+q42DDFAPpGDi9tl1H8
	KhtgbqMOLzjMx+2a6UjQ/IcHLEa1ovMqwJmPU4ul7f8sueoSTCkZAGgCAwwbxVinit6x5CeuRnMRS
	mFpCc8gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jFD-00000003C1I-3j9o;
	Mon, 21 Sep 2026 19:00:03 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jFA-00000003BxI-462i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 19:00:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C93C21A0D72;
	Mon, 21 Sep 2026 18:59:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9215F5FFB2;
	Mon, 21 Sep 2026 18:59:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 61CAB103291F9;
	Mon, 21 Sep 2026 20:59:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790017192; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=zW66JlASrZdxP04HyoAnrXP/yDSLGw95Tk/l8IOyHL0=;
	b=lVF7ADjW+p22Deio9C6i0a5wp3zzwjI/F0P9jXHDXmM4F3a4N29k6KwQOn3+ZcTTMihC+h
	mvnWXaloW6TlAogciHyPz53YcKy688svOakxZaKly2gxUE2cWq9msZ4tyaGeBKl9h/LRjJ
	k2vyQx7624LnCp911aVduI/ZI9KCtk1ZSdMjZ5kbwbYJUF17yU5NpdgqsPo7scEGfe+zrr
	k2XCYbDXYSb4+trllMyMRiw4TBfTBJlfDS5BuOM131oG5cPOmpt4TuSQB2LYIqfINrxz7b
	cBk2o7UEIVrGRAsB/Umju11B0PVAel5jj4tZrpZJRfyMARY1lhsy/9VK36Vq+w==
Date: Mon, 21 Sep 2026 20:59:49 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sander Speetjens <sander.speetjens@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Dom Cobley <popcornmix@gmail.com>
Subject: Re: [PATCH v3 2/2] rtc: Add Raspberry Pi 5 RTC driver
Message-ID: <20260921185949d6debd17@mail.local>
References: <20260917135841.841680-1-sander.speetjens@gmail.com>
 <20260917135841.841680-3-sander.speetjens@gmail.com>
 <20260918-outrageous-myrtle-giraffe-80dfdc@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-outrageous-myrtle-giraffe-80dfdc@quoll>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_120001_178149_96D02EEB 
X-CRM114-Status: GOOD (  11.85  )
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

On 18/09/2026 13:47:22+0200, Krzysztof Kozlowski wrote:
> On Thu, Sep 17, 2026 at 03:58:41PM +0200, Sander Speetjens wrote:
> > +	return devm_rtc_register_device(vrtc->rtc);
> > +}
> > +
> > +static const struct of_device_id rpi_rtc_dt_match[] = {
> > +	{ .compatible = "raspberrypi,firmware-rtc"},
> 
> Please fixup white space issues, see existing drivers (missing space
> before }
> 
> > +	{},
> 
> and unnecessary ,.
> 
> Just take existing latest code as starting point, otherwise you
> reintroduce discouraged patterns.
> 
> More important: undocumented ABI.
> 

This was my comment on the previous revision, I'm not sure why it was
ignored.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

