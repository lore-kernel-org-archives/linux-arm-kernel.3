Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372FECA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 14:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qIji/kp82EBdeMRhA+xzYVL1zHg1UNqQWFyDmXGviws=; b=vjptCt3+rtxY6YzbfxG1L2oNLP
	ft2EGIxy9VnnJc9ZVLDhefScjqaWSbnfaaVctKDnz8MiNqzqMW0GXPt2Bt1EZIzIuy4Jg4gAau7az
	0WTa2lW9p48juzFpfvt9Cy65zD6/hLRa8kQjwyKMzJgBaU1pG/nS6PoI4GEANhTh4bDE1t++0Vk7Z
	CtC9SDESyp/pcti+upd/G5SbF081VajWFYnNuEZqy4Pxh8orp9cHjzJK9iF30fXPuCvPv9Bxw1qqK
	rT90uGHlFAYGkWrtBpOYuNUEs63fNMRy9CpxjH+3LWb/jUV6GKIS94oXLft6LSTjrgb/9D9TQRqar
	4AlLzz3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNVR-0000000AmMT-15C4;
	Tue, 19 Aug 2025 14:40:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKt1-0000000ALXc-3Wwr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 11:52:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 63A445C5F69;
	Tue, 19 Aug 2025 11:52:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62878C4CEF1;
	Tue, 19 Aug 2025 11:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755604338;
	bh=XxdaRud82ur5QTXiEHjEJ8/3jvy+FXSBXFtjMYxqu3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wL6Az2rA1znO6zJV/Rte0239ocExiMjxP+bdWmU2VEEW9mDOlnpjpEMdUL3oQqhPo
	 fa9NEDoyxw80hUrbC/oZhVFkrA6rcd84gjTUA3QWCp2K5mZONrAud+hVOEMWxUPJ1y
	 ZmXgQTDAVpiZ/pwsJiMpk5McgxN3CSbmeKQlLOxQ=
Date: Tue, 19 Aug 2025 13:52:14 +0200
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
Message-ID: <2025081931-chump-uncurled-656b@gregkh>
References: <20250818124458.334548733@linuxfoundation.org>
 <CA+G9fYt5sknJ3jbebYZrqMRhbcLZKLCvTDHfg5feNnOpj-j9Wg@mail.gmail.com>
 <CA+G9fYt6SAsPo6TvfgtnDWHPHO2q7xfppGbCaW0JxpL50zqWew@mail.gmail.com>
 <CACMJSeu_DTVK=XtvaSD3Fj3aTXBJ5d-MpQMuysJYEFBNwznDqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACMJSeu_DTVK=XtvaSD3Fj3aTXBJ5d-MpQMuysJYEFBNwznDqQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_045219_953972_505EB104 
X-CRM114-Status: GOOD (  12.19  )
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

On Tue, Aug 19, 2025 at 01:30:46PM +0200, Bartosz Golaszewski wrote:
> On Tue, 19 Aug 2025 at 12:02, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > On Tue, 19 Aug 2025 at 00:18, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > >
> > >
> > > Boot regression: stable-rc 6.15.11-rc1 arm64 Qualcomm Dragonboard 410c
> > > Unable to handle kernel NULL pointer dereference
> > > qcom_scm_shm_bridge_enable
> >
> > I have reverted the following patch and the regression got fixed.
> >
> > firmware: qcom: scm: initialize tzmem before marking SCM as available
> >     [ Upstream commit 87be3e7a2d0030cda6314d2ec96b37991f636ccd ]
> >
> 
> Hi! I'm on vacation, I will look into this next week. I expect there
> to be a fix on top of this commit.

Ok, I'll go and drop this one from the queues now, thanks.

greg k-h

