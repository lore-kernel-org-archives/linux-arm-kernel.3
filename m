Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D94FC02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 08:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zAUtyQ+0uLQvtoh7VA3lKvtKY7elMPWjYH/V5sBZpQ4=; b=CAzByhrBWkQdg0rSsCpwdoD5CX
	+XEYIaYgGzjHL8yGjUdYp3Rd4rSb+07WKPrMhcugXOWJ50iPCNfgbmFMzsV0ckOjhpVUoiZKLf1By
	qxlLiFv3OKj/zo88jHFC8jY1Ulq32TW4OaHewYizbqP6V1HT3cmxl4E6U094BqcTBIUGARLnSgHNo
	zlVQn3+c0IVhm/n5ecf+nY9FwZx0n5H0Wf+drTE6xKeERqZyp5eLjKsVHigiVfGzlvdL2iKZsipll
	TYR1t5ABOKbZYTOcl6oPjEcyfjJJ5nHZSKjzPJ26Vgu+QZxvLuPdziXG9bEiesOvLlOUHbewHUPLN
	zejoB/1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLe3-0000000EHNm-1OG6;
	Thu, 16 Jan 2025 08:54:31 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLbz-0000000EH7H-0xAq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 08:52:24 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-3011c7b39c7so5959221fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 00:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737017541; x=1737622341; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAUtyQ+0uLQvtoh7VA3lKvtKY7elMPWjYH/V5sBZpQ4=;
        b=hAK7awlzGdS8Z9IkJJPViZJE4C8TKK8BKzQ6QufADa6rO2LcEghgwwLJt+vyfD5lc1
         EhlHC6poJjTQa/SQwBq64DOJvHkr1Z7exrsB5Cc+kWt8CEXPsNQMNMzNClsGqWcNUehP
         eNGrFe1yRYeewi4u6KvIbKvL+J7Dqb9Wqd97nM7lVv8jb/sqfSdXVXD+KKbKYIiS2dRf
         7HemZ9dyHmBFDH6Ppwrr7nYWmgZMJSZt3kFzz+1I0EqOWlTFQ2ZVIBk9dl5GpCUF2VWK
         Y+esRIX/sl5aqxHUEooxJBI99kgGCgBjflljhc3QIFsbYHqZcEsP+3as9HN1CHtgIiQY
         zkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737017541; x=1737622341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zAUtyQ+0uLQvtoh7VA3lKvtKY7elMPWjYH/V5sBZpQ4=;
        b=lSHVP6FzIO01dV3f150Wcl0qW7DGUMP6ahArAH166aB45m6iG+1okxNVKseh0LEtxh
         s7CebJWEjR/osB3uMXRWrNkBbKgui57wqenxOOoEraOgYsqbBx4O0qONGYtfqtUiwucO
         fgIMMhnjDwXUjqeePgI0V6z63dLJKtgriiZ8Uh0/588zzjHbIEs1hXNKnDcQdGrRHjPd
         rt7uDNZD4yheg0LdMGzI0XWHYPdfVZVFwdL62EhiDLtKJTc70R6en0lhVdQYmg4eXUEi
         Ar0py92hXTym++PnVEkKKFCQXMcm3nPlElmngn3703MFpCJYLM3mGdXTp6Tkrp689q02
         t4tg==
X-Forwarded-Encrypted: i=1; AJvYcCV0hLQiSaSICNWnaaVSeevkPDPf5U71JJvhOoG0V3zBpiyTag+KAdrX48xo4/XmMXukF3XCgzOCDFSiIrMrYMg2@lists.infradead.org
X-Gm-Message-State: AOJu0YzUs7smZ8oaL4qndiFt8+UA3UuLZBdu+ieAeTBT/9b7d7muj2uk
	XhOnHwBW0ptS4ebIaHmYCqL3Rr7QQ0WrYJtytXz/+TQ2N4Vwa0Ze9VBlKPOn/8jdKM9LOaj72zv
	f3JMiDvJoIf6BKoZ5ONuu9t3PLOuEoVLG
X-Gm-Gg: ASbGncsww96b9q0SREiPcQJYRAezThuY8GKUy7QTMZyUWu/mqO6v5UPQRy+yRmJZKaE
	9Hfvk+K8obBXZKnd2++fT4aqv0smpBkqx4rFW8w==
X-Google-Smtp-Source: AGHT+IERCbAaD0M5Y9SM85jk5clNOfZT04do4722yH5mwwpZJo2wuqBSFTzAaWO0/vEKFrZEjdW9aDQ5LPy5SvtlMwA=
X-Received: by 2002:a05:6512:15a3:b0:542:2f5a:5f52 with SMTP id
 2adb3069b0e04-542845b9037mr9528748e87.13.1737017540615; Thu, 16 Jan 2025
 00:52:20 -0800 (PST)
