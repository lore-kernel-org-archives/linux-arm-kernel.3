Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA7FF3D60A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 16:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZS+Ol8+yEchdiVkskKjDZZmXtLA1m1nNb9M6NkVQzPw=; b=byYR0Jq7x2doRTQrOvBDmTnZJU
	JIp40P8fWqnS2L5o3jhb6a4lTA2mOpy8JKDFGg7j7hqlKTC/oseoRqwr550pJNvZG5S79FZslsxuu
	i8XdWcqFYASRRECzlO2Yg8R5eQdya9QZAWsNYFy2ouugQLJP7Lou9qBqFGLSvk1etcJQ1E4s5lqv2
	u6Q+Qg7TdSer/kP5QFlz18gk2uCAF+bN/7VWlQ1DOl11RnmIudLCr0xIadf8mc4Um5gRfgY1rBSd+
	iL+tQ9SL2KVlKxNxbn7JxzO2+5urlTkBcpnHYdmYwLCG6p3jCZQEU7fxQyXDqwxBefxsP1O9C1D2b
	nOzo7Sng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6t4K-0000000A7cH-3vgi;
	Sun, 29 Mar 2026 16:32:56 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6t4I-0000000A7bl-47d4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 16:32:56 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-46a9ae3f857so444232b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 09:32:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774801974; cv=none;
        d=google.com; s=arc-20240605;
        b=dFr86454AcdCWh0nrr5ppflrIaji7IX9NxhnlLLJSTGjzXFjqEnbUcT4Wcm8TrpUoK
         MDDw1OTenklCL2A8y4//yZUrzX2MwEK49zjAekahzvjx7YaV+sy8Q0PW+dobHFNz24xp
         zQGuIr1n9uLRvbxThlDHKEJNNnZOXgDjml7W2oW/3HRjUmaroVy/Eg/7dZCWzCX4thtm
         dwXueQ+FjCecPMWRgpVp0aG09xxdtrH/NTpnsmFYmXyMV9kC20qRNOHnem5wcajbmzcs
         ybG98OWEVx9VJGYXxclTFIzo+GdE0wNRAG/+mF4PVzrzAtTCk9kYrd8ZmXcFtMh3X6vC
         EaAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZS+Ol8+yEchdiVkskKjDZZmXtLA1m1nNb9M6NkVQzPw=;
        fh=+iQfgsi2Zea4rzLVMI1qW+pTaPqxZ7mAMjdIYPq98d8=;
        b=GkBA8n2+CFNaypWhi6cpgV969y/TDNiIvnksOKTWbmK5jR7pFOYzDnh0gdxE+Jtum7
         1PwPqyD90fz+B1V5qEkOf8lf48RaxVPuu272nAuBZUHGqnlPaVIGTSQT7k/kYpXe/Usj
         9xwieUvJylLmGLMe/dJUNnN795dH/eAuirPO26aikWS5cZa+PzF4RjFOXtzaEBUj/qOk
         qH+MndH6Kb70pIjOPRGb0N4Rcbfe551H9rcK9J0eqTYf930DbeTH659mEZZH3rxTA3T/
         1df8PcXTsRhGJjfdo/E9IpGa2AYABzVX13uNDNcRKy6WRfMvwSGdP5UlnEbxPJ1MZdvR
         5xTQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774801974; x=1775406774; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZS+Ol8+yEchdiVkskKjDZZmXtLA1m1nNb9M6NkVQzPw=;
        b=Xal94Sckl3/sAKqSEmr8fhCcPoVH7oxIuYKWzmRwIv8yP+YKhY17/EmBYzz0FX7ADI
         jKBx2k6EzrgRoK05O4x+pr1gch5zniGwU9Okg7E/zqWd7mdHUI4e9MMdCHTpAfexK46L
         kUQdhkNA7U4TiucO/cEA/PYdjDvEZ51YAF8yU2UqbnfsCMK0kjYPZWOBuWQPG0NU1yck
         GMg1GwyRzcizBSxRhcqBpqFgZ4ejSWZGINEookMpRqthf1eQuxtJvcQ8xgmNevTpJNPA
         xOFxleLteL0X4KV5ugvvQimspd22KpCaVukRq3cbemc9tQH8DRvE/it39yax/lrBdJym
         GdLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774801974; x=1775406774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZS+Ol8+yEchdiVkskKjDZZmXtLA1m1nNb9M6NkVQzPw=;
        b=dcazE44mcmff9rk7a2nVA8bRpjilF6VcPR63Z8WCSQZ/f/TNZ8xw4ZemSF9ipZ18nK
         s4kVI+C830OzDEkz2WtJoyE86+uIZfurcQIqLKhQeiL52gcm1MHMjWmra7U1bQVwNVq0
         PPdQaoT6Q4ZWM5YF72E90X591HV66ZgVSLduu5Etni8XUnrVoSgNAxx6/lAfh7Q7nxLJ
         Bd5wVDkoee3WBfGLiULXVpIcnvyRaoZwBF6JeinsiP/A592csNU8rGul2iOBbejk5qMR
         NfJvkEQRkEeaytLZoPDlfonNAswIL33YVrevvjEgz3FS2DMUQLON9Wl6nnshunvuCOWN
         FjKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3BPzxNtcmtsk2I6KRSgbL3MFBrmUXUGSajZ/tb+AsZV4IQ++4GP8XoN9VDqplP+jl5U8iAG0QmWRZUrrVCBz5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5q5lILHFPZw+vc/VyuUe0+rphQ7Q8UV0V2OtDqgNEprr2E0sn
	SLwj5VcW/2kePpy3eucFypbs7mW7JsVShgSZxAfQSKZQJIIyCXYOsBXkT7lWr2AUuJHaEex2DaW
	NsykNFg/HpogG0QD07tYEMbO/6oMqtdg=
