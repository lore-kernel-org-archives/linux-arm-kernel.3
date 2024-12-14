Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC972E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 01:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q5cd0cjWyJ6Gcpn2MCFi80hTQsy0Q72Z9blKAZtUJPM=; b=Vn54zkt/z229+LsVa0TPAvOhQ3
	3qkAqVcQPdRbEAFVeQ89MICGbvDhJCdK+EUdsGlzopTo7zeGVTD22Ud4A1fD42+WqjdKohzu+g/CB
	RE3lQ4dcd+uLPyXbdwkOR3dvgmcA6eSH9GyJFqETtMY84EhJ17t0SHeeww6Hrd43Qf8xwL/CrMnom
	AaA5/7WFl6GtCIRtxiZuQTEEHbeetAmx/cBKsBQp81lyq6OIkPAhRI1Uo1/Cg8PTgfuH7hYvjfg+o
	Bnta3TMdu0jGPM6hSvVu7ZqfkTvP7EqpicQaTJnDb6yVo9/KMXq+7RGiNjWOOW/S4z9et6ymEtCFO
	qJHr7vig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMGZb-00000005SMq-3OR0;
	Sat, 14 Dec 2024 01:03:59 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMGPo-00000005Qtk-2osj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 00:53:53 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so2299836e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 16:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734137629; x=1734742429; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5cd0cjWyJ6Gcpn2MCFi80hTQsy0Q72Z9blKAZtUJPM=;
        b=OySQ5ne0gz76p49T+cUa0EWVZA1ppshDZAPtdpHFSjEQt1ETkLhEQUEK+AGzPM/mUc
         mNFB/Y7yUTBsG/rsq8BRCuhIYrB3bqxWHF/DVHLqo1O68c+GDTKtFaD0tFcNdHif/u+i
         t36pa+0YoGTUAvqwwtMK4/AV+N05GOnqEuHrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734137629; x=1734742429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q5cd0cjWyJ6Gcpn2MCFi80hTQsy0Q72Z9blKAZtUJPM=;
        b=WxR8nOoAV0TWBSxwGncu1ltJd+gETFqKkMKhGYfXRek07V9bLF4yXnvia1mKwfiaMP
         V9g9qzK4gpYMpUG1nK0e7TF3t1z0GMLl0u6g+nid76ZWK532eXL/09oKtiqCH1DG5cw7
         QBC0R6v9TjCOTA0tvW5S9lwhELwSQCa8kr+x99FmaJ9+3XcsTEACPXBp4HHRmdsd4Dwo
         wkj3hsTUAkrHTSbjoklLyKt4wU8ivMO09ETFIp28r2OkeAQQL2rnMUUSMHLX6gPjbvCy
         wIAQcUXHkmZN+H9d9T65YS5+BXL1jMhFI10thTETGyLDKDVGrv7UmccLB3gN311qM15/
         PtZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXi66pcSpcSq1sW50IHhgcGpcQb+rPqpNv4r3IVLcaCvjWbvl6yLizzk4vJUEKCnwKyDgIpANbBSZqI8OosrTqr@lists.infradead.org
X-Gm-Message-State: AOJu0YwJiB25r50R+UDgmxQ6XEcUCcIEiuCapcLgC2DHQNsk4gGNyNPy
	6La4SNHr4GHPfM0OvzXpRVqzVXgh713uy7GrkWqf3olV0i0zTZEuMvzZ2xmxKfUPaaZzFvI0UN4
	2rdOC
X-Gm-Gg: ASbGncvjSchhZZubTvceL6f/urbaGe5NdZu0qCJAghQmmWvhoo4YdpxAXiZAkVpQrDO
	8fUh5QrPiATk7NmfJhXDYg1Q+KYHRb2ithOYBtOf/urIiy9XW0MCTsFbaTlrq4i7Az38rZxUKZL
	pAXSQiIQsm04blyj5Qia1uswUBX+GOduKOQV7Hg+xors65PY17vEy7wdY+HLMyMcj9ZIFyUHvHC
	2k7ecKBmFiMSu0b7hJfq16745w4mqyco7LxhQn9ExjSnIETsrcFhZ+B3J7rUy69ev4sFj58qjIR
	GqIbCTpA96+hy78+lD+CUBWG
