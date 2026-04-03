Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB6FE7E350
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 09:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JrMS3BmPgb8kmzZIH9W4BGKhy4JgCpGMmlju1jJRqIE=; b=VroDkcLlEgxCy992A1VQE83JxX
	oWSyU3EuOk7PeVC+u+Q/EXOYpb3buezPMkfzx4bObv3kjtad+a7KVwVo0WWEKnWlg5BeFY1TjMZds
	kuBWb2diKBjikuU4GEIcZQmj8QLUwqolQj5fEYWy1HKbl5Jqi1bf1loSuKHUYtjSrkG+PO6X0AFZs
	Ry1PuWY/FIX5YCpXnaYjENxx2nhTUi0uoICRNKliUL7oKsIEcZVyRRhWYPWT3flhPujs/DVCGQvB+
	u4/Wd5NxcpPiHfcPqQsk8W6MlYljI5dI8LAfDd4+uZ3i90/UzAlQuot24invApeP16jMJ0AQSgWgD
	x/3Xqt5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aR6-00000001lfz-3wjE;
	Fri, 03 Apr 2026 09:03:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aR5-00000001lfi-1pEv
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 03 Apr 2026 09:03:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JrMS3BmPgb8kmzZIH9W4BGKhy4JgCpGMmlju1jJRqIE=; b=EWTDKmZU1id1a1QLlF92Cvro60
	d//9f+ZIoLjx57Ss5+3J0p+VqioaZQ6pLD+9NHVVedY7A2uzzS2IEWkvtnEjAT00DlkMI2CFoGfrp
	KkIDKWzyOHBJa5COl6qQmL0nubq5hPHp+q4foPRdiWJsdjbmURcPBLUfvdVFwjMKu+MXbTfTMVqYu
	3sVlc9t7nDUDy3kKKDONF0MsfStdeGPDiEVHg2eT170M3z7fwT9uvwdnhdShy58rQ1ot0HtUY4ihN
	jDi3P/xMWlJZsrsEQYyf/tnr5fZK/tomuWmtw/JU3ltJmWcM7kfINpO4HvcflVAWQjW0WVES84hpk
	XYHolyIg==;
Received: from mail-vk1-f182.google.com ([209.85.221.182])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aR2-00000003rNE-2SHz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 09:03:26 +0000
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56d89f35940so601429e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 02:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775207003; x=1775811803;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrMS3BmPgb8kmzZIH9W4BGKhy4JgCpGMmlju1jJRqIE=;
        b=BrNxBQdy0y6fKmIjbHiGQqyt69WOXnGOEQPJvCEFJUh+8rozaSiSNjPFKFV2rXhl58
         c4fJe+SJMaDA715oMKPTtarLZE5B02ZeRe98wOUX6yd4n2yn9E6woif+OfZxEbeG9hs2
         483YnLVRri05aAZZY4iYf3hfhJ8vNTehpbBQ59dWnOk6kE4CwLR1rsFUnHiyI31di9w+
         NHb/nWe8E8Il/qL/4e7hNDjA5oywwI1ilo1rim6qM9RR19N1+qAhiPCps9f4GcE8QRIv
         2LMPSnm88JOjiin+Sn0TLkfd89u2hcvQdeMh35+rhhgBH2adwl7BdwgLqk1Pfd+vB3hP
         gVyA==
X-Gm-Message-State: AOJu0Yzx9XGoEKHdeYM1OBYSW35mD7k/taQUuYz9FaLxM68Va1i9Ad3G
	bIOJJ6xiitq6QcgpILpVofJHXYIHXtfEO9oU1p7WdH7QdSPBvuY5lhPQPvcaHxdP
X-Gm-Gg: AeBDiesexlLe9gAXgUNs43AVknttim9YF6nyy58sJzrSr/G/TLdZ1Em3sJ+96APSNHC
	qgmx3nEoulOTZZQue8rE4wzwhsxLd1INEvXp/cYJdjaWmv6PZsIkdq55M2DZdS8QVBxHoNg4yN+
	HffVDqi0Xa6AEz20P7v6nqVixWW4Eu4ybQUYUOpu1tcmWwYf0ABtCvcWmmOEfhZhxDI7Ak2yrZ8
	avYSGgZyLi1WF7HlmdKnaIbuGgJlTHjSRDD4oTrUuFo7wZUzk/bBHoEDPpDUOVU4eIBbMtXjd6E
	hS6jbD8LhG6LVVLqqpC6oK4IXOexA8XycjoG7fjwiD1QVOTLnJOI2oKkFzn8FBtfkzYh+hpubu4
	XrjWDttKoe+DXChuu8EgchB46nlvQHTrB2uCq1IGeAcVSz6tcnbjh8quZgw9mk2duvOstoxcr0z
	CDgQoE6t5L5lBOJs4nlot1u6iJQf+e7DuTRH5neLH71Nf71FNSbcIrCQTL51Jqzz8J
X-Received: by 2002:a05:6122:d29:b0:56c:c8bb:cd8e with SMTP id 71dfb90a1353d-56dab8138a8mr724216e0c.1.1775207002594;
        Fri, 03 Apr 2026 02:03:22 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bc9cbbasm6577379e0c.9.2026.04.03.02.03.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:03:21 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56a857578a8so670046e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 02:03:21 -0700 (PDT)
X-Received: by 2002:a05:6122:6992:b0:56d:3c26:20a8 with SMTP id
 71dfb90a1353d-56dab8146e9mr655900e0c.3.1775207001558; Fri, 03 Apr 2026
 02:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org> <20260326042411.215241-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326042411.215241-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:03:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJsrB6vTHafKnpGDqb-Lc461T9Hd-nWPOVdm7E0MukDw@mail.gmail.com>
X-Gm-Features: AQROBzAUWGgjsdDp3P5htV2JBQzE4EKlybGyOmFyU2VyK7rwylLSVOUsW4xN9NQ
Message-ID: <CAMuHMdVJsrB6vTHafKnpGDqb-Lc461T9Hd-nWPOVdm7E0MukDw@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: rzg2l-smarc: Fix missing cells
 and reg into CSI2 subnode
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_100324_756288_5C4493A1 
X-CRM114-Status: GOOD (  17.13  )
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

On Thu, 26 Mar 2026 at 05:24, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add missing cells and reg DT property into CSI2 subnode to fix
> the following warning:
>
> "
> arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi:49.10-55.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@0: node has a unit name, but no reg or ranges property
> "
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