X-Gm-Gg: ATEYQzzney1MRywfRBBuUng81Uc8WTPvzELvKykekLam/qI+7XwTT0kFSc98x5gd+BY
	t5H+eVuSm85CcCft8HLqSXT3OYN4HHXhPSZMDpfHOgyKyr08R2JrOGk+8XEg8je4Z7DQtsaSbqL
	/3WyVv/IIKT7EIh5ecxChVDZwAp1GSBtujx2beLLp+wGc4NRw4YYKIJHzqIXoXC37mGpazVtYX+
	NQd+ami4qicZ+OizlfXGs2V04Hi8EjCAlJjRs+kQhwowl6weMgiZnkCXlDiiRAF8XOhr2E6aUrW
	2YIQXWsB
X-Received: by 2002:a05:6808:1987:b0:466:f57b:2aca with SMTP id
 5614622812f47-46a8a5fa334mr4267891b6e.50.1774801973796; Sun, 29 Mar 2026
 09:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260209083452.154983-1-fredwudi0305@gmail.com>
In-Reply-To: <20260209083452.154983-1-fredwudi0305@gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 29 Mar 2026 11:32:42 -0500
X-Gm-Features: AQROBzD_uLE7qGskovC2U1QTIDQsdBFywmlZ-V1Va3ppdPPRPwcou_hGA1RSB2o
Message-ID: <CABb+yY3a=0a=Ku5kjUBAfpZ7ckR03JTmq5y52W6ASBKvbakruA@mail.gmail.com>
Subject: Re: [PATCH] mailbox: cix: Add IRQF_NO_SUSPEND to mailbox interrupt
To: Dylan Wu <fredwudi0305@gmail.com>
Cc: Peter Chen <peter.chen@cixtech.com>, Fugang Duan <fugang.duan@cixtech.com>, 
	cix-kernel-upstream@cixtech.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_093255_076769_0E5C5D2A 
X-CRM114-Status: GOOD (  19.01  )
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

On Mon, Feb 9, 2026 at 2:34=E2=80=AFAM Dylan Wu <fredwudi0305@gmail.com> wr=
ote:
>
> During the system suspend process, device interrupts are masked in the
> noirq phase. However, SCMI often needs to exchange final messages with th=
e
> firmware to complete the power-down transition. Without the IRQF_NO_SUSPE=
ND
> flag, the mailbox ISR cannot run during this late stage, leading to SCMI
> communication timeouts and error messages like "SCMI protocol wait for
> resp timeout" during suspend.
>
> Add the IRQF_NO_SUSPEND flag to the interrupt request to ensure the mailb=
ox
> can continue to handle responses during the noirq stages of suspend and
> resume, thereby ensuring a reliable power state transition.
>
> Signed-off-by: Dylan Wu <fredwudi0305@gmail.com>
> ---
>  drivers/mailbox/cix-mailbox.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mailbox/cix-mailbox.c b/drivers/mailbox/cix-mailbox.=
c
> index 5bb1416c26a5..5e27c2bf3492 100644
> --- a/drivers/mailbox/cix-mailbox.c
> +++ b/drivers/mailbox/cix-mailbox.c
> @@ -405,7 +405,7 @@ static int cix_mbox_startup(struct mbox_chan *chan)
>         int index =3D cp->index, ret;
>         u32 val;
>
> -       ret =3D request_irq(priv->irq, cix_mbox_isr, 0,
> +       ret =3D request_irq(priv->irq, cix_mbox_isr, IRQF_NO_SUSPEND,
>                           dev_name(priv->dev), chan);
>         if (ret) {
>                 dev_err(priv->dev, "Unable to acquire IRQ %d\n", priv->ir=
q);
> --
> 2.52.0
>
Applied to mailbox/for-next
Thanks
Jassi

