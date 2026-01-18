Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC726C98315
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 20:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EajIiJxhEkxKB0h9nWZKAup7MbRjLr6FFm1MZS4wGdU=; b=aSKICzTdR5MtoLdDaZoZrC5+Zz
	qIS/e3wDhMqqzwjwdY6k69W47oxBCCI48UuOi9WwTjF5Vs4vTqjDvU5RwNTQriSupbT6y895qpyId
	4YKos/+RlRfo1gFWBiH9XKmnw+9FZi5PWz5Wf3vKfSGZ65H4LbteIjts+RDbwROHZnZNCrxBZ7j5c
	odl1gLhDl/gyHH1+3iSyQoeBOBTF4fZN75WjFJgd2o1sxgW7DWtm1dWK2FItQ3w9OoTTrq7EHeXSn
	ynY5FI9Bw3ZU2WHAr2AvwDXuSE4Lgz0hkXX+fQkaPohQG4BzpfCoNujAw9jimOzGTsCvRq7SuGcFL
	J1K4KF0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhZl7-00000000xR3-05gC;
	Sun, 18 Jan 2026 20:52:29 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhZl4-00000000xPl-3l5T
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 20:52:28 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-45c7f3a9676so2091926b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 12:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768769546; x=1769374346; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EajIiJxhEkxKB0h9nWZKAup7MbRjLr6FFm1MZS4wGdU=;
        b=iX7HB34BcafIZb/dHQnNbHasoxaZZrlZ/GjQx+jOiRRi77NG0+3VwhMEbkVdGq2fzC
         OIWcK4JXn7KDSd6oxCkUzi8wJKzrDVhg/T6Cm7g5MRk166CPzjiXkpB8MiYEzU8khp5g
         D3SJB6nLtr7tmWDJH/5+2ufBtINgWwlOJXiP+aL9qoIMNr+dOKeuHoH7OAd8kk4U6Tgn
         Og0seQkzQNxXKVly6jZLDSyi4uuFbHOlIDxMph1j7ErsehyR720zY3YofzjXt7lctRoq
         dLWo54Iiq2gQfrIHrHP9okTP9WaISxUL8pGUKs6PwhGlztsOsspfsH20NhqFQnGnICc9
         KuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768769546; x=1769374346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EajIiJxhEkxKB0h9nWZKAup7MbRjLr6FFm1MZS4wGdU=;
        b=i+7fjTiR79yJFnPiDB1R4CWFrn6NEkqYMJJTs8zrnprF/VImCsJTVV1c8z0PMj+63c
         Jbn7OvJcJ4YQs7rMADcKQ9uOKaA4aUysBIJwGiopHAiiJvqsdP6EDxRb3cPoMd2ilMyD
         oLycNR4RY2wGmdlJOwLDrX6ACtSvEfeHKChqIF3FbhE7dXvrUBc8OoVmTKLOASUEoRFF
         Z24S68k5sjQe5qnvZZk0VizhvkVbHi886Pqvqi1KnXzxdFIo9d00n3mUsxGMyvAUC0hU
         grjYNwbEhIchWAtC42NQ8KbqKy3Kurne5yH3raFt/F6R/+Kx8yM2rdKgGv89AJf9pe3c
         3UdA==
X-Forwarded-Encrypted: i=1; AJvYcCXYQqcLDLZ+w3I3yz+ggo1jdrc1tAuukbu4oJcFvDSSWXrvFIkRu5AcjKbQ86LFgjP2vOBR1hJ9BC87+uyYWyoj@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2v7u/3mLi90hy4cPqtZOMLdPoVJ/aWtg/EM4IJRXLf5ZG9dYP
	iKkF1hZ/r3HLu2FpgyEz8CHU8G5tAAZBaxiY+AGiL/CVBKu+9o+wR3L8AoANTtlgDsy3A1MrOoI
	O2EwA4z9kdNcVnzy5Y5c17GVByvwrLo4=
X-Gm-Gg: AY/fxX5u8SBPDHgHvbHcAW9TNf2Ecs3nN6fegCsjZNpDMEFb2fvFqhOnr7FXNJl5a2V
	icuZjGzf4g7EMeCKTJX8Smi0RiMCByVAapuf0VAJLSEbt8+v7Cb7YRGkPFzDBSFHILPRwzbO5Dz
	bQ7ur8fl4zVhWGYx4l483JEsIEGe1RHLxlMRjqaWUOTLfMrcowh9cpb5OvzU1gvcXBSTtFkLmi0
	RHhrgTcwPqSl3tMYluZtJh3Mm/9tn9sIXmPVvRmkYyHEFO52ANJIxL9AfKf/FLwliFhBw+I
X-Received: by 2002:a05:6808:10d6:b0:45c:85fa:5a3e with SMTP id
 5614622812f47-45c8814b233mr6088865b6e.25.1768769545677; Sun, 18 Jan 2026
 12:52:25 -0800 (PST)
MIME-Version: 1.0
References: <20260109062259.1769305-1-harini.t@amd.com>
In-Reply-To: <20260109062259.1769305-1-harini.t@amd.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 18 Jan 2026 14:52:14 -0600
X-Gm-Features: AZwV_QgjuMn_ufy7aRDqt1tKlvaYB4bfqPXnr_PsBemUcXovpa5jbfh10tMtGeY
Message-ID: <CABb+yY2sW57piKnUxMXjo9QStuLBe+v4jL4vB=_3Ygdf_e1o_w@mail.gmail.com>
Subject: Re: [PATCH V2] dt-bindings: mailbox: xlnx,zynqmp-ipi-mailbox:
 Document msg region requirement
To: Harini T <harini.t@amd.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	michal.simek@amd.com, shubhrajyoti.datta@amd.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, git@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_125226_961118_0741A35E 
X-CRM114-Status: GOOD (  19.64  )
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

On Fri, Jan 9, 2026 at 12:23=E2=80=AFAM Harini T <harini.t@amd.com> wrote:
>
> Add description clarifying that for Versal IPI mailboxes, both host and
> remote agents must have the "msg" register region defined for successful
> message passing. Without both, only notification-based communication
> works.
>
> Signed-off-by: Harini T <harini.t@amd.com>
> ---
> Changes in V2:
> - The description regarding the "msg" register region requirement for Ver=
sal IPI
> mailboxes was moved from the conditional schema section to the main descr=
iption
> block at the top of the YAML file.
>
> V1 link: https://lore.kernel.org/all/20251222044653.1757886-1-harini.t@am=
d.com/
> ---
>  .../bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml     | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-ma=
ilbox.yaml b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mail=
box.yaml
> index 04d6473d666f..a5205ee5ad0f 100644
> --- a/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.y=
aml
> +++ b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.y=
aml
> @@ -11,6 +11,17 @@ description: |
>    messaging between two Xilinx Zynq UltraScale+ MPSoC IPI agents. Each I=
PI
>    agent owns registers used for notification and buffers for message.
>
> +  For Versal devices, there are two types of IPI channels:
> +    - Buffered channels: Support message passing and require the "msg"
> +    register region to be present on both the host and remote IPI agents=
.
> +    - Buffer-less channels: Support notification only and do not require=
 the
> +    "msg" register region. For these channels, the "msg" region should b=
e
> +    omitted.
> +
> +  For message passing, both the host and remote IPI agents must define t=
he "msg"
> +  register region. If either agent omits the "msg" region, only notifica=
tion
> +  based communication is possible.
> +
>                 +-------------------------------------+
>                 | Xilinx ZynqMP IPI Controller        |
>                 +-------------------------------------+
> --
> 2.43.0
>
Applied to mailbox/for-next.
Thanks.

