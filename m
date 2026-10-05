Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 515E9CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 13:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ck/YSmwX+BAU8aauMUDi1gthqNGVLuO2QlzjEMLfeNg=; b=OHRHitM+4gGviB2HcZcE1D7xqy
	fXri64BCGLwt4q9xDdAJ/wGEh+I5usIt3mj3ugJ9Vmuse1O5Tv87DxJ+A7C2lgbHnHFyPM8qfFxA5
	lzh3eD8JfEi0iaITIYGazczQY1yA5X/+HQtg+Xlbmrf6be+W/8C9XgsYfiqcTCibbx6650mtQ0ij3
	vVbf+gA6gtu9qA+uOaD1+0H8pFmFwEZS+e4LXACrUk6z7KdrZprmMCD3cfviJcsyk+U9aAEgt9eQk
	UUGmNXUOfBLDY6+tWvJCJI/hEvYaZOoZQ1atxVATaJdIkt9DiWlx8C9DgPiRWIOogm6OF8oWysFU/
	mVGNg51A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDiSF-0000000GSxp-0IdZ;
	Mon, 05 Oct 2026 13:10:07 +0000
Received: from mail-wr2-f34.google.com ([74.125.225.98])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDiS3-0000000GSkB-3l0i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 13:10:05 +0000
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b00a0ac65so871407f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 06:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791205793; x=1791810593; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ck/YSmwX+BAU8aauMUDi1gthqNGVLuO2QlzjEMLfeNg=;
        b=fldadw0XNDzdLA6BgqE/Lj4dPlhWThInwS2K5e86/MS7m2fU6DAyL31f0x7vqOTcZ0
         YZwMfD83qtAXuB8o3qde75FyOqcDmOH8FG+PLkK0oD3/JB77FrtJ3ThlYQnlPvgs5dNR
         t0R6u0UYDAYav0dUPs84gFmvNsbPGlCbuIDJvNfx+BriU4//RLChbObz2yqQxyRpWZXi
         2UUNnwoXCj6kHYvcfEMwTvXEfS0haHDw0O8LpicYhyupm5hpw4kGFiLdPWantRt6EQpS
         +Qfu5gHs+BpxrRkCCFXygXN0zyxcJlBlNBKbXhVgsJFLpPjSIxmjVR8b0qK2NYLdVzDM
         dCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791205793; x=1791810593;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ck/YSmwX+BAU8aauMUDi1gthqNGVLuO2QlzjEMLfeNg=;
        b=2NmtRuv0IZTN1kY3sZmyaFIZ88LAHQXu5Jfj1SP+YeFevU1O+i1czXR3VVx31EQtZy
         1ea173UD7uYJMtTxVLn7qJ3M8uOQHjsbxWiDWHPv/8BE2kH+mlSrDoNWX2L9hrB3eqrZ
         DhKx7T4xR6oh8+TDVOcAhv6Gvnh/TWbRupFevoY6wHGunh6iWD1ylFnE1NSQKFn36B1S
         3Dd7kBYeFYNfXuUEGEffSS67J5/4+RZ/0TqFL1WPN8oas7LdMO7nyU0VXqZ21obMd3G1
         OkTIoZ5KD2BQUab8Uo0EyMcg9UNw9xZaQcucdqp136jQqpILxTTh0h4m8yxfyDMgDdWZ
         ndyA==
X-Forwarded-Encrypted: i=1; AKwUvBzjNGkQBuYLDNmH4edC15lWqK7jTGswFoNAjDhgOrdmgUToIiAohHWAz3kKXM42AvyKjcywt8SIcFMlSvABDwFt@lists.infradead.org
X-Gm-Message-State: AFq9FYKXv2J681udI8TjptPW1KAgSI2f0QCjigmvI3k8QPVVfFEP4xiN
	qwGss2La9hxvg8QNJBKAs3ETHSp7hv9AIRJVnSiYurbbsL9z/Dc66qh0
X-Gm-Gg: AYBFou100hbV7ZN8w+my+fOJ2LBpMY+w/M+8ahDhPqVgkzPhTisGZpSuy9C8hZiraiu
	4eMcYPDQ9NXSOPXDYcvWxT3BB34F3A67stJ6Wyux6TtOIyhegeP+9usQiBuK3AQTXnC00usVI1n
	6t3ZxSQGF2H7FT/aH6WBB183krG6v9QxRKgR1Xw/p8EWtfAfktySAyx+X+paihxs/zo37gWdVJB
	NItuSgPm8xHQb33aSvcisrWSKUHcOOdbGRHK2WtLyTrc/Uk2/7O736dbdOkuROQInz50a78D0GC
	0TAgtO8mzhMKPZJEp1tQ1bRHPc3lMlkeGTOPdSOQ0e9awfJQEcsiEoOGfANOVki96rYPDLs+dCu
	XBJ2/A+pV8crByYNPH3pBp3OisXlXPT5JQVrHNXmHFD+DaqR5Y+rXJjrhdxTosX7Zn0kaSqdEWN
	wqU7VFnKP8I+vMdvJdDGfoRJg2K352k9TmiikQkS/BB5f6VHnJ0whxNUpKmVKOnHroeRowcHBdO
	RUio0NKEuu2b5BcHtiVXZjyV3MMkU68o7RJiNZynEzqxXyrbdt775QxE/klr2S48FmurOG3tc8Z
	D26wPNUn4iQrCY4zhNlc9vP/g85cf9jt4kp7gU/VPe4k+yhjiYtZL/hGlREQKgz94s1S7SeG78G
	YhLPC+55FsRK6kDdGDfTrylITvscnlk5Y1oUvksJo6iKl1V8fotHIijwNQ46TRI0pqq4C3B6iQe
	1q9P5zm3PGdmNCXr0=
X-Received: by 2002:a5d:64ca:0:b0:488:83f7:6352 with SMTP id ffacd0b85a97d-48b126f542emr19074352f8f.4.1791205793268;
        Mon, 05 Oct 2026 06:09:53 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6228d716sm3851685f8f.24.2026.10.05.06.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 06:09:53 -0700 (PDT)
Date: Mon, 5 Oct 2026 15:09:37 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Conall O'Griofa <conall.ogriofa@amd.com>, <linux-iio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <git@amd.com>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: Re: [PATCH v4 10/15] iio: adc: xilinx-xadc: Add clarifying comments
Message-ID: <20261005150937.000044b6@gmail.com>
In-Reply-To: <20261005094205.1045874-11-dileepkumar.nagavarapu@amd.com>
References: <20261005094205.1045874-1-dileepkumar.nagavarapu@amd.com>
	<20261005094205.1045874-11-dileepkumar.nagavarapu@amd.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_060955_951957_9EDF1365 
X-CRM114-Status: UNSURE (   8.39  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, 5 Oct 2026 15:12:00 +0530
Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com> wrote:

> Add missing comments on struct mutex and spinlock_t in struct xadc
> (per checkpatch.pl), and explain the non-obvious FIFO-drain loop and
> Zynq alarm-bit reordering logic.
> 
> No functional change intended.
> 
> Co-developed-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
> ---

LGTM.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts

