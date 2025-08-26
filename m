Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59A5CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 14:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hZ4+kmtQ4n5NLNqZUM23K1CGDN4HN8jX9iPxIm2AOU=; b=0nbBj4dmw4wb06ukqFVZ8j2MUn
	FVqhgQHtA8X0gTrfSKmnHb4ytNoQ4nmTmUbnpNbHaoKqksmi7YB03L6jOW+r0UPjhGFhnHY338hDi
	oZgIbUhBssbcKxgU8uUtWSLD+OyTVcdVRGbjZlOzfzuELwy5dSqTZ3NR9pFgQUb9YZPrHXOgy89a6
	snn6kEgGcUkkA+XESekNInFHO+WXinTovydyO2MkGI1Vz/xRsaIAnUetmZayz2K6vFzOvGNkt6IIQ
	L9yK+0lRaCd9m+weJfHRgXqNcJ4nhffwbWA+aun0yXoTRhaRhvLhZ1uyp4eOk5R18zIVK+ea4SE8q
	gHaqidUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqv18-0000000CKX4-0bVI;
	Tue, 26 Aug 2025 14:51:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uquvK-0000000CJS3-19TX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 14:45:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D0BF60228;
	Tue, 26 Aug 2025 14:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92C4BC113CF;
	Tue, 26 Aug 2025 14:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756219521;
	bh=2fjsl71zFKbXs3ws16pco+vp93pc2Qs+5PISA74aiUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y3R+aij1aGBJdGAHoAvaLVaVHo3OsAEERdumuBbMQx9Afo2EKHbZGXh3bBZp1qOTU
	 6OGYULvDxm3rH0YZ3F3rCvnZ/rWuiZJx4oMRls2/vzUEbbJccEb263T6prDFHLgC66
	 DvdOd5WnNmRNoMQZA7iKNDoXp/Xd15KyfAUHfjMc=
Date: Tue, 26 Aug 2025 14:51:30 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, stable@vger.kernel.org,
	patches@lists.linux.dev, linux-kernel@vger.kernel.org,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
	lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
	f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org,
	hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
	Ben Copeland <benjamin.copeland@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	srinivas.kandagatla@oss.qualcomm.com
Subject: Re: [PATCH 6.15 000/515] 6.15.11-rc1 review
Message-ID: <2025082612-energetic-lair-ee26@gregkh>
References: <20250818124458.334548733@linuxfoundation.org>
 <CA+G9fYt5sknJ3jbebYZrqMRhbcLZKLCvTDHfg5feNnOpj-j9Wg@mail.gmail.com>
 <CA+G9fYt6SAsPo6TvfgtnDWHPHO2q7xfppGbCaW0JxpL50zqWew@mail.gmail.com>
 <CACMJSeu_DTVK=XtvaSD3Fj3aTXBJ5d-MpQMuysJYEFBNwznDqQ@mail.gmail.com>
 <2025081931-chump-uncurled-656b@gregkh>
 <CACMJSesMDcUM+bvmT76m2s05a+-T7NxGQwe72yS03zkEJ-KzCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACMJSesMDcUM+bvmT76m2s05a+-T7NxGQwe72yS03zkEJ-KzCw@mail.gmail.com>
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

On Tue, Aug 26, 2025 at 02:06:04PM +0200, Bartosz Golaszewski wrote:
> On Tue, 19 Aug 2025 at 13:52, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Aug 19, 2025 at 01:30:46PM +0200, Bartosz Golaszewski wrote:
> > > On Tue, 19 Aug 2025 at 12:02, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > > >
> > > > On Tue, 19 Aug 2025 at 00:18, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > > > >
> > > > >
> > > > > Boot regression: stable-rc 6.15.11-rc1 arm64 Qualcomm Dragonboard 410c
> > > > > Unable to handle kernel NULL pointer dereference
> > > > > qcom_scm_shm_bridge_enable
> > > >
> > > > I have reverted the following patch and the regression got fixed.
> > > >
> > > > firmware: qcom: scm: initialize tzmem before marking SCM as available
> > > >     [ Upstream commit 87be3e7a2d0030cda6314d2ec96b37991f636ccd ]
> > > >
> > >
> > > Hi! I'm on vacation, I will look into this next week. I expect there
> > > to be a fix on top of this commit.
> >
> > Ok, I'll go and drop this one from the queues now, thanks.
> >
> > greg k-h
> 
> Hi!
> 
> The issue was caused by only picking up commit 7ab36b51c6bee
> ("firmware: qcom: scm: request the waitqueue irq *after* initializing
> SCM") into stable, while the following four must be applied instead:
> 
> 23972da96e1ee ("firmware: qcom: scm: remove unused arguments from SHM
> bridge routines")
> dc3f4e75c54c1 ("firmware: qcom: scm: take struct device as argument in
> SHM bridge enable")
> 87be3e7a2d003 ("firmware: qcom: scm: initialize tzmem before marking
> SCM as available")
> 7ab36b51c6bee ("firmware: qcom: scm: request the waitqueue irq *after*
> initializing SCM")

6.15.y is long end-of-life, so is anything still to be done here?

thanks,

greg k-h

