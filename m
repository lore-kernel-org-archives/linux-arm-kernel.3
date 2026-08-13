Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CB6C5DF6A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 22:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRmz8k6sXK/ER/gcHUFE4e0+JlpkSGRojfQ+9B7tXcE=; b=m3M7YQUq5w+RhOKyoatitqeYwd
	s5TB7xBqXCGuYT+zvLsTKpn1tmdcJWNPut7b7CEMn4aq2mojsHiJfTFp5Fu/wSPyT2oAQZsHmM2J4
	rLgU+XPzJBk1rcaTq53uD9fksAzZDdeANm3wMlWMbr7QBAfj50CKVJK5oYBO1Cw+Vu2K3hy7cDHbS
	ce7RNNeMKFvgVxgf46R6MmGlN1FlRjr2SOV+fiJg4eln/rtWgIVvt6LjerN0A/Vl46TuHoMySNdEg
	LOi+TJsMN7jzSBrF0H/DCgCJ2omZpPf/Ag22fDO/OhOTUIXLaVnTAlLpQKS0lmifDSli5qhA+cC1Q
	SqoYEf6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wudZg-00000001gDI-3Q4K;
	Thu, 13 Aug 2026 22:06:56 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wudZd-00000001gAp-3T8E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 22:06:55 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6a156627e22so2528409a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 15:06:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786658811; cv=none;
        d=google.com; s=arc-20260327;
        b=RCLkMFQPm4A9FHZYS5K/Pt9muDlLWOuBbWp3lm2mULiHb/fsQ3rEPcAs0++o4NMSYs
         iYB7nPlQB4xZX+PLpwiTl2IWGiusOjcqQTaH1Me0nzwU/O9+P9cB+H7Sh/pXwhPZMBFN
         f+PeF0hcSHMb2SGzr70L7jKUeyuUxczsbPW8XWWCcDmJ2CvkUalGurBGzaVQH12WbSpO
         xnejP2bmsGigUhgxsbRC18Q/uztkOZC0t206F2YJvKViBkydQcuoPjN0sLT20mat5n0v
         GtZx5VGrzNR+mM/g8NZXOFH1udz921cX9/n+7J17EvwMNDRIO6B41zQH8bz807OvGn+I
         8ikQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qRmz8k6sXK/ER/gcHUFE4e0+JlpkSGRojfQ+9B7tXcE=;
        fh=CSSC+kL6+MWvQlyjvZrMWoFiaEjHuyLcD3apR4hTYms=;
        b=neKD/xJbom5oTgAStdYL1hxTrp6gu7gfNgrACD7MBvxVZj1mX2z9urp1uKQqx63gGc
         N4DvLnnRnSE3/QFdjAVxvAtOxvlaZiWsGAb0p4Kfbja/OyI/Frs3vICDtuEZT0EhDVSO
         2t6pmGd4lCvTiiyVE58zQnhE0sEXE2QgMRHK5P5rdboIfbztrMm9x0FcrDV/ifHfQaUd
         bCSeFys2/JRxcTAr8lWvKP8rzNOK7Yt57TqLuzojAWrgeAkB+M+oDIfdy8z1y91q0OK5
         CboNoFY6WcPumT7bdQMrcDCFMK7RWNVVPu39dJ3Ba73/Kg4qlyv2uSANSO6Ldye/ORoK
         ZUIg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786658811; x=1787263611; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qRmz8k6sXK/ER/gcHUFE4e0+JlpkSGRojfQ+9B7tXcE=;
        b=PnzjsGr9kE0zRWULtRGnSG1Zg13G60l2h5vD4z2D3h/U5u1H4B+saJMxDbpi0bJ5ob
         7Vg/RFOUtVB1zOzXjTYfo+NDHVYHvZ2IVxe+/XGV1GwAz7ksHkxDsUfCQ9N89euSVHoh
         nGVDjjCUbnoCcOXjSDizwljmUInslzpHeGKO7fs13ZbxFAjwLpE1ealY2y3z5bc0W6GY
         cmcsH17pOk/m6ZvEsSHGGSkpg6csOZvlLPKs6fzwxgJbHFEC0+JPRCm8REXfaRR218Po
         x/VDvlogVarLo274TGoPBZkXeWt6jD+Ku69/wDJ+LphwD0f4BXwaabTchAZ5GINfhsTf
         MJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786658811; x=1787263611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRmz8k6sXK/ER/gcHUFE4e0+JlpkSGRojfQ+9B7tXcE=;
        b=RBQoZdhtvLvjmuOO5v3LNQo4k/QW1XEDfAegEFw7low1GahOec+yMm2HNs816BiCz6
         eo9D4fJ5wK0k6GjgoGOlKs30N5iC9NvTKTF9NinaA2o0+tktpNZ7Cnu/HVKrjFIXhzj5
         pHsxY4gKcHva1ZyBNePtHYRKms8/z/DdDAIxz2u/9vlpcd6DAXgLDhYw7u6ZiWHuMeVO
         Znd4IVrC5Mzk4zleUUtfsCDiO2nD3phAIMIHzRLN5jFH2rJKbWwe40WDCD/D/qYzSQw6
         AG2Orw8pVJzleXVQRmsXmw/jSl8XglgnXrCK8kAeOv0wXDa7E7OEoqCGeV8OS5+7lLm/
         zg8A==
