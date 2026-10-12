Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D267DCA9ECF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 01:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yy605aOeAHaRRlQZ49hSeMe89YDd8h55bKBGCHpbQWs=; b=RuQJL/ow9vaalT6PaRu9CbWjU7
	sO6Bib2GTsZZBLU7HHYH/DEzs2Tj5fXsBbf28sSL91BDoQf+hlwABTR96wRtWJsjO8jbnthh1fNuV
	k1Zi/bFyIeWenUyPGQzaCbCZBnumAkM7dKuLVXjTaDvgmHPRuXCur7gBSOddON7kLJlonA3q1wYEP
	DTqsux3GUIaYA0x79b0/CSZPk7m/cvzuX/P6gP6TvSvo6XHBjnUo1KlAepn/q38fo9hPWM8Rn5/vF
	KGiXG/DAzgM2COf63jyjs1KLDZVvpXPUf6uqTEMrRUeVXwZtY+7gqX1kPUs9sBYFn07K9uWETjKrE
	Xr1m5Ryg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG4ug-00000009YWA-1eVp;
	Mon, 12 Oct 2026 01:33:14 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG4ue-00000009YVQ-1dhZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 01:33:13 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-8198a3a54d7so3499680a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 18:33:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768791; cv=none;
        d=google.com; s=arc-20260327;
        b=RVWd/kKZQ9vdFbjleG0V+MFxUEmIB2O3iuGsWyFlPkPg3D4gSDcoVKJn9GDxlCaWac
         SGjNLRsV0+tQGNsruXkDfbnNvqPAbakc06YdDp8XElHqG8AQGooWs2o966zomrQ7r7bB
         7mbRmGaESiBaVL+JtoLxgWs6PqdAhQmcDcDpJ4y9OBKUsS8uOfPC7G7XMrNMEdp8UNPO
         nkXK+iVGHs47SgBSSe5dEF0M4XjXbYHy9qulQZdI2CJ57b3XovtJ2K0ayTjm8Md9/lA2
         d6Wg21SJSI/WBubxRUs6sKN4p/w/Qj0ywxgjabKReFdlBVQqOcYL76MDY0YYTQd0BKsG
         +4iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yy605aOeAHaRRlQZ49hSeMe89YDd8h55bKBGCHpbQWs=;
        fh=3zp540jJpuFXs4dXOsaUm55pALAJ1RxeS6zMH9pGcHg=;
        b=U/dM/geScYWhde05J1gxMXdt9ah0stWdPpe9vzfpgwy/JPdqWH8rJymr7cDI7F0ome
         WYvRVyjoxUTbUWXZUI25sAovxwIJ2lUEDmtm0Quv4gRjICl1UsFAgQCSfe1rgcBbqsgm
         7J1tn438LWZLtzib5IxeV2VSua/lbAYYw0mCwFP47od+Miytiu9IwYkRfhV2427gL8ly
         EOjDhBK8sNFoLF35CKM3zC9NO1PQgqrOhuZQNCjeV2RnPAeKoxx/EG4BwFZaVEzWuRKA
         Ei3c6RjeUp6wGa6G/A+tQ5C3laQd68cv3PHCZV+RWB8JRZOU+0kOax1h7yi9a7NJUerA
         BNjA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768791; x=1792373591; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yy605aOeAHaRRlQZ49hSeMe89YDd8h55bKBGCHpbQWs=;
        b=gbuVWBUaXO+KaB6572DxdPDTbHHd7DQKiCEZxVSv2loOMneyhOly/xS3FiXvkoOkSx
         VQcwtsAxrnH/0HcrChjSfvNNme6bVt9H5ZGd8FButk78hpxkgNn1ES8yK/JceoIxucOm
         TaSQMgvi80ITRcF8ADQsxHRhB0NUtMwWmJogEEMJjsAscOiiwd2+DV8Y8Q5/fQqxvVkG
         Z0tuODvdQv7JDQRV6J+HuS3hS9gHe/gcWhTlICnGZ6+EX4CihDCBcBS06a6Wh/jNprQK
         MHkkW+1fFnslupuYTRN1iWz2yQg1J9d0wCwuS+lHAPZrGvsdznXxzRqIC8ImiczbENM1
         Mz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768791; x=1792373591;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yy605aOeAHaRRlQZ49hSeMe89YDd8h55bKBGCHpbQWs=;
        b=niPJFJd/iwTdJYxsKhx8iJ08isRrJf8Y0rMtXwjWgOOJEZdhHLiSGorYs3i8sd2Mtg
         LAthy2TmO4Wifgz0qxcPoYZ0zVE/9uXP4jTWYONqAlrjd+CjFU24xH6P8JT6V5wgthea
         zZnUnnHM4wTEi+2LzSWsTEuJZ1o3QyDcw91oEnQLSIiqu1R99PFLURP1NkfSbn1LblQk
         SFZB0qxkEwsnD4TWeu7rllc3CgqEwC6+NWBNdkcvFh1ERtil+e5vj9FA3iWfGTZP/YDC
         kvNqI8N3MmyZYJzTJXnzXaifDXpMht6aLuUzPdunsCN+TiQ70YEzfns/VsNgPNUPg3iN
         sqaw==
X-Forwarded-Encrypted: i=1; AKwUvBzgULYmX+dfsQpCJR3s5oZI0+PvuBTid4v3IlJuKZR4QFeYl2Yo3Vt8WGGnL6xMrdBDzZ4l+M/AmMQd9MRWvub9@lists.infradead.org
X-Gm-Message-State: AFq9FYIbK6AnUlpexIstNEy5s5XzWpe3fTZ1LatVZw49Pv5p6UaL8hj+
	TpTlZcD2XVTbDRNeSFOb5Lqy8mD2jzhEbI2RRwd/NAImyQm5F7k0eNYDDwBCotHpJKcGEsUKYgh
	AZ/DpfcTEuALnqOENCJTyS4rNvFt2ECQ=
