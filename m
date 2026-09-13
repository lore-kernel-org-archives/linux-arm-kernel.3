Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C733C88E63
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 20:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YqPuY8bjxg2PMPBTTRCR7VVhfztLYnhGPDT7UUbH0mI=; b=WdOumwl8VY74JFI/5NHcCc4bqh
	ZRS8/jO9mORCreB3uWKc4X0uVESjp3UXR6hd+2qMd0dCxMPM9ZBVjpXSWmS95NeZMy6Jn5FVWEuGY
	KOm5On/NS/QejFqONG9f4HMV6KEhsFiMRHLN++lYRHGwTP0V6S3iwB/zuuTzKZcD8wujPXzN3dS31
	ZNY57f3VFsEHacey296FWxEHrz+6Uc8BfP7CHc7ITUHa2DGNWNWRzNMxUMU3W966szfLJm5Qn0thv
	pa/funOB/vaVU0Tw3QpF2nQ42oYK1L0MCTlHqSf3YmwCQkSyzGEdl4a+PAofVoLyYYGn/iJ7hHECe
	1uWeXoLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5qro-000000021cm-1vvv;
	Sun, 13 Sep 2026 20:32:00 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5qrm-000000021bO-1xu7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 20:31:59 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c2949ed8cc3so430192666b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 13:31:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789331516; cv=none;
        d=google.com; s=arc-20260327;
        b=cqKD45QRgLLJIFXueMvbaXynWgNy0tQOGHdfjohq9gwPaRYIb5OodCQaYtc6FnYSPM
         bROkiV5L5r+3pTdiTzTnAnReY4aoqxL2xSb/1XcvLwogmzO+148eXQ0owyhobdslVgCB
         TmdSWJI7zJT7xO4pKVywdZuCMMjhnOzx+lomt6ZzZDqvpEXjH3C1a779Tymy705H+mMd
         9w4kRD/D+2f//XOfOPZX+UzE/nYfIb6riJbcz+wXCmRS2ecH84FZhjcnweyqrzYc7pcM
         3TYX2WAh6dIzAQXXURytbCYbNxx3ieEqswdxOkrOpkiln8bhuLXtkx1L+VkaF1MRCg/P
         GXew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YqPuY8bjxg2PMPBTTRCR7VVhfztLYnhGPDT7UUbH0mI=;
        fh=BZZQ9l0TW5bhKeS7W9czDuEOe92McLm9woDvmEdn7y4=;
        b=olfRKddteS5pZwLaTVJAVWuE9mtiMLFCo1m5OI4oUa7zsnUaK/P3Un/yvEHCto0PRi
         0sRNmrd774xh8dy1T5y1IK0pXRMLlcn7HiObIcjQl3ERyxhP2WJT/WZUndz9TkRAPcxL
         +XkwL44eyynyU6Ax0cDr/wlG8DFUumSN6uL45zTf65aQpTrbJJFk0H4MRuQWWqsWiQ0N
         jOiZpEnwOiKdLjScpJVBVAWPKEQ9epZjAXNLQiIdIU0/O6cphZ79L89mzD1b0ezPx3ZK
         5PnQ70ODV2srpH5EAnr2EeV57qiAmhIZ6ptKeOEWsu95ofEHoEmEKoM6SFvai1rAbd9s
         MPrQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789331516; x=1789936316; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YqPuY8bjxg2PMPBTTRCR7VVhfztLYnhGPDT7UUbH0mI=;
        b=ik4vo+spq3uYEhWz4ls9Gp7mZIM70gBUYWRQfP6dvaDRyHYAjwlZWF7AECEEojkdJo
         5ANGXUES2M696t+7UlfYIZ7ASPoIxXVkZWZGrydqnauFMhlIrfwouZk9+DvrhMHGhFYQ
         Y3QmcJEYbyynFsWm2zxRiFveR4cRdnziXQyIi3diWk4W9Z+8x97pYZ5BI42wPS9mMiiE
         VDUwa9dNU/I4ejFlI1OMRdjsUw4+h/QgENMKSExfYXHebah8v9CN2jNfnUDBVpsvDWgx
         Kq7npd8Od1Ge+gZ4P/Hg/xMc7lGbstYPLopNOufA/LjuyVRrT5bu/mTZyv0+DmwSVtd7
         7HIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789331516; x=1789936316;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YqPuY8bjxg2PMPBTTRCR7VVhfztLYnhGPDT7UUbH0mI=;
        b=kXaSzVFghXJ9Rn18mycxujmJGRbZo81gOxlMXOYKshuWodMYw/hVvAZ0jujewC55mi
         D/+334wDWWlM9z0nsVp1UMQfrt1vpFHffjvBGx5OwsKkAw0ceZGV6CCH2tB95pM3XX2+
         /gyDJn3D51AwNs/JSiO+ntmtEQB3o90VP+W+cmYHbR4qg53q7+zq/9uKBRAig8eD6ohu
         wofq49fyUi+XR57Ug6KT/nP0a+VxHjZbkgpdpwXp6ifTMy7GRDcpUfnNzOErm4ktsNjr
         MZQAeUMb6B4rEBuboqG4D3+TpFJZYUSJa2Nn8gfN+mclzf4JAAaGz7dA6m6tGRDpqcSB
         WSBg==
