Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BA8C531CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 10:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iw88qdhbLeJWjjRsO5YQ58HvJ0RtCrw2s4pHsHM+gn0=; b=bL+nlijsnHrfUV78Ezdq27O463
	Syi0Mwv4G3ndj3vl6ATVJsvPkMPZXOa9z7JNdDXZSbaE8HBn0vyzvAK2/jyDzMWcuE9bWQrRP/mL0
	FKNQyG80tFmevm8+gsgMRl6oWn6k6e+GG+4bniUQsdOdcsO5c4ifTxSGyqC2Fb1w0ziuRmIRmXHP+
	i9mPxKxgrQA0K0TRs4bVDTez+f0cPUhfJDFGZLI/UT4Aq0188Vvf0G/nBtQ0M4x5YJdHbDReMgfVo
	EtPRZVP2zDpyjyUjxjPplI8ZcAzxs+Alzs6nZle+sshitsH3GLHj0VuE8nYsiMiUUJhMc9aVl6oEc
	XA2fu61A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnwV4-000000015Fw-32tu;
	Sun, 26 Jul 2026 10:54:30 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnwV1-000000015Fb-29aa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 10:54:28 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c999f162c9aso1303947a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 03:54:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785063266; cv=none;
        d=google.com; s=arc-20260327;
        b=qNBNL/BUFOeMWWw5azXbSrxLm/vBF8gL62pPjavjzS2CIQmQJxH9cO+htl7WB1Abng
         VFtjVRyLa32v0atAuLN26XKcxYR8Wso9A6NLr2E9qTRQpV1QtZVy3AdU/8T8+K+9UoQ1
         XpH6XZPkmzftysCW557+aHMSUoEjD151GwItVTEK95bey5HSRVNDFZOZsgzxvOEG/cfr
         htJzzeEBFCYqhIy/CR2otq3Fd3jG0NmYvBA24TDXh3g31ZcHQqb3zAijGDa7wYA9ktv7
         G2nalA3NhEfFWiTOFx1Kj4ebXrOu2UpXwwE7K96hogZj58NqT8xQCBhPbDqYx+vKugHr
         83yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Iw88qdhbLeJWjjRsO5YQ58HvJ0RtCrw2s4pHsHM+gn0=;
        fh=9OSVpASDZpoROd9YG4u7vr3OmhIc5JHPeyxV7sEGzf0=;
        b=QfPhI8NV/k9o3XviN62UCWb93G62WK04/nypZqkufojZhFcwUDa21KgDxUAJoA/f3v
         QOQThnC9JYmUCPx1sCKpOX9eCSzi7fThFJmxgCb+LuW8kK/wT0cPfKhzBf7x9nS0whg/
         lvUjUStkIUl1+afPCKJTfeCr7/VC/mRjKcyc15hfsOZkO9HzdMsbxChz7wXQ4rL6uqv6
         BQ7QWX0y99uDOW8xNBaLCuHztl9DM11xznRIzNQPNKP6dHRMuqzhA6mamsHpCB3vCbCi
         VHYaMgvQMbIJBMtr4k694X/c+Ny08wwJfRYj+QZXWZCGzE8QQlHyoc4bs03kFpH7Kx8s
         fUrA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785063266; x=1785668066; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Iw88qdhbLeJWjjRsO5YQ58HvJ0RtCrw2s4pHsHM+gn0=;
        b=g8xcvoDYHsKh1/CgczFv0AfW6hl0iKxe3NBTp7sXpHyiEMzf91bESg8h8Z4sf/JR8r
         sTeWADgnq+l6GneTKY/29hWHfs7pMlY6MXm3kdS1nXPoQn9qXW31wP5tfTNOEeaNx95k
         1nL+/t61Q4djVB/exf1IfpVGp/+6hpgzIwPIXGNzA2CSAycYknw1BAsFCTpKpaN5Zy8u
         xXyrpjei0voIQQNeEbWOq1mfj+ktD2fdTGdg1jhDs2gXlYt9HmoFn01ZdKbVVAb7weDZ
         JHLjMK2JSYWX00UU36k11D0r1+hYlaiCvbLS80GDBfg/t+CF3anfArP7rTHP3OQGa7bZ
         +omQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785063266; x=1785668066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iw88qdhbLeJWjjRsO5YQ58HvJ0RtCrw2s4pHsHM+gn0=;
        b=KOf91rCpaR/NnFK/WrdkAwbz+7YLkc/4jCeULXnnzW2G0Kn7i7D2AIQHf3dMk35ubc
         dAYLN5WgQhcDz57StV0/JfP7Rm91vfL1vDawj96Facgbzy4L7qIOmOPlTAzZAKPaSdUy
         OtyTZYLbwWvtPpNEP0ZmdSeMfDE/2a9Hk2Nu91opUWzDG9CnLG2S52uAjMHlbIqNGwEn
         6nx5U1Wkmr9wp5PPYbt+fOdWjNzeTbZ66PKSkeGxEjPnBc/wfZ6q9GgsdFZBjH3AXnzI
         cWmwA47kGTuXzPX4U8097mtAfIw+QD2r4BupxoKBK8/TR7CUV621BtWcL75qCkMic19i
         /Cgg==
