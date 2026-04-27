Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFFCFF885D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 00:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugOVfCCiJp+93ixYgWWnYCXqvdHveCQmPGZim7XNpME=; b=U6+ABJDwzv5Hz8Cv56Z7sIUnxN
	mW+LiXmqsFrisDrIXxv6CQlV2J1T2FGbxUcVPmcLDEKC6GibKIEZKmtR4x+9+Oq+Q1UZx4lG7sWVB
	yDzl3NgeARmI0k41Ea+FQnDyOAjRJSTmlb5LZiGC70/3XRsIBoAEnfyoq2zq5/48Azyh7KsrkA3wy
	gekFAd1pFkeTBUbJ5lISVDYS8hr2y+sEO57jCpFhGAcgsHs6Fh129+oFlCZAmu3+sYFsnzVWAMvtX
	O0fNm3wbCaV1sg5BJCyUxVUaJNmOX7kBHNZkxzs+/LeknW6Lj+WnYNgSJcPPhGkBDEvUQgMB9KsY5
	upZAJzOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH9hF-0000000Fxta-0FdA;
	Mon, 27 Apr 2026 00:19:33 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH9hB-0000000FxtH-3DAu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 00:19:31 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-35fb7c1a455so3555489a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 17:19:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777249169; cv=none;
        d=google.com; s=arc-20240605;
        b=Eq4hhnOXN/SUMxr1DNNiF1nBeUOc5RILaFPAVO66GCR/+437pgJCLYDJpNdLFAz+B4
         ebgWveQJtQ49BGtNu18IgaMcnzZB+mzvMQ/lFdnAVVZONFBGHT4hNRg3k7JXyp0rkGPT
         HF/y3791LOXnBfimhttxQsed8dpYyhTAG0TERqzPENWwzkrjKMo/dm2r0o2xzc4u7py+
         le+Ybm0V7w42feOJBCMywfUP/NC2sZaMb/32+4hWRt74UgvVP/+9tAghp8xyXphc6Rta
         GZbJVRH0QqszKwXWxFyb9x1OnzfKxxuGiiZvdTFVWLOijlMXLiuQPS+r4/K3XZoWhDTQ
         3zXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ugOVfCCiJp+93ixYgWWnYCXqvdHveCQmPGZim7XNpME=;
        fh=UMNQxh/BFjuhkAeG39SdlDwkQBbRYDP/ebguhKSmTfI=;
        b=lqapWJ00H/ELAqZm8fKJ4w9kKahSAxmvfFqmK49rnvBOzc3M+6v+5haGSbbR0+DKfm
         71zN5YbkzN83lmZuCMoGE86cZ/LRFcxWHv3hhFpFjvw7hTc+tKYDBHqepRgy3UlKhtSV
         ZOH4d4Z5zzibSIexGOvh0ei5S2UuUGNCd4K5u8Khz0Au3gFUngX/Uq1Oa8WWJY/jS1Xv
         GT8bfJl/BscJlOvVo2Y2Xw6asll+9Av+1Bu3kqLHx9tpwmXj/WQZnu28K0qrjyG3nz1D
         JAzQGxKnlv2OmecaXjzvH6IoyXZV0PKntbzgmfrwfq3elzqJMj1pvviydKQtxfRNCJAq
         uHsA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777249169; x=1777853969; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugOVfCCiJp+93ixYgWWnYCXqvdHveCQmPGZim7XNpME=;
        b=r77sPrS02p4p3fZV168/iXfcZPVoK/JAfOuqVHqycCnGyHEfj6BqvRvdciP9d5E1Bw
         Uuid0AXDok20GjhIXmM4NtkhxlsAvWN0OdH/AtVPpqX2r/AXgx/tgkVqZt9TJ8/I816o
         E7q4wNIlA1eWf0UD4y2cS6JiQXsDrDwdgMpWSztXOsaeNgiE6JuP//Fv886TXURBic+c
         ajIIO9//jDBY8Q7OJ1qzl8QB+fvzWtJffoXxuAnJguSjeCnxrX8yNdnlcbmn5rAtlqHj
         Iy2b/PcuAGjchFL6Wp7tVwMhUwtO7IGC+PWhPHCGg/dfJCH4J0QxnYITtF5AlORSY/+N
         feBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777249169; x=1777853969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ugOVfCCiJp+93ixYgWWnYCXqvdHveCQmPGZim7XNpME=;
        b=OvIi5OEVVbrSH/+W/nD8qw0daqP5U7AVg4bPrIm/e/sPf7AnaUfyiIbp68LhDObol2
         dZdlCgLdbRKoscLrdz2Plqu/tjspcIdFFnQTKNyXVYy5J5UvM9O3OlPMatkGUu87WqCq
         I+y2RvLHNC9ysfZmuqbHvHvxFHXBS50L/MScBp+awx4Bwe5SrDDjovq/+sUdzTAbIUxO
         NLa7N4I5LqLUcqTXuEtRWxutNamnmm7ysHbTGpdyXj6ojmDZ6DaGNVxxARFLFcA+geDL
         OH25d640qE695cQ50P3lHUoaZuspfvF/wD5pMSKFi0KWGe34UaFTCuuCGjO85z7P9yFk
         gvhg==
