Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E125DCE8E94
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbcx/f+avMo0nfnfoFrvHy0s7zMVYb5RcXeOKVfhBB0=; b=Su9WTC068CpaMt4AdI1yIhaAYc
	7DgYlTT9Ou9sAj4TvAHbQM/w5CPsM6Mr8vT+442Vf1LNg4r5UvIz4opvAv1omz7tIqxF/ViVtOuEM
	rsbFVW/YAsTQknv7AJWoIUuG1IzmYz26mTUI4to8KN7uCcfjublre4N6aT4YNFY1Qw0UP50P13tOC
	2jbe6K9Gyl7kOwa4aVZeOnTwoQezYwzplfdxhrOHD70Q69TNsloyh6qTcwCNTSHVp1IMkg7qB9/0U
	yKQ3t7ke0aqjpqB6UeF39N+HotvxeqO+ZNUr3zm2Id+y6LYvW0OAPgzUP4qpvU95aKRB8aCCnaOiu
	B0d4ew8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4139-00000001AU3-09om;
	Thu, 24 Oct 2024 16:51:03 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t40y8-000000018vc-33KA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 16:45:55 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-71e953f4e7cso848727b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 09:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729788351; x=1730393151; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbcx/f+avMo0nfnfoFrvHy0s7zMVYb5RcXeOKVfhBB0=;
        b=kAmEBD32H4nk51HvIdrW0PaqB+CI41/mad8dzHciF50dDrihiFZFYDktN+yJkG7Z+C
         F/WYa0xp2SPvdX+42dn0rplsfV02+WiXakbS5gbdJ+dW2rgV0WKoVkGNr8u4knNmh5Dg
         oZpEOkli4U8xJXzCch8quoepD/n8x6Q2Xc2Zt37mcEUYZV1ZawxEhYcs7hWcFHFzKnYd
         Hmcd6hSFaAYNCAngNQaTzYfeORgV8XyBDz7jbn8dyVtVHsm85LvIF3owIgE8Mza5vNGy
         YyHBcOyN9HmXWmkyoP6RvVfRZYdk2/PPFPXX5Phx1kKC3C8upooILvNg3dCx6tCEIjhG
         Nqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729788351; x=1730393151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbcx/f+avMo0nfnfoFrvHy0s7zMVYb5RcXeOKVfhBB0=;
        b=VFzl93n9EorJR9Z89pNZDqw5BmepjOBSE7KiinT4D+nmIzmQmSkzbw3k235BD13AXo
         yJ/164KzU3CpRUQXu+VEM5ebmXAUrbeZxlXAHVPUFdn36sdx4BiLbfqXNZaZiTJZw5Qo
         6C5scaz8yXR8R76p9l7Bk1rPnyCtfAjiG+LXBbDnrkqKPt00wcNWRN6QtoGpEpLmVN4E
         XWJzQwFA5tstMZrtnN5LiZKVDzl/KitDcQkfk4Y9NyGKUKWrpqfzSXTqGSqQWpUGc1jC
         XLhOPUlFGXfVsUWFQlcBFos5w6YPiw68qxr9zjUpYT+3Qzw+/eJ4Dl5l9SbULft8tuym
         b7gA==
X-Forwarded-Encrypted: i=1; AJvYcCUDK6u4kJhZUWWUug2jlZ+nxEEK+f2naBcrakQoCy2sTgUJnRf9n0ooiGkead0zjVm8CFk31wnE8NlE8E1qtg2u@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/oG8oAwJKcXpiCWQjZ+TxetJv18PtudlfPXKC6sO3JOZFq2hZ
	LspY1ppRdF6uP4D3ISAlafQ0mdo9Im68TufiozMlE5D6At8fMUqCq03o41E6Pj8hC5qHn4w08fr
	An0ZxJgC0FUAVK4BJMIoVwAKUKKgdxDASvNtn
X-Google-Smtp-Source: AGHT+IGyVGhrIax31DbYyaNPPps689qKUUGZ/dBmIonlf0Ms5Q31B+FIXf7PnrvX0k/Y2NDzzkEVUzrdywoXgv6bmrc=
X-Received: by 2002:a05:6a21:9d91:b0:1d7:1277:8d0f with SMTP id
 adf61e73a8af0-1d978bd6450mr8093124637.48.1729788350739; Thu, 24 Oct 2024
 09:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <20241024061347.1771063-1-saravanak@google.com> <2024102457-manager-counting-ff68@gregkh>
In-Reply-To: <2024102457-manager-counting-ff68@gregkh>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 24 Oct 2024 09:45:10 -0700
Message-ID: <CAGETcx_BD_G3oOHvT7aRr98Ag7-XvrMX=NW_wm9Cx9M5+qr-aw@mail.gmail.com>
Subject: Re: [PATCH 0/3] A few minor fw_devlink fixes
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_094552_780445_3E4830D3 
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

On Thu, Oct 24, 2024 at 12:08=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Oct 23, 2024 at 11:13:41PM -0700, Saravana Kannan wrote:
> > Probably easiest for Greg to pull in these changes?
> >
> > PSA: Do not pull any of these patches into stable kernels. fw_devlink
> > had a lot of changes that landed in the last year. It's hard to ensure
> > cherry-picks have picked up all the dependencies correctly. If any of
> > these really need to get cherry-picked into stable kernels, cc me and
> > wait for my explicit Ack.
>
> You can do that with the correct tag in the commit as per the stable
> documentation if you really want to :)
>
> But why would these not be able to go backwards?  What changed to
> require them now and not be ok for older kernels?

Depending on how far back we go in terms of kernel version, it'd be a
bunch of cycle detection logic, deferred probe behavior change, etc.
And those patches might have other dependencies themselves, etc.

He's one example of such a breakage:
https://lore.kernel.org/all/20241024-fixup-5-15-v1-1-74d360bd3002@mediatek.=
com/

-Saravana

