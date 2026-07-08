Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD836C44503
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 20:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3raWAoLWRdXsO1B6qPL4d9kyKqPCs3bPbCVnUUFegwg=; b=xLVmeh7VOFnzcmPcdRVhpaK+MT
	PdGmG6RdBzokLYtdBOOqx1gkMQ2fXKLH4zrfKVvtlYx6kzwTO1awmdmTqYM1XR4z2wnr1yPMlR7W4
	LIC3xsynBsLZv3/07VjcZlFKB0JnYVlQ9x0tEfVaLHWxHlwUzRk6pDhPWyrM3avSO6zwLUwcItpCV
	wnXbilf5EqeR9we+Srk225cVWmPy3HrU0qXQnIBIOmdWvs5QIe6E7cD/5j9ce1TM1dKVN0ZGNkl4X
	jH5HXrRpZCjIoe2wnSpSdYpyE8/2L9FRDABrHMVpt2on7iPptkeS6VeaLwy5GVJ776RwlkPrkTY0e
	SNsoSumw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whYUC-00000000JjP-1znq;
	Wed, 08 Jul 2026 20:03:12 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whYU9-00000000Jia-3oWU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 20:03:11 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cacb8416a1so10549575ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 13:03:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783540988; cv=none;
        d=google.com; s=arc-20260327;
        b=Mftn+Sqc0Kjb2OmrCZ3doBAL8s+2ARNVvhk9BMECjAj9kkiwtRi6yxH0eGFxVFyXzO
         p2Qa0279FiouSyc3MNEbxhOyIeXZ2bUMBVd47ClNduN/081rv/w4KXGziqlnqIIYvIOQ
         +vKC4ju9bSMMU6ISdbt9jz635g4TVTk8rbJMPxNYwna/KOJi3HlE4ChYOCyFBrXj5Sa9
         A7PvR07fUhIIfodcSzhGBBv3XTLf6D9qjRvX5lkpic6if4dcHNHCPgdPUzUFrkpUOTzP
         QvAiXpx/x7TQUxU/5WPqzcPRhY0jmytBJmKuODvNKBnCaWVYvwcL4NNcvE10fONhn/PW
         6Z8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3raWAoLWRdXsO1B6qPL4d9kyKqPCs3bPbCVnUUFegwg=;
        fh=UqN4zYiW5gTbTM06gIP/fxtiWQuCMIyAwrc/7OfaKwc=;
        b=syPFcAYxSkwIsLGqzJL44S7vrv0J+FcMDXZO/21jPhHPt78sz+PyDjaIZ64/zg4J5C
         YuUuswGpGsgzR73ZjYPZt3WecpVlHRg0niPq1xk0Rv3rTDOFSBlw6CI6XEww21QzvtUz
         l8eTcuCGd6IQzoh08qoS8h+l3JbDXjTDip5v6ByPqTTsYxa9HcCxGIdTERdShaLx/5rx
         seVbznCrSDXKUsmRTX88OBjpjNgJ+ZLKThuhwdg7zsanPYM3I1r8xfg/uPh3NeKNb7iz
         XfTNS769XjBMhF/tMPiWtzXqT9P2t2esNE2oCZlctp6se81BY3d3JkYuVsrIojv+Lj69
         HHrA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783540988; x=1784145788; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3raWAoLWRdXsO1B6qPL4d9kyKqPCs3bPbCVnUUFegwg=;
        b=qrR36a2afjilIM1/0Zca8L4izZ1tLaABxzwfv7sMStjLjGarIOVw63uIAQkQ2FtZkW
         9FtGLxqnXJfWe1CjhXohpYmBHXm2TcH3+9uR6CFS4mEWkEAtsMNtVuHtBo7ZuVVOtd0G
         4Hn5aA/yrrjKs2YKgrZt5OmrLZvQkB7xgPRz1FBJQfsNNW53uw0s6gJAcv79/hl4FV+X
         1BFqHD/CR0eys/aGJXcyP0OUYhngytePo5rQZh2PN28iDXCQge22jMzI5AOS3efUs9qL
         FeFEuCvbs6tJuT+Abx7aHpoi2jjPvhKwJABdoa4lkq42DT7hAN9U7QZTukZUeufJEaW9
         SMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783540988; x=1784145788;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3raWAoLWRdXsO1B6qPL4d9kyKqPCs3bPbCVnUUFegwg=;
        b=U0DQtYIoiBmcJ1houdFUWCBMPSaPB/ju44En7klWalNIWbHcCBu+DLFcISFTfjiLZS
         Us9WM9MR0kN33xD07zsSSgI/pswIwZOvQOyM/WXnM+uGCfE+vl4KNxmR9rczDLAIP3Ez
         dyeAqEGliIBY6kuxBiJrsUrj5JA41TdF9yr0qjsPPTYIX5UL/TCJ1HRHRcdrIlPpfzrT
         /wpxU8dqnGRVYhiQ0nYH4nx/TrDEAEV9XgEHbuW7WRZErl42WmrTtFTR8dq11SLrVUWt
         Wr0zNGLdtNew9w8Oo4JYoj3KskxwSD1WHwJJfTDNEU+rZxY9l2XcBIownrs9/sdY21MW
         4Ilw==
