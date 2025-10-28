Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63872CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 17:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOzc7xIWO2p+WR3VIGi7nTgvTnzL1L1uYDvVNto7C1I=; b=vK0UPToxcjRCbvVTQo92rdNhOt
	wzbgA64/76cLcYR5Kwe0g6HPfPivjV99oMSYZuwi/dqAEHqG4Mq+YyyPNFHZsAxscGIQQVHojhm5a
	MKQgu/Ef9CrJte4bkbc1djjFqNAOtwfr1e9lDW5S6HpYvuMaoexl3cqeo1AigUI1GF4EciZNuux83
	6iPLBYNGYq1ovPMk4UE4zDdDhR/SQz9c1Ta+27dy6zNX9GahWzLSd6CrBVA147SwhQ7YuKlj5lpN6
	EvbFYu5gmWzJk4siFtZ5zNQ3/7Mbs3Z49DVFbD5BS5tidohord+AaOcBmOIIeHEn4PXQQ1Sy7csqe
	xlqGXDAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDn3y-0000000GMr9-1nWu;
	Tue, 28 Oct 2025 17:00:50 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDn3v-0000000GMpx-3Skl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 17:00:49 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-637e9f9f9fbso11403108a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 10:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761670846; x=1762275646; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pOzc7xIWO2p+WR3VIGi7nTgvTnzL1L1uYDvVNto7C1I=;
        b=ROD87WLxy2E/gXE1qgiIVb2rY6+UpXpdbUGD47qh0XrrOujHsgMjml5XXfKoBVa8By
         dkapIkQbtW/Ue+5PRSYuxttpBxXuLKSlbHr2WWcxr/YYBADxfy4V3iwzDq1WuFRvg4/8
         dYzdnMX9TSgpnL9KA+ysigRrtdW051Eh9SwJtyD9uWzcIFoPb8D5LBmLl5enzPEMdx0g
         67aliDI+pV0i3QO/dwA0tB8v9EwIbJlusyTIRmYt8KdVUwIHKQCS+I5VxZUKoKT/d/y7
         zXfnN5nBDV88PDoSPj4YiqiZYatfY68kM96XUiZ9ZUj8mcFcDJamS88ENgTP+Ugr8i3d
         8oDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761670846; x=1762275646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pOzc7xIWO2p+WR3VIGi7nTgvTnzL1L1uYDvVNto7C1I=;
        b=XEi4sRxA3A+O8H6sgS8X7Hfd/p59aVTcJ0iBg4Xmgr1+BFktaznn9NRPalxIlIvtaX
         OSO2aKF+G2JRoyIXrvdBui4avaOhyNHme0QNTfQi+7uVRcaw1BOB/yNrfo6AySsJdfwA
         ewEqFg/4E4HU0INmBQOqpDkTRLrpQBr4Xs0SywXVWCnwhUpmxlimHioNyqELgGt7EVqE
         /I3LyTWBIJRxIMuYtvqwVuoAJRSWFWIh1nCF/AgE1WKNzjejfMob/sUuac+b+XtXpje5
         nRScASM8D5SyF/+mhyQPhrmD3vSwfIMCMbGomWKxeWDN5T15uNl/rhypYD2MntDFLG/I
         XTmg==
X-Forwarded-Encrypted: i=1; AJvYcCU2vxX7jjyw8vB4Z9KhqF2CFoPoK5vbJoJdDEfgyPOwrUKm3gXP9qqBtyQpv9sCRErNpqc1NX5nz6aoJ6GGpiWh@lists.infradead.org
X-Gm-Message-State: AOJu0YyaFO4i6pmqcFm6c1BNtrL7yoaY2ELp7e+uPtBwSRfBXaMdcLt6
	QIufCcKpu7KRV0mnfzbB8C9HRjbRrCqS1u/Bk2yziri2ZKbFmQcX9DCn9CY6KmgFByumNUIRAos
	Xb0bL4OL72Hojox+TFTsWve/ouMWMDdw=
