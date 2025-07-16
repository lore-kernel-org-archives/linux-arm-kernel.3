Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD0EC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 14:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mz5RRhyfwITv33oCf/7iVVV0cKwknfvfP+MVHktAv/o=; b=Qqy8GJLsrLmPeYFi1HjDyvbEug
	zyFJuBsuF6aU9Tjuc4/9piyIssmZY6OfsFwSgcwXoOJ0ZPsdXLmdRMMrpI1SFPiYqYMPERvKwHGwE
	aVfM8atYPiYXMrtIqOvILvi/+OW66BWW7RlEaE15gBwbaYR0rlLkG0q5KkvQZkGQJfDA34VuJL+80
	OS3RQW/QxPr5KNkmi6yjdlaLeXGwD6o6Ri4c/RPds9torr62I9Q/FflHGwC7feGg6HRcfNL4HTOyh
	dljg/Hn8nL0OKc96frwCvgnR7autYLVrn9/FjnzwvHZm3/Y6moRDRzYm2wyjIEIRETiiLPb2W+oyf
	pNkmbjhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc366-00000007trk-14Sz;
	Wed, 16 Jul 2025 14:27:02 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc31N-00000007tFs-3UPQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 14:22:10 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-315cd33fa79so5039904a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 07:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752675725; x=1753280525; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mz5RRhyfwITv33oCf/7iVVV0cKwknfvfP+MVHktAv/o=;
        b=mTAzCYkaW+hBhXsVct1gKQ23OGSLZk1LgMLw9G/bvkMW77gP601LbrnmSe6mQkVeZ0
         Ea97Z3fV9Ib/KFdB/Ux0uC2w6PF7ONxA6r5SW/0uBvveZ84w2jKw1NOU69unipsrUcri
         54/IBmwPrZMikFXUpL0tuizuefRzlbL98lYNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752675725; x=1753280525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mz5RRhyfwITv33oCf/7iVVV0cKwknfvfP+MVHktAv/o=;
        b=NyXsDnoVb8BQNtVuf2AbCcZFHlwA4dOJ5nEK67juBWxox06HfTK/5x9sXs2YB4cJCu
         G744Yxu2YsQ7PvTDbhz3Y8gO2nV3nGKacUe1d6jMia02JwoKm7uZvt+6DlFOGzBfHPNA
         C6UDEYUOJWvCo+QaJayeECuN/yr4mwndpyc9Rydx/UJXmZYuKkZ1n19N5t6cOOT8fozg
         9lcdbDtV0/757eLxbWoe0ZNeOLQn9CHWdBU0/vVzY9JZsrkNOU0xXDAvV8X2NV8vmn2F
         4tSKkQ0P2+AfdruAoc+9zhybL2H/exKlnDQOf8BWIXkXbgp9K1V04eBGGtNaYtIEumMN
         7mZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2fraTiqtkyP07huj8XkyvdWs2NFaZty3SCLNGIqeXJUZ13zhAkvReEPsh9wJvliOyqH9HgGE2pvKlyLMYZU/v@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+lq5nZLM1NKmIyTz3pdUxaEZiIBFa7sKL5bZOSWVtLfpKn/JP
	7y9jG5BoykGLT3CmUnFqt+zwP33qexbCLpbRjGNyJbzfO9aRuaGQcqubeJZ56wa9QSIudaqabW8
	ksSY=
X-Gm-Gg: ASbGncvpMSqcpQUrX6ALyDwwDri8rbODtIG5Ux4XR0f8IU2Aq6PO3gEfcBOIOQuX3Ae
	/H5K1iffm5XXmw3b8NAUUBNlJL3pb9IZ9i50rXFk8E4clgl/WEF3JOomjWOzmVrYgWjLop4sfgx
	+fSX54KTPXksxp4Oy/VcVU4LsU/gp4iwyBdDvQcIfCgxv/PwTtRha/23M5rdZ/aPp+WKGxSMjfo
	EyPPZGoFMJWyW1+Mno8ds9WUuuF7HOl9xicQr9/8Z/mkb+YDgtH0OmhWVjHT6B+w0qguNRKLyJS
	2JWvy9Ho3s185KDYEMEGkKLWp3FOHpWNbBQP04iwIzK6U67w7SQ+S4QYpaDPVd92ndQjyt6D9BZ
	0Ow8tEaiEngRvrVx7uUbRXKuRnx1Ln3UyjKyNvZtnBJ2GkxHmg3g9ljMf8j7F4eVRQ5B3uTqH
X-Google-Smtp-Source: AGHT+IEf7178pT74V2/2SmwLqT2SONY7GCNYxXDTTm736CDEhvwrZhlmM/+iH3gcvhVXTEsifLLN7Q==
X-Received: by 2002:a17:90b:524d:b0:30e:9349:2da2 with SMTP id 98e67ed59e1d1-31c9e6e9238mr4578954a91.4.1752675724594;
        Wed, 16 Jul 2025 07:22:04 -0700 (PDT)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com. [209.85.216.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f1ba687sm1606191a91.2.2025.07.16.07.21.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 07:22:02 -0700 (PDT)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-311e46d38ddso6070138a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 07:21:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX8CqE/9Ijg07BnuVfTDEycNju7z2aYRzOkLXqXQj5uQfo3v7WQSw0+fjsAQ8cuy7KbXiP/mmRkiHDtG2he5xUp@lists.infradead.org
X-Received: by 2002:a17:90b:1646:b0:2fe:85f0:e115 with SMTP id
 98e67ed59e1d1-31c9e77cfe5mr4368025a91.26.1752675712704; Wed, 16 Jul 2025
 07:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
 <20250716-topic-goodnight_cheza-v2-2-6fa8d3261813@oss.qualcomm.com>
In-Reply-To: <20250716-topic-goodnight_cheza-v2-2-6fa8d3261813@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Jul 2025 07:21:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wj=J0-3rpjEsdLzgHzY3nXw0CWaCTHfbkNnu5H=VCPgQ@mail.gmail.com>
X-Gm-Features: Ac12FXzTw0wKAIsfrwSNsVdCEfNSNshL9d8ykTsLQev02btB00hc45WqX4Wa3pM
Message-ID: <CAD=FV=Wj=J0-3rpjEsdLzgHzY3nXw0CWaCTHfbkNnu5H=VCPgQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: arm: qcom: Remove sdm845-cheza
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robin.clark@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_072209_869214_4055B8C4 
X-CRM114-Status: GOOD (  13.50  )
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

On Wed, Jul 16, 2025 at 3:16=E2=80=AFAM 'Konrad Dybcio' via
cros-qcom-dts-watchers <cros-qcom-dts-watchers@chromium.org> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Cheza was a prototype board, used mainly by the ChromeOS folks.
>
> Almost no working devices are known to exist, and the small amount of
> remaining ones are not in use anymore.
>
> Remove the compatible strings reserved for it, as, quite frankly, Cheza
> is no more.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 3 ---
>  1 file changed, 3 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

