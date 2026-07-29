Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA718C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 21:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g318k4aTVUNemyX/qfEfcAL4FBNIpHVejXjEULHegwA=; b=AfJ8OccQV7fAqA7ZhSvhLeKC+D
	B/bYTcfpYjvQ8ZOBYQi+nGWwZIrIwMlNj1FVh5C8+8B02JMr9D2pYJkhCPDgnl6LerPAHn2HPCBQo
	/vLHzGqcu47LCXhQNBZaHIIPvsoXsks59dXqzbQR7lFWsdPqhIL1yTKjSN2sza25MV2urqGLjnadl
	H2Va2udd4mu9SWdqlkoGXgsNVAZaGmsk8VTFhsILvG0lK4WYdBKEg4bILSWnrzi/7sWg4dWMDjEkd
	vA7RSiOqjw8c4GWEt8osnYdLuHOp6P6sytIdarYfVKd1oBQ5Vcy02soXh6jmvOscgY2Z7tQujSbM0
	+j03l54g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpBQu-00000008ylA-02Tb;
	Wed, 29 Jul 2026 21:03:20 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpBQr-00000008ykh-0cQ5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 21:03:18 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-69c7ab350e9so2318113a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 14:03:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785358993; cv=none;
        d=google.com; s=arc-20260327;
        b=F+73U3g9MnM4mC+nxHfd8paztf3hEaCzbkgCHOP64hvMwG9mXEKheJoh4noADOFLT4
         KCPmgfFRJWZ8rP2juHE2xyzWiSgZDj5QpYNtCQIHhVfGvsekTjlVYEhAujtnb2PZUc9A
         UYOc08drSjwOWXV4yNHXbbXQ/4AOn1d/FAToD8Pegug4KjSez/v6Y0uMM1Lo3t8zQH9u
         AuzCr66N5qAGkKJId90R2W1IYPHzy+sAAsm73Of8ZCijv8gO/X2/3FA5ZZiFOi+AacH3
         tSOMNb3sBnV4cKMtzWkC5arYuHDhuX/NZ4+TZMLjn/7+dMYj/Q1cewW+i3SXeBhrZtb/
         fL/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g318k4aTVUNemyX/qfEfcAL4FBNIpHVejXjEULHegwA=;
        fh=8omkE3oh1aLbgMhD3kKd8M7RZ25kC1pMp3D0+Sy8nWA=;
        b=F/aCZBOYJ/DI8JD/DKsLj6OwTUj8uNwhCAtEOWu0Mgkbyoj1xrz5QgW/0U5+AF1FAJ
         6T1cu4uNWWJWwNLughSeAjLuCvgWQ0C3KnOI1bqgUxFM3d31Wv9uGJ7xajI5idGBdF2Z
         eVS7NbLU6Y8oE3zBUAJEsDTdCpKqdMSPYkkVgEI/Pux3syZIu7i4rGP4Yx+/lDNxUueG
         bx8ZvIQz+eP8yQZZ3+Rmj8rPvXolFNwhYAyGPS7dkVgjvk3vlH0aXhSkQOyK5n/ZEu5b
         onHVsBgzYm8uUzLgHscGsbyjpxy+89DzGtcKCvGqqe8V23pzWjRH4xI6GWy+zD69d5qF
         TBTA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785358993; x=1785963793; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g318k4aTVUNemyX/qfEfcAL4FBNIpHVejXjEULHegwA=;
        b=nhVFl6O1XF48TE4R+BJ0LxsNGYTPqTRb7qGnSoq90htriT0dwOJOCbrwSubKj4D0TJ
         OCxUn2L2B53rJE04dsQexCQKV9p6hlyd/KSZ43dDpDPm9RV8pRGmDMDAdmn3RnKYljHZ
         hCvCQOwLMLKuiyspB4mXyt7rbVTqX0GBy8wBzbJMSqt/HHzje7ZNSsyyGE3lPmqSB2/z
         iLHrch8Vb72Yb7V10w04PPIgXooZ7hVe5C5PX0gnbQOSxReHaf7LUBi0wXxkgzxkiajp
         EBPiQowmiKVE7EMr3WbfK9+hh8s1wwo8vdpo523iUii81ptY+CUrkh779oLFiMny6ImL
         lBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785358993; x=1785963793;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g318k4aTVUNemyX/qfEfcAL4FBNIpHVejXjEULHegwA=;
        b=BfBeQ3KM4BQVy3YF+5lMSgvngvWE9Y/uIB/Cc65WCydPTlEbLm4hHD3p2gAodLwA65
         hWtQ13ePW4oB5gjdQkic17G2kxB+euu2qipMcuX0x3CwLj6hrSVUuwjL/81/zWhgQASL
         u3IY8I/F3sV+gQog/ut1cyavD0x1epydzYpAc1IrUvllGck90nRO65vk/bAX+dV1QcsF
         6mgUyLs1KI0s3Put1MdiYgpHtuHl5bxMhlZHY3OhWnwbaDp6Bd17LU50z0DbNK+yMXr7
         877nl4Ay9ZiNoS/7xGDpn5tTWfbCy91Rj7s997J6aZ4Ms+5ykzRu31+8xfz8yPqwYIJX
         6Uzg==