X-Google-Smtp-Source: AGHT+IFwLxcY3iaz4mwc9u9FCNowPMGrn/h+gguguoNvJDiVXULMJzkMlIB3EntvP+ZDNM4T1yUb/w==
X-Received: by 2002:ac2:4e08:0:b0:540:1f75:1b05 with SMTP id 2adb3069b0e04-5409054f193mr1320392e87.19.1734137628616;
        Fri, 13 Dec 2024 16:53:48 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c002c5sm63714e87.134.2024.12.13.16.53.46
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 16:53:47 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ffa8df8850so22935731fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 16:53:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXk/6G9lE3WmB4SHCL3DM59gElUHd31mP8n2+24baCiaSBGdVMeC5F1/fjRaAKFf96ZXFsmUSGi2MCzmAjy7A/o@lists.infradead.org
X-Received: by 2002:a05:6512:3088:b0:540:2111:db71 with SMTP id
 2adb3069b0e04-540905a6fd4mr1322255e87.42.1734137626438; Fri, 13 Dec 2024
 16:53:46 -0800 (PST)
MIME-Version: 1.0
References: <20241209174430.2904353-1-dianders@chromium.org>
 <20241209094310.6.I722621804be859e4ae4b7479ce191c5e3367b37c@changeid> <tx7vtur7yea6ruefrkpkccqptahgmxnsrudwdz5uzcfxnng25b@afrr5bmdk2xa>
In-Reply-To: <tx7vtur7yea6ruefrkpkccqptahgmxnsrudwdz5uzcfxnng25b@afrr5bmdk2xa>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Dec 2024 16:53:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XxL=HjA8pgpQjY8AQAkJns3H0BMV8nO9jKUxiuu2vKqA@mail.gmail.com>
X-Gm-Features: AbW1kvYcJpO0sSHq-EaRR9tcdt8oe3PTBnA6qFnauBDoIBqVcERtioVBqqLZdLw
Message-ID: <CAD=FV=XxL=HjA8pgpQjY8AQAkJns3H0BMV8nO9jKUxiuu2vKqA@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: errata: Add QCOM_KRYO_6XX_GOLD/PRIME to the spectre_bhb_k32_list
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Julius Werner <jwerner@chromium.org>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, Roxana Bradescu <roxabee@google.com>, 
	bjorn.andersson@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_165352_707989_3652A5CC 
X-CRM114-Status: GOOD (  16.79  )
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

On Mon, Dec 9, 2024 at 3:09=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, Dec 09, 2024 at 09:43:16AM -0800, Douglas Anderson wrote:
> > Qualcomm Kryo 600-series Gold cores appear to have a derivative of an
> > ARM Cortex A78 / ARM Cortex X1 in them. Since these need Spectre
> > mitigation then the Kyro 600-series Gold/Prime cores also should need
> > Spectre mitigation.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > Yes. I know. This patch DOESN'T COMPILE because
> > MIDR_QCOM_KRYO_6XX_GOLD and MIDR_QCOM_KRYO_6XX_PRIME are not
> > defined. Those value needs to come from Qualcomm or from testing on
> > hardware, which I don't have. Qualcomm needs to chime in to confirm
> > that this Spectre mitigation is correct anyway, though. I'm including
> > this patch so it's obvious that I think these cores also need the
> > mitigation.
>
> SM8350 (Kryo 680) identifies itself as 0x41/0xd44 (Prime), 0x41/0xd41
> (Gold) and 0x41/0xd05 (Silver)

Wow, all standard ARM cores. OK, I guess we can drop this patch too then. N=
ice!


-Doug

