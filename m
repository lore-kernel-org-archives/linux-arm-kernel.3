Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47B6C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 18:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGxAfr1RErIaTjlH3ywSl69/Jh18iaYDydnvNAEir6k=; b=WxY6kWNg59mPd2qfKlpN6stqSm
	cgJNKJjnnWKVMm/9w223yhyOz9TLyaW7+DMx5if2xxcCbu2ZzasTBzmtPysNHLliEIeAijnBq8582
	FKq8VThgoq7qSWrC+1DOsUScn0PigEA7EPhvx7fBlVb0/ysACOKIfYkb2a1cX1On2csrHEqX8TNsZ
	Ol324vo2XEZvia1/Sm8HKza53CU/0KtGG9Frukl2PlJrsfWBvZw5JjZZUeygnsQ8Z5bJVd7hIaWD9
	fXn0QbI/npeoAVhzjKRqJM1QQmcIb+8QzxDpXy4aHnXAiXtn09fXYKVb9/YBwR0NfznoBo+q7bjHw
	QDi2yuiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tafYc-0000000AzvB-0eZz;
	Wed, 22 Jan 2025 18:34:30 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tafXK-0000000AzSo-1840
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 18:33:11 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2f42992f608so217568a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 10:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737570789; x=1738175589; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XGxAfr1RErIaTjlH3ywSl69/Jh18iaYDydnvNAEir6k=;
        b=UQ1k3hXvLlI2HLTh8Cs8CUPj9b2M6smllTMJ4+g967hUXK2hh5yPiQg4MaVLSse2Nu
         ZHBXKTgXS5ttsgqWyahiEOyAOQ2z8qfcW5U3o3EyljpZqaZ2w6jcdcQyzZ4xQSF2uuSA
         f90Gqa0o6+lgz6YPF/1kzdUOalkw8vYzngS2tWZYsykSMMTyKWquHTA+CTwzBF0Sb1Cb
         mBdcfim61QiUhBz+bhNcdjBpcZjlKt8Lvfv6J47/R2SkawQ91Mw6UUF0K6wwLstLzJmf
         D55d08ZqvH7KMY9Ax0SbRu1XfNuv8snDQzNA5BOTO87qr8GM6jIYfsnp3fFpMPQyWXwR
         A3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737570789; x=1738175589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGxAfr1RErIaTjlH3ywSl69/Jh18iaYDydnvNAEir6k=;
        b=mO63eN8XE94HtO1pZb94Kc8O2u1+P9fYrYjhei2HGp4rzWB2fkC0wkjhIl1fIyx370
         JmChQAnl7WK/mHF0GLPxIgVE6ixQD1+/Z0zNdiB8QOvShgNxmYKIVqndfTbGNAhFy8Bz
         CynmPVqP9dQlZS4ZSTyc+U0gJ+X7Wn8OzXKjnUH9P+DUzbxPx1weepEcsvjK3PaJvE+2
         q/RZINnGSbVOxUPndUgrzjDjEwlRxK4NywgWJWC+v2s8flGfHUrWkGV5nvgjhinGPqrz
         vr134Z9l2eBeRt5rXSE/sc5PVA0jRVYZEm5FXLiBlwsQe8v4CmoktXJ9sPR1hhg4NRvp
         w/lw==
X-Forwarded-Encrypted: i=1; AJvYcCX1sTLMBYPuC55rF7yvFCxMolxJv4UEUD8oHTz7Zr+L9zAYEARlgXmlSVBsTfGoTz45x+HbmJIR6z7t53N5NBnr@lists.infradead.org
X-Gm-Message-State: AOJu0YyUfHcl2nrgCMXaL35sqTH2xnG/0/2onwZFGncIosZetI+mPcai
	ABbmAox+h2/a36mx1C05EGh173sc7a6m9iu1CgueEiLQzEXWaHxf
X-Gm-Gg: ASbGnctsw/q9So3gns5utkEM85Wu0tCcJ9bWcf37HJQYg+3KAxw93CIcYet0OIgibaE
	1u5AkDi11N0oGFXR6aCwe4F24fv32VJPYZ2r4Nh32Vjrq47MPT5Uh8sRktiYihx5Zh1sAPZg02X
	IUq25ujGE+kqkB/+O9jwZPiIAxGK9jDuvnfGLYOylocmYmshSpo6kx3Za89i1QCs//deS862jL/
	bAhNveaIulW24KWyv5TSpzIKNsMzGuUlPlcVABs3k0KQBjvN70yVEiNNahKDDO1J/q1eQ==
X-Google-Smtp-Source: AGHT+IH7KCx6ZerR7Y/ysqk3oOOXRwJAIgtVJJs/HwWggKSL+QPKg6M5ZcOSafU6EcNPqL9uv2Ogdg==
X-Received: by 2002:a17:90b:51ca:b0:2ee:5bc9:75c7 with SMTP id 98e67ed59e1d1-2f782c4bdc3mr28221471a91.5.1737570789085;
        Wed, 22 Jan 2025 10:33:09 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:824e:c27f:8742:e4e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7e6aaca04sm2015449a91.27.2025.01.22.10.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 10:33:08 -0800 (PST)
Date: Wed, 22 Jan 2025 10:33:05 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH v5 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
Message-ID: <Z5E54dQQl9LE2znf@google.com>
References: <20250118-z2-v5-0-6d38b2582169@gmail.com>
 <20250118-z2-v5-2-6d38b2582169@gmail.com>
 <Z5CNx9natNYmJ5il@google.com>
 <CAMT+MTRKpgHBVVHoeWGmOqpF9vzZV3CTUdg4d0oOnutubeTFaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMT+MTRKpgHBVVHoeWGmOqpF9vzZV3CTUdg4d0oOnutubeTFaQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_103310_304181_AAEDF635 
X-CRM114-Status: GOOD (  18.07  )
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

On Wed, Jan 22, 2025 at 06:40:50PM +0100, Sasha Finkelstein wrote:
> On Wed, 22 Jan 2025 at 07:18, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > > +     z2->input_dev->phys = "apple_z2";
> >
> > Phys is supposed to be unique, however my understanding there could be 2
> > devices in the system?
> 
> All existing devices have at most one z2 device, and while i do not
> have visibility
> into future apple product decisions, judging by the current stack, it seems
> unlikely for them to make one that needs two of them.
> 
> > -static int apple_z2_build_cal_blob(struct apple_z2 *z2, u32 address, size_t cal_size, char *data)
> > +/* Build calibration blob, caller is responsible for freeing the blob data. */
> 
> A comment on a previous version of this patch requested to not have functions
> that require the caller to free the return value
> https://lore.kernel.org/all/ZAlM2DzMmwzWIZEF@nixie71/

You have to pick your poison. Either the caller has to inspect the
property to figure out the size of the allocation, handle errors, and
provide diagnostic, and then have apple_z2_build_cal_blob() re-parse the
property and fill the provided buffer, or you can hide it all in
apple_z2_build_cal_blob() and task the caller with freeing the blob when
they're done with it. Similar to request_firmware() and put_firmware().

I think the latter works better in this particular case.

Thanks.

-- 
Dmitry