X-Forwarded-Encrypted: i=1; AHgh+Rrvu+0ISFnILvnRpFoh/KgDgS/JeqSRHoPPjEkqnJaTvHbfeAsXWtUK8m4M0xhDvmDF454YpNpLg4+OSiea+TiT@lists.infradead.org
X-Gm-Message-State: AOJu0Yx60ipjtDQKH8wWL5YcIqqWWRcIqF8qE0GVEuSdcpvvSrLNMeCM
	uGVkUpXces8ovxK6w1pg56u4LdDxjpI6rnt81HRH5iVQbhMwL5ChNZdRbStzkPlEs3M65+gqGeN
	zwujAIPSSJ8j/kkOfUvqZINAghPC6gAM=
X-Gm-Gg: AfdE7clcYbYRwa9zNdHim3a237ANHKh6CgLM4TGhygVSrNxiNpY42OXTh3qTg9JAR7o
	XPwY04rMhtcxIsgw8/y0qO77P4bqAzDgdzcT4QkiH2+v7+O61Wh68XGCw1xnoeHGOEriTg0VNVK
	Xgi5ZlUwXGd48OOzsyG42DbKH8WXhVAfN0SfiX0HA57C/BeckVVeul3IFkB2eOYuuUmFwhXfzV5
	Ml/32rBCR984KcFc6xsDxitG9mp/NGDQYGjhb79+qluM2YPJxHThZh8WS+lN9WkAAqAN8iYEvVR
	ghPqKHltnY0d5r9WYelI5pNvopFLLw==
X-Received: by 2002:a17:902:d507:b0:2c7:f12d:5d37 with SMTP id
 d9443c01a7336-2ccea3b4332mr41011575ad.17.1783540988351; Wed, 08 Jul 2026
 13:03:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com> <20260706-a9-ir-v1-2-4f082ca8aaf1@amlogic.com>
 <CAFBinCBbRrt6jWj4pczE=-j86Sw2aiAaBpUoTx1x9XErw5NFpQ@mail.gmail.com> <74fc6cfe-f844-4cbb-bc1e-0ad96af37040@amlogic.com>
In-Reply-To: <74fc6cfe-f844-4cbb-bc1e-0ad96af37040@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 8 Jul 2026 22:02:57 +0200
X-Gm-Features: AUfX_mylmZnzRL8QYx31DSmWj6ivxEWovLb2UkpKfybbs6Pkvk-Opma3o6RcohY
Message-ID: <CAFBinCBQ+g8Kr2tL9ob9PvTakGrtwH3qZWjEy-ytGiufGUEieg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: a9: Add IR controller support
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_130309_956740_C8D9BEC5 
X-CRM114-Status: GOOD (  16.64  )
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

On Wed, Jul 8, 2026 at 4:39=E2=80=AFAM Xianwei Zhao <xianwei.zhao@amlogic.c=
om> wrote:
>
> Hi Martin,
>     Thanks for your review.
>
> On 2026/7/8 03:33, Martin Blumenstingl wrote:
> > Hi Xianwei Zhao,
> >
> > On Mon, Jul 6, 2026 at 4:43=E2=80=AFAM Xianwei Zhao via B4 Relay
> > <devnull+xianwei.zhao.amlogic.com@kernel.org>  wrote:
> > [...]
> >> +                               func-ir-in {
> >> +                                       remote_pins: group-remote-pins=
 {
> > Can we keep the established naming:
> > $ git grep remote_input_ao_pins arch/arm64/boot/dts/amlogic/ | wc -l
> > 37
> >
> > I'm worried that adding IR blaster/output support at some point will
> > then lead to confusion.
> >
> Will do. I will rename remote_input_ao_pins.
I'm also happy with remote_input_d_pins or however the datasheet calls
this pin/function (seeing that A9 has AO, C, D and TEST pins in the
always-on domain).
The part that's important for me: include "input" in the name (so it's
clear that this is IR input, not IR output).

