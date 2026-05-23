Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BCECD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 13:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nlUJXscAj5QuomRn5O6cvpNus9+sfZnlQG7j0zzSF+k=; b=PHUsZCcXpoJetK5S+hwiM7uFY0
	ZXjzNEsQ2U5CE7Y3se1qc4AzIXVPtaN5G8Xm9QziR772BBp1UMKiQvsNdxxR+aOfpYQ2HThy2ZhLG
	OKtQVlUM/xjS+1dkuN9ljJbWvW/NLR9nKg+S596MWKXd0PbVpEFa7sc7MX4lwhGmLGi5fyu0eR1lj
	h7gG4IQhpveejWvdHRD+7eF3XRCoog9dE7p0oaYSW/e8OOxjx/VZuVnqBD/VUBIgh6nVz3q2x9e7Z
	1vW6ZE8OsPnNsUMvuQHqeNuIjbi4vzGAIvIGOSNmBoTbpezrkwZvSE6GPU0Mx5CI3KUTD3ppQCoAC
	ekKtilfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQmp6-0000000DLAI-3KmC;
	Sat, 23 May 2026 13:55:28 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQmp4-0000000DL9G-3V2e
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 13:55:28 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2b45cb89f7eso55863035ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 06:55:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779544526; cv=none;
        d=google.com; s=arc-20240605;
        b=DTlzlvR2W1gUaFD3g2maADCIhd+rMY3tL0PI+KaLtZ3Eqr4W2nCPsSfQJ0ya+X40/h
         6mO9XvLJEts0nfBEh4tEZ6u0g+sjAzg6td0Vdv6a++j7gTQJ9EXdCZ0TszR760rTuZwx
         SduipydsJmVeh2vCd3pT5lm0xlMHz8Ss8tuaDLMn+inhSbU8DF/yLPuF1ypWUwV0otci
         M4bHTEoI/8ENMV7mgR5wtzLAYj70lzk7ioP2vJRMtDM52N7yZMhElDrZeej29gMEn8wK
         ZtpKLg0wkcaGurK7ongb5nLbrtGiksLy4TxDVKgmo7Ib4s32Ma+uPR93PJVHOn1MQTwK
         czxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nlUJXscAj5QuomRn5O6cvpNus9+sfZnlQG7j0zzSF+k=;
        fh=8cXR2N3ZErUNTJ7ap8hQ+tnpbWLrvzb70lb4U/M9+Ws=;
        b=LMoD4LS6te3t4vuJx1TZEIkEmZ5V50CF43j74otVl1SlcdA+KVIYLetgop6oP3Vlti
         qQs+fSfnGMNDAMku9TlGbZwulXyTOEE8O0m5k0KUCIjYwy3g2l0N3JoEDSUDmpSDEZPN
         M8HL3ZmNIrxkUk1qESGaffBDBbqoJ69vKgkrs+1nOSTtEXNbGEi6f8L5Q5JiHwOYWxyx
         Khfj9TPWDJDf9SPz5NNlPSQra868PqXUiMMrrg2mPLCKNUL0GoT2881xZhvaxSXPG4mg
         sh+NsbHXRVTvbBGtpOWCQCgst76mRhlertcojdQrlAKn750FYuTxloNDRi/P3fP1rr3I
         +dYg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779544526; x=1780149326; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlUJXscAj5QuomRn5O6cvpNus9+sfZnlQG7j0zzSF+k=;
        b=RBmKlWiUg5Lv4eGeD3o4IHt+36us14w/hzUmWyTNfCDUJ8AaOPSdZhVI5ox1p0uTAG
         xLwaXg30yUBnbH0vDbrUItq/K/erfK2GMa3mSnIaJ3bTt/kRf36o8JrrGn7nt+SzXhGu
         V6Ib5roU3q7DPWNEMi/erX4oMN6V+zhcHtTEpeBa0IZJ9q21b+a9LWgwwI0UaVV9ZxQZ
         TaGiEqMnCVGm/pTxuBJ0T2k5RiyRrS+dvGRxq2bqhy56vd1aDX2BYcbMW7TVHNNjg2xJ
         z64qKdndPTkG4l9D7yRqSZejxG3LR9lbLGqlmFMLr8CBVW5ySzxXPuZdfJWTj4kMjHru
         KWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779544526; x=1780149326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nlUJXscAj5QuomRn5O6cvpNus9+sfZnlQG7j0zzSF+k=;
        b=r7kOwQnGmGGvcB90yzTEGxUBj4thowaaa+uAFuoosFgaIv3lQmItXkShuXAmeG9Jls
         iBjboFWHGAhyJ3EYyPkVYl3+aZ8/4BQTOge8CUPBwVS6Ww/inE2Fe9oGg69Gs6nrOUYD
         l6TN4bKaVn1T7UC4dm0vhhLTuvElWVT8AtkJiePi2W6mH3v+iN3077L0Gq8D05ZOA4UF
         Nc6M53GTwuu31GyPS2Tg+uqrJ7qaHbYuPLxNfCP/ADtw+KNFfzgKYGu0DWsSPkSumvdH
         SBQavfVbAwWHfinwisxfgDIPs4CMAWDQGpG08Ukkjzvd9AcB981cmVcmbkXVAuhfz/u+
         A+WQ==
