Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6E3FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 14:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJYvNhQ3mzD7bXhkgriTfy1RxP23dOYPeDTU/pUBZ1I=; b=f+TTVlgTnu17xdSOyep4wq1t/j
	fvWpMgDfZe12edkSPL7P+Lbj9cQwfAY25fDHsomEgwTPqOjGSJauL5PeYFWhzdFjnnn23lC94usAl
	Fwh/GcKB0PRS2O80+iPToeIw1F9fun2w5o5An1GoZDmkgv5aNAoVTOauWUONXKuh/IEvoQuv7k2RT
	1bU/IOq+r/eqkqB4NFv9J/IGo7wy5r4asA0SvsT+t9tBET3WGHNZP0I7W/apcDpKLLcoDKIkaUDg2
	ei3P1xdV0+16boXW9gDnH8Jl0jPXFjegq8H13Q1egX1UUSlxpfJB+7tLwqR3t2lbL9VIP1Y4Eg7Su
	cFK4oMaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJu5j-0000000DPEr-1a5i;
	Mon, 04 May 2026 14:16:11 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJu5g-0000000DPEE-1KRD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 14:16:09 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-6587cee8b57so4363519d50.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 07:16:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777904167; cv=none;
        d=google.com; s=arc-20240605;
        b=dbbHyoWDW+ODxwchv2ACRkLIT9brumw7SJeUeIO8N2X+Avp0m8l4Zn6OCblKjrfGlk
         ntxjwq9zGqm5G09pKWmLkgWammrbtacSWfSiiE7mrQwVcivj+hHGjHYIMmnkF0+Gf3dE
         GzuzdOliVZovQrYCvogtDoyNwgRTlEHhWXEezST+dftuItRei5l9IVXGuj0TX6yPJNWk
         HrruvhvgGmM2RyCgTbob0zNaKVszzaQ9aMrxfXm7FFtbXSIjACTGTBtzTrCdBv4gSX+S
         WID+BDWaRNPktrI/r2HOzdNjLkXbM1bMTsCcpoMSsivvOHKLTPNoJMUcdY3pk2i0eMUB
         xPlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KJYvNhQ3mzD7bXhkgriTfy1RxP23dOYPeDTU/pUBZ1I=;
        fh=RPeh/227bnX7LpVq3VxZT/Y6nGm9fSHRvJ7H9cB2z38=;
        b=f2YM7/2RwD8HiTrLqYyU7X0SV8YpWV/uIz6HFQxgkbaKcMXWzIboXC4qM1Iw5K9uZW
         UW/PDQggyxWi8ROo1hnXHWgMXggTRvMWbvx8xUecYeG6y5NV1pK13Iqh02hcBeLNi07b
         tOPsK8dXUIFy58BM/FAzO7dkvjxLUFfWICRAr8zeOgCslYF08GjsA7vWIt/0HYqkUAvp
         BSuXFN8I5TDvY2nNYyQfOzJpXDP4rnpmcHLUzGDMpAxVqd0AHDlM1PHsR+oFO3nW31F8
         CN8A73hSTP9Wfa8Tnx/+7JRjsmfey/pEyx2U32w5pjjlVceHM7uTtDirSdicMtrJYwUG
         BYXw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777904167; x=1778508967; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJYvNhQ3mzD7bXhkgriTfy1RxP23dOYPeDTU/pUBZ1I=;
        b=e39QPQ01T9yQY96YjHJtXyot1hiblH1gFKE9UYFm9AMxbEZgL/4V5N2trFhLaYtmKF
         dgnDXKCdEbrrbXFWFizdRnGoW5u3+lh/2uNWNm3/Zr9OMRWB4PPqml3akmOVmXxCldLJ
         HcqDUGeDf66DTDQNu4L94u/QIeksWOvK32xbrjPcOIu1fqgG6wXZvJ6WIeMgXEPc2tLT
         NtJhfzfDpKznyOUdUSb6tQYRUOMCxcxQCYt1eeT7fyKMfUh0otBPs/Ry9ShjqtYOfvMW
         nxh1Q6Uh+jAwpqPcRf7UsWs/+wEOUzTQd8UzjtEk1QEV+i53tDD33v5zUuDdYCUcK9F4
         Y9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777904167; x=1778508967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KJYvNhQ3mzD7bXhkgriTfy1RxP23dOYPeDTU/pUBZ1I=;
        b=kfs6XXfPq40R7LK25lTouTNFXQ8vOLzV0QXt6YKNJRLr+6HteuF2cGLyjVraL7oNRC
         xbIMhimi+pLPgTsXEam7SlrQf8RumFBjP3XGx6RJ8sZloMjwF4c4DzqicvrXrw0YfM5a
         fpfs5dl2tWRQ8408RnNgtr4Ev7Va639I4R0FU+V2qgTBAAiDO1ryIfqR9bbWlNeVjqUv
         vFwzWN4gth301/Z7Bzi5mANEkGmOWBY+quYvWnVL3r4pGs8gkYqDKqPYYBs9R8vGS1hk
         EKG1qj7cfMwMjedb4iwoKuGLfcWNmiXFnHaHKcgXgSBh3YXVBy1FmhZie9APZ9TO/fXd
         ZPiw==
