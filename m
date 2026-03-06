Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3E3F01825
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 11:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NTYdTeBjMr6XpI5HTAxWxrD66RVzOSfkMwRE+gHfKWY=; b=Tr9v01txxULegSCCQUmL8We5pN
	7dB6qkvZCowJVWtgKGR+aO89UqnqEziihCE1434vVypHbwu7+ovFKZ0IiUrK+eLSjRMDjIZxUsr1a
	+l/rmgh7aG4cNJnkvh0nxu16kXBqYetS2ifrE1RsBJEyme6/giPW2ljH7w1VQTWk4Jc/pjuNlnQTj
	GofosY2xWa/KVk6kFCKpFnjBIH+TYthAUscY/kczxsI18lipEH7csGiziCP1RvvZuZvL97TFGc9EE
	Dq5YPMVrCDsDIgM3x0pTePDUfFZfX+apW7bIggVKmaxUjjZKfJbdP1MUqvPiVDgxkvgNZpBh9P8UR
	1eu1gNqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyT2R-00000003XbG-2m33;
	Fri, 06 Mar 2026 11:08:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyT2P-00000003Xab-2KSG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 11:08:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A9B74451E
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Mar 2026 11:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF70C4CEF7
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Mar 2026 11:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772795288;
	bh=zvGkoOu6sc3DwKuM9+tCXqq+dXf2cC7y58uKtjKrGkA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=enhnqn0cQZOEfPg4lbr5H0FcIOxP/gaxG/zy4LHsHbA4Y//gAslwnbfUUjaIeSPwd
	 /XqGAc1zKK9l/RwY+YKBm0jm2/l5eZ8bBH84Vl9gXweq54jTLN7PSUoS5wkA+sj52M
	 OgrSO3Yc8VMOPu3u81jUj+NfsgMOtFEoNikq6bspa78MHsrfxKrY2l7pWKZc8O6DsX
	 /kH3ojHcyPUAyuaR6CUWEXqo+2wa9wyMT8+h8PiUpnnAtMeoRI5n355eulvZupV3aQ
	 OICqI7Ot9BXmBXN1FpeBIotaIPwdFoAwwGcAHoQHXlmbuZJgb7wZoYFsWqk3W4OCfo
	 QmkMfSQbe73LA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a131e8a236so2022422e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 03:08:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXrMmcVp+UIfx5UaUj6PAYAQF3rtRk4iMT3ieLzGb6DCIPormd2YSnsm+URPRZrsZEWW/bOUz/r7UPSwsWJtlkK@lists.infradead.org
X-Gm-Message-State: AOJu0YwIHPSv4fh/KgAEjasYNWaKLA3NlOKmj+N3HKdZ9uhvPz+Q7xIP
	q8EbIfgR4tSwOAtlli8DF5u6ePjuOeKxWdG7wf6X2CIB6GGLBfOFF7bskJIvQjqLPux3o8qx/ZD
	Ze0go82z0FJVoZ8obfBnhhA5kGHOSA2Cf8T+/Ek4/SQ==
X-Received: by 2002:a05:6512:3719:b0:5a1:3b28:42fd with SMTP id
 2adb3069b0e04-5a13cd58785mr456080e87.47.1772795286638; Fri, 06 Mar 2026
 03:08:06 -0800 (PST)
MIME-Version: 1.0
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
 <scr5qvxa7f7k22pms4c6k5gwiky7lhssrw6qryfngexlek44g2@rayinnnwqgbt>
 <aalwMwN3qMlzrql5@linaro.org> <CAMRc=MfjknN1AYF_NPLzR0YbdWuoET25D9o0zsvx56VN+u59HQ@mail.gmail.com>
 <aamIf8JethKzLW93@linaro.org> <CAMRc=Mf=NjCqf0eqmM800Q3MEUC48V_DZ3ts6+4=qMCtrbvzzQ@mail.gmail.com>
 <aamsL4uh58Fv5een@linaro.org>
In-Reply-To: <aamsL4uh58Fv5een@linaro.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 6 Mar 2026 12:07:54 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfMJzVrRBo0kbgDbznRexFn2bc6GBkNh75k3L4Kw25VJg@mail.gmail.com>
X-Gm-Features: AaiRm50SYPFbrtvBCgqbAD5XV2pariKnEghQc2LIPzo-Ehg13xkHUxUA3b9Bzso
Message-ID: <CAMRc=MfMJzVrRBo0kbgDbznRexFn2bc6GBkNh75k3L4Kw25VJg@mail.gmail.com>
Subject: Re: [PATCH RFC v11 00/12] crypto/dmaengine: qce: introduce BAM
 locking and use DMA for register I/O
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Md Sadre Alam <mdalam@qti.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_030809_632266_2EF23793 
X-CRM114-Status: GOOD (  24.54  )
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

On Thu, Mar 5, 2026 at 5:16=E2=80=AFPM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> >
> > You'd think so but the HPG actually does use the word "dummy" to
> > describe the write operation with lock/unlock bits set. Though it does
> > not recommend any particular register to do it.
> >
>
> I guess the documentation I'm looking at (8.7.3.4 BAM operation in the
> public APQ8016E TRM) might be an excerpt from some older version of the
> BAM HPG. Is also has a note about "dummy" command descriptors:
>
>   "NOTE: Pipe locking and unlocking should appear only in
>    command-descriptor. In case a lock is required on a data descriptor
>    this can be implemented by a dummy command descriptor with
>    lock/unlock bit asserted preceding/following the data descriptor."
>
> This one doesn't make any difference between READ and WRITE command
> descriptors (and both are documented in the chapter).
>
> Personally, I would prefer using a read over a write if possible. Unless
> you can confirm that the register used for the dummy write is actually
> read-only *and* write-ignore, writing to the register is essentially
> undefined behavior. It will probably do the right thing on most
> platforms, but there could also be one out there where writing to the
> register triggers an error or potentially even silently ends up writing
> into another register. Register logic can be fun in practice, commit
> e9a48ea4d90b ("irqchip/qcom-pdc: Workaround hardware register bug on
> X1E80100") [1] is a good example of that. :')
>
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/c=
ommit/?id=3De9a48ea4d90be251e0d057d41665745caccb0351

I agree in general but I also learned from the QCE team at Qualcomm
that apparently there were some issues with register reads over DMA,
which makes writes preferable. While the VERSION register is
officially read-only, I've been told writing to it is safe. So it's a
choice between doing a READ that may not work on some platforms and
doing a WRITE that may theoretically not work on some platforms.

I'll send v12 which will be a proper series with using register
metadata and correctly freeing resources and we can rediscuss. Doing
one or the other is actually a minor details of the whole thing after
all.

Bart