X-Gm-Gg: AYBFou3HJH03RSSeLt9N4B9B782zlXoR50FIMaYwfB1DbYpesd5UgXThEc9kxCzwDVG
	7oZYVpKfO1vtr8ghgA/aCELjdlqxNvrcHkS+2Cl3s01D65jK4BjiEUFEsDJeN7BfHPAcKF0qcRw
	TTbfe8qkZFTXLCO77gRisd9tj/ARFfuNEg0e/F82iJjg3qcbVK/GhSdabCe3n4ZEcO4IjRZBmtw
	nGHdtEvBOPRU5l3x6zNpfuyXtm+RDdDwUK475SOfsArJFJVqp3DxfhEKvl3K65tc6t2u/EA+7Ka
	CM+v03/G/BkSF4eNYhHp73y38QcuEjZH+D2LKbYM3JNDGpZoCm71sPA=
X-Received: by 2002:a05:6870:31a9:b0:462:ef7d:2a4c with SMTP id
 586e51a60fabf-4a2a894fad5mr5424931fac.8.1791768791364; Sun, 11 Oct 2026
 18:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <20261008030214.368347-1-finley.xiao@rock-chips.com>
In-Reply-To: <20261008030214.368347-1-finley.xiao@rock-chips.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:32:59 -0500
X-Gm-Features: AclHuK_QmkadvsvdD-zCdomyYwJKXc2L9BPDK2A4NqNEwXXLVrtwrCa7y00XQ18
Message-ID: <CABb+yY38GBk=OHZQ9GbDHhFr3Ny8+tavMdyK9qpRHg1yAw+jyQ@mail.gmail.com>
Subject: Re: [PATCH v2] mailbox: arm_mhuv3: Keep the combined IRQ enabled
 during system suspend
To: Finley Xiao <finley.xiao@rock-chips.com>
Cc: heiko@sntech.de, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tony.xie@rock-chips.com, huangtao@rock-chips.com, frank.wang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_183312_430589_EF16CFC2 
X-CRM114-Status: GOOD (  24.77  )
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

On Wed, Oct 7, 2026 at 10:03=E2=80=AFPM Finley Xiao <finley.xiao@rock-chips=
.com> wrote:
>
> When MHUv3 is used as the SCMI mailbox transport (arm,scmi-mailbox),
> SCMI clock and power-domain operations still need to work in the noirq
> phase of system suspend: genpd may power off a device's parent domain
> from genpd_suspend_noirq(), which issues scmi_clock_config_set() /
> scmi_power_state_set() and waits for the firmware reply via the mailbox
> RX IRQ.
>
> However, dpm_suspend_noirq() calls suspend_device_irqs() before running
> the suspend_noirq callbacks, so the combined interrupts are already
> masked at that point and the SCMI transfer times out while waiting for
> the reply.
>
> Both the PBX and MBX combined interrupts are requested as threaded
> IRQs with only IRQF_ONESHOT. The MBX combined IRQ must stay enabled so
> that firmware replies are delivered, and the PBX combined IRQ, used
> for txdone by IRQ when not in polling mode, needs the same treatment.
>
> IRQ threads are not frozen during system suspend, so with
> IRQF_NO_SUSPEND the threaded combined-IRQ handlers still run in the
> noirq phase.
>
> Add IRQF_NO_SUSPEND to the MHUv3 combined IRQ registrations so that
> SCMI remains functional throughout the suspend/resume cycle. Note that
> this only keeps the IRQs functional during the suspend/resume cycle and
> does not make the mailbox a wakeup source.
>
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
>
> Changes in v2:
> - Add Sudeep's Reviewed-by tag
> - Clarify that this does not make the mailbox a wakeup source
>
>  drivers/mailbox/arm_mhuv3.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mailbox/arm_mhuv3.c b/drivers/mailbox/arm_mhuv3.c
> index a1c528be47f3..04998e1346c5 100644
> --- a/drivers/mailbox/arm_mhuv3.c
> +++ b/drivers/mailbox/arm_mhuv3.c
> @@ -980,7 +980,8 @@ static int mhuv3_setup_pbx(struct mhuv3 *mhu)
>
>                 ret =3D devm_request_threaded_irq(dev, mhu->cmb_irq, NULL=
,
>                                                 mhuv3_pbx_comb_interrupt,
> -                                               IRQF_ONESHOT, "mhuv3-pbx"=
, mhu);
> +                                               IRQF_ONESHOT | IRQF_NO_SU=
SPEND,
> +                                               "mhuv3-pbx", mhu);
>                 if (ret)
>                         return dev_err_probe(dev, ret,
>                                              "Failed to request PBX IRQ\n=
");
> @@ -1017,7 +1018,8 @@ static int mhuv3_setup_mbx(struct mhuv3 *mhu)
>                                      "MBX combined IRQ is missing !\n");
>
>         ret =3D devm_request_threaded_irq(dev, mhu->cmb_irq, NULL,
> -                                       mhuv3_mbx_comb_interrupt, IRQF_ON=
ESHOT,
> +                                       mhuv3_mbx_comb_interrupt,
> +                                       IRQF_ONESHOT | IRQF_NO_SUSPEND,
>                                         "mhuv3-mbx", mhu);
>         if (ret)
>                 return dev_err_probe(dev, ret, "Failed to request MBX IRQ=
\n");
> --
> 2.43.0
>
Applied to mailbox/for-next

Thanks
Jassi

