Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F1EF531E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 02:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I+e7hsMexJg4a4gZwQemDX/leyw3i9/Owg8p2nuOmmE=; b=DCUHnY+Vxh10MqdgpALguA8hTt
	vXAIokRLLNk984z3G5H1ZXhxKZz4RbZjJ0h+E15EsEnmHSd1jlEwVopPb20KqXKlgH8spY6SuPmcr
	QbeSlbs2meKEnRJHv42wUsSi/JBs2TvDygCYF8MHpD+XoBcpsWF1lxnYXlcNWo9U/XuL+VCLzEp3c
	jCLDHv5S8dfO0akbCQ0+Li6sjdGiz1Mvibp66OuVKbuXIsfogh0P3XWEN48OQfH6VByazhUqP7vxo
	unOao0rc0iN2N/6gfkVV8MKmq+d0UmXKkKO20YhNgBfBWOC3v0N4Xlijv8dVCVAaVIwVkZVeKSOnv
	gR7dhKOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCTHE-0000000GalA-1eYZ;
	Tue, 14 Apr 2026 02:13:20 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCTHC-0000000GakW-10MB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 02:13:19 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5a2beddab48so4807021e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 19:13:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776132795; cv=none;
        d=google.com; s=arc-20240605;
        b=OUGoVaOuWpO9xr8d6zT++E69QbDfQT0VH3MvWOpQo2DWQ3FysZZb0OA1VJE8tB4Ock
         ZguV8AYLJckqww9R6zGxrlwljPusaHOge3jyhPQKvL6yF1/TikLFgjnbLQ0KiMmt+Keb
         t1cWw7zlHWwLOF/hFLvD+7OHTLBMIGNvZl0PwcLblTHnqQqyqV3CARnTllFXBSY0qivR
         MM+Io0USjrf55/HBL8jW7siSioVjA7Gr5olYpa2rt5Hrp1BQQkS6pnC/6pJE0CoXezsW
         8OSciN1j/9yNUGaRVBEozFpn8ERdZmkIDksBobwojbNToZ0Bot7jIKU5nfZMBoEzcSof
         ArFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I+e7hsMexJg4a4gZwQemDX/leyw3i9/Owg8p2nuOmmE=;
        fh=QzyCYhjsrXo1fjcv7IKAdQwU1DsP42Vj4Rxp3s6Gkd4=;
        b=Qh54/n1rVPNVqyzyIBXeBA7SJg0Hr/HcMFSMQalMK/Q/UBjaGr94auyqVm7ez2n74Q
         dkuri80WF+0EamfNGZu3UVEhwqhYhQsrWWdmyhXX6bZfY2XYonJ5plj9XJ1ZpoxoXWaj
         3bdMcJDD2l4w7zOmq8ULjbQHXXknXQSXjTgmK0hodUQcy0PFIIRI3GguSn+SXrVr+BoC
         giSl3GI0Liv6hErrSLeW2QGLOCTvFQ6nXIDSQfu53xvZY49PlPgnAaaBPGOicUmTU4xq
         rwJqDSi3hHqcLtGAwBG0NGe4ZTICu+9rSWiESRUGVdW3R1sxZIUeM13Q9ILvAouCWUsZ
         jjMw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776132795; x=1776737595; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+e7hsMexJg4a4gZwQemDX/leyw3i9/Owg8p2nuOmmE=;
        b=Mcg5yu9AMQcafa8x8uXvDcGkystOh33F/tiTh3jeVrzF7N1ReuE7N4la5beBqkTHaj
         bESmHVr3qdxJ5/xkWz/la45LT0+augjLXst3shqjpRI5bImSp1ZUCRnLClOd/4c9Lz3g
         0C+3kTo0jpYfdNaM5pFgZ/nlTK6nVm9Zc3wzI2E9vfWI0f78MVRX2U4ucG/RcZKUiLnK
         QfZxraSsbdyw/Dcjelqr/wJd5zAm9PrOB8DN+7EFBzETQw/vovBM74wOv92F+zlhSti2
         URnsk07wZ0vJxyJRZwUmSP9xbDOAcxG9yvOlsWSNCJmWlmqyBJalE+AlJJyH8hezAKvL
         9WBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776132795; x=1776737595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I+e7hsMexJg4a4gZwQemDX/leyw3i9/Owg8p2nuOmmE=;
        b=nA0FE/ble00CFNHhijhnIJR/s5imHSqHlmjsyIsDCQ/xX6UOCr93WdLFrNubUy02fk
         5B/JLnHIkbEkT3D+ut/5Nx4sPKG1nCttsItQNbDYtmHp6zGBLj8/HYGj6caubYq0ETFE
         qbo9fQd66OO3M6tajamInZhXEH2d1xbiQYjz2Jwff4yhIZZ5LNGRO0B1+z/Zs2rztji8
         tIIPYo08R60pkC42UyLAQOn9gJHymw5sNY7cME+IP1xMPCD7NYj7L96LECNKHMUIByYo
         GvAj/MonpJLyY6ZMEYWNhMq9VLxKBHm4pKcL8+oDGsByuAbRJj0cCvz9dYtcorsYOM9y
         HnFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/6VMXUzZHkIiyBq7SL9nyg5QM7QyXKzS6ZiiBvIuSjfX3ptQBwbHlyq70lZongaQiJZdn4m5eEmmGeIUi7ApWK@lists.infradead.org
