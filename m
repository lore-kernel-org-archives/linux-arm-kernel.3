Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAB2FD064E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 08:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsre+xoqF4I8t3EjmEwHt5ty2n0tD2K+A5STG+RJ75I=; b=euGbwnE3OchlwUZrW+6cGZmCiA
	BaoeczHwzrwfqdW2L6q1/HHenIjyue9ZJmePR2ZGKtIU7M807MVDQfjTKPH0gIDfBpazJZ+3qXrKf
	CKIZRVjLUAk5JEDceYIrrYlin2IJYVjoHGQ8JBr0FuFS03K7hURt6FLJrcDM90oRz82yTceak2Ojs
	4hluNcnYe+D/iyx5L8Rgb10MITdB2CONVzGkfo8AdNlADxlen9ThUy08cEwF/Wti0bc8gjFKQ25wz
	Ju6BXwSoH/NvJmbSAMO9SjUdlugtxgcUTbKcuKocj2M7qV9cJhA4qWPPDK+y39eMZuLNCxeZrsXjH
	m84h4VWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0EXq-0000000B7BF-02TC;
	Wed, 11 Mar 2026 08:03:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0EXo-0000000B7Ar-3A7E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 08:03:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 097906111A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 08:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF338C2BCB8
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 08:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773216230;
	bh=rsre+xoqF4I8t3EjmEwHt5ty2n0tD2K+A5STG+RJ75I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KfGn8+3h4e+NMyMcPHyts0qH8oqHt+9fe7SodTbWjSMFtJMfxJGc5fAqgo7/gZ9Fu
	 TK6CGVYpw2V7Jn3Pk6Sr4T90twLsulLZusgTbQ8WHLqiQqNCG/q+E+lBlvaftngUjD
	 qzRacpn59BVVJOOyCqKl+2j8Yb+VDlVS150bL9AXasECFXcPa7gIIm5FhjOT8ew92L
	 nLliZhql25w3YTt9eGqZoiM/cRUgqgMRZUbiKnhpRnjxIqB9KKRQhsIDEvtHRPrgRC
	 XxTCD1T9kvH9no+l8uex8ICN8Bsmmfkewjd30/SeHhZM6Q2M5gW6DPWnQmtrn4JTUV
	 qBoPZL9pEX4hg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38a3066b68bso73857491fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 01:03:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1UiFscvmbZYN0WyjSzAgyqNRv0ytq+Pgi8swj/6Bf8Glsg3Zfno/4xYdsX8X7k/V+eXPXEVM1qqAtroPNOOYg@lists.infradead.org
X-Gm-Message-State: AOJu0YyxqQgld964Elh1sOB0IOPPVU3MRMcpHIYM4oisNc28ibAFYGoX
	FlxKyhrQ+91YNR8wolYdqpBVOQXgzh3ihhSnfDRYwyfLv9tJo18+Z9CBDCvkfA6KASPrX07urxv
	gbKJRZFEY4TdneHFJWuMMLxsPfoev3WwfTicrvAQXNQ==
X-Received: by 2002:a2e:b8d1:0:b0:387:4ee2:1cbe with SMTP id
 38308e7fff4ca-38a67dc9220mr6423881fa.2.1773216229237; Wed, 11 Mar 2026
 01:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
In-Reply-To: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 11 Mar 2026 09:03:37 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdzjY2UJ3uSUgCabCLqWJcpaVq5eSx3-Ph-AZXcBf-JTw@mail.gmail.com>
X-Gm-Features: AaiRm52ABCAk0kCFZ61a8pO0V-WhkvSQun4HTuAkOrhvrkcmKuT442r4SF3useQ
Message-ID: <CAMRc=MdzjY2UJ3uSUgCabCLqWJcpaVq5eSx3-Ph-AZXcBf-JTw@mail.gmail.com>
Subject: Re: [PATCH v12 00/12] crypto/dmaengine: qce: introduce BAM locking
 and use DMA for register I/O
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Daniel Perez-Zoghbi <dperezzo@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Mar 10, 2026 at 4:44=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> This iteration is built on top of the v11 RFC with remaining issues
> fixed and the mechanism for communicating the scratchpad address from
> clients to the BAM driver changed from slave config to descriptor
> metadata.
>
> However: during stress-testing I noticed that sometimes a transaction
> would end with an error. The engine was indicating that a write/read to
> the config registers was performed while the engine was busy (bit 17 of
> the STATUS register was set). It turns out that we must not just
> unconditionally append the UNLOCK descriptor to the "issued" queue, we
> must wait for the transaction to end before we queue it so this version
> takes this into account and queues the UNLOCK descriptor from the
> workqueue.
>
> With this all stress tests and benchmarks from cryptsetup work fine.
>

Mani, Stephan: sorry, I forgot to update the cover letter to Cc you.
Doing it now here.

Stephan: I tried to use READ command but it would crash on sm8650, so
I went with WRITE. :(

Bartosz

