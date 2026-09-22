Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1691C98305
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 11:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ytoz1t3GOPePZxdswPtmAggikq/qSPABFOEolp1XJF4=; b=Ep7ZU4YxeIk3TilZLdpj72GI1z
	hm2Us9ITU+WK6WcY3Nb0oVAQ7ODXdN5xC0Fy2cXHVOGX3Kys5TRqEgoM/ZhoMq8VRxxQB1znZ8dbZ
	CK6plQ8tGEkInzJBwgZUBqlDAhdNq0i5+4hN9c+haqpKnx9dOAgtsARkMWwuUN9Ij2eiPDE6JE1TG
	tMlwO5tfHtZ3R7kfknLT2lQ5vAQMFC1CpEDqOnWyAhRglXWq6Eh6DD0ox8OaB8XtBWRFcUyIUuzlA
	q0MOZaqwRIc+gj4AeFS2a6+XEBESUMq/uHDMFcVGNOO9RD1JcPQQVPzligL4kHm1bSAy7o3UWIkXa
	43y3JHaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8z8n-00000005Fm1-1xSe;
	Tue, 22 Sep 2026 11:58:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8z8l-00000005Flt-3eJ2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 11:58:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 31F3C43FBF
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 11:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 172FD1F0089B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 11:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790078307;
	bh=Ytoz1t3GOPePZxdswPtmAggikq/qSPABFOEolp1XJF4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=CLBxZcOAWnWJ/4kXmnjH0R0nj/16Tl9bqHp/mJBAg18XTsfnPgexZBB9i/vUJ0YZA
	 mVPnyzkwFEjuST1M7YGee3O+O+kHE5wKqcw+sX2/JYDTw7ep5ZrNTEKUWyvqwm8JWG
	 k72QbOKpotuSM95yiR3hHwMUtRD6zjokPgdoDlKSlOj8tr140Pzj+4lJMVgaUyD8jW
	 cseHeKvd98sSRBy4AVEKbBIwPvOBjTZfQ19A5aN8TohopWWDkt+1hI6tfhutS11qrs
	 nLDtm5rJaX2Lpy+s3yjNyzJZH0GXvuUagurG9ULd50Nlss2GyA02DdSVaQXPPmd0F5
	 DFNmbvlhiQ80Q==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1744eso3234950e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 04:58:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxa8hzK2FUB14aAJpbMs49l3QvsEZbH2Jvu/gcxfQnHT8c49UY1moMMGiHc1rHvaFDqeVgc3VTCKDu3PjYMLqHr@lists.infradead.org
X-Gm-Message-State: AFuF++kJ1LTs8e/lHcbLT174HQRWCyFdU9IcEsibT5LzcBK1vUIvtDCC
	GWw+YUoZxKPGu6hUlF3tA+Y607+5ky7gMDaFUDGwxnnaKr2w7lLTjyt0hhLRNdMTI2gzBXTsw46
	TVwUHBAeqi5Ajh9AlRQgid18bajX2UsaEAx+R70IS9Q==
X-Received: by 2002:a05:6512:3d22:b0:5b8:112b:c4a2 with SMTP id
 2adb3069b0e04-5b8c181ad50mr4861932e87.27.1790078305682; Tue, 22 Sep 2026
 04:58:25 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 04:58:24 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 04:58:24 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <71cba843-1643-4f5e-9830-9e60b5f1c334@gmail.com>
MIME-Version: 1.0
References: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
 <20260921-qce-fix-self-tests-v8-10-107537869a72@oss.qualcomm.com> <71cba843-1643-4f5e-9830-9e60b5f1c334@gmail.com>
Date: Tue, 22 Sep 2026 04:58:24 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfKMKSRGvb-f5Vc-qK_HchWTnaviDPkg7hEeDbZCfw8jg@mail.gmail.com>
X-Gm-Features: AcwNN1VahnVb5QlWjD-pcY3vH2FZLS8CiKh2yK16lStuAeGTC4idhVFKnxxeMHU
Message-ID: <CAMRc=MfKMKSRGvb-f5Vc-qK_HchWTnaviDPkg7hEeDbZCfw8jg@mail.gmail.com>
Subject: Re: [PATCH v8 10/14] Revert "crypto: qce - Mark QCE as BROKEN"
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Stanimir Varbanov <svarbanov@mm-sol.com>, 
	Eneas U de Queiroz <cotequeiroz@gmail.com>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Eric Biggers <ebiggers@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Abel Vesa <abelvesa@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 22 Sep 2026 07:42:28 +0200, Demi Marie Obenour
<demiobenour@gmail.com> said:
>
> Also, if I understand your previous messages correctly, Linux currently
> doesn't use any of the features that would cause the races with the
> secure world.
>

Not yet but there's an upcoming driver for OP-TEE[1] that will have the
potential for conflict. And yes: I get that there would be no problem if
we just removed the driver but the long-term plan is to use the IP for secure
media playback and I want to get the BAM pipe locking done before we get there
to get one thing off the TODO list at least. To that end: we'll be testing the
synchronization with the existing crypto algos.

Bart

[1] https://github.com/qualcomm-linux/optee_os/pull/71

