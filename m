Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F965CD98C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 05:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vv8xc/JE73ka4IbiLvsyGTHwvLLeofhoh5T3QOJOdJ0=; b=ZA+5NQh+qA2+YWpqDMXNaXFT5t
	AgbFemA+DgCncY8LVRxCDlgO8h7+7SpVdE16rRDsOXvW5LyLpjGktkJgfCKDkTF5E9Y8R/zrjGFtw
	+Ohxz2qbourUSi503BZNZmQQaqSLYDhd1aVoFvTU3Ee5RqSNfswvmARFMYgkRa+cGv39vJymGOq6I
	d4liG4VeymMvvCj5RxgCqgqF2AKT9HFwHAUgLELXKultCxgGXQH9gyX/FEXIpHmBzfuQC+IzUF4H6
	xq2QrzO8qj6jm6Kki0sNIjdRDnuIDHkv5YL0sEnd+gQVUJcQcI3De2jFWlWp798zxKoqgbIVifWER
	cuUCnm1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXXsI-00000008iu9-3wq2;
	Thu, 11 Jun 2026 05:22:42 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXXsG-00000008itY-2stq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 05:22:41 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-396770cdcfdso76247051fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 22:22:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781155358; cv=none;
        d=google.com; s=arc-20240605;
        b=FiXCwBq0LVsQvC6/2A7bfqJRsNkmS+5OnhgAjNOfRsj6kwakmWyrixqqsE6kebPlmC
         sCCu7Q4Xh/W6Gp1OgcNutQUKGoYOEwoRxTKQP5MHt7vk1XXhSgK1JjETHg1mhVGkA1wB
         9TkyZv4oRt9Y5vm9E4focbBNgifZLaF/WoadF8HHPfqwtfOiijodY4Lk7yG/PXjgmSMR
         OcWVKBX8TAjA6RDElNvVs7dDnH5a+ZKsfOFMnOURY+084RG50T8knlQO0+QZEtuj39Da
         EUwt3q+Zkm/lWU6Ym8j47ABteKXWoR2mpUv5IEaLWQKq94StVz34QfDZj9mciudjd4sg
         E34Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vv8xc/JE73ka4IbiLvsyGTHwvLLeofhoh5T3QOJOdJ0=;
        fh=m4xyCNpiomAayKLoX0qr9sgYBq3BKOS+3PecPDZBUFg=;
        b=AxDN6vn329Ojqelo6UNiAZddprdePxbfLmprTA/CJG93NQZNqHLwpg2GX4xra9vi0P
         pyXZnEb7N6w+dvxgUoGYJh4xS7exLPFDMyBRSK2F7AUZBERJgDC/QxO9jC3OCm+LQxY0
         LttMbXRR/LeyJ3ua6Rifgro3ICcgpPj14fAl57KASyxoH2s8Qqo5vqqsE0jjjsu/gv78
         keWCcdPZbTWNIPAiCeyPdv0QEeKQ8kq45Vb57OHtJhO1Vg3MZgbMXk70AzeCBWPTfd64
         KbeYDhJd6PESHdL8lomn0b6+exTzKJUYZMMRAokdF4f28JLFcPVPz0aFXOVVNdhZVq7T
         1KHQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781155358; x=1781760158; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vv8xc/JE73ka4IbiLvsyGTHwvLLeofhoh5T3QOJOdJ0=;
        b=W7s5zZhCDTQNuV0WIVvZU2o696Tf7cFcSeXTntALjLTkrnnls9QJu9zC7PI2YvCYXw
         G0dw953pkdDyB3OuZk0NqYbWoZB2xn3nt5+XOBvlb+bVPH8kj6MH+QKKZfz0IQph1bRK
         Tk5fbARrweRiguCbg8ZlOI0vDA6bcv2DacuaLrMifNAjJqtr4ABEXkIdLh61qHiLM8Pr
         0xJJc1hkO0JIe4o5rwi3eAcapBz/1IXoJEUn1bEghzfIYS0hcfh1Or+MuETdNDcJPF0Y
         iQJ6EEDq4wrfLj6DdGC0wjtDUXrvTIMXy98JokBtTnR1S4ZQLvUlNU59juxBXhiiFVR+
         jiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781155358; x=1781760158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vv8xc/JE73ka4IbiLvsyGTHwvLLeofhoh5T3QOJOdJ0=;
        b=cc0ptAre5GeKukKvuwq3Zv+q50v3XENULHxFCwRu2uX3QaSIJxqqLfH4d/hWNEOclj
         PnHHyeeXpBLoacITBYyd7m6ENggIYR579t2/SW+6co4YjBDZq/PJf1fDlzVg4+QA7uDp
         T8+2EfV/taN3wlb5mhVW2ZZ8qNwNPqMADP2cBCCUPKjjMUZsxEeIQDZwUHR3ok8YSwTg
         ROzS1BSIDoST4/i7yj+zHiqfgpjA9lFebbQjy3M8qM3eyR95jq8Yydr+46QEAZV1vzd1
         KnALtCBOebfK0cnvzG8ttuYIwvuikl3vLV/kGPYY912+yRXQ1IuPzXEfj5KUPhXmmvTL
         MWfg==
