Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1671E7DF0A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 16:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=enDw9LkM3CdlAH4/IbRE0pQEHAl9HYEyYit2vG/Lo9A=; b=xKBVh9Rqtq97c78hl7r2PBexQg
	vk0lfrpECSdu1PblBPAZ+qi9GSaWTCs7ySYRYjADLmCcFIcrFeCmpDzgBLa2J4edALcaekvXMVtHK
	naRsWwNs7b+rtD149nTIGG0Rz6qRGaglk1WJ6MnFXBnN9jVYPI/2j2l1x6jW0O3UxuKkn5budJjUO
	ooTU8VNy6kO/i8o7INVxV6QaNcLno35sZpa1MkJ3jRe+Qvar9t/f4KPfjqFVEfJ/M2Y7ra9F1He8X
	6+s2vPIdYgWGbKySXO8HTDFKCA3XfeFgfliOK/TAUGNx/Z8HxLZ4R+SMXiVp/EMg+5hveMLeEMlln
	xVP918mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmxAL-00000005K4n-08G7;
	Mon, 02 Feb 2026 16:52:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmxAJ-00000005K4F-1mHp
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Feb 2026 16:52:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=enDw9LkM3CdlAH4/IbRE0pQEHAl9HYEyYit2vG/Lo9A=; b=ijWrw99V13ej0u76OBbkATzwYx
	2eaSeyyKypLUwfNbmC1Wa/0NI1TW/hU0wOK4d+E/vPQ3jIvJjYLk3l0SWKf8uZd9Dt/zIHu42BHCb
	uF7tuV6EC6vTVX5lc4Yk3/qVbkGBPlYr87RlTYIEj0jCudm4kfsexLJkjvXTFo/yf3AMOpJoaxKtj
	xEHGyDSMOVutoTYV//Ry8KmjFlhXnUL61Y0o46AMp9PeZxgpkSorDgLmZBH3DvFUPIB2i6R6b4qUf
	DZURpQ2KA/OcSe92LFnfFTdUvGLF5g+7LqSuDyZ4uUgfJ7skN5uJsnbscyFdD8xZW8yDGQSQD0Ac+
	zvqRWD/Q==;
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmxAG-0000000EsQS-1rvi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 16:52:42 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b8707005183so718757266b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 08:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770051156; x=1770655956; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enDw9LkM3CdlAH4/IbRE0pQEHAl9HYEyYit2vG/Lo9A=;
        b=Wq839bZrOAfy7kRJFHEAvU3rgo1LQwBwjek34VPm1gBcUNhaLulARwJxZYQKMSCKbP
         2Blgjg/cunK3yC/kjEt7xW3Otm8xk11AnIIjboYwARe0hTobBr/ISwA7X/y8ypfLz/1e
         MZYkxm6FWspWe+LOmWoDCB2+zs9iHd5Yndx2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770051156; x=1770655956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=enDw9LkM3CdlAH4/IbRE0pQEHAl9HYEyYit2vG/Lo9A=;
        b=JzTr3MZIv1wbMs9K58jv7Q6rLlPg9Y30jq0wFpW/KPzGIzi6Gc/dk1lmjfka6DEQlz
         1ECEij0PnlL+rcGHkghlxWGrEE6VlQeQ/e+qVQgKQqMUnyv7xagNSXY0eznzkaLU6o+k
         zchYBYcUDJa67xY5Y09RmED79XJhsMAvg4Q3JlgmERfVlQJNjM8p70AeCoZlqFcfCXdH
         lbCeggOtQ9t5IqGHWO6Vy2o9ZVqSPyOaekM5dqymjx5nJbS+ErUNNjLhlkCsl7KnSMwy
         Dr3xi2vC1CT2ZSB5r9LSQjXI4gf6toCnId/J+znkBXSEoaHSf0X6Ntzfs0cA2yKzSXZv
         0ThA==
X-Forwarded-Encrypted: i=1; AJvYcCVOavLA1HhgSyh/Y0dnmTUkYm8kgQ96iclXeyc/JxajwYpgmdabDI3I9BKbw454O5mfKC0PanAW5BMt/BXaJHf3@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1DgIh1S7CTP64N759QNGH/0vT0E+XlstiFB6GwbPPuVCFHsZL
	0nJgMcsdjgBQ8TxCf2EIndMFKIS8Te5IAZezp4gvsad5XJlibZpChL8lXIfiZ6NMeYCEUoxd/pV
	o9+XtrA==
