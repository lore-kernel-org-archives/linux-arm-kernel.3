Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16372D0D16D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 19:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/K6KAgx2Put0DT9sjsubOZBw59h5KUnRoaOh5hbz8NI=; b=uztxghJkXose4a733rCn6/4kxp
	E0/2PJXYv4BP/scXIPVzWC8xZeujeyDOQxgWg226MN0hcUadqR7AaA1iTywMtVq87mYzAumJDld6U
	xwcUz2Pq3LBp3ymxNUar6N3zGUdcAfWduU7/kQNUrlJofQ2ZF8c2tG1glOlN8MUE2zzuhthCnbADr
	wZWEDlZ/1Zl0fOo6HPPmDc9POfZp2SmVfF0xNUg3tzU2UR6USsj8vRShWk1wO0i95YrLfjXmR3RYG
	0TWLorDWfp8nj8m5nU657PzEnTJ0nBsT9esRbhGc9pANWcHJIrstlNpEjQSnBgn2KL8mJ2YBx5rTj
	Lp5Y7DUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZVt-0000000FZRy-0vLj;
	Wed, 07 Jan 2026 19:48:14 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZVq-0000000FZRV-2Sye
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 19:48:11 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b832c65124cso391441466b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 11:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767815288; x=1768420088; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/K6KAgx2Put0DT9sjsubOZBw59h5KUnRoaOh5hbz8NI=;
        b=E1KbUehw9XgJsGcBUtlJ73Uoy/4BX/xMQvJ4KWjMlinTcDQVBPh9L91SiznDKW+Svw
         TtY6rz08IEtQLyLKAwVfVwA1PibSvfrCFfHJx+3Bb8XFu0KtngmiWOharLMIpIm5sfJ6
         J5INiJP9nSre+4t0Jis5Y8HWU2jif/yMx3FFHIP6kJKFyXThmAf6e3DpIfPMRqzlnnxH
         U3tIg2AG2nsFeRpHuiz60BSHBC5nfRAhfBNbU29Q5X/QQ7utQi05pp/2f3VnsgI+fCpt
         k6tpaKDJwY9oovmJuDcdBGlmqZoMsLRZ6u08d1+FMsWCly6MV/z1MdEUIsLJMQo0sRwR
         o7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767815288; x=1768420088;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/K6KAgx2Put0DT9sjsubOZBw59h5KUnRoaOh5hbz8NI=;
        b=uOUnMz1HXXYItE+MECG0sJQEohbzXUfrBpNvrpkNUKi6tT6zuCpyDT3IOZyRV4qgC0
         yOoqxxKgpc9a6WixJJEa8oubhN+482LzC4MhzvSsvB2NZE5q/0KBTlnppUtRlUkEWEVw
         T0XAlyN/XbIBrv6pWskxX/EyzcXgAJLN9t23sWE5g6RJvc/+WHvWJ3l+icOmLrU04xHU
         BEbSCCALrs+1mqAfYiFsNLFwxwJ1brrqQozSnM1YX52Doytm4M78GN4kZRHd86sUe0NW
         Rc5I04BFtURxClNUBXYQBhJPqEeJP2ce6QYDIuO1WiNeqgoGXfFMDgiirR9xDpn/Lct/
         DxEw==
X-Forwarded-Encrypted: i=1; AJvYcCWICEzoNweB4Eux0ZHwgFeaqotjvLj7OL5ElH0N/KIi+iYAUmW0ZcdodCrGjlSCUqQSLjf7VrN0JgDP3CjtOK2R@lists.infradead.org
X-Gm-Message-State: AOJu0YzAF+T2th/Xpnw6mkF8xS3YIJ5CJ9dRFzRz7khru59YUTqRkp5h
	JZ8orw6q8157qtXQV3pkbvMwC13RG99TWVT1hwPRim3kczf/63A/lEYBiaH0+BBJSuTEarUTDKQ
	4eayvqef6uuhfS6X3g/21RFf6OQUA3E4xiWMrTe49ug==
