Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C508C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 23:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJobFLI9bUS7cIOXH6lW9QHErDLL0/CVqlV/7NhJ0Ck=; b=zdwdLUEF6K5LblNCFJ72qanJ9n
	ouM2zjlWEa9VQ3U5TVGlYqoT+94QpUw0HaiJQsIduDmq271RbQsnuGt1yC8BaV6FuRku9x3dPdCqR
	j1AWqatIfcqaFa4SdLI9I1iPnofLedldITpwhEiOijCGLtGQiCP1XIeTR2gZXlVT5NC+QfH808RCg
	CNkl8OM5J6CY40CRV54X/3A9KLVkzNt2Fc8u3CkqvujIr0duu2hGtM+LofbXWEtP/u9wivUpLJGMF
	nrxX7lcPjy++sUDb005kwkLrI2bDtmuayE+XaVg3IZtUgt6TjP0iZmcnQ2+EDx8c7d2+UesksSPqi
	mQ9sRIsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9YLr-00000007qhk-0yhj;
	Mon, 28 Apr 2025 23:57:31 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9YJu-00000007qVt-0FKB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 23:55:31 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7c922169051so292018285a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 16:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745884528; x=1746489328; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJobFLI9bUS7cIOXH6lW9QHErDLL0/CVqlV/7NhJ0Ck=;
        b=C3KNuspXlZ5oJ+6Xxn4mSr3SFjinH5CY7utJYcYLZB8eY4Ad5n/9EHXILGMyDhkZIN
         AAjzAAAYl49nxZs/nnwv8poYOW1pE60ciWdTcQFjjra5IXFwUJMJg1yTMXGjH8DVyz1G
         0+WR9WuXpPC1c4JNqVot+aPA4ojVKsoPWEntc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745884528; x=1746489328;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJobFLI9bUS7cIOXH6lW9QHErDLL0/CVqlV/7NhJ0Ck=;
        b=B2riyppwrjRl0dkLdMq4Ngefsdlt1CKJanFySBTEG/ypp7fxB3PW38hde1yV114Bkm
         q01X8vxcdhLQue7/My/iRI3UKPQqJJgNxfLReZUle6w5if2B7LwP4ZpC/FGxCOAiJ9W/
         MCIfVpH4IRlHTKrbqD4EyaSgHHiPLH02rlm20XOQ66AUKV3+9CIQUm1y8y1eASb1Jo5J
         u629ohnwiJPZZXWUeHmE1UyEYp4J5t9RW49i3SaDawq4WSvy7ECR60MMS4/sxNGrKWt1
         z0AmX4pQ4mS4tao+xuyOW79Nn0yh1PHLY7hDUxuWifHed76NzX4VyNdOggu6HJ33JD1f
         U/gw==
X-Forwarded-Encrypted: i=1; AJvYcCWEc9c8reTw9k9p+r1/PmN0w94x7tc5wSjXO6q32MiW9B6soYUil7qTlF+ggBrU4OdwoJzzLq2j/EgjtMgr1CGj@lists.infradead.org
X-Gm-Message-State: AOJu0YzW3cliYRouQPtWjFmstGM8+niRaeP2STMQZ/4Igk6WIq6BWFvF
	jfLORFJ8oFwFPgF57DPVcqY0n12GBo3OuZ/TjAx8j80T9Iz96/GiFvLN6L1aLFpq8fV4ZD6CgYP
	Gw6pB35ZvgmFNH/RxeoeGURt4Zmkc4VTB93fB
X-Gm-Gg: ASbGncsodglE/he3SNpxFHVLTBY7yZzyzt/OPcxpwhR56xMCFjJkbkHAAGkl35nmF2G
	AWE8jPC6S37oKy69gJialWfe33iqxlk5Xb6gcs5zTutxeEuP3DzNMViPxTQBN25vvbELkgvl6Ax
	U5ySGRfpB8DE9VKxiyCB2N7JAxYEs0kdlLn0To42ghJjj9RJ3uaRlIjw63YlNg
X-Google-Smtp-Source: AGHT+IEoQ9Mtpgq6IV7o2myPZsE3iTvANfEmqsxJiZUsKgJmcwAzipipK3XToxVL1xycDMjbiz/L+FlGLzhvF5FKt7E=
X-Received: by 2002:a05:620a:2610:b0:7c5:5e5b:2fdb with SMTP id
 af79cd13be357-7cabddaf1cfmr245880985a.41.1745884528355; Mon, 28 Apr 2025
 16:55:28 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Apr 2025 16:55:27 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Apr 2025 16:55:27 -0700
MIME-Version: 1.0
In-Reply-To: <6eeb7bca-6018-46de-a7db-7189d60c0942@oss.qualcomm.com>
References: <20250416000208.3568635-1-swboyd@chromium.org> <20250416000208.3568635-2-swboyd@chromium.org>
 <6eeb7bca-6018-46de-a7db-7189d60c0942@oss.qualcomm.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev8+g17a99a841c4b
Date: Mon, 28 Apr 2025 16:55:27 -0700
X-Gm-Features: ATxdqUHpAwR2wd_47EUgCGBgUk1wdQDezy5iMkujDq5bA3ST_h6HrhmS7YUoEN4
Message-ID: <CAE-0n53ypGBXAt3frrbfAsbJZEkxK4BCB0+3MWOFRxZ9E+6P9Q@mail.gmail.com>
Subject: Re: [PATCH 1/7] platform/chrome: cros_ec_typec: No pending status
 means attention
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev, 
	Pin-yen Lin <treapking@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>, 
	Jameson Thies <jthies@google.com>, Andrei Kuchynski <akuchynski@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_165530_120847_8969FBAC 
X-CRM114-Status: GOOD (  10.72  )
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

Quoting Dmitry Baryshkov (2025-04-22 06:38:17)
> On 16/04/2025 03:02, Stephen Boyd wrote:
> > If we aren't expecting a status update when
> > cros_typec_displayport_status_update() is called then we're handling an
> > attention message, like HPD high/low or IRQ. Call
> > typec_altmode_attention() in this case so that HPD signaling works in
> > the DP altmode driver.
>
> Fixes?

I didn't put a fixes because it only matters to make the displayport
altmode driver work with the typec port which isn't used so far on DT
platforms. I view it as a new feature, not a fix for an existing
feature, because we don't use the altmode driver.

It also seems like it was intentional on ACPI systems to only handle
mode entry/exit and not HPD signaling per my reading of the mailing
list.

