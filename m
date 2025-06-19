Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314C6C7115E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 08:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mQQX0g/RXBoYey7jHVoGxTSFtEhgzlZ2xKLsOSPaOg=; b=VHtPSU2duw9B0Ksn/9v3BxwMXd
	Hanajyo2ueQy9UzdtLC3WG2n6Gp6uLFyiQ+RGG7AhoX5AT3eSsO3wKHtp3YMHfXXAgSU/RVUXzRbq
	itLyXRmjLe+cCn4lNCWoG0c/Il94tlzm+LGS1cStYQF58TBzad2PlqU+OprscvfdAbEcD0XkdchYA
	DRlPBytx4O+fIevp1T9wPlLdrRiQqWDnjXkzjB4gG2RLnqDVEnw36W15T783y5uFN0qej/rMvYoCC
	y2YISeBZM7L90NtakfBq9obOuXDORGUqGTsFvWWHZgd7Rm1htlwTmcI5tikjHbul3yjN7F/1DxgY9
	tS3j230A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAd0-0000000CQml-0Pp1;
	Thu, 19 Jun 2025 08:28:10 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSA41-0000000CM64-3ODb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 07:52:03 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-553b6a349ccso457119e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 00:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750319519; x=1750924319; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mQQX0g/RXBoYey7jHVoGxTSFtEhgzlZ2xKLsOSPaOg=;
        b=Qilxf40r4QUbgh4083gn0GQkp1ZX3rQl8OBomiHsBEUo8feSk1mUMTBuqN20aHJ1FT
         wCciToBdIWriNjU7P7Y6LTgDyzorWAlFM6PMDu+3EADDZ0+MHMd1g7oSOFO7Wy3xGZB2
         sJE/IiX5jRykyBw0WSbLGs8Et4XrkI0yOJ9N0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750319519; x=1750924319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7mQQX0g/RXBoYey7jHVoGxTSFtEhgzlZ2xKLsOSPaOg=;
        b=qr+klnY3bkDjqrN75upNY7npf9E9pVAlqqkgUUI21NibqK0eXVDzPjxQPUJh9AK6tr
         V8aV3UJpqxbtPiMw5neqnzjcMbxdCUc0QEdHduVdGAP1btJInTbsA/j9dFITZu6xmoRl
         /GlWsB9s6g5MxejbutqjGPCGcmhvzbmiUnIwf83efoGHrKYOEvoW1PbzbCldPn4AOxKx
         /eSMcU59tIG/cEhyDgJ7N1RtbOBT5KYUt71OR/TNg2lEailmU98JVTp/fjhc1KUGol02
         IPY7qd87s/cxjGcFKsaEt2arGXCKDOtwcVW5ldhMJBoRxcdWbVRLhFGvCEfEJADMtiB4
         hH6g==
X-Forwarded-Encrypted: i=1; AJvYcCURgQGWfpCOd2n+MUdmB0hhlWv92l0Q7Xu1KPJImDlPJtG9di4D2BMvSRBpTiPfuAWx69E7RPnXsbT9OEgakyXj@lists.infradead.org
X-Gm-Message-State: AOJu0YweHy72s3H0HlsH2iRpBxzuS7m3I0q3sx9UOZKdHYUtaALQlDpO
	YTbvz51XuKjsEWXWRnBZ/oWXRn6qOBaHw1dvQk3fL+tL1ygktHHnfb/tK2KKZXKdXZl2mDnQl9B
	qeDgjAdAgIV9d/SjGFS4FdtymzboLgl99BiIaGnbfDLxKVfFjd5E=
X-Gm-Gg: ASbGncvELsFQrp3gFxCPlgOjwvQ5flfw28Kp0uT926I5PD1kP8+Hvtjr1ZJC+nK49N1
	EA5zvE5/7bGy3NkThpKo5ggRfGk+ww9So5hGuvMLzbXou3IMduuCXNXEB+KILHrHxqF8Rx/iI8N
	ugcBA83H6nTPtm+pCSQzAc0X1SX2r9Xok5zVFM8R8cJEwcIOV1s+TaPgWPkeWZ+N8UfCF5EYg=
X-Google-Smtp-Source: AGHT+IGKSw6WMdR9IoIRey67gW5v3Kd28RATCpIk0gj4cgp0HNOfe/nKQSJBKksAip/SsLckx6UbC9sCyZs1uSNHQ90=
X-Received: by 2002:a05:6512:6ca:b0:553:6488:fa56 with SMTP id
 2adb3069b0e04-553b6f42225mr6061529e87.43.1750319519609; Thu, 19 Jun 2025
 00:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250318102259.189289-1-laura.nao@collabora.com>
 <20250318102259.189289-3-laura.nao@collabora.com> <CAGXv+5E-G0BY5q_EsxOkEEJvqXaX5=Y9PWqNbwysLEFfU-UmAg@mail.gmail.com>
In-Reply-To: <CAGXv+5E-G0BY5q_EsxOkEEJvqXaX5=Y9PWqNbwysLEFfU-UmAg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 19 Jun 2025 15:51:48 +0800
X-Gm-Features: AX0GCFshC_lgMp9vezDeihTD0kDhQFAT31Y9bBRKASrIpMKtnPIy3f3lDgJ-TQs
Message-ID: <CAGXv+5Ff8jFqURizywr7NedprytSoCz9HvaW__v_Q1LcuzMxrw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8192-asurada-spherion: Mark
 trackpads as fail-needs-probe
To: angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	nfraprado@collabora.com, kernel@collabora.com, 
	Laura Nao <laura.nao@collabora.com>, matthias.bgg@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_005201_850755_8E9E1DFE 
X-CRM114-Status: GOOD (  13.06  )
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

Hi Angelo,

On Wed, Mar 19, 2025 at 12:23=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> On Tue, Mar 18, 2025 at 6:26=E2=80=AFPM Laura Nao <laura.nao@collabora.co=
m> wrote:
> >
> > Different Spherion variants use different trackpads on the same I2C2
> > bus. Instead of enabling all of them by default, mark them as
> > "fail-needs-probe" and let the implementation determine which one is
> > actually present.
> >
> > Additionally, move the trackpad pinctrl entry back to the individual
> > trackpad nodes.
> >
> > Signed-off-by: Laura Nao <laura.nao@collabora.com>
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

It looks like this patch has fallen through the cracks.
Could you pick it up?


Thanks
ChenYu

