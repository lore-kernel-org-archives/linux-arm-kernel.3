Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B888AD2FED4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 18:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4CGyKcCnMa/ZHAIbj4nSTz1dbC/e5JXE8bFaVOZ6yE=; b=k9b3DpFMvFo0rf3R3VEfK2Wr79
	txXTl2Pe7S5QP+8jhy4b+mpy1ZUGAqZZyRQ/laWVzGkLXAjX7/086LSg8euLwM5Hngh/+bRBWxIe/
	OA6JQKQECiM5NPv4VYUMKm6VGOEzvdccaB5uDPqbhx6IyWiGhr/0YZyPrBKjr13gcWWUNDlvKNa+B
	aSkZLZMJNf4jKyXxfGznC0UjSA9aJ1kftWoH7+7c8h5pqvD1SojC67Jb1LXKgSFMqDcWypTfRr3mB
	dTLfpX8B7JGlYWHgu+R8zGVDb+sEw2lyP4jOud0aypY12+qlcVhSjTA38CWM8bdGmPUlaltzzx5w5
	HE8mbrNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknmi-0000000EoTk-0VbQ;
	Tue, 27 Jan 2026 18:27:28 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknmd-0000000EoTI-2egD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 18:27:26 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-59dd9aef51eso6858294e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 10:27:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769538441; cv=none;
        d=google.com; s=arc-20240605;
        b=X04dr3bwbGE7ilzSPRhXKVwzvB00cMParbfScl9t5TbblqN63sjAIX4L74pYinL7YO
         65qTF43dMJg3lo+G0LcByaj9XK+OvnVACvvxTXg0vv0aJhftsiMY6SqCb3pVkq7xDaGq
         gNJfGKXSxcQ2E+Nuz1vOkF42za1BdoUUBUC3HlgrpT7AecCG4ogQ5it38/OCTIP1aoyO
         0S17nS81DqDyaY0pkv2xdVUw/IgTbu8ks71d/c9X/ssDfEvkb5Af1AH1g5pzsGaWdtEu
         iGEfWiw7cr0XKh4mFmlmgSyU4j0WgorsjZom6RIxh3qkI9LjQOKzR7BIdoLXGk2t0Duu
         JCBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z4CGyKcCnMa/ZHAIbj4nSTz1dbC/e5JXE8bFaVOZ6yE=;
        fh=txd5lpN437wv0CnY12nc0pZV5FV0vQxEODXXxPiBFcM=;
        b=aeF43i2eBtG46XLYB0x+1kofgCQ1uePP6kd2PisobpFIKJo6EkswGQ3lv1KMwH8u0Y
         RStmMQ2yrYYm4zquF9j5XvtYDIGVAHOGxLEduNAm8lfECWbPWzrR9Y91SajQmqvpIAdv
         guYz2Cgg4Fv3VimZgtUdhgQwH79wXLvoRDGOFhjbHhlRmwGXvgldhmeTC0TvpYVPizvd
         qOq8G6hsnDf4LF4qt7vmH1QUU+uAimYLIZOpUVSFYAlLsYwzcjgjcBm5JBUoO0eKSX9+
         17y/xJGGqPk+vXPABj3xn6tafaB8KF93bxUgiGcH2Xbsiz55eZgCIJYxFSgVuaSWQw+X
         rZiw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769538441; x=1770143241; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4CGyKcCnMa/ZHAIbj4nSTz1dbC/e5JXE8bFaVOZ6yE=;
        b=eYxh1sVbeZEUpg8M0C2EXd6c9WX0+gY0nwxc4mxnBn1gqv2GSeFD+rDrkkB4G8jThR
         uj/GUzov2la2kn7tjCdbZ8PEhrUo2tsvqQAmDndlj1dxjCJQ9dLLHIBRwjmkUCkZBdkr
         CpWXdyF1levvE9vwIJ4q8rrTEKCiF/bo+vztwIJeZRlmPLpx9/u0JWkEozHO5mrEQsl9
         ejKgz94lFb8ETQaTm3HLboy3CwNlTl7m/GH6R//5FEweH3FrqaCfTUrgtvd9YkqAwL3H
         8a8KOalMwi0r+DmJdh344XXJjtLuzB9oOV3E9+0W79aPcYQAK0diGLyz0t2eSO4NhUPc
         fz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769538441; x=1770143241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z4CGyKcCnMa/ZHAIbj4nSTz1dbC/e5JXE8bFaVOZ6yE=;
        b=duacrPDUvoXH7EJY9J0bA8FI8UyHosN2UaXnJnUtjePh6mwYUIQIFtgIDN+oZUdOFa
         agbjycgXIYtQ3WLcoUeXJxo4YHSc6v0C6vwWKOAREZbTyxRgpWqYqxrLX1SDH7lMBh1z
         m0mgPXRrw/WREjC5gnTzNCXSGieGCFQP5/kvEFOcCjXgJv0wWL7kgKuLKgoGpzITU9EU
         Tfe78CbCp88firCsDY//A9UP7qJuwRgaL2Co6pNBN6ihkG7KzYYrIM2VFcZ5diskDFeS
         6eOxXWrTzEdqR33yq/axKDb+FiGVDtZhBBQ4R2R0vXlqhKdPI79npNhdp67nxiJo0vBs
         B49g==
