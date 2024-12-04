Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CCFE77169
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 01:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=50u1RJmER8i7s9/SprHkL8TRwZkGr9nPZOt7IMSKd/Q=; b=rqfvjY8A8liHLkgcJreX8lPQlx
	puT49norADen82tl13JKAusG0MwFqtMQEZLqj36wlXw/5jyJsOt9J1zZuG05aGRZuvOm7nw3B+wPK
	ntwLEgAnyz0+4V9Yc8ToPZotQfhMAarKoH/b0AxS76EpTlg7k4HMlvsGoXi+74YlCMqtzwRuBG4nx
	vKKplXCfGqhXYTTxQHbBfLReqhlGbVippapBCVqQMp82Do+dxLOFkf1CbNIyxQzjB7A5TUWWx7r+r
	pqbsKPaF7LkhNacCHsLybGLgQmmBrxoYZvW5bHZcoc7ISXkzjlf6JCXUKDrjNGTagvprsYBNTd/uJ
	iA21f3pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIeBw-0000000BBxQ-3BoF;
	Wed, 04 Dec 2024 01:28:36 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIeAw-0000000BBsZ-29zn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 01:27:35 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-6ef0cee54daso70759647b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 17:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733275653; x=1733880453; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50u1RJmER8i7s9/SprHkL8TRwZkGr9nPZOt7IMSKd/Q=;
        b=gaa9anaZMFKn3gs8LVw4xg3EboKhrb8XO2RPrze1JboExmKUtF95PR4P+D9nO3WMHm
         r+9J904x3MO0mlpRnDGR8IzTJ9WPClI3HeCL3DrPcDzW/vc/q+6yj0ZL9xyVaJDZ0gHA
         vUqHuFnO2hjBZ3qK8dyhtqYVf58rNbwVnHHdh/1DLCT/k+ePObOIQi6sPo01c4Gla/Ga
         hlej3TWwB07UTjnJ8FFECJLvLEV1UsavYMEexBb8d6A4a7F2gjZ1pkenOb/F5jlHXKmL
         2kgrHlqhQanqzJC0NdwcSKrYXr53izFOTuItqkj1TIi2jusLKi8MZVui+OYA4taBnnh3
         /4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733275653; x=1733880453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50u1RJmER8i7s9/SprHkL8TRwZkGr9nPZOt7IMSKd/Q=;
        b=eKBLoVkTYXP/r8WC0BjVZbwMozeqUTDdpWeRJGwtbDKTOm1+C11VXQwlzcbR67Ie8Y
         ejHUaWSi/wJRhG8zOnKw6hFb7onL+c0ouA2lzAqMgRA4b2rhVSIw6+QvONuw5DJmAvGf
         m0d8HYE1ZV107HcgZIOutUG6fnrw0WtTXMANFc7GqrsisHWQ4h1XOss5loPbYf8lu42g
         fnZRqUPCC6N2vPfocFQBpcG5oPt+MfDkGXr6nRZBa2xt/8D8A2XPGy9K5+FnyBuHrvxB
         1t/VBeak28SY2CtNguzceBE/kXsh8+yNFblnV1KUGFMpBjL6i6AJXeqf9xguZlRWVMYp
         xUHA==
X-Gm-Message-State: AOJu0YwpK1KHqbaRVLk28+nxCQmUrkpY787OkV6gzhDV/y13PcwOTbA0
	eMy6i4GxtKqhX8tsZTYKrEpOkGjwsQlzMZ9NkFXOSPdoSRVplO7VW8gK1FVVyRua0R6N+dTDdAU
	3veInT0XPHjn6napAtt/qSCF6mbw=
X-Gm-Gg: ASbGnctn4ZGo+V1RcxeljvcB+QX8LJoFTa8KTu41TINHw0wtSFIiGFbgH4n4N4R2gxR
	g0zM1QRjhHEuDtW9pruftB22JWt2rkWACrpRowTDFrxo4
X-Google-Smtp-Source: AGHT+IGrd/NkggySgngjjRAWLRFHYhjYZYjpO5V3Ph17rxzb/RIMEJRHh6MZW7V/BkdjtwKB1NIeF84yZ7lgyc0QtuA=
X-Received: by 2002:a05:690c:d89:b0:6ef:8c41:def8 with SMTP id
 00721157ae682-6efad311464mr68861377b3.38.1733275653265; Tue, 03 Dec 2024
 17:27:33 -0800 (PST)
MIME-Version: 1.0
References: <20241203233717.185016-1-rosenp@gmail.com> <560369d3-e37c-4c44-86df-a0b81c899f9a@lunn.ch>
In-Reply-To: <560369d3-e37c-4c44-86df-a0b81c899f9a@lunn.ch>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 3 Dec 2024 17:27:22 -0800
Message-ID: <CAKxU2N8gVqUKmD0hj_rXwJEOL8KStNHm+O23Sww-yVT5cp2yWQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: armada-3720-gl-mv1000: use nvmem-layout
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-arm-kernel@lists.infradead.org, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_172734_556502_7F6FC59D 
X-CRM114-Status: UNSURE (   9.86  )
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

On Tue, Dec 3, 2024 at 3:44=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Dec 03, 2024 at 03:37:17PM -0800, Rosen Penev wrote:
> > nvmem-layout is a more flexible replacement for nvmem-cells.
>
> Do you have this reference board? How did you test this patch?
Only compile time tested.

2cc3b37f5b6df8189d55d0e812d9658ce256dfec marks nvmem-cells as legacy
and most dts files have already been converted.

This is not a crazy API change that would break anything.

>
>         Andrew

