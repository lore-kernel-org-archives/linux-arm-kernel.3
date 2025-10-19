Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E2ACCD195
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 07:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a6iMxdmrYbuGMj6PYzMkKXgm2YkNHUTOljsMub0V7/Q=; b=BHyzkGjx50kD+V
	nm0jk07xwWev/GAngis3n9u+i/rphF4WWDgUHSDzCmdQMwSRDfDlqnHmUG8M4sLlFfQ+ACnf/Cwec
	yd4la1/qyT7SfX+OmVYTm0MEtRglVNmciBx31BXjxSCI6aLXaz/6D5VWkEwitc3WDv0xpx4nnRg1F
	XW+6uS/yXASphk89W99Kt+BJh3VqajrTcEzAGrbkezKMFicpjU0xZxX2RX++UEefnLYCPb9wzmLkr
	+MvPVzdeukU3YE8UFgcqymTpDZOEgrNRoKJTG2i9eTkw3CNFQTMp5Ofn84wlhNNNs1bLJi4UC+FRv
	V5iS13dxhFQB8K5CouHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAO4A-0000000AmxR-49CL;
	Sun, 19 Oct 2025 07:42:58 +0000
Received: from mail-lf1-f49.google.com ([209.85.167.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAO49-0000000Amx9-17YX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 07:42:58 +0000
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59070c9111eso3700741e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 00:42:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760859775; x=1761464575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a6iMxdmrYbuGMj6PYzMkKXgm2YkNHUTOljsMub0V7/Q=;
        b=XqzbQYsX3xa9wr5gUJuUkPeGrj8WGr6Z6qomElnfNYrranpgB9/onSd0lBoApfhoSF
         IEn20ZG7B157cZ6kpv4M5fep3swD31zY/uG3D4DRpaSwpu4wexyLF1+X0AWZF3WQ0ikI
         EXu6OzDE2rjmEWp96826YJJUWWhwCFVFgmy/YF7T9Z0gt8TKNcABxPwmmu6SCPO5EEst
         u+nw47AZ7eidFvtIdNIg+XRWOGJmr65k/shL9e3Ml7FOfJOLySEfvHsvPdKKRLrhQu78
         7brPHt7htGbzmSrLrzdd8q+PiR9GKc/wAMmPfHBZjo8MD2pClI6ALpNy4JAyqdC7tM7d
         vsew==
X-Forwarded-Encrypted: i=1; AJvYcCVw9PxcO21pfpjr2G9dhmN0esHEuO5J9uBWJs4sUGceq6SkwnAtrYUnJaARYsx4gWPIxgmfogndAXdI4a6p3B17@lists.infradead.org
X-Gm-Message-State: AOJu0YzRp5814Bq0k1SBRSC5a1b7cWM8IcO4rU74PAtvc/Vyoge/chTo
	39L8AafmHmu5jOKG+XjABC+NmeYw76WTALqDE7p+FA2EX1aYy7ksp/3UF8M/ZXH3
X-Gm-Gg: ASbGncuxd+ont3MEmXqJO8KAz/tOBL5CzJbiVhFnftBcZ0Rlgz5wkVj7l+6dnYtn04z
	LWfeOsUpl7/a8Dpvmfn+Rcd30kOwT2WlcSqIBmbf9W5OmZv4891gKeUO/GmIuulPq9GzxWmlQOY
	IT4Y2tmvauGu0uDAwtCbKp6d2M4CtSGvFlseqKrTEPrF3amYU5Qq2snXfbZBK8FgjM42ukEI3Z5
	8dwVDuHOkw9aJBU905bSkSRoxL/yTPlHS1MK8DzRkrRTR4UOqAQlY07/eSlFqLzXXMePCmXf3me
	tyylX47SiQcvnljUiVuBnmnoCy//xWdggLCScvlDJHV+z1htH3Ur49k+ORSJVkuDK1OlnuM8FJk
	J2iGnsH3JqMO0QGBBph+jSfrR+UYbb3C0xB0MPfXNzcWrSm2trtR+694Pj4j2dhXIsxjeOuB89p
	cTIbLJRjTno+F9kmt4fMEoicCu/ugMmGKk
X-Google-Smtp-Source: AGHT+IETWGrERx7A3hjhEdXSixcxUhGu8uPZfw19UUYG4NtpxaW9R6JUz9EDWqopRIxsm3SyKUi2tw==
X-Received: by 2002:a05:6512:234e:b0:58a:ffcc:37a6 with SMTP id 2adb3069b0e04-591d84cf72amr2861035e87.5.1760859774504;
        Sun, 19 Oct 2025 00:42:54 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def1b2e9sm1351780e87.86.2025.10.19.00.42.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 00:42:54 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-36a6a39752bso32315601fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 00:42:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWHfCkfrABn9G5ayeXITbH1lzIsUl9ao0Gk3mjOgw9Dd9Mi8T4yjMc4d9xoYHuGaciUHRx1oy6Am9Q2EjSVRnm7@lists.infradead.org
X-Received: by 2002:a05:651c:1510:b0:336:ae5b:8a12 with SMTP id
 38308e7fff4ca-37797830eb3mr28747941fa.3.1760859774128; Sun, 19 Oct 2025
 00:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-3-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-3-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 19 Oct 2025 15:42:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v644YqdwspTda7cy6y6iYQHRrt3e5hD_m_pEfC-x-py1mQ@mail.gmail.com>
X-Gm-Features: AS18NWCc9PhOVShnjr54QcL_MXzi6J-9o-zc3G5gD4DZJXqV9MLEpSrxeXlLZX4
Message-ID: <CAGb2v644YqdwspTda7cy6y6iYQHRrt3e5hD_m_pEfC-x-py1mQ@mail.gmail.com>
Subject: Re: [PATCH 02/30] drm/sun4i: mixer: Remove ccsc cfg for >= DE3
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_004257_314615_583C1CF2 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Those engine versions don't need ccsc argument, since CSC units are
> located on different position and for each layer.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

