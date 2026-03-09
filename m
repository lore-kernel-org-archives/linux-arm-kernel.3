Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11CEF417F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 15:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKq8ulzy5MHQKDxfFMVcrLftpi/uwWVl0kgu6a2rhEE=; b=wkAXfiTLlAwU/D1iriOCJwVfNE
	Fh6PR05avLxTK9ELvugbKUObFZawlavMc2yQ0ukL+UoY9aKdthpzGr4cfXC15ZyfI3Zw2oX1ohrEZ
	aH64uqFP6wGT0+QnNRmzq7g43S7LCvgpvrhHsgnLMQx9BBrsyntwxnlpikuzG9y8OpHdA4Pe2ZX8p
	YyITMzp/Q+UDfAVQMWGhKcCNevLyVIfj9Ivt4viu0I+oxV4vtO2dd7o1Pq92EaL8o/7bco60RuP5m
	Tp9C4y31i1byYqRbRQiPZskgTjVL8BwXOlAhkqbP05zKY7f8jEeJ3ijYQStWz1cqk/krLbivHSSbO
	jpHZxmyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcOf-00000007aNt-0ScE;
	Mon, 09 Mar 2026 15:19:53 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcOc-00000007aN8-14cD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 15:19:51 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b936331786dso1283558166b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 08:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773069588; x=1773674388; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKq8ulzy5MHQKDxfFMVcrLftpi/uwWVl0kgu6a2rhEE=;
        b=dz+OBQr+xqSQsfpIxBw3kYTkk5gE3LfsObjcloavq4fvQeb4qQSIH0slMXd7ab42Kt
         vNJzfob39DS5eB8ztncqiKHFzfavAVTgpUyWKzM5Olm/T0aTg3SnTJpRfXwHI3FgQrn1
         f0KkC4fhHugRWBV3KMdy2F/lb5lNCrQeTKTWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773069588; x=1773674388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKq8ulzy5MHQKDxfFMVcrLftpi/uwWVl0kgu6a2rhEE=;
        b=P/Mb/8X/eHQkN9IoDBa1b8bzux11ofscoDPLUQJdF9QkP2VxjP4kDj2fi/eg/AaETp
         ySlzcpvFV2zzelNUUJ3Z+qRADogIjedSXX6A1KBdIQkdb1E4Zk9SSHyS+GVDMaDSy2Ps
         aVpimTngzIFW2SJLmXTCvfWYw+HtS2ho5FY601Ve0LU1QiV6yUBGQ7W+/PQVhGzI7q90
         y/05ivNSeolj+JwCbQ+QVbHGPNkbLny67gdNSVjyD6KxJnTD26cI4M0yef4+oQH7TJMw
         oVPIf8oqzgIaubqhLL9yMUVxFYki1kEDPOb6sLdq+khKiWRvqRENEBwU4BQqlZRtLTA1
         JToA==
X-Forwarded-Encrypted: i=1; AJvYcCUM5nQaAw46DvtL97kY1SyTrEiJ+O6M6TRSU8RBXjpZcjYPf0IJNUrIZCBRyvVlzHq7RHjaOOay3eVsySlhSrT3@lists.infradead.org
X-Gm-Message-State: AOJu0YzIeelMsr9zragz+5X08q+TA4/RSUiy/q/7l/etsUTwa7n4XRvf
	joAW9GcWYDvbSMsuU4HV0YySgyhwCvQCTXCyXqk5lyHq2drChEJSntdf4Zojgd2crEvabkmLaAk
	NIEGdjw==
X-Gm-Gg: ATEYQzzK2Kr7FOdj/pZyfH4LgSpgtDJEmxtachZQbVhV3tXDdSKqYycKvS/UhuFkQdV
	xqmO26n7fSUHApPHxhiOst2swCg4J1Nyh/OMODcwfquUQX5w3Rrufum8sJc6ohhGKJdY9KTsL1K
	KfK2+dVzH3oxoxf2kJmd1jKKqv+LVcozKavJEDsNoja9lsPEulv+OV4iBTrunhlZdNrVxXwbWhK
	XQwGhFbeT9uyzm36Z/JzV2RZZpK3DKj/IqATJ14cOqQmhK6sziEDfxwjZ8Hf4wEz/U0N2uZ+iHf
	qDsqcm/bL8RHCWPaFghmejW/x/sQBh+2hT9vKIGrb0fpPlBj8asIcLSmacglPOP+si79cehHQed
	yHPIzqaV5LB3zctTzoFoRCnADSzGJfuNfongJ1yI89GyiVQtn2HCUuZTedkBYMNuuv8arRmZm6+
	H0YwKLONw3l13V//OQs1q1ImAG0rcsTHkuCgsZNWPKH6b9bER205y5jDujoOIe9w==
X-Received: by 2002:a17:906:f59a:b0:b93:6263:3fc5 with SMTP id a640c23a62f3a-b942dfb40d4mr689063566b.38.1773069587782;
        Mon, 09 Mar 2026 08:19:47 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a3e63089sm3292426a12.10.2026.03.09.08.19.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 08:19:47 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b96da7b2e2eso259661866b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 08:19:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJOKmUK9VH7fpFi7Sg/1hEN8JLfdqfE3uucn/4ZmXMl/98T/pfegx1NvbnKbghxFI8bYHPJuBJ0AlamS6X5rI6@lists.infradead.org
