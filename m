Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B675FCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 15:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkAu8P10dwihkNM39UctSZpVluViyWa9thhV649dqfg=; b=mfiVtu9VI6RQjq79KUWfOGvYDf
	mygzJMX/4wRhuN92v+y2D1XwZYSKBeJLFRhpIAhDNtrn2JoTsINVPgEugYOyCCj9IWkgTBNShit7R
	zljIpr7EASDEiGch4A/7gh/WAPqIRhN473HFSjq5DObFTNuWngwEWKn6J5XI1RuS4Z++g9y367sT8
	T8lrikGUKkV9clO0JFxZtGoMlFePxhaJQkwN4NtWbqJQVa8VyTShPie0ojFvce5BIgmREb5WvCaeG
	GsxPgDcWwc0W6TnXes0vfW9ITn+cUiKkGeKWwvAGSwblxovIxe5ZH4LljUF4M4B4aF5guPXLApPes
	NH4iTP5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNue1-00000008m8r-3jJ2;
	Fri, 15 May 2026 15:40:09 +0000
Received: from mail-ej1-f42.google.com ([209.85.218.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNudy-00000008m8H-2uIE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 15:40:08 +0000
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bd124546379so878997766b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 08:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778859605; x=1779464405;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkAu8P10dwihkNM39UctSZpVluViyWa9thhV649dqfg=;
        b=ZD1xKJ9aI8MMIhkhgmtEnI2eKmswWUsRx5TdBEhtS56nW5CTiaFes+8TISF0CfAYm5
         1ft2w6TeOrssf8p1ofgurX+9+quW6qWU87g+XAS4BMZ4tfov07goODC1Ff9y4x2rhKGW
         G3NMw3yzL7VzS0YRkCwpElGKtNJtjOlVCO3vlNjgajCcmCK8Y5OMHL0r7aD+bSALHjNZ
         J0AFcQM5SiwGw3QWVyGdPGFbSD90YvBqzxNS7k8rcWLBvLxXELqgU+fwFcF71uupC4QM
         FYbsn07AIKhSIhfIPPgaoEpQOF5hArgkkVZhvSe5S6CvARnXIOQ/4qhNJEkpha02xbG0
         tKRw==
X-Forwarded-Encrypted: i=1; AFNElJ+D8y4AXEPXJg4qWjlMjzojX8a2S+OG5mwqu5DP5gec3sxPSnFdBalQL3Fppx/62T3KWRl7wm6M5V7dQum2BQsR@lists.infradead.org
X-Gm-Message-State: AOJu0YzpdiHhFmsFTeBk8q1LH6NeReYHY8HJ0UxRCFUV8qRBhB8eI5YZ
	/T+UE6hF4MsD+NKCWorWjJIiNd4zsM5MU2ILDOA1mbruK8+p8+79rvIOtiHD427XSZU=
X-Gm-Gg: Acq92OHG2Y6kb0S63CWtYEKwidrgGg9EDkwL0147AwGR15lVURfz2zWD6YWEm6Q3tP0
	jdo/S0bLTXwqmzAboIH+pUqw64DgZJQrW06LBCoHu0gBGxaN63N34wsUTHqc0zbTtGjx6a/DZFd
	5/rn9nBzCWETHSWkxBCVCtxshWQYmd50P4GiOk2pSFDNSQUVscRTtwX6dgpHMt+HJ9PcpLHhENi
	h5H8egzS/Sd1MSoTPE2ME0/CH+9S1V+iIRIKXrZij9P2t8Uz6shY9/R06BTRAnh4TWNRUz2xs9c
	bmnID4q0x5BYHwelmSC6KwycullsObJHaGpMoYMm2M+0WE/yS5RyGJs3sqQhhw9PPY7p0ZZcRFw
	TVQdY9B741erqQfXOvS/wIkAS77nnmi6KAe/gvh1sqvXeBU5yc8o1dFtkGICxM2rX7X4w/YsxDB
	vz496mfsBdnEorrQNXiGWwlbllVy7ZKBigLY6DvDzquWxQSoQrm3OMhGqf4lcr
X-Received: by 2002:a17:907:9801:b0:bd0:8e74:85a3 with SMTP id a640c23a62f3a-bd5178f9146mr251961066b.26.1778859604579;
        Fri, 15 May 2026 08:40:04 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd0992sm241091966b.13.2026.05.15.08.40.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 08:40:03 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-67c2b4809baso18718654a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 08:40:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9edLGm/ZL/enWxVpULZQ9jxwBi9xTspuWnIhxQ4lmcVuwiw4SSRrMw9C7Mg4P7+ikuakTIBY5UdBIvSosCdH9v@lists.infradead.org
X-Received: by 2002:a05:6402:e0d:b0:684:44f:d859 with SMTP id
 4fb4d7f45d1cf-684044fdae7mr1374876a12.3.1778859601770; Fri, 15 May 2026
 08:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
 <aekXUvIPb8nkhdKu@pluto>
In-Reply-To: <aekXUvIPb8nkhdKu@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2026 17:39:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8b9C3D8fV5th6GCgs6JAq7HZbF_SrOKz_gDy2H8ksow@mail.gmail.com>
X-Gm-Features: AVHnY4L73EskDuVnlvp0bKAJEo06GxthEmZ8mwHk1YJIsXaKqejpar7GeFZqJcE
Message-ID: <CAMuHMdX8b9C3D8fV5th6GCgs6JAq7HZbF_SrOKz_gDy2H8ksow@mail.gmail.com>
Subject: Re: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()
To: Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Saravana Kannan <saravanak@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_084006_942835_8720F19A 
X-CRM114-Status: GOOD (  35.94  )
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

Hi Christian,

On Wed, 22 Apr 2026 at 20:45, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Tue, Apr 21, 2026 at 08:11:38PM +0200, Geert Uytterhoeven wrote:
> > Currently non-SCMI drivers cannot find out what the specific versions of
> > each SCMI provider implementation on the running system are.
>
> Thanks for your patches....this is not a proper full review of the series,
> BUT this patch catched my eye..
>
> Indeed, yes, it is deliberate that the SCMI version information is NOT
> exposed out of the SCMI world, since being the SCMI an attempt to
> standardize a common FW interface (as in [1] of course), you should not
> know what runs inside the black-box, it should be irrelevant...
>
> ...indeed the versioning is used inside the SCMI stack to deal properly
> with different protocol versions implemented by the server OR to apply
> proper quirks when needed, but all the rest should be standard....

[...]

> I watched a bit of the LPC discussions around this (from Marek I think)
> but sincerely most of those problems had one (not necessarily simple)
> solution: fix your firmwares AND/OR apply quirks in the meantime...

So let's forward to the future, where the firmware is fixed, is fully
compliant with the SCMI spec, and all IDs are stable, so no quirks are
needed.

Where do we specify the SCMI IDs to use?  Unless when using the
remapping driver proposed in this patch series, they must end up in the
DTB.  Existing upstream users put them either in the SoC-specific .dtsi,
or in board-specific .dts.

The SCMI server is supposed to expose to an agent (e.g. Linux) a
sequential and contiguous list of IDs that represent only resources that
the agent is allowed to use.
  - We cannot put the SCMI IDs in the SoC-specific .dtsi, as that
    describes all hardware in the SoC, which is typically much more than
    Linux can or even wants to use when running on a specific board.
  - You would think we could put the SCMI IDs in the board-specific
    .dts.  However, that would limit actual use cases later, which do
    not necessarily depend on the board solely.
      - E.g. when moving control of the CAN-FD controller from Linux to
        the Realtime OS, the CAN-FD node must be disabled in the DTB (by
        overriding status to "reserved", or by just deleting the CAN-FD
        node, both of which can be done by the boot loader). However,
        with SCMI, the IDs corresponding to CAN-FD resources must be
        removed from the ID space, causing a full renumbering. Who is
        supposed to update the IDs in the DTB?
      - E.g. when partitioning a single Linux system in multiple VMs,
        and distributing hardware across these VMs, all VMs need
        different DTBs, each describing a subset of the hardware.  With
        SCMI, each VM needs different SCMI ID spaces, causing not a
        simple partitioning of the devices in the DTB, but also a
        renumbering of all IDs.

Hence there are no stable SCMI IDs in DT, by design!
And what do we describe in the SoC-specific .dtsi?  E.g. U-Boot IPL
still needs real hardware description.

What is the stance on this from the DT maintainers?
Thanks a lot for your answers!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

