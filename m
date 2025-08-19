Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F12CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 13:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MlZSqNXnF5cFT3EKTsD5C3uA+ixCm4MLZap6H11YwJU=; b=IfU70hZ8C7UwrT45UXb9oP2RtX
	7aWj4I+xNrinwkB2pmA2P4PCbC/KUHZSZ7B2pFXtFqf4h4vZj5qZkgWpYmH6/8i/3nNoRetrErUZo
	/0JX39iZwwRT8Y0kq2pGudAV6AHvB/iWmUVnlBIbcf5Cfjp8ESRvhgrgek24FlhN27M586qTnnNHc
	pUma/48MI/OyfAuYHEGEPEHqh1FBtBTWmBg7ygXDAHvQ9dHGKFGNP7e0zMb/zApSnZwuezA+RfwjK
	HX2HyewjC+2+0yCrccHiCnB+d2jX/GCxDBe4cZO9ladTYKmAhPzvCXRiKjOpysCxe/wSWc+9zWrWD
	wiKEaZ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMEp-0000000AZag-24aL;
	Tue, 19 Aug 2025 13:18:55 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKYN-0000000AHiM-2PFE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 11:31:00 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-afcb78ead12so730338266b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 04:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755603057; x=1756207857; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MlZSqNXnF5cFT3EKTsD5C3uA+ixCm4MLZap6H11YwJU=;
        b=NayOq5msWqUFAkhW/+NGMaYE6qGGrE4dMNZ3pf1+d3FhvuBuEInQ81OWzng5p9vCgs
         /UgHs8Z4vIqAc3rfCYHQxTz/6gVqqDmkmnbJ4BbYHwb9o8DbCcGdZiupKUBsHqyx1jP/
         2Ldr3g24N9tVkHJ9/i2Ptiqoq+4eg2Nm0e3831pe56ZnaevDHPTPPVolhSmqMrJmlbSg
         72zACSbR3s6gTfiPglI8aSU4VBxtNvoHnCWBNx/OT1hF9hOq/DCRRWmz8aRRgMgQ00RA
         plB+SnvMrLHM//MIylblan3VNIdxqjLHODVVBQwcBsewaBfTYzSFrGMunL4nSp6IJBq1
         JVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755603057; x=1756207857;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MlZSqNXnF5cFT3EKTsD5C3uA+ixCm4MLZap6H11YwJU=;
        b=BZuQCg307LjjJIY50ZF7++9vXqN1sDo5Vypr84tzA2Cc9xPVhDN9rD/CUzDPi4mY0x
         d13MY4y3GDtIsMnkkihXYDB7NGIj7eI5pQvxSh7hYr958Ud+rR6QCdcr5kqVRIi3Kjgd
         9XG7NJny78zKCLEEeGSD9gPuYht9aSUd4eSuFcAuwem2hthA58W6z/NVhmaCbqAU0apA
         Uu8xPhnLKswQZnMKK/pznkm4ti/ue5zNb5Y9wKMvD1AXiwqZj+tJw31ayTBWobawXUVc
         mYv7rx3DgeSiTpgHcOl+vSBFEFAB95uDaTdpK+EIP8GwLQWahnLjdvJvEdF9dD32EZZr
         TO1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVKkrOvZ5q4cY9uH5dXeWA8J8hd9kuRPYTojG8nVtkRMkJVS/6CaTLVIHhwukGKK+YuTaIILfESduBrV+nFE1Kg@lists.infradead.org
X-Gm-Message-State: AOJu0YzC30TSVoCdDacRLru4gGSbW3VeaZ0YI29mVZAwrHxzr2dHqCY/
	ZeDq/XLwG8yjwO+hIpHHyOhzTPiQ2vB/4tvVIob+7H1bNt0EleNHwAmC0oNEYzDEiwQbSivimVe
	d32j6LyhJZAhRMLupKOBWGAJ5eUpL/JizHpzW50p0Wg==
X-Gm-Gg: ASbGnctubdZCmpr+Wa/KXPWaksgpsMQAwUvPmPTnM4w4oeaKJsn/A/JYfItpZM6SVav
	vd9E5YqbYPg0r3njlRdXTTvr3ncPZq8tUuHdTx/LRSA/YDWIITyaT1uD54BQ1CQljOER6MgwTU3
	er1pf7ZUrpA5bBrY082HAQSq8JVKVJ6BKn0cN3JCJ1pjoWx39ZoxcWK/zu/2350YE5rKjxTEfjP
	zIf
X-Google-Smtp-Source: AGHT+IFc1qeOeB8SEpfLr5OOLAFUUqEj6GU45bLARYtHghlfX/crq9PpWhn+VH6PLkjxDEuyGteYvZKpflusqa5M/Ig=
X-Received: by 2002:a17:906:c115:b0:af9:57ae:dbb3 with SMTP id
 a640c23a62f3a-afddcb81908mr192322866b.22.1755603057341; Tue, 19 Aug 2025
 04:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250818124458.334548733@linuxfoundation.org> <CA+G9fYt5sknJ3jbebYZrqMRhbcLZKLCvTDHfg5feNnOpj-j9Wg@mail.gmail.com>
 <CA+G9fYt6SAsPo6TvfgtnDWHPHO2q7xfppGbCaW0JxpL50zqWew@mail.gmail.com>
In-Reply-To: <CA+G9fYt6SAsPo6TvfgtnDWHPHO2q7xfppGbCaW0JxpL50zqWew@mail.gmail.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 19 Aug 2025 13:30:46 +0200
X-Gm-Features: Ac12FXyaJepFNIeos9w4tdtDWEq_utvLUQ4wMo0fo8sqlMNsdeJO5hMNv6oFTrY
Message-ID: <CACMJSeu_DTVK=XtvaSD3Fj3aTXBJ5d-MpQMuysJYEFBNwznDqQ@mail.gmail.com>
Subject: Re: [PATCH 6.15 000/515] 6.15.11-rc1 review
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
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
X-CRM114-CacheID: sfid-20250819_043059_615737_9BD3ABA8 
X-CRM114-Status: GOOD (  11.44  )
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

On Tue, 19 Aug 2025 at 12:02, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> On Tue, 19 Aug 2025 at 00:18, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> >
> > Boot regression: stable-rc 6.15.11-rc1 arm64 Qualcomm Dragonboard 410c
> > Unable to handle kernel NULL pointer dereference
> > qcom_scm_shm_bridge_enable
>
> I have reverted the following patch and the regression got fixed.
>
> firmware: qcom: scm: initialize tzmem before marking SCM as available
>     [ Upstream commit 87be3e7a2d0030cda6314d2ec96b37991f636ccd ]
>

Hi! I'm on vacation, I will look into this next week. I expect there
to be a fix on top of this commit.

Bart