X-Forwarded-Encrypted: i=1; AKwUvByGsSC9TdZWRzrMCcm0ssuxWITwhbwxrhktn8jeo4JHNLmrGF/CDeAcfvHdTo9+yKdHMiIuzGfDoPR3MUl3x4qD@lists.infradead.org
X-Gm-Message-State: AFuF++lR85SsKlGjErzkLHTIB6kDU0O+XXCWXzUdgFrvyir2yhzq1gRx
	BY6BYtopj0tn0jgp4a+YzkwApnfyeSpXkC+ec4ji87wX4tSQI7UNadRaWN7F86Qlz13a+yLiej7
	Iawce2PzGijWiE33vHGrsU16qkLxBAg==
X-Gm-Gg: AYBFou1CuDJRACuc/sU0IDva++EPzhoXonQ5Rce1aPAsn4T4TagE0tahI2hRPREit1E
	tCJkxvp+7P4t0r3Lzgv8adiqxXjYZEamqwGYxDqSdOmpuX9st2DeNm7QWecmrdMPEXEqievD0cu
	E4BEnX54N4KVFUl4aujpdJdB97y2W51q3Jzl+TSYHW31dJkqDvJptSY5ync9/ro2KLNi1/wg5hc
	5c8unJ+EplWoYHGZpurMP/oMQ5IvucozVieVHUdpZrf4AZVcqYDV/crZD6AuhgIpGxYae+XpVWK
	ps9T7IyBC/FBWaQoNGUyLnFo75UIEC9nilN2cezJuWMVbdbFAnhhUnd72+/tQU4aD08DKLlPw0q
	dHcSyydCKSekNXinKL/LSH0hzZeS2ijbabhzT7iIoVpzybuvAcmNwFR/sw0hstw+M9w==
X-Received: by 2002:a17:906:c143:b0:c29:4204:8dbf with SMTP id
 a640c23a62f3a-c2966559aadmr741799066b.7.1789331515865; Sun, 13 Sep 2026
 13:31:55 -0700 (PDT)
MIME-Version: 1.0
References: <aqRM17TZ0-5pd6Y0@sirena.org.uk> <20260912190056.42192-1-mhun512@gmail.com>
 <aqaKPEFt7fQe8QQp@sirena.org.uk>
In-Reply-To: <aqaKPEFt7fQe8QQp@sirena.org.uk>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Sun, 13 Sep 2026 16:31:43 -0400
X-Gm-Features: AcwNN1XzcLLgpV1RUYtG_pNLmmim_sFz6TTENWG2NHxxEf0dq49kcafrryEazGg
Message-ID: <CAGEsz8Gy5=4msSzPjvRAS88EEbZ0eRvpocu6iHQWv8-48J0dkA@mail.gmail.com>
Subject: Re: [PATCH v2] spi: rockchip-sfc: skip DMA cleanup in PIO mode
To: Mark Brown <broonie@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-spi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_133158_519533_488972CD 
X-CRM114-Status: GOOD (  12.79  )
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

Sorry about that. I'll send future revisions as new threads.


2026=EB=85=84 9=EC=9B=94 13=EC=9D=BC (=EC=9D=BC) =EC=98=A4=EC=A0=84 7:34, M=
ark Brown <broonie@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Sat, Sep 12, 2026 at 03:00:56PM -0400, Myeonghun Pak wrote:
> > With rockchip,sfc-no-dma, probe skips allocating and mapping the transf=
er
> > buffer. However, controller registration failure and driver removal sti=
ll
> > call dma_unmap_single() for that nonexistent mapping.
>
> Please don't send new patches in reply to old patches or serieses, this
> makes it harder for both people and tools to understand what is going
> on - it can bury things in mailboxes and make it difficult to keep track
> of what current patches are, both for the new patches and the old ones.

