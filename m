Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C416C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 10:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqOH/YydyeFepQj4djKoRufGWAHZEIvnHzq3g2f3Mz0=; b=LB9HK58PBLLWBnV4u47onhunGk
	eyUV+9k682Co/ssY8twrGNV+dbixxXLu7F799jV2Tfw2LrfCat8biFlvhKkc/8ytiHbTTSzmM0GsZ
	oB/f6Pim3XgP3euUkrsFa1TRmPii0Z8QHYYLLvHtJ3s/MMY4QJ5+24HGOPCVWpohbl6bizAnzuugf
	8nQWQF8zbc+7UFNvqOfaG38Bm+mNzvYoTvd6fSWRFDQx9tnJyjRw59d2sJ5VYgWRIm/SzVz050Nqv
	XP1EHWhxuR+mqATbVfxM6p8d4+V+Z8d5M8Un6ywK2WCCjsJRAHZqRr5C6+YyvkVBorIC6jQ1+eoRm
	2CBcgx4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujEdh-0000000CSQr-1XMg;
	Tue, 05 Aug 2025 10:11:25 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujEMf-0000000CQKJ-1MaW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 09:53:50 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-879d2e419b9so3364304a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 02:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754387628; x=1754992428; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kqOH/YydyeFepQj4djKoRufGWAHZEIvnHzq3g2f3Mz0=;
        b=i3df79HBM6BP98RmzHgKPcHHkjKcVvPe1JOaYcUtnj5d9n/3SgP1oLckcIlbGzchWD
         e5iB+0LhlFegK6o0jPeInbSfjnDQS+N4ysXrqbR+tfRRwqxjKA0JxlrAV/OolEq5WhHV
         aP8lJqv5h6wMBkrZoJAIOi32vXLt1EtrLpAo8vzgDLKjM8asP7SY9jCRREyBVItFEKgh
         eyyw4L019+glzpvfiIcjVtkze039QA38jao7ltJ/g2mPqe6qXlzO7LCgx3W9JlsRvvjd
         31yfp/qYvx88WhrXrjk4shJhDfivL0Vx3+U0ZZu3dke7MfgdtG12ClaXtTCKGU5ZV88o
         iO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754387628; x=1754992428;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kqOH/YydyeFepQj4djKoRufGWAHZEIvnHzq3g2f3Mz0=;
        b=mX9M5enD0gFkWL/LT3kdmiOxGMYyoQZw2+mw/fVaDi0FSZUH5v6eJZhZHdwjtCSMhG
         S8EuXLNS2avdsNiEERVZDb0MU+nF2vSUenkM8s9bXoZbj9V+cePVIYKvGc7mdLIjQZDU
         UcRI00yiaSLsJGKcbbJZqyssHItUwMhqIc6B+PdTmOnM/vvTDLWo/OR6TOis+a0e6iIP
         HWywKqOnp6b6TcBbbwPETird0smeWtDZWyEaLzbBnoW/p9ISkQTe5gCqX3MwT3az7U9M
         +unYBZ13MiwxhsfWL4DS5RAa7AC+1UMGByW0JHvGfEs6tLwIRhX9KVzsYVZSramnfTZN
         qQrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeIq2nwxuIpbx7dJAhYo8MS/9ta3ZkSiCw4tBdYPBG3w2vUa1yVa1VSZK3qqdN7S/St0wD5zW6Xk7d7+Sc98AW@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg0pW7dl6ddm4yh3+w/vPYYWl+RhArQY+D7RWU0cJPu9jEtvXk
	fYLy0jvSOMa+NghhshiujIWWhiyZgSFgPMU6M02CqzBgEij7Ne11i8LHLPYGpaJlyOJN6xWrtk5
	jkkCjgZQXlBcMeE/uimsBd7c8Y/nDBVtpqW6c3bXJ7A==
