Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3EAD33994
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 15:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuCV83JNF5xt/o7+RdWbgGzw1E9aI+J1rqqbiHJI0pk=; b=WXHqWr8w4NmF754dJBfQMcFj6i
	gKnaLHI98kiwvZpnR2fhXPPHiZUTT81UpYO+QoFQ5azxdAHM6l8B5AAtaQ0hDHMSjabOJTDFCLW8+
	VLtH6sJIfIOw3gWL2m4azLrdcq61P7qhGc8k63wj5EjJbXn7OwMDzG2kDgE4PXsrNhrQ2DTKmu8mj
	Q8mCOpDmLZRWIjEXrp5XI9RtmTUFAxCGditVvD41QxlGUXs7iTFac2JT0DbohnPOqEZD0www8Ys/2
	5tu5HL45ylb7coNXGhLw04kiqyA+9j0Uq5zgyRpVIGtfZVlFibA8iIqV4b2t4mZXlGwRP9cR/+4rh
	EOaUHZIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RJL-0000000BFBS-15nX;
	Mon, 28 Oct 2024 15:05:39 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QrS-0000000B93J-2DYf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 14:36:52 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-539e13375d3so4926575e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 07:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730126208; x=1730731008; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuCV83JNF5xt/o7+RdWbgGzw1E9aI+J1rqqbiHJI0pk=;
        b=m9rLBSQLOQe+pzXizMrFA2VXG35DVowqaIH4e/4rqteEI54/BnIQhXnNuLq97WNMBS
         MJYvHXWy8BdcGZZIwtoRJHynyXf8xqcmU5+MgfiXUDA4ZvI6BvI1IrJek/mmaXm0yG+B
         85exv2z0l7IQmW4Oafizt6rDDEnNLctRD3QGYPqtef2hZEUgB3ilf7Q/8uuFauyQnBvD
         A6jYymSB8nfXJM0r2G+08xQjzliPrAYNi6o0cNjWFQTEJhfbkjnGsUCy4DyNLbXEt4Md
         h84PYgvRMHeki0fOYcjTblX74u8P7bi//aomlqpOTzUG48iYT1kxSvYdTjlow5wlnaIr
         KMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730126208; x=1730731008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AuCV83JNF5xt/o7+RdWbgGzw1E9aI+J1rqqbiHJI0pk=;
        b=O1fi50do4LnBqhj0at34zG+ydPFpmV+lMblewi3E0WPxJYHHSbXe+e4YGglpdc8N6N
         TKQSyonbQAKmHpaj8iLkkl5RBN8+usXvx4PqPbGjkRutEMvBdhAW/oYXOUc0WLm9mWgA
         zX3p4FLyEFc7m/51YT1QmMTsm9R4/ESO/EOCnwGMXNedzSRTVYO6HiaxpsPA0bHuIqkV
         xo0zX+qZNgororUq8GQ1D53dZ+SjIXI53cKX8ZkGtxsmYmi7J6GOtq0fccz7woJOha8V
         SRXcPhfGgFaUetqeIiUvh8iidKPnbg/VyQVupOzURuudAHJPCIZ2xtqTOXsxlkIq4hRE
         LrmA==
X-Forwarded-Encrypted: i=1; AJvYcCX38MP0FUq3BT3mDrAIIfvq6qeYdG/GgSUpdANs1rhOQ01RjgtQ7sSc93r9rpiC9KmDbY4yiHhxc9MIlAff9po+@lists.infradead.org
X-Gm-Message-State: AOJu0YzFQU+HUyzXtG90K9GZcAEjG4qDjx7Z0ksyWtc5izIggsyrsTzo
	BnUPPX4shWUB57atbE+sdMDVWpc3q7EaUMnD+EPufspG+dCzSwdL62dqPYW6Zf7UbDosCE55/Kc
	vjEBW8R+BtlCtmjkuYduzQCBPuvlZB/3b66NC9g==
X-Google-Smtp-Source: AGHT+IFMXRyPb+X0jTeOQPVKekZJqG3FwwMxDwb4pHs5ttD6aPRHRy5s8zoMSwymv42X/0WESdQov/Yws8ZdNY7ZJJI=
X-Received: by 2002:a05:6512:3c8f:b0:539:8fcd:524 with SMTP id
 2adb3069b0e04-53b348e576amr3463522e87.30.1730126208152; Mon, 28 Oct 2024
 07:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <20241025-kselftest-gpio-set-get-config-v2-0-040d748840bb@collabora.com>
 <20241025-kselftest-gpio-set-get-config-v2-4-040d748840bb@collabora.com>
In-Reply-To: <20241025-kselftest-gpio-set-get-config-v2-4-040d748840bb@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Oct 2024 15:36:37 +0100
Message-ID: <CACRpkdbBAa5piO8BJoxx04spOc22CBJ-zbi82BT9sG54c=csNw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 4/5] selftest: gpio: Add wait flag to gpio-mockup-cdev
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bamvor Jian Zhang <bamv2005@gmail.com>, Shuah Khan <shuah@kernel.org>, kernel@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_073650_606319_0AAA14EA 
X-CRM114-Status: GOOD (  12.06  )
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

On Fri, Oct 25, 2024 at 9:46=E2=80=AFPM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:


> Add a -w flag to the gpio-mockup-cdev utility that causes the program to
> wait until a signal is received before exiting, even when its behavior
> is to retrieve the GPIO value of the line. This allows using this
> utility to keep a GPIO line configured even when in input mode, which
> will be relied on in other tests.
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Bartosz has to look at this patch!

But overall the idea looks sound to me.

Yours,
Linus Walleij

