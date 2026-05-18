Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E28CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 19:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i5Oh1fD1na/utz3Cs/1Qt7UzGSujhfOk0rSSTDdiTsM=; b=3MvpMU3giHK2icJAL55OtqRQL0
	OQvQQbJlFg0E4vlXFkUmUserHyo5963lrwqwjDyjVaPG5b/Ix1eCqfZQ1RchVWF0Upf9vEWM1VUAr
	rlrPP2H3Dcudqb+BSHlVCKiWpLLBQViTL1C/JEVhhhqSR+Qp3yWQcp5Fly6iXyFWInVO+QV7Ope1G
	TKhxVLNyP/lFRNHgOXUd7KWVv2uvqfnxKXtzHuasyEyTx5t0RZnuA+iGhcdyw9JGfi6yir/qjbZ4L
	I7irxXUdhrHqaRKef/Sum6H5LDYicdzoxYDg+LpPbYmRUvVw51S7HKpjz8DLXpnN+eFXDN4QEhIub
	lIEFvPZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3DA-0000000GdIG-1CCr;
	Mon, 18 May 2026 19:01:08 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3D4-0000000GdGE-1fQ0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 19:01:06 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-479f7e75a6bso937681b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 12:01:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779130861; cv=none;
        d=google.com; s=arc-20240605;
        b=S/zj1eooCW3N3Y8dtvOsWb198CjICREzWi7cJcWhLRLJ/VONLdKJmjdzs3+FKDoq91
         bNewj/50ihg93ux5qC3kSQm77mgQ9+qTwyk3Pq0Ckw6OLCXh07PtlzBPN9AxMMxO+Mj0
         SoUK5KX+yo0tlyTRgTPNiJ60SM6G+7gvZ/yLf8oEeAuvrIXZhPPqoihh7wR6/5SRrRPi
         l0IiKhiGL7DDtULDH49WqqhYlRPc85l7CesX253XfX+2KjYesBEvlDWrA9nkKt1wo+F1
         g9UkX0ysWaolMKJVUDKAwe1BM44lGn9lvwTHM4BqNmmIt7JuyK7QedZ3vucPLU8UtwSA
         r0wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i5Oh1fD1na/utz3Cs/1Qt7UzGSujhfOk0rSSTDdiTsM=;
        fh=lgs4J9o5rA4enEF/Kg2Njkem6Y88sQqhkXWTTBQ3M3I=;
        b=XO17z6V1iHppQ3R04hM0rATjjsnEFqPBuKNsZoQBWiu7LoFhJNmfNhLyRUzVkLlZ5h
         g6vb3X++8ISGw4bskmmsyufRESglkhvLFZqIYycv/YarvsbKliaY6RGgb76M0KNvujdX
         NQhvwZopVl0avYxyrLWspWoExeBEk+mtMPqTP0vmy4PwcaYr5jcP/EVPPY4FF7f2nrgT
         ha+ruXKcM4wyXypHW3l9LTOaNxIm8i6FaCNZB7Rvp/xVesVbAxWFBnzW1mkUdTEajhay
         1ZzLQpbY5RnQ43j2PJhHk/W5Eizha7iHFlIVe7mUY9tBt2NoLGR7IQNLqtSmiVOr/Mf1
         I1Qg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779130861; x=1779735661; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5Oh1fD1na/utz3Cs/1Qt7UzGSujhfOk0rSSTDdiTsM=;
        b=WYCT6A9M6wqFn8xTK6Sue4YLqn5tHrTcLO2+NDt6698AXm6smx5U+OqQ97z/AiXEe7
         O82g6SNgLeoMOcjutZ/xA5Ppuf8xmAY6psyUaNO+wj4TT+ggWYrqH3c2LRIxObhpFHBV
         tqEcpLlDtS1MTr1iOpFp+BxjtNUt/wB0pVGR02U4u5L18IuvBFy/s/Ub7r7CA+uSokeG
         TIl7932GHpFStKJq2moRl2ojfj0SgA1SioJhxD2gdanvvjAMv7GSK6tWwP+V2yg2KEdz
         tW5vC7xOCAv4uFKmeWEQ+e64yJH2Tu1BeWppe6RMV95oEbLrk8KeOL1GzedkdFbxxF8g
         MH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779130861; x=1779735661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i5Oh1fD1na/utz3Cs/1Qt7UzGSujhfOk0rSSTDdiTsM=;
        b=ZVyA+YFumNc41aqTDmMY2knfzJZHLdcTItcxePHShi68X2jMgC11mkS/W4m9GBVPB+
         nwHQBJ5FVgCZBjh0UuKmmmTzo0KLWfKZ44yQl/cTpOGZNAeLlwdspPDbD5uF/gzyzF8e
         De7cKCWrLypKFDjPzZOzbHetV0VbPYdQ++zLlojvnWQxqQILIgyjFiWRDrK8teuRv0ni
         qlj0q108MgdqTE8EEWclLSLMF/ohXe5QrONzSj38GquolUHQOwNNNCiwi5Z3/U2iXd2Q
         w50qcXcO/zZpAdlVpkp7st1sfQhQMyPha1siy5p+IT7JXNlhrJuxLX4IpWvZyafjxzHv
         EtnQ==
