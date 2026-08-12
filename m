Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFE7C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 08:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8e/6oz7HT3XGeTxfmCmaaxs2u9xqMmsHSHBOLgeCac=; b=tM/suzC1RjrdydcpsizxMIAMty
	OZMjy9ZxlPxNzgtivvlNIR6EwguijhV9+nJF15tkYwCSdlrBVmHQNR0OJzHkMLQjdTbfvgkmhWrlZ
	QjbUS/ZMx6kv73V0PA/5nb+fahpwEEWHbVBSr+dkmKiCKx0tJ9zDhfoXVJkPJTqllgMYANi/c7UZt
	xHFSrfldMgf5R+EaWZa0cGqZzyYkH3jW40/hqJBfB82371ge54E4/cJtWEXwg/b9PiBjU+oLNpHca
	kIrM9AMb1LAn5An9oDXE/fGz/qiwE7qCh6CMIDzma+UiR19VeB8oKNMZiLYvK1kY1WGViHbgpUF0w
	JCldRW8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu401-0000000FcSp-28lf;
	Wed, 12 Aug 2026 08:07:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu400-0000000FcSj-2LfD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 08:07:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 94A2844F1C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 08:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D7B1F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 08:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786522062;
	bh=h8e/6oz7HT3XGeTxfmCmaaxs2u9xqMmsHSHBOLgeCac=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Onedg4SQJKw0lKgmzutiivqk0laLcNuhJ0JyknizYv2W7tRuCbYj5AL9WCkkWj9uF
	 G7LSU5Hnoifmg95Ej+miCVwKr2tULhHxbNCySmmjz+zFqOLWGHVodWVbcyC+mVgrJv
	 yUiPHasDPYRFew8QcAOFj4ciYZH++aRUtJRh9EoiNXp2uqMrJc3DPO8SOitg8sOt+j
	 +ozOd3EtnZ8PF8eNvGCsHmc/T5U+AAhQNhRVrbFTrbsbIXGChXknN3HXV8q9CQ8CZ7
	 Z1bl9NIjpmvDuJZiw/hV1IPopbVlJc4mcYjYfAQMgyMp/alVeiNKunj82VdvnO8iQy
	 68QNNlwmzLlKQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39ee96f8047so5168991fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 01:07:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqNpTn3+FlqODc/6iphu7dpkrmt4itfO9M96+wmKEbbEgJQMt4D18OwgVvlzn1j2l+FdwjE1iFgjK8gQC4y3kKm@lists.infradead.org
X-Gm-Message-State: AOJu0YyKsxqcWx0ZZgetFwI3jdt8MS1wmsLLM/mRWTpdBGIyfQOY5Mvd
	8HWT4niz9QRBWqbBLCjJlA/ld4Ybn2G1eQLDfte1Rrt6vmIjU2tRTh3rXlFMUxk6CRCR/SIU3MF
	IyIEgJyf2uMETGvFEdxLdmGoFbDpxMnVH53oGNeDlrw==
X-Received: by 2002:a2e:be94:0:b0:39c:7922:b446 with SMTP id
 38308e7fff4ca-3a10d57ffa2mr2776991fa.14.1786522061234; Wed, 12 Aug 2026
 01:07:41 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Aug 2026 01:07:40 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Aug 2026 01:07:40 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260811224110.GC1905@sol>
MIME-Version: 1.0
References: <20260731050838.158825-1-ebiggers@kernel.org> <a28c2903-0976-4559-b870-4de5553ba9ab@kernel.org>
 <3ba57269-3305-4d80-b3f2-aa82fa59b59d@gmail.com> <b9b655a9-c683-4c4e-ba0d-f98577dd2912@kernel.org>
 <20260801162900.GA2021@quark> <e7aeec9b-11aa-4635-bde9-fb8c7ca38260@kernel.org>
 <20260801171242.GA3567@quark> <CAMRc=McL5QQRk8C8zzkHm+FUj-SAVi5PLJr2pXo8eNpaxXuALg@mail.gmail.com>
 <20260811224110.GC1905@sol>
Date: Wed, 12 Aug 2026 01:07:40 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfVqphaVsfcmUXjGmu6m+F6nJYXgAPuTVjZBwFnd48BkA@mail.gmail.com>
X-Gm-Features: AUfX_mza5iszjfEYHc7a-SULX42xVaS3ZTvYWTguGELO7PtuyXidmfp9nmIXTrA
Message-ID: <CAMRc=MfVqphaVsfcmUXjGmu6m+F6nJYXgAPuTVjZBwFnd48BkA@mail.gmail.com>
Subject: Re: [PATCH] crypto: qce - Replace with stub driver
To: Eric Biggers <ebiggers@kernel.org>
Cc: Demi Marie Obenour <demiobenour@gmail.com>, linux-crypto@vger.kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
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

On Wed, 12 Aug 2026 00:41:10 +0200, Eric Biggers <ebiggers@kernel.org> said:
> On Tue, Aug 11, 2026 at 08:42:55AM -0500, Bartosz Golaszewski wrote:
>
>> No, the rationale has never been this. FWIW it can be that it's used for
>> testing of the crypto module on a supported platform and that is already
>> enough of a reason to keep it upstream.
>>
>> As I've said before: we don't just drop maintained drivers from linux.
>
> We definitely do if the drivers are not useful or appropriate for
> inclusion in the kernel, though the policy varies by subsystem.  Even
> just last month an entire filesystem got dropped despite someone wanting
> to maintain it.
>

I suppose you're talking about EFS? A thing that can't even be tested on real
hardware? This is a much more extreme case. Here you have several people
representing the vendor saying they want to keep and maintain it. I'm fine
having my own tree and sending PRs to Herbert if he agrees and you are of
course entirely free to disregard any patches targetting it.

Thanks,
Bartosz

