Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C116E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 11:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OeCcjkbPl6Xl/41j85MrwKw61kLFoQEu17cYntkW6cA=; b=3R1ft3uJcgzQc6RkwrMViuzdXt
	tVYk6jao2gACBH08GemLHmfgn9bvmnsrLPHTApfNHt5y5zjrDPKgiX1nqdAH2EQLxxoYWcz9IqWkM
	bpZgtYRxIg2vZlbTHHB/BNWpC8DL4r/QLAQvPvckPes/RrKP1AiO3I5PXibdJGqazdcXCiBPOijn/
	Nw37PCliiHlWN+MwAXGR/X8z/E1cfg6odl5BjtPvbq0jClT4520S3gUT1wePqWjA9nAzMlgG9Z70R
	nw3PoTBPkfamhYmu72oyTZwGgJcKU0nTjm8Y/gKNNcIPModC59MSWxF4bfXDwM88oqnXQchWCAS5t
	6b+phytA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMQVq-00000006GbQ-2gZK;
	Sat, 14 Dec 2024 11:40:46 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMQUl-00000006GVc-2g03
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 11:39:40 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-54021daa6cbso2965327e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 03:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734176377; x=1734781177; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OeCcjkbPl6Xl/41j85MrwKw61kLFoQEu17cYntkW6cA=;
        b=WImbFwALUCi4OOo8/tec64tIjBZXjQRMoMN0+H+INdsneYgUq822aC96cO1ihyd5wj
         wSDMeg8h8MO0p1atDG9OYV1fa96otwfop1wnjj79HMQVHekTFrqIjiGppLAIVXf9BDV7
         oSGaOvwAeJ0b9AjB8aim4HwnNHHX8pY3iIKAnUh7deES1Q/PP8VAU787KkjKs0epem/s
         tDfX9TBxbc9jbdvVACrt5SiEoHyWyz9lboi40mxEjO/z80/WkY4bst1lUWJaKfadcBal
         3dy+SGdmcW0koih5caCRzRULRupaZpUOYaeU6oKNp2LPR8yQd6SLOhJLm/8VV9zBlu01
         Ngcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734176377; x=1734781177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OeCcjkbPl6Xl/41j85MrwKw61kLFoQEu17cYntkW6cA=;
        b=kbB8vyjzPqX+T4L/dt4BfeKr/aob91Q8N6L5r0/Q4fayuLlKg9O+YSqj3ZgCgqezc4
         cpVJ9q6tYn5Y2Ot49FlNIgKkNZtmQ98VnozlG/7/BeN4HpLc/Cyb38QgRY5gu11jjnrd
         2UGwaWimNh9ReVUwM3TDNEC6V2HjQMvJ7VZxItyhbTIn2sqIATi+SVmLStZWmZuo+1WA
         JoPThE7vLMfHYvNY+L58RrxxUbG8QWLXQKmMz2AYUdAY3Pklj1Xr7sQn4cEJ4YRXZac1
         8NOzC4kOJygL77jyo8/avk+7/j19t/rav+Jq9is/m92YxQ+O+19GQuai8l/SpvAfI+yO
         3kIw==
X-Forwarded-Encrypted: i=1; AJvYcCXbzPiNlJ3GrtYoGHB8LBWwDZhVVZrUoB3VzyEihuagYLuzWzIV5fISRQNjplsn34xEIjDikxKcCwW6ybXJYdGE@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4y0nzMbtAXcIu1G1bkb6mR/CzeZ3fhGeGxux2ZL8ZHhqq1kSl
	dvDeHsNlzaJvzkxjlaebwXUHCX144Ph9d8FaMW8O9Kx+tF23TiODZeZEnL4qWI0=
X-Gm-Gg: ASbGncug/pC0Zs29MY9AMghWOM8UgfwvsnYZln8M1/sKFoOYOA5uBTe4a1UvTLubrbE
	Nz1t0L0Wj+23ITnjIiHpCHuS+07DHRJK0mI+zybggHNtwCaguDfsOFrWGYNJTuOiDZDKEJhY3jt
	m+fYOrUI1lk9rqFy/RBGzmfzjEYkpeqma7upXSrYmFUOkdI3g57TFsyEDm1NoGQdxgWHVDTa5Lt
	3cfMKRNCmt1s9zqRJOMhqGCej1+MjSKXD5K9jDtGweBBYNbFYEC5vT0GEBRfmoZKihCspXtN5fx
	pqgwrP97QlsQ4a0H/MILQ0cLucJ+GnFmuOvO
X-Google-Smtp-Source: AGHT+IGqTQ1pNqm/Ngay9AHMNf4hrhRAE2mYmS+Ahol55tRGPvjWEaqYkQ3xCrtSle4klGeWah9+hg==
X-Received: by 2002:a05:6512:401b:b0:540:1f7d:8bc0 with SMTP id 2adb3069b0e04-54099b6d6afmr1869994e87.49.1734176377364;
        Sat, 14 Dec 2024 03:39:37 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c20acdsm192457e87.261.2024.12.14.03.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 03:39:36 -0800 (PST)
Date: Sat, 14 Dec 2024 13:39:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Julius Werner <jwerner@chromium.org>
Cc: Doug Anderson <dianders@chromium.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Roxana Bradescu <roxabee@google.com>, bjorn.andersson@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: errata: Add QCOM_KRYO_5XX_GOLD to the
 spectre_bhb_k24_list
Message-ID: <2qx75syaojhnsqt256li6sinafml4gohohvld6uw3zhejrayuj@biiep5dvko7t>
References: <20241209174430.2904353-1-dianders@chromium.org>
 <20241209094310.5.I41e227ed809ea607114027209b57d02dc0e98384@changeid>
 <l5rqbbxn6hktlcxooolkvi5n3arkht6zzhrvdjf6kis322nsup@5hsrak4cgteq>
 <CAD=FV=WQf+ig21u316WvQh0DoKsdKAmZgqPn5LB-myDXsJtXig@mail.gmail.com>
 <CAODwPW919K+XdxjUe3aPgxsv0CEWwx0P_Hxvf=VniLhk8eagkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAODwPW919K+XdxjUe3aPgxsv0CEWwx0P_Hxvf=VniLhk8eagkQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_033939_727482_FD041F06 
X-CRM114-Status: GOOD (  10.77  )
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

On Fri, Dec 13, 2024 at 05:28:55PM -0800, Julius Werner wrote:
> > Interesting. So the Gold/Prime are actually IDing themselves as
> > straight Cortex A77. The Silver is IDing itself the same as
> > KRYO_4XX_SILVER. ...so in that sense there's nothing to do here for
> > those cores.
> 
> Should we add some comments to cputype.h to record which other
> products are matched under the same ID?

I'd say, yes.

-- 
With best wishes
Dmitry

