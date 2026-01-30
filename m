Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA36E6BF03
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 11:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SbEnXixljZraid29u+TVBlnssG6MakYScyhKGxGYZ0g=; b=j83dN1V9ysHr7/hyhDmXDrEaBv
	Cq6TiBg7SMMpRWN2l6ZocJULGs5BI5Y1oaTbNiWNk/pmJCBsZ6ATWhlPRr1rMrPg1seHYKzeGfozt
	xhY21cgsVSUUzY4qi7OHzUgx6VTUNkzDaf0/Ir2zWNqIGUD5A4bVeeQdYxqOV0mGQDetFGZtFn7eu
	bsxh5zE206TfAi39I+FPohbBCmYjptX6GgSbhEq8Lt2gIlob6UBnp6BPSdnD+9y00TABxL4qsakRz
	Sswb4FA8DtwdMWirujeBQy/Z+bNrenVo7ZiaDL1FsxTucdHGAcp8LvgA9/WsNf0ncMmdbDZ7jQ4kE
	LaF49F1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlmgt-00000001QxW-2D0P;
	Fri, 30 Jan 2026 11:29:31 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlmgr-00000001Qx4-1o5L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 11:29:30 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-385b5174f54so16939241fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 03:29:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769772567; cv=none;
        d=google.com; s=arc-20240605;
        b=C3v58Y8FVbCX3k+yELLYeKH8v2Fm05qMF0/AiDdHvOMc42FreFxpSoS3hTr2WUsaJR
         02MlkIWlbgEK3hizdUcArpRKJ7glgSHY3XCIUEfUEoXtpqDk5FSuOKxOoEVVHHaXQJtm
         3GDCJUi7MNMG1+1sOPNkPNsz8TrmS4AZH2RUZheJ7Q47fff6fgPADKXe16mhhE6ScoGi
         CczlNTLmNMGCr8xvdL2m6QbB5/zDRTGR0I7rihGmZpQltt+JJMufnT4E9nJUh5yiH3+8
         09udhsykPVBfgSaPJLstXxzXqtjTIBcZHdm9Adz1M+jhPurQ8Pqk+ODCbplxwunZgGaJ
         UN+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SbEnXixljZraid29u+TVBlnssG6MakYScyhKGxGYZ0g=;
        fh=CYSBda7ZMPm/sO7TfJyQCzkUS4m3dBJhsRcL6lanh5A=;
        b=E0bo2S5X6oaaLMEkGiPei08h/vDnuetKSuV0VmwUBlKLpZborZ8U57DCvhYsY6NrFQ
         +jQ9G/6Rpa6GOZOXrd+OFiMCLfe4LrdPA1lReSHoa8kPs8JkCn8V/vMv1mPF92K5RC9S
         NsRGV9/w+waPQ1SdYkqmSbgSkYvGay8IF5ysOzwprbhRYT5Qoufh8A+f1RLOFsR/GSDk
         Rwde4eQd7vq+gBsseJwpogxg06I5guUBQNWZQjvF3hMYiBbE/aOgapr3veudsfgtBNDC
         I/FavnPRiLYrPjGUQThj9nYTmQni/noPA2QIbfVCDhP7ShIG/HcePrmAS+w2L7XPzPe/
         QUAg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769772567; x=1770377367; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SbEnXixljZraid29u+TVBlnssG6MakYScyhKGxGYZ0g=;
        b=azDxqo+sQ123OcDFWxjC9OOZqp41K5gBrVVhbZhcKnclTWZT8XNJHt1xbDgh8UR+rU
         mNlzwz2/DydLD1eP9tNwwCnnGWJ6OCo3pZFY4e41aJ/AFOmv0pGAGy9jiJzQfldYHMPO
         oFuTO9vkDOwZvl4bCMPwyuRmkvpzNzmh0F/OTzwzFgl4l8DPhezjPydqG+a6WCekTIBO
         vBbX8jAhCANj3pe2HswlofmDJnRBL+ZXlFMUVQxlIBO/fioXxqyAfSr5M8ZV0YqU6/sQ
         Rl6ABP1qe7ITvu2PhKGNn7hQPmnVNbZ17gsncwe4waeaeZB+fhJe77HHMjCoucBtHXF/
         mhhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769772567; x=1770377367;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbEnXixljZraid29u+TVBlnssG6MakYScyhKGxGYZ0g=;
        b=vY49tfku0I5Cipfql/ak3UHrVb3R5/Ozl62ATHeJiFxWiQZXs5jIZ5wTTs4ve1Ywaz
         ceQ0KvgyKs/MCGco/pGsUJMhesIjY9JSFufEzb2g3GBDEptNGkps7I2+qundho4SYu1g
         GqZAidsIRfbn3frU3Pk0UdGrOPvV2p1scJbw8IzogBgLDF7CV0xCsLmAUTgvGGOeFsNN
         lWnVwvmXg7g54cYQqxlRKA1Glszyw4S6jUHBe1cmE2Qqvpva6sKVkMs3MMgaWOTwXXrC
         gCYNFfgl3ACdb0dyOPK80TlbAGn+zoAtoX3fYJOn9Y1j7PtTW6yW5yPoLl3NFmnnWagf
         H4NA==
