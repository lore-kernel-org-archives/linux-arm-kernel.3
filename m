Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA98107BCCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4zOxxN5sMxEMhttmRH6ZENKMtvVQ6PbFWqYTavE0PE=; b=IL83YmyaMHiO0ZExFOjNYGooGD
	QqJAMJMwhL0pSQoPijjyXobsqOmfjg1r2oqapZ/WCi1x9bwRpU6pvroOeUVa+oQ9teZuk+z0jDuAO
	Q73mbkrhuV8iXDeWQRVkIvUMY2cT8htXs6+PAuoNRSRBwZmqmZVcI9jtccc7YHdyoRk2NtF+pICbo
	dRdk7yPKR3H/USDDf8H3wLdbjz3BnsoT14SMk8LwvBtSoha3W8gZ1vC2QsKppp9UTo8SBIaNS3PBl
	6gl4gv5eAdsU71CogvOF1o/Yta4wkcoxmdgkduW+LA14b8dn9LKkjnpclsZSjf7Ub1RNpXuTAusKf
	glEYxWvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15kq-00000000h5T-1xhA;
	Fri, 13 Mar 2026 16:52:52 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15ki-00000000h2n-1VYr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 16:52:45 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-38a3c62d7d2so18471031fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 09:52:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773420762; cv=none;
        d=google.com; s=arc-20240605;
        b=M3+dAS7WzPVT4CSu4FNA5SKT5+JHiW5+EemqkZsFnRtmFz1tJPhypkZVDksZBQM51w
         zRpc+8GotiEd4ccUENucG99R9JXJjlmREhtZUen2TVxbPtaMo7FAuCgaysBkIpim7jPR
         r4krXxvDFFaA7ekWXKR4InBTJxvtu6geuKGvb3irRV960B36KQ6fGzVnSCdqqHFPXmZE
         pYMGoM7lGF+sbxFZgCb1K6zQvmuG45GQE+Artr2as0NTxh11lu1H4LHoFVcuCwVktLHb
         7paKicB8ljKryOnMNKIZWUjLIBvKQm7ufB7bQ9N+zJnV9ZzbyNP/n5bzmAtOlC9aMHIY
         0ZUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p4zOxxN5sMxEMhttmRH6ZENKMtvVQ6PbFWqYTavE0PE=;
        fh=xP0U/vi3q+9ZXm5f8Ew2cuODi9fRfb6ayNmtQSCQA8w=;
        b=NrUUGrnQtDIh94m8GYIC5Ji2v1h1G15RZuN2GCOQjauHCWhBY/Welrf3hQuPGBMNsU
         fBG4DzUcnciwVwjlh9SXMccW1SRgEmM7b7refl47mfwcTZ166FankPXV/eAtZ9qs1rjW
         A44TrjcXaQqySbnyoR8CN1rPX9c/ELI8J7bOLrM279D+nXfAol+X2y1nMUNfc6Ho52NJ
         peWkLferE8HWcJwhht3R80s6NJpk7MPGiJQE1dAYyljD8/aLmq9M9sxTCynq4VvDAYvz
         P0KysxSPlRtZklju+JgI14VNWpZi9IvhFAH59uL/vrB3JoU4R8Gg3ZghddHV3bG/lP6p
         vSyg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773420762; x=1774025562; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4zOxxN5sMxEMhttmRH6ZENKMtvVQ6PbFWqYTavE0PE=;
        b=IUTHSXL5oC0Fd/2ezSJ5im59LimAv+GsYmjEkmQ8T8xWbJpImsKaxeLtXdMB39S7Mi
         jIGmMYFg23aHiih4AHQr843fPbyfoSnOrIAoeBOdqptXQ5DlKnVFTBJAsCN88rWasO5X
         QJGYlYWNssjspGRseml5s7JmfNSwAVcC9vSckuIl3qLP0Z4QNGPQZYk/m4+Z422rqGhE
         1XbqiAznE3bgaLY9u/+UO77Mjc7EOPmJZ+I1TbwEWBE6LkYlcerjHaz/9kDOyjDjHvYq
         eo98e++WqfC+6JaFKH4bf8KJoN+LjyZrvFWlwBtU84WYuFli9MoHn2v2m+S8luoldEpt
         ikUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773420762; x=1774025562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p4zOxxN5sMxEMhttmRH6ZENKMtvVQ6PbFWqYTavE0PE=;
        b=e+E1LC/SojEA/g2AM47vjwVxJm757IgllB9KqhGdrzZb/Q4JaukSaUvGMQ7ivwxLlD
         V52uf0AtEn19mI+7VEkIVlX0egzbltuGQPSJas7FMY8VTVCRgEt9tyTF4DtWkWzvH72o
         S4TCJhzFOt0K30FL0h1SUvvsSvSrn3E4w603Qo9xRhsnDM3hdzOfFjGtN5pb6SD7f6rN
         fa77zzkvrI7eeOfrKTl+k3EC2wPvRMLu922P7FJupBjJ47OfKslvbUwGIhxEjz6kqGpZ
         SIjjlZWLeXYeayvu1+0cI92I8UxW9ePY4qToU7Rd2n636KwfOFxO/kH9lf1zSr2EMB9T
         RUzA==
