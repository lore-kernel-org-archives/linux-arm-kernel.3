Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E221AF3D33C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 17:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/v7sICsM5F4xpYz64Tnfvw3weq5zyAxTy0YM7/lebk=; b=2FTH666jlDnCfgdIzT6a3P4ail
	2LPr1XX4uTJP6+cnYSsH3nrVhBD2y/KPDZ3ClqO441VaZ79e8p0u0ofeBf7MAUAA9kxPCzdRhKjgd
	6RJ5YnpahFqqQI0eedZK7FvFfOsFpu9CbxquQC8vQeaPq2N6vgi03gTTH8EWw5GjWkvYfXd9tC7Eg
	WjdJmrvepXh1p0OZU4tLnsv/Aqh77i9UJaSeDepubGpsHDOJoUO/zLbEalsW3akPHfXTcppzeNuhu
	JLJidy48AmM14OtbetYEOq89heRVyrzEhb3RqlKmvXiWbwUvMfvMrtHxG0sxuv5tWutzNS9qVxZQ6
	YCFgaUeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCME-00000002HDb-38Kw;
	Thu, 05 Mar 2026 17:19:30 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCMC-00000002HCm-0lq0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 17:19:29 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-506c02ec1b3so92534711cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:19:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772731167; cv=none;
        d=google.com; s=arc-20240605;
        b=eiajkKfclI5JWXJGXof7G4vIbo4VgmCgI/cX3rHrsC55ZpjM00/WHYucz5Ooxl2rqx
         lRuAGuRUefP87haFRowSJ++ZLklO8nLlSTM8qZcbwT8NQiICVR1G2NAkws3iz+l6Z4UV
         5WeLtFi9wFMl+CAUiXi1dAeufGFcQTqXgTumBtM+T91PwpIQ4gu9SeFmt0dAPQKvEHga
         q+FnAPKecz6HBS5QDJIWWcT76U07P6+yFn8Qyv6EgjjPcPLtuHI8/760IOkZ3YaYCnJP
         G0yFOx4M7h6a3RsF7N7+I8r4g4aBasUAchHAtISJo/d90qeWWZHvdvxSk2QfgUvKMseX
         bTOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6/v7sICsM5F4xpYz64Tnfvw3weq5zyAxTy0YM7/lebk=;
        fh=ozboxRmKWDpZxi887fGc9uAyVzwwuXgjGRwdtowu4sM=;
        b=DLrqEr3KJ6NEn6YOmB7vWiQWf4hXozbAvWUcL69EljvHt2r/JWewOfK4wLAKqir8go
         dM9llDQ77SOXTy1uAk2bb3HVMtlALjkzoWBRBFfu/2fkkcJR/haFg+FwpFpag61znloC
         B71Mo+muYNJXKc0dxzp9TIhYHYixBYLQ9g1/j5biM6ytmFz5nVW1OmzR92KW61/gc/FJ
         RyVDOQ0LQ+pqg7AGg0yaPA7vXRnWrEE4Hta7oJN/67LkP+Lwps1qUo1KBW5UXKlJ2BZc
         c8orTYOAqMQwFXa3xOXpSCk+/5ojMO4EhzNJh7dFFbO7RerMoRxljke4R35F+YrZD/QN
         cLAQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772731167; x=1773335967; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/v7sICsM5F4xpYz64Tnfvw3weq5zyAxTy0YM7/lebk=;
        b=ZPC6unHudgvF+JrrunV/aemjN+XlcRf1Z1xECgADQbhbYLZbuXkDmEw19ihmDjVruK
         LuKNqMKzLCy5s15wY2V4wTqPYsOeUFFzoOQdTCWFpSlRdQqhquynYn+E5aTexjxczAyJ
         98RHnsvmp2I3qD6JMVC8UxeBB5c+Zxir456jwW45dFScmiGb2Ipu1D1WeKsZ2rhi7qC1
         HZRf5npdftVcpwsPFMWUjxn9Fi2gNtTCyNvuld7BoOw2FFo8a9OsJ6cqlPq8mda5waTX
         Ntzash0nbNlKRMfZU5lKVi2b/XAgTDt+v/qn72SeN8KlrOXjk8JLD+uW17dYUGRUw/7C
         Ljqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772731167; x=1773335967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6/v7sICsM5F4xpYz64Tnfvw3weq5zyAxTy0YM7/lebk=;
        b=uGZ/8XLLBf2hkWqvSaW3kFPVO5vMCJxRV8uaLvoxf71fyqbQtnJzOiMQ190imXuV9e
         ICvpNHV4wuqprECkIpgM+0car2UAHlEIwrlucchohuTgWCyDbvbOQo4nmsuuewl5OvCA
         1hPei+ygojsqf2Lg0r1+ishsdM861QtUM+W2h23CX43JPzEt+5Q8Rte2hmTEP0sdsIYI
         Ol30WnZu+0Gi/+0+uwRkgaPs4ghFGreS86XmX7XvhHMuehSqvFKeDc6yaMGqijXLtcLC
         bc7/sdSaDB5NIBTm390RnfOfUS+3HAm2I6HVdDOpDf7pAh9UGqKx0UlFezQ2Rg7dN7i1
         YWpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMQ0SUwjC+lzo+FHYXyEnbmos77hC7T7XoeZqbvXj8JIwt67JoCLtn4QI/6Db5ouU2FHGJoqjSIHrGPL/qLiAC@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc/M3+pdCO9W0wyr/J5dLzP/wnySuqPTputz1lImx6xleWHD43
	KAh8mSTA2GHhrwwGMrjogJKgFBDYLpykQnV9QZladZZqdkIHO2G9pO+XhFRdPrJLbp4n4yoaxBQ
	hpDF36bPZlJp4NLKhY6+bSsdff5G1Hq0=