X-Forwarded-Encrypted: i=1; AHgh+RomxOapRWiQ41I/wWB2gjt3s/xT8lhZar03NvdGS1FSJg5WiK3coorq5vUBSI9te6Sqs0uGz2FOPHi88lg6o0gj@lists.infradead.org
X-Gm-Message-State: AOJu0YxuwE1W6Bo3y5MwlFbuvAP7mQQI9EpmZJ9B9ImUMYlI8IZHNj4D
	cjRYbmno9B7wt5KUaJEntns3i1bDfaZRwl/Wj61JjTwq0+PYdE3kZhXShhtxTchyAB8hmQbBQG3
	adz/HQfw+ucEBKr+Qoll9gveyVXaCrf4=
X-Gm-Gg: AR+sD108fdWRxUkG6i5gXkewhYzx93WBRFf/PwDmp5dvH8ELN5TFgZtCg7qaNeYPxnQ
	mzRX3hoIyler3sHkh7413CcqsNl9hQb1MX4p+TzDsrkoJ5r8pCe73jg81VzAVYLHMhe1BvgurOk
	nHHuxJIzgyU/bxqxo98TxWqOGxEXKQoOAPZI+OlkeW3FkyVbAunULzjBgDP4/bn8jiDg5TFjNRV
	RHRU81DlEdkuLQ5w0JhO4LYCrkkNM4KzCr039yQ37Sle08ZzDs61brEd7VMF3NwV7/rnIWAnQmY
	B7IZ3qFsVSmB3Arps3jv+5zL9IZNANxUrFY59jHc6cNOPZNr6J74yURa/1DX4sbJjZJRjGEH3qC
	JDmlfA4be77IW9ihT5G0+gOo9L6c5r2V8xiQAID8rwaywbvbQjnJroQw/SceYpN8386+R9jB0f5
	JUnkZapsClx7ps3JFsXC3oRSyNz+k+drSawIoUgwdPfbOXgYniutwqNMM=
X-Received: by 2002:a05:6402:51cc:b0:698:6084:db7f with SMTP id
 4fb4d7f45d1cf-6a07b7fc1admr21670a12.10.1785358992379; Wed, 29 Jul 2026
 14:03:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260727194836.11689-1-rosenp@gmail.com> <a9a2caab-f93b-448a-b846-7e739c143687@kernel.org>
In-Reply-To: <a9a2caab-f93b-448a-b846-7e739c143687@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 29 Jul 2026 14:03:01 -0700
X-Gm-Features: AUfX_mx4flmj0fEXemuqhYXtdVH7XNcN1VvGWawpVJXNy6WEVYqTNmVDorddp_Y
Message-ID: <CAKxU2N_bPw+_Lw6mSYF9Bj1KT=-y7oJ-_v2rhPBmULjU2p5KyQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: exynos: replace irq_of_parse_and_map
 with modern APIs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
	"moderated list:PIN CONTROLLER - SAMSUNG" <linux-arm-kernel@lists.infradead.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_140317_210308_621C32F8 
X-CRM114-Status: GOOD (  14.81  )
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

On Mon, Jul 27, 2026 at 11:05=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 27/07/2026 21:48, Rosen Penev wrote:
> > Replace irq_of_parse_and_map() with fwnode_irq_get() for per-pin IRQ
> > lookup and of_irq_get() for the muxed EINT IRQ. The fwnode-based API
> > works with both OF and ACPI fwnodes and follows modern conventions.
>
> And what is the point of ACPI here? I see no point in such conversions
> of one call while leading everything untouched. Add proper ACPI support
> with valid ACPI tables with ENTIRE driver converted, not one call.
Avoids having to call to_of_node. ACPI in the description should be removed=
.

As far as fwnode is concerned, fwnode APIs are used earlier in the
driver, probably for the same reason. fwnode_irq_get didn't exist when
this driver was written so of_irq_get + to_of_node made sense.
>
> >
> > For the muxed EINT path, change the error handling to propagate the
> > error code rather than silently returning 0.
>
> But why?
of_irq_get can return -EPROBE_DEFER.
>
>
> Best regards,
> Krzysztof

