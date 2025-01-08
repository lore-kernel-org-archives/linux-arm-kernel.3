Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F6CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zr5OAgOEPPZiSNcmjwmBPGqoc39w41Bm0SLcztepzJA=; b=uJ73YvcEY5bdMqTK8zbjUqe6PE
	LkGrNsOGImbA5LqdjjTCgXk7wA4y3Z/9SwZcN3xmsInL6BXmn7giX/HAzOPO10bpUFTj2eF+un1ED
	KBGZpuaIyWZX6ln2v3MBfJFr/Ma+0k8Es+AVGgG7031H3F9EFnEPUE6GLZb9AM15Qb0hFTAF504nR
	4xGX5jXaqGhX7IUdb4ywzimtX1BrpnA4BGR4sgS/yxFndlpBcqwBw7I9pyM44pmHm5/N3G4jhqfck
	CJns3TAZGUb6Przesk8YYGRg/ANsjGeD+JvDmDz8muYTDrApUCdqfmpuubtpwqja7SOQ3S5Ra6nH7
	llj2pr2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVwj-00000008Zpx-0iwe;
	Wed, 08 Jan 2025 13:18:05 +0000
Received: from mail-vk1-f181.google.com ([209.85.221.181])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVbX-00000008W6G-3VKe;
	Wed, 08 Jan 2025 12:56:12 +0000
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-518957b0533so5395421e0c.1;
        Wed, 08 Jan 2025 04:56:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736340970; x=1736945770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zr5OAgOEPPZiSNcmjwmBPGqoc39w41Bm0SLcztepzJA=;
        b=lL0mRxoOS6TqgnlPjNmTT7CdY4qwaC/YyWj55RpsoAZi5ds4S/ZUafkN6lfYgyN4gj
         RsZKi7LkWi/BNpzaGDw3KJtYWps9MLRhxQbMpRN5nHsgurtFW+j+NsKGcpTYITBHlhy6
         vKHbIMwheqFTwQ76wL+8xmWhYYdbG1gUoDytu+5YcQHiFAHs25GsDsmh/znSIiFY41OI
         88CxSpVDDciCRQHkTmk3muTcjZ1psLGrqHcrG0rM/C0spS5lxZV6xNfc3Iqv36D1kC+E
         s746tpWff7AMZeXHYRbM+SwlcZVHuuEMOHewDxOAp8OyNmgyQ7QHGmfH+572VHH4rY5I
         qbFA==
X-Forwarded-Encrypted: i=1; AJvYcCVwxDQbVBxnjQjZNlML6FSwXtG24iTVh5Y7KnKbdoW8DKnD0gwWZyQ+qB8KVEasRfSz3Yn8K376z/wI9uJW8B8=@lists.infradead.org, AJvYcCWrKJHfxIkCv7W9xLD1XjeaSr5dJApwdTEmIvbYUvsSLxJCq9RvHFU0q3kfYTQJF/nrwQzau3WxjhsqybLohj5n@lists.infradead.org
X-Gm-Message-State: AOJu0YzWDDrRSn+IsJ6S4pWxQaCn6COWcYyaK+yJkjFJAT68OT3Hvu5x
	CvlJtgoQn/x2sT0he3Eam5W3i7S83gmLumjThOMI7rE34rBWr+QRnsLjDwsg
X-Gm-Gg: ASbGncurdpW1WLgPt2NsNJRFHeRdsaISO7gkTPLyBUY6kTXiHc/a8Ui0jUkHLGFPfIl
	bYWzmKXd6EjSAsCh1DZNLrkzFbfphK5u/gsQp0tIRDSBfAFfnzwBimPA6uL1EE1XR2TJSYbk8yn
	0OhsWc6YMJL0T/tnOYlMUBERi559m24TbOwW576TEi15eoR+ikVKnFxUFvVEOKGKDst8ngFy8DT
	ij9mZ22xOIXVO8xeOCT2JbfuEe8asdUE8nti/Q7BaRNIQQnXBs+5fPSWjANvgO+HSK0zokfSWMM
	xQCTFIwPOkfH3Tx9rQE=
X-Google-Smtp-Source: AGHT+IFjUJ3usXejvfODTfTtpb4CP//mFkVoqATMearg/zZZRVuYiSkAYG7GE6Tv0ItRhA1IJ2IFcA==
X-Received: by 2002:a05:6122:438b:b0:51b:a11f:cbdb with SMTP id 71dfb90a1353d-51c6c39cbaamr1629446e0c.4.1736340969765;
        Wed, 08 Jan 2025 04:56:09 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ac6d9e0sm8546321241.18.2025.01.08.04.56.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 04:56:09 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4b11a110e4eso4718103137.1;
        Wed, 08 Jan 2025 04:56:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8+Gazm84W3CjSKjnMUyeQfZvhYOV+G0GAe40rulUeBtmd7t6+IefDnMDKqZg05S6NE+Aur7RJjb4QQbdbR4tN@lists.infradead.org, AJvYcCUlD9iQkTEqTh+CS4niEydqz02Me54OTmXWK/FuTqmPa7YvXruwChy2lOKRQAHgyvflC4vChv3YxPuEZQZvHPw=@lists.infradead.org
X-Received: by 2002:a05:6102:5123:b0:4b2:ad82:1318 with SMTP id
 ada2fe7eead31-4b3d0fde32amr1732752137.26.1736340968977; Wed, 08 Jan 2025
 04:56:08 -0800 (PST)
MIME-Version: 1.0
References: <20250107131456.247610-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250107131456.247610-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jan 2025 13:55:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWjRu8AnCei67oBX-eR6RqD6m11SbH6mRmpjD2sfTtFzA@mail.gmail.com>
X-Gm-Features: AbW1kvZ52DN__RR4vjE2dLHCl44CSoj_lJNsAln_Gci5kCuBVU2sP3BZtvvNBVQ
Message-ID: <CAMuHMdWjRu8AnCei67oBX-eR6RqD6m11SbH6mRmpjD2sfTtFzA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Correct indentation and style in DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	iommu@lists.linux.dev, linux-leds@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_045611_873381_AD1844AE 
X-CRM114-Status: GOOD (  16.09  )
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

On Tue, Jan 7, 2025 at 2:15=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
>
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

>  .../devicetree/bindings/mmc/renesas,sdhi.yaml |  78 +++----
>  .../bindings/rtc/renesas,rzn1-rtc.yaml        |  22 +-

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