X-Gm-Gg: ATEYQzzZGhkSyIQzhx4871jUDfpSc5eT5O6VqU3ppnr00vJpvlOcYoIBSRNDwp63lpU
	TS0cLwj0nPjYygX+kEh/CaLsbqN9m96XsH8sJ8FTYM6NmGnqCYZ61DNGLMCkcUBxk3JY06zs/gn
	s8i/NN56xCXQLHKEPW7k7k12eeXvWrOTQ9WFJNLkKnb8a5JRlATFnTuWQcwm2lEkcIsohf/Jcbj
	5py9xxvG2bLVdc1Z/8xmi/bWssORWG+/BdVOWADAV5SlFFbiXifz7pM4hVyywqEsaIca6tnNBXb
	ETMXkXTIzEYsHuRle4+0VRUCxA==
X-Received: by 2002:ac8:5f91:0:b0:4ee:26e9:98ac with SMTP id
 d75a77b69052e-508e689f8f4mr36540041cf.16.1772731166518; Thu, 05 Mar 2026
 09:19:26 -0800 (PST)
MIME-Version: 1.0
References: <20260304192417.818211-1-akkun11.open@gmail.com>
 <20260304192417.818211-2-akkun11.open@gmail.com> <e8c587e8-61af-4ef7-b7dd-7d8da7b9aeff@collabora.com>
In-Reply-To: <e8c587e8-61af-4ef7-b7dd-7d8da7b9aeff@collabora.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Fri, 6 Mar 2026 02:19:15 +0900
X-Gm-Features: AaiRm51aWSWGaLr6s7woc0EGoF8GjUlJU07ZiwNqeQX-qHV6fBA6LMgRCpFcnX0
Message-ID: <CAKr_iV5j4fWSUCV_1M3E+cejXp0P5H8F2ah19=kOd+s=XFDCBA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: mediatek: Add Lenovo YOGA Tablet 8/10
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, sean.wang@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_091928_240127_1DC6105E 
X-CRM114-Status: GOOD (  10.81  )
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

On Thu, Mar 5, 2026 at 6:49=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> Did you really test this with dtbs_check?
>
> test with `make dtbs_check` before sending a v2 :-)

I think I did it, but I may have missed warnings or errors.
(I was sleepy so I don't remember much, lack of sleep is very bad...)
I must check dtbs_check before sending v2.

> ...also, is the "lenovo,blade" really used for anything (bootloader)?
>
> You can either fix that or just remove the lenovo,blade compatible... but=
 please,

There is no user of it, I'll remove in v2.

Thank you for the guidance.
Best regards,
Akari

