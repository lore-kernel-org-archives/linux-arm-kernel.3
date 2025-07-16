Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1068FC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 14:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRgANhiZNBnDfTk3Cs6H1fGZwr7ZYCqusPX7KWdZOuI=; b=VRX/fyavAwp8riGxf/KqLgGZEn
	YPxpnpgY9EGQvR7gV8Xfm1F5YIN8TN0dHJ7hTae1CfnjsYx5G/LImotf8gSMrCvel0EW+rXUfh3CS
	yTg//OeoHGOTBuzucrfE6RCUpOOneC/3udwvSvFQeMIAWnad82D+u6h5r88KuCO1z0jpSxtlMgqF3
	DJA9RhWd6WnTgxmjxstoBXg7341wU38zuJeEs9Hxsc7oYvlUlTAU1PnQaWlCwuyiJhadGy+wSydZv
	KiZLHdQCIjw7AhxTSwZbxuhHX719xhaiUwCA2Zj+lF655ZxSjQiFnEd9mO2qsiolfKSWrD1C3WIKw
	Pux5zD/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc33d-00000007tYq-27ML;
	Wed, 16 Jul 2025 14:24:29 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc318-00000007tDx-4AMz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 14:21:56 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-23508d30142so71013855ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 07:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752675709; x=1753280509; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRgANhiZNBnDfTk3Cs6H1fGZwr7ZYCqusPX7KWdZOuI=;
        b=Ul3y4iaX20Pr31elAxfVUo2KVl1VBGgNxBYbUbKjy11iyK2pvjxsKsxOrRHx1XhXi2
         mFJDjZajxL96KyCYyDKnCuPJUuoNKNYXheH6XKjl6eKi5IfEvW8cfAGL5k/ed5xKvDVI
         cHUE02mriShXj6jhQEXRp6Vi8KdqOA5dTcImY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752675709; x=1753280509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRgANhiZNBnDfTk3Cs6H1fGZwr7ZYCqusPX7KWdZOuI=;
        b=gwhotvNHkjqkHinsjJzy1hbHKEzY5K2LSeusBuECVms2KFFCJNjriI/SPcAV+1KkW5
         s7gofr+PVGbn7N2kmJfBbhO1FQhc0ug/HdKVDWDwJI4dBYbX35lcZ83x8X0NtrHO6oAM
         BN8+7YOUYiY27LSvqFFbeOdNWRD3DO0qAbhr+PMZdwmEzadpNOZ7sAQbEc5Iog1nVOua
         MD7K0JxtNIhP5ZRNAzhr9OT8VEW8sL5i3eVdHO+9jfY+ATo6KGRB6FJxy06eiVJ4DqpA
         +8RVT8eXBwOGk9ybo9n295K3SJhUA7fXJtmU92j1f8zmDseqpTz6ur2YTpzN9uPisi35
         dm3A==
X-Forwarded-Encrypted: i=1; AJvYcCULAwgsnZ8SNQYkEx5bZk3F3bdZ2cthmAAe4hR9Szz7P73/jH9zMINRlE2AsD+KRyEPVUfTcKBy7UEB6vHF8lxI@lists.infradead.org
X-Gm-Message-State: AOJu0YwAAwqBJxKOeV+roAjEDtE67eJZOfnzisppIQUgXnFDedtCUS7o
	fNmBKhgc5CaQw2b1y4uRzEjz3SoeuntFSPhRlNpsFIPTaGj7APpqqZuaa7cRiViSVWTqp1n9oEp
	pI/8=
X-Gm-Gg: ASbGncuTAQQ8mearaWCpTcGaeFO22G0XIsK1+JzQ411r4n6GSqwkfF9HWcEt7c4WfAq
	fceExkSgtWLkMc6xyW0dmPa+biloOXPxm4LlrjoyqTOoi6ny0tlYTZCU8cHmQN/Zn7d89hT0SQF
	ywJeqboRMr5q2Dik0VH+oZXN57LAGlzazvxpojNiEa3UggUGgSbsYGK20CrRfBTdoviXTTaOtKg
	7p7RADPhbIYOL9z3RPh1ndwPUUF/NwyaLiOs7cYR7FFW03YB1dUUOzLx9cRxXr5az0o3H5KIQSE
	7R6WCmgIF41B/BYMaXl22VtCh+jR4y4VYSD5T2AE/ZITIqLegbHo3VXaZBQ7CoeG7uVgS4dV5bC
	wSlTQCigAb53licziSNITHv+/3GgbjcFQ1VwMBqVbcJ/GZvGrF8bGt4CCfA4E1Q==
X-Google-Smtp-Source: AGHT+IGOUkg8KW7jt2TwBUd+5YAQqgb/+YPANezum70X0YDXK5TpElQW0W9tGtt2aW1+4MsjY8L+tQ==
X-Received: by 2002:a17:902:e845:b0:234:d7b2:2ac3 with SMTP id d9443c01a7336-23e256b5f6amr40260615ad.20.1752675708685;
        Wed, 16 Jul 2025 07:21:48 -0700 (PDT)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com. [209.85.216.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de434c264sm128149685ad.201.2025.07.16.07.21.46
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 07:21:46 -0700 (PDT)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3137c20213cso6375243a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 07:21:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUqaQHoHJlSHACdD7IsKBqvkEBUry24dzde+OjpTuW7GW2nfn8GacOej+LJmbSWKcKdjBQP9nbSzBf8qs4cINvR@lists.infradead.org
X-Received: by 2002:a17:90a:d2c8:b0:312:1c83:58f7 with SMTP id
 98e67ed59e1d1-31c9f2e1b97mr3914439a91.0.1752675705212; Wed, 16 Jul 2025
 07:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
 <20250716-topic-goodnight_cheza-v2-1-6fa8d3261813@oss.qualcomm.com>
In-Reply-To: <20250716-topic-goodnight_cheza-v2-1-6fa8d3261813@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Jul 2025 07:21:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wn4C-cs1y3obzxdtdYcSM44m=AJVnb+Pn3kaaos2ng5Q@mail.gmail.com>
X-Gm-Features: Ac12FXw3qS1FXk204atE8vfiTTzOmf0rWggWMgrUTIEYVKUJNOkL9pqvkeQi0pU
Message-ID: <CAD=FV=Wn4C-cs1y3obzxdtdYcSM44m=AJVnb+Pn3kaaos2ng5Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: Remove sdm845-cheza boards
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
X-CRM114-CacheID: sfid-20250716_072155_059518_05DC36F1 
X-CRM114-Status: GOOD (  13.36  )
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
> Cheza was a prototype board, used mainly by the ChromeOS folks, whose
> former efforts on making linux-arm-msm better we greatly appreciate.
>
> There are close to zero known-working devices at this point in time
> (see the link below) and it was never productized.
>
> Remove it to ease maintenance burden.
>
> Link: https://lore.kernel.org/linux-arm-msm/5567e441-055d-443a-b117-ec16b=
53dc059@oss.qualcomm.com/
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile            |    3 -
>  arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dts |  238 -----
>  arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dts |  238 -----
>  arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dts |  174 ----
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi   | 1330 --------------------=
------
>  5 files changed, 1983 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