X-Forwarded-Encrypted: i=1; AFNElJ9w4XZNK+rrRZledbG2vcHk/XWAPFe8TegqCGzHwjhmc2xhFP0DW3UGD4ckhswmNezSbio5iQOgBVcwoM6dl8IM@lists.infradead.org
X-Gm-Message-State: AOJu0YyjOcVMBkugnnuKRDClnG146T6gfkI1eQUJzUSkKlCNz4cK96/6
	m/nf55NSKm/suqukHLis34HfJA79sKwtv9vXYhbgTHLZu1LRCuTEUyET2MwD0g704x+LbJsM5fJ
	1xb8YhKML3dU+zxSpDHMP8fpecuwsZvk=
X-Gm-Gg: Acq92OGw5POQAO+yuGOc6jqP54lH34KhG+zohVngx578vY017zpyVj4Zg2/imtBOZfG
	iGCJbA1qSN2BtoZRGgXEEDAZEw5W3ySq4WskUquVqZCcus8br2H3xFRZyde3LjDWIKuudFd9osh
	a81nXvxF6iFmf33Toic8DnZNEeR7zVpNuQPqXFHWhhy+YeltTHGIY4Bccqgk/x7wX7XXSct+hfL
	wYsmGUf5N5txehPY1HqydBmdaiE6klOUY62f/ZRhTODJ9Bn1YL1sYA5iCx2jOR1Hmp6yPEvSvco
	ezBeQEjx
X-Received: by 2002:a05:6808:e416:b0:482:6817:405a with SMTP id
 5614622812f47-482e57c671bmr6794827b6e.32.1779130860858; Mon, 18 May 2026
 12:01:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260430-exynos-mbox-dead-def-v1-1-a69176b7d0f0@linaro.org>
In-Reply-To: <20260430-exynos-mbox-dead-def-v1-1-a69176b7d0f0@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 18 May 2026 14:00:49 -0500
X-Gm-Features: AVHnY4KQIWjDuAullpsAk41jbvnL-5-zhnGtG7a0cMY6I8twms7NTNeEd50I88A
Message-ID: <CABb+yY2mSzd61m+sceQVCpPFMG+DB1LMiXjo4_36VwXSzMMFTQ@mail.gmail.com>
Subject: Re: [PATCH] mailbox: exynos: Drop unused register definitions
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, alexey.klimov@linaro.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_120102_439082_B358FC23 
X-CRM114-Status: GOOD (  14.98  )
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

On Thu, Apr 30, 2026 at 6:13=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> Leaving these dead definitions in place hides which registers are
> actually being used by the hardware, making the driver harder to read
> and maintain. Remove them to clean up the file.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mailbox/exynos-mailbox.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-ma=
ilbox.c
> index 5f2d3b81c1db..953e715a89b1 100644
> --- a/drivers/mailbox/exynos-mailbox.c
> +++ b/drivers/mailbox/exynos-mailbox.c
> @@ -16,15 +16,8 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>
> -#define EXYNOS_MBOX_MCUCTRL            0x0     /* Mailbox Control Regist=
er */
> -#define EXYNOS_MBOX_INTCR0             0x24    /* Interrupt Clear Regist=
er 0 */
>  #define EXYNOS_MBOX_INTMR0             0x28    /* Interrupt Mask Registe=
r 0 */
> -#define EXYNOS_MBOX_INTSR0             0x2c    /* Interrupt Status Regis=
ter 0 */
> -#define EXYNOS_MBOX_INTMSR0            0x30    /* Interrupt Mask Status =
Register 0 */
>  #define EXYNOS_MBOX_INTGR1             0x40    /* Interrupt Generation R=
egister 1 */
> -#define EXYNOS_MBOX_INTMR1             0x48    /* Interrupt Mask Registe=
r 1 */
> -#define EXYNOS_MBOX_INTSR1             0x4c    /* Interrupt Status Regis=
ter 1 */
> -#define EXYNOS_MBOX_INTMSR1            0x50    /* Interrupt Mask Status =
Register 1 */
>
>  #define EXYNOS_MBOX_INTMR0_MASK                GENMASK(15, 0)
>  #define EXYNOS_MBOX_INTGR1_MASK                GENMASK(15, 0)
>
> ---
Applied to mailbox/for-next
Thanks
Jassi

