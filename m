Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8AED358EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 09:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lU8GWlv78rS676V94HHH4zs90Fwj2GtCQjzXirgDFE=; b=y/Y4/kLVIaojNnJ0TgfwLirB/P
	iinumtGEF9yQDNN4k20ga87fWvh4qwEgWXCe+Dmn3Par8z/Kqq+sKOp1goAfmi8/Sy83r4WnGVYNL
	vhEVbu0r+Yq8ECQ5Nn4RyaAhmUAdj0oQFGW3j+U85Av0QADJ3AXLbxCtGF8Lx74P1IEJBOUYPaYNX
	5tOkPWw267oXI9MIM7ERYWp1Fk8Z6v85koU1MlGEjf+5Vcg/kPpKJH7vrShJxHcqQC3+VqP6+JGoN
	TOowia3/pJp6v0Cq4Y+L+7eM3act+Vm/jT/o8Y1g+KfhCoFIQuLdv0jqhvRkp5wve+FxPzg3z0eGK
	IOeVNcBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOTH-0000000HWdh-0GtJ;
	Thu, 29 Jan 2026 09:37:51 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOTE-0000000HWdM-05aw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 09:37:49 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c634c20be90so289208a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 01:37:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769679467; cv=none;
        d=google.com; s=arc-20240605;
        b=Rum6d5hnLZjVKYyy0h/LVCOuVf/qFWt75O/IN/qx74nNA6wAUqhgaj4HbQNZbxvSpu
         FOWqvmfB186qLE2T557V4MYYFdJD8hCcv+Xhm06NMCwuh0uFvqwchiyd1ApUTNKx6wrg
         8MpqzMKvUD+8MjCq4u997U4I5n7jSerjptWaBlVGQrbVn1tGxc8Axf3GLd/Io/aihZNu
         41/+bs8AJGVniIMLxBtNSVpDE9rTFVgTo90GnmGNNAf9Crezi48548ZvoBLGEzG4aeTK
         dNMd+TBD0LgqxFB5h3zhp0Agq8hJR1mxLz/C62+po0MXddvP/1kM42UT296sQ766OBts
         LE8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4lU8GWlv78rS676V94HHH4zs90Fwj2GtCQjzXirgDFE=;
        fh=J4yAfOUiPa2GZWB6o8/qnJSSWfkCp4McKDVSJ8CADhI=;
        b=exCR0IzmrI6AVj1hmD9WsnnZAGRFcZjawktN4XgEyNBipnsKFW4S/hCkGeYtegZhL3
         ouVpieSPtda4TPUNsbqtENrxccm3cMdwqAf+Tk//1Ay7WeCrsyV9imhF4f7veLTsLp36
         dai7f14s56FYotyq//ghwu35GT29LjgH8iOY8Zcv0NgUdFStTdDavHrrqR6NJPn4Nlcb
         vbfO75mAkxhcB6ClAC0MrkvAu9BhHQ7aUhvekZqldTlXAchsoBcia2VcV4+bDSesYJOQ
         /UEIf1TvkCA10Zt25ZU8l9Mgmw1/I5kM4PYXFlu67VF/a0KsqNE8795QJOY4nnFeNwGp
         1bMg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769679467; x=1770284267; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lU8GWlv78rS676V94HHH4zs90Fwj2GtCQjzXirgDFE=;
        b=fprYBnsfaorOoJpfjH7z5EfKg6TvKYhc70131rAoXt/3ZB+SRj9cxZgDZdsQKXAFJM
         ATAxANteemzuwU56bWCnu0wB5cBttog4Lkk0veqxR7qPf8kS/62MAbDOLHBH3BU1s3Jy
         YKvxXTKHfHK8EP9bPatNZIczTXniaKZqWKFFAQ2JynlXcBlE0V/l7yjbYfrm8z3hdfQE
         D496UsPulBGhED7D+6WkPFtqngdv+DAmIkN3qIk+eAmU6ia7RFSjl1ugZv3/WN2IjYtf
         cRH7KLRs9/ZxgdmwfT7X99wHmVkVaunDgc4gWTtCLrogeJE7I+x3VmPlHVAUEIvMEEyK
         oA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769679467; x=1770284267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4lU8GWlv78rS676V94HHH4zs90Fwj2GtCQjzXirgDFE=;
        b=Nb/RKKjgV9Knhz/Ksndj3X0SlRXA1N2urxDirHhiwE2GNdKRacrOFIjTjG5P+fPwAP
         cYdAVbZhRBmX5DdOCZvtVkOSoTYfPc+VjbRchJHltY7SFjG5P+smAgNfDnkzSxCEuX2y
         ba4OqrwHesdidy6tO42IVuJ9dDyZNq6ytRQbR3iyqFVqPbh4uCe8+X6mfjtrci6xUw4E
         P2QH/D1kTkz7UnznDIH2gMrEe+tJdiQivcB24XZAIvGSs8pIvDUMfwm6SnswP+NX6jPK
         AhcF3F+KfjtgoGRHDb0OqxPcJX0mFRS4Xd1Fxx7wAgaxNhJrSaVNDKDXuRWVZqOtbLxt
         HVAg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ64T5NgLyjelPmtm8Y92V1mrYD8meOPf8I4FQpsFM7Mq7P7mYCk5+l0dAde+Ce1B6mIKk1ByPsNFumR3Mx2CU@lists.infradead.org
