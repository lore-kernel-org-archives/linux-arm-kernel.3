Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9643CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 16:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sObTShEZy2OUUveLhetL927VwP7OSOCCeucbREwYZSc=; b=x9Ojic7jhW69q9Ax45Nir9JhAP
	zlssUFNHxtgVOiE8iLTRbuvC0H6HAv+HG5GEwgp6tIz7Se350ouosu0ZoHZ1MPwAdk6umcgMBQpp+
	hu8de7Lfoe1yeB+l/fHDHTjzDZ4vzsCpJh9L+hMm/m6B7USg9Air+3irPRkp8To1ZfCdRikN1J9eX
	1FmDZzMRfJhCKGD6yAWKZElSjuBIaVjjc8Mkq0xvdzTDwWdpKqdDnCrY/TWQOHYCEnYwEu2tO8cL9
	bDkVxVqevLEcqfqRmK/piEPHgNYcgZS9izOTFYadZ26IGTVPb4GcuUDkzRPOC9Myp4FYOrsMYggdL
	kA0bjahg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7jI-0000000DLNf-2gWo;
	Mon, 01 Sep 2025 16:50:04 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4KF-0000000Ce0H-1Lq3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 13:12:00 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-55f72452a8eso2003163e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 06:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756732318; x=1757337118; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sObTShEZy2OUUveLhetL927VwP7OSOCCeucbREwYZSc=;
        b=HQxZRMS0yV8JSxdL3b7A9RGKpblWcWmbJM25DuyG3Je751sRYSljF3QZYbHx/WvkWn
         GbJgX3kWehYccBIamMRWMBjfErAqQlqZZVCV97Tg/X94c1p1/ndjK7w/dliW7MgmTJ1J
         Hx4ADfHNOaaX7IeIKiOhUzvwmhy2c+SPQWVC7IUO9oc9EL1aU7J9W5OhFkLlOEATZvd8
         iEGO2DzZdge8pQaDUAsZNXNIdcjd4C+fMiwpx14sHLi+d5mMgaMuopF2dBVkoPsozX03
         2HVKBNpzCeIGVNazQDIYaaZ9aQgnLiRvBSZk6vVUzBtGftz5dq9UPM3pTGMAn2Cpm1Zj
         TDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756732318; x=1757337118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sObTShEZy2OUUveLhetL927VwP7OSOCCeucbREwYZSc=;
        b=gbMx302LQ1H5bkuygGGeleZkVpc1x0YlsDOC/mzgJrP4tD+AqRDGtfuQSbrt998Jp3
         E2zU8BBD4YnC2wRE+Oo289UPAqjwupk3jDovGmpb1IRhLxNuWb5Yn+MWENyLpd7SmPRn
         tPwrbsm+r3CACqY6eEWFo673BqXSwoe7quidBh9ZecuLttvhm5XNxzMPWGVxZLRXiYP2
         uRskNVKxsS5TE0g/CAl4sM9YA8vGivizGGB9GJhWzmx6tveymnTz4Xr+4bd3w1qfysNt
         N7Gfg+wBFDsFoFixNufMUlYKLWzSpRNc3AC8ygoOF4WTExX2nCW2sfx7he2E0+ocGiKe
         O5rw==
X-Forwarded-Encrypted: i=1; AJvYcCUKKZASEppK13Ltvhw0yccTqO7PRU0htJceDjMUe9cOkaqyjXsjHG4/q1iXNaTtVfL0DzpANN0q8SGI5V9V9MH4@lists.infradead.org
X-Gm-Message-State: AOJu0YxxKYsYmsubGHfs401/+JCbCMfs+IDXvK41y6Fox8m5ENgnRws8
	46/nYbIs3veYGApHxLuzNFmwuQZh82m8T7uXz1G61R6xeQ3v6/0maE34sMVAlF0cz4PUxiHQoYt
	lbkc5N+4qGdkL34Gg/X9LleBxEKy+q0Mf/zy245Tl0A==
X-Gm-Gg: ASbGnctG1h6nfBrEP9Y0aOXSne/pFrPd/8gxMouJ0quU7658vJQ6p91BkuMooVZaTlC
	lSjbc/LoPiAMGyX6R4xIZhg33GXkXt+gti1WwXNzjrEluNuqGPlgGzYlgfOFlggDH8gHrUiCjyy
	AzZghx1GotoG6qedcU3oM5OybHjg3C6aSJeQQYvJ+pAPfVxNVgDBENcx+Xz6cHdMsEAW7+60Jvd
	lf4baA=
X-Google-Smtp-Source: AGHT+IFq7h1lPoF+hrBQ3kLFvKvnvZ/34QfLPL/Ze8E58RG2MM4xOIC/Bsgm8sKFufC9Ni76c/KIQO1b5SuiDKts7XA=
X-Received: by 2002:a05:6512:4017:b0:55f:63ef:b2b3 with SMTP id
 2adb3069b0e04-55f708b7024mr1931724e87.22.1756732317565; Mon, 01 Sep 2025
 06:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250831084958.431913-1-rongqianfeng@vivo.com> <20250831084958.431913-3-rongqianfeng@vivo.com>
In-Reply-To: <20250831084958.431913-3-rongqianfeng@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 1 Sep 2025 15:11:46 +0200
X-Gm-Features: Ac12FXxIooDBTyEdgDOjs8vx_SnAk6yJV02Zl1vZBspK7El30WHuPVZOHdwTquc
Message-ID: <CACRpkdbNDCXmWZ3AZS9SVJ7qzhprNTYCVympKQN7E9jdrDDzmg@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: ma35: Use int type to store negative error codes
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	"moderated list:ARM/NUVOTON MA35 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_061159_359287_7118DDC6 
X-CRM114-Status: GOOD (  10.65  )
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

On Sun, Aug 31, 2025 at 10:50=E2=80=AFAM Qianfeng Rong <rongqianfeng@vivo.c=
om> wrote:

> Change the 'ret' variable in ma35_pinctrl_parse_functions() from u32 to
> int, as it needs to store either negative error codes or zero returned
> by ma35_pinctrl_parse_groups().
>
> No effect on runtime.
>
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>

This patch (2/3) applied for next in the pinctrl tree.

Yours,
Linus Walleij