X-Gm-Gg: AY/fxX5skG7fpK438iyQCby/TfeRssKEhq4Kqq0yhgHNRyTBVpkVU9DosVEmLxIPRm3
	7tW6wlARGyEbswErZdEHdFrp4xyMxqgnlMOteTnhm/lnrBiMI8keci9eCjrvr2RffCLcrbUkdN9
	wkqRU1Lp5I1Pd0xi2Zn6PHS13hzzd9q40KZ594bYdgKuGJ4KIFY2qQq7NLTraS7VYlSlpbdkNp/
	5yLUvkHGBr/qSPIE9zDLzfQUWj9eq5EoPSngn39dhGZZhT1WxUZZnIGXXfK0JDU1QyTn5F7
X-Google-Smtp-Source: AGHT+IFS8rYL/AwaODNRa7WfZUsg/Y0giyG2o55Sn1z5plGBNfdHP68B1+vhS5dmZFmSvNPRKxpxiwnrMPyF8mdrh24=
X-Received: by 2002:a17:907:6d10:b0:b83:246c:d125 with SMTP id
 a640c23a62f3a-b8444f4afa7mr340640866b.41.1767815288230; Wed, 07 Jan 2026
 11:48:08 -0800 (PST)
MIME-Version: 1.0
References: <20260107-ufs-exynos-phy_notify_pmstate-v2-1-2b823a25208b@linaro.org>
 <7c3c2687-12c8-452d-86d7-78b3168a8f01@acm.org>
In-Reply-To: <7c3c2687-12c8-452d-86d7-78b3168a8f01@acm.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 7 Jan 2026 19:47:56 +0000
X-Gm-Features: AQt7F2p6LRb1LMUUf4aCL3KFPPbvN25P8eOfMmuUIQfOW1bNMu_kGMWDfFVqouI
Message-ID: <CADrjBPrAr2QKej+aVQQua=DKEWNdkdLtPV_7L95Hj7L+kTv-Hg@mail.gmail.com>
Subject: Re: [PATCH v2] scsi: ufs: exynos: call phy_notify_state() from
 hibern8 callbacks
To: Bart Van Assche <bvanassche@acm.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-scsi@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	andre.draszik@linaro.org, willmcvicker@google.com, tudor.ambarus@linaro.org, 
	jyescas@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_114810_634025_CB9B72AF 
X-CRM114-Status: GOOD (  14.83  )
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

Hi Bart,

Thanks for your review feedback.

On Wed, 7 Jan 2026 at 16:57, Bart Van Assche <bvanassche@acm.org> wrote:
>
> On 1/7/26 5:51 AM, Peter Griffin wrote:
> > +     union phy_notify phystate = {
> > +             .ufs_state = PHY_UFS_HIBERN8_EXIT
> > +     };
>
> Should this be declared 'static const'?

Yes, good point, I can update that.

>
> > +             phy_notify_state(ufs->phy, phystate);
>
> Can you please ask the maintainer of include/linux/phy/phy.h why
> phy_notify is a union since it only has a single member? From that
> header file:
>
> union phy_notify {
>         enum phy_ufs_state ufs_state;
> };

Originally in v1 it was proposed as an enum. Some feedback from Mani
was to have it as an 'int state' and let drivers pass their own link
state values to support multiple peripherals. Vinod (phy maintainer)
wanted to lock it down to stop any API abuse (see
https://lore.kernel.org/all/aICKM-ebp9SMAkZ_@vaman/). So we ended up
on a union with peripheral specific values (of which currently UFS is
the only member, but the expectation is more will be added for other
peripheral types).
>
> > +     union phy_notify phystate = {
> > +             .ufs_state = PHY_UFS_HIBERN8_ENTER
> > +     };
>
> Same question here: should this be declared 'static const'?

Will update to 'static const'.

Thanks,

Peter

