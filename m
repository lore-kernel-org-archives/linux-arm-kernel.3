Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A76CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 06:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uMONH+8GVOxyEjApROS3jg17q6oAv/cnPEMuimC2yEw=; b=bq0BE3VRvArGpeB1VbI/wRdPE+
	9iH07wmDuSebjtFTROjIynYxOyQUpDbBc6ZcEeqEL4NvlDI1FunLZvDgBZfBoxcpxE/LSe3tp2wcQ
	XalYr7qJJFVDiuYon9AOjCrdwd71TOXBMT+m3Wiq8tB6tzeN3IOUJeW/3mHzx4W5XUi6m1KiDAPha
	DTAz8iVZ0JcxuowPb5vuYekh09x4kEWn7UYeYSfvjlkeYkRoaYfkTEdyK+Tr8wk01ADfES/gt3Wj1
	IrotCnrUb/fL3fNvRHRsJyELytXVI3ShYKhapnhfGCH+QiAoSDbmQEkaUzSYOz0U7Lzl8whyFToyn
	U1IzIdBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDzh1-0000000HTxT-1csS;
	Wed, 29 Oct 2025 06:29:59 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDzgz-0000000HTwK-02jh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 06:29:58 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-63c4b41b38cso14563061a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 23:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761719395; x=1762324195; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uMONH+8GVOxyEjApROS3jg17q6oAv/cnPEMuimC2yEw=;
        b=Q+8GR/a8LRtXjXDpLRhNw86tMW2dzFSs30UMqZ+uInXkq4jnjeM8dNTHFZH3CefFYG
         rU70LRyF4YFQHp0BQVPcAimyZcfuTKIMkvNGdnHs+3s4xaVqpdcpMqx0duYAQBxWGkLI
         m9yc1n2m8Rg1tMy66vWQkSAowBcDvzIxMtv0pNmYmwW0/ZLaeewkxdEIHUCFwVu0k/n9
         Lv5Oxvk9mG3Vit5J89H5Ab7VCqWCGi21ff/CquVHiFEHe7bl9nmrhJzUPjG4YyaoZzfD
         jTcPIfCM8V/wtxjttlMLOz80V2MIn6Mppyuh9kw5CpNY3DamrkARpt11P+FPNniHgNTh
         W4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761719395; x=1762324195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uMONH+8GVOxyEjApROS3jg17q6oAv/cnPEMuimC2yEw=;
        b=OIWPwGf3vuHiuTGt3YCrKu2/8vb2IqZjYpXKVN510F3kYkFKyEJvEPHrgO+2RqVFBf
         C+1iBKtuQj/5wQgm68V+aLe5H1TVxcQ7qmaJmsFnxLCa1ZFm7VarMJf6r0NLB3YSyjNj
         c4FUXa14SUGxaYIJ7qKn367GbD+6FLDDII7frARdSVFwdtSHFtIHtKEf099aA4edbTnm
         NvZDtwGlmoThnulv4V0pSx7XOMc/d7FWchxG5cxZY+aaonq0YzGwOvctYbOH0MkP3Z6L
         1jpI6DMyOYOrbDlAeEKibMMCRsNVHyXHi2Xajs4mCaN+Dk4h4ltVwMTjJeQVpd9p955+
         Y4AA==
X-Forwarded-Encrypted: i=1; AJvYcCUFxIvKCJac2iTlzauHmUteII28Hx+gIVv0dIuYcYWyBE6NbXrHGhdZL/vQI4eIYHq52Ws9DQitZ86H0NLtjnzW@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1jC1FFd+ley5E7IMAiY2sqOgsWymZXI8365WGlQG+lnkfoQYl
	lZ+IMVX11uwUk8FKGUkFSeNG9VsuwBwYxjWoFsRoSCJFUb4Ezmk0sWeN2u0n1ZuIjgmoGGSXEOQ
	fOLGXFqPrZ78E56+/1gom0mV5ZbBShEU=
X-Gm-Gg: ASbGncuCBG0OeYbTu1iCNs5t2uYD9Jx7U3J3YRVvufjU4p6FhZX3CYu6M80bmGpotmF
	FD/zmdtKOjNqkIfdjTHK9q76fxa/eQRPDauVA9zoqZv/LheX0luFLphshq7Gr7KohaBWl9sKnDs
	cYg5t3x3TTC4r/titQ0dI4oHH6ePMub0wdM3T11ACQnIeYU1fnuU0WcXwlpxuTeP5EXGQtTnHco
	5KfsZeAUwUSxtCwLgHMbXtDPYBScbQpJVv3e0pdqtflXygNPKWBxfwhh4IwM2t+J1OtBA==
X-Google-Smtp-Source: AGHT+IGkpMP2JV93jKtrqYcUv2doQVUVgTWnNctMEjS6Xs0nmKSaC8SY+NE+YO+7RTCK8H8Slnh23fd4/D0WvABiTU8=
X-Received: by 2002:a05:6402:26d3:b0:63c:1f3e:6462 with SMTP id
 4fb4d7f45d1cf-64044251e38mr1273131a12.23.1761719394933; Tue, 28 Oct 2025
 23:29:54 -0700 (PDT)
MIME-Version: 1.0
References: <20251027145602.199154-1-linux.amoon@gmail.com> <5264377.31r3eYUQgx@workhorse>
In-Reply-To: <5264377.31r3eYUQgx@workhorse>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 29 Oct 2025 11:59:38 +0530
X-Gm-Features: AWmQ_bkhkw-pZtArjJD2gcBzKDEhehQeURBZRDtuYYptEbI6fqoAKgnKeMTW7xw
Message-ID: <CANAwSgQts0B2Sq0V2psa53WzTLEdU-Z=jkqGkW1ESmvKf_6EyA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Add runtime PM support to Rockchip DW PCIe driver
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Hans Zhang <18255117159@163.com>, 
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_232957_096059_3DA821DE 
X-CRM114-Status: GOOD (  21.93  )
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

Hi Nicolas,

On Mon, 27 Oct 2025 at 20:37, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Monday, 27 October 2025 15:55:28 Central European Standard Time Anand Moon wrote:
> > Introduce runtime power management support in the Rockchip DesignWare PCIe
> > controller driver.  These changes allow the PCIe controller to suspend and
> > resume dynamically, improving power efficiency on supported platforms.
> >
> > Can Patch 1 can be backpoted to stable? It helps clean shutdown of PCIe.
>
> You can do this by adding a Fixes tag to your patch. In your case, it
> might be fixing whatever introduced the clk_bulk_prepare_enable, i.e.:
>
> Fixes: 0e898eb8df4e ("PCI: rockchip-dwc: Add Rockchip RK356X host controller driver")
>
> This would be put above your Signed-off-by in the first patch, after
> the empty line.
>
> To generate fixes tags like this, I use the following pretty format
> in my .git/config:
>
>     [pretty]
>         fixes = Fixes: %h (\"%s\")
>
> I can then do `git log --pretty=fixes` to show commits formatted
> the right way. To find which commit to pick, `git blame` and
> some sleuthing are helpful.
>
> With this tag, stable bots can pick the commit into any release
> that the commit it fixes is in.
>
Thanks for your input.
I will leave this to the maintainers to decide on this.
> Kind regards,
> Nicolas Frattaroli
>
Thanks
-Anand

