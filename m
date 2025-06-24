Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B75DC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 21:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihWWakMukXt8Os5zOHseSTg4tzKTY1m9zw8OxkJuiHM=; b=LGiYtk9tYXZEaeOyJjv3AVKalr
	NHTsxVLE8dZybAr8q9nrV8GGfsfoCqZZRqJEvTNnEhSqngYJ+SBVwRV9Ho4UI/JLoogSY+C8UW4lA
	n7MxE4A5gYCcXMMr1DyP40P6MWHrCoYdrEHl3pQ5fV98Vm7mE/Qnm1olMl9KpIADWMEXSx+Hdg456
	VA2ESPaIo2+LVOPwNuzbTsNbPcsjTFm5Lxa6NRtKYEiMWuDKX/4R/lV7BwJHWSgr7EEgs07QBCQ2h
	HxSVJouV+rB5Zs3TvQzZAzQTjXcw1t58Z2soaaAUsQayecdO8bVYvIuHATd7X+RbiW2wOD9bxOXh4
	7huz7KMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUBHX-00000006t09-1MaJ;
	Tue, 24 Jun 2025 21:34:19 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU97s-00000006aWv-01JS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 19:16:13 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so778231e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 12:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750792570; x=1751397370; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihWWakMukXt8Os5zOHseSTg4tzKTY1m9zw8OxkJuiHM=;
        b=p/BfsrWJWAMI1fmHrXT2Ch3jEPLvPrhW6Hz4eQsAi4KHVCZPx7zgphoAgYblTRgn0X
         iDjFsT8EwO88Vn9yJD3dxMB29y0BP+ZI/bO/EcOgeICrQtsT5l26h0UmEiYnli9EgYTf
         0Qa3cSj5ZF0bKd+AIsmXrAH7nSnS7iMO+LxZZn6IHmaM24+mWaYHSyhf8QfMSJ91LN2+
         G+6zaNfjfjO9fK1s4itUriu5WreQGi64Sgae6eiZ3IPm5Blz+LRM2rUq7OzCfJJnNyUZ
         q3mSRvdaF3DQlMBy5XiXWtx9snb8XD4ydC0R/aP+acwOd4l8+ycD2MSvT8nP3adTe1nb
         n7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750792570; x=1751397370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihWWakMukXt8Os5zOHseSTg4tzKTY1m9zw8OxkJuiHM=;
        b=s8sZOsCF+mJAnBPFmJQo7FFJFeWWjpWXB7kaxjBNQIyN8SCF+KBmLdLi+YmFrD+Y8p
         8tOf6lwkxHS/x6fkRttpE4jJ8Llj7p4fZxbeoH+dYW9UEm5CCx2ygWV5fh9qvSjCXlfz
         nr6i8N/ySEJxWTq2TGi4cGywnA6LACDGOixtNyHf7EotbdZ329q//I+Sd7zaoSWAnVsz
         OG0prYmoWcS/aUJMFqKiiwECThUbNdoJh+lZ8Qj8LBgLeIpROmcmTg6lmEuyavObmPP0
         ntairFPPI8aRbG+cXu3Mgq8Cy+UbW+5h7lcGc02YHFJgs9iWtIuY152ajMYu1KUTXZYu
         w5tw==
X-Forwarded-Encrypted: i=1; AJvYcCWI22S46FU2Pg/ifM58YS2huhFDZ7eVHK2UfpalsBQqeOTTqV2b/ZAjLEcodT6nSBrQtF1Ijk6MUBj6t1Cd4feJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc4sqeEnezcF3Pxoj1RR7IiP32JHpZbeE58RYWhEExhPDHpBA1
	M4BF8Sgs9X/ihsh3MPoVr7XAkvVw7JzAL60Kxtg99sUmONo8XQR9zvk4v8WfiOs1Hw3Tz7sOv8y
	58Vl3B7asu/e386DAXxDBOaA4oMSJ1KBxFde68eRSd2+35Centsk5KCo=
X-Gm-Gg: ASbGnctTW1tR9uNGvAbiuRYLktSY3zih2AU7MMIr23AkBY+10sjtHbzQLUT2zy8RfJt
	PNCAydO4KT3OO7TORZsiHH33P+G/jW6rYULkK2aT+7FBaIJztyodUBeDGfLm9dfZoWdOqB9Miu2
	Cx62JhoTmtXSZtI52lta5lZv9p9YTPzcoEuwmigue1RLM=
X-Google-Smtp-Source: AGHT+IHmRRS+snn9ezdisZXjq9pNKvNF1NOIie7MqflwaPNY3SKz61GchJJ41LtKpgJIpimyXyrJyvJ1Pacxv1Ru12U=
X-Received: by 2002:ac2:4c45:0:b0:552:1c1b:561 with SMTP id
 2adb3069b0e04-554fdd23ba8mr18893e87.23.1750792570121; Tue, 24 Jun 2025
 12:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250620010345.11247-1-chenyuan_fl@163.com> <20250620012708.16709-1-chenyuan_fl@163.com>
In-Reply-To: <20250620012708.16709-1-chenyuan_fl@163.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:15:58 +0200
X-Gm-Features: AX0GCFs0q4vtQFV_NNK7FgYpbrOMY93VLrNBvqqOTi5xPuc96sQtOMY9VoZarF0
Message-ID: <CACRpkdaA8UQYX8bFeHn4JCxLgK_-UxR_n=ZCZmgbk8tqSgnFAw@mail.gmail.com>
Subject: Re: [PATH v2] pinctrl: sunxi: Fix memory leak on krealloc failure in sunxi_pctrl_dt_node_to_map
To: Yuan Chen <chenyuan_fl@163.com>
Cc: wens@csie.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yuan Chen <chenyuan@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_121612_045619_3C59D880 
X-CRM114-Status: UNSURE (   7.66  )
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

On Fri, Jun 20, 2025 at 3:27=E2=80=AFAM Yuan Chen <chenyuan_fl@163.com> wro=
te:

> From: Yuan Chen <chenyuan@kylinos.cn>
>
> In sunxi_pctrl_dt_node_to_map(), when krealloc() fails to resize the pinc=
trl_map
> array, the function returns -ENOMEM directly without freeing the previous=
ly
> allocated *map buffer. This results in a memory leak of the original kmal=
loc_array
> allocation.
>
> Fixes: e11dee2e98f8 ("pinctrl: sunxi: Deal with configless pins")
> Signed-off-by: Yuan Chen <chenyuan@kylinos.cn>

Patch applied for fixes!

Yours,
Linus Walleij