X-Forwarded-Encrypted: i=1; AFNElJ8BzE7hI4vuHEj+xclgMZBxM0BJXBImlvMx9P7wrDlIpgIbGn3cXK6ftDj5T1eXO0AJpidyrsex0Ugb2xCEQ7dP@lists.infradead.org
X-Gm-Message-State: AOJu0YxbiZNE0heNnJXkkcvpq0tlVB4AwOyPBgxbAZQuxbTocfuGYHg8
	QqNfNS+Y9ZhqnhQUYRN/DaWcb4FyHgDr4CkbndhRNTUFSNZbKjd7Ep530vtYumJz7heoR8kviyx
	/la7KcTU9rOhKS6LlFg99GtSJ6OfH8wA=
X-Gm-Gg: AeBDievnPz7T1597N6l6pSEfAj22oZyk1c19crhblbxwqsjF3PNpErNzfH9jq1Lyhg2
	aR0Fnz2/uMWBBcxNDsE1kF58RuaBLReaRAvaiUp3c2a8PKRzLOCtVtYCSWsdewPqbZ72T2dMN01
	DcKHmMv2VlWQucI4NJFYiFJe7a2DRcteSCjPlnTicILQ/a/DvQPZNJvv/8IP2lc7t1WPRK1/uwL
	5Ctviqtm/IEG3ZMBqFU32nz/TliixJ28xZFvcfhksVNmucYRCQcC2O5FY/9L7oVXzgoNIP3Fgb+
	Bz2gq/OkCVdF/emQkcrXT8vANGVAkHI/86QitdDnvY/l56E=
X-Received: by 2002:a17:90b:3b4a:b0:35d:a4c0:a0ac with SMTP id
 98e67ed59e1d1-361403d61camr40703643a91.3.1777249168661; Sun, 26 Apr 2026
 17:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260417021858.6582-1-phucduc.bui@gmail.com> <a145db93-a8ad-4bee-8404-21f356d7d4ab@kernel.org>
In-Reply-To: <a145db93-a8ad-4bee-8404-21f356d7d4ab@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 27 Apr 2026 07:19:13 +0700
X-Gm-Features: AQROBzDh5S1ZBzuVxFYQ8RBWiB9vcWv-M3KhV5VA_7nj_DMjt8E8DfNhVOVUkdY
Message-ID: <CAABR9nE_vwzWwZ=2bbwTYgEtp=SGDnzVUA5Y8jp7gp-Ky8MN-Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Remove the redundant 'type: boolean'
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nick@shmanahar.org, dmitry.torokhov@gmail.com, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, lee@kernel.org, 
	heiko@sntech.de, gregkh@linuxfoundation.org, linusw@kernel.org, 
	zyw@rock-chips.com, zhangqing@rock-chips.com, gene_chen@richtek.com, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_171929_836578_EBB5F0D6 
X-CRM114-Status: UNSURE (   9.99  )
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

Hi Krzysztof,

> Why did you change one file and ignore the rest?

I'm processing the remaining files with caution. Files without
significant descriptions or context will be updated in the upcoming
patches.
Those with specific descriptions require deeper review and will be
handled in separate patch series later.

> Why did you not mention previous feedback I gave you on your patches

> (some time ago), that there are TWO TYPES defined for wakeup-source.

Thanks for mentioning this.
In v2 of the patch, I reviewed the previous discussion between you and
Connor regarding the two types for wakeup-source.
https://lore.kernel.org/all/20260316034606.11304-1-phucduc.bui@gmail.com/

When moving to v3, I followed Rob=E2=80=99s suggestion to use true. I also
sent a follow-up email to confirm this approach,
and since I did not receive further comments, I assumed this direction
was acceptable.

https://lore.kernel.org/all/CAABR9nH3hr+Y5ksD0cn3Gd9XUvmb07X7zJw0b4k_yVbnAu=
z9=3Dw@mail.gmail.com/


Best Regards,
Phuc

