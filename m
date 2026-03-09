Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBEEF4181F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 17:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjsgR+2CRjAh8JNtV5+Cb1v0JZ/Gymuic9XSyJ4Xs88=; b=CjK0ljWoz3b+5s0tZek3GVaTGj
	NxqfUZLTA9XFjKV0jpI75AI+Z7Brqx37y45VXkR36+HSd/lncZ+fMZoJfi/q07dhZzfFKCAO+WRiq
	uh+3Z79ZlVojaFShYRvxMfhThRHi6+1cRFQPGt63DdRZMPV3JOqkUZ5r2OWw0alhK2bm3KyUiq4z0
	osNERJLy+GrPtfiY0WkOY4eid/TrzyvwG9+W4K6UHpkFbse0QqBIAq32IUB7G0Vf9Ol/vm98ElyLW
	Xx7vBDQv+3Swk+7+JR0qnXEkqcQRehIp+OKjEQrnq/dC7jX8EPAp1A3OY4BUPhE2KM4ydVuOg50C1
	wt1Nd0JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzeBm-00000007o5t-0EGx;
	Mon, 09 Mar 2026 17:14:42 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzeBj-00000007o4o-0JkO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 17:14:40 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c06cb8004e8so4621667a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 10:14:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773076478; cv=none;
        d=google.com; s=arc-20240605;
        b=AoQmTcRVdwltOKo6ClgH3T79GfILzb4vI8n3pzZqgqvq50RMiFLpfwKmAfF8bpx1t6
         VavmNVBvpev2Cr5OMBoONVPWobxcC8G7R782IO5CbHHXBpDXE/yPzinX0ZUW2+ID+qoF
         s1r2Z7B8CxfQ6Z6pGpIMJLFJ8eg6+MXRnd3L2RwSlb87x2Hyxa89Mnz5fwUQo1EEDrG7
         4xNuRf2BPBy7i4RsKAnKYKLntJaw0k8zl82xIxUKDTbwX+FL16OMemhjZasH9325K92S
         CfRREEsDEBLOWHZM/+exQynvGS5H6+vjA7zDWP2n6KvMeuuVArl7VZPgN/1wO/wle6lO
         Y4IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tjsgR+2CRjAh8JNtV5+Cb1v0JZ/Gymuic9XSyJ4Xs88=;
        fh=xStoGRhe0GsZnRwu7NLmV7ls3hNqjbqi/EYTD45IRRw=;
        b=PO4OcHJBShShUfFp8+H3pwkKXSy3OamehpMeg7JtbWRh2eFJ+Qz3GzMlWfb/LcMF62
         9cCBZWtZyjw4jjBWOFh18BkENg4OpKp5zhFmDo3jCuC1JuKwsOlXiKwSmSTPhNLs1vEh
         VLArDqqvjY4abo/jKtZ8mCqH0wMiUidiGb3Yy+wgZu/3O1iYZwqJLemWAe4zEfupcnXP
         195/k7B6lgqPsSujyhT6y37fdnsUHYSk+LoCN1G2k88NUCSlPv3nEohd1y7+ltEBAmqd
         4zGyjrpxEq8AJCi1jFEBrBj/hjmoKG79iHAg/4c2joK174OTedyHCUHNjVR9K9jd9/HC
         qwug==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773076478; x=1773681278; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjsgR+2CRjAh8JNtV5+Cb1v0JZ/Gymuic9XSyJ4Xs88=;
        b=RjvHeWNRyV5a+LnPeTCQfmzcePtVGxe6vhHKlEhRoqnYTyYEMs7kZsJDejrU4JOOQM
         HimNhodLsGiKGDwrhI32TWxH7y5QZ388svm8RxgwKOwkQRigrbzUoRqxchLaRSCC0lx0
         VU+y/0jONCvxi4zPmEyEv7zr0Mh3KJ9aAo+3wi12gm+o08hV+Gbwlh/l/E9vMp6LTbuY
         i92JnSzoZciVdiuzl7uAsyhf6usrmgnKtfV6pl5zdaPD63RqcTIkhiV/K+EFCtPqzvrd
         qOtRegsWP6+NyKipnQqKtrBSoNljdZpnn/Awa5AKaz/OAa0Lxih2MVqlfCO0orvGxlWT
         dsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773076478; x=1773681278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tjsgR+2CRjAh8JNtV5+Cb1v0JZ/Gymuic9XSyJ4Xs88=;
        b=rML723Sc7npz22/abcVDlJqgB0QwNpWsbyP4tEbD4OZEKScg5PnFfoymSXue1gpeY5
         wZW6fAB43cupo+M/A2BfRbpY90C5rEj+IGRR/ESZlI9hmEvkWvoyK7FzgRKemNtHxV05
         CghXNjSbfUs4R8QKg6DefSodIKu3Jmdu+4sVZTrrWrRrFb43pK6kHnAU+NnomuIpaRGa
         8UcjBNmJnSHRkzjxGrggmrAe80SwQj3LhiYWM8eEoW51blbwkKiiL2/wYsOZRNcEvd8G
         lC6pFJDAUodSQlxgIN9xzF2NPIHhvvsa5lm8z6PPxEp28XvXvu8bAyHX0L5dWcVdd77s
         79IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIKclKftAlrF4xp7pNDdky2kCMjS4Fzfs8s5CNGSepkxMWVIf1ZhafRU1evkpWAn+OmkirLbzJjdfwgPyXNxKk@lists.infradead.org
