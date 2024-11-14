Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142D6D6A220
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 17:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70gJ5zQHC0Lse0UD4fjwb/7l60pwtmkagRtu7goaz6M=; b=IsRpMrfWvBXRacZ6OueP1Y0DUr
	Um+9+2lQftFTpnnm+Q+rPCYniO7Kedz0UxG4s6QpnyksAznqDsvZKSAGIhr62X8xOSbWMGV7SrPkQ
	vtj1Wbbwnl8A/275an/xX66ZbyHS+R9xnAs/32o2jM+1DxEUCK5aVa72KjlMcFMZClWtKvl7Gzun0
	5sSF7P5JrfHyZuKSnuFuqcBCIir9hZwRkIqkrABsWyenHldTF0I/ngO1qO5ZQS53mN8RMydTMfxva
	33IKtnDrJqmHth9wlnByEPqMFIzVPUygkOYDmy8AO3oY1eh2OvnlO7JhWPdk9Jjx0uNsl8WpLDsgG
	yMKj5I8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBdfq-00000000KjZ-3ZRn;
	Thu, 14 Nov 2024 17:30:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcgQ-000000007cH-1nAw
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 Nov 2024 16:27:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=70gJ5zQHC0Lse0UD4fjwb/7l60pwtmkagRtu7goaz6M=; b=AyhSrD7WEInpHmC24RX8t4urJS
	7a39kUbJ8TFsxIXLPEgBXOsu5DRRJE2iLTFi7ztoNu3CX6KNH/6X0tsLkyKgW2wIY50RfXGgoIuiI
	/I+/2o5++7+EVITFo5chTkn+8DprE4K6OSEDlz2JQvTrb//SoJ6DDnnBOtzH/4C7j0zxGkEp/ErXc
	xeC05WAPIxIJ5lNlz5IY01FViEWSQzXYwv97wJIWZYDyrQpe0HD8PUHlHqne3VrzP9cC73+YaNK9P
	aFISnXw5RnWUbqe/28Ekw4tCAyjks+Z3TFn4pT/fZ4JDYDND5tiH25DkbFe6WkUrIdeoqITzcyH34
	GD6cywow==;
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBboJ-000000005za-2fMR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 15:31:09 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e381460f782so654226276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 07:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731598265; x=1732203065; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=70gJ5zQHC0Lse0UD4fjwb/7l60pwtmkagRtu7goaz6M=;
        b=QfSoErtPzdfrJEzzjqV4R9rIx7gMGkX1qrYTB4XtIC8/+KC8dwAXwwUWCgJTkuhtXV
         qTdXf8BQsPtaGNcOG4RBEI0WVhV4BWH/yGXSwyHWAuesJrj+QxVHXn9dajlm2dKX3uor
         zQuVfIvaPF0ntgckYRIPBQbVuHouRlHXpLsNhIbHNLILCcJu2FuQb37UJ0qDlb4r/VmE
         ZXkvTuIYYKqeDD5IceUw3At/oFeLSHUJ+6SSvS9Oo9+ZVlRa7B/uxNTYXKzrkglkEHlS
         ODtEnQdxbNo/HyQkWRFsCPi/N/wr/UgNZoOa6uUqvmAEg3vZdD7UNsAHHLOtFXweSMUv
         9WTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731598265; x=1732203065;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=70gJ5zQHC0Lse0UD4fjwb/7l60pwtmkagRtu7goaz6M=;
        b=gRcoiL6AgWf5d1r4tOPlX5DMi7R9qfsNcbmgBGUjK1RmGZrgBlY1WSNwKnswZbNHbT
         +xHY8T0CkoGFiZ6IyYvPY26nTIJhBncn5I3gwF4E2xyulpvu0kgkVva9FRmPiyfCAn14
         4pGn84dnW/xPiTi2KZm37fnmE6KRtAcYhrM7PpoeeeO9Rowd9SbuuK1uvsO4v2i/uiRV
         UH/0q80o/IubKpbcADQMsM51W3dB0Xr2H3jZQKFDeJOb7qhf+VjzVVtwrBKHbz52Fbc1
         6+MxwUmAmSWAm9bYOCsQU+kY1vTCFkeqjEZYoRXmOejE+oMUk3lEmW4gD+s/K2eB6tIz
         0XhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU55YrV8Nr0siB6rOw4byDLoLdNX/yDz+UJjqs9frRTjZArVAxcREttBJpw0Sts1YsvxKJr2JmMidonb7zOmdCB@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4DGuHe0LPg3BxrtXcXWlSxi4xQRgdgib8fFNkv4eitoc2Ea9C
	t0Y5HEjMeLRlNKdv23eYtjOq7jO2iCCc0NXBDf07DbzGWCElfnV+yll1cRuHcXfiB+Y/D0IIYZK
	eGKi+pAw3/vUP4/KFfAifLIKIgHmvIA4gkS+BeA==
X-Google-Smtp-Source: AGHT+IEp1jiyHz9AVjBAYLpqzeU34jEuIl4ZH89aHk/oBWMuPpm3ufftnmd3RZZtkAwQhhPDaHc5iByLDBclaPuDYYw=
X-Received: by 2002:a05:6902:c11:b0:e29:1def:1032 with SMTP id
 3f1490d57ef6-e337f8c7023mr22843700276.41.1731598264542; Thu, 14 Nov 2024
 07:31:04 -0800 (PST)
MIME-Version: 1.0
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
In-Reply-To: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 14 Nov 2024 16:30:27 +0100
Message-ID: <CAPDyKFpGrw+vOs=-TxfChBeORjzkpaL_iVB08MtmaC4sFNKzcg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Allow specifying an S2RAM sleep on pre-SYSTEM_SUSPEND
 PSCI impls
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_153107_761361_F781F77F 
X-CRM114-Status: GOOD (  19.54  )
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

On Mon, 28 Oct 2024 at 15:24, Konrad Dybcio <konradybcio@kernel.org> wrote:
>
> Certain firmwares expose exactly what PSCI_SYSTEM_SUSPEND does through
> CPU_SUSPEND instead. Inform Linux about that.
> Please see the commit messages for a more detailed explanation.
>
> This is effectively a more educated follow-up to [1].
>
> The ultimate goal is to stop making Linux think that certain states
> only concern cores/clusters, and consequently setting
> pm_set_suspend/resume_via_firmware(), so that client drivers (such as
> NVMe, see related discussion over at [2]) can make informed decisions
> about assuming the power state of the device they govern.

In my opinion, this is not really the correct way to do it. Using
pm_set_suspend/resume_via_firmware() works fine for x86/ACPI, but not
for PSCI like this. Let me elaborate. If the NVMe storage device is
sharing the same power-rail as the CPU cluster, then yes we should use
PSCI to control it. But is that really the case? If so, there are in
principle two ways forward to deal with this correctly.

1) If PSCI OSI mode is being used, the corresponding NVMe storage
device should be hooked up to the CPU PM cluster domain via genpd and
controlled as any other devices sharing the cluster-rail. In this way,
genpd together with the cpuidle-psci-domain can decide whether it's
okay to turn off the cluster. I believe this is the preferred way, but
2) would work fine too.

2) If PSCI PC mode is being used, a separate channel/interface to the
FW (like SCMI or rpmh in the QC case), should inform the FW whether
NVMe needs the power to it. This information should then be taken into
account by the PSCI FW when it decides what low-power-state to enter,
which ultimately means whether the cluster-rail can be turned off or
not.

Assuming PSCI OSI mode is used here. Then if 1) doesn't work for you,
please elaborate on why, so we can help to make it work, as it should.

[...]

Kind regards
Uffe

