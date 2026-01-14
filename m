Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF98D31A02
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 04:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jV/XpQwP+sh7ML4rhDGyFAhl1yo1wNuzxIs+ixWD/3E=; b=Q5pg8WUWiPCYOYjzib1BGcBOQP
	1y9jFxdMQKcAmvVQVQVjCjgBy7gtsn++8CzIo2gdtrbMONF9C1wiBYdoIw2CzchpAiFGnK8iikRZb
	iIi4ItEMt5PIAhkdQBGtk/DnxzLPb95ncfB++cQMfL1vZZ5ZfeKDOu1DSQoofS31Uzxa78MzIvLkk
	wXBxH97u/DT9RRKfSvVUkRthwiEus/1jAf23ERpFsCAuIseFb30gtbUGwhoFTBuZXGzMk+uZnxUFd
	l707Of7HRDshu9SHqZwY+Xsa/E/1pogbBvP4kXCuuekhfSlurOJ9r7mhVGZGlOSCypQoyCbSzMdTP
	SkgMn8ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfsf3-000000083wE-0h3U;
	Wed, 14 Jan 2026 04:39:13 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfsf0-000000083vt-2KFE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 04:39:11 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-64d30dc4ed7so16293612a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 20:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768365548; x=1768970348; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jV/XpQwP+sh7ML4rhDGyFAhl1yo1wNuzxIs+ixWD/3E=;
        b=HINQGWp8M+InQwajBr5ut3AFwllsdQm8bBxiPsBGEUDgrJUgEEE5CTtlwgjlY1arI8
         eHrLTEmUH2L5JDiH0VjBKOkXeESFmKWnNQQaHqdCupkjT33sq6FDBoHaazbM3Iwot1Xj
         GQA3A4nC9Hm052c8Ow0/kkIShI12t6ajs8y30KiAcvjrBPmsOWd+I6dAehiLDerC0Dns
         5KXuh/FcNAIDzBTF4+1iBmdXu0KODWNOUfi75gHV4hGcrK95UUo5+HAheAYix7rAR3Oc
         a0aa/fLP6eGsvCE+EzmeWzGaTxsMH65XBJDl3pg9FF7zvwAELnZRACRzRejrm5YuIUUh
         CUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768365548; x=1768970348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jV/XpQwP+sh7ML4rhDGyFAhl1yo1wNuzxIs+ixWD/3E=;
        b=cRlbr+lDSA3JYzK1XxRS0sW4rA4iOZ6Lzi5tA1bVa2i9407ysJ3zg1fk5Pn1QPH170
         rECSMVG7jHA9L6LUnUDI9qumHl2tX15nUBgfUtYJ6R1HfBWIaTQo1E4kje9WY07v5SFe
         wBPrrHXQTd/3rci339749D+1Ob172AvG/0qzlVZIP58ggz6Jt4l+yIvgC4fia4ZcIDof
         jprJy5Gx5lWVU03YZmZbXU1c71oarLRXs911EGtyjbi0R4QgN4eknG+WKG7ey1DorVA7
         7Q6pCPV6WtcUU/VWF0oJ8iXzpCK2pNmYhzsKl1X8lPOz6itzeG/FffSPptinUuYs42w6
         m1ug==
X-Forwarded-Encrypted: i=1; AJvYcCU/BSnGPKjk3tAYtSPzTTCTwiRzgDTybTEc9jBJilXRzdgQEfxMjBW5wl8l103PbBMZ+iSHE+1L1hvgr0So5LfO@lists.infradead.org
X-Gm-Message-State: AOJu0YztxB2U4L7bRg+8icjBVygrzL9s5uD6xOD2aCHtcICNo7djfZdb
	04WucAasJkMooCHFh/g6lGNbflYhuYPYVfnHX0Axy6OBSFdch7e3U+SwRc8e8NVlC4scMTwhprR
	w/4aDrls5T42/+Nb9lxIXfegd5oZCqAw=
X-Gm-Gg: AY/fxX6ONojco8f1/jOJXYWmppsPn1xaOxaS6LKqPAKPond11PterGn+51Y+xLzJTXt
	vkhH+IuTLP7yL4Djd+tLmiUDXHGg0k+YyHFrM8embCQTzgx38CaOUyjkRItP8FgTLX9ktZPhVqT
	EpmR+bLiscr0jNDkiN6k2l+zgkYrLagkziUqPhm8r9B4RBQ2JKG3xvISpa/BKd/yf5XpFlPXqMA
	1xfpOeJNEGqX3z9w5jw54YqQiDoKsxKbahfowe0l3AcEfmV862Na2qz1cGVftmwNV+taS8p
X-Received: by 2002:a05:6402:40c7:b0:64b:5c4e:e695 with SMTP id
 4fb4d7f45d1cf-653ec45d439mr887371a12.29.1768365547910; Tue, 13 Jan 2026
 20:39:07 -0800 (PST)
MIME-Version: 1.0
References: <20251221103221.1971125-1-jakub.turek@elsta.tech>
In-Reply-To: <20251221103221.1971125-1-jakub.turek@elsta.tech>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Wed, 14 Jan 2026 10:08:55 +0530
X-Gm-Features: AZwV_QgfM5h7fqKdhk7j-yHOg33xWw8Otxs3wXPFYc8mUKCfOKlQeD0MFZTnDb8
Message-ID: <CAKfKVtEUj3=mt8FaU21zF5ZOqatzCAebW8R32f5E57VmyTtUbw@mail.gmail.com>
Subject: Re: [PATCH v2] serial:xilinx_uartps:fix rs485 delay_rts_after_send
To: "j.turek" <jakub.turek@elsta.tech>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, michal.simek@amd.com, 
	namcao@linutronix.de, tglx@linutronix.de, zack.rusin@broadcom.com, 
	sean.anderson@linux.dev, hshah@axiado.com, linux-serial@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_203910_621580_3675C297 
X-CRM114-Status: GOOD (  10.81  )
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

On Sun, Dec 21, 2025 at 4:03=E2=80=AFPM j.turek <jakub.turek@elsta.tech> wr=
ote:
>
> RTS line control with delay should be triggered when there is no more byt=
es
> in kfifo and hardware buffer is empty. Without this patch RTS control is
> scheduled right after feeding hardware buffer and this is too early.
> RTS line may change state before hardware buffer is empty.
> With this patch delayed RTS state change is triggered when function
> cdns_uart_handle_tx is called from cdns_uart_isr on CDNS_UART_IXR_TXEMPTY
> exactly when hardware completed transmission
>
> Signed-off-by: Jakub Turek  <jakub.turek@elsta.tech>
>
> Fixes: fccc9d9233f9 ("tty: serial: uartps: Add rs485 support to uartps dr=
iver")


Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

