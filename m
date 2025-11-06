Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2928ACCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 07:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7QbmE1T84ff08D3+wx9jlBrqSs8DUW5Q3gCIAzKNPQ=; b=W5bQu/HmxpXDKSWpjPEPNEi4oq
	n+Fq54LxOliC4rRD009/1zNRK4aPNK7qWtBhVyC2TDMJ/Jqmzzm1kN6fxq7w7Hd/VaErpTtlNnkAR
	+XMslm2JFDWM0ox++5kTSisMoAUqYQyjlZl29ccEBLsl2ztzOEQBhhpYjv67sOhhC1sZEUrzIq2Qd
	ujm6dM3eTM8OiIcSxzHvKu9IauwOfpuGcYJXR1qxHA9FSfhO69LWRODdiDNH7qpMgTkDtW/uv7HDA
	uUcl1Dk1ufXGMLoZrvLNzJNm/STtlVFbjuRuc3rR1eAnOnBhITSimeO2hLRyC+9EVRG7CoqlUjCL8
	Z6Fn6ZwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGumC-0000000F1db-2xB4;
	Thu, 06 Nov 2025 07:51:24 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGumA-0000000F1cq-1Pwl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 07:51:23 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-640e9a53ff6so1240248a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 23:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762415480; x=1763020280; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v7QbmE1T84ff08D3+wx9jlBrqSs8DUW5Q3gCIAzKNPQ=;
        b=Yzq3KjzsuaA0CK/GqVmiDyZ/V7cruqgyFHdp/a6ywL4IcRTE55xWG9V1FV4kpZMoIs
         9ZiCZ4Ldrsd5z3yqNcr+o96xL4WJsxDCVdU88SN/xGta4dY6yRzvVlUnTrP5c7h3Uur8
         dO+45+5tzS8blgF1nSLUsjq4KT1juLyoxWSBtrnrhgMOomCSxnkK6wzUvLZvjkm+eK7f
         5p3hw+L220Gevfp7KMZtlYx2HY95sLXEH5FTfFviFqvve0Pohi30K86osVoGjMOR24vq
         ZYE0KG+J0Ow8+W+qv2TFLyP1mNEvpemvJc7oKwGct8a2WYG0SgOYqebN3mAhidYDoiEN
         y7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762415480; x=1763020280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v7QbmE1T84ff08D3+wx9jlBrqSs8DUW5Q3gCIAzKNPQ=;
        b=nXNqXsgowtO5yvoAo+DL8d330mDqWOQmxZgMmJ2AjF+wq2du55fvcIMFLkaSQVMDFs
         Y7Md7/DlZQQqz0FiWylcpNjmS2naFJTru9SEbtpqW+5rZpgQoRZLNScb4KWfpoB5Mdb4
         v/aPWHWARhjoxbGj0bgFgKkX+mYfZ2uYZzrGUbM8CTrvi+u9+HMDjvlpIvXZ0DQpZkGk
         lQiFz3oocBIiSOnUwCcrWH+DLMYYmD6LARm5Fa46VRqjwrtZVhKoq+lnl9mdaNvdhXNg
         H3vZcMX3gUJxLAa7Vo6ykcAZ4XaivfUFO7IpzhMMCvuDpa92AQuY3kR9/d1Q2uj5R/qp
         IEKg==
X-Forwarded-Encrypted: i=1; AJvYcCUfb6EbBgI4z83EiTA/KuYnY77m1wLWVGt2GM7akZZ7eXb6tigBNvk0rKabtSi+OpBAvuYNnDt0Pn97DS6xR006@lists.infradead.org
X-Gm-Message-State: AOJu0Yx61mnoYbf3xKCGDUMqoPC+hSkrjsxneyX/Ozp30c+4RvhLGBn2
	+/WVKHdEY/VHv1E5Z3KeIZ4ZWf1CPSUIKzGZb3cUeUxrLvx4YI8Tznm0EMYQh9Kmd2vjV8iug+I
	Ud90LhYcQYNXTFnfkgCa253SCoVnknQ5LIZQmAQsE7w==
X-Gm-Gg: ASbGncvKgsc6Mq1sfNFDdTsj00rNG+DhdMSCI3oj+DfbIRZJNVE5DwhlCWClaXYYn6P
	zLgS9S60wrhuhu1B2h1xz+18DstmYcbAxnoUSibRttuwsAfu2ycv3agcx70JBUk9/T9rMADHAZp
	GPzE0HmT9bpkwt0p0y5YMi99GyBr031oPIEpcfGgUMnf9pNZ1TA2hM0gBj/ATnffSeAVLb+hEB/
	IA6xmA6n6Wn3zYJecESTOoMhf06kMM0HMi/0zUQg12gcxTLXU+Qf8WNvrL32A==
X-Google-Smtp-Source: AGHT+IH5mMQNAbO3dsRPBZZKprrZKG8gWiaT6H027FsLcjDm/NMQYqk1ZtvdWqQy6Uf2hPguHqWdFrxhl0EoZUCxvTg=
X-Received: by 2002:a05:6402:20d6:10b0:640:9db5:ba2f with SMTP id
 4fb4d7f45d1cf-64105b8ef06mr4773837a12.30.1762415480479; Wed, 05 Nov 2025
 23:51:20 -0800 (PST)
MIME-Version: 1.0
References: <20251022174309.1180931-2-vincent.guittot@linaro.org> <20251106000053.GA1932421@bhelgaas>
In-Reply-To: <20251106000053.GA1932421@bhelgaas>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 6 Nov 2025 08:51:08 +0100
X-Gm-Features: AWmQ_bki5HMad9R_EvGRCt6ZsgIelgkfzutK5gpeBF-eV1fPQRjJw2903OorBCc
Message-ID: <CAKfTPtBWfuHP2h+7ExJ_mm6zt_DviQTa5KEUwECCzxsLk5=pBg@mail.gmail.com>
Subject: Re: [PATCH 1/4 v3] dt-bindings: PCI: s32g: Add NXP PCIe controller
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, 
	s32@nxp.com, bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, 
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com, 
	bogdan.hamciuc@nxp.com, Frank.li@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	cassel@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_235122_377323_99B8A137 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
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

On Thu, 6 Nov 2025 at 01:00, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Wed, Oct 22, 2025 at 07:43:06PM +0200, Vincent Guittot wrote:
> > Describe the PCIe host controller available on the S32G platforms.
>
> > +            reg = <0x00 0x40400000 0x0 0x00001000>,   /* dbi registers */
> > +                  <0x00 0x40420000 0x0 0x00001000>,   /* dbi2 registers */
> > +                  <0x00 0x40460000 0x0 0x00001000>,   /* atu registers */
> > +                  <0x00 0x40470000 0x0 0x00001000>,   /* dma registers */
> > +                  <0x00 0x40481000 0x0 0x000000f8>,   /* ctrl registers */
> > +                  <0x5f 0xffffe000 0x0 0x00002000>;  /* config space */
>
> Fix comment alignment.

okay