X-Forwarded-Encrypted: i=1; AFNElJ9eDpa4N5Xzw8WorIGH3C2TE+Bn85HdK+ZgIAVgsvQNyH84eTKhfxZrVj9igmWX45/btdNteNkpIa7QqQmalZLr@lists.infradead.org
X-Gm-Message-State: AOJu0YxgnKGCuJNHgVzttb/PsfWyJWq3Kp/Ff8ZIHCw5imrUk43fnqQw
	C5FutlLCHI4eL9BfegomnrC2vY1Hiq/EyJl2ze2Dt4l4xW2QjHKj+95e1aV0w7zr2Ilh5kvhgFv
	rUiNVxrL/I7S+l0sEBbU0zeW3wkFJh04=
X-Gm-Gg: Acq92OHwgJ0X0V4NYt9jC3128UqkuK/O9i6gwOBHKZhlXWdG/OmSU7L2CrDZ1WvkQkY
	UHzyiDbBAX2kEbKDhMsOAfI3WYyl21+blFDcWurO2qswcRR+zT0o4+F0Xf+O+a+/wXj9RzQuMYR
	DYQ0UtHN7WdDOJF4TGPXQ3PsiebwtvgR6lCAtm35/f3gSmnCtIJSsTtIsFKkFeCKqqsnuOdwJ/o
	G4gR+k7r0TwNIFrNSf4cjYGrS4THY7kMN56DdrJYAHjEog60yRsUgZrZomuiAdu9nWSP4AedqKJ
	+8gLWhwiPapvzO/A/ZarGSp8PobZX4r1E9K/k5rZ+IZJ7db/RvS4Nw0UD7CTIyjv0gzhVjnqO+I
	n/+jAMn4=
X-Received: by 2002:a17:903:2c04:b0:2b4:61cc:37a8 with SMTP id
 d9443c01a7336-2beb037a5ebmr84878125ad.17.1779544525740; Sat, 23 May 2026
 06:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260522095401.72915-1-phucduc.bui@gmail.com> <20260522095401.72915-3-phucduc.bui@gmail.com>
 <CAGb2v67UmMmM7bQOSf3VxsN9D8s3N8nMMX079_kiMcPU=VszFg@mail.gmail.com>
In-Reply-To: <CAGb2v67UmMmM7bQOSf3VxsN9D8s3N8nMMX079_kiMcPU=VszFg@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 23 May 2026 20:55:14 +0700
X-Gm-Features: AVHnY4LdsB2vxkXWpfCH6RC9wHMSLxokWJG9po2ovVtNcvhv5VoQTpPnz_GBIew
Message-ID: <CAABR9nEB8jizn+NrVgrjcOOJRtaU0u+TH705unMTh7HYO=8Wcg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ASoC: sunxi: sun4i-spdif: Resume device before
 kcontrol register access
To: wens@kernel.org
Cc: broonie@kernel.org, codekipper@gmail.com, jernej.skrabec@gmail.com, 
	lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, nichen@iscas.ac.cn, perex@perex.cz, 
	samuel@sholland.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_065526_879939_6940E1D9 
X-CRM114-Status: GOOD (  12.13  )
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

Hi Chen-Yu,

On Sat, May 23, 2026 at 2:19=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
> And when you do add patches due to Sashiko raising an issue, please
> do mention it in the commit message.
>

As mentioned in the v1 discussion , this issue was originally reported
by Sashiko.
I'll add the Reported-by tag in the next revision.
v1 links:
https://lore.kernel.org/all/20260513105003.81880-1-phucduc.bui@gmail.com/

> Did you actually reproduce the issue, or did you add the patch simply
> because Sashiko mentioned it?
>
Since I lack Sunxi hardware, I couldn't reproduce it or perform runtime tes=
ting.
But I did compile-test the patch.
The patch aims to fix unsafe register accesses that occur before ensuring t=
he
device is runtime-resumed.

> On sunxi, either it will hang the system because the bus transaction
> got ignored, or it won't as something else enabled the clock.
>

If Sunxi's PM design already guarantees safe access here,
feel free to reject the patch.

Best Regards,
Phuc