X-Forwarded-Encrypted: i=1; AJvYcCUQreEU90+Jfi9tStVVT+s7AMr/ynJwGQf6gQBNesYCs2QtFMtyI39147DNiWay7hIS+oKeqmb81qFasjgBBd/0@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5ABYYYkiTPKPdHIpjWYwvVD/mNRzFkc9EKp/Ov5Z9PZRNUmSi
	h+It/7MteXxBwKxmccGBLz5vJzkK9RAT1bBf9frP6LSw6a1RN1h+EiN2WhRGBSgL61SwD9yMW54
	y4oroO67LuTV5P8dy/hP5fpkR0OTVTRo=
X-Gm-Gg: ATEYQzwrnWehiS51kvcpAcYg3NlEE+wryf62/QcvnOfnKeEDyFiaXx4PpJVVPhizXo4
	PoxiPjj3WxDwW5bw/XMbBliGrytvIhGem8g5XpJPHEoaBlFTZ76V6/o8s2V/WoX9MuYR3+VL7s+
	I3mKCJ15Qoa22+XtF94pzHlNlyeHCZRmChn2cDfvGvwDqyXc6tvFMM5kIEVeX3aoPit9D4kbdFw
	Qm5Xtlhylmcb0Rha1ppCp0sgj/sy3EELYs2uNGf/Nqgu7l8vCBxi8vt78QE18WQJytOjFf0WeUh
	qngV9+4tSxJLWy47KjHxutlevSsZ/DMb5lFZl4auaxX7ts7rxe4NBoqRQQpgKNTOzMp2JBHi
X-Received: by 2002:a05:651c:2102:b0:38a:4e44:7a14 with SMTP id
 38308e7fff4ca-38a89824096mr11615721fa.35.1773420761766; Fri, 13 Mar 2026
 09:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
 <7c84625f82c562bb9cd2b455465d63a1a25bf19e.1772898346.git.stefano.radaelli21@gmail.com>
 <CAOMZO5C+USp34WQ9ap+N9ha6EgU7JgsYkRsLEW=ZdizbkMQvPA@mail.gmail.com> <abQ_d9fGarNobYdo@Lord-Beerus.station>
In-Reply-To: <abQ_d9fGarNobYdo@Lord-Beerus.station>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 13 Mar 2026 13:52:31 -0300
X-Gm-Features: AaiRm52CBpU6R9UhBbKbW5aUQPcGYYXwouM18lgYHobd5ENQYOomz0enfBALELw
Message-ID: <CAOMZO5BnuGc8sddmfhKJhFgWa+K2gExeRN5097794j48+Dw-AQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/11] arm64: dts: freescale: imx8mm-var-som: Update
 WiFi/BT with variants
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	pierluigi.p@variscite.com, Stefano Radaelli <stefano.r@variscite.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_095244_421843_2885953D 
X-CRM114-Status: GOOD (  10.84  )
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

On Fri, Mar 13, 2026 at 1:46=E2=80=AFPM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:

> Correct. It is not included anywhere at the moment.
> The Symphony evaluation board uses the IW61x configuration.
> The imx8mm-var-som-wifi-brcm-legacy.dtsi file is kept as a separate inclu=
de
> so that carrier boards using the legacy Broadcom-based SOM revision can
> include it if needed.

Then imx8mm-var-som-wifi-brcm-legacy.dtsi is dead code. Nothing includes it=
.

I don't think we want a dead dts in the tree.

IW612 has not been upstreamed, right?

People using the Broadcom Wi-Fi on the old board may still want to
continue using it.

Please don't break it.

