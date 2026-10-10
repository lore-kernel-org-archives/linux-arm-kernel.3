Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DF8CA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 14:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v81aBt2o2xPhCiAmHllIBfNzG7LkO0LDXg8m7+xct+w=; b=zaNEZdjL66juszSH3QhK08iYIo
	bD6SYZsmoevI0PVmlqwRQtYsfRck3hQic6Oibzdpu9Yd6qI184TK8R8BsBd6OvF7zi5VidltA/2si
	pD6n+2brXonUC/WoP+qj0FrrsqLBcZ2C3wll59v3svCk3mc6j+lAttVRYzVoImvNfll342rcY8k02
	HGcp09b2t79sPoA2OnAYNs0noQxYZy3pmxEWIbcpYnQQhCMmp05BL9aohj6Gd+RRpiK2uTga73geg
	nqj9IbKlMZi1oZmuslXdUjSoBkMQhKN06m3Pj7q/aMKR3ldQG3I8ukdeFDdkiXANy1zIyCOm1kmUD
	efhN4q4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFXxj-00000008A2Z-4BDK;
	Sat, 10 Oct 2026 14:22:11 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFXxi-00000008A25-0Ae0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 14:22:11 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-988c90ee9e8so134581241.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 07:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791642128; x=1792246928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v81aBt2o2xPhCiAmHllIBfNzG7LkO0LDXg8m7+xct+w=;
        b=A+uI3gSQoBQQndiy9golPHgZs4JZfH/IGmaNOlo6Re3k97MbBe1V8QRJ1VyElbjkXc
         QCetNfPZ8ETtWieRlbsoJbkHzS+1Viswl97e4LO8w02RBzz4FqvnXkJ1RABq7e9vR83j
         WIicYlO+eHARoPhtcBbpkN/AEZ3NO0jRlZvCWF11CGlCQUs3azdRP0l7oEevBC+xEEyV
         SMHiZxB0YRRAbB/13vkuT1w7i+oENZgX/jmiatwkQ/nE4fo1uI7g+Jpc8XeK5TOiDtyR
         b7ndXhq1Su1Q+GLYUs2Bmk9bw/1d+FqoHjI/Q6xQL496Hcj8sDxoC1z02b/Aq/TnUyBa
         FPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791642128; x=1792246928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v81aBt2o2xPhCiAmHllIBfNzG7LkO0LDXg8m7+xct+w=;
        b=ioE/hHRACLQe8I2H9prIGhReRx/vGmj5C3Z94XyvRUhHyiUdErm2d5P/APWhZz1Stk
         hVVqp9dzvB9Wcd0D4MSAgurGkFwHsYE31YIjbcnLWdgJ9/a1VTEBdDyWFoCTzyRtsbox
         eaJMU39JFJrAJG3PRg6hYLNfRsc+gR5scpW0i3t9fc7fEFXr2PdPDSPklEqgwCohgIBf
         9y+p623ClwY4sxv1FrBtQUTM4k+Wm+BNIsZu1c2Ii/NfIZv5n2GOZpNwdX85GYMUMvY7
         6kgUxHxZPhnZrSPXS6c1md3rdnqJ3T1NmE4Xl/t6dOHxG6cOZQ86usoIP+Np8JyW8mVM
         Ukjw==
X-Forwarded-Encrypted: i=1; AKwUvBzDy9DjWEp5nO/6kkgn2wLMsrUN/VUhDBxsWcezyTqFdBkZouCxrzdTqYEb8JCVskBSZMylHm641Ni9ukBP6OF/@lists.infradead.org
X-Gm-Message-State: AFq9FYJC3XGzAkSi+OnDuakRqrNW0kacDpXvLzDc6LapcBcGLzXY7Ng+
	VM+1hLD/3OJMvrkYr0MLTuqohsQsn+Te/eKFdQBKL0quCUAZVLka84Fd
X-Gm-Gg: AYBFou09sikmxM94WA/nYbwOY056RXIqpCtRFK0GcPT8OusJ7awneN6PxlWfO+J+Wqi
	WatkvGSfb03TR1N5lrBaKQl7doZ5PJjN9gCfQsJhFzB3TW02/7PJll82csFfLM4Np9QaxZFjoUt
	sgNQxOSZym5k+suQPOXBdli6brXPZVr4IdQjTfifnduPLIJHMNwniVD4+dq6BWg71vV7UkxvtOk
	RI83pCnm9it8ETR7FqWaXBtcNL3iOmmkNEHbFRBw0SYB+fCJO6Ewj7JHbYPpPVZ5la9mkdSyzWL
	EZsLHz0VpvJpQXxsWcY4r3/CsqoEepfDXZvy13eBYX0PU8/RXO65sAZNzn7gzqOuYZCf3SMQXUg
	sAxAsOJV6SIvq/1YcYyy15R+w+HCPXmMqrIUncWT+8PQ0lsrdocExsLfmT26P+IkWPdCxxALNXZ
	Rpz7T7RN75KpDlfKIOCg6bKG8yAQKhwdZ477TuSSLG7AnqPLuMj0cFpYmKAj9OaNE=
X-Received: by 2002:a05:6102:4b19:b0:7c3:a175:b3a4 with SMTP id ada2fe7eead31-7cb373eab9bmr1315060137.36.1791642128304;
        Sat, 10 Oct 2026 07:22:08 -0700 (PDT)
Received: from beelink.. ([187.13.210.57])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003f66f94sm3595530241.9.2026.10.10.07.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:22:08 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Hongyan Xu <getshell@seu.edu.cn>
Cc: Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	gregkh@linuxfoundation.org,
	vz@mleia.com,
	piotr.wojtaszczyk@timesys.com,
	johan@kernel.org,
	make24@iscas.ac.cn,
	kees@kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn
Subject: Re: [PATCH] usb: gadget: lpc32xx_udc: cancel pullup work on remove
Date: Sat, 10 Oct 2026 11:21:54 -0300
Message-ID: <20261010142158.2644446-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928134158.117-1-getshell@seu.edu.cn>
References: <20260928134158.117-1-getshell@seu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_072210_084793_3606A563 
X-CRM114-Status: GOOD (  12.43  )
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

On Mon, Sep 28, 2026 at 09:41:58PM +0800, Hongyan Xu wrote:
> Several device interrupts can queue pullup_job, whose callback accesses
> the UDC and its I2C transceiver. The IRQs are device-managed, so they
> remain registered throughout the driver remove callback, and no path
> drains work queued before the resources are released.

The use-after-free is real and the shape of the fix is right. The suspend
and resume interrupt paths both schedule_work(&udc->pullup_job), and the
device-managed IRQs stay live until after remove() returns, so disabling
the four IRQs before teardown and draining the work before
put_device(&udc->isp1301_i2c_client->dev) does close the window.

One side effect is worth reconsidering, though. remove() calls
pullup(udc, 0) right before the cancel. For a gadget that was enumerated
that reaches isp1301_pullup_enable(udc, 0, 0), which only defers the
actual transceiver write via schedule_work(); cancel_work_sync() then
discards that work before it runs, since the IRQs are already disabled and
nothing re-queues it. udc_disable() touches only the UDC core, not the
ISP1301, so the D+ pull-up is left asserted -- the explicit pullup(udc, 0)
ends up doing nothing on the common path and the device does not
electrically disconnect on removal.

Draining with flush_work() instead (or clearing the pull-up synchronously
before the cancel) would both close the use-after-free and keep the
disconnect: a job still queued runs with udc->pullup already 0, so it
performs the clear while the i2c client is still valid.

Thanks,
Aldo