X-Gm-Message-State: AOJu0YyifoUCKcu7YuNCAHC3FlkKBGN1BShNvsMxlM/9G9MIxSeqfu1L
	wxldGcmlJO6uKUKlPJU7sH4Rt0wzj4t/RbXBHirBLu1QRblyvbqVWn+dFdqOGLAzMiAm63Tf+mU
	pLuFJ90rhv2BNExWbTGyo8ANm/xjib84=
X-Gm-Gg: ATEYQzzWu8Wb3ciyUd0Ec8GYCj7kM9jnpnLX+fqYit/oyww+NTla2YOv02doPbMTGQK
	fkcTx3K4d3I1LLyTJkbJUrfZMorwXG/vYBnwN4R9a/FSu4iWHm7vw3pwbpmTX30xOas8Vy/knff
	janS2A2xeKTpzoL0nMRyj+szJyhqwGyrhFk4PVnGzbpKwFn96d/us81XxTOP30tXZbUgCClxL3U
	SSeLaEqsVGKfNVz2nnuF2P4aCVNK8DcuVzo81fU4myJZf8fZ5xs0ijatUfOV26hxCGGjbsV4LyL
	GTqfS6Yr
X-Received: by 2002:a17:903:3b8b:b0:29f:301a:f6cf with SMTP id
 d9443c01a7336-2ae8243435emr108577225ad.35.1773076476823; Mon, 09 Mar 2026
 10:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260305-sfc-v1-1-6fbf6df0e899@gmail.com> <52755ab9-7387-4f4b-95d4-2bfdeedc3e5f@sirena.org.uk>
In-Reply-To: <52755ab9-7387-4f4b-95d4-2bfdeedc3e5f@sirena.org.uk>
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 10 Mar 2026 01:14:25 +0800
X-Gm-Features: AaiRm53J4G3yrXI8HJ6leV9ZFby5HBAwXjcN0JvsfYQSy0YFE0AUPPrn31xO1q8
Message-ID: <CAN4SLj2NjGSFqG4hatQd0CL=RgkKJXeQJZuYPRM58-vp4GqBEA@mail.gmail.com>
Subject: Re: [PATCH] spi: rockchip-sfc: Remove redundant spi_unregister_controller()
 call
To: Mark Brown <broonie@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Jon Lin <jon.lin@rock-chips.com>, linux-spi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_101439_106885_5279A6A0 
X-CRM114-Status: GOOD (  18.21  )
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

On Mon, Mar 9, 2026 at 8:29=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Thu, Mar 05, 2026 at 11:38:21PM +0800, Felix Gu wrote:
>
> > The driver uses devm_spi_register_controller() for registration, which
> > automatically unregisters the controller via devm cleanup when the
> > device is removed.
>
> > The manual call to spi_unregister_controller() in the remove() callback
> > is therefore redundant and should be removed.
>
> Not just redundant, it'll be a double free.
>
> > -     spi_unregister_controller(host);
> >       dma_unmap_single(&pdev->dev, sfc->dma_buffer, sfc->max_iosize,
> >                        DMA_BIDIRECTIONAL);
> >       free_pages((unsigned long)sfc->buffer, get_order(sfc->max_iosize)=
);
>
> This does mean that if the device is being force unregistered with
> children still present those children might still be submitting SPI
> requests while the DMA buffer is unmapped, but in the normal course of
> affairs it's more likely that the devices will be unregistered before
> the controller.  It would be best to either roll back the use of devm or
> add a devm based unmap of the buffer here, the current remove function
> has correct ordering.

Hi Mark,
Thanks for the review, I will fix it in V2.

Best regards,
Felix

