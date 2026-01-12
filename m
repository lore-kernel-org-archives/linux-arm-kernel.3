Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09035D25030
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 02:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNMDVPREvTyCqFpCO4GGC8yTEzwn1qHeHys6UKrheCs=; b=gUFi7R3SA2mmlzAv8N7mjukjw6
	1ZnXEU8MCKO+DldkkwHxXhPX4KQW1Ie1vZBAU628DZdWAf62EXFSutQdhqbQB4g8ucfr4i+Y2scnJ
	rY5ZnqYsefMF234qEHotz/AHDCQySJkUuUCElIH9lF0DLOfDUD710vRCEf8FPmerHxEg5qZIxAyQ+
	ArXgK0PU5jzT8bJ6aw/O7428IWl2EI5uxTy9mmc3XStzqUps3IAB6ODPT95GOGg42DDYZruiaCV5g
	Z67PYARt41AYniOXKAY0ef3MLD7h4dVGc0T4PZJU6PTKe/Q3/7sQAJ3skXPf5xJBhFi9B6dO8UXyj
	F53gb1pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf7mk-00000004g3d-1u53;
	Mon, 12 Jan 2026 02:36:02 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf7mh-00000004g2h-2GeX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 02:36:01 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2b1981ca515so2684455eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 18:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768185359; x=1768790159; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNMDVPREvTyCqFpCO4GGC8yTEzwn1qHeHys6UKrheCs=;
        b=L9xWSqM0nocRQ2F7CM/bBgr4/tlGJTq2gNX5bH19dZtdR5t1FWlETfBGrqmJifEvXu
         i+KqCnAOdRGvLSNOOkTa7WD6jfrpiQbRdZHnnY6Tty+Mc0eORgBXWzJ6OqMUu1yCy2Fb
         +K2zk2ESJlhtSacRx5tWc4NE/q1VXFRwLtMMnU0ZSZAQu1u7mmhDPmpy4wGZUZjXF2CU
         EAlD24g1zmuDJlCw3epd+Mc/7gTYsuDoF0i1zT7QzvhaP8rJ+UFSQvmmTNcgEs7OjmvB
         qUZPtocy3T5/OxLv0nUURCUsz4xczJ6X/1RDWF/tz75T/m384IZVkE2/z8ckZArPzxHi
         XEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768185359; x=1768790159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fNMDVPREvTyCqFpCO4GGC8yTEzwn1qHeHys6UKrheCs=;
        b=t3KF8MY9HxIor0SsTyjdCRGZ93n6mVTzwiuKuJVFuCpnyQSevoBAyK5bLHyd272RDM
         i1v8h231qi3/GbjKTc3xG85YranB+lNqJQs157CLoqowVwNc/6Yjrs5aNraOR8V4ixmR
         CM5XLTGwH0TEH+aw6ESCo080Jt1NF3uKRAjcVm/s9r0+zHwMXvjWjjV4vKwhDX2j2ki2
         FbwXCy5MniofKZJhh48cip1z4u/AW1svyGdUUo+/BfYLYl5I0/gRU2r4ffIZfPk+J6GI
         zDkfWCxmHUnPiqEACANeWCIOKiqUAD9aT78SFB8KTEFlaVVnZmVL3FHQVgUaxL+48uC9
         TLjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3RDd9czu4NvYt5b+VKMrtsls+BWCQYVB6ym3rvWB8ywvGOfA0szfr/K7vPFrLZFrVVO5IIhQDtDNy9w+QH7Kq@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2w/VonGa7GMslif6cw7rkYdovHltNoveJGvIrM70fed1ZtmOm
	Y5ds2DDFKbaTB1ALJjBBfgbp5vPMJkBU+9MFFD7MdXsdlkwYTNprgLYm/l+v6EYRoEvZmAOIbHO
	LG7nybtezF2YI+loBi6z7NsSIglppqjL/Tf8N
X-Gm-Gg: AY/fxX620dmtnaVqw1KmbAvFAwoEI76Z8PtHNw529zvKeTO9sFUh7lJGV5MWnARVnrQ
	9xXmkTf+3BRK8ORvgao4JIfUpJkcEV3rqunFV4KBBuOcvdkSU0X1ZDHcJcBEHoyCL98TQ+JIZ2F
	yO4Mzi9DNTEXEVe/yzpHZ7ftwMLYDGXdRQ7l9BYbcyPOV3l8WhBQBBwAYRk6CaBP1aDlWZjmzgF
	nTuFEVf0+PYOAzngBwhkbIgjuTYLEubq2IKIJUuaSdv8jUyxiw98oxtS9maN9Va0FJlf6vKSP2t
	oxnSdow5
X-Google-Smtp-Source: AGHT+IHqGWk88ovtC3TEuodNYX+bMcqvdaiZBR/imT8MmvR+sMpm1rfrn9QGmXdJQVUgOtHq5GsIR9y5lIaO8jo6K2c=
X-Received: by 2002:a05:7022:69f:b0:119:e56b:98ba with SMTP id
 a92af1059eb24-121f8b8ba79mr16811710c88.33.1768185358522; Sun, 11 Jan 2026
 18:35:58 -0800 (PST)
MIME-Version: 1.0
References: <20260111201040.162880-1-anirudhsriniv@gmail.com>
 <20260111201040.162880-3-anirudhsriniv@gmail.com> <3db927cd7ece9b0672b9e62eab64b951594470dd.camel@codeconstruct.com.au>
In-Reply-To: <3db927cd7ece9b0672b9e62eab64b951594470dd.camel@codeconstruct.com.au>
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Sun, 11 Jan 2026 20:35:47 -0600
X-Gm-Features: AZwV_Qj-g-Hn-yu4F1rRiaFK5tjlEcz8m4j6EVdmevlQ3RV8K5KL_wx3zDjzXrM
Message-ID: <CAJ13v3TmUQ8oQT6uwK_=rP7vWXy37Gzjmgv=cg_3HkgerPJNFA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add Asus IPMI card
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_183600_761419_5687651A 
X-CRM114-Status: GOOD (  13.94  )
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

Hi Andrew,

On Sun, Jan 11, 2026 at 7:47=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> > +/ {
> > +     model =3D "ASUS IPMI Card BMC";
>
> I'd drop the "BMC" from the model description as well (wrt the
> discussion on patch 1/2).

Yes, I realized sticking to its official name everywhere might just
make better sense.

I'll make this name "ASUS IPMI Expansion Card", change the compatible
to "asus,ipmi-expansion-card" and the dtb name to
"aspeed-bmc-asus-ipmi-expansion-card.dtb".

>
> This looks good in general.
>
> For the purpose of review I've started requesting that phandle
> references be ordered alphabetically, because it's tedious to confirm
> they're ordered by unit address, and it's nice to have consistency
> across the files. Can you please fix that along with Andrew Lunn's
> concern about the phy-mode?

Will fix this up and resend another series. Thanks for your quick response.

--
Regards
Anirudh Srinivasan