MIME-Version: 1.0
References: <20241214091327.4716-1-ubizjak@gmail.com> <25eb1e35-83b0-46f4-9a9c-138c89665e05@amd.com>
 <65a1d19e-e793-4371-a33d-e2374908d7f8@amd.com>
In-Reply-To: <65a1d19e-e793-4371-a33d-e2374908d7f8@amd.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 16 Jan 2025 09:52:09 +0100
X-Gm-Features: AbW1kvbmNHUA99Y_rC7F59MIS_A75PDQtUYNHaYZC64fWzu8F9D0ufvUl_rINoE
Message-ID: <CAFULd4YKGnOwumpUeW5Yyr-G+BmC=LUSVbFWg74GC9a628VN5w@mail.gmail.com>
Subject: Re: [PATCH v2] mailbox: zynqmp: Remove invalid __percpu annotation in zynqmp_ipi_probe()
To: tanmay.shah@amd.com
Cc: Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Jassi Brar <jassisinghbrar@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_005223_270302_E9ACC1ED 
X-CRM114-Status: GOOD (  26.77  )
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

On Mon, Dec 16, 2024 at 6:47=E2=80=AFPM Tanmay Shah <tanmay.shah@amd.com> w=
rote:
>
> Reviewed-by: Tanmay Shah <tanmay.shah@amd.com>

Is there anything else expected from me to move this patch forward?

Uros.

>
> On 12/16/24 1:16 AM, Michal Simek wrote:
> >
> >
> > On 12/14/24 10:12, Uros Bizjak wrote:
> >> struct zynqmp_ipi_pdata __percpu *pdata is not a per-cpu variable,
> >> so it should not be annotated with __percpu annotation.
> >>
> >> Remove invalid __percpu annotation to fix several
> >>
> >> zynqmp-ipi-mailbox.c:920:15: warning: incorrect type in assignment
> >> (different address spaces)
> >> zynqmp-ipi-mailbox.c:920:15:    expected struct zynqmp_ipi_pdata
> >> [noderef] __percpu *pdata
> >> zynqmp-ipi-mailbox.c:920:15:    got void *
> >> zynqmp-ipi-mailbox.c:927:56: warning: incorrect type in argument 3
> >> (different address spaces)
> >> zynqmp-ipi-mailbox.c:927:56:    expected unsigned int [usertype]
> >> *out_value
> >> zynqmp-ipi-mailbox.c:927:56:    got unsigned int [noderef] __percpu *
> >> ...
> >>
> >> and several
> >>
> >> drivers/mailbox/zynqmp-ipi-mailbox.c:924:9: warning: dereference of
> >> noderef expression
> >> ...
> >>
> >> sparse warnings.
> >>
> >> There were no changes in the resulting object file.
> >>
> >> Cc: stable@vger.kernel.org
> >> Fixes: 6ffb1635341b ("mailbox: zynqmp: handle SGI for shared IPI")
> >> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> >> Cc: Jassi Brar <jassisinghbrar@gmail.com>
> >> Cc: Michal Simek <michal.simek@amd.com>
> >> Cc: Tanmay Shah <tanmay.shah@amd.com>
> >> ---
> >> v2: - Fix typo in commit message
> >>      - Add Fixes and Cc: stable.
> >> ---
> >>   drivers/mailbox/zynqmp-ipi-mailbox.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/
> >> zynqmp-ipi-mailbox.c
> >> index aa5249da59b2..0c143beaafda 100644
> >> --- a/drivers/mailbox/zynqmp-ipi-mailbox.c
> >> +++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
> >> @@ -905,7 +905,7 @@ static int zynqmp_ipi_probe(struct platform_device
> >> *pdev)
> >>   {
> >>       struct device *dev =3D &pdev->dev;
> >>       struct device_node *nc, *np =3D pdev->dev.of_node;
> >> -    struct zynqmp_ipi_pdata __percpu *pdata;
> >> +    struct zynqmp_ipi_pdata *pdata;
> >>       struct of_phandle_args out_irq;
> >>       struct zynqmp_ipi_mbox *mbox;
> >>       int num_mboxes, ret =3D -EINVAL;
> >
> > Tanmay: Please take a look
> >
> > I think this patch is correct. Pdata structure is allocated only once
> > not for every CPU and marking here is not correct. Information from
> > zynqmp_ipi_pdata are likely fixed and the same for every CPU. Only IRQ
> > handling is done per cpu basis but that's it.
> >
> > Reviewed-by: Michal Simek <michal.simek@amd.com>
> >
> > Thanks,
> > Michal
> >
>