X-Forwarded-Encrypted: i=1; AHgh+RpigCSrHfTeGWPbZgu2GoALIxqOADFeu7AllFWjBzZZyHV5N7o/z4IFpwJOxrdua/PeolmexGzjlZq+uwcAKZrT@lists.infradead.org
X-Gm-Message-State: AOJu0YwaBeUYdb2zOOXzZNUTsaPUydyIbDuJ6fr7SX91WeBmFZu49oRY
	5TZDdXEzeBrycz9kE7W4OToVfO0aoQ+kbuCa8OiMCWfoSjJNtkxfaj4V6BxZJArZ4bFsYroxYs7
	6AfkIRSmsGXDjucbX/K1kXvfsPQM2s1c=
X-Gm-Gg: AR+sD13B7v39n+xcZcAdj7miASL486rZCf0dfE0Ol9E9W8hrf5k4Lxu0dSVRl3SYRjv
	uN3JHEm1hZqmDJ4TIlwhz0IWdBIrUCmsfuWEdAaoxGwUW9jwOerCrx/+qXiR9k3fv9v3WfZCEVU
	AIJEt/nLoOuvsOTIrhCNzyyi8eHlQ1t2xAHJcC2J0+uQC7ka3x8XZYL99HK4osOYJPt5tun+bDz
	bIr5W6CAXRkKo052R+P47LBj6HT8cyCVYmtP2t1Kn1XfZOp4VvzENz+15xhb3X5Tz+Hsdv4UwC1
	hUXNMjIXvfzIKTetF2B+1o1iyTv9dUbekIxyTWgduJqAoXVUQ6LAi5KjRb7O6puFpH0kC5AwwlY
	/EYkaj/npUCrQq8dpTb1Qaq4J4N7WuWzU2wYKOe8MAnbl3Ed144Cy9BOkKCEKKTTs53C+4/YFd5
	j2iLIDuVcCMtLpJzL1HMd1ADWR/9s4gAheZFEg25crc0ODbF4s+u9QF0JPs5E6NucrRQ==
X-Received: by 2002:a05:6402:5415:b0:6a0:de1e:c4c4 with SMTP id
 4fb4d7f45d1cf-6a38af28b64mr579658a12.10.1786658811142; Thu, 13 Aug 2026
 15:06:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260304041602.7539-1-rosenp@gmail.com> <e46362c2-085d-4083-96a3-3e289553d1e2@web.de>
In-Reply-To: <e46362c2-085d-4083-96a3-3e289553d1e2@web.de>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 13 Aug 2026 15:06:39 -0700
X-Gm-Features: AUfX_mxxbLVhx8tsxha-zvWQSeZmObFIhjixo3B6Lj81UBPnX02Dtw-Ochv0CiU
Message-ID: <CAKxU2N8t5cEuEPUwVTU3Z3rpT9VufjUzenVxdNerVxgBoa_nsA@mail.gmail.com>
Subject: Re: [PATCH] phy: uniphier-usb3: no devm for nvmem_cell_get
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_150653_888678_60BBFB06 
X-CRM114-Status: GOOD (  11.06  )
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

On Thu, Aug 13, 2026 at 2:44=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> > There is absolutely no reason to extend the lifetime of nvmem_cell_get
> > to after removal of the driver. Use and free right after use.
>
> How do you think about to increase the application of scope-based resourc=
e management?
I don't really like it.
>
> Regards,
> Markus

