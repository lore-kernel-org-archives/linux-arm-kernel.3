Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C5EC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 14:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptfKV/lWd5XKyT6rmwDogz+72ly7gZepKQSMRpdWixE=; b=N+jBzOxlYOEBVQ33qDvkIkIvXW
	E7Hicg9mV9axrkbwczfYpEl2BdMMlmUmXZog5xMtIszfeFZccQzY+RU7K6jHb8ushue93ppRdpH8P
	cOtcNDXXBhoUDsiluXVXKgMwI8DbAVrYhLCM2TMu/x8UcHt4YL+rxFlTnZzdXMt71gMpQR3ICeViJ
	RT4x9yvOgMM4lDCJFpWuUJteRleXFMC10LEX8k7IoVD5jGnGUvg0nV0zUibW8UxKv0EFVCzUbekQs
	VkFKUI5GB9AGAzPz09OBGeTVWgZxWwFoDnZ4Ezxm6w7ojcmA6+sDzjGinua75KCA+1Bm+ROn6J9FP
	lfLRGkFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc3DT-00000007v7b-2mwL;
	Wed, 16 Jul 2025 14:34:39 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc36h-00000007txr-0uPn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 14:27:40 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-72c27166ab3so4217857a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 07:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752676058; x=1753280858; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ptfKV/lWd5XKyT6rmwDogz+72ly7gZepKQSMRpdWixE=;
        b=IgGHRbyRBy5GXwrMwQat5olxhmXI4hefL6gGtwslIE89A1bhSOFZ9+p+Pbt/OHOhSy
         0CrJl3rhnGPJCS2LVWr4ZbZuNhogGKY1jNJH2AO1ida6EjRWexQaFxlZBF7qA7fZXF87
         T+/EiGeK3pWSUzTQ6E75+/gnm1f4aB2EmFoV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752676058; x=1753280858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptfKV/lWd5XKyT6rmwDogz+72ly7gZepKQSMRpdWixE=;
        b=ONgM/haTi3ftFwm4cx5NAiAO0TlKYIU2tjPRUQYAq215t++4mS9sOZjwkA4qSVwNaP
         ZcWmrIvEjzAdY6EOyy0mMD7A3pMvKXNYZ6WaRnvlxzQwguuAbxs9/XeiK5keBCbTObZf
         8Tum+9RNYOoC3lkK97OZhJX3oYQFiM07T4OJVeQkiQTZvsV/ev4Pf4b4UO44MypBQHGi
         EY+oEWe3uQNUj6zuwah053IQDUepIOEJK8KNGZcohkgqEnWaLOTL1ym3aofjP6pKGzCN
         c+Oah5n1eQFkrvQKb1Ldlz0ZSUEChzzGe7Cpd/UvoRABRcN7YBJHEkZGKHopHXuXTykc
         gkhg==
X-Forwarded-Encrypted: i=1; AJvYcCUPUmtq2KUh9FB+tTErYUsA38eerEisRARqqj51kP/Y81dbaa6bhRD7kC9YbCM8SNRIEjMISaasYoov5iBSiWns@lists.infradead.org
X-Gm-Message-State: AOJu0YxfG8be0rjj2lzmq7OxxOYVjQ9N4pZ5IpB7+bOVU8bPc7kxsnt6
	DdjNbY6NLuf2MVJxqr8dMa7Hfwd6D0BkO34Up3oPm3VnoV585O7Epmp1dXpyYvSK8vNmucoLp9U
	9L5E=
X-Gm-Gg: ASbGnctBB+2gRWuaU3PLDkhbC/DYgrnzFlNmrcSxs9k0wsz3ylvhy5wkIB1EMTJSHQM
	NaNTVJJoyEntXaMATpDWQrey3yLTlwwfBylb2KNyOdNVGwRp9QiMegTEBsqbYed0JKQl4Seg77a
	NTzL/oNdgQy89LfzeLqLvCxTtQvX/zcNaOHLwqKJmnuvJnRUBKzBmLw8Y9fPx4CdMhfWXdg1vE1
	ReEtzkuMqr8Wf4ji0Rhz/MOkM2PgV29ZfZb1RpZkrgp80MWXOYSeFAUQ9EOw1MYc11uRBO3bwGc
	7Qu3Fx2+svQIeXLJBzx3RK1HoEGy7DXB69clzH+iqPOPjYNakcQDegxtnJyZAq604fgH3OFtUJf
	SXKeDakDD9I/LLUa+0Wl0CfGlSf6Z9h6GoXzDYaWiyNoMwjTBVsuvQvpyqINFjA==
X-Google-Smtp-Source: AGHT+IEb/8ia5O1VDUZg1PAX00iu51kPzF5vgF+d0mhOTh26Wch+5PIrxpx12F9gyXx2/LXJqs0O4g==
X-Received: by 2002:a05:6870:4149:b0:2d5:4f4:e24d with SMTP id 586e51a60fabf-2ffb21e8c02mr2257770fac.6.1752676057670;
        Wed, 16 Jul 2025 07:27:37 -0700 (PDT)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com. [209.85.160.50])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff1173040asm3478283fac.46.2025.07.16.07.27.37
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 07:27:37 -0700 (PDT)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2ff9b45aec2so748901fac.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 07:27:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCViv76aZkrAJPoV6XY05wkYvnvVcqcNdC8j178EuK9CqgvTfsJjt5B3eJRCVDSDAPa00+AwPP+b5g66M2aPaQoT@lists.infradead.org
X-Received: by 2002:a17:90b:3c4b:b0:311:fde5:c4be with SMTP id
 98e67ed59e1d1-31c9f45c8e9mr3962513a91.35.1752675732176; Wed, 16 Jul 2025
 07:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
 <20250716-topic-goodnight_cheza-v2-4-6fa8d3261813@oss.qualcomm.com>
In-Reply-To: <20250716-topic-goodnight_cheza-v2-4-6fa8d3261813@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Jul 2025 07:22:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VnE0kUk58GxmfwwZ7eP-9xe1Hqv8n9y2tHkiMK3nwFGQ@mail.gmail.com>
X-Gm-Features: Ac12FXz8ywMx4qZ-nfHra53TjelQ0XaS7lSbI5YSdJlI09vDJzDmVP6OfgYR9ro
Message-ID: <CAD=FV=VnE0kUk58GxmfwwZ7eP-9xe1Hqv8n9y2tHkiMK3nwFGQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] MAINTAINERS: Remove sdm845-cheza device trees
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
X-CRM114-CacheID: sfid-20250716_072739_252080_E4DCB249 
X-CRM114-Status: GOOD (  13.99  )
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
> Cheza was a prototype board, used for developing Snapdragon platform
> support on ChromeOS.
>
> Since almost none are left in existence, and none are left in use, the
> device trees for that family of devices are being removed.
>
> Clean up the maintainers entry with it.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

