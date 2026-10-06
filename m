Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97FECA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 15:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8HNQKq2PFFrdWWXN5HW5t8uFb87m5DPyp4zd5PK5G0=; b=SITlj2sG4R9w64v6SdmXj3jOhr
	x7G1lNoU/OySRORDWF3g84AQ7A/E6ETEh/qVr9Fv8/mNB7qot6kphyvBbNgQ9vGQWOgXcVJFQn/jS
	/CO3ucvfyAQeuunw5CM50iXHKuizosN0AwaqwUi71XetLfY8TBOmJZVZFv9KzIRd5g38Z9Ej6/fu/
	JSpAhNhsEM6csx9VimSR7JsW9s2aiz2VjkR5QndpUD+dUHVICNJJIZ9tfI7nJaA+karct07Hsdzak
	jF2ef2lHhEnztQG9AKfL/HAE+bgWHjVDfCHGbZP7DvV39k3qvTdpC4tkY/EymkcKO6JnTJ7kLPAIa
	mcnHlslg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE6wE-000000011Rn-0kmD;
	Tue, 06 Oct 2026 15:18:42 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE6wB-000000011RR-3tmY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 15:18:41 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6ae27f06c2fso4777963a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 08:18:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791299916; cv=none;
        d=google.com; s=arc-20260327;
        b=PfZuobsxi8FS7+Cvaxt/xMKbR4h+qaFYEyjBImd0zcVl7KrlyGk/mFT3je17UMoJJA
         E3x03g1FgZrptww+y0tSaoyCC5p6FTxgcgeV9r+MwJDYzEaVNaJg9Rg+IGM6XFIVYa1G
         QUbSu6vvEqR748gMKnanYgFM1QwhQaAlaQGMuYZOka6FHJIFg/z4FUpY6m/paMe+IWvE
         WXkRsKd/Rg7SRvEBVdiWF666mtI/m3qOOkVQr52uGzqQvGnwyxF06hn5XRmDlla07R8e
         xBLvC9sgADwQ4tlIVI6PLpWR7PltklPEO2yGFJVExzN5QvnzahxCb1v1gyesRmmplLAe
         QN5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S8HNQKq2PFFrdWWXN5HW5t8uFb87m5DPyp4zd5PK5G0=;
        fh=vvU7KCmyU30B2o8YKa7sbCpfGzhwVjVU9Ng78SN8NK0=;
        b=IKIzwo4HiWDySS30vZHYFzocHntizM3JKZZx8A4YZrcmD0WKntttl6Qi+uQx1OV7Q7
         g3Ix/dlFSparo0MYVjMqhCBuzbKBMP7yvwxfMgNVOEX6bDGhoZXIiXxFyJJvnHXBG9yH
         85sqAzmmk2v+EAW86P4G+PhPaDCFjR9ScfTD8uiY0FGHMe+8L0zD7qO81jVHXq0ZOI9V
         FbbrPJv2ndpLMb/waOxPuYOBNXi8PYYAJGUWInPPqxoVfdxBWHLnWZ0avMCFWClA29SL
         BVAaqDC1jRR3WuzKNJi9/vOrvy9fEzEXGbiNFJyXvNgnTYqEBl4gCkbKTETRUmlgfU7g
         RYgA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791299916; x=1791904716; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S8HNQKq2PFFrdWWXN5HW5t8uFb87m5DPyp4zd5PK5G0=;
        b=fK3P/DekBcMryEuDERp9GuHMYZRWtr0gIAIWBpHZxC93SLaED3caF2ZWiwAd5vBi8D
         U5YOqQBew7JXMEblh2fLYQ1RPtdsjAaHUh2mRLaaRtiPCQCpIXO6B402S8n9/3HYtxlv
         /aB0HVzgvL2TG9yY27r05eITZgNaSLYbwXV81CLC4ris+Iz9aktm7yknU4tnW6PrECkT
         LqZK2aPZtc+Q2IBwQR3PKPzOBj29Fx7oQLIrQAB9xmEoaQD9WuDqUOhJfCg2PTCtwn8J
         FrMpAR5S9F7P+13WpJjYLqVQ/PIs0Wy9fxRWGGahzZrb+MBdROyMiNMNMFh9Ni8umD7B
         Umyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791299916; x=1791904716;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S8HNQKq2PFFrdWWXN5HW5t8uFb87m5DPyp4zd5PK5G0=;
        b=0sfR+Lc/PZ+ZhpOC0/OKav+KW9+F3NqVN5hcSzhs3vS6th2hRj8yx90J+4uwnIczQD
         Voha7X63sI211MjsvAIQdZmwxvFDENFA5Mu/NHF9hkbgRjIlIbiTVUmHOV8cXEDhk0IH
         jjxCR3d28lODkq1OcPh9QJ8a4p4inr/OqYyecr2vGahfBDh7psnTyEGnn1afkyocmrzK
         uLztqV/x0ZMZpMH8wOiKGexMDIdRck2wPFWzKjfUVXeB9T43isQ/Mq9UmBte3/o+BUDD
         bsKHxSa2ghDvJAvIJ5imkmPY/JY+Z4D0bpFB9XljZgOyZn8wJVPlTfvtMHF9GgWSr4VZ
         PVBw==