X-Forwarded-Encrypted: i=1; AFNElJ97PmIZ/EZBKJv1zgMLPJcnNaiDqmlC1/Wu0ryTrQ55Ip07GPhykU21oRMqGUx9rtTeMjDiMBynXnYmK+sNPto9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4OPBH8hT24mYbq0wFAIdXI8ce4//nL2CecaRI6iOSdLPpaX/d
	AHCNEz10tv3JUnxPiFObUMZPnYsOOnqaZtvHa+VdtlUcDTLn4Lb85heIsjVkI/l6qqMnSQqyzML
	fy7fwG+PnpRdBPwufxVSSvdS7819Nyc0=
X-Gm-Gg: AeBDieuttfY1f4pycC6YznO1SsUCNinXR086w6Fc7tXz6Oywq9CrRJmmlnmtbBI/vUa
	v42daIurfahQrbgxTEy8WVXbG5ovwgwmlprUcFQDwp5ZC1CqgsnTyaKZWE4ekoSVAThKbW0TpCT
	XWUhVyoZBFw1j8i2eX8ZavikCMdvgPQJfgDCZcmZHN/16n4Ut/B55VxIICJ4kd/irOJ5BTAVoDs
	9sdfwdCkH2m6s/jVZG9m+asZTVNXZhkAgwwzOAGQMa4IUt+TXdoja6Eb+2N4cZyvV0dt+SUELM9
	Hi2AJOyOAwyqpnnzJ8Q=
X-Received: by 2002:a05:690e:1186:b0:65c:6452:1ccf with SMTP id
 956f58d0204a3-65c64522530mr786151d50.8.1777904166584; Mon, 04 May 2026
 07:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <dd4dc11e-338a-4d13-9830-095a93187f4c@oss.qualcomm.com>
 <20260504041407.289464-1-threeway@gmail.com> <ffd59407-c65c-4f99-a587-3b968f9c82c5@oss.qualcomm.com>
In-Reply-To: <ffd59407-c65c-4f99-a587-3b968f9c82c5@oss.qualcomm.com>
From: Steev Klimaszewski <threeway@gmail.com>
Date: Mon, 4 May 2026 09:16:00 -0500
X-Gm-Features: AVHnY4JCkZFUA50J5VjxRP-M3UPWI_XzDvfu0OdsGPxK7C4Ok0bBFRM_vOJe338
Message-ID: <CAOvMTZgpYg-UFuQE01NsECTPf3UEHDifnCLYu7iEqOUnvzs0Ag@mail.gmail.com>
Subject: Re: PCI: qcom: Add D3cold support
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: bhelgaas@google.com, bjorn.andersson@oss.qualcomm.com, 
	jingoohan1@gmail.com, jonathanh@nvidia.com, kwilczynski@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	lpieralisi@kernel.org, mani@kernel.org, robh@kernel.org, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_071608_364610_1DA10C9A 
X-CRM114-Status: GOOD (  23.27  )
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

Hi Krishna,

On Mon, May 4, 2026 at 2:06=E2=80=AFAM Krishna Chaitanya Chundru
<krishna.chundru@oss.qualcomm.com> wrote:
>
>
>
> On 5/4/2026 9:44 AM, Steev Klimaszewski wrote:
> > On Sun, May 3, 2026 at 10:37=E2=80=AFPM Krishna Chaitanya Chundru <kris=
hna.chundru@oss.qualcomm.com> wrote:
> >>> v4 of this patchset *boots* along with Mani's patchset, however, v5 d=
oes not,
> >>> and unfortunately, the machine does not seem to get to a point where =
I can even
> >>> get logs from it.  Do you know what I might be missing?  I have *not*=
 attempted
> >>> to remove the nvme drive and boot off USB to test it.
> >> This series, will not have any impact on the boot, this series comes i=
n to the
> >> picture only in case
> >> of suspend and resume. can you share your platform details and kernel =
you are
> >> booting with.
> > Oddly, it seems to, because if I simply go back to v4, the system boots=
.  I'm
> > using a 7.0 kernel on the Thinkpad X13s (SC8280XP).  The sources are at
> > https://github.com/steev/linux/tree/lenovo-x13s-linux-7.0.y (with the v=
5
> > applied).  PCIE_QCOM is built-in to the kernel.  Not sure what other in=
formation
> > is needed.
> Hi Steev,
>
> I made mistake in re basing the code, can you try below and see if that f=
ixes
> your issue.
> I will send this in next patch series.
>
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1327,7 +1327,7 @@ static enum dw_pcie_ltssm qcom_pcie_get_ltssm(struc=
t
> dw_pcie *pci)
>         struct qcom_pcie *pcie =3D to_qcom_pcie(pci);
>         u32 val;
>
> -       if (pcie->cfg->ops->ltssm_enable)
> +       if (pcie->cfg->ops->get_ltssm)
>                 return pcie->cfg->ops->get_ltssm(pcie);
>
> - Krishna Chaitanya.
> >> - Krishna Chaitanya.
> >>> -- steev


Indeed, that fixes it, thank you!

-- steev

