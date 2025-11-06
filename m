Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF3ACCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 07:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0f5wmX+yoZg0wz1UxGaCZPnItqaKdkuDqolTF8KvNuo=; b=C8H08cLIm6DNj5el0rNoOjN44P
	jAY6ql8syRoflntcc4hl67e30HBtLlrsjHmDnYJzD0aPA2Y81yO2ykJMco6AsLVeTFKMJ1Da9J4AP
	c4Rf4bJzMaSs2NBQSb6zVX8gzIlQvoqqcLlsfRvju7/8p7/02x7DHxldrt6q+ITv8ceEWJjSWSDqa
	igiDIUWXStQZNsXlwHAD5XdQFHzK5yf1xgw7vcwwUYlJTq83pyIZVPinhBQSZlV2h/P4iNkC2znST
	FFXjZUgXGSOFvvr+23dipZqStbJ5wbQC9sLXTZ/l5G4WH60KFBzjHRVWY5lsAgt8HgSbCEgmfSS5b
	wAj+vR2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGuhj-0000000F1L0-0dFb;
	Thu, 06 Nov 2025 07:46:47 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGuhg-0000000F1Ke-0stb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 07:46:45 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b996c8db896so583681a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 23:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762415203; x=1763020003; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0f5wmX+yoZg0wz1UxGaCZPnItqaKdkuDqolTF8KvNuo=;
        b=GBlyfYyU+OYrY+fXmPf5TR0HbB+xJMvtxMCqAISZJXyvSmGUOl7mDv8KKUa7x78ux1
         n3F9LERAIyj1st0Cg2Tw2GEgWpKVPzscmY7Ub5d1t5eCjp4s1Scr0t4RcvItECeaKJRR
         h44QnwJQ9c3tCbgQR142zlwGAlbL+ZhbGlsEoq72T/2r29ieptzaLVUJluUWt/jWlRko
         D4by5FOW4i674H6M6hr9lNUcA8Q+y4GX+GWPTuFnUZ+TrT+lzxoUHwuxlAEGUELoN94p
         kyjJVEFD3FSDvG20bY9yhdwe4OGBvcmiaO5KvSnKV+XELNR5tnh5W6iOwE3jRn8iBVWP
         81Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762415203; x=1763020003;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0f5wmX+yoZg0wz1UxGaCZPnItqaKdkuDqolTF8KvNuo=;
        b=fInhPxCVzAID+aRk1I0IAka6bSpZoNgNqnc94ThGQYCuFA5RUPdOmwKCuDjE7dSuSc
         D+Ga+Fzym5OGftjLJaLv5VZM4CJuedW/CC/bUfQig7zPUD33WULds4kEiP3hX+E6vT2n
         /a6gQbYe+gPTzdoXP+FrLm4b/vWrTLqNIYAjhusjlLaBHhYL1wgOjNQTrvWGGXsSkVM8
         mgWZWMtwE+1KVZcWU0R+fujF7R826uANyvTN7z6KKegCMWqjkHpQaZdAKS9nmVRswyNQ
         l68Wmj21TYWjgKdSdY94J7heb66+ZCbi9s3sKSu4qe43NTYMSXEKsU+R8pgtY0nptNY7
         qVRg==
X-Forwarded-Encrypted: i=1; AJvYcCXvR1c91/dqo7nxu/Z5ApIu2b/wiRm1elG7xpEyvk3EhBxUV9KfhgjLQDgxMIlHV8aQTb2ejCb4WaEzmOdvgvV/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0xYTX5JNyw9691gAfCzvZhogWctTVWE/9v+78DScYyb/5ftJ5
	VbdBDYrpQVsat11NTgi+bH1rFMOFJKNXB/h6YhAhEigefZ+HDxFEhh6a7t96E+2p7qKrM4jp7oZ
	Wgg2AINBZhcKlo39Es2YNsrGPUe5dUZmWJy7rj57lfg==
X-Gm-Gg: ASbGncuZV2zVXXQe8DNTf8sWxxWfQJp2YGlxijnuu5mlqTnC7CW2tOvrFj8/XrGmFHN
	HKzx9AWKOvvYMDYEe1Y9oOCb34MwvUmHHaDWOACBeRqyJI4riDQe2tuQW7HAPL2E1AzSoXeRh//
	EYyIjGg7zYggzYQ1DRPGlHj8SCQ7tvKwQiMIsRc0tU5EBva6FFcsYvvpqF19aXaPW9Ge9F6bA8/
	M63Yx3J+mnRFk+wmvN6lqHCOrC7Bdtaks+vmGlfpUOktwwsiRkYsx6+tdu5eA==
X-Google-Smtp-Source: AGHT+IFvj7BYATFPUUfyyTquYUZ+XG2ltlcW863lIimOI+3G3/lJLUOzbLQ43b0xX7YM+rdDM6ZeBwU/rpFRv4aSwps=
X-Received: by 2002:a05:6a20:728f:b0:350:ee00:3c9f with SMTP id
 adf61e73a8af0-350ee004101mr3256044637.48.1762415203454; Wed, 05 Nov 2025
 23:46:43 -0800 (PST)
