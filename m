Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096E1CA5FAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 13:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTO9yBJ7Sd0NkFEBQ/8VjEUd1RTpjAiKlOI1jt7xIy8=; b=EYnoctXANOr98OKXfliLzOIz4M
	Zy7eCwsDqmTcuscz7+fyuGn85QB9uIoWpX/50f/u0PMrFowG2H3lT7sjRNctYFYbu/VkBHrYBaVw+
	Ju9Kjh9AnIOY0xW7wWYEgYCMDxV0e+oqDszuMEy+hkYa0p+qNpjnCDypIrJ/aNobG5Er/dLfaQ2hK
	HqxcNDSg3ZATS3CLRN4oUpygGG6ouFBSFPmh5KhdOkLLHc++g+FamgcFa4M1qiUtZGwmetL8VPBnS
	oQzQ/vRzuuOme4N54zn6vR9UMhNtPXlwzt4pk9wCuWiJhtccB7g1XAqSuwIWc4UkGDzxUrMx8S4Zp
	7HJszoeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXgP-00000003eH7-1U6B;
	Tue, 29 Sep 2026 13:15:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXgN-00000003eGz-2jft
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 13:15:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lTO9yBJ7Sd0NkFEBQ/8VjEUd1RTpjAiKlOI1jt7xIy8=; b=DMjHG/9+88jIy3msawGBMiUfS1
	f3ob7oz1ekXrxLc6J/4iGrB3DOB6kZN9kna75vi3okkU2aYKqoQkpag2QDUL3v8iq1LlCeF9gUNfo
	pUDVnbCAv5debykz/618xA7qZ4oIMaVektzrzZ2Z1jHvRXVguvTihuc4ODUn6i1TFMAI3E7Sr5faO
	OSs3h7aX+eGrYzXFpyu/GlEz6Z0Kr2okP8J645RdEvQkcTd9AgkXTEZM9VRzaBC+rbyVqIscpz3G5
	E0dLifTZp0lZXROKGw2u3cq/wvqfCS8povY+G3lNQxqchJQkBZZ9kkn0kt4nt57uxNUK0AV9egbfP
	emRvYXCw==;
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBXgK-00000002fKg-2cjw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 13:15:42 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-8198a3a54d7so822006a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 06:15:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790687737; cv=none;
        d=google.com; s=arc-20260327;
        b=lUcgC6mshE0b5J/skAb4mHCyL6XWp/O9qhj/imzIXqU2/8F9PtSbpk+O4Xy4NqqTIO
         7MfAmqj0hWy+TL1m7qR9C50rAMgaahhjO/cqRC0WNnqG1J2PCgxxSONxmJV68BqFv95D
         o9fje0cFplIefmSkKTQAaJkwA3Ga5oqhf5FOS599smQn8lqU4mac+oNzjRJEy87Br5sg
         HhS9ruCkDZEh2Oljlo1N2EJFQx5Dn+JPkaXhuXpkw3UsKoSTTLdp2BDHuS8SnWznA73b
         dGXADTJlkhlLqHJuupsIdsZdGYxxZnTK1x2uM7qvai+IGLcIvXw18uQqmSOks5iSArFj
         2y2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lTO9yBJ7Sd0NkFEBQ/8VjEUd1RTpjAiKlOI1jt7xIy8=;
        fh=AA/PZUAf4qvbcTwhK0TvnP/9Ok6nfGnfxvZLNQw8Ulc=;
        b=VwVJSStrcpJAvKLje9aA1RoZgGlXdZ9tMTj0ohgs5rnjCoViX9IseiKC4j11zovixj
         /ziaHfPHOq3DscDDBIFNibdtKiFYsHO5oqKhmu1QXykGFVnCKWkOORIEIGaFofT3LIGq
         QEPjEJF/Ey9qJ2fnPaQ2AZnWyHmuGaL4I9S9VQnG+7Fscr6F+LRpa5n0USuxBV/hwlIB
         tXxtHHINc6G+CzBpUUH+N2751jSN2m6I/qJXhlmTndHhyOam59A1YtOH/TUQ2M89B/Nj
         QAfp2C5i2U42rQjDr2UmpVzsZHoWuazgWiUKcnUH20YL8o53vsjas0u1tkQKyyDfE9pp
         n/sQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687737; x=1791292537; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lTO9yBJ7Sd0NkFEBQ/8VjEUd1RTpjAiKlOI1jt7xIy8=;
        b=rfwPpeaVmiHCRCnpB/iVM9qE58GIRWOeH+ZZnR/oo36rKOKo++sqNyqnx765xq01o/
         azubktnNzkQAjcdH6dKhXhbxTje7do+yRhoCzM2GwyprKQTPyyg2RxIxo4QhPVHgHzqD
         afmGXOkDRu8gyECv8KBtY/rUVyg0x1CXaN7RHfVjqvZ6MyJiAwxwLcTAhTD8iMN+1NjS
         PKcvG5GuURZF68l+eeHf5z9xsiZ4WkIZ60SI7WFjhVUeWB5ueLKTHyDsmTQBhildrKvA
         laYmwOl0GsKFwljcPMwK5P4uj9oxAHm4nuJECQb02rwTkMUUK/A2/V1/69fE54inyo/9
         vnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687737; x=1791292537;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lTO9yBJ7Sd0NkFEBQ/8VjEUd1RTpjAiKlOI1jt7xIy8=;
        b=cfM6C4X6E3Np1H3hLSQ1oKo4KnZp+TVQnGlbt0geHBdNhPRCBuL0PSErva0Q58RMg/
         AQ++LXgI5PJFSv7lgzVggyCgtQA/VEGfB0K7j5X3hZg7V7uRlpQjejsLI2+rGTT4v1Iy
         xVrhl4qhe5WoL5xRmLtRoDkT0WpgAMHQteOah7hINMph0wclE1KyGEwVl8+ASijIOJ+s
         5sXh+7bbADUaLD4GEpIlzJNTwt+AEdsDTdFTcidD5NKSyD/nU16eKVM+V/YUbt8x4yHs
         NFGkCHLsgD3fj13jwP8388wiXNOJnnsd4dAjPw4g6fHNfFpDXN21ctJiYRtkBi9+uB+M
         355g==