X-Gm-Message-State: AOJu0YxnQeYgOXwiIejgLJhpZIpwzetwp1hv2RPgbJ2hcnq0mpBDGMbB
	MVFJgHsUXgEudlTlor68ezf5jNRqf/CCmt/SyCHBrbXCQwsXRAaZsYX6fnAe0kJQXIj2g+3xYnc
	QCDAJzifud+x5YLH1m1f+mX+zHK+GlHo=
X-Gm-Gg: AeBDieunO6cSVMRMrWWJvWxd2MLqh87bGg8TIOzK8tt68BpAJndfG9ySAO1OApyihPa
	QrFExbCqhdN8hWc5DJHPBgmZpyo/HEifp4HQe4ZuwnBHdQgtjBedL9vWFe9QPFHm0StSD8xfKVh
	puxcmbDNon6hZIdI2uaLPXsKWBk0NWCBDhZZpXCuX0gSprqJqEuiHccySymMMMl/6sFoQxtCohQ
	CCWbB0b20MMlv/HsjmiIn0SDWWAiOPbIMr1atCiKudvxUDIuPuQdqppwMuM83n2ffkwoIdyLNRs
	GTzynJDDc/e5+FU7PJV9jMOKQLZivNaHshVJ6s94I+8vCtPvuTTV
X-Received: by 2002:a05:6512:1315:b0:5a3:d381:2a88 with SMTP id
 2adb3069b0e04-5a3efe99632mr5305059e87.37.1776132795007; Mon, 13 Apr 2026
 19:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260327114653.593582-1-padmashreess2006@gmail.com> <20260407184455.GA3369046-robh@kernel.org>
In-Reply-To: <20260407184455.GA3369046-robh@kernel.org>
From: Padmashree S S <padmashreess2006@gmail.com>
Date: Tue, 14 Apr 2026 07:43:03 +0530
X-Gm-Features: AQROBzCYwV_IIq0oP35YBdligNvJel5nqZfvIfKxL--K-9W0cWq1dLbsYt8YGEA
Message-ID: <CAEjBr-aigr21LBV9-hMzwDGbfMJO0A-QwNP_WLJncuo9MSd=rQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: arm: marvell: Convert armada-380-mpcore-soc-ctrl
 to DT Schema
To: Rob Herring <robh@kernel.org>
Cc: andrew@lunn.ch, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_191318_324330_62F10FBC 
X-CRM114-Status: GOOD (  14.86  )
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

On Wed, Apr 8, 2026 at 12:14=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Fri, Mar 27, 2026 at 05:16:53PM +0530, Padmashree S S wrote:
> > Convert armada-380-mpcore-soc-ctrl to DT schema
> >
> > Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
> > ---
> >  .../marvell/armada-380-mpcore-soc-ctrl.txt    | 14 --------
> >  .../marvell/armada-380-mpcore-soc-ctrl.yaml   | 32 +++++++++++++++++++
> >  2 files changed, 32 insertions(+), 14 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/arm/marvell/armad=
a-380-mpcore-soc-ctrl.txt
> >  create mode 100644 Documentation/devicetree/bindings/arm/marvell/armad=
a-380-mpcore-soc-ctrl.yaml
>
> Please move this to
> bindings/soc/marvell/marvell,armada-380-mpcore-soc-ctrl.yaml
>
> Don't forget to update the '$id' value.
>
> Rob
Thank you for the review, I'll move the binding and change the $id in
the next version of this patch.