MIME-Version: 1.0
References: <CAKfTPtCtHquxtK=Zx2WSNm15MmqeUXO8XXi8FkS4EpuP80PP7g@mail.gmail.com>
 <20251106000531.GA1930429@bhelgaas>
In-Reply-To: <20251106000531.GA1930429@bhelgaas>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 6 Nov 2025 08:46:27 +0100
X-Gm-Features: AWmQ_bmqVCNR3dJpEZPSNIsk4oiASQ7wTNG-cdh5_x2RX44MkoIq9HcAbtR0V5w
Message-ID: <CAKfTPtA+_VgQQB37Y8qCd6cc5U22kqUkagy2PFnB-5biWUhB9w@mail.gmail.com>
Subject: Re: [PATCH 3/4 v3] PCI: s32g: Add initial PCIe support (RC)
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, 
	s32@nxp.com, bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, 
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com, 
	bogdan.hamciuc@nxp.com, Frank.li@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	cassel@kernel.org, Richard Zhu <hongxing.zhu@nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Minghuan Lian <minghuan.Lian@nxp.com>, 
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, 
	Christian Bruel <christian.bruel@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_234644_417155_BEE781D3 
X-CRM114-Status: GOOD (  37.73  )
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

On Thu, 6 Nov 2025 at 01:05, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> [+cc imx6, layerscape, stm32 maintainers for possible suspend bug]
>
> On Fri, Oct 24, 2025 at 08:50:46AM +0200, Vincent Guittot wrote:
> > On Wed, 22 Oct 2025 at 21:04, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > On Wed, Oct 22, 2025 at 07:43:08PM +0200, Vincent Guittot wrote:
> > > > Add initial support of the PCIe controller for S32G Soc family. Only
> > > > host mode is supported.
>
> > > > +static void s32g_init_pcie_controller(struct s32g_pcie *s32g_pp)
> > > > +{
> > > > ...
> > > > +     /*
> > > > +      * Make sure we use the coherency defaults (just in case the settings
> > > > +      * have been changed from their reset values)
> > > > +      */
> > > > +     s32g_pcie_reset_mstr_ace(pci, memblock_start_of_DRAM());
> > >
> > > This seems sketchy and no other driver uses memblock_start_of_DRAM().
> > > Shouldn't a physical memory address like this come from devicetree
> > > somehow?
> >
> > I was using DT but has been asked to not use it and was proposed to
> > use memblock_start_of_DRAM() instead
>
> Can you point me to that conversation?

https://lore.kernel.org/all/CAKfTPtDcvrAcgFcyFLnzaKnfuU3iB551qed4fnZH=b7Ntkpxpg@mail.gmail.com/

>
> > > > +     s32g_pp->ctrl_base = devm_platform_ioremap_resource_byname(pdev, "ctrl");
> > > > +     if (IS_ERR(s32g_pp->ctrl_base))
> > > > +             return PTR_ERR(s32g_pp->ctrl_base);
> > >
> > > This looks like the first DWC driver that uses a "ctrl" resource.  Is
> > > this something unique to s32g, or do other drivers have something
> > > similar but use a different name?
> >
> > AFAICT this seems to be s32g specific in the RM
>
> It does look like there's very little consistency in reg-names across
> drivers, so I guess it's fine.
>
> > > > +static int s32g_pcie_suspend_noirq(struct device *dev)
> > > > +{
> > > > +     struct s32g_pcie *s32g_pp = dev_get_drvdata(dev);
> > > > +     struct dw_pcie *pci = &s32g_pp->pci;
> > > > +
> > > > +     if (!dw_pcie_link_up(pci))
> > > > +             return 0;
> > >
> > > Does something bad happen if you omit the link up check and the link
> > > is not up when we get here?  The check is racy (the link could go down
> > > between dw_pcie_link_up() and dw_pcie_suspend_noirq()), so it's not
> > > completely reliable.
> > >
> > > If you have to check, please add a comment about why this driver needs
> > > it when no other driver does.
> >
> > dw_pcie_suspend_noirq returns an error and the suspend fails
>
> The implication is that *every* user of dw_pcie_suspend_noirq() would
> have to check for the link being up.  There are only three existing
> callers:
>
>   imx_pcie_suspend_noirq()
>   ls_pcie_suspend_noirq()
>   stm32_pcie_suspend_noirq()
>
> but none of them checks for the link being up.
>
> > I will add a comment
> > /*
> >  * If the link is not up, there is nothing to suspend and resume
>
> Sometimes true, but still racy as I mentioned, and doesn't explain why
> s32g is different from imx, ls, and stm32.
>
> > > > +     return dw_pcie_suspend_noirq(pci);
> > > > +}

