Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4452CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 20:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWiaguT33mFKTHX+XCub37wPb4gjq7oRFtLlclQ4EBM=; b=1qLuG58ThuZkYYk+wqzTe0V2r4
	2OMf5Jnl1qac0r97pwchCLCv+qJzEpfFIJnj4Bzzdi7lG+kevQtwd99aD8m1IDkX4Al+g7L0OjA9p
	NUjtqK9PdwdVegDXV91hIrVMvY2H/aNSd7d4OysBUXKSh/G0xPH0WkgyOJBN4Na5mjqutf465CWeX
	GSfzVhsi0clc/7Z3O69ZJa5/ETpHVQJT4UtMMiq3SzqCx2CpN8yvVgXsxqw79DttjBLIs2DNcAc9O
	tw+uyMFiHemFqpB8+N5Iy0CLP6RlpYBWvnmjNR0B6dEB7jVYxCeNX5ioZUpS4ckuWqm70shF9L6Z6
	TZvksIYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKMQ5-0000000HR8t-310H;
	Tue, 05 May 2026 20:31:05 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKMQ2-0000000HR7w-3oBp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 20:31:04 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7dea1272943so3454746a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 13:31:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778013060; cv=none;
        d=google.com; s=arc-20240605;
        b=GFRZFzciBrDHGzQTB+inEDMsTDXrQAynL15ibwHbH9WKPbtZf8WdXLYD7V8RN0V1CF
         MZaDdHoK4DjakL8Kg61LSMWkpuq31jlVtnU7p/DSOkIp+kdjbUp6P5oH7wLN2ugO6/MK
         drbQuC6XWznm6GojBcXazAJVJvYLbyDrAkBwKjeMvrqzfVxy3QDY6IAPDoV+ak0FYLr1
         GhHDbzzDPiUfAgXfp2HQh0zkOy9VzaQ/pkjGdqQn6XjvgBNmKhvLVX9QaVUX+mQI1efk
         sWIZ0xOFAQMYhMPXh59OidKchzIebWEkve9zkXrwDov+PPjuhfDzK/LoD8E6OKofGYAH
         Z+fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XWiaguT33mFKTHX+XCub37wPb4gjq7oRFtLlclQ4EBM=;
        fh=65CoG4qw1Ci3NH23NcuvNR0psVQwYOhUniEO5A+PvIE=;
        b=UrT9AgtmdyOVny4G1s0ipE8pVi3/2DhaKqEZ5FX+vtgglJkfpVU5qJ73VWBiykz+GS
         LKcV/LDuaGAyZVnZgGEBpmKIGZlDxPofpT9PIIo5oNSEz6R4IodflhFwfTovW92cHUh1
         SLfzEQARyn6Li6kulOAyHh0VPPIUjswLQuBKtLwtOwj7TKZJTYtRP3PsJbZOawsnqHM0
         d1jJOWdpMaaPlm7wLtCQWh6extVmRrbJPclLhbV3vMUsiuOGU7bo3qnYJGBGOl3Rt/rx
         u8TcJ88FBMeZDimOt36m66xVAelAMBAGCcIyRTBPHPGG7InzuFmkLZkFTCL95lRp2I3r
         nFPQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1778013060; x=1778617860; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWiaguT33mFKTHX+XCub37wPb4gjq7oRFtLlclQ4EBM=;
        b=WFxK7ESJoz7XkWKJn3MUhMouVi/dj2npIPXxI4jOlaCGiE0kOStCvQJ4lqwXgLl6Es
         TfIRwO0684FFAn9L+8+yVT2FhSMa+yUTn+iU/Lt5GN3Bek3AvDAdTAOtgpn26HcgRQzv
         onWTs4Q3vBAdMNDegl8vLAatqFYMDueO25gXE35WCnkenWIShoNTtmGz8NMu+LnQ+v8f
         /odzU+WXLpb+LiL552j2PM3/XLu6qHtN7xKHTzM8bFGiRQobmhfE7Gzvb5wSI/hZ3JFa
         l/tw8S3rfmyo+tL3O0rhBb/s+e/75+LvNZ8NdmABERnPmvcCCGR061CIqz898R1lwaia
         ERcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778013060; x=1778617860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XWiaguT33mFKTHX+XCub37wPb4gjq7oRFtLlclQ4EBM=;
        b=KhJob6I1ycc7U2Am8SrwHyeIrr1YD0thNFjZvSEyRpo14ZZM6J+mVuY4z9NtCNyj5l
         GAnaaWWF6YQSQBWv13A3wFW0uaYhqvFAF2zCH0dRqDU534RUrWczSQ25/X7L1pWUKOeo
         upRrNJHEXz0cbBY3Uk7Xj4hpeEj29hnrWIX+u+q/l9Rau1BEgg4UUb2skABKugnTCNgS
         SGYRXFaAr3KieiWGkKjSjgDNZo0LIl+TSms+vWJugw6JXGYEyIzJzyJdDGx127ZGSfPp
         weiJ9C9uf6Zxg7SX/w8X9ZRxGGUtRcUWGhtKVHxDRDX0GVYb6mfjNtykQLlHdxOzoPgP
         JQ8w==