X-Gm-Message-State: AOJu0YwRkUxrvGTPGbXkXaPhQAVNEYOvDaSnd2UdmCUN2wfwyawKBLsQ
	IIVcYgqz5EOMYH2C9aH5fhVHh01jb3UjPCO+/slKQMt4PiCYP/CiRZKBD4d72K2lHB9rvR1AlZE
	mTSjgwY4i27Vr58lBi1p9yw8kgF1XUXY=
X-Gm-Gg: AZuq6aIJc+9ZHJofdOun1b3/6ulO7v1ZsNZiApEOeQMwt6IPi3i/T/aAzWY3ggoI98H
	JI9ZtZlblk/8QVCubFrGF7XG1s9CwdwphawQivy8tZ00RpxEPPKawKHGohes0B6lmd36h2N3U+a
	RN/8FUAzgj7dL+eAFrycs29FXLWkqXp2q/EPbO3v+ZENEmX1xL5cGgI0HE2MBj4RJiov2ErkIFR
	OkAyljrdItAKMOSUPqsQSgy1ZdVShpFf3lc2uucRd50gyNkpUSGySd3SfwAvwpQLztlUe8=
X-Received: by 2002:a17:90b:1f8b:b0:352:c9c9:75b8 with SMTP id
 98e67ed59e1d1-353feda27ddmr6746159a91.36.1769679466914; Thu, 29 Jan 2026
 01:37:46 -0800 (PST)
MIME-Version: 1.0
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
 <20260128071853.2602784-4-shengjiu.wang@nxp.com> <7e34b098-bdab-448e-a34a-02bdc643f700@oss.nxp.com>
In-Reply-To: <7e34b098-bdab-448e-a34a-02bdc643f700@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 29 Jan 2026 17:37:35 +0800
X-Gm-Features: AZwV_QjhsaT3WGqHFWhY63rZWE_xfRO_5posf7-8hnrbY9543Mu3MY60Z30GXKk
Message-ID: <CAA+D8APbzGCSHOwGyBZjf1TYqo2K0s0dvoLjHS+FsT_RLGrb2w@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: fsl_asrc_dma: allocate memory from dma device
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_013748_085859_933A984E 
X-CRM114-Status: GOOD (  18.79  )
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

On Thu, Jan 29, 2026 at 5:22=E2=80=AFPM Daniel Baluta <daniel.baluta@oss.nx=
p.com> wrote:
>
> On 1/28/26 09:18, Shengjiu Wang wrote:
> > As the dma device may support dma-coherent property on the i.MX952,
> > allocate memory from dma device to make asrc driver to be compatible wi=
th
> > such a case.
>
>
> This commit message refers to imx952 but the change in the code apply to =
all supported platforms
>
> So in not really clear what is the intention of it.

The dma-coherent property is used to indicate a device is capable of
coherent DMA operations.
Which is applied to the EDMA device on i.MX952,  in order to support
such EDMA device,
the memory is need to allocated from DMA device,

The code change is compatible for non dma-coherent and dma-coherent dma dev=
ices.

>
> Also, it is not clear why do you allocate a pair only to free it at the e=
nd of the function.

As the comment in the code says,  it is to get the dma device handler
for memory allocation
. After that, it is freed.

best regards
Shengjiu wang
>
>

