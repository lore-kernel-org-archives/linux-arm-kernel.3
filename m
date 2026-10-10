Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662DCCA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 02:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ol+wvlr2CdZCdXa+I/bU7xRVzRqJragTtCzufPOHHa8=; b=4kR9fl3MWAW407polCYG/XZILV
	8v2X97/TJzSMq3zPD6VJjHVgNUY2BMIVIredzmYV+nLwTY+3lgrQMGvK/wIDRfncvg+wgARpCLlo3
	AT8bXhtXp9Db+XrpnUvgsQoM57o8V+4iAr4ou7zSaFQnedznLw7g3Fuo2dQmVORKXoZ9w14vJe+/+
	K16Ak16DRQUKpjv9Z29y17HrnEwBLBvTMj1JQf5QIdgyJUwKX0syL9iNejO2/JnB7igtmn1K7eyb/
	N2tByXd2E47VjX9cFNO/4eyMGthTHs4QOrGprShNPAH/+pGViRTxpOyOdNQZiJpyMj8FmqiIUG/tX
	VuaA5BDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFN8i-00000007RQy-1kNm;
	Sat, 10 Oct 2026 02:48:48 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFN8f-00000007RQJ-49Q6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 02:48:47 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-381b831d535so255813a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 19:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791600525; x=1792205325; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ol+wvlr2CdZCdXa+I/bU7xRVzRqJragTtCzufPOHHa8=;
        b=e/qgQwqzf5bbAv3C8ZBP+/k4yPFunHlPsSMi+GXm1gylqXhQdcGO7QElg1rB+j21hm
         z2X9ZvpIuAu36rH70dxeeHYQ/JxI1tWf0xtFVBeUOh8VxUa6rQjQsppcNc16BBOQF6KP
         nXsYyLCVMyoccPHKiE+rdFqW/+z4HYnPb9isUYEyxqVYTdEjOQkd8FNl8ioHvuDxXO21
         YtG5UodLXQLWO7JxYhSSyUFqa1R5VNvruPhNgE3EdwCZgfgJXfnr/fGBgAnfs2NHdp3d
         w9kzyq2zkJ356PyKrx42vjf/pUHjM+Sl3aCb0bagDG2VXMHptiFc0tQgGs+NmOo6xkQc
         9aaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791600525; x=1792205325;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ol+wvlr2CdZCdXa+I/bU7xRVzRqJragTtCzufPOHHa8=;
        b=Q5ERxwr3/fwIM3qvzg7aBxRRnwTEQWpLfYqjzu+fmlyUMtIT6ZHwNMIXHW+ASGKA5u
         UcP8c8P9BFuSJHPOnMRv6dp8YMjkO5WsDKGvV3bu140AhO+mqsCp098EuohwLkF5WfQe
         BXzBqEA74fr06c5VY4XkPpjQN+QEcW3SGjNIArig5D3SRMmdCf/7FTaxAzyhcw5lElRT
         ZTZVjdzco7dHSumIZJ4EJoQJKOKwk46MH4bzraOolTt3tSYPk8ERDnUrDv1K1jge5igx
         LNFdtw4BtyF3cdujWM7gbV9EJW4U/6KmujXZrnuOpVl/EftrDD1Bey1YH2xiAT6P9tCs
         BWQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWD6072Ff26VmNlBugtA+DMo2CZpKvS1rFJLRb7PetaigAh1ayhdEvVRnoHGDHuv1nI4Z3f94DDi0dSjpBX914@lists.infradead.org
X-Gm-Message-State: AFq9FYIKvoJNnIwkn5+oFpr7zzsODL0Z1cSiWIpFtr4fYzAZeB8Jh0Fw
	qu8xyPmqKD/K6x56SLOVpI3CRQ8tQwP2S+2fTgqfXLNRKcMS7T5oYYjm
X-Gm-Gg: AYBFou3dzmJca++qy+ZF99EuP/QCupA1X3ltOeTy5pCUngbY7iLwGt4bIHJScLPJB2V
	DR6fk8cSv/mMXMsVG1M80Nt4cS3CEfDcDMxNIXi2w5FHx/97SU1GmYvJo1w8imTLSvSDq7iotVc
	PxX5ZogYpk/M6BkQoFSbRnrQZ5F1FlbCVmVTvca9lgNiEQKfBP01QNHRSp3axz09W8IdY6s5L32
	jEEiCk1wlGHNQ4+TRQhkb9KkaCHi8qeEKXwih3G08hjayhveBwlFOC07v3rHWUAwtd/3I6R/3e+
	Lz+YJynad74yHVjpkV7s+EG6GMixxZc4btTxA6M6nP5cffyMYdRZDYsIgfiJiLG5MXmeq1HTk/U
	+uV5kfiAv3om+9/p8bTs0MI6oPJyAZM8u94UAJMz0Elpe+t+0ARaCwpXwNTJxNmaT8dWoFxnjZ0
	HVoI1aKuA2DD5D/G3jIgpFvTMiOWVwHo0jaN+p+phl1FmI7n/tMDJdEW6rZeoZ02txTQhoiHvsL
	RnSdhtq73o4O5hkeNO4U7jRxGu6x8ZfO9Qa0SDoaiZER4lU8iAvHAzTc4gFX5JyGyqnxw3Y9rRi
	dxVVi0qPc2rTk2oIlLHUvRA311n8taAHzFtD7sTbWe1HG7Go5vk=
X-Received: by 2002:a17:90b:5887:b0:3ab:364a:9532 with SMTP id 98e67ed59e1d1-3ab3acc548fmr3728946a91.44.1791600525144;
        Fri, 09 Oct 2026 19:48:45 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed040dsm7675161a91.6.2026.10.09.19.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 19:48:44 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 05/21] ASoC: dt-bindings: Add binding for Apple Silicon Mac
 audio
Date: Sat, 10 Oct 2026 12:48:34 +1000
Message-ID: <m3VYUqb-SXeeNuWXNMFX0A@gmail.com>
In-Reply-To: <20261009-daring-objective-flounder-c0b66d@quoll>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-5-7b47ed6335a8@gmail.com>
 <20261009-daring-objective-flounder-c0b66d@quoll>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_194846_056841_56CD6266 
X-CRM114-Status: GOOD (  11.24  )
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

On Friday, 9 October 2026 5:17:53=E2=80=AFpm Australian Eastern Standard Ti=
me=20
Krzysztof Kozlowski wrote:
> On Sun, Oct 04, 2026 at 04:03:32PM +1000, James Calligeros wrote:
> > +    patternProperties:
> > +      "^dai-tdm-idle-mode-[0-9]$":
> > +        $ref: tdm-slot.yaml#/properties/dai-tdm-idle-mode
>=20
> This looks like you put several slots into one. TDM slot is for one
> slot, no?

The codec bus keepers (which these properties exist to support) only
need to be configured on one codec for the left and one codec for the
right. We use the "main" L and R woofer codecs for this purpose, so
the extension of the properties like this allows us to specify which
codec's bus keeper should be set up, as we need to support machines
with 6, 4, 2 and 1 speaker(s).