X-Forwarded-Encrypted: i=1; AJvYcCXVTYdxxWkr5pkRIuRYSPJFXgMHJzkxiLN7QLnnIlWm2DaKM6pYW4w6GYAysWAvFlAeH3W7M797CLgaP+7wbFUo@lists.infradead.org
X-Gm-Message-State: AOJu0YxyD7MFOiro5TAliEKkBd6/x3MItr5aWNvRQfXT8sCKXbVw9PMS
	O9xcMpPapgDSrSedF8Gv4paOvGvIKEYBWenlFANhyrkzCRn4Vgr/ZyAo7R/iUHYrDYGzTFAmOba
	A9Yd0yxrQleczJ4InOhgJq0uYMQiSXqo=
X-Gm-Gg: AZuq6aKAmv6QV82m4KFaDIDYTQLVc8e0Ydic/ktB8rNBxFW7fxr2V13pbejQbGlayWx
	f4g4BcXJTqCkIgmSM8WlKf+okxuIii1GLZ7qmKGmrgRicM4YOiKIhLLcI2gg4+nrMOnsVn+KDlf
	u5nOnTAma+qXEbidpC8Q11VT3eWSDWUwPPhxAD+tfIccD+Rl9EXk6W57YDCIHEoDgWYC/O+g1me
	Ab5aJ8BHesHpFP1Df7Wxvl+3YPB11BLF7hXRD1E/+omLDq+VU4r9QfUxYGDIfigg8mb9/jQadEO
	bUQN8V9EgTs1ERl7MBpeXtzzdl4=
X-Received: by 2002:a05:6512:612:20b0:59e:417:2805 with SMTP id
 2adb3069b0e04-59e041728eemr897795e87.16.1769538441058; Tue, 27 Jan 2026
 10:27:21 -0800 (PST)
MIME-Version: 1.0
References: <20260124-imx8mq-gpu-ahb-clock-v1-1-11c2e7c857b7@puri.sm>
In-Reply-To: <20260124-imx8mq-gpu-ahb-clock-v1-1-11c2e7c857b7@puri.sm>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 27 Jan 2026 15:27:09 -0300
X-Gm-Features: AZwV_QhK3eFl5bcR1K336qjRBbT8hoZ1p4zrhgHgCXGLTwM9-xA5aPP55CBui9s
Message-ID: <CAOMZO5DAk3oZcQyqUEBiGhZPaX846q-zypyz3=chSNY1o_kBpA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mq: Set the correct gpu_ahb clock frequency
To: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@puri.sm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_102723_687840_432B81E6 
X-CRM114-Status: UNSURE (   8.86  )
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

On Sat, Jan 24, 2026 at 10:56=E2=80=AFAM Sebastian Krzyszkowiak
<sebastian.krzyszkowiak@puri.sm> wrote:
>
> According to i.MX 8M Quad Reference Manual, GPU_AHB_CLK_ROOT's maximum
> frequency is 400MHz.
>
> Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

Shouldn't this have a Fixes tag?

