Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16A8CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 09:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C88xFCOXStXuP1GEmHHJ52O6btKAi7VYGysPrZNMuyg=; b=pLhi6GBzQGserakCX6q//4BoHp
	V4W4OG9s9eZdvU3q2OuUZuBxRmxqV8LSgGr8Z2HxIdxuFRLArDOr4sC47iwUzFL51uR1JKX5wzBkk
	yl9JeX0qycEOlHdlP00Myun4GWyo+/4FkqgK7hNf0cA5+mKdbarOehTMrkBR03u+VqCY96W/2biFT
	s+6I7GDJDmodn3gXjw0gbnDbrJeGizE64WvwdzQuV8VxCxRrHvzeu0BhwFisDuyUZ1JTDJ8qM4BpH
	rG0JqCPGtWsv1g2Prq4G6et0h54A44rOYi0LRZNSOuUTswUHke+Tmq8S4OC1ph84eZFPcj6GJ2vBY
	0tQO9sCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVGR-00000002HWb-3IuT;
	Wed, 22 Oct 2025 09:36:16 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVGN-00000002HWG-3IuH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 09:36:13 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-63c489f1e6cso1423839a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 02:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761125770; x=1761730570; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C88xFCOXStXuP1GEmHHJ52O6btKAi7VYGysPrZNMuyg=;
        b=I358DS2YlHzW4MNc78Q4iMpyxUaGt2np115Xr9cFjKD60030yyWiRJiXClY4l837GZ
         h25nRefyd7dAb475toVlPBgEUgXQXaSfiYjeODkeKW6q6bSM2Kw5XLnJYd6oHQtPh8po
         Bje4Oxr06+KGkkJG1uCIqTWwGUyawgsH6RhNooftH2pSMlSi354ECwMR45BBqMJguBJO
         3rIQQuo2+lye+ZEBIWwCOpqRKE4DsR1ihDzbED92RAN/bPTshA/uif1Kov5lRLRcKD2Z
         xnEux/uPk3l39DgDtSuzQqBY/Fxk8505HAqr5nZV1um/UcF2WXYFPT3Aemom+NAjv79R
         kRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761125770; x=1761730570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C88xFCOXStXuP1GEmHHJ52O6btKAi7VYGysPrZNMuyg=;
        b=TxbUIdZEZl54S+3JPZxLKpn0Ck6mdOZ6unDQdiytheO/VZ4kcNWyEQJQyFjK0M42IB
         N6LJjBPpz7MyOXt2MeIvWNmIc+xir+R1xZiL0Djy1KNpjAo62dRWM124hJSJJdkvHJ4H
         9Om4ioIMcfYXdKXyE5rzIN5Puwb0c29hWyRWTPXXxp0XNQHcyo+hxcmwJQwjDhZXw51b
         SjwRlwUniT6AsOPAbYFHtNrBNksfH8KnlS2ZqXfi4hmTQebCoZYYrBQ+hUZGuw1RiGVg
         Hv+Hs8LYNIXC5gAzaGL22+mIP8M+CVnMqOK2+KRR8j+v9JNhBXgfMIFqEpFpiFEbR9EA
         zEqw==
X-Forwarded-Encrypted: i=1; AJvYcCVNu2BxtKg2eq6X0b+Z+jMJCshnPg79Si78iYM3MMazSXpgW0LSfLU+x5zP/Rfd61qUWeP0DYJ0NK3uTPCgWRHD@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl4KAtTbKdgKKzN1aPJxQ0NRi0ddYq2k1Tm+h55hG8SVEDQjhU
	sIESr3DzymPjdX2fUC0ploBHoQeFI8K4UkKuczcoRHawB4IDGiwxuX0VittzQmscc3VeH39MP9F
	dGKwrqbsLHp8Je7gsP/OAXAVsyqGJtrJZxRCIe38=
X-Gm-Gg: ASbGnctsXd7htrnsahOqCBcTICSh/ZE4uQ0En6IeJdNB8vJHfsOwRTYYCuDW4MyArmu
	XHCVaxN3sxy2hSnAcVPgudj6K2hH68xtFMzA+myweic0o6/xJ5YxLhv3UDbd5uT7k8GCk+2zvvi
	pXxSlnF+IPPOt6wVUPcQF61j0k3RAmrjH58kCFP8yrX7PwI6VZ5Msje/9GbmwCRoHw+CeAm5P5m
	En8TjsG9DPRiArzTBMuOh2QRO3gxBqxaHWPzPVE7Hfi7h3gvtFL0++9sH5+/Q==
X-Google-Smtp-Source: AGHT+IGto3EQlisuvoE7Sasg5zwzwjSEmlEE8ttsGQiw66ca1d04S75zETC5/PIhjoAM5dxY+M9aaYxATM6s/kFKsOM=
X-Received: by 2002:a05:6402:1454:b0:636:2699:3812 with SMTP id
 4fb4d7f45d1cf-63e169999c3mr2842093a12.0.1761125769618; Wed, 22 Oct 2025
 02:36:09 -0700 (PDT)
MIME-Version: 1.0
References: <20251021165212.749372-1-a.shimko.dev@gmail.com> <20251022-rugged-archetypal-wallaby-ecbecf@sudeepholla>
In-Reply-To: <20251022-rugged-archetypal-wallaby-ecbecf@sudeepholla>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Wed, 22 Oct 2025 12:35:58 +0300
X-Gm-Features: AS18NWD2CL-Yrxb3Tz9eDASZQ73ONHWrSw9NcQfoZQ6WrOD4sVc61IZW3QMRIxU
Message-ID: <CAOPX744QeM=5qsF0_ZrkvvuumH-EsmJPDMSSs=D04zP=tie3qQ@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Add new sensor unit types
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_023612_053149_BBC969BE 
X-CRM114-Status: UNSURE (   9.57  )
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

On Wed, Oct 22, 2025 at 12:22=E2=80=AFPM Sudeep Holla <sudeep.holla@arm.com=
> wrote:

> It is still alpha, we don't add anything into the kernel unless it is
> of beta quality. Do you have a use or you are just adding to match the
> spec ?
Hi Sudeep,

I'm adding it to meet the specifications.

Trying to be useful

Thank you.

Best regards,
Artem