X-Forwarded-Encrypted: i=1; AFNElJ9Kp3pbO1XfOYEp7fR/gS/Wms5FUeH453yyLkYC93w5jsGasVsaEahJ94Mn0BqJc+hNW2B8QDYy1v0n5k6VnZUX@lists.infradead.org
X-Gm-Message-State: AOJu0YyXpJIPsVOyvDsz0QK89i6IASuG4n1UmpOAWDwY9fxLNsGznBfU
	PRJyaR4yWhJxJw9zooROX3/brFsWj5JctpJsEGv3w3WjVpyhGI48XcDBd/fpE7hXRQ7xWJYQN3+
	qtCC00t/XvatFkM3s4d8nV/EN4ha8CQNeDp+48C41YQ==
X-Gm-Gg: AeBDiet9QGMKIy8KoSQQumT37Eeg2DoBaAEWBPeRNcrLN6uZ835oW//PkH+tNswAgNe
	evix2PdIGJs6s8ygg00gsVEIJ+EXR5HlU0h3qW4PX8eFytQ13qyjz4bKRSnkQBgiKmMAzTFyIRi
	T2OOO6udoCEwIXk0Bafgda5kbon1XQkHTRTHIm24TzNGDTEPBbaPnNVzgVuOxanbWavwpRvLi9R
	w41OE1BY9oCBopFEaG0kfXQ2QzJMwvEdZMk64fWiT7p4DW4G7DvLuduz34uRbc4dxXyherdcqjI
	eOttg/wTaO1ZgZh416MfcdvTktcLlQdpRBuM7jypuqR21gqOdhDbN1IUsCVDkGA1TiA4MgdmFLJ
	qQRoykA==
X-Received: by 2002:a05:6820:612:b0:694:914a:ebe1 with SMTP id
 006d021491bc7-69998d496f4mr230276eaf.47.1778013060106; Tue, 05 May 2026
 13:31:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260429024737.544813-1-dennis@ausil.us> <20260429024737.544813-4-dennis@ausil.us>
 <26834823.ouqheUzb2q@phil>
In-Reply-To: <26834823.ouqheUzb2q@phil>
From: Dennis Gilmore <dennis@ausil.us>
Date: Tue, 5 May 2026 15:30:49 -0500
X-Gm-Features: AVHnY4JYRhq_p9ta-ys9Z6NemjXvr6rGjpeyTa05lQ2fOW4hQ-wHeaXjdlyGa24
Message-ID: <CAABkxwtJv4VrS+6kdZ5c1QeuRtnKaFJir0=B9xsqirUiai+iKA@mail.gmail.com>
Subject: Re: [PATCH v9 3/4] arm64: dts: rockchip: refactor items from Orange
 Pi 5/b to prep for Pro
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Alexey Charkov <alchark@gmail.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	FUKAUMI Naoki <naoki@radxa.com>, Peter Robinson <pbrobinson@gmail.com>, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_133102_970301_1239DDD4 
X-CRM114-Status: GOOD (  13.56  )
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

On Tue, May 5, 2026 at 12:36=E2=80=AFPM Heiko Stuebner <heiko@sntech.de> wr=
ote:
>
> Hi Dennis,
>
> Am Mittwoch, 29. April 2026, 04:47:34 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Dennis Gilmore:
> > The RK806 PLDO1 and PLDO2 outputs are wired differently between the
> > 5/5B and the Pro (PLDO1/PLDO2 are swapped), so label the PMIC node
> > rk806_single in the base dtsi, drop pldo-reg1/pldo-reg2 from it, and
> > define them via a &rk806_single regulators augmentation in
> > rk3588s-orangepi-5-5b.dtsi. The Pro will supply its own mapping.
>
> I guess my only question is, where did that "single" come from and what
> is it supposed to mean? ... I would've assumed "&rk806" as label would've
> been enough? But maybe that "_single" has some special meaning?
>
> Thanks
> Heiko

Hi Heiko,

The _single suffix was meant to distinguish this from dual-RK806
designs (e.g. EVB1/EVB2/QuartzPro64) where two RK806 PMICs are chained
as master (pmic@0) and slave (pmic@1). I wanted to signal "this board
has exactly one RK806, not the master half of a pair."

You're right that this is unnecessary =E2=80=94 the EVB boards don't label
their master as rk806_master either, so there's no established
convention that _single is part of. I'll rename it to just rk806 in
v10.

Dennis

