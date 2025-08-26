Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5DCCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 12:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxFjkTB2P79PoUaLxLAUp+gv0c2aOYdZxNYZuNh3BDw=; b=Ll+GRqnZbRrO1Uz7q/3pE9AVlN
	Ycl8NDcULjwlHQSmloOhgnHKkR0jWzPbJmADLSJCLRPAkSEzzJxSi+6g0Ox1M19H0RqQpmT9sQ1XE
	ttcFR6aeruqXfGpylKFgMR10ZFfaBrcHGUth9geR/d0fKwg1XbcP5F70ESh/wwBJzlXwMjNL3veko
	4wlt/jwPoGDQHybUAEK8cV4H7lF/a862jmgDpd3c3Pmr3dzJk7GhYo539osRdZMbn59SKcI1Ncj/j
	fueqb8XdQ0uMJ6gOG6ZqgzA71JrXKpcWOwj8yI9Ht9XFInfn1SE1BN4npRo9bnYeCIJGlcBZwdhuT
	HjrGNbFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqsWo-0000000BuRj-0V7x;
	Tue, 26 Aug 2025 12:11:54 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqsRN-0000000BtXR-2xLT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 12:06:18 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-afcb78ead12so762100366b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 05:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756209975; x=1756814775; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lxFjkTB2P79PoUaLxLAUp+gv0c2aOYdZxNYZuNh3BDw=;
        b=tQaMZdfeeesi/qJiRvT8Y/7uiAeI6rENdz7lEsIgDAFdogIEvdC1Vz4tL3g8qgp4XM
         Vx3pgunzgaBhwFUv/yoGp+hyiedptY86sXuU8cGN9Mw7Ud/V89Pt7hhK5ThBIb4VgFdH
         9ACgpQ3vX+5FYWHkr9Rwm1MuSnDiMk0ri4prdyOL9Oq/O5C0jvTd2Mzj8HyOuv+dsOqq
         ZL3amI+7XHwOIMQcWKp1+Q6BRk7+RYriT8Gki2qdU43/wSmy/nBmEbiqhI/6nOWQDbvS
         EEZ8ssACgre0XFJ8f9U7RapLpmytX/tLpE2AiT7IQNhpnaPm4jtX7qq3XRywavNBq55m
         AGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756209975; x=1756814775;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxFjkTB2P79PoUaLxLAUp+gv0c2aOYdZxNYZuNh3BDw=;
        b=cbMFvaSdnkJgT6m9druI1hslbfXtUSxwjfv0BGyV14mlWzCmfFJ+tWYKDL0VfSOY/d
         AcYXVCw8DWtR3lpZJInmhvlnfTH1oBJHtaIL0jYuezqCk+C6uvpgN3DBvkpYqhT2o3UI
         6LFxhhv4ZnjAQzQlJlVrjtl2LuiVH5QiYJpbjgkPIb88/XtjsKq7mCwSNzr5HQorgxTN
         uQ6rMEfBvaSzTBfKov34w52Nv0rwED13d9uC+qOQJ3iKtoWanL9BQk/6kuo8TYXlc0Dz
         fkq30W5uR5nJ9xcDiVBnslQ0Qb7NqaRRFpiQLIYhlDbfH7DZ65sRG/2EdmQaWUVXrgA5
         LmBw==
X-Forwarded-Encrypted: i=1; AJvYcCVwvWUx2luowBNiex2ILw17nbYWHyEnklSB6XwYMEvz9TR+W0lxFC6vCthuoUcggYj9ceI80mA4YXvjblD6gS6i@lists.infradead.org
X-Gm-Message-State: AOJu0YwE+tR/McU4x8hwDYc9H0vJtfj1d2tMT1Pxj8OZt1Yqw55B1Cwf
	nR4svSqUkbU0bzFGqLtZ4Eb/DEYvAJiGXluRQHx/+00vr0AOOiZIWmaF4Govq+UNCL90DQ6ZDle
	qKBvGIW3KYtdvWS6/TBnHvwKjrpqbe5Sczz7sEBOSmA==