X-Gm-Gg: AZuq6aJvcll+rR/tLM+w39heqVbP5WdFJ7rmcvfrnPaJFKSAYrlYnxO4q6/nwPRybN5
	a9o7azezfvSCsf6PtsHwM1NkDhJ30hpbZhBkZKesXWXC/vhjpDUPtIwpYxYj3G58GdyUFiah3Kt
	z+RrHJDGzAk50btU+s6pScU8ShDCJYWxF3o/IJ2xsI2gYhH9rHLUPkWvdnPsmuCP+hxdl68JY3k
	LkmoY+gCG2E/sT4Gruq7i9n9YpAlnfKWdGa/GMVkRSdR0Ll5MJDJCZrAl3M9B85PWfno3s/HwNv
	I1FMcdeYzkbc3YhZvjIoIpm20/sLjNEgsj8s5wN8h4JeRRivfhTUDuZLHwuM3011FcbquSDePez
	+3sTuqaJyLtkGvC4sucRrKVj9lC2Kq1gu8xH/+lhqIkoxHYF5m5TYKVAbxtfRXVPOSbooL3Cw5y
	bv5Vy6w9VgEBz/HbpyXhttOAxVJM5Uz2ZpTXW6Svf6tw+DKenj8TnhHg/Bgk62
X-Received: by 2002:a17:906:dc92:b0:b86:e938:1b3a with SMTP id a640c23a62f3a-b8dff53de9dmr707358266b.17.1770051155438;
        Mon, 02 Feb 2026 08:52:35 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8de3046abasm736762566b.2.2026.02.02.08.52.34
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 08:52:34 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso35817785e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 08:52:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWdzQGmmpPbHn0jchlImpHyPuZg2sx69i+6K7W4yTT86+TaklR66M18mj3qkOu4/UR28QlXC0z8kSYjxgZj7EGH@lists.infradead.org
X-Received: by 2002:a05:600c:6298:b0:480:5951:fc1e with SMTP id
 5b1f17b1804b1-482db45fbf4mr163945605e9.11.1770051153710; Mon, 02 Feb 2026
 08:52:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1769191673.git.robin.murphy@arm.com> <c7f6f75d55a4801eab63a0dc81d14ae27866aca9.1769191673.git.robin.murphy@arm.com>
In-Reply-To: <c7f6f75d55a4801eab63a0dc81d14ae27866aca9.1769191673.git.robin.murphy@arm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 2 Feb 2026 08:52:22 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XCK1RBgdxs07aHgowNvCSm5-+oUVZ3HcMVWuKwW4ggTg@mail.gmail.com>
X-Gm-Features: AZwV_QjXmR-vAYYsukd2qlxBElYKsT5Nm3boXnLH7lvnRNqLj3lt-cXAEK2VGP4
Message-ID: <CAD=FV=XCK1RBgdxs07aHgowNvCSm5-+oUVZ3HcMVWuKwW4ggTg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: Move FriendlyElec
 HD702E to eDP
To: Robin Murphy <robin.murphy@arm.com>
Cc: heiko@sntech.de, neil.armstrong@linaro.org, thierry.reding@gmail.com, 
	sam@ravnborg.org, jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_165240_595145_CAF286DD 
X-CRM114-Status: GOOD (  11.95  )
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

Hi,

On Fri, Jan 23, 2026 at 11:22=E2=80=AFAM Robin Murphy <robin.murphy@arm.com=
> wrote:
>
> The "E" alludes to the fact that FriendlyElec's HD702E is actually an
> eDP panel - move its compatible to the appropriate binding doc.
>
> Cc: <devicetree@vger.kernel.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  .../devicetree/bindings/display/panel/panel-edp-legacy.yaml     | 2 ++
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)

Pushed patches to drm-misc-next:

[1/4] dt-bindings: display: panel: Move FriendlyElec HD702E to eDP
      commit: e2242223b714ac9fd8233546ca74ce972024111f

