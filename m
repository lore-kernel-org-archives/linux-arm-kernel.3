Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DD1D6D22A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 14:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ltmK9xpXSaIRz3pvhRTJSdN7AZMXyRyfcfKgFOhGZkg=; b=JQwr4TX4xpDdr8K1oJjZfpkTsC
	FRvWw81e/SOHBLur9nsmjLCxW5UmzWcCn9OJcfCEbl5D3QEEj5+DBXVz8iOgty6LhHtBoeCmzBi8y
	ap9z2TvdYJllTrMKixWJz5zbZz5QJXpeEJY/6HNjlp6HJtazK6xwSzkPfgzAblZi8uXOxEotaj9SC
	XmbxWyRghsDqi2oNdoPMcRwEwTavM5lajAkIN3IMWk1ItDWBFAGqrfHs9nEdo0KBd5k7tZbbOdfxe
	BZihmThSetHuAsuxkbcY9paVbfkMY7ujVtV36lIxB/bfrBK0fIpClCtMhtpFnP0063+jLDZaT9oMF
	4w+jRLlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWEdh-00000008aUQ-2NSZ;
	Thu, 18 Dec 2025 14:05:57 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWEdd-00000008aTP-3bZk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 14:05:55 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4f1899960f0so7074761cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 06:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766066752; x=1766671552; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltmK9xpXSaIRz3pvhRTJSdN7AZMXyRyfcfKgFOhGZkg=;
        b=Y6PvpVpo978FQmBDQkKYR8dcplI5UboYJSpFXy2OBk0Dalf9Vb7DPpowHEoilBJpnp
         ivhZ+7nkDGoNmZZpkKvmo2gqLErtsEoQT3Q2e8l1J//5eKXlz04b6axOlMiwAanCInPX
         4xxezqpjAwnIX/4Fwms3aSGW9Y0E9ilxHM3TDStdXOtq8tglYxXKKz0ao70zelkulBxv
         pIEjgKBskJdPst/ks3syARN8/v0n7BxL2pGlPyqBWbkntmxsZ6oOeyiFdQ0ebCx80StS
         vUVo0qtPz7D35a4cBels3DzJqTLWZNkazSr2CzDOkT0zDh7L3/QvNKK2b0aGyZizuBY1
         i/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766066752; x=1766671552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ltmK9xpXSaIRz3pvhRTJSdN7AZMXyRyfcfKgFOhGZkg=;
        b=HuxRpuYViedHykur01X7zl7+UmEnvaUxcHBkzM+R5w2Tzvtl+vHOtmgXRTZDCjBi1+
         wTYWaRZ0MdKUXIF43snEPSnJJgfeDTj6uOLeNHqXl6S+bJ5JuJZVuWws6rBHL6rr7WM4
         oFPdMsH/l9jZEkLzgGTdvblWR/K/rUgLoV5ycQiUD3Nj1PVuh+GN9RzOWz08WnRdJY6N
         RF+DMcSKRrhylwill/eDcqefEh8r5XjrLA78zpYgrkAeZNKSrDLi6xhCmoFy9tPU9bdI
         m5H5r+lszlSeRUQaeOe+cfhAgV9EkvkvAroa1kOaD12ka6qLk4FonVLVJ7wFHBvzUj4E
         miuw==
X-Forwarded-Encrypted: i=1; AJvYcCUvorzu8zdsfSu15//TLXng+qA/X1KWQPMfGdyxW1yAe4qnwfiamyUzsZtf7RSnxBAfaINL9L9IpMf9vT18mIf7@lists.infradead.org
X-Gm-Message-State: AOJu0YxFYtsVyNhSDYIbHPODL6vHc3aHIa96cJaGpBjbS1BPBRgvitw9
	e50/csc2xQYNsbInBtGf1ZNV/5kDPQIbVjPRmuGxYxh7yVBHumZjIHvNbbcH3E/JbqZcDNUXwGR
	DL1u59PaWPbDkOGt/H5C0seYlgGlNjuQ=
X-Gm-Gg: AY/fxX410xvZ+l1iCQAb8/rfINFxJJTe88VlJkOLGv/DoBwllmdup//Bic+qLSkPild
	Y+xMGD6McQQPRYA5yPlpfbXtaLTt+0hf55hKRVU7OViTbKNt05X/gh3u7PxLYlD9JuX5wnPDX+C
	JvOW30YT8mVGZxLNmTLFZl/nrX1dZlapLqXFqTIGlpxgQ8KulU3mFcQLFCI5Czb7rmrksPIjfbC
	INJtL1oHy+tyFKbBynGt86qer1U9aNxpBTDgM8Y6QsWTRrYA6xZrnA41AjUFgKztETY1IxtviLT
	r9O4A+BBGKmbVRoU+3AsrG30aaw=
X-Google-Smtp-Source: AGHT+IEHaG4sTwzH22c/ZckVsDWqoLw43GJHfQ60VdybglqFIrU9y64fZ28TTU627IQMx5MWOzC0Peqta/5kUNVhrBM=
X-Received: by 2002:a05:622a:24e:b0:4f3:565b:c52c with SMTP id
 d75a77b69052e-4f4a68998f7mr11781131cf.39.1766066751883; Thu, 18 Dec 2025
 06:05:51 -0800 (PST)
MIME-Version: 1.0
References: <20251201-nanopi-m5-ufs-v2-1-ece9c0ee17c4@gmail.com>
In-Reply-To: <20251201-nanopi-m5-ufs-v2-1-ece9c0ee17c4@gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 18 Dec 2025 18:05:39 +0400
X-Gm-Features: AQt7F2qXR-Ldb2gzOSYhMd9ao4yiFrifIbHOf6R3C3iyK7IWZa4Dc1eeoJgW3oo
Message-ID: <CABjd4Ywc-L0jvXwk253MDZwgN3srY6WQ5EhoKZ6wb+Hae376_A@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: enable UFS controller on
 FriendlyElec NanoPi M5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_060553_899191_A946A4DE 
X-CRM114-Status: GOOD (  12.07  )
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

Hi Heiko,

On Mon, Dec 1, 2025 at 3:35=E2=80=AFPM Alexey Charkov <alchark@gmail.com> w=
rote:
>
> The NanoPi M5 board supports pluggable UFS modules using the UFSHC
> inside its Rockchip RK3576 SoC.
>
> Enable the respective devicetree node and add its supply regulators.
>
> Link: https://wiki.friendlyelec.com/wiki/images/9/97/NanoPi_M5_LP5_2411_S=
CH.pdf
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
> Changes in v2:
> - Describe UFS supply regulators
> - Add link to schematic
> - Link to v1: https://lore.kernel.org/r/20251127-nanopi-m5-ufs-v1-1-0d28d=
157712c@gmail.com
> ---
>  arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts | 27 +++++++++++++++++=
++++++
>  1 file changed, 27 insertions(+)

Would you mind pulling this one, or do you have any reservations?
There hasn't been any discussion, but it looks like a pretty simple
change, runtime tested and schema-tested.

Best regards,
Alexey