X-Received: by 2002:a17:907:1c2a:b0:b96:dcc0:2e19 with SMTP id
 a640c23a62f3a-b96dcc03e2bmr431706766b.56.1773069586848; Mon, 09 Mar 2026
 08:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260216181002.3475421-1-dianders@chromium.org>
In-Reply-To: <20260216181002.3475421-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Mar 2026 08:19:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XosP+rpT7w1Dcr=Xu7K8MCnA-=hndCgvsdwRAeVXuUdA@mail.gmail.com>
X-Gm-Features: AaiRm52PitiYzwSf40xttz_JauQBZgQS8kA13tji_SRNQ2F75XcOox36FcsJy20
Message-ID: <CAD=FV=XosP+rpT7w1Dcr=Xu7K8MCnA-=hndCgvsdwRAeVXuUdA@mail.gmail.com>
Subject: Re: [PATCH v3 00/15] mailbox: Stop sending NULL mailbox messages
To: jassisinghbrar@gmail.com
Cc: Frank.Li@nxp.com, Santosh Shilimkar <ssantosh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, andersson@kernel.org, arm-scmi@vger.kernel.org, 
	cristian.marussi@arm.com, daniel.baluta@nxp.com, festevam@gmail.com, 
	imx@lists.linux.dev, jay.buddhabhatti@amd.com, jonathanh@nvidia.com, 
	kernel@pengutronix.de, konradybcio@kernel.org, krzk@kernel.org, 
	lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-tegra@vger.kernel.org, lucaswei@google.com, marco.crivellari@suse.com, 
	mathieu.poirier@linaro.org, michal.simek@amd.com, nm@ti.com, 
	rafael@kernel.org, robh@kernel.org, shawn.guo@linaro.org, 
	sudeep.holla@kernel.org, tglx@kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_081950_348672_569DCC5D 
X-CRM114-Status: GOOD (  27.52  )
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

Hi Jassi,

On Mon, Feb 16, 2026 at 10:11=E2=80=AFAM Douglas Anderson <dianders@chromiu=
m.org> wrote:
>
> As talked about in the first patch in this series, passing NULL as the
> 'mssg' argument to mbox_send_message() ends up causing confusion and
> quirky behavior inside the mailbox core. Despite this, there are a
> number of drivers that pass NULL.
>
> It is plausible that some of the drivers passing NULL may have been
> taking advantage of the quirks of the mailbox core. Specifically, they
> may have been taking advantage that calling "tx_done" wasn't truly
> necessary for NULL messages (it was a noop) or that NULL messages were
> passed onto the mailbox controller right away without queuing.
>
> This series introduces a new API call: mbox_ring_doorbell(). The new
> API call tries to mimic the specific quirks that were helpful in the
> old behavior and it's expected to be a nearly drop-in replacement.
>
> There are some subtle differences between the new call and the old
> behavior, but it's expected that all of these differences are only for
> cases where the old behavior made little sense. The description of the
> first patch details these differences.
>
> The series attempts to convert all in-tree users to stop passing NULL
> for mssg. As per above, there are some slight differences in behavior.
> If any of the patches are causing problems, they can safely be
> reverted while debugging the problems. Eventually, all code should be
> converted over to stop passing NULL mssg.
>
> Changes in v3:
> - Suggest mbox_ring_doorbell in the warning message
> - Updated patch description based on Cristian's response.
>
> Changes in v2:
> - Instead of just documenting NULL, introduce a new function
>
> Douglas Anderson (15):
>   mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
>   ACPI: PCC: Use mbox_ring_doorbell() instead of NULL message
>   firmware: arm_scmi: Use mbox_ring_doorbell() instead of NULL message
>   firmware: imx-dsp: Use mbox_ring_doorbell() instead of NULL message
>   firmware: tegra: bpmp: Use mbox_ring_doorbell() instead of NULL
>     message
>   irqchip/qcom-mpm: Use mbox_ring_doorbell() instead of NULL message
>   remoteproc: xlnx: Use mbox_ring_doorbell() instead of NULL message
>   rpmsg: qcom_glink_rpm: Use mbox_ring_doorbell() instead of NULL
>     message
>   rpmsg: glink: smem: Use mbox_ring_doorbell() instead of NULL message
>   rpmsg: qcom_smd: Use mbox_ring_doorbell() instead of NULL message
>   soc: qcom: aoss: Use mbox_ring_doorbell() instead of NULL message
>   soc: qcom: smp2p: Use mbox_ring_doorbell() instead of NULL message
>   soc: qcom: smsm: Use mbox_ring_doorbell() instead of NULL message
>   soc: ti: wkup_m3_ipc: Use mbox_ring_doorbell() instead of NULL message
>   drivers: firmware: xilinx: Use mbox_ring_doorbell() instead of NULL
>     message

Just checking to see if there is any addional changes you need from me
on this series. It looks like it's -rc3 which is maybe an ideal time
for this series to get some linux-next bake time? A good number of the
patches in this series have Acks from maintainers so they could all go
in your tree, I think. For those that don't, I guess worst case they
just don't land right now and I can re-post them later. ...or if you
think they would be OK to pickup that would be cool too.

Thanks!

-Doug