X-Forwarded-Encrypted: i=1; AHgh+RqTlTmQvdjUpmH+kyv0lt3TDe6GyE+hAh0TiCUjjVdKyJ93e88nfa8jYnbXvYqdBIyvxC8vgqJN/diK5n0aqeOe@lists.infradead.org
X-Gm-Message-State: AOJu0Yzzz4oB25qNccqo3fU/i5eHQqpOo2unN5qcC6/VkHlqV4dm57mI
	mzPCFjTBO9NA+wglA0ejnQJykNCG8v4jicOZsq7BreOnpBhHuKMNsRvH+UhwKGFCuZiy8TM672O
	KUpoNeoKB4H9jXtvNRDcf4THg6FR7bmE=
X-Gm-Gg: AR+sD121bFfs63Uaxl4eKnl4OFQ1a7uMkuMgf55UeuzA62gxvfQcZvv/ckEWPees8k+
	I9lxTogO8oYpUaRh1C7Xh57oIjLwrMMy1MUTsTfS2clorByqmzDyFqSoPIXb/I9LWZoKHVu6K84
	kLdsXYaV2XVU77UpN/RrIEP7S7muVUdLSsp4rjOy43/68oW7AaTCUEATAAo4F0NUIJfsM4fIesH
	nRU33oclYGpeMUV4sDO9+DfmPsvtTxI2ou+FDHlvkNCWUEm4q2/Fdaia8fDM77g
X-Received: by 2002:a05:6a20:918e:b0:3c3:68a5:50c8 with SMTP id
 adf61e73a8af0-3c67e166966mr4554741637.71.1785063266062; Sun, 26 Jul 2026
 03:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260719-usb-ptr_err_patchset-v1-0-85f7f2e4fefb@gmail.com>
 <20260719-usb-ptr_err_patchset-v1-1-85f7f2e4fefb@gmail.com> <al4zFG3zCD5FJ7eB@SMW015318>
In-Reply-To: <al4zFG3zCD5FJ7eB@SMW015318>
From: Subasri S <subasris1210@gmail.com>
Date: Sun, 26 Jul 2026 16:24:14 +0530
X-Gm-Features: AUfX_myX_j6xmvi1eW61hYxH97YPNgwMZ6bNH_j9w9hal-EVFSbaRcZHMpkAmFA
Message-ID: <CABfayGP4XpfqrfQ3qWz97yLTfjqwn8xXwW9WS2g1_vceS0srXg@mail.gmail.com>
Subject: Re: [PATCH 1/3] usb: chipidea: Use %pe to print error pointers
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Duncan Sands <duncan.sands@free.fr>, Chas Williams <3chas3@gmail.com>, 
	Minas Harutyunyan <hminas@synopsys.com>, Hans de Goede <hansg@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_035427_582357_C0D6716B 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jul 20, 2026 at 8:09=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> Avoid use words "This patch", just
>
> Fix coccinelle reported warnings:
>

Sure, will follow the same in all my patches.

>
> keep one is enough
>

Got it, will do.
Thanks for the review. Will incorporate your review comments in the v2 patc=
h.

Best,
Subasri

