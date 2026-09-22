Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4EBC982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 11:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eP5mxCA22PcDYQqT6PJN84Q1ZYL8VkL3j8RWyf4Xjt0=; b=ESfYkqUSvOJPOMW9SO86+UTBTu
	FzCaiMZfH1LNQ1BczPHJak4d3iHIHZ1+kTVJI+h8ltc/dw0rQWMUOtuAp5jbZqhfVgxwJ/ESodTsn
	N93mWx0n5ZSJisADqhpWKzGPn+noTCsSiiLycI6ogi0zKtpkmTDXLkb1JRz86OWw9p7zKURqHuWAk
	Ass9TVGWCd4En4j0oSbBTyoUqA6lKunng4kwtvq9+jX3VRRrOhoDorbIrD11qL8kImPjk3J/l+svL
	XODsQo9GC5l1km9yMR8/KeLpRgSnlhXIMwwS5gL4NEp1XLfY8SoIF5DC6Aqo08xo+/k/jglsFC3U7
	JLmadTMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8z3C-00000005FI8-3xiO;
	Tue, 22 Sep 2026 11:52:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8z3B-00000005FHl-0jQC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 11:52:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 870FE44899
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 11:52:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571821F008A5
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 11:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790077960;
	bh=eP5mxCA22PcDYQqT6PJN84Q1ZYL8VkL3j8RWyf4Xjt0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ivnD1FpGeR92WYrsVhCHMkbo3bcYdeer6lZwM+4QriN1gfgXmSgnvOMY7t+uMRwPX
	 gbQQ3ZwJjllFNhMuZh0Ul2OYtIB/QzaSi0R5k8O4jrWL4CxjNjZWJWzg1dMdX8PNAG
	 o68dwnh1wWEs9UcInz+x3YwXkeMC4Ic+yBcyMFZ+e4poFSDb36xwnpr1s/QwiODdoO
	 rGtBEb26r6FZIJCv+/Dmm3mFIqvrICbut5Df0a/8T3EdWZJoFarku6fsLkRE3CBb6Z
	 cr7/uexby8cmOKLLVOee6YnoRtOkYvCepqxpiyoX9bk04pLejp1Eog3ANo3CzTBruZ
	 wxLnK32OarWBQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f16cd1so3670167e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 04:52:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwehQgmFoHYm28STfBUkaG0zDU6O1sZNuZZLfmLivPqI3qhXBbWP1o3ye5X6PiurKWOFZWx6dcIwkPcLKIPCPim@lists.infradead.org
X-Gm-Message-State: AFuF++mfii8SwDODRbd6bje2FIBDpcZkGIrtxeaxB9dV9uGgXghqbyub
	4U19okg6im9qUC4OeVds+bAfnf+tqsC5mSa0YGVdg+atUI1nJU9r63WCiUhmR0qja2ROM9lKiEm
	j8Kt8X5T/2LtUoof6puJw1p6DIdNFyXqPy2ujxm+jlA==
X-Received: by 2002:a05:6512:1394:b0:5b6:4ae:a3f6 with SMTP id
 2adb3069b0e04-5b8c1833f9emr4493348e87.30.1790077958932; Tue, 22 Sep 2026
 04:52:38 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 04:52:36 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 04:52:36 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <arJGAjRRC-5EPjH6@gondor.apana.org.au>
MIME-Version: 1.0
References: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
 <CAMRc=MdWZhLy7AXd2OiVsaT92xTh1EF+B+LNo2b-1D2TO3rAmA@mail.gmail.com> <arJGAjRRC-5EPjH6@gondor.apana.org.au>
Date: Tue, 22 Sep 2026 04:52:36 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdMbAw5pfOOnV0ppdZyKqFe8c+ypt0e92vZqxhO4dSmGg@mail.gmail.com>
X-Gm-Features: AcwNN1VABbac5dFrDJiTxQAG7Ey-cY0fj19Y-QeBI1gWJEBtWlgt5w23NbxPNkM
Message-ID: <CAMRc=MdMbAw5pfOOnV0ppdZyKqFe8c+ypt0e92vZqxhO4dSmGg@mail.gmail.com>
Subject: Re: [PATCH v8 00/14] crypto: qce - Fix crypto self-test failures
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-crypto@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	Thara Gopinath <thara.gopinath@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Stanimir Varbanov <svarbanov@mm-sol.com>, Eneas U de Queiroz <cotequeiroz@gmail.com>, 
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, Eric Biggers <ebiggers@kernel.org>, 
	Demi Marie Obenour <demiobenour@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
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

On Tue, 22 Sep 2026 11:10:26 +0200, Herbert Xu
<herbert@gondor.apana.org.au> said:
> On Tue, Sep 22, 2026 at 01:22:31AM -0700, Bartosz Golaszewski wrote:
>>
>> Herbert: Sashiko still says it fails to apply. I have no idea why, it applies
>> fine on top of current linux-next.
>
> The first patch doesn't apply for me either using git apply.  Please
> download the latest cryptodev-2.6 (a9a2152d292fd0bc73814eb4a127278ee7dd3f6a)
> and rebase.
>

Yes, this does help but does it mean changes from cryptodev/master are not fed
into linux-next?

Bartosz

