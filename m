Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00894CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 10:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oYWMzc7dzXRMIQ4WDnbpQus1ZRBA7rO8qi5HTtl8Bo4=; b=mnUBSduSe59tk3RtwMGFpNVB2E
	TdqxyXF7CoYWk+wIueO/wKfGoS/D0LJCzI4HQUzoOg54hxHTuRk9Y/f2BwvTQemx1NG6nXVloR5UQ
	/RubbJedDMah8Uwy+wUH/a9ik2OXmBUH4vFCLBVbdkDlxuV9JnGLmZ5LMW2KVf2zxiOyQ6O0AwQVL
	rbSJ5t97VBznfPKCIbMvM+2/XL257YCiLlakBDxw0Hn0FTDQe1xuwI6bijNbi8kv0nGpMtddgvy5d
	VMRN4CuHxLBe9t5BPMvta9RMZyBX6gAKmxuXVgIFrS3cfqKIr0Z/YITEZKucFnVYRsp3arqKhM0rV
	kQjdGWZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCDoi-00000008UAF-3U0Z;
	Thu, 01 Oct 2026 10:15:08 +0000
Received: from mail-lf2-x11.google.com ([2a00:1450:4864:36::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCDog-00000008U8j-1xma
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 10:15:07 +0000
Received: by mail-lf2-x11.google.com with SMTP id 2adb3069b0e04-5b5e4f16f15so6217566e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 03:15:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790849704; cv=none;
        d=google.com; s=arc-20260327;
        b=AJzRCRcnJVgicj1473fyBYHDTCS3EuCirlvBcOW8svo0X6fAEThbXlQj9T2RWZR8Dj
         qNQhn0Yn6wVcq6emjoZ3XwfCqF2lyIMKHWvPnAOLhdsB53+/h3Zd88hwGhTprJOm1jVI
         j9hkOtIrwgZ3uOE6iFEakrZeP5Kd3W4bTVx9Rhaj9bDNsj497E3T82UbDWEI3fJm5fNQ
         IYrzHd1uDzMGzRxUFLWFhcv/b1JI0vuvbCP2HivAnQ8Yz1iNwlSXgTaEdb3LoCQ4/NsD
         4MnEgHmy7cKT3zhhga01tCe7UOAvDA37h6dWorppUJIJQibJvAZlf7g8Bg4gfjF8qlyx
         nSew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oYWMzc7dzXRMIQ4WDnbpQus1ZRBA7rO8qi5HTtl8Bo4=;
        fh=B0nElZgjQMu/PYfBmzT1sOC8YREAwFMw62wQcwd0VuY=;
        b=mnU0J1y4WPTQxUuYADIO4a33TIcUPIFMWlG530h4XN6S289h1wEcFJVxzX2csjR4q/
         HnaVLSh3SiYFAjv9VhFnhjMnJrthU4ZUiCpHeBXM7Pgvqq4t552/rTfX468/npbDSRbj
         P8B2N7w4ZetHo7z9VWEYJOs3bOUV1mfHlEsHvPWkDAXBBV45yvtoS2Y4dBeRmy924Zlk
         P8a7xk0ralW6nGCdusc5Nx/0sem1ZlwwfqzR3c3KipDWWX1I/6K6svsd74YZy3A8FsAN
         Oq9Tdvys+KMgiCVppoJICL3KuTQE6j4mSdRQw7lNiv2dZTmm+p6nwVszxMwGWu5+PqPp
         TlvA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790849704; x=1791454504; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oYWMzc7dzXRMIQ4WDnbpQus1ZRBA7rO8qi5HTtl8Bo4=;
        b=Tt4e7HmnsVQz90ijtpPuZveNKF5iIMQO7sbXQon6TJzkYKj7XJx050O81WRC8yb3dy
         aVdxLtzkZg5yfxU2bViUoutBW20cy0Z7ZCVeDN7U5LA8ow1FLLM2Saz0rYAPVdURs41a
         tzvwvt1mlRyNO+hdgBb6bYw2E81UQWZhnIgw5a7RHAvoN7A6sD0valQL96ukv0MX95we
         Sw+K6JK+7wNoGWmI2chw54beyrrSRSpKOneLcEziMpcE6a6QejQuMkp30QQPb8oDPsy7
         l3rVBKTsdTODbR51HAdUVz2oL5q4PrpMcN9GkKyPhRITdZtlizNIq5JVKGsXhDogRlnO
         uWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790849704; x=1791454504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oYWMzc7dzXRMIQ4WDnbpQus1ZRBA7rO8qi5HTtl8Bo4=;
        b=EoUIsk3Bd48VJuVOa1aMnPyrBn5c/BQHoMo2AqmgL4w8ttYvnVs/Mkq+N//zXyPanK
         gMhyCcnSK6UMM8aqoB0J3sjLJILA+MJxLdHqprTSuPZ77VX1KQPmifsiSuYKK+YiZ99i
         Zw5iFFKxvSc+DR5Cnf6XcucZKtkYLgQlC7IOMMP2xQd8eaWJ3BXszYgcS7Plt/UWEt+X
         w6MgaXKo8k3SK3PO2/C68AeEDpREgJIQuDlG/ZrY9IMR12G5ABVXPR0ERoLC/7QTI/3h
         OqjG9OF3bGUUTJOVVMPbMKKhyvXfkGpZPojjo61kmT6RZVkMm6HK8TnZwWco4aFyK3/Z
         p+VA==
X-Forwarded-Encrypted: i=1; AKwUvByCDsRgLXViFNpHSunmGMNesc0s6s+XVJiWP81T2LwF/RcMNyQs4XI4OpR12aMzGUTEW4CvVnKVqFZLZyugl0S3@lists.infradead.org
X-Gm-Message-State: AFq9FYJEwzAplDzMMKYPRcMg9sBFQ9hFBNuenXk8X/89v0dJuHNmnDfA
	oCOuMfgwyGLYjoXAznxwflgQI7EsWd4abUTv9qqCQZrvl1x3yH+eMiW1lvXgwkJGJHQm1PgISTB
	R2s154NbJFa05IHIOyx/zgc2Xp+uCbVk=
X-Gm-Gg: AYBFou3+huApO9Y2wsNvDYNFKzGaBu5RFjZkq1wCXFZpLGhSJDcVNg+tj/AC9r7x5BG
	zVovyzbk0Gsk7u4oeZ7UMyB/hbqaoZ9DsIBkmM1yXWhp2W4+7w1vm2x7ZZj6uwWUeek4t75fFmA
	ypOsbjSGnfemcsBENIdgqFL+y62htPH/xN62QeXK7nzWmvz5LsTLS335/KUaCpmH0X9la25JbSM
	ySJh2LXmPi+bkeWJ9Vr/sWFXcXc6WKgjP16Zjna8reGzcyzXcuQoWX6gz1+w+epnbbLRBBDVPi3
	i8ber3xSSZO6EfpHq4h2EqwC9Lk4+YGhix9+Kan4DutPqrhkkzyRNf/1ufXXFlDWhdiX8fVksWR
	7usoD5uo6+ry0GAzHTLYzY9IANHdqHmn4kIyZ/3KMhD9M
X-Received: by 2002:a05:6512:6d2:b0:5bb:784e:3df4 with SMTP id
 2adb3069b0e04-5bb784e3ee0mr282162e87.46.1790849703308; Thu, 01 Oct 2026
 03:15:03 -0700 (PDT)
MIME-Version: 1.0
References: <20261001081005.2209755-1-primoz.fiser@norik.com>
In-Reply-To: <20261001081005.2209755-1-primoz.fiser@norik.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 1 Oct 2026 07:14:49 -0300
X-Gm-Features: AclHuK-74KPyiquqCXZSrY27gWUyd7LOlkpNPte8XIS6tTUYVa6o1fJvZXPOZX8
Message-ID: <CAOMZO5Aibmm3d=9Ucro0Tqvyh_s3EozLM25axV3XxeLuG67PCg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] ARM: dts: imx6: phytec-mira: phyBOARD-Mira fixes
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	upstream@lists.phytec.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_031506_522397_D13FCE48 
X-CRM114-Status: UNSURE (   8.99  )
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

Hi Primoz,

On Thu, Oct 1, 2026 at 5:10=E2=80=AFAM Primoz Fiser <primoz.fiser@norik.com=
> wrote:
>
> Two small fixes for the PHYTEC phyBOARD-Mira-i.MX6 boards:

Shouldn't they have a Fixes tag, then?

