Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9BCCF45C8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 19:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3xgYxXVz7pTlrANFhJdQjdekTrJ2dMKKIhvMM9hszBs=; b=AMxfmr8CsL0tKQ65Y5S0zql6cr
	kUC1SWeanpqx0lYX5QNRv+c8T0Scmg4MlOkeABvEr0Hbqdv+CmchUHVtj/88ro9BeHPfB9et6lXVI
	+8rD0zVNc/xAdfaSEHCLl+fKteOYLNMl0zIf9uqtJzp/jk0Gw2OhyHICNqT0q64yFly5FBCrsU5sd
	ZMxm69XXxbsEZgTzwlDHionmvLt64Bi5SiHo/LQidcfJfZmsoom9VNrgCTaj0v73a6IY8czlX0wCa
	t5Z3U2NYrbEmnb502zBDaimkl50ZiZs5Mv1YJyPZY3kP9LEL1gIGM6JnvBQqKlWwO7L/b4JRqoD0e
	eVPzw6sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNIT-00000005xfn-05IY;
	Mon, 12 Jan 2026 19:09:49 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNIR-00000005xeu-05XN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 19:09:48 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-459a516592eso4457862b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 11:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768244986; x=1768849786; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3xgYxXVz7pTlrANFhJdQjdekTrJ2dMKKIhvMM9hszBs=;
        b=SXC9fmB2+/Use1tqeBt+zcww15KwXx8tNyzy8DH//NNg1m8okZLHLplrN0smO5G1bW
         AP9t8nZ+iWwJpyZPKVSlUz9ZGSJfbM3ZYBpsH9/60oK71NOxWxDi5EHk1lz0JQuR/sOr
         gxGNywrKWWylWKpkfT7FvRenOVg0ksGUop1CoQyQcK8sYREKOim6kuX/r7tF3nKJk0Uq
         LhR4E/1UiU7ZsUiJ23eCvCprYMUFVU0rkqe6MDTlxlEStsUROYPzE1BOgLdo19hO+xd1
         lzf1I+dOBy1UHmbwLfgvpzI8VnCvq3cJ+VulmRrNREC4czR7wX2/ke9GK5KTkZSAE9uI
         Pyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768244986; x=1768849786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3xgYxXVz7pTlrANFhJdQjdekTrJ2dMKKIhvMM9hszBs=;
        b=OhRB9YfJxRTXNHHpFV2wZkC3wQ0sde/L6m2wJBw45N2TyNQ0TmoaPNAFWN1+tk2SQe
         Hm4K3ZSKlOtsUQ7AA3zT1aeLXkLYD1DtDzd+S7GCfuBJRPwbCDTMzHb2RIeSJEUsjPiH
         2ArC/7n36gXoVGE0yhyBEBocP4DFexbE8BAXQ54oxt3NCoOOoLzbj9FaojHrAn90XkR5
         xfw0P4M4JakXa5Kgy3SfALTFIIfuzQt3n97KmnWdCWY5nWnUHRciDmHwq5ww4k1wZUWx
         E3L6J+Psoe5MUIn/I9o7R241fMaxIcecGDSK7tVeJT0xvG6Kx6IeRyw5jiQWqFaQSXTz
         bnnA==
X-Forwarded-Encrypted: i=1; AJvYcCWHwWwpeOwXObjAFHTPIhxVhqaQP5Xd+xjeSfaVeWKkvUPmwWp71abj1Id1XinroQEM9iGwktUjZXw1sYU5Yn0P@lists.infradead.org
X-Gm-Message-State: AOJu0YyZTixFFI4VOQLaSMIyziHz3Y58UBslkLd4rW+eneVmP9K77LqW
	wB+XO+0Z/JIpyBSOpbIKtdB9qWKtUVf2CsOXzKuMM8kzBYO+qDIL2KVoNqmL1MqWCEkjniZzCh/
	UiQlXZ1NfUwQraIQ/0okwIlCLqHABQ3U=
X-Gm-Gg: AY/fxX7rxdAQX2mULCU5nlUaPZmMFoXpgNGdFLcvXXuJzhMH7ITmpncGgJ1Gi8PIAbJ
	mKB2lyV0avjwoA1BSb2jqhlMw/UpU4SYFfRXgf+cslpOnGX66eKLmiaUlCQLshMyG8vVV4VsAQp
	QscHB3ivMUiIYf6pKY9hfP+OLq8FGuHTa/vO++hBQZvM3vomFuEyZWMnaHXBEgmq6J/dQdAQQD1
	41zkKO8rkckWabMKGuAhL8anI1BfLqNFhVVMnMG/7I9Ob6S61rC6QqmAHxRvdNm5eQFwesgknmz
	42l2wzGeYCRkRjxqR4HPIEi/cOg=
X-Google-Smtp-Source: AGHT+IEwDmLeVhBFXh9EVFS3176R5WTz9bHFuYfygwgWJn3bI7U+szmlFfINN1R6jPICkSRAQjR3WA/cuwePtfThcjs=
X-Received: by 2002:a05:6808:18aa:b0:450:32f0:4887 with SMTP id
 5614622812f47-45a6bdfd28fmr7796703b6e.31.1768244985965; Mon, 12 Jan 2026
 11:09:45 -0800 (PST)
MIME-Version: 1.0
References: <20260110010715.1610159-1-mschirrmeister@gmail.com>
 <67ccb8f6-f9bd-4266-b79a-b688bd6d030b@rock-chips.com> <8536413c-8687-4d75-befb-8f25e54838bf@rock-chips.com>
 <c3ee063c-ca11-44e4-9e7d-3861a82db3ea@rock-chips.com> <a346ba30-43f1-4579-91e7-f10d2ccff039@rock-chips.com>
In-Reply-To: <a346ba30-43f1-4579-91e7-f10d2ccff039@rock-chips.com>
From: Marco Schirrmeister <mschirrmeister@gmail.com>
Date: Mon, 12 Jan 2026 20:09:35 +0100
X-Gm-Features: AZwV_QhduoYwkSZhCEw-t8HBLxeWwsxbNWZkTjbia4I_1o_9SGTrHxB5ncQ2lVs
Message-ID: <CAGJh8eCJEwSySH3jddmcLjdtbFkn2yDmoE4mH1snmZJQHopA0Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] mmc: dw_mmc-rockchip: Add stability quirk for
 NanoPi R76S
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-rockchip@lists.infradead.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, heiko@sntech.de, ulf.hansson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_110947_063820_24B8080F 
X-CRM114-Status: GOOD (  18.92  )
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

On Mon, Jan 12, 2026 at 9:58=E2=80=AFAM Shawn Lin <shawn.lin@rock-chips.com=
> wrote:

> >> I found several problems on RK3576 for supporting sd cards. I wondered
> >> how all upstream RK3576 boards claiming SD support work? Anyway, I sen=
t
> >> a series to the list[1], not sure if it fixes the problem you faced, b=
ut
> >> these should be the right patches you should have a try.
> >>
> >> [1]https://lore.kernel.org/linux-rockchip/1768189768-96333-1-git-send-=
email-shawn.lin@rock-chips.com/T/#t

I will give it a try on the NanoPi R76S. Have also ordered a Rock 4D.
But it will take a while before it arrives.

> > cannot be detected. However, if the SD card is inserted before Linux
> > boots, it can at least start up. I suspect that other boards may behave
> > the same way :)
>
> This is true, because .get_cd() returns card present when booting for
> the first time, you the only way for upstream RK3576 boards to use sd
> cards is to insert the card before booting. But then hot-plug case will
> not able to work.

I can confirm the same. sd card only works, when inserted before boot.
No hotplug.

