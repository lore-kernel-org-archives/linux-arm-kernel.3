Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B09D637B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 20:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/sJfcthCzxrPjuRsj4tX5SjwFr74e9+VRf3E94baG8=; b=BUO8/DOdsC1wUgiMyaOcuc3v0G
	/YNenIqq6xI+qL2+P65TZhFBhW6QmpxGel+y5dhCJb/pCWB1wgVYFVqTTwK+ta1EJmW0Rcjzxy1dH
	e+X9sE0EfsvpdEAZptvmIYfR0aYDgtKZQSRoQ2pzXYXjEkoxuG9my03J2MB6nbcGl7DBtF/665Y57
	h/eJ7DBmZ9iDzbJlXG3UhKJJKblwXucduLKfivTSIzXhnZOW72ET1f4HDqAmX7K+juXSBRu7v6h7J
	GZu5v4ojc/hpGxSh5nn4PndSFeMsppxHowwhket0tM+GOqDOMYRhNY/12Xc4esi9w6AepH6Rtg8HI
	CDfXv/JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBK7d-00000007yxv-42b3;
	Wed, 13 Nov 2024 20:37:54 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBK5n-00000007yjJ-3V7Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 20:36:01 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-514543a08d0so573596e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 12:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731530158; x=1732134958; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I/sJfcthCzxrPjuRsj4tX5SjwFr74e9+VRf3E94baG8=;
        b=dV6Zy0JjWH+tqBzf/EBjbfAjQHcZp9Kkv+L7/J3FAhIKgAlBzQ+ROkHOrSd+5j7J8Y
         svrp+5AcL1VEOgSh/tcivVQUcvxoEJGUkqH/XZhE6ffS8CfDevtzcrr5lEdQp0F9VLKF
         XTgctISYr3AGmcXWCThkiXdCBCX3ihCqY3iaeFUvg3D7fk47FEyclAZH3LYLOzFI/EjF
         f8WXXR05aPaJfmv4d+eO2tFrRuj/68H8gBM+KkjZyr1lDdMx71QiOFHhROfgrWvPBRXS
         Cg9JfAfMIg6/B4HpO80JQyFH1YKBmeTFWbNvs9tl8znDH6WZljxsxw86vKJiRvIGKX/i
         3h2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731530158; x=1732134958;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/sJfcthCzxrPjuRsj4tX5SjwFr74e9+VRf3E94baG8=;
        b=V6bH/YOC+fHsx60IaLfCivygw/+gVvPWUZEWaZppyhEGpKNUXnd6MJ+DShY4HGqFTl
         n8pucgRrzisf++ON6b5aKsbx1WaeqvTmbeudY6G5SsIe88+xQDkSR6jomJ44KrjVcNOx
         0t3LrMR2L5a9v+SM9y1SF78tptpksIJmQ+0Sb3LB/zjq2nZI15/HRVmjfyfH3lrCYcjU
         Y0JD2aDTLW+PRxRj6OquPsYLkjugzv+0Y0jdGT8bAPdMyUtUwtWtTbucj408U7i2RQR+
         RBolSWI6uJEsoJ6ShIIkPNDXbgamJ2x5IpvN4wnn5QcFYZ6CjSPjkFy4Muw6pEpjHoik
         ypaw==
X-Forwarded-Encrypted: i=1; AJvYcCXeiKpXBx5ncuMwnvwBMGtJ2ESTKTrarj9XlMCzrAwmHszWs22cjDc0dmszRNbEmGD0YJdrLlI2nPxgba9LYZPI@lists.infradead.org
X-Gm-Message-State: AOJu0YzfYG3OfFkVzHS31G8vRT0bIuzWPw8pqcNDgQ+t8TRJgE7gZzU4
	G+7QTQNhtqSM61iuzp8HhFzdWR7dp+2lCUm9DN6slTQVQtapW20+WaQBZunp05oP1JYVUDymBsF
	p2Q7++Fzm8cNMCt2wapWay/mRtHA=
X-Google-Smtp-Source: AGHT+IEIPpn4HHPIF+usA6rtVxhozfZrFa/wVDvJvxg7hmjJzXgeWkot8H8vZh/T4c/n+8NbksBDE/nxMxLWoC2ruMQ=
X-Received: by 2002:a05:6122:168e:b0:50a:caec:70a2 with SMTP id
 71dfb90a1353d-51401bc7d7cmr22823944e0c.4.1731530157648; Wed, 13 Nov 2024
 12:35:57 -0800 (PST)
MIME-Version: 1.0
References: <20241020144736.367420-1-karprzy7@gmail.com>
In-Reply-To: <20241020144736.367420-1-karprzy7@gmail.com>
From: Karol P <karprzy7@gmail.com>
Date: Wed, 13 Nov 2024 21:35:46 +0100
Message-ID: <CAKwoAfoQ1Kt3HqW8jaFCmx1s8zmvSF9aBhNOjyqF47h8T1zmWA@mail.gmail.com>
Subject: Re: [PATCH] HID: hid-thrustmaster: add endpoint check in thrustmaster_interrupts
To: jikos@kernel.org, bentiss@kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com
Cc: linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_123559_936332_2B248450 
X-CRM114-Status: GOOD (  20.56  )
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

On Sun, 20 Oct 2024 at 16:47, Karol Przybylski <karprzy7@gmail.com> wrote:
>
> syzbot has found a type mismatch between a USB pipe and the transfer
> endpoint, which is triggered by the hid-thrustmaster driver[1].
> There is a number of similar, already fixed issues [2].
> In this case as in others, implementing check for endpoint type fixes the issue.
>
> [1] https://syzkaller.appspot.com/bug?extid=040e8b3db6a96908d470
> [2] https://syzkaller.appspot.com/bug?extid=348331f63b034f89b622
>
> Fixes: c49c33637802 ("HID: support for initialization of some Thrustmaster wheels")
> Reported-by: syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com
> Tested-by: syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com
> Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
> ---
>  drivers/hid/hid-thrustmaster.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
> index cf1679b0d4fb..f948189394ef 100644
> --- a/drivers/hid/hid-thrustmaster.c
> +++ b/drivers/hid/hid-thrustmaster.c
> @@ -170,6 +170,13 @@ static void thrustmaster_interrupts(struct hid_device *hdev)
>         ep = &usbif->cur_altsetting->endpoint[1];
>         b_ep = ep->desc.bEndpointAddress;
>
> +       /* Are the expected endpoints present? */
> +       u8 ep_addr[1] = {b_ep};
> +       if (!usb_check_int_endpoints(usbif, ep_addr)) {
> +               hid_err(hdev, "Unexpected non-int endpoint\n");
> +               return;
> +       }
> +
>         for (i = 0; i < ARRAY_SIZE(setup_arr); ++i) {
>                 memcpy(send_buf, setup_arr[i], setup_arr_sizes[i]);
>
> --
> 2.34.1
>

Any feedback regarding this patch is appreciated. I was wondering if I
should declare an additional u8 array or maybe just do inline
conversion.

Best regards,
Karol

