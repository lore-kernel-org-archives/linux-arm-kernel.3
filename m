Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3D8CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 12:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LqfpXhH8oikGFpnElT3hOnVI48sa1H9J9/n1+8f904w=; b=FS8g89VuCXnMAL7jYv/+WHLcIS
	YbHznjJhBKHiu6vjzT5lGu8UGNXyqFcmAg7UB78ry0qbpkTrjrsxb8nRj4VSO995+V4MvHrJcB6ce
	idl3PyaNh3JRTyyqifX4vlQ7cpm0ATozDJsT1SV1CE5Wav0OkRi2VRQ22ngBeNu5jvS+CpEdHWlk4
	wV9j6u5m3vXfLVqf+lRoktHvwi45fM1wm5yKObgv/bEgRWuO23OKZtBE0A4CcP+J+pINCWqmCPC7M
	u+P0UFr0vLRVQAsCWdaDgrcFthYzrXogQwtCAzYMhOgcdJTyivOL9u+2BGyZHka0qPAohlT133zYX
	1KoOaujw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYQN-00000002uBF-11eR;
	Wed, 22 Oct 2025 12:58:43 +0000
Received: from mail-yx1-f43.google.com ([74.125.224.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYQK-00000002u9O-3zYy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 12:58:42 +0000
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-63d97bcb898so1609032d50.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 05:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761137919; x=1761742719; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LqfpXhH8oikGFpnElT3hOnVI48sa1H9J9/n1+8f904w=;
        b=QWU/89x2yZ6iDU18TFH6Tz9cCxvTP0pdnW3dgSyNpM0sXC3jmjUd5t2CZGiJgA0a6w
         deKSIq1Ev4Dw8LdvKgvEn2cEKpWL6vnI0kjS9WBkF2j4CzRghOLoPLqRW2g9aVRH4jmm
         F9uFIY3eBvO83iobMvcmdtTkuI7QI+nCMW1HgOX288gN6EQF9sUWqrzQE/chsfcaAsV5
         9dT6SLscrwLGfBUmf6HoRSZgZR9XLv5d/urSpWK+XD5wDKzKH057BYosorIyGTjNjwSq
         dCLQsQqTVjRn6uhBH4u8l0tTbr+dO+PTi2rUNVZmFtMPCNgMvGxuX3pPoLCygvzZbsoq
         D7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761137919; x=1761742719;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LqfpXhH8oikGFpnElT3hOnVI48sa1H9J9/n1+8f904w=;
        b=msNMbFZl2nNPSxtunqM/RBecpQuxyc6bSsKteVaMCKIPNXx/E9Fn2iVQY6PU7zYJmU
         I3D0SG73RW68Esk7xbXpSThSDPqGm+yyc6gxlUgJz1F2HsAqRA5XtP3/R4DtN+oMLidD
         xPABdndLjT08O5hP5dWA4pOi482hTkkjtSScHdgifAq6njzA7OW4n/VorniefPgufwed
         4QiWHWLqen5HvXuv1MzJFJDcMDvGnHGujYObHnkoaG5y06U7RdPz4g4Rgcudw37aohL/
         aD3pX3agatN7gn0nxqyRZOQnXO5+vfa2W1DnUfij1+ho940pMhZFxN917F9bUmNU6KxJ
         9CYA==
X-Forwarded-Encrypted: i=1; AJvYcCVksX7gyQ4/KDqGLQI8dyHvqZMHf7o9OY9sFpB2Groz1hecuAK9+DuJnmCz+l6qaGmm4WGqd7jtccT+72SNbxS/@lists.infradead.org
X-Gm-Message-State: AOJu0YxWgId0V8Dm0cFc4oxjOnZER5hGkN9wFQCIu3a7NeCjMUbUWB71
	CGbSCvYkER/b+dZfGw9WSaWtK+hKUTvKcWY0ojS79L1sxWOHyw4J1vUj3T/wgDw+i2FBe3HwTzi
	8LMbFwzD9oig96KAlUHSN+e6iLcRM+9K90YIwpoDojg==
X-Gm-Gg: ASbGncu6zhUm15G674MzM5+xyLN69eJJVLKNRIi+j4ncFWh9CHE0sE3NwnrQGf3Dj4r
	XKlQCoVrvidh+96/VsG4UNrl4/pz2XZneRhZQxHWPjNrmdQcqfpGOkfihH9y5QqNg7i7VhvUE2w
	veyFkK/dlr52jWVKdLaxEP5ki8Lx8FPX6EzqH+kqdM8eonAlPcRR6lV/WAZq6UPPz7Si97L5Jnu
	gtq9MZOOi7Vr/PMS/7HEkDG0Emqzd2ZOakq3KnYq7W5M/JTo6IDHPXN5r0Zik0SA2DwRuDnrIPN
	Km/a7Oc=
X-Google-Smtp-Source: AGHT+IEjyOT6ZnWjtbuwKFmQbeLCXJvC9+ovHItNxLtceyMzt5RJXygROmaPW1mTzx718f9fX9ymVtGCF2aAo4JR26M=
X-Received: by 2002:a53:da0d:0:b0:63c:f5a6:f2d0 with SMTP id
 956f58d0204a3-63f2833575dmr2112548d50.31.1761137919613; Wed, 22 Oct 2025
 05:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20251017093834.331998-1-finley.xiao@rock-chips.com>
In-Reply-To: <20251017093834.331998-1-finley.xiao@rock-chips.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 22 Oct 2025 14:58:03 +0200
X-Gm-Features: AS18NWCPlgQ2C3y-wODiJDQlKOeRdWjBY3paMVLSMS-IfDxCiXVh7nLiSG0YRnM
Message-ID: <CAPDyKFrDAmfN16fQdf5en-Du=sG5U61NK7vRhd_CtiSz19rU_A@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add power-controller support for RV1126B
To: Finley Xiao <finley.xiao@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, zhangqing@rock-chips.com, 
	sugar.zhang@rock-chips.com, huangtao@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_055841_000414_3A664E0E 
X-CRM114-Status: GOOD (  12.86  )
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

On Fri, 17 Oct 2025 at 11:38, Finley Xiao <finley.xiao@rock-chips.com> wrote:
>
> Add support for the power domain controller on the RV1126B SoC.
>
> Finley Xiao (2):
>   dt-bindings: power: rockchip: Add support for RV1126B
>   pmdomain: rockchip: Add support for RV1126B
>
>  .../power/rockchip,power-controller.yaml      |  2 +
>  drivers/pmdomain/rockchip/pm-domains.c        | 41 +++++++++++++++++++
>  .../power/rockchip,rv1126b-power-controller.h | 17 ++++++++
>  3 files changed, 60 insertions(+)
>  create mode 100644 include/dt-bindings/power/rockchip,rv1126b-power-controller.h
>
> --
> 2.43.0
>

The series applied for next, thanks!

Kind regards
Uffe