X-Forwarded-Encrypted: i=1; AJvYcCWmIfyXeZwEtkXNB5kvqtKgEpIAz31VNQxcvxE4XsFzkPF37UBJ6dcb+hinIsj0tjsxx3yaYVGDzYhrLuvhumbS@lists.infradead.org
X-Gm-Message-State: AOJu0YxmH5xhQHNFVcroLLFsj3NDgfd2X7kH+lnO7VEKS31dDfnMc4aD
	SOatD1m2s1/a6Sc/G64vANcE4il6d0lz76M0/yiXvUGZ8kfKz7U6pq/MV+K4leOuOxfy0iHnPhN
	8sB1suxeHRrZAGrmCkf+U2JZrMC0ascBBBjY72vht/A==
X-Gm-Gg: AZuq6aIQWXN6DnYZqrlqePwMY4rMH0J4MD96qJ+wLflpNVZ9Ae75VZv9QKwUkyTnRSW
	X78dTu82p02k5p7wRFviI9c1AtY1zm1hY3SD8cGcQadrCg+fpweefrHnxO+DMKUyplmDHNvhxC2
	w1MC+ddFIFzJKEQeg+krBQuEYnw+J2LacKixeTMJVSeOWj1yoF4RoG8u3vJMsILmnpapWM9oBwg
	HeykZWS8Iz31KM1XQ5ymN10OsqWuQQEtGcA1o/9QhcKBBGQOrXuK8YnNtzphnx6CH/OsYFk
X-Received: by 2002:a05:6512:224a:b0:59e:417:27f9 with SMTP id
 2adb3069b0e04-59e16429e70mr896593e87.44.1769772566817; Fri, 30 Jan 2026
 03:29:26 -0800 (PST)
MIME-Version: 1.0
References: <20260130051107.2130200-1-xu.yang_2@nxp.com>
In-Reply-To: <20260130051107.2130200-1-xu.yang_2@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 30 Jan 2026 12:28:50 +0100
X-Gm-Features: AZwV_QibZsm573nlfq_ooYxHiuwgVu5XH3YEh5JOtPYvggTnLni4Oi1IejkPYVA
Message-ID: <CAPDyKFpAiFSUXBahWzEbqPnyT_R9FFxryohCKHA=REdcv-vyiQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: imx8m-blk-ctrl: fix out-of-range access of bc->domains
To: Xu Yang <xu.yang_2@nxp.com>
Cc: s.hauer@pengutronix.de, Frank.Li@nxp.com, kernel@pengutronix.de, 
	festevam@gmail.com, khalasa@piap.pl, benjamin.gaignard@collabora.com, 
	frieder.schrempf@kontron.de, p.zabel@pengutronix.de, shawnguo@kernel.org, 
	l.stach@pengutronix.de, linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_032929_491048_1DB1FFD5 
X-CRM114-Status: GOOD (  17.26  )
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

On Fri, 30 Jan 2026 at 06:11, Xu Yang <xu.yang_2@nxp.com> wrote:
>
> Fix out-of-range access of bc->domains in imx8m_blk_ctrl_remove().
>
> Fixes: 2684ac05a8c4 ("soc: imx: add i.MX8M blk-ctrl driver")
> Cc: stable@kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/imx/imx8m-blk-ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> index 74bf4936991d..19e992d2ee3b 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> @@ -340,7 +340,7 @@ static void imx8m_blk_ctrl_remove(struct platform_device *pdev)
>
>         of_genpd_del_provider(pdev->dev.of_node);
>
> -       for (i = 0; bc->onecell_data.num_domains; i++) {
> +       for (i = 0; i < bc->onecell_data.num_domains; i++) {
>                 struct imx8m_blk_ctrl_domain *domain = &bc->domains[i];
>
>                 pm_genpd_remove(&domain->genpd);
> --
> 2.34.1
>