X-Forwarded-Encrypted: i=1; AFNElJ9i3eKSRggNP2Kh/qQZN1EhjewXXnuoghaF6yLLPGfC9ITylkah3t9of3jOicrUuA0CCsPMCEGRwoEWXdUpNned@lists.infradead.org
X-Gm-Message-State: AOJu0YybvJtoz/JJeBTdfNBda1oAGa4aglpURCX+wqc2ixr+e4R6Z1yR
	C7q8sOlFWwpmuR5G2x91AErXTIr7l+C9VhIDPywwCvsx6Rf20wnTSWxmSWJuhL7IsmG5zIf9Vt9
	JWbSAvImPBxp/PdtRTf/2eHYoZN17YGQ=
X-Gm-Gg: Acq92OEGwmmBJMBbDKGdBag6Ugundkx3zk70Tq2f7r6R3mQ9vttjhvGDi5e+UGWxnNs
	Os0KcFXdb0vMX8U6QThLfyYY/Z7tNgSVw/2Zg3MP7azGr+OXOP05Ew0e1WSDTpsZI/MTUP0Uj6+
	xNSyQb6nkc6qsewIWLBBSV3AUphw4WBnAdxXa4tGNnV9Q7A4BIClWKdOWJk2MtnEMeoSr7HP84f
	+tKVNuMuUf8K9kwUccXsjMwaNPccyk8VH8w82f3F+8gUuytgUXlkI0B50YIj2hvlAPkxL04QMnG
	kqXJ8dzSAfmcqWsQL3M=
X-Received: by 2002:a2e:a583:0:b0:38e:d3e6:a89a with SMTP id
 38308e7fff4ca-3991a083973mr2593601fa.20.1781155357644; Wed, 10 Jun 2026
 22:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260610-ventura2_initial_dts-v6-0-375d8e9d7ebf@gmail.com>
 <20260610-ventura2_initial_dts-v6-2-375d8e9d7ebf@gmail.com> <a8cdc7c23166823a8e1969408c667e6a8d758fe7.camel@codeconstruct.com.au>
In-Reply-To: <a8cdc7c23166823a8e1969408c667e6a8d758fe7.camel@codeconstruct.com.au>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Thu, 11 Jun 2026 13:24:08 +0800
X-Gm-Features: AVVi8Cckj1KMTx5QCbBfuV37allJnJRrSd1WRpg0xdewL4kFILvgYndyDD6MebM
Message-ID: <CAF7HswMxtzD5KoQRGx4ckA4fUbFr6P7XXnTff_Z+_DmN8i37vQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_222240_742461_F9BD65B5 
X-CRM114-Status: GOOD (  16.20  )
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

On Wed, Jun 10, 2026 at 7:22=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Kyle,
>
> On Wed, 2026-06-10 at 09:22 +0800, Kyle Hsieh wrote:
> > Add linux device tree entry related to the Meta(Facebook) rmc-node.
> > The system uses an AT2600 BMC.
> > This node is named "ventura2".
> >
> > Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
>
> I have some comments on v5 that are applicable here too.
>
> https://lore.kernel.org/all/3d56889c004fc2d11b76ace6033c7ccfb8a37d03.came=
l@codeconstruct.com.au/
>
Hi Andrew,

Thanks for the review and suggestions!

To briefly answer your question: Ventura2 is Rack Management
Controller. It is a modular device primarily designed to manage liquid
cooling systems and monitor rack-level hardware states. Its key
hardware features include an extensive I2C/GPIO topology for
tray-level and rack-level liquid leakage detection, as well as MCTP
over I2C support for asynchronous device communications.

I will remove the redundant sentence and include this detailed
description of the platform's purpose and architecture in the commit
message for v7.

Also, the Sashiko AI bot just caught a missing `idle-state`
configuration for the MCTP I2C mux, so I will include that fix in v7
as well.

I will send out the v7 patch shortly.

Best regards,
Kyle Hsieh
> Andrew

