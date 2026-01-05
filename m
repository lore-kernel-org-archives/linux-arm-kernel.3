Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7471C79FBA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 19:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cCvkvL2C/5gj+RhnXidCQE8qJ7m+kanbEcL9OclNPb4=; b=EgSCFG7Z+X3NeldozFqQcNphBJ
	KPmCXeJO+3PLF9ws3WkKBJzCUzkMOhRKtf/1ythq2xV7Dysgy0b+hxCYBKbbfkc7lyhEaFEeBh6La
	oSi/9SzSGkm4Z6JDPk+RoaYRiDGzizDlHjdoTKt8+8v9wjDb4/oH/TANFwlD4xfM5KRGtRTUbHFsA
	0zyFlBp8d1bJD4OuNGNFpBGOuE6T1UwhL6Ofbvu0IhLAYcYFRG59YdLiteLQV8Ik8KBk1l7Ow8m7p
	H86NBznCn5j/pgYcxKdeDIL96AwqZkLXrsK0+rA3/nwEsybz2Iu9x7kNrmPzbILbPrV84HJ2tgSws
	j7jggisQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqMp-0000000BzGF-0CIC;
	Mon, 05 Jan 2026 19:35:51 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqMg-0000000BzFB-1nQc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 19:35:49 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b7ffa5d1b80so48108566b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 11:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767641739; x=1768246539; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCvkvL2C/5gj+RhnXidCQE8qJ7m+kanbEcL9OclNPb4=;
        b=g7AklKKac3z+zSV8AkisHWJYANZUAFfk6rISttgwg2CNrVxEngJd6Fmf4g5c4NMgli
         GPq+h6AbTeiNop7SA3WnhTKYfcZSQumMsaylA8PVQ4Qsf1kS5S1E5X4TZ/G0PusAem/L
         nO7rvnhPQDjtpbasajJB8nhK40XfGNIyIEQSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767641739; x=1768246539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cCvkvL2C/5gj+RhnXidCQE8qJ7m+kanbEcL9OclNPb4=;
        b=fqNI7OEkks2bGsNUBT/A7bep0vMbz3NaorMNPpArFZwlL9uYjyLCtPTd1RFBacmVSz
         OAQLUt5OEji+1wcu08BUw10cHLv41CEdBP6HzRGOkqgbJf+7D4Zzff6TWgEJUtb9izGf
         Nf5qkzdPhzIdVCn5O71eT9SE9DS8l6VVyn/b8Vk/kWKoz70mhlXU8Z0N/VUFTKDunbm0
         k+dXHQnZxjJJXnJTYwCB5uE3tVj8GwdfD9+sjfNx9A7zrIui1GHnTEOwwNC69m1//ate
         Q8vQ2lFP7nDkE6lbOKs6K+KemQI92YxBebdlvbsP4I3msOkyKy/FMICFFZmLIUM2f0WH
         kmhg==
X-Forwarded-Encrypted: i=1; AJvYcCXZfog6XS2vv6BEs1X6EZBpTOS8ULN9T8YQM0NVQU/mqXWlXoUBWvrb+6qoiJ50Lmh0CbGDWUXw1BJcwFFN7Rww@lists.infradead.org
X-Gm-Message-State: AOJu0YynzjTUzy9sAWOW08BJkKAJce5JSHMx+uvwB2lmrWiiIbBYEZvQ
	QU+WF4iexFv4QWfbWV9NzBHEwLLAiWyRHChgAxVVPj83G0egi+uwGYitFrN69CjGiex1DlTlMJC
	hkYgA+A==
X-Gm-Gg: AY/fxX6tIlvAuJgD2wyJb3MlXi0LHY4qMFHIGaCtwjkEBhaepK9DvApZ4v9hWwwH01t
	quSgwc4lZqRV1KIpvJwvSWV+aE3+vvUeLa/ylx+MN5KAbznsPordkGTjvGD26IzWA9MR3wa+4Tb
	xLQRkMTIEoqmU6W57BN3dHD/gjl9X1RbTgh1mPflv1JPoIg6rbzSJGl2SqXbTofWi6ni9DG+aFn
	Kjmvx37NOc3GjZMbQ92vsfu9ZprNQBLpVH5LCIfk4Tqk2SJ5GJaulD84sC1uEuU2z3enYgMCpJH
	5MVRPk/ojsBK7ULcxiEqQ27SKnwW54rNv64/107ZaZPEUNu1Iw6w6IxxI3RESaFQxHS02YTixNC
	Dh2kNtLFNkmga99T+vZLqSzq9fTv+r9adfwX1DVMt4ameW9yBAJAnc7Z2+O1TxhDrTG6wpRwOXd
	E+fAJuwvUd+N1Q1xWl04QWqNOIRK3xrFfC6BLknnTnLYjkrN9y06oNdloKw5tP
X-Google-Smtp-Source: AGHT+IFBV89cCUl4L4x2uAL0ADacybVHy+BqtuEo4eH3BFuSCUzY+Towp5xHUCerY1aw+tXgKXTLlg==
X-Received: by 2002:a17:907:608d:b0:b83:1326:a504 with SMTP id a640c23a62f3a-b8426c96d63mr97867366b.60.1767641739383;
        Mon, 05 Jan 2026 11:35:39 -0800 (PST)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d1c61sm9096566b.35.2026.01.05.11.35.38
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 11:35:38 -0800 (PST)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42fbc305882so135005f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 11:35:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXwlFKrocshiDewdjMDe4gVMN4gjrCWXGwwnEUk/vOqjVnl2HqkTE//yz8rZN9OFCRxJbL0qMo48DmmJdw/co4o@lists.infradead.org
X-Received: by 2002:a05:6000:2089:b0:431:53:1f49 with SMTP id
 ffacd0b85a97d-432bca5166emr1151221f8f.41.1767641738057; Mon, 05 Jan 2026
 11:35:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1767111804.git.robin.murphy@arm.com>
In-Reply-To: <cover.1767111804.git.robin.murphy@arm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 5 Jan 2026 11:35:26 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UkCYRPbs3u3jGRZaqs4EW4-zA75iAaqM+=Weom1uojmw@mail.gmail.com>
X-Gm-Features: AQt7F2qVclSy_2QUaj476pwucQuko2WJOWlBn7va8S3tPYkC358gB4ruqkJGhvQ
Message-ID: <CAD=FV=UkCYRPbs3u3jGRZaqs4EW4-zA75iAaqM+=Weom1uojmw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Properly support FriendlyElec HD702E
To: Robin Murphy <robin.murphy@arm.com>
Cc: heiko@sntech.de, neil.armstrong@linaro.org, thierry.reding@gmail.com, 
	sam@ravnborg.org, jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_113547_081493_B631FDE9 
X-CRM114-Status: GOOD (  18.01  )
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

On Tue, Dec 30, 2025 at 9:20=E2=80=AFAM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> Hi all,
>
> I've been using the HD702E LCD/touchscreen on my NanoPC-T4 for a few
> years using my own DT with the "simple-panel" binding, but now we have
> upstream overlays I figured it's about time to try doing it properly.
> The screen itself doesn't seem to want to work as a generic "edp-panel",
> as it appears the EDID isn't readable until after the whole lot is
> enabled - I'm guessing this might be to do with the Analogix driver's
> force-hpd behaviour - but since we do already have the legacy data, it
> doesn't seem unreasonable to keep using it.

Oh, I guess I should have read the cover letter before the patches. Sorry! =
:(

I'm hoping that with the "hpd-absent-delay-ms" you'll be able to read
the EDID. I'd be surprised if something else is required, but let me
know if that doesn't work.

-Doug