X-Forwarded-Encrypted: i=1; AKwUvByiQ0qlBKNrxrie2DsGqzxKPCeCFScXL3W/V1/0I899XtnqVByfYh9Elxl/gyhr9pPp9X/e2U5s4+6KO33+LARd@lists.infradead.org
X-Gm-Message-State: AFq9FYLcYEq/GnuKSQSxpzW9HHcMxpud/dNfxpUScDjNGrl2or1rvf6F
	QwCgNf1exxEGGXreiUjJ03obqVbtMLHta79Vevoc/eXbS/yNWBNuhsC1GrUbANnOlTz6P2Vne+i
	JAnnWn1rZwJP3kAH34w1M/aJDHtZOu0Kb4ptCbeS7VA==
X-Gm-Gg: AYBFou1lzTHwV1JQU/15DVckDmcjLItbmTDRYLxJ/KBCiB4nWvLotLPT9CiHsVDSlYX
	S1u85laHfMyaUaj1d3dzXVCAQnW1RUGI93fubspBpQowyWnjo+WdDbJyUIpC9wHNffYqKYdzlHI
	Uc6p1pkMfWCLaSMA1wqdzZqA0JPSWxHWbqaiWSPuMncvrnaPki/4pWRORVe+d4udcZ7lkrOmfq1
	0WE9GElYmINKJtqdC65F8Rka7cszJObO/3YONAtn4GDF85PclTr5Wa2wvKyZEUd/eh4ybB8LYqF
	SmJ6URHw6il1svwU6nZI2DMZxzBBSML2Tgg84xfhZZirq8A/ip37Og==
X-Received: by 2002:a05:6402:52d2:b0:6a9:a5d6:622d with SMTP id
 4fb4d7f45d1cf-6afad731ef8mr8879468a12.3.1791299916262; Tue, 06 Oct 2026
 08:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
 <20260923184255.299034-3-shenwei.wang@oss.nxp.com> <20261006030739.GA3457522-robh@kernel.org>
In-Reply-To: <20261006030739.GA3457522-robh@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 6 Oct 2026 09:18:23 -0600
X-Gm-Features: AclHuK9X3bTaGpN7i7UclAS_3sT01qVYKxTd90Hh58vpFwo0cpRNFUaLVMAbBaM
Message-ID: <CANLsYkzcqapDYvKAEa2ZjA=q07iO=RM4TVNUbSqDrB0EmjeKyQ@mail.gmail.com>
Subject: Re: [PATCH v16 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
To: Rob Herring <robh@kernel.org>
Cc: Shenwei Wang <shenwei.wang@oss.nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_081840_020839_6B3A7627 
X-CRM114-Status: GOOD (  16.79  )
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

On Mon, 5 Oct 2026 at 21:07, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Sep 23, 2026 at 01:42:29PM -0500, Shenwei Wang wrote:
> > From: Shenwei Wang <shenwei.wang@nxp.com>
> >
> > Remote processors may announce multiple GPIO controllers over an RPMSG
> > channel. These GPIO controllers may require corresponding device tree
> > nodes, especially when acting as providers, to supply phandles for their
> > consumers.
> >
> > Define an RPMSG node to work as a container for a group of RPMSG channels
> > under the imx_rproc node. Each subnode within "rpmsg" represents an
> > individual RPMSG channel. The name of each subnode corresponds to the
> > channel name as defined by the remote processor.
>
> Sorry, but DT defines the names of nodes. If it's a gpio-controller,
> then 'gpio'.
>
> I still don't understand where the unit address gets defined. 0 and 1
> look a bit made up. I'm sure you explained it before, but *this patch*
> needs to explain it. When you define a second protocol, the 0 and 1
> addresses are taken already, so you can't have 'clock-controller@0' for
> example.
>

I had a conversation with Krzysztof about this here in Prague.  We
have decided to adopt the bindings proposed by Francesco in this
thread [1].

[1].  https://lore.kernel.org/all/20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it/

> Rob