X-Gm-Gg: ASbGnctyOqQORnhyd2VaLk9qTv2CjzE286VeAvoguLyDjnqYe6fRK36uuDc/ZLLCTiU
	+l1xsGaI7MwlwUhHMJbCVc0b7nTgxLgY0JDGBT25vWELMVRLIgsdbc8hvuTzth0be253O7fy+6R
	jVI/DiZhlAPMMC3MB2K8izH9o5o6uyFDBHpoQSqJOBXrzNgek94d/MKctMd6QMV9ivQgc8eh3Nv
	ojOFg==
X-Google-Smtp-Source: AGHT+IEzHAmi0MSWAu1rgQfjhSryD3cFVQRd7ATB9s5pY8kjz8u84GpsLjOHEKwVBL1zb+hkERMs+dO7ax4ayrjHp+c=
X-Received: by 2002:a17:90b:33ce:b0:31f:4a91:4e94 with SMTP id
 98e67ed59e1d1-321162d2237mr15476293a91.30.1754387628536; Tue, 05 Aug 2025
 02:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
 <c7cca483-f1d3-45b4-abef-ec5019ad57dd@oss.qualcomm.com> <c6f74d55-6ea8-498f-a05a-000599f93ac6@oss.qualcomm.com>
 <b5f8fce0-afe8-409b-b43d-fa9f413cd442@oss.qualcomm.com>
In-Reply-To: <b5f8fce0-afe8-409b-b43d-fa9f413cd442@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 5 Aug 2025 10:53:37 +0100
X-Gm-Features: Ac12FXwafHZ88AWPsVnZmJsBajP70fc8s8ykZSQl042YjN088WSulIMKoD4bYuE
Message-ID: <CAJ9a7VgZ61oL4LLxKSon3LXsYDtaHaPcGNxW=cwzhSOs3ea1PQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Enable CTCU device for QCS8300
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_025349_379569_503DEBA2 
X-CRM114-Status: GOOD (  19.47  )
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

Hi Jie,

On Tue, 5 Aug 2025 at 05:11, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
>
>
> On 7/28/2025 9:08 AM, Jie Gan wrote:
> >
> >
> > On 7/15/2025 8:41 AM, Jie Gan wrote:
> >>
> >>
> >> On 6/24/2025 5:59 PM, Jie Gan wrote:
> >>> Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in
> >>> binding to utilize
> >>> the compitable of the SA8775p platform becuase the CTCU for QCS8300
> >>> shares same
> >>> configurations as SA8775p platform.
> >>
> >> Gentle ping.
> >
> > Gentle ping.
>
> Gentle ping.
> Hi Coresight maintainers,
>
> Can you please help to review the patch?
>
> Thanks,
> Jie
>
> >
> > Thanks,
> > Jie
> >
> >>
> >> Hi Suzuki, Mike, James, Rob
> >>
> >> Can you plz help to review the patch from Coresight view?
> >>
> >> Thanks,
> >> Jie
> >>
> >>>
> >>> Changes in V2:
> >>> 1. Add Krzysztof's R-B tag for dt-binding patch.
> >>> 2. Add Konrad's Acked-by tag for dt patch.
> >>> 3. Rebased on tag next-20250623.
> >>> 4. Missed email addresses for coresight's maintainers in V1, loop them.
> >>> Link to V1 - https://lore.kernel.org/all/20250327024943.3502313-1-
> >>> jie.gan@oss.qualcomm.com/
> >>>
> >>> Jie Gan (2):
> >>>    dt-bindings: arm: add CTCU device for QCS8300
> >>>    arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes
> >>>
> >>>   .../bindings/arm/qcom,coresight-ctcu.yaml     |   9 +-
> >>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 153 ++++++++++++++++++
> >>>   2 files changed, 160 insertions(+), 2 deletions(-)
> >>>
> >>
> >>
> >
>

You need to send a new patch addressing the comments made by Krzysztof..

Regards

Mike
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

