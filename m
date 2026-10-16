Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F67CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 07:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B4IzSxY5F+HMjumQYpLQgv1VgHUd/a3qHH2cQv2H0rc=; b=eN+MeG5eIE8JljcD+PMBn/lc27
	WfukD3P1AB8fXfmjUGKU4PxQfbn2ZfeZPyrPZH7alxVgNOCEAL5quMpAmaCCeWdX2wK76TW4992Yi
	cdPP4zHZHOHkSokjblZ9zT9Ks84LkN4xSujKObZGjrf9Ow4x7Ctx58W49A2ENlnio+BbByPzF0stk
	ZKi3ZIHz1V8S7i8Rm0iJdkd5YEoHFiuuWn8VFZDa+YOVxJBNSAL936Dahf23S9IS97zlcKr2iJFRa
	f2ya7BEXJrk5fZFndMhkvCG/ZtYv0KbkcEsrb1CNZDBxkHM8Ha/KFnLKmuSgjIrukWQZ8DWrB5688
	o3zMMpNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHckm-00000002Gnb-0p5V;
	Fri, 16 Oct 2026 07:53:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHckk-00000002Gn4-1QHf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 07:53:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B8C0B4400F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 07:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DEDD1F000CC
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 07:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792137201;
	bh=B4IzSxY5F+HMjumQYpLQgv1VgHUd/a3qHH2cQv2H0rc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=dT5tTDMVwARRICgF/BJtr/AAl0dIOaT24SeXD5WFiEgDpxXdnXhjnBVsg3GZLDih2
	 Z6CPE9XFxQmC7TaQjQGhJUJwPMR39f6/UZh5pKalCqhaRZz2IFMXKEjeLUfOhgemmy
	 mJxSF57AAHR3yeSudCXeaeufm5LomhHETaK77JWwFYpfMoTbGNCWptuzjT6ZHA1S/e
	 Stqe+TUw6gfJm47IcgWoW69FRg/zeyO9GTOQQbcRQezTFXn4M2GmTIg1BD6G8o2cs/
	 sdc1LZzU3KLFdP2AlS8bdZD85bXP3zluUnCfCRgP6/8Yp8fcb4G6UqanZpqYwkQNt7
	 REUgWELe6y61w==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5ba3fba0080so4398401e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 00:53:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByWprUJ13ndq86t9hvRkcy+6YVLklBDg8bdId+soTuyTuH0Yac2M+H5Xgibw8nfd2v+KndMSxte3D6pSC+tMnEK@lists.infradead.org
X-Gm-Message-State: AFq9FYKFj+1t+BKx3yVoXPSGVnc4ix4XOCdJu9vaJdKyZI55F59v9KD/
	n5Lzk8HcbyLBuhgKzku3HxYLovxGH0vsL7pD4rQY09l0sY9uagwfhQ0AUHrv0MpyUVXREEMgpQx
	rjpp69XJBGW3YlLoNDekpSX3Q/10vI59ixFLVuPezYw==
X-Received: by 2002:a05:6512:2399:b0:5b8:f9b0:5779 with SMTP id
 2adb3069b0e04-5bcde35b9f5mr7386749e87.8.1792137200300; Fri, 16 Oct 2026
 00:53:20 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Oct 2026 03:53:19 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Oct 2026 03:53:19 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <atGIRTRuhFILV9pz@gondor.apana.org.au>
MIME-Version: 1.0
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
 <CAMRc=MejhYpC6QNXwK_cG_NuJs5XpOviK2NPsEwtnK0RxDi61Q@mail.gmail.com> <atGIRTRuhFILV9pz@gondor.apana.org.au>
Date: Fri, 16 Oct 2026 03:53:19 -0400
X-Gmail-Original-Message-ID: <CAMRc=MeNk8RSRPvd7u6ZsrTk=yT6nWiEGuB8ARb_mV8tDdpWHQ@mail.gmail.com>
X-Gm-Features: AclHuK8gYInkzaF2IUtMPvsqDxyb_UtfI2wLBn_4ZvR4nTK7V8zh1xtSkrWeKJc
Message-ID: <CAMRc=MeNk8RSRPvd7u6ZsrTk=yT6nWiEGuB8ARb_mV8tDdpWHQ@mail.gmail.com>
Subject: Re: [PATCH v10 00/14] crypto: qce - Fix crypto self-test failures
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-crypto@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Thara Gopinath <thara.gopinath@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Stanimir Varbanov <svarbanov@mm-sol.com>, 
	Eneas U de Queiroz <cotequeiroz@gmail.com>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Eric Biggers <ebiggers@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
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

On Fri, 16 Oct 2026 04:13:25 +0200, Herbert Xu
<herbert@gondor.apana.org.au> said:
> On Thu, Oct 15, 2026 at 10:49:37AM -0400, Bartosz Golaszewski wrote:
>>
>> It came back with some more issues. And seems I have a build failure midway
>> in the series so that needs fixing too.
>
> How about breaking the large series into smaller chunks?
>
> Just make sure that each fix is independent and makes an
> improvement without regressing.
>

Yeah, makes sense and likely will get the changes upstream faster.

Thanks,
Bartosz

