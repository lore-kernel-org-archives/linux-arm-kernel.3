Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA0ECCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 14:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxXFc+EBgs0CbHlD7l9gpLs0cW/F7Jrm+Xjbm4AxTd0=; b=4kYW6l7n3VoAYkSaclSIV8Zi8w
	q2YO21OFt2OOPncpEFOjXB+PC6pfKi7Ezh1uZ/MKXVgK6Y6qlG+TGYzj8qS+HE9u7YYBkggkrqH62
	k31s1QWLa/gRBKgOJsufiJMIQTDMq/ITTSutRqoDTPuilo8hKhpnG2DRQc17QNZl7/QmBKSI/MbNV
	7pc8ZbJrPl5IQx62xX3jx6G7YfY/drhV6NTJRO2QeBQ750zzz0QDBORY1hcjjs65mCW0K/Oq9QREG
	BwM2+HXaf0V15lwO2xfVRxn9uhktNFMb1m2JX44zSSoH/35UoVhe/M4XdlQ3jpwBU4EAT9iBi35iR
	FXdnrLoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6yO-00000001XJl-1Hjz;
	Wed, 29 Oct 2025 14:16:24 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6yL-00000001XIH-3S4c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 14:16:23 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-378d54f657fso19522361fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761747379; x=1762352179; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxXFc+EBgs0CbHlD7l9gpLs0cW/F7Jrm+Xjbm4AxTd0=;
        b=zZXQqzLKN08pe97yMOdGmQ+cx/QxN/hNDTLbH9Kc0gJzgdTEO3uIVbGD7NtOGCNp3w
         qk2Z5C+mxiAJv3xiKHvr2WlGXI9kFAX4YOcAPXlO6N4Dt+j82Tm7suyam6xnox7yE7Cg
         GYtrDHdV6vJSaAbd//oVWkuGUpKRm1U831bRAPBpBOx+3h+qspQE+a89VRK2kDEgWvpt
         7LrFhHkLYefdyqPgScbGLJHNbCHWsdYigOcZJDXQhogNmettvzJwnU1J35NsXiQKseR3
         8Ot8O1wM6HV+l4fo2pt84i2qA5vNxdMNmWM+QybT8AtTtFxFQDFeKFCi7FO9x/yD0J2t
         KVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761747379; x=1762352179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxXFc+EBgs0CbHlD7l9gpLs0cW/F7Jrm+Xjbm4AxTd0=;
        b=Q9rWy93MjWyNMaUuZDdXom8C7Pg4LyBls5cyzfCHTOYtnZV9DDOo5TC6JpcBYm0AuM
         t+raEyLpkOw6W9ejjyXoQL1N1u7kwu0wMRvoXY0eMW8u0wClLzQuzaHF1gCTM9irlEUe
         U/HJ4PNfOEQ/fRalREgB8Llye3r3V9/9HAEqbh3e+UDDucidwSd7bXF6x3g9M2Zxsm8e
         0gpWzui9hKKmTAzziQBG3tMB27QrR02/EMjOtWkXYpFaYSgxWFO/R8pZK0+ZpaJFUPEM
         ZuewxWiDqRC9/4fW+j3oKCZ9uYu6EI8+o22sCrdBNPZQA+Kl4pRXre9SyTY/2JfepPoS
         9GGQ==
X-Gm-Message-State: AOJu0YxJQY9Q8Cfx/rsfd5Roh6aB74eVyi5IYmDkGmKrYywR6avSvTtB
	2wHUl8AiJQuqzt8DU33fLTtgL3NKn718NNdQUjSzdRQAqik/ainznWUNjyUWGaX/8vbM6usNcwe
	AyssUHmsQA9HF8nGzUjmXYOcghGMqs4INr1l2kXy7yw==
X-Gm-Gg: ASbGncscKqvnbW7FuB93iyI6vQaNvuCejhnTd9+s40R2em5vjFM288rGvB4Cvt14IK9
	KhqG6Zufbg63rnVoJnFquSHI2O7BobjK82H0Mnu3M+/9yH36BnfUVxDATtc3Spww8moMDOkbiIX
	bH1b+/dWrAQ0p7i6ZHcvHTyuHR7x4iTszQZPs3fkofyVwMPuQzMWXAPTlQQg3yXpc8l5KFdhd43
	BErQj6Et7ADTK5xANdZe6Gt1cvuOnw5XaMq9zlB8Hw48T1B90Ra5PDIleRT
X-Google-Smtp-Source: AGHT+IEptPKEcoqPo9FeMod6gmfhfMTEIiCI11mAJ1ueOUccKAbx+gwAckHYFFXT0qvD476gN9amBjG+i5QCBGdt33A=
X-Received: by 2002:a05:6512:308c:b0:592:fcad:4a11 with SMTP id
 2adb3069b0e04-59412862548mr1117269e87.7.1761747378839; Wed, 29 Oct 2025
 07:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <20251027133232.392898-1-sakari.ailus@linux.intel.com> <20251027133232.392898-4-sakari.ailus@linux.intel.com>
In-Reply-To: <20251027133232.392898-4-sakari.ailus@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Oct 2025 15:16:06 +0100
X-Gm-Features: AWmQ_blgtByvILsdIvR8s668JcbrTVKFsoKwNbfCowSDaWebFno1q0hjsKO5ZqU
Message-ID: <CACRpkdYrWJCD+A3u45HAWjARyK=MnfYCy0DH+Uba7JGUtkCzGw@mail.gmail.com>
Subject: Re: [PATCH 4/6] dmaengine: ste_dma40: Remove redundant
 pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, Vinod Koul <vkoul@kernel.org>, 
	Sinan Kaya <okaya@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Md Sadre Alam <quic_mdalam@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Casey Connolly <casey.connolly@linaro.org>, 
	Abin Joseph <abin.joseph@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_071621_872309_4C526355 
X-CRM114-Status: UNSURE (   8.49  )
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

On Mon, Oct 27, 2025 at 2:32=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