X-Gm-Gg: ASbGncvTY7SnAkuilFRTvdDJFzLyb+1LKBuzq9Oqm203XQsWb3DfSncmQv1F1TH0ex2
	02VqcuyycpHiIdqRBHhc6D5UIYrSPfoBgxzbbsSB527Tw/Ru1CHw6fHGSzCA3KjXoNKcVwfXleX
	UHULbTpeeGqD2Cj7//idXPIKOEhNtS74fWS+dYA7sFH5vp3wPJPPuT5R5xTyYi1D3ADTUT8NITt
	jla8KDaGja8hZgXJmvwMJ7H9xgU33+qMSclAx8=
X-Google-Smtp-Source: AGHT+IHCPPogA5I5xYJjZ3AF2Jj1OEbjkizkVIqqQo3oG7dsb9k66ChvqgzLqUtgok2+xdd2moMuf4gTw379MNCuFxA=
X-Received: by 2002:a17:907:3f0f:b0:ae0:b3be:f214 with SMTP id
 a640c23a62f3a-afe28ec592dmr1369727666b.9.1756209975430; Tue, 26 Aug 2025
 05:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250818124458.334548733@linuxfoundation.org> <CA+G9fYt5sknJ3jbebYZrqMRhbcLZKLCvTDHfg5feNnOpj-j9Wg@mail.gmail.com>
 <CA+G9fYt6SAsPo6TvfgtnDWHPHO2q7xfppGbCaW0JxpL50zqWew@mail.gmail.com>
 <CACMJSeu_DTVK=XtvaSD3Fj3aTXBJ5d-MpQMuysJYEFBNwznDqQ@mail.gmail.com> <2025081931-chump-uncurled-656b@gregkh>
In-Reply-To: <2025081931-chump-uncurled-656b@gregkh>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 26 Aug 2025 14:06:04 +0200
X-Gm-Features: Ac12FXzW7NUCjgYWSamJwSOH-347hP9Z3Gi-swjOizdLDz6f5VXnlkQBVvbGglE
Message-ID: <CACMJSesMDcUM+bvmT76m2s05a+-T7NxGQwe72yS03zkEJ-KzCw@mail.gmail.com>
Subject: Re: [PATCH 6.15 000/515] 6.15.11-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, stable@vger.kernel.org, 
	patches@lists.linux.dev, linux-kernel@vger.kernel.org, 
	torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, 
	shuah@kernel.org, patches@kernelci.org, lkft-triage@lists.linaro.org, 
	pavel@denx.de, jonathanh@nvidia.com, f.fainelli@gmail.com, 
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de, 
	conor@kernel.org, hargar@microsoft.com, broonie@kernel.org, achill@achill.org, 
	Ben Copeland <benjamin.copeland@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, srinivas.kandagatla@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_050617_749149_E5EE05BF 
X-CRM114-Status: GOOD (  14.61  )
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

On Tue, 19 Aug 2025 at 13:52, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Aug 19, 2025 at 01:30:46PM +0200, Bartosz Golaszewski wrote:
> > On Tue, 19 Aug 2025 at 12:02, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > >
> > > On Tue, 19 Aug 2025 at 00:18, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > > >
> > > >
> > > > Boot regression: stable-rc 6.15.11-rc1 arm64 Qualcomm Dragonboard 410c
> > > > Unable to handle kernel NULL pointer dereference
> > > > qcom_scm_shm_bridge_enable
> > >
> > > I have reverted the following patch and the regression got fixed.
> > >
> > > firmware: qcom: scm: initialize tzmem before marking SCM as available
> > >     [ Upstream commit 87be3e7a2d0030cda6314d2ec96b37991f636ccd ]
> > >
> >
> > Hi! I'm on vacation, I will look into this next week. I expect there
> > to be a fix on top of this commit.
>
> Ok, I'll go and drop this one from the queues now, thanks.
>
> greg k-h

Hi!

The issue was caused by only picking up commit 7ab36b51c6bee
("firmware: qcom: scm: request the waitqueue irq *after* initializing
SCM") into stable, while the following four must be applied instead:

23972da96e1ee ("firmware: qcom: scm: remove unused arguments from SHM
bridge routines")
dc3f4e75c54c1 ("firmware: qcom: scm: take struct device as argument in
SHM bridge enable")
87be3e7a2d003 ("firmware: qcom: scm: initialize tzmem before marking
SCM as available")
7ab36b51c6bee ("firmware: qcom: scm: request the waitqueue irq *after*
initializing SCM")

Bartosz