X-Gm-Gg: ASbGncvrow2Q1EquCJZFDGlLxw//Gv15kZjYKu7i/kqn8IBvVupqHIuCfO02MrkG4u3
	s0A3xnLrnBg149Qv/7lf23nTfZpkqNz5ZjNHnZgRjSKKoaww+9wmP1tUaCt5VX6UUyJiLT+Wbh3
	ZZraZfFYboSOI0mirxeImujcQwDGD12m2Ed5DQKOgzC/4dQWgx9x6E5hQOQG2Yj/b/8uxpKDH4R
	lYCfbG8nMGUBvaLk3uYEZ4tz6fxHcT3y7y045hmwyXMz4hjkF9Xii3s0lMJ9IY5pOD8Jw==
X-Google-Smtp-Source: AGHT+IG4YfmqHGe2pINyHg2K6LgJOKPpNmL7zajrt/SLmYhcYlyZRe1+iAEJYBHgTq7bsXU1Dyysoqylc7EnkaBl0VA=
X-Received: by 2002:a05:6402:d0b:b0:62f:337b:beed with SMTP id
 4fb4d7f45d1cf-63ed84b5cd2mr3624305a12.30.1761670845665; Tue, 28 Oct 2025
 10:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251028154229.6774-1-linux.amoon@gmail.com>
In-Reply-To: <20251028154229.6774-1-linux.amoon@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 28 Oct 2025 22:30:28 +0530
X-Gm-Features: AWmQ_bnnegLAH410rfGGE5Iq-GfVFIwFAd46rVhhltc96obVUpLwKbSOptU59bY
Message-ID: <CANAwSgTZOK9tdfQgVn6kZsxd6KdEuPn8ZH5-yrLqS4Np295dXw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] PCI: j721e: A couple of cleanups
To: Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-omap@vger.kernel.org>, 
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-pci@vger.kernel.org>, 
	"moderated list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_100047_877712_BF0A06F7 
X-CRM114-Status: GOOD (  19.23  )
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

Hi All,

On Tue, 28 Oct 2025 at 21:12, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Refactor the J721e probe function to use devres helpers for resource
> management. This replaces manual clock handling with
> devm_clk_get_optional_enabled() and assigns the reset GPIO directly
> to the struct members, eliminating unnecessary local variables.
>
> These patches have been compile-tested only, as I do not have access
> to the hardware for runtime verification.
>
These changes are v4 revision. This got messed up in the format output folder
Sorry for the inconvenience.

Thanks
-Anand
> v3  : https://lore.kernel.org/all/20251027090310.38999-1-linux.amoon@gmail.com/
> v2  : https://lore.kernel.org/all/20251025074336.26743-1-linux.amoon@gmail.com/
> v1  : https://lore.kernel.org/all/20251014113234.44418-1-linux.amoon@gmail.com/
> RFC : https://lore.kernel.org/all/20251013101727.129260-1-linux.amoon@gmail.com/
>
> Changes
> v4  : Improve the commit message.
>
> v2  Drop the dev_err_probe return patch.
>     Fix small issue address issue by Dan and Markus.
> v1:
>    Add new patch for dev_err_probe return.
>    dropped unsesary clk_disable_unprepare as its handle by
>    devm_clk_get_optional_enabled.
>
> Thanks
> -Anand
>
> Anand Moon (2):
>   PCI: j721e: Use devm_clk_get_optional_enabled() to get the clock
>   PCI: j721e: Use inline reset GPIO assignment and drop local variable
>
>  drivers/pci/controller/cadence/pci-j721e.c | 33 ++++++++--------------
>  1 file changed, 11 insertions(+), 22 deletions(-)
>
>
> base-commit: fd57572253bc356330dbe5b233c2e1d8426c66fd
> --
> 2.50.1
>

