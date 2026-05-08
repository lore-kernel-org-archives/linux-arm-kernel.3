Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F1BCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 17:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1gOD0ZM4cLpgZVKDB7ZJDmU99nqHZQBEOc0xVeQoZU=; b=usjc7ecC1JQKTu5nc59pWq7yGp
	Fzu226knayvUiyy8aOrUiQrKox15WdHSFhvgNd/QinOtao43jVJWgRSiTe48yEvM52urG+uB6EkcY
	GMqPDt+fYKuOL/r2LZnYP7nEUdLvLKUdc6OCqvF7JU5jXOlVRdLu7YzOhAyejPI1kHyJUx5422BFl
	eWMGZRU3CgPjTJIDTrrEvPow5tKMtovYMK0YyrtO4ktzSwYBlLLspykaRYJOLQJtRHAlDG9YPN+A7
	VKJPqmvWIZD46H4okazCSLSV7/3GAt0RYH/mjC2uotMFnd+qxksId/Hcs4fBmanaUcLhhXEUG9Ec6
	4FEObHKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOxh-000000078Pv-3fT1;
	Fri, 08 May 2026 17:26:05 +0000
Received: from mail-vk1-f173.google.com ([209.85.221.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOxf-000000078PW-14Pc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 17:26:04 +0000
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5751a9020faso1440234e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 10:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778261162; x=1778865962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1gOD0ZM4cLpgZVKDB7ZJDmU99nqHZQBEOc0xVeQoZU=;
        b=qELnEZ9ExeJ0mddvJiFrIZhKo/7XMc594FZtdyNhGljsszJujGDLAtn8pECd4QLNBi
         5KZakZQcvd/wvraPIrJdp5HFyP3JDc/mbSMHOhBJVYgSK9vms5JRPldnYdDwX7S8Y6qy
         3ngytntLTLxJulIOEAKq0JOSurguK1h3wlMx3iXucfPKZMTdYlWm7UytF/iNUWMEM2n9
         gOOXTlCf7/fktqtbSblUz9rp8M+jvBAKxWuYajKuTO24nCsphjDKDug9a4Dz+CIa6WgX
         zjoDlXtX2t/n5YPOjpxVrETsmPfRoDTsFLFGrmtQyyi11697a0xvI70M/nRdIIAnwOu2
         Ck+A==
X-Forwarded-Encrypted: i=1; AFNElJ+alPIlJIgEcbaF/fvoZh+XMuqFgTjgZ/+KMwR6UoOsPUVPc2qLS14rh5C3tnGFN3Q/aOytnQx6NTL9GfVo1QxI@lists.infradead.org
X-Gm-Message-State: AOJu0YyoEu0QAArDpjOOmSr6PxO+7+eGGyFbLgJnWnLcVfdyJovve1so
	dUstAw8EnLUpAKYAh+iHWNI9aUmWbGfDEi0LBW3kgtQljN+BCA/DjvzNEobTqTt/
X-Gm-Gg: Acq92OG29K9DutCSyWP6RF/QD9FKYrS6vHftl/IqDR+VcMfzTYYDSlDn7MIzNUCeFpy
	TzveRUfgKabtdXCdQlKytMOdPt6lM2ncFkj5imz1MF6LPZL9PHbk7EkYiPK2Eh67hCM7LNbDTH4
	lVI1ZiSrzCPQikIayAmyvtYKMsZap9fp0VDOIPKX2DOvo7EitajJlQVHugBwV4skyplpZDwpkCA
	+78/ykdNGWHG6/i3UR5cEm/eXt4CVSJRibMQM22Rehl3/yNmJDZ4FTJf1/ZGmP5oI/BPr2EsA/4
	53V67jPwvqEtoSzeV0jIF34AojNYM8wZyXT5D95oRCDca+FDDakNU3QsRkUuzraukGiOZG/PCxr
	GqTX2uiZFlYJ5CjZb9llOaiip+nyL/tG5Ul7IG5rrEuFv/m2AaEMbMQbssk128sZKbhDjna/Y+x
	U91hRpRW6j4ZVTn8f/Ny9KuWEVvdzwev+BOKgcrjXuuP8X6EAP+OktvavNsNqCSzTMBMWL8iw=
X-Received: by 2002:a05:6122:3d01:b0:56d:2ca7:fbc3 with SMTP id 71dfb90a1353d-57559509d20mr7683872e0c.5.1778261161952;
        Fri, 08 May 2026 10:26:01 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-574a6ef15e0sm14305497e0c.17.2026.05.08.10.26.01
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 10:26:01 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-95cc96eac66so1279366241.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 10:26:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9ehAXH7ayfKGfQ10SCRJJMrwFisO0LHe1d0lTv9C62ybm9WGaGdBhFlLJFtUBZD+bLpSitcOca8Qa4vVBBuEd2@lists.infradead.org
X-Received: by 2002:a05:6102:8496:10b0:631:37cb:1e64 with SMTP id
 ada2fe7eead31-63137cb2003mr2206554137.4.1778261161532; Fri, 08 May 2026
 10:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
In-Reply-To: <20260508153300.2224715-1-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 May 2026 19:25:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXyJcmL1k+odRC3ej1fx2oH_Li3RjniXuqXyJUMpBo7CA@mail.gmail.com>
X-Gm-Features: AVHnY4ImO3mUPR5n2IoskKjzHgmLGVKQHLOrOGove6CxmDdyTEnlUGm3u2KWMbE
Message-ID: <CAMuHMdXyJcmL1k+odRC3ej1fx2oH_Li3RjniXuqXyJUMpBo7CA@mail.gmail.com>
Subject: Re: [PATCH v4 00/15] SCMI Clock rates discovery rework
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, geert+renesas@glider.be, 
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_102603_302280_702E3791 
X-CRM114-Status: GOOD (  18.18  )
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

Hi Cristian,

On Fri, 8 May 2026 at 17:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> it was a known limitation, in the SCMI Clock protocol support, the lack of
> dynamic allocation around per-clock rates discovery: fixed size statically
> per-clock rates arrays did not scale and was increasingly a waste of memory
> (see [1]).

[...]

> v3 -->v4
>  - Rebased on v7.1-rc2
>  - Removed unused info.rate_discrete [Geert]
>  - Made dev_dbg() more meaningful by printing tot_rates [Geert]
>  - Fixed build bisectability by renaming properly to iter_response_bound_cleanup()

Thanks for the update!

I believe you still have a possible runtime bisectability issue
between "[PATCH v4 04/15] firmware: arm_scmi: Simplify clock
rates exposed interface" and "[PATCH v4 05/15] clk: scmi: Use new
simplified per-clock rate properties": 04/15 removes the last setter
of scmi_clock_info.rate_discrete, before 05/15 removes the last getter.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

