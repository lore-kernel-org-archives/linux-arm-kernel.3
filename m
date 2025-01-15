Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A237C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 10:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yBQTTvw8z4hK9WFWaFRSZaQkEzpA8yN75U3581HbobM=; b=rkpAbzcAvnZC+EYFPE1DWe4vQ7
	Z8c1PeqVs2Bn6o2QL9tX3Ks4l5sX1xtrkGSYfs5PswhyqP3q4j0w4UZ50xQLRmcIN/l89iiGkOqNM
	HJeE/MlmkqjgTast3XBpZ1AqFm7pMW5OwDPehyFiKHnUNJVVOOHLkZhoKVOIfoXZTMgHQZkBdTiYK
	LklW+BihgWXU9xxIEx84x3NptJFcXe8zA13bZBVI+keDMLpjq49TqxUEMzSQI9QFYejADOQaZHq3K
	epI+Yq91g3TE50Q2e80e9w3IGmJ9ijQFDi46cGGo9nLWFcVDtrbK4ax3AxA8HopJnHnkw3XXfgPiM
	sj4BatIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0vl-0000000BYx3-3glp;
	Wed, 15 Jan 2025 10:47:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0sc-0000000BYJQ-43xt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 10:44:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C2AD9A41C35;
	Wed, 15 Jan 2025 10:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E493C4CEE2;
	Wed, 15 Jan 2025 10:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736937849;
	bh=Rh9+zfbblKTz7REy4vq9oXWLyW2wZUuPHguspBBF3yA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m718dBXecQN4+ocJDTZ1eOSTh8C1dZ4FNX4xRlM3rKhzpEmNOfaJm2IX4kJRF1G3W
	 xQh2H25F9Fwn8SZQLqbT+pmACfC1JQKx8FpUvCjIrLwOaDQIXiCcCxpXgFwhKR8Nb6
	 rTM9q5pOZ5JGXvDeLbUAqno9R3ZjQUW1P27XAv9tk2dSsoYAKRcEvD+lOiFGKRT06u
	 jX72NYiHvM0qsFXWYVC3bER3JAHWKFMA+zKBGpqxUrACCuXfHH0Y5NUmNRuC6tB7pm
	 ZGtwZpQj2ZAoKbcchwewCLMLSr/uJa+xVRdwx/5CZLqFSi0p84VC9Rh/8GPh3edK5F
	 KP4Z2kJrYtg2g==
Date: Wed, 15 Jan 2025 11:44:05 +0100
From: Niklas Cassel <cassel@kernel.org>
To: =?utf-8?Q?Rapha=C3=ABl?= Gallais-Pou <rgallaispou@gmail.com>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-arm-kernel@lists.infradead.org, linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ahci: st: Switch from CONFIG_PM_SLEEP guards to
 pm_sleep_ptr()
Message-ID: <Z4eRdYc40veNWcxl@ryzen>
References: <20250109175427.64384-1-rgallaispou@gmail.com>
 <07a7177d-7705-4eb5-a11e-02a9429ffac2@kernel.org>
 <Z4EDKUb+hO0ovV2i@x1-carbon>
 <cfecaa65-f6bc-48c1-9295-9bfe18f13db3@kernel.org>
 <261f9fac-82de-4f39-bf5c-cdfcee917588@gmail.com>
 <88fb7ad5-e2b3-498d-82d0-cdba8cf50c1b@kernel.org>
 <a5608ccd-e427-404c-8eb7-f189591a57e8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5608ccd-e427-404c-8eb7-f189591a57e8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_024411_075157_0138D198 
X-CRM114-Status: GOOD (  14.48  )
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

On Wed, Jan 15, 2025 at 09:28:08AM +0100, Raphaël Gallais-Pou wrote:
> Le 14/01/2025 à 01:59, Damien Le Moal a écrit :
> > On 1/14/25 05:28, Raphaël Gallais-Pou wrote:
> > > > Do you want us to do that cleanup ? (fine with me).
> > > 
> > > Regarding the other ata drivers, if you have the patience I can do this
> > > in a few weeks.  There is other things on the stove I would like to do.
> > 
> > OK. We will work on this.
> 
> Sorry to change my plans,  I actually started working on this.  Is this okay
> to let me handle this ?  I will try to submit something promptly.

Of course, I know that both me and Damien are quite busy at the moment.

Looking forward to your patches!


Kind regards,
Niklas