X-Forwarded-Encrypted: i=1; AKwUvBxi5qx5ICPQvr+GW2/tuJXkpEFbv50lSJbN/IjuxZiIUunFytf6DOBLgA4y+1pAZjxCP4r1Nm3nHDniC2LUGY9y@lists.infradead.org
X-Gm-Message-State: AFuF++nqRAxnNt5ceGAa9k2uPYjezGF32qcM12cnoRM21VhukL5uQS/H
	T9NZIlN6ts5Pc5hfHvfWAPzDEJg2Fjtw59n3ueQGPOBkjti+RMGDwssnYsnmjaZPa9BcaE2X+uX
	5woalA8gg5NuaRZqWPWjLKsCAmt2yFEmM49Uf
X-Gm-Gg: AYBFou1d07yTviN+rlZSPralHMZ66ip+ZMykXObJeBLkQEoFEoLNanpJxHpssiymZie
	IvhdyqwNO0gKRggPfs0tZUEvDtzZ5MG/2K9AVzqkOh1RB5fTBy/sXOMTXM+BTiUthN+ejHtO0Kj
	2BPHLJ6qBXZeHNXSSCGtklvOllOsfq9gU096oV5gCSgPWpGkxBqyt2g0X+NEQWjWTyXc/++V+NB
	8Tontmcw/ojeRj5iN77esNq/CIriG5OMJsxTSqu7EzulfGDICEmp1/k/KBqNPSCZfkQPUIjJH4a
	CrOiz3LsW+FxCzSuo6ODvu/ILsx8Ts24d9qjDc2/JVDFFwb4QdcKzm6Q6J7BojBOjv4=
X-Received: by 2002:a05:6808:15a2:b0:4af:aaca:7be3 with SMTP id
 5614622812f47-4edd8a63ee6mr1681520b6e.12.1790687737021; Tue, 29 Sep 2026
 06:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260729114312.3947300-1-chou.cosmo@gmail.com>
In-Reply-To: <20260729114312.3947300-1-chou.cosmo@gmail.com>
From: Cosmo Chou <chou.cosmo@gmail.com>
Date: Tue, 29 Sep 2026 21:15:09 +0800
X-Gm-Features: AclHuK-j6stgU1xbuVvm_ryZxtRewkbdHTBcaeY6_Bm9ZHOE5XgHrwabKhmUtJA
Message-ID: <CAOeEDyvbuRHXfeO989dvV06e=qoAYy_1xEgnicL=X44Q8YjuFA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] ARM: dts: aspeed: bletchley: Cleanups and second
 source devices
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	cosmo.chou@quantatw.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_141540_954386_544C73CF 
X-CRM114-Status: GOOD (  16.29  )
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

Gentle ping on this series. Patches 1-2 address the dt-check-style
warnings you pointed out on v1, with no functional change. The
sashiko-bot findings on patches 3-4 were driver issues already fixed
in mainline and 6.18.y; I've replied inline with the commits.

Thanks,
Cosmo

On Wed, Jul 29, 2026 at 7:43=E2=80=AFPM Cosmo Chou <chou.cosmo@gmail.com> w=
rote:
>
> This series resolves dt-check-style warnings, sorts I2C nodes,
> and adds second-source RTC/LED support for the Bletchley.
>
> Changes in v2:
> - Added patch to sort I2C device nodes by address.
> - Added patch to fix dt-check-style warnings.
> - Carried over second-source RTC and LED controller patches from v1.
>
> Cosmo Chou (4):
>   ARM: dts: aspeed: bletchley: Sort i2c device nodes by address
>   ARM: dts: aspeed: bletchley: Fix style warnings
>   ARM: dts: aspeed: bletchley: Add second source PCA9532 LED controllers
>   ARM: dts: aspeed: bletchley: Add second source ISL1208 RTC
>
>  .../aspeed/aspeed-bmc-facebook-bletchley.dts  | 1317 +++++++++++------
>  1 file changed, 903 insertions(+), 414 deletions(-)
>
> --
> 2.43.0
>

